Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566E83B7EE9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 10:27:38 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyVZJ-0003XJ-E7
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 04:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chengjiayao@bytedance.com>)
 id 1lyVXt-0002cx-Ci
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 04:26:09 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chengjiayao@bytedance.com>)
 id 1lyVXm-0007pF-Jc
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 04:26:07 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z4so1034981plg.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gDPJobZCmikOITB0QVTynnepudH4RHDWsjjuAaCWWRA=;
 b=MN6QftYdQX2MDfNVSZ+Hc0mmrro8H6mdlyxUyr+8jTBknwtsHqVU4kODoSC0VC8F2t
 STwgMh9EiBD59ZqS008x0TlPvbosLp0NmkZA47xC5PqzWEY6hu2L9ZZt6gC/A4R/swHy
 iVQ3kMEJmoguq5g22TgCmRQvHRZIINyLn7l3/zEjCE5xMd3Cya0eH/TsYcRpGnc1s+iB
 +obeLy5ZyZm/FRjPEXtMWo+qa90mOda1Pk4G8XTB609BTtf+MJVdM4wryzMQCzrh36bi
 f/vrP32UYCl9y8lEyPRDX4iNgMgkVXiezVr+Cv8IFK+VI6G5meaqd1UnxemrLcJbjGdF
 R9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gDPJobZCmikOITB0QVTynnepudH4RHDWsjjuAaCWWRA=;
 b=ZOyjGnJL4GgUF8NvUNi1S7d+JSSBTJyru2BOSwc86Ph1HOInGeuAnReJ8QoCTUjkFj
 nYSglY1xnAyyfavn1STOy+HZHBQDaonWrtapDuLpjQ0VWmrszzg0E0KefA2A5wH97wuh
 mPBbLQoQNDjhM4wkEfBJ8KD9zdmQKaKszlkzR45UogCVbrV7AptXveoX3CotxQRaIPKg
 CCEV5y6tfjg77xMioUGovjZik09PJx93S5DZmMO+bMlEZlbkKOWWjgnQhmuEjbmud6mX
 d/hcaGwym3QT2+2zfOb5DrF+L6ua/gGXfmXziVY+EoDIEmg+HLGTJWr/0U8nA9pqx0ub
 5FbQ==
X-Gm-Message-State: AOAM530GJSES9Mym+pxRrSGgQ38/QBFGl1wNRjM3xiAR7nfTQvMmXlOn
 lkfVuFkLmQ0CGudVMnMGTghp
X-Google-Smtp-Source: ABdhPJyxmqajjCv7zuG4FpLPrmhby/ka5Tt/UidtZ/W8/lgZ5960ixAo2BqnFdnc1rFA0ukU/UdC6g==
X-Received: by 2002:a17:902:da8f:b029:129:fdf:f921 with SMTP id
 j15-20020a170902da8fb02901290fdff921mr3623267plx.72.1625041559173; 
 Wed, 30 Jun 2021 01:25:59 -0700 (PDT)
Received: from ByteDance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id z3sm21411583pgl.77.2021.06.30.01.25.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Jun 2021 01:25:58 -0700 (PDT)
From: Jade Cheng <chengjiayao@bytedance.com>
To: ehabkost@redhat.com,
	pbonzini@redhat.com
Subject: [PATCH] Fix CPUID_Fn8000001E_EBX for AMD
Date: Wed, 30 Jun 2021 16:25:51 +0800
Message-Id: <20210630082551.12956-1-chengjiayao@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=chengjiayao@bytedance.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jade Cheng <chengjiayao@bytedance.com>, qemu-devel@nongnu.org,
 pizhenwei@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to AMD64 Arch Programmer's Manual Appendix D,
bits 7:0 in Fn8000_001E_EBX should be physical core(s) per logical processor, not per die.

Signed-off-by: Jade Cheng <chengjiayao@bytedance.com>
---
 target/i386/cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a9fe1662d3..417f5ba81f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -381,7 +381,13 @@ static void encode_topo_cpuid8000001e(X86CPU *cpu, X86CPUTopoInfo *topo_info,
      *  NOTE: CoreId is already part of apic_id. Just use it. We can
      *  use all the 8 bits to represent the core_id here.
      */
-    *ebx = ((topo_info->threads_per_core - 1) << 8) | (topo_ids.core_id & 0xFF);
+    uint32_t core_id = topo_ids.core_id;
+
+    if (IS_AMD_CPU(&cpu->env)) {
+        core_id = topo_ids.core_id + topo_ids.die_id * topo_info->cores_per_die;
+    }
+
+    *ebx = ((topo_info->threads_per_core - 1) << 8) | (core_id & 0xFF);
 
     /*
      * CPUID_Fn8000001E_ECX [Node Identifiers] (NodeId)
-- 
2.24.3 (Apple Git-128)


