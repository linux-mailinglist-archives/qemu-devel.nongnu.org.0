Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC22BF1040
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 08:30:07 +0100 (CET)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSFlW-000511-2j
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 02:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iSFkZ-0004TO-KO
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 02:29:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iSFkX-00018O-VE
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 02:29:06 -0500
Received: from [192.146.154.1] (port=29260 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iSFkX-00017t-Q8
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 02:29:05 -0500
Received: from localhost.corp.nutanix.com (unknown [10.40.36.164])
 by mcp01.nutanix.com (Postfix) with ESMTP id 7CEBA1007D2C;
 Wed,  6 Nov 2019 07:29:04 +0000 (UTC)
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] [RFC] vhost-user: clean up set_mem_table functions
Date: Wed, 30 Oct 2019 19:12:04 -0400
Message-Id: <1572477125-25344-1-git-send-email-raphael.norwitz@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functions sending vhost-user set memory table messages are getting
convoluted. The amount of nested logic is getting in the way of my
development and it looks like some identical logic should be refractored
out anyways. Here=E2=80=99s an RFC which cleans these functions up a bit.

Raphael

Raphael Norwitz (1):
  vhost-user: Refractor vhost_user_set_mem_table Functions

 hw/virtio/vhost-user.c | 140 +++++++++++++++++++++++--------------------=
------
 1 file changed, 65 insertions(+), 75 deletions(-)

--=20
1.8.3.1


