Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA048B63B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 19:58:30 +0100 (CET)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MLk-0006LA-Ry
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 13:58:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <sebastian.hasler@stuvus.uni-stuttgart.de>)
 id 1n7Lc6-0004GH-Iq
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 13:11:18 -0500
Received: from smtp02.stuvus.uni-stuttgart.de ([141.58.118.72]:52450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <sebastian.hasler@stuvus.uni-stuttgart.de>)
 id 1n7Lc4-0000qH-0O
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 13:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=stuvus.uni-stuttgart.de; s=20200828.smtp02; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qddxRKK/Am2+hWt+gYqWMDbuPzwWnHe+PKonl18cm/E=; b=oqHYwtx7dFuG+mI5NotKZYgow
 SkM0vbDjFDc26R1OxKTm4BfkHa05jGsr+8ieUnnMXkg1BhVgM2h5VTVxSlgv7qW5AbhnqkGBJB3BE
 S/hwqcWqYMuOpqGtcfSZ/xO+Gd+mRhasaQ2i6htv4iPsLbeM44InZD0ZyX/p7dbgsooKyJOSG7gI1
 ZjOKJTIFKq/g6flEK+g4t9BmpnWBbHl+qsCTqMhlRCFBzvPp/4KtElSHaqbC2BHPGW9K84BLvXCVv
 hFlssh5VzhJD0WhCVWkQjHSxTsP2MMbzqyXF4tjFE0IR6yYAPCY2jj4YiSEi2HEov3vQGATNk4l6x
 dxpi9Wnaw==;
X-Spam-Bar: +++
X-Spam-Score: 3.1
Received: from pool4-84.sec.uni-stuttgart.de ([129.69.182.84]
 helo=beaver.rus.uni-stuttgart.de)
 by smtp02.stuvus.uni-stuttgart.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (envelope-from <sebastian.hasler@stuvus.uni-stuttgart.de>)
 ; Tue, 11 Jan 2022 19:11:08 +0100
From: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtiofsd: Do not support blocking flock
Date: Tue, 11 Jan 2022 19:10:43 +0100
Message-Id: <20220111181043.435915-1-sebastian.hasler@stuvus.uni-stuttgart.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=141.58.118.72;
 envelope-from=sebastian.hasler@stuvus.uni-stuttgart.de;
 helo=smtp02.stuvus.uni-stuttgart.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 11 Jan 2022 13:31:39 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com,
 Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the current implementation, blocking flock can lead to
deadlock. Thus, it's better to return EOPNOTSUPP if a user attempts
to perform a blocking flock request.

Signed-off-by: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>
---
 tools/virtiofsd/passthrough_ll.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 64b5b4fbb1..f3cc307f6d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2442,6 +2442,12 @@ static void lo_flock(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
     int res;
     (void)ino;
 
+    if (!(op & LOCK_NB)) {
+        /* Blocking flock is not supported */
+        fuse_reply_err(req, EOPNOTSUPP);
+        return;
+    }
+
     res = flock(lo_fi_fd(req, fi), op);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
-- 
2.33.1


