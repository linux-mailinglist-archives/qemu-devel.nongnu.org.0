Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C228C4047F2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:44:59 +0200 (CEST)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGc6-00089T-OP
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOGaO-00060r-TM; Thu, 09 Sep 2021 05:43:12 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:42278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOGaN-0001Cp-9e; Thu, 09 Sep 2021 05:43:12 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DB7A322322;
 Thu,  9 Sep 2021 09:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631180589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lcVS1bYtum7n0wWFZtQaap94bm7XcrdkvpMEeUHSEr0=;
 b=Lga9Tl2UZq0V3RCDoPyJECgu1N3RKhpxSfw+uh9lkC136jaOXvyP8zMZ7dVDVpE2mSabGa
 c6T3PUZLc54Y2TD2y9T8W59eg+xh4Bedw9LTaEf28idZwYVLKd4UKBRSwp0bnMRyDEaCQH
 KvJx0YXf62tYTeydKT14AeVvZkn8LTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631180589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lcVS1bYtum7n0wWFZtQaap94bm7XcrdkvpMEeUHSEr0=;
 b=/4hBLg/E7OKVYDLZfSi+u9YNnVNdcsoVOdy7NzBVY51gxmaAisYYL+7bAaHTa9+WGa1MMp
 AfAvh6sUA6N4jNAg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
 by relay2.suse.de (Postfix) with ESMTP id D5497A3BF0;
 Thu,  9 Sep 2021 09:43:09 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
 id C789E518E2AF; Thu,  9 Sep 2021 11:43:09 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] hw/nvme: reattach subsystem namespaces on hotplug
Date: Thu,  9 Sep 2021 11:43:08 +0200
Message-Id: <20210909094308.122038-1-hare@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With commit 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
namespaces get moved from the controller to the subsystem if one
is specified.
That keeps the namespaces alive after a controller hot-unplug, but
after a controller hotplug we have to reconnect the namespaces
from the subsystem to the controller.

Fixes: 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
Cc: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 hw/nvme/subsys.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 93c35950d6..a9404f2b5e 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -14,7 +14,7 @@
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
 {
     NvmeSubsystem *subsys = n->subsys;
-    int cntlid;
+    int cntlid, nsid;
 
     for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
         if (!subsys->ctrls[cntlid]) {
@@ -29,12 +29,18 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
 
     subsys->ctrls[cntlid] = n;
 
+    for (nsid = 0; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
+        if (subsys->namespaces[nsid]) {
+            nvme_attach_ns(n, subsys->namespaces[nsid]);
+        }
+    }
     return cntlid;
 }
 
 void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n)
 {
     subsys->ctrls[n->cntlid] = NULL;
+    n->cntlid = -1;
 }
 
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
-- 
2.26.2


