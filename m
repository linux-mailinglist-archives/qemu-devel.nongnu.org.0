Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E774FB046E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 21:08:53 +0200 (CEST)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i87z2-0005PW-95
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 15:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i87wh-0003xT-Vj
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:06:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i87wg-0006Ze-Rq
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:06:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52844)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i87wg-0006ZO-MF
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 15:06:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BC16D8980EA
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 19:06:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-243.ams2.redhat.com
 [10.36.117.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 907DF60167;
 Wed, 11 Sep 2019 19:06:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, ehabkost@redhat.com,
 berrange@redhat.com, quintela@redhat.com
Date: Wed, 11 Sep 2019 20:06:17 +0100
Message-Id: <20190911190622.7629-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Wed, 11 Sep 2019 19:06:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/5] Automatic RCU read unlock
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>


This patch uses glib's g_auto mechanism to automatically free
rcu_read_lock's at the end of the block.  Given that humans
have a habit of forgetting an error path somewhere it's
best to leave it to the compiler.

(Note I've found the actual cause of my deadlock actually
isn't a misisng unlock; it's a lock ordering thing)

v2
  Rework auto mechanism based on Dan and Eduardo's comments
  Add some more uses in memory/exec
  Add a missing unlock in a function I've not used the macro in

Dr. David Alan Gilbert (5):
  rcu: Add automatically released rcu_read_lock variant
  migration: Use automatic rcu_read unlock in ram.c
  migration: Use automatic rcu_read unlock in rdma.c
  rcu: Use automatic rc_read unlock in core memory/exec code
  migration: Missing rcu_read_unlock

 exec.c                  | 46 ++++++++++-----------------------
 include/exec/ram_addr.h |  8 ++----
 include/qemu/rcu.h      | 18 +++++++++++++
 memory.c                | 15 ++++-------
 migration/ram.c         | 26 ++++++++-----------
 migration/rdma.c        | 57 ++++++++---------------------------------
 6 files changed, 60 insertions(+), 110 deletions(-)

--=20
2.21.0


