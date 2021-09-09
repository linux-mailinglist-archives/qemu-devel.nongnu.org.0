Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CE404811
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:53:39 +0200 (CEST)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGkU-0007uQ-4P
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOGix-0006LH-Pr; Thu, 09 Sep 2021 05:52:03 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:49714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOGiw-0000WK-C3; Thu, 09 Sep 2021 05:52:03 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7BE071FDDF;
 Thu,  9 Sep 2021 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631181120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X+joRS4X0wVBmqlG72PuPiRs2Q/VydB4oFy1KskMxCI=;
 b=jWZ91wS1OAgKkkBo9U1SapyZNoNtT4TqiqMVKPoxaOUIZP4NVraQGXtaQV6k9S9TSn9Yk1
 YcOGgD8EctcP4vGJkWJPizG1R80VXCdmlXNOCQ6UiZvAhfJdHF83atcIuz4ZH109Uz+1hJ
 JWheyUbR98Ux3vE8vALi4Z3cjrxjdYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631181120;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X+joRS4X0wVBmqlG72PuPiRs2Q/VydB4oFy1KskMxCI=;
 b=l7dbwcV/11ncBODuquwRWkh3hS7vyzbc+3Ci50RCtuSgphB5G5rd6as7xpJeB8K0AmbB4U
 D57ioDoD0HgyGVBg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
 by relay2.suse.de (Postfix) with ESMTP id 389F9A3BA4;
 Thu,  9 Sep 2021 09:52:00 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
 id 2D2BD518E2B1; Thu,  9 Sep 2021 11:52:00 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] hw/nvme: select first free NSID for legacy drive configuration
Date: Thu,  9 Sep 2021 11:51:59 +0200
Message-Id: <20210909095159.122174-1-hare@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
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

If a legacy 'drive' argument is passed to the controller we cannot
assume that '1' will be a free NSID, as the subsys might already
have attached a namespace to this NSID. So select the first free
one.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 hw/nvme/ctrl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 757cdff038..2c69031ca9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6546,8 +6546,15 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 
     /* setup a namespace if the controller drive property was given */
     if (n->namespace.blkconf.blk) {
+        int i;
         ns = &n->namespace;
-        ns->params.nsid = 1;
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+            if (nvme_ns(n, i) || nvme_subsys_ns(n->subsys, i)) {
+                continue;
+            }
+            ns->params.nsid = i;
+            break;
+        }
 
         if (nvme_ns_setup(ns, errp)) {
             return;
-- 
2.26.2


