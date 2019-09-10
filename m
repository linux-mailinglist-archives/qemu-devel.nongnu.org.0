Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC3AEEBC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 17:44:21 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7iJY-0005Bp-69
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 11:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pl@kamp.de>) id 1i7iGZ-0002FQ-OE
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pl@kamp.de>) id 1i7iGY-0004RI-GT
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:41:15 -0400
Received: from kerio.kamp.de ([195.62.97.192]:60399)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pl@kamp.de>) id 1i7iGY-0004Ps-3T
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:41:14 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 17:41:08 +0200
Received: (qmail 7081 invoked from network); 10 Sep 2019 15:41:11 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 10 Sep 2019 15:41:11 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 7A01813D850; Tue, 10 Sep 2019 17:41:11 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Date: Tue, 10 Sep 2019 17:41:09 +0200
Message-Id: <20190910154110.6905-2-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910154110.6905-1-pl@kamp.de>
References: <20190910154110.6905-1-pl@kamp.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 195.62.97.192
Subject: [Qemu-devel] [PATCH V2 1/2] block/nfs: tear down aio before
 nfs_close
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, ronniesahlberg@gmail.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nfs_close is a sync call from libnfs and has its own event
handler polling on the nfs FD. Avoid that both QEMU and libnfs
are intefering here.

CC: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/nfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/nfs.c b/block/nfs.c
index 0ec50953e4..2c98508275 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -390,12 +390,14 @@ static void nfs_attach_aio_context(BlockDriverState *bs,
 static void nfs_client_close(NFSClient *client)
 {
     if (client->context) {
+        qemu_mutex_lock(&client->mutex);
+        aio_set_fd_handler(client->aio_context, nfs_get_fd(client->context),
+                           false, NULL, NULL, NULL, NULL);
+        qemu_mutex_unlock(&client->mutex);
         if (client->fh) {
             nfs_close(client->context, client->fh);
             client->fh = NULL;
         }
-        aio_set_fd_handler(client->aio_context, nfs_get_fd(client->context),
-                           false, NULL, NULL, NULL, NULL);
         nfs_destroy_context(client->context);
         client->context = NULL;
     }
-- 
2.17.1



