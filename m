Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B556014AFC2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 07:25:24 +0100 (CET)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwKJP-0001pC-0p
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 01:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iwKIK-0000h0-1s
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 01:24:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iwKIH-0003XC-VW
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 01:24:15 -0500
Received: from [192.146.154.1] (port=52897 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iwKIH-0003WW-Ol
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 01:24:13 -0500
Received: from localhost.localdomain.com (unknown [10.40.36.165])
 by mcp01.nutanix.com (Postfix) with ESMTP id 97CBD1007D19;
 Tue, 28 Jan 2020 06:24:12 +0000 (UTC)
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH v2 0/3] vhost-user: Lift Max Ram Slots Limitation
Date: Wed, 15 Jan 2020 21:57:03 -0500
Message-Id: <1579143426-18305-1-git-send-email-raphael.norwitz@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: raphael.s.norwitz@gmail.com, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In QEMU today, a VM with a vhost-user device can hot add memory a
maximum of 8 times. See these threads, among others:

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01046.html
    https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01236.html

[2] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg04656.html

This series introduces a new protocol feature
VHOST_USER_PROTOCOL_F_CONFIGURE_SLOTS which, when enabled, lifts the
restriction on the maximum number RAM slots imposed by vhost-user.

The patch consists of 3 changes:
1. Fixed assert in vhost_user_set_mem_table_postcopy:
   This is a bug fix in the postcopy migration path
2. Refactor vhost_user_set_mem_table functions:
   This is a non-functional change refractoring the
   vhost_user_set_mem_table and vhost_user_set_mem_table_postcopy
   functions such that the feature can be more cleanly added.
3. Lift max memory slots limit imposed by vhost-user:
   This change introduces the new protocol feature
   VHOST_USER_PROTOCOL_F_CONFIGURE_SLOTS.

The implementation details are explained in more detail in the commit
messages, but at a high level the new protocol feature works as follows:
- If the VHOST_USER_PROTCOL_F_CONFIGURE_SLOTS feature is enabled, QEMU wi=
ll
  send multiple VHOST_USER_ADD_MEM_REG and VHOST_USER_REM_MEM_REG
  messages to map and unmap individual memory regions instead of one larg=
e
  VHOST_USER_SET_MEM_TABLE message containing all memory regions.
- The vhost-user struct maintains a =E2=80=99shadow state=E2=80=99 of mem=
ory regions
  already sent to the guest. Each time vhost_user_set_mem_table is called=
,
  the shadow state is compared with the new device state. A
  VHOST_USER_REM_MEM_REG will be sent for each region in the shadow state
  not in the device state. Then, a VHOST_USER_ADD_MEM_REG will be sent
  for each region in the device state but not the shadow state. After
  these messages have been sent, the shadow state will be updated to
  reflect the new device state.

The VHOST_USER_SET_MEM_TABLE message was not reused because as the number=
 of
regions grows, the message becomes very large. In practice, such large
messages caused problems (truncated messages) and in the past it seems th=
e
community has opted for smaller fixed size messages where possible. VRING=
s,
for example, are sent to the backend individually instead of in one massi=
ve
message.

Current Limitations:
- postcopy migration is not supported when the
  VHOST_USER_PROTOCOL_F_CONFIGURE_SLOTS has been negotiated.=20
- VHOST_USER_PROTOCOL_F_CONFIGURE_SLOTS cannot be negotiated when
  VHOST_USER_PROTOCOL_F_REPLY_ACK has also been negotiated.

Both of these limitations are due to resource contraints. They are not
imposed for technical reasons.

Changes since V1:
    * Kept the assert in vhost_user_set_mem_table_postcopy, but moved it
      to prevent corruption
    * Made QEMU send a single VHOST_USER_GET_MAX_MEMSLOTS message at
      startup and cache the returned value so that QEMU does not need to
      query the backend every time vhost_backend_memslots_limit is called=
.

Best,
Raphael

Raphael Norwitz (3):
  Fixed assert in vhost_user_set_mem_table_postcopy
  Refactor vhost_user_set_mem_table functions
  Lift max memory slots limit imposed by vhost-user

 docs/interop/vhost-user.rst |  43 +++++
 hw/virtio/vhost-user.c      | 385 +++++++++++++++++++++++++++++++++-----=
------
 2 files changed, 336 insertions(+), 92 deletions(-)

--=20
1.8.3.1


