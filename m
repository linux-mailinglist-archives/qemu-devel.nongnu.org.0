Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDB86400C6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:58:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuA-0007aO-OF; Fri, 02 Dec 2022 01:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu5-0007Z1-Ms
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:09 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu3-0003ez-Ua
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:09 -0500
Received: by mail-pf1-x435.google.com with SMTP id q12so4065485pfn.10
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tv/8rjnBa1lQCKggJRD9/FDpkd6opAc1OcPOojf8ueg=;
 b=s/9SlTRAiHj+FLgJerGqkfrwBk63xbvPcrjzMGtdD1S12LzVZOwzOnCIYyQg4AC7On
 n+1ylS/y7XIehRF4Kw0JMQItLPFKlAl8oG1vjHf0g4WbnnAIW/i7XiKrnMP+Wpl9SsX2
 b9Gp3SP5nJJ6VkHoDfXaFkvuaBNu0s+JMbMVQugc6AsHjtez8DpcfW19H5e7AZxgYilR
 zjHgy+7zA6wxXfrlJ55Gf9TjwGgMYvOzf6rzcj1hPmK1LzZ/rmENeXHEQ0nDZeWYHmng
 X9LlJYBNXvyIXOo7VvvNZonix+RiwhW/FzxvWKNUC/ZkuEaqSnvx7QKmcxxf+/88uoK3
 IcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tv/8rjnBa1lQCKggJRD9/FDpkd6opAc1OcPOojf8ueg=;
 b=5RY6UQ2gsmyoVu9n4R/z2CJoQF3iN/CX0uqx2FZvouK3cz1+QgIeNq7Cx9YG0MOw4s
 WnW56J9nonX77qjku9q9suI3HA/gxROIPqaZgovFlBE9o/LnVqPDiyvxa1T/xE6BOpug
 ari54IuaWuKikiJj1M0TEvzE7keU+GR60YUxfGVsxVR2WU7O1L7MJPBYt6QPu4qY6Lcz
 VYOvVqjSb8VXampEUlAw6fmXp5COHrYKlBAOjHbGRbABMYBXjz9N5wRJAXxKQY+NkybG
 2qmHFIWmmEoQO7DFTfUinBuym13O0J60a/Ndo4G+SF9ZL01JO1MoZiv9R9FIMB8NZgpE
 Q55g==
X-Gm-Message-State: ANoB5pk2cvbdyIazbB31bC8ULY9FjL6kDt9HvnG7Gy39DPG9DuVeOcUc
 dLlepxe3zdu25ZX1xDmDSP5Wz4IjWQ28r90L
X-Google-Smtp-Source: AA0mqf6TJer94d44vMksMpCawa3bCb1kK25u5KIvOEjU5KLmIHRpwHanXFuzH3/yDJsXG6p8unv4KQ==
X-Received: by 2002:a63:ec07:0:b0:470:90f1:6216 with SMTP id
 j7-20020a63ec07000000b0047090f16216mr62050623pgh.42.1669963924674; 
 Thu, 01 Dec 2022 22:52:04 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 03/13] tcg/s390x: Use LARL+AGHI for odd addresses
Date: Thu,  1 Dec 2022 22:51:50 -0800
Message-Id: <20221202065200.224537-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Add one instead of dropping odd addresses to the constant pool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 8a4bec0a28..34de5c5ebe 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -811,6 +811,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long sval)
 {
     tcg_target_ulong uval;
+    ptrdiff_t pc_off;
 
     /* Try all 32-bit insns that can load it in one go.  */
     if (maybe_out_small_movi(s, type, ret, sval)) {
@@ -839,14 +840,14 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         }
     }
 
-    /* Try for PC-relative address load.  For odd addresses,
-       attempt to use an offset from the start of the TB.  */
-    if ((sval & 1) == 0) {
-        ptrdiff_t off = tcg_pcrel_diff(s, (void *)sval) >> 1;
-        if (off == (int32_t)off) {
-            tcg_out_insn(s, RIL, LARL, ret, off);
-            return;
+    /* Try for PC-relative address load.  For odd addresses, add one. */
+    pc_off = tcg_pcrel_diff(s, (void *)sval) >> 1;
+    if (pc_off == (int32_t)pc_off) {
+        tcg_out_insn(s, RIL, LARL, ret, pc_off);
+        if (sval & 1) {
+            tcg_out_insn(s, RI, AGHI, ret, 1);
         }
+        return;
     }
 
     /* A 32-bit unsigned value can be loaded in 2 insns.  And given
-- 
2.34.1


