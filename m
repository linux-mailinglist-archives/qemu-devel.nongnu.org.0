Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C197048DB08
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:52:15 +0100 (CET)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82Oc-000849-Or
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <sebastian.hasler@stuvus.uni-stuttgart.de>)
 id 1n826h-0000j6-13
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:33:43 -0500
Received: from smtp01.stuvus.uni-stuttgart.de ([129.69.139.72]:48018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <sebastian.hasler@stuvus.uni-stuttgart.de>)
 id 1n826d-0000wU-IC
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=stuvus.uni-stuttgart.de; s=20200828.smtp01; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K47Phf+baWik1OtUpOcdWSSeVU2rZCJrwMNuGUWLoqk=; b=Jz3+T9hCz85lKlAX5QIyVhCOo
 e1RLDcZTNMltf3EJvTcIr5OZWJq8RZIaEJMsxJRXCd1rZmIGyy2rLya7K5iHP/PwcbyFixJBbCUMA
 gNajrBiqw9x6Wb/mjKiPVM3io6+Ti98C4RCsNO5XwBq+HP7X6Enk/8YkKqKH/xdoZfhsuIiuaRkId
 fpejRtmWX5Cx+RJde4ecFAVwCh2MHj0CiTiP3DbD+Ofq2clBQphspBFpO1O3BjRrMoTke0QWJcgNd
 YEWyJXoCahC/czs02htGLhDV1hGnmsbs5AQN6qQP+oAlPIsPvYNsjKkUwvXmhdHB2FenPw+KwDS0A
 CaIElVkoQ==;
X-Spam-Bar: +
X-Spam-Score: 1.9
Received: from [141.58.209.220] (helo=beaver.rus.uni-stuttgart.de)
 by smtp01.stuvus.uni-stuttgart.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (envelope-from <sebastian.hasler@stuvus.uni-stuttgart.de>)
 ; Thu, 13 Jan 2022 16:33:33 +0100
From: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] virtiofsd: Do not support blocking flock
Date: Thu, 13 Jan 2022 16:32:49 +0100
Message-Id: <20220113153249.710216-1-sebastian.hasler@stuvus.uni-stuttgart.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=129.69.139.72;
 envelope-from=sebastian.hasler@stuvus.uni-stuttgart.de;
 helo=smtp01.stuvus.uni-stuttgart.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 tools/virtiofsd/passthrough_ll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 64b5b4fbb1..faa62278c5 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2442,6 +2442,15 @@ static void lo_flock(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
     int res;
     (void)ino;
 
+    if (!(op & LOCK_NB)) {
+        /*
+         * Blocking flock can deadlock as there is only one thread
+         * serving the queue.
+         */
+        fuse_reply_err(req, EOPNOTSUPP);
+        return;
+    }
+
     res = flock(lo_fi_fd(req, fi), op);
 
     fuse_reply_err(req, res == -1 ? errno : 0);
-- 
2.33.1


