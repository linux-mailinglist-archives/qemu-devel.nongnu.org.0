Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA26593A3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:12:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2re-0003BG-SH; Thu, 29 Dec 2022 19:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rQ-00038X-Da
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:58 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rE-0002hW-RG
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:46 -0500
Received: by mail-pl1-x630.google.com with SMTP id d9so3610320pll.9
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4mfBOAV47I9uDw1GwX1iov09oIqhGRSjo/+SK90rAOA=;
 b=gA4Reg9aljPMHew++LsgaVhcrWXzrMcffDzRz/8FszHAySzSnqyV8Z6O/VOHHtWE+B
 R3+BArYUfIRPjii4FJG2EKt5XGw64XFsFNx5g5Xf2mW9XfVNr0FeRje4cs+7GMrtgUAF
 YjzfbLfRVkosDPqycsoTEHmKGlcS9mQac8SIuxn/QJSiPDkVBno+v5O3CZFIkSKaHdpA
 AMoznYmt46uzhupUFbwEgcJnr/L+g7C2HA3w2OkKRF+3TjuFC2z8JoBWBY5WZvGUMLgO
 o+OFtIqLJ4+nEW9a+YFmZFEcbOKjP3pwdDUiJ1yBEMEYAHZwatY15pKJAHIDlCBj/WXA
 6j1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4mfBOAV47I9uDw1GwX1iov09oIqhGRSjo/+SK90rAOA=;
 b=uB3amRcampyZoJjax0iMIMfTiKqFJw5A9k7wrIVgrokTb6AhwRSuQ0NjVEAaNIXIA5
 e1j92UnfK1HQNHJ6fZgzG9ZDL0NtDsRMyIcLz+j9H/Z9+5fXZWFQ1K19uZKN1Sg6oRjv
 9vl4laYMtNnfjakTw7SW5dIgZb910IG3/KdjwrabtbAjupNbT7a4C7qShzWeB+MqcFXi
 0A2oX7zZiESH4I/XDqPSuFhcl5/A7bsXCIGvn7tu7F1jyir+S+0ek+UYDafMK50LuzQe
 KsPstTC9ZyiFDDShPk0f//+eC9hhYSPkgaJgkLFKzpZZGonje6xjkVbfteCQTVQXRfv4
 3/xA==
X-Gm-Message-State: AFqh2kpScgQ9fVyJp+qSqfy8Jf1j4yG0FuE2hi2atOcWiSoUVgCYg/cQ
 uyzkcsAlb9UJ9ftqmPDbMePVvFUPS3wV+n9Y
X-Google-Smtp-Source: AMrXdXsNn71ypMxg+lUWXgfDZX3r2UJ0tL1ItPcP60HfNiJ6Az69zjLyQsuPaHvzjHjXNAqRbEQMaw==
X-Received: by 2002:a17:902:f609:b0:18d:dd85:303c with SMTP id
 n9-20020a170902f60900b0018ddd85303cmr54180049plg.8.1672358564031; 
 Thu, 29 Dec 2022 16:02:44 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 23/47] tcg: Add temp_subindex to TCGTemp
Date: Thu, 29 Dec 2022 16:01:57 -0800
Message-Id: <20221230000221.2764875-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
index e7570ecb4a..4f2e05c69e 100644
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


