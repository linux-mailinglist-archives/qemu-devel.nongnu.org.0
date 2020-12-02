Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101E12CC3B6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:30:30 +0100 (CET)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkVxU-0008K8-UW
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kkVvr-0007nA-0O
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:28:47 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:35246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kkVvp-0000MM-1t
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:28:46 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-zZNmp02tM-OCwLlrFeBjuA-1; Wed, 02 Dec 2020 12:28:30 -0500
X-MC-Unique: zZNmp02tM-OCwLlrFeBjuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC50C100E420;
 Wed,  2 Dec 2020 17:28:28 +0000 (UTC)
Received: from bahia.lan (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C88960854;
 Wed,  2 Dec 2020 17:28:26 +0000 (UTC)
Subject: [PATCH for-6.0] hw/ppc: Do not re-read the clock on pre_save if doing
 savevm
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 02 Dec 2020 18:28:26 +0100
Message-ID: <160693010619.1111945.632640981169395440.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A guest with enough RAM, eg. 128G, is likely to detect savevm downtime
and to complain about stalled CPUs. This happens because we re-read
the timebase just before migrating it and we thus don't account for
all the time between VM stop and pre-save.

A very similar situation was already addressed for live migration of
paused guests (commit d14f33976282). Extend the logic to do the same
with savevm.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1893787
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/ppc.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 1b9827207676..5cbbff1f8d0c 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1027,7 +1027,8 @@ static void timebase_save(PPCTimebase *tb)
      */
     tb->guest_timebase =3D ticks + first_ppc_cpu->env.tb_env->tb_offset;
=20
-    tb->runstate_paused =3D runstate_check(RUN_STATE_PAUSED);
+    tb->runstate_paused =3D
+        runstate_check(RUN_STATE_PAUSED) || runstate_check(RUN_STATE_SAVE_=
VM);
 }
=20
 static void timebase_load(PPCTimebase *tb)
@@ -1088,7 +1089,7 @@ static int timebase_pre_save(void *opaque)
 {
     PPCTimebase *tb =3D opaque;
=20
-    /* guest_timebase won't be overridden in case of paused guest */
+    /* guest_timebase won't be overridden in case of paused guest or savev=
m */
     if (!tb->runstate_paused) {
         timebase_save(tb);
     }



