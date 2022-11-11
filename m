Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72747625543
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfo-0006RJ-Nl; Fri, 11 Nov 2022 02:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfR-00067p-If
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:37 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfN-0007o0-JZ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:36 -0500
Received: by mail-pg1-x530.google.com with SMTP id 136so3817589pga.1
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5d0cgClQHZWZcoNMsH56nPEAX39ZERzh63wDTrkWF4=;
 b=MMoivuhkxqP5XU35eSKnGEo7XRVxMsauuPnLP7MQhnTI8kanW0fMpKWcAIKEmfAx12
 TQxZhEhG6j6RxF67whhMkY1a7yZDteL+xqP4eEJqf4H6PSDI2yNGrszAb3XyQwjwqMdx
 imh2x30u1NsjG63dqMRyBHFMNFeKuXhiibMCI8y7s0LgrdN7rQ2BUkt6iBYUBsmOxTtu
 I6k1EkqnG0GMRY6o31s6PynuYjOzfxEczAwc+8HUjVjzdMOzMX/x4LOAwLpPSkFHlRX6
 0Et05Ff1O90yyyrHxVwyfU9CO0tcO/fUeRm5okwOqKG2V07ED7dboHDG9EBeQ7hhbFhm
 zSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5d0cgClQHZWZcoNMsH56nPEAX39ZERzh63wDTrkWF4=;
 b=hwnxnL1uifIXjwmD5ang9KTjvP1TIKrxpeBWKuVBIL54NtF7kd6MMBWryKYE7DcmYI
 aei8qj59+vFPyWNeF/iCx9jchpLupDE9Sw22bJvsMvsD06rS2/rLrUR3nSbZ63cNEdOL
 UfziMEG664MtNDg2EL1l/WPU5i2qyrlzC9yDBbIwYANZtMQRYnBNMiAkGSj6VMgTvF5i
 4qCdKwNdcAWzdmcVTgV6HUGIkijnUIlfxPttE+4lSFBHaA2M0QYgii89qaJKSb/VCeKv
 FUvQArmQjDpKYYWWOZrhhmiYVdIP+J7/0j07MyXJk3DT3bkVEvrwZJl00Uv/rR5k4JFL
 nshw==
X-Gm-Message-State: ANoB5plHhC3Nn9P1hsPHwPXsvwchGwHV+FkVJDTv6oMI+Am2+bLkAox+
 ip+M7XUP988ywhjhDLMzK+nke8KeurW3+M8l
X-Google-Smtp-Source: AA0mqf6vO+Ml0lh+YuHGQGvQQQAnsoe3agd1pDQzWiMAS0+65UIvPGtsf5cBwW8gtQOqENZxiGdYDw==
X-Received: by 2002:a63:4c26:0:b0:43c:969f:18a7 with SMTP id
 z38-20020a634c26000000b0043c969f18a7mr690478pga.12.1668152491681; 
 Thu, 10 Nov 2022 23:41:31 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v3 10/45] tcg: Add temp_subindex to TCGTemp
Date: Fri, 11 Nov 2022 17:40:26 +1000
Message-Id: <20221111074101.2069454-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
index ae7516627c..a82c291369 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -927,6 +927,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts2->mem_allocated = 1;
         ts2->mem_base = base_ts;
         ts2->mem_offset = offset + (1 - bigendian) * 4;
+        ts2->temp_subindex = 1;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_1");
         ts2->name = strdup(buf);
@@ -973,6 +974,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->kind = kind;
         } else {
             ts->base_type = type;
@@ -1091,6 +1093,7 @@ TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
             ts2->type = TCG_TYPE_I32;
             ts2->kind = TEMP_CONST;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->val = val >> 32;
         } else {
             ts->base_type = type;
-- 
2.34.1


