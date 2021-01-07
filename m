Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F22EE874
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:25:38 +0100 (CET)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdir-00085d-BG
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgT-0006d1-JX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:09 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgS-0004c5-2N
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:09 -0500
Received: by mail-wm1-x334.google.com with SMTP id g25so5684455wmh.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+5gxhXnPVS+EmwiIP+LC6CRqrj3N73XVIMAHkwrkkuk=;
 b=UsfXlI+TbWdQdaUfwWdRfbxO8P+8XB5wKI0zUFGsVeVhjL++Yj7b0MzEJLWhzoeNJ2
 QK2QcK/yZXaZ7X1Gwr+tYJYkTMXHBz7azKGrWATr0hW0vKIBS3zH62+RIojLiThUrT49
 MSq8Pzs+MVTHHIqabNpoOxAybytLjI7a6lVJqPb435sccUTDp9ygBDZ/AIDg3Kj31sgL
 91bLkujoqPC6bl6D8iMbBOXw2Zr1fjHvjRa9ECdEMArYesGyqrNQrCtcJ5q/C7DFEo+c
 TNzcRXoDdgeeaWFtQ7EB7nXLY04gcAem/lR8SZE2smXgHIjbie0cAZcCDgkwKTn3Yun9
 j8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+5gxhXnPVS+EmwiIP+LC6CRqrj3N73XVIMAHkwrkkuk=;
 b=F4VhqE/D5yz/OaEwMfdOyV92mq3x5GFQCALRUTMNE9unCtp8BrYJ/VS2uUr8GPFnDK
 b0aMIinv6em+qfTsRTCa3rlg+9KKRMfmI3qL9/Q47onFl57c5BMltGiLTnuqBVjuAc0d
 Guein4bAjpPUrYPrA5qzKUazoCoM9uabOsa+BWT3gBcXzf2IjEvrxShDoiTS0IDBY94x
 QLjNZll3KveLq2YsVRxM6941fNWUBI+yf5C+fJteV5j9Kj5P1LVQLasc3yyofmtxZf3w
 9VXB7dmQMDKMZt2GQiYPDfoCL6nh0NuFyhA8XrYrUdpvlYpTqqn+q8l/J1CVhEUEEqA5
 +qbA==
X-Gm-Message-State: AOAM531daYp9qS49D41Ew9W/tT2le0q5gpuY4bnL3LsgQegF6wJmKbA3
 SAsl/SNxf5Z8jpQN+EXhh1cMB2dw9Bc=
X-Google-Smtp-Source: ABdhPJx8vDUwzrJghUt0/rCE93jpLdwKg32Sc+17jrccybyhDqY0AAjbyR2/52kuueElTbq+kesoFQ==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr526276wmh.114.1610058186556; 
 Thu, 07 Jan 2021 14:23:06 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id y130sm10116378wmc.22.2021.01.07.14.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/66] target/mips: Replace CP0_Config0 magic values by proper
 definitions
Date: Thu,  7 Jan 2021 23:21:49 +0100
Message-Id: <20210107222253.20382-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201201132817.2863301-3-f4bug@amsat.org>
---
 target/mips/translate_init.c.inc | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index f72fee3b40a..cac3d241831 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -495,7 +495,8 @@ const mips_def_t mips_defs[] =
         .name = "R4000",
         .CP0_PRid = 0x00000400,
         /* No L2 cache, icache size 8k, dcache size 8k, uncached coherency. */
-        .CP0_Config0 = (1 << 17) | (0x1 << 9) | (0x1 << 6) | (0x2 << CP0C0_K0),
+        .CP0_Config0 = (2 << CP0C0_Impl) | (1 << CP0C0_IC) | (1 << CP0C0_DC) |
+                       (2 << CP0C0_K0),
         /* Note: Config1 is only used internally, the R4000 has only Config0. */
         .CP0_Config1 = (1 << CP0C1_FP) | (47 << CP0C1_MMU),
         .CP0_LLAddr_rw_bitmask = 0xFFFFFFFF,
@@ -516,7 +517,8 @@ const mips_def_t mips_defs[] =
         .name = "VR5432",
         .CP0_PRid = 0x00005400,
         /* No L2 cache, icache size 8k, dcache size 8k, uncached coherency. */
-        .CP0_Config0 = (1 << 17) | (0x1 << 9) | (0x1 << 6) | (0x2 << CP0C0_K0),
+        .CP0_Config0 = (2 << CP0C0_Impl) | (1 << CP0C0_IC) | (1 << CP0C0_DC) |
+                       (2 << CP0C0_K0),
         .CP0_Config1 = (1 << CP0C1_FP) | (47 << CP0C1_MMU),
         .CP0_LLAddr_rw_bitmask = 0xFFFFFFFFL,
         .CP0_LLAddr_shift = 4,
@@ -766,8 +768,8 @@ const mips_def_t mips_defs[] =
         .name = "Loongson-2E",
         .CP0_PRid = 0x6302,
         /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size.  */
-        .CP0_Config0 = (0x1<<17) | (0x1<<16) | (0x1<<11) | (0x1<<8) |
-                       (0x1<<5) | (0x1<<4) | (0x1<<1),
+        .CP0_Config0 = (3 << CP0C0_Impl) | (4 << CP0C0_IC) | (4 << CP0C0_DC) |
+                       (1 << CP0C0_IB) | (1 << CP0C0_DB) | (0x2 << CP0C0_K0),
         /* Note: Config1 is only used internally,
            Loongson-2E has only Config0.  */
         .CP0_Config1 = (1 << CP0C1_FP) | (47 << CP0C1_MMU),
@@ -786,8 +788,8 @@ const mips_def_t mips_defs[] =
         .name = "Loongson-2F",
         .CP0_PRid = 0x6303,
         /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size.  */
-        .CP0_Config0 = (0x1<<17) | (0x1<<16) | (0x1<<11) | (0x1<<8) |
-                       (0x1<<5) | (0x1<<4) | (0x1<<1),
+        .CP0_Config0 = (3 << CP0C0_Impl) | (4 << CP0C0_IC) | (4 << CP0C0_DC) |
+                       (1 << CP0C0_IB) | (1 << CP0C0_DB) | (0x2 << CP0C0_K0),
         /* Note: Config1 is only used internally,
            Loongson-2F has only Config0.  */
         .CP0_Config1 = (1 << CP0C1_FP) | (47 << CP0C1_MMU),
-- 
2.26.2


