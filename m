Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39662CA3E1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:31:50 +0100 (CET)
Received: from localhost ([::1]:59308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5kz-000473-TT
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5hx-0002kh-2h
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:28:41 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5hq-0006K1-Gx
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:28:36 -0500
Received: by mail-wm1-x343.google.com with SMTP id d3so2784287wmb.4
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rp4xnUJtd5sl4NVBjhV9Hzwn0rVDspRr7Rk8qpU8HFs=;
 b=jsrnKPHGJrSbQU9I/pKISqEwGFA2aC9mJ1msXv+esIjKWWclVOQQ48/i+eZH3Jm/qV
 yZHCIB/0W0KnwrrTGPDbP/cfQHo5Ku9JLF/MvU6FrQ2tXD/0wA5M9w8EIdn499AkWpcU
 Zi9/+MhF9QZuZPYhrTleB+tA27KU31b8OS4qTx2x0k04+UId34w1Ase+rIMqKI1Bdj9I
 EKlH9dlXTX2vUasHmSE3kuNXAdgYtHP4OxdtlrTGslD0RsD1pKiL+2evk4seJdqzdbe3
 nJCaNU4+ZCkMibl3dLqJWjzdilElhDgA+dc/MSjOF1z8Z27dz1JKH/2RyvXkrCaw9g0G
 qWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rp4xnUJtd5sl4NVBjhV9Hzwn0rVDspRr7Rk8qpU8HFs=;
 b=P48k84vu7oU+nYdSfqFv1sJRdpLslgCd891ery5BJSm8CvSomZOw0WeK6A26flkpvE
 7Rk95tN8yohG55HUKfOjCMG1oCPtdlM4X6b5+5iWXvukHica2vKg6E0jf+jsMo+SUVt4
 sBqe8LgT+G0zPvUjeDGNNM8M4+WobUL7tFMwDydwwYNuQgFaclSl5i4rm1Z99aSFH3GE
 kYQQFHiZu5TznzKZxoex+S1sYluKAn48zMi55TUMoMCPBQz+0++hOJSmtPMNZkpHT9Dg
 +d6LtCLfeNW3VAQAaHpvq/DkhqUcuSzo+O5hcFrRTDJ2U9YVGSTCaKYCvVKUNuF4GQQo
 75Tg==
X-Gm-Message-State: AOAM533mTv8xAgqVzfabn81g8shwe4cpNV2bm5ciU1bE5+stck5mseQi
 NfZIZVUR/DSJhyJsjBTM8fY=
X-Google-Smtp-Source: ABdhPJyAkn2+wfBkeqakUxJj80cczQukKxaQAsXINRBFWBKDZuWOOLxa2AlmpNUa9jPzDLbEZp5Vcg==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr2696362wmh.51.1606829310366; 
 Tue, 01 Dec 2020 05:28:30 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id i11sm3253089wrm.1.2020.12.01.05.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:28:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/3] target/mips: Replace CP0_Config0 magic values by proper
 definitions
Date: Tue,  1 Dec 2020 14:28:16 +0100
Message-Id: <20201201132817.2863301-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201132817.2863301-1-f4bug@amsat.org>
References: <20201201132817.2863301-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate_init.c.inc | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index ea85d5c6a79..4206d8f0859 100644
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


