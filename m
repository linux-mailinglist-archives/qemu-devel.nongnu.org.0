Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB108C5CF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 04:04:37 +0200 (CEST)
Received: from localhost ([::1]:56582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxieS-0002mM-8X
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 22:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1hxicQ-0001Eu-N4
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 22:02:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hxicP-0005Fl-4r
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 22:02:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55811)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hxicN-0005FG-It
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 22:02:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C58E5315C027
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 02:02:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-78.ams2.redhat.com
 [10.36.117.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF13B4AD;
 Wed, 14 Aug 2019 02:02:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2019 04:02:12 +0200
Message-Id: <20190814020218.1868-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 14 Aug 2019 02:02:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/6] Fix multifd with big number of channels
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

When we have much more channels than cpus, we end having failures when
writting to sockets. This series:
- add some traces
- fix some of the trouble with serialization of creating the
  threads/channels in proper order.
- Ask for help with the last patch.  See documentation there.

Please, review.

Juan Quintela (6):
  migration: Add traces for multifd terminate threads
  migration: Make global sem_sync semaphore by channel
  migration: Make sure that all multifd channels have been created
  migration: Make multifd threads wait until all have been created
  migration: add some multifd traces
  RFH: We lost "connect" events

 migration/ram.c        | 60 +++++++++++++++++++++++++++++++++++-------
 migration/trace-events |  8 ++++++
 2 files changed, 59 insertions(+), 9 deletions(-)

--=20
2.21.0


