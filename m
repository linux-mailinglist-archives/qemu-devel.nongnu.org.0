Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0FE55B935
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:39:28 +0200 (CEST)
Received: from localhost ([::1]:54552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5m9P-0006GQ-Aa
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltO-0002No-Dr
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltM-0004vI-HQ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id f190so4817752wma.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SSW/9q08rUws37xTPG8UfI9QgtPGrD6IO9sQdb0NX2k=;
 b=W2yxR1xch57VBaguafQmmfs2c0p4WG86/NpcjpWAEonP+E+ANG2pZkAYWWsz/Lgqz4
 ly9Qeiloc5fNLus41ynZaDyx6WRN/6hP9Nj/h8Z6m8xcZQJxu+eoExzhITbPok+1jNNX
 1L1RMiECDqcfshV1vQzzulYj4HQKS8/umpZoVqpPViM3bMvmzd8qtI4ZlEbLfLp35Wyz
 kFVhd5EXaxhI7sYFpFfIUk29kPvN5KnGPVm9XF9PfEyXIN9gBCNTfT5xQm5+WMmFOHFV
 ujVa31Z+cTkui86vRcqCXbkVuwXnIm87bRFIoYbkCZp0LyVqMeyJrPWRjJaPqXpJFRnk
 Q/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSW/9q08rUws37xTPG8UfI9QgtPGrD6IO9sQdb0NX2k=;
 b=M15ceqolUqA3Ekn0CF5f0BtY4AmUVUc+O0DtPj/Z6Z+i21n7OARvfh02CrJAkOVB9O
 sZ/P9QND+AqzMaipgzO8ENv7Hqk187pYXBmnALX5yZHt5WZheKuS5wJYhLPpFDnY4yb/
 sFrgya5QOoxn5g7sN+z129WLRn5+rMFCmfleX6xQnJTC9j++KM+DNj7UPXgvwGeFHoIg
 tsTwkXBIiU/f1UVmewgWS2TXz6BdhvFig+Bts9OAI0zknCwojGTeHM9Q4zD+WtwGZr59
 CmLuTtYafipsNXOg0GOr75sTzOFwGpLjkg66O9ZC8il3UB7kEugksqj1I+nMLjNBXFJA
 bz1A==
X-Gm-Message-State: AJIora8gdMWDcXA6EOHLR/hc6azfPPieHpru25stUhemn7uXB2JEYcI3
 rkg0EZdzn65d0GrHmXkH2ffJIWGB+T7LNQ==
X-Google-Smtp-Source: AGRyM1t213j4yOHWMsje9D2DP8RnZq9ffhdN0jVKWjwU8QL+/fG5TjXkzdo7FcL8Mvkc0Bzc03o+ag==
X-Received: by 2002:a05:600c:41d1:b0:3a0:301d:f75f with SMTP id
 t17-20020a05600c41d100b003a0301df75fmr19693095wmh.31.1656325371096; 
 Mon, 27 Jun 2022 03:22:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/25] target/arm: Generalize cpu_arm_{get, set}_default_vec_len
Date: Mon, 27 Jun 2022 11:22:28 +0100
Message-Id: <20220627102236.3097629-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Rename from cpu_arm_{get,set}_sve_default_vec_len,
and take the pointer to default_vq from opaque.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1a3cb953bf0..b15a0d398ad 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -638,11 +638,11 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 
 #ifdef CONFIG_USER_ONLY
 /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
-static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t *ptr_default_vq = opaque;
     int32_t default_len, default_vq, remainder;
 
     if (!visit_type_int32(v, name, &default_len, errp)) {
@@ -651,7 +651,7 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
 
     /* Undocumented, but the kernel allows -1 to indicate "maximum". */
     if (default_len == -1) {
-        cpu->sve_default_vq = ARM_MAX_VQ;
+        *ptr_default_vq = ARM_MAX_VQ;
         return;
     }
 
@@ -675,15 +675,15 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
         return;
     }
 
-    cpu->sve_default_vq = default_vq;
+    *ptr_default_vq = default_vq;
 }
 
-static void cpu_arm_get_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-    int32_t value = cpu->sve_default_vq * 16;
+    uint32_t *ptr_default_vq = opaque;
+    int32_t value = *ptr_default_vq * 16;
 
     visit_type_int32(v, name, &value, errp);
 }
@@ -706,8 +706,9 @@ void aarch64_add_sve_properties(Object *obj)
 #ifdef CONFIG_USER_ONLY
     /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
     object_property_add(obj, "sve-default-vector-length", "int32",
-                        cpu_arm_get_sve_default_vec_len,
-                        cpu_arm_set_sve_default_vec_len, NULL, NULL);
+                        cpu_arm_get_default_vec_len,
+                        cpu_arm_set_default_vec_len, NULL,
+                        &cpu->sve_default_vq);
 #endif
 }
 
-- 
2.25.1


