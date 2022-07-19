Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE43357A606
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:04:06 +0200 (CEST)
Received: from localhost ([::1]:60036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrZl-0002u5-SN
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrW8-0005nk-Iq
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:20 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrW6-0006AB-UF
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:20 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 w6-20020a056830410600b0061c99652493so7068130ott.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G84KLuP+strtKf2lZiqlyTltP5yjUze9lKDptIZ/K4c=;
 b=vKUmUIOHfqV/G4OEq2ih4MZVNeHeOlczU2RdHcy5qo7QtcOsMZiGhytB+aEciPO5Zp
 Ldlouv1t9BN7iPWLVMXmpKzvWIJLFj5qjeyyfIxCC87N7OTZ+GkOA0cjkLc4y0sdZGTA
 Zwgo/cKP/8Md6OUh8edD6w/iQ4kHw8gANiGURQUOFdRgZZTqhdzrqy3BjTWKVcTix1fh
 7fupQx+dlZGLJGDJ1NqlORKc3LfiS4b6z7IH9xQo8Z4Q36Ni2z4UNH0DG/vhQpPS/41/
 QVYND4XapTQpsa3jJFRrYywnbWuO6P7iL3ptbot3r4ccWFA6mbreOXkMNyGhN4ZOEJvT
 QR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G84KLuP+strtKf2lZiqlyTltP5yjUze9lKDptIZ/K4c=;
 b=CXZ5dLfAEk+QtDCqAeEGPn74NGwz/hXqRhPrr9Al/Gk2Yr32ZukfFdh0n5wDmAC6ge
 7Z32/XhmoetYcHVrTwKPbTmyVLDPYgvgfATAcuQTHl4iFNshb5q2a+l9hiTbFgZCbS3L
 uyJLAEG54fsIaRbsWDvtK32NaWPmZ1+64oba4blklhX6WgsQok3XaO0JkiVMyFsvy3Aq
 p6REjb47Ht8zUfLGj9449cVJyGXL1PoJYuWZPncSADNGmh8v50BLeZ2UXrekKCq3f1rf
 IOwabF0Nsv9TAUwlpDAzTpemycIU3LtuEZ6R8dSvFK8n6h19U0S3y9c/ydBx5iL0Ycfw
 XuZA==
X-Gm-Message-State: AJIora9Y+XOqJmfyQvztefQtOqxJkx/w5BRgqnuo3gvymcbr27Hmj05m
 IC8BcBerOVr6ChGhSJDx9/bxjxzoTuL960Mb
X-Google-Smtp-Source: AGRyM1uwIdkcP6zYUjzjgwroSOx21gkJJuam7QzMVMhyEoRe33JIzM+9ZIK7H8uf6gwdsTg5T8cn3g==
X-Received: by 2002:a05:6830:2b28:b0:61c:74e0:4d8a with SMTP id
 l40-20020a0568302b2800b0061c74e04d8amr12974318otv.329.1658253617478; 
 Tue, 19 Jul 2022 11:00:17 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 02/21] target/loongarch: Fix loongarch_cpu_class_by_name
Date: Tue, 19 Jul 2022 23:29:41 +0530
Message-Id: <20220719180000.378186-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

The cpu_model argument may already have the '-loongarch-cpu' suffix,
e.g. when using the default for the LS7A1000 machine.  If that fails,
try again with the suffix.  Validate that the object created by the
function is derived from the proper base class.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220715060740.1500628-2-yangxiaojuan@loongson.cn>
[rth: Try without and then with the suffix, to avoid testsuite breakage.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e21715592a..5573468a7d 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -571,12 +571,22 @@ static void loongarch_cpu_init(Object *obj)
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
-    char *typename;
 
-    typename = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    return oc;
+    oc = object_class_by_name(cpu_model);
+    if (!oc) {
+        g_autofree char *typename 
+            = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
+        oc = object_class_by_name(typename);
+        if (!oc) {
+            return NULL;
+        }
+    }
+
+    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)
+        && !object_class_is_abstract(oc)) {
+        return oc;
+    }
+    return NULL;
 }
 
 void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.34.1


