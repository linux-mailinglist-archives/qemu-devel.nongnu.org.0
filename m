Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA7A6A8D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 15:56:52 +0200 (CEST)
Received: from localhost ([::1]:46504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i59Ig-0001SD-So
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 09:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pl@kamp.de>) id 1i597B-00057Y-4C
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pl@kamp.de>) id 1i5979-0001La-IG
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:44:56 -0400
Received: from kerio.kamp.de ([195.62.97.192]:48019)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pl@kamp.de>) id 1i5978-0001KK-1g
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:44:55 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Tue, 3 Sep 2019 15:44:47 +0200
Received: (qmail 39910 invoked from network); 3 Sep 2019 13:44:49 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 3 Sep 2019 13:44:49 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id DFFA213D85C; Tue,  3 Sep 2019 15:44:49 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Date: Tue,  3 Sep 2019 15:44:42 +0200
Message-Id: <20190903134442.15653-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 195.62.97.192
Subject: [Qemu-devel] [PATCH] block/nfs: add support for nfs_umount
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ronniesahlberg@gmail.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libnfs recently added support for unmounting. Add support
in Qemu too.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/nfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/nfs.c b/block/nfs.c
index 0ec50953e4..9d30963fd8 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -1,7 +1,7 @@
 /*
  * QEMU Block driver for native access to files on NFS shares
  *
- * Copyright (c) 2014-2017 Peter Lieven <pl@kamp.de>
+ * Copyright (c) 2014-2019 Peter Lieven <pl@kamp.de>
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -394,6 +394,9 @@ static void nfs_client_close(NFSClient *client)
             nfs_close(client->context, client->fh);
             client->fh = NULL;
         }
+#ifdef LIBNFS_FEATURE_UMOUNT
+        nfs_umount(client->context);
+#endif
         aio_set_fd_handler(client->aio_context, nfs_get_fd(client->context),
                            false, NULL, NULL, NULL, NULL);
         nfs_destroy_context(client->context);
-- 
2.17.1



