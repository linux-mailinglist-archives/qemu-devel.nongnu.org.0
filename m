Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901933B5ED2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:21:33 +0200 (CEST)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrCc-0005YC-OG
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1lxrBh-0004nJ-D9
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:20:33 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1lxrBc-0004R9-Ly
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:20:30 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e33so15472684pgm.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W4yNmr7CGV67QrlZN9kVwsThWHzgbSsWPRAA4AXrnp4=;
 b=fIUnk4AazXDsBclQF1QWJSjgxAwBP/GLwW3QXCTG3Y3Cvo10jq5hULvvI2kgSiBwc/
 k70O5FmKsbOJIwEBKKOAZIW8StzpQtKfS2y/JUr2eSX1ZBnGc4fOLjY2Xu/IehBczdaC
 EIGeXiIyOpktklqtPbCEImCgsNolFe1J5TQkp/uD0B0dhTfQ/cfQNYeTfykqXqLPCwUz
 wktHRgQb6uzZYTTh+sasIFa3jTh20G6jzKKY4e6dmaOXoGPZnDqP/7mHEye4qL3dBNpr
 kgun9LRDj9clsMI41JCqJ+gm/RbmFi6Wl63eH2dpUJ+BNezrydrX3WzdUhOTX+Haeawf
 myig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W4yNmr7CGV67QrlZN9kVwsThWHzgbSsWPRAA4AXrnp4=;
 b=kaurz0a225ELUCtr/6CYgGTh4wng+zB2R3lxyEtZdxlQZ+bi6cmuuM/O4EL+g0L6dA
 MVsz4bDQtV2s2DiER3DKKVtPCgDrSPf5ltQB8jLg8UIHpyQjx8F7fCt3NjQ79WZvfT1g
 brTPOWrVmRft7RQBk56GPAvDk4U58ELv/u8DlOF+KSq9EiOKc/wS4/nFHFP+RJp2yWBx
 1jt5OiXr5i55kKgfdkAUeO/lPhE7pWlhMrYO8quANtKOfllM2d0gabCZBy7Vp6n7jtIQ
 ndoZhDSwX2wigyXKBE71/wOFOG/BmetaUraB0ea38G3Fgd09EwoSwuhc3qBWqvGBAZzv
 /6Ew==
X-Gm-Message-State: AOAM530rXyYwznzh7UZFQ8wODPPs3tJQHj0fPYtefUl4cXQWm4ddFamP
 rMdWgSJRNnq4+NfqLvaYjR5faw==
X-Google-Smtp-Source: ABdhPJztH0dl0C3InQwZ7SidURHWTwCPH2Vmlm0ssC8K/ohw+UN6UaDKVA6OYiwB8jefAAurDwOm0A==
X-Received: by 2002:a05:6a00:22cd:b029:307:8bc0:8310 with SMTP id
 f13-20020a056a0022cdb02903078bc08310mr24735153pfj.43.1624886425429; 
 Mon, 28 Jun 2021 06:20:25 -0700 (PDT)
Received: from always-libai.bytedance.net ([61.120.150.77])
 by smtp.gmail.com with ESMTPSA id d1sm4081318pju.16.2021.06.28.06.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:20:25 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: ehabkost@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 philmd@redhat.com, armbru@redhat.com
Subject: [PATCH] target/i386: Fix cpuid level for AMD
Date: Mon, 28 Jun 2021 21:20:18 +0800
Message-Id: <20210628132018.394994-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, qemu-devel@nongnu.org,
 like.xu@linux.intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
should not be changed to 0x1f in multi-dies case.

Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
for multi-dies PCMachine)
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 target/i386/cpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a9fe1662d3..3934c559e4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5961,8 +5961,12 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
             }
         }
 
-        /* CPU topology with multi-dies support requires CPUID[0x1F] */
-        if (env->nr_dies > 1) {
+        /*
+         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
+         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
+         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU.
+         */
+        if ((env->nr_dies > 1) && IS_INTEL_CPU(env)) {
             x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
         }
 
-- 
2.25.1


