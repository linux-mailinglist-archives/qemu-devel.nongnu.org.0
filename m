Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808E4B8ED1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:07:27 +0100 (CET)
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNm1-00086s-F8
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:07:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nKNIP-00033K-12
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:36:49 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:41914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nKNIN-0003RM-5d
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:36:48 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0541B218D6;
 Wed, 16 Feb 2022 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645029404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9hgtQE3/7lYvM3Y6jzXlllULFb+QWhEYAOqGGj7xDwE=;
 b=jkcAy1WPC+bCkKGtLAb0MtfWsqIqUGV6YPAtJ3FHWcUtfmuDDhI8W9PVhPADRq92tPoRv4
 fhhHx0XqIiU++4XbR8phFoPhIHsl0c6zt4M6i+5nLYSxvTvKDPa4aGc+/5goxP8wNcS9WE
 AcnUiYgJye8ENsl7AZSeB9JCb3LSHfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645029404;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9hgtQE3/7lYvM3Y6jzXlllULFb+QWhEYAOqGGj7xDwE=;
 b=aD9n25yscCQjyz610Nq8IyuFMCzH1ydWkkd2YPcGms1yzUf5qzS1d/slubIQc5vZIiF8cb
 W09OhNx4Nd8YeWAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB80613B35;
 Wed, 16 Feb 2022 16:36:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Mj0CLBsoDWJ0VAAAMHmgww
 (envelope-from <lizhang@suse.de>); Wed, 16 Feb 2022 16:36:43 +0000
From: Li Zhang <lizhang@suse.de>
To: eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org
Subject: [PATCH 1/1] numa: check mem or memdev in numa configuration
Date: Wed, 16 Feb 2022 17:36:13 +0100
Message-Id: <20220216163613.22570-1-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Li Zhang <lizhang@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If there is no mem or memdev in numa configuration, it always
reports the error as the following:

total memory for NUMA nodes (0x0) should equal RAM size (0x100000000)

This error is confusing and the reason is that total memory of numa nodes
is always 0 if there is no mem or memdev in numa configuration.
So it's better to check mem or memdev in numa configuration.

Signed-off-by: Li Zhang <lizhang@suse.de>
---
 hw/core/numa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 1aa05dcf42..11cbec51eb 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -132,6 +132,11 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
 
     have_memdevs = have_memdevs ? : node->has_memdev;
     have_mem = have_mem ? : node->has_mem;
+    if (!node->has_memdev && !node->has_mem) {
+        error_setg(errp, "numa configuration should use mem= or memdev= ");
+        return;
+    }
+
     if ((node->has_mem && have_memdevs) || (node->has_memdev && have_mem)) {
         error_setg(errp, "numa configuration should use either mem= or memdev=,"
                    "mixing both is not allowed");
-- 
2.31.1


