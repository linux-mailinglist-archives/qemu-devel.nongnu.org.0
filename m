Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8EB698BA5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:18:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWeI-0002JB-LM; Thu, 16 Feb 2023 00:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeG-0002IU-Kl
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:36 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeE-0002zd-US
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:36 -0500
Received: by mail-lf1-x136.google.com with SMTP id g28so1462181lfv.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMlkMTz7ZJfnoghF2v1XErS4DvexjjXA3x7/KGncEGY=;
 b=C3QBo0Si6FXpW70JrVtmvlvAN30bQ19K8CzoT/fZZpaNdd7HHY/Bfruedj72DlSHQ0
 iUulksWpXXxK3pLMJPfwxAVXMKu660/hukLTKr/N9WvUCxeBF5FF+2RsSm+A/xn+9kqk
 18HZEW9n2bKOydWMCYSFSYAHW9SSv6zO+20EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XMlkMTz7ZJfnoghF2v1XErS4DvexjjXA3x7/KGncEGY=;
 b=C5Rc4piOoIWXmLoT0bjOsaAkclVMaHHwgcOpJIeOccgPha1pJaX3q0OG7VPXA1XwEX
 wwq2VFhbBRmjYbLG1/zlCxBTDvQFYxXj8QpoTChAduxa5Pxu9wuAFaq31GrMdlvv1U4K
 5WLDLKZlSxX/9jzU+1sYTzzuzhV/m7Uragt4qEvXBX83aSHtuyxDQmC/iq5cXkSzbh8I
 uE9FnM9frEBj4igiwdmoc/pei5Rjv793WjqG4ksPM2fGnGL4eIcbIEOZZm5p/Rghj2DG
 Ih41wrXKotMnnUBjySJ4eXK/KqA9ScjGdU7TvLEcKSa6DkYXldVJJYKWjr5XIjBTkRwV
 6TfQ==
X-Gm-Message-State: AO0yUKWpK3yAymLIpR7yBs4C3OzPwc/SLhE4yvnrQsCkkVDvM2fQdls6
 X/n0eJ93NIO46vMDh1er0k+cp41a4JevkK1z
X-Google-Smtp-Source: AK7set/xZSP3gDgTtxUhdAMxp7dVZZvxz2MIP571qpNupQqNZnybraodO9ZCGxnDjvbHC9RVU5/U4g==
X-Received: by 2002:ac2:4219:0:b0:4cb:28b4:b415 with SMTP id
 y25-20020ac24219000000b004cb28b4b415mr1060446lfh.34.1676524652933; 
 Wed, 15 Feb 2023 21:17:32 -0800 (PST)
Received: from WR-NOWAKOWSKI.fungible.local (77-255-255-121.adsl.inetia.pl.
 [77.255.255.121]) by smtp.gmail.com with ESMTPSA id
 s1-20020a19ad41000000b004b7033da2d7sm141278lfd.128.2023.02.15.21.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:17:32 -0800 (PST)
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
To: qemu-devel@nongnu.org
Cc: marcin.nowakowski@fungible.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v2 4/4] target/mips: set correct CP0.Config[4,
 5] values for M14K(c)
Date: Thu, 16 Feb 2023 06:17:17 +0100
Message-Id: <20230216051717.3911212-5-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
References: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu-defs.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index fdde04dfb9..d45f245a67 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -332,7 +332,10 @@ const mips_def_t mips_defs[] =
                        (0x1 << CP0C0_AR) | (MMU_TYPE_FMT << CP0C0_MT),
         .CP0_Config1 = MIPS_CONFIG1,
         .CP0_Config2 = MIPS_CONFIG2,
-        .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (1 << CP0C3_VInt),
+        .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (1 << CP0C3_VInt) |
+                       (1 << CP0C3_M),
+        .CP0_Config4 = MIPS_CONFIG4 | (1 << CP0C4_M),
+        .CP0_Config5 = MIPS_CONFIG5 | (1 << CP0C5_NFExists),
         .CP0_Config7 = 1 << CP0C7_WII,
         .CP0_LLAddr_rw_bitmask = 0,
         .CP0_LLAddr_shift = 4,
@@ -354,7 +357,10 @@ const mips_def_t mips_defs[] =
                        (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA),
         .CP0_Config2 = MIPS_CONFIG2,
-        .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (0 << CP0C3_VInt),
+        .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (0 << CP0C3_VInt) |
+                       (1 << CP0C3_M),
+        .CP0_Config4 = MIPS_CONFIG4 | (1 << CP0C4_M),
+        .CP0_Config5 = MIPS_CONFIG5 | (1 << CP0C5_NFExists),
         .CP0_Config7 = 1 << CP0C7_WII,
         .CP0_LLAddr_rw_bitmask = 0,
         .CP0_LLAddr_shift = 4,
-- 
2.25.1


