Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38E7640009
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymZ-0002dE-EC; Fri, 02 Dec 2022 00:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymX-0002cI-EO
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:17 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymV-0003MF-DH
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:17 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 fa4-20020a17090af0c400b002198d1328a0so514053pjb.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dgmD8yUJnIF7Ep3YQaKEZ2wvp15A3Cnw31rhHlanTU=;
 b=kxvjIcjW+JGLXHvM1GRj9BUvAr2B0yBON0lzJC6rbS/Sg6UdGr60kQvbVMKISzjQPd
 uRLTtoMOr2kyIrS20FeCjjdFunnFhDoqxhPOzNmhgnBBgMVRNVFPcLrE8Xs1MpR2KEGq
 wTgwIawn1zw5+BKef804MH8vL4c+Tq9d1Qci4aHWxH7HEeiPWVqajDqPq77zWmJ4QRAv
 aSwElUMdlnu9oreGuP29S6xSn3mf9EOHuuY1abnXfr3zkQolPHIl9JPUdj6KDN4Dhp0h
 9Ff9tcMDjGy2SBw/ze/ZWS9dWTSfI2Q9MeWrJlNPqAofhA0DJ9Dm6E4FK45/yvmevOoK
 nKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dgmD8yUJnIF7Ep3YQaKEZ2wvp15A3Cnw31rhHlanTU=;
 b=JO1wInf/C0RHdtQzm8VEZh2WMGBmk1FMKuq7huvuEdYV7IAtlbqtzGGGLByoZWY5wc
 TValRmhy5x25adVpqBBscHXMdHL+WCW1fDkOJksp3DWX/Y0fuEIVBwWP/Td6ET+nFT6e
 kmwOfeEMPb5kV4JJGnxoRwE/7V3OkLMvojHwkwn0zKtHi/JXVq/5K1lJwqVARUtmBpmJ
 6Ex3olv1aDTB3Z5ONJMFg8nZkG7diSzo/lXzjb7Zfsu7mQrJGNRUVSCSqLRrBX0mgbuS
 M7BtsaLUO1PVrRD7hknm+wUyHFsojXyPXiHly0slAGJ6FAQTQoxmKD9X3Q2PF1odNknF
 HrOw==
X-Gm-Message-State: ANoB5pklVw40HCr5c6jvS6FHBMLpxRe8YcAiK24VruJ3yuLmr8kLFuBq
 x67Xmu4fsUWW2mXveNPq2LObrDifMld0YzKD
X-Google-Smtp-Source: AA0mqf6/Y3AHqxdT4fvfOcf6skmhYYXnGAxZYU1T1RwvTJ5/4eQ/DhhcnHDAsfEXXpMemZbr1rNx/g==
X-Received: by 2002:a17:903:3302:b0:189:9590:4f98 with SMTP id
 jk2-20020a170903330200b0018995904f98mr19976056plb.148.1669959614175; 
 Thu, 01 Dec 2022 21:40:14 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 14/34] tcg: Add temp_subindex to TCGTemp
Date: Thu,  1 Dec 2022 21:39:38 -0800
Message-Id: <20221202053958.223890-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Record the location of a TCGTemp within a larger object.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 1 +
 tcg/tcg.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d207bc47be..afa18986b1 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -456,6 +456,7 @@ typedef struct TCGTemp {
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
     unsigned int temp_allocated:1;
+    unsigned int temp_subindex:1;
 
     int64_t val;
     struct TCGTemp *mem_base;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 98d51e538c..0f58013a5a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -928,6 +928,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts2->mem_allocated = 1;
         ts2->mem_base = base_ts;
         ts2->mem_offset = offset + (1 - bigendian) * 4;
+        ts2->temp_subindex = 1;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_1");
         ts2->name = strdup(buf);
@@ -974,6 +975,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->kind = kind;
         } else {
             ts->base_type = type;
@@ -1092,6 +1094,7 @@ TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
             ts2->type = TCG_TYPE_I32;
             ts2->kind = TEMP_CONST;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->val = val >> 32;
         } else {
             ts->base_type = type;
-- 
2.34.1


