Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF68655BE8
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:10:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOz-0002es-7K; Sat, 24 Dec 2022 18:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOi-0002Nz-96
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:49 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOf-0006Kj-Rq
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:47 -0500
Received: by mail-pl1-x636.google.com with SMTP id m4so8047257pls.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dgmD8yUJnIF7Ep3YQaKEZ2wvp15A3Cnw31rhHlanTU=;
 b=m3H7dc98BF7DX867RrmDfoYxf914v6tlrVq4fdc3HJkWHgpzn5x/VuxOLO2+YgPiat
 6F3+fA1vyB+qqLEtNAcItoLjj2zLIv3kt3Ys/OdHXBtBtiMmQa8m/ddvQtRaYUnh1EGT
 yVhFop7QOCwIWd8qDgOCVWHaHLrggmMC6mbdx8OXdYLJdVa7pe26BjIWaBdb7qA8E2N6
 rf4lgrIvSw6ZGdruLCZZ58hluetLqxdVoz4Vdz6mpx1hshhtNicDA4P5pAG49a5JoA0R
 TrD8a4FDChWSbcTyOYww/3K+PtCssUO6eXXI7GmNH+PeTBmUQTUlzg4ZEyD20ILnyZub
 2arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dgmD8yUJnIF7Ep3YQaKEZ2wvp15A3Cnw31rhHlanTU=;
 b=RMxUzXw7OZKJOu97+nLRP2Fw3vVr5A3aP0SoZy34yGgeQ28HprfiZujD05OLR6HOfK
 1sqdY1u+bsx2jb2+rypcYYmu7WCp8/28tKHRYcoMW6jfQojAxeU5jexM43AZwMpR8+T7
 FQK4IIKg9AqIuSVojhBzQg11j67YsTLUsUs1HE+rCYPgOlJMmqlNwSSPThrKIAW5IOnD
 EaoTbLL15fPnuvTMMKjYPHLyRY494MR7SAALmQQIWaqq24QcVS3cAQcDK1bTV619vvji
 vWfVfMgOBdXdXmqw40rZqq/67q+iCWaaV5OfZwT3ZTwQL7NTr8fQB+V5e5U0gjxhcMyU
 9uMg==
X-Gm-Message-State: AFqh2kqdv2CyJJj4OovULlIBSRec6LW+56tkCexEPOUF7vRu2QFaiYYM
 f2NRxRq+S3AeCZLsydlicEoBrfaort1LLl2I
X-Google-Smtp-Source: AMrXdXuO0ZeW8v5XxxHnunxcY3Njt0wp6uxlKhv0k/CtuFAaKjb4P1KYLP21pWlnvw7UJIp2/oARRQ==
X-Received: by 2002:a17:902:f392:b0:189:eaae:a19c with SMTP id
 f18-20020a170902f39200b00189eaaea19cmr13656512ple.30.1671926264366; 
 Sat, 24 Dec 2022 15:57:44 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 23/43] tcg: Add temp_subindex to TCGTemp
Date: Sat, 24 Dec 2022 15:57:00 -0800
Message-Id: <20221224235720.842093-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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


