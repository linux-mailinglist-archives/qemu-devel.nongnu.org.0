Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D128C57060E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:46:09 +0200 (CEST)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAufo-0000lT-Uc
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvv-000764-Gf
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:43 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvj-0002wv-Le
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:43 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bu1so5948812wrb.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ncZmjL4fnXZIwITU/tClyOmhkWxRy5n9Ldo967W1rl4=;
 b=kxZGxx7WL8vKQ/Mh4kVYZ4DqZQTZEhCcrogQtF83vElKx/F3WgCUazfnuQdsl4uw9v
 SNVO+/dh93hsIRam3wTu6t2Hl73+JSvgjkvQWcnqnFgixtoLDhp4QwL6uhli2UvrSfqo
 n9jEl6T8GPF1nkyJd3g6lwkeN4Pqd4Sy8eCKLyBnb+SmjmQpqEMGazJrxbRbvM38YJ3p
 HcOufYuLBSSRlqgm6UtY33tIBEjzBqzvkoG873NCUn/v5ciLOOF64lGZ3FRzmsDVAaQY
 Yqk7ALAPnZ7e7VXVPFQJPz7DNLaxzGQuQkscORQNXFEpDnM0/NplSnV23brMXA/vwpfl
 eO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncZmjL4fnXZIwITU/tClyOmhkWxRy5n9Ldo967W1rl4=;
 b=8HBj0HsipuVNvBOnTyVfzyjZizvtlpNw7CYYcQwTuFHNxvUXNBLyDbUDJteoFUWrfx
 tT9GWKG1JsqmH8PbDGzGsPwFjrPoEuhAQFYYkZCASFt0Tc2feqe1OOoxEWUy1xohZv56
 hnUcpUXPCrFTr7MsGtUO1eh90FqZ9C3Oy6jbPq6HNnwKaemJe+8bV8tKpYew9gHB4nZt
 AnOk2Bnp2Jt0/etxVT2wO1HMCyBafnBbdmMT+MZoQs9eeAUkASzDvQMD8hTgcekYvK2N
 /PiuoPSOiHQ9+vwEXAC92L5+/cmZq8OyhPlO241hI9wNVjJjsgy/G58XypB6WsthzPSu
 oIbQ==
X-Gm-Message-State: AJIora/GnaJ/qkkbUPrt41phjUjc2/Q/RpkZ7WJ8Vphwv/cH6gVFHMvi
 fGLn4keUhoKPVJlgXjIixE2l0RnaptTyrA==
X-Google-Smtp-Source: AGRyM1t067bQhFVSMNxJ5lNnmjCbY5hGJU3uDoitCYXflVkCCpdSUitDhtJkUv6XhqtXylaToALXNw==
X-Received: by 2002:a05:6000:1ac8:b0:21b:9236:6207 with SMTP id
 i8-20020a0560001ac800b0021b92366207mr16685503wry.123.1657547910069; 
 Mon, 11 Jul 2022 06:58:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/45] linux-user/aarch64: Add SME related hwcap entries
Date: Mon, 11 Jul 2022 14:57:50 +0100
Message-Id: <20220711135750.765803-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-46-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/elfload.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1de77c7959f..ce902dbd56b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -605,6 +605,18 @@ enum {
     ARM_HWCAP2_A64_RNG          = 1 << 16,
     ARM_HWCAP2_A64_BTI          = 1 << 17,
     ARM_HWCAP2_A64_MTE          = 1 << 18,
+    ARM_HWCAP2_A64_ECV          = 1 << 19,
+    ARM_HWCAP2_A64_AFP          = 1 << 20,
+    ARM_HWCAP2_A64_RPRES        = 1 << 21,
+    ARM_HWCAP2_A64_MTE3         = 1 << 22,
+    ARM_HWCAP2_A64_SME          = 1 << 23,
+    ARM_HWCAP2_A64_SME_I16I64   = 1 << 24,
+    ARM_HWCAP2_A64_SME_F64F64   = 1 << 25,
+    ARM_HWCAP2_A64_SME_I8I32    = 1 << 26,
+    ARM_HWCAP2_A64_SME_F16F32   = 1 << 27,
+    ARM_HWCAP2_A64_SME_B16F32   = 1 << 28,
+    ARM_HWCAP2_A64_SME_F32F32   = 1 << 29,
+    ARM_HWCAP2_A64_SME_FA64     = 1 << 30,
 };
 
 #define ELF_HWCAP   get_elf_hwcap()
@@ -674,6 +686,14 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
+    GET_FEATURE_ID(aa64_sme, (ARM_HWCAP2_A64_SME |
+                              ARM_HWCAP2_A64_SME_F32F32 |
+                              ARM_HWCAP2_A64_SME_B16F32 |
+                              ARM_HWCAP2_A64_SME_F16F32 |
+                              ARM_HWCAP2_A64_SME_I8I32));
+    GET_FEATURE_ID(aa64_sme_f64f64, ARM_HWCAP2_A64_SME_F64F64);
+    GET_FEATURE_ID(aa64_sme_i16i64, ARM_HWCAP2_A64_SME_I16I64);
+    GET_FEATURE_ID(aa64_sme_fa64, ARM_HWCAP2_A64_SME_FA64);
 
     return hwcaps;
 }
-- 
2.25.1


