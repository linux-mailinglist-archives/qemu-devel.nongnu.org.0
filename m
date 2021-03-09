Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F217332BE9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:25:58 +0100 (CET)
Received: from localhost ([::1]:35960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfBF-0001ru-G7
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefZ-0004he-15
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:13 -0500
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:33146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefX-0001Dg-6w
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:12 -0500
Received: by mail-oo1-xc29.google.com with SMTP id z22so3154595oop.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8m+kPJrwSHSgZI1ZsSaQYwfuJiZGGIkk+6qenqcdxQ=;
 b=DVBatS4uHOEePkc1+sb5+culBSF0ivazk2U8JOPBUicIKJvPooaMM6CxmqOzlwp75S
 oW+yETusDI0Y2DS8Qe8RgkwixqhwI3g5tgCbZYbsgcXip5W6O+qqX3BlII9Gc6dydHiS
 72G2QcVxhlBY5Z1LAr8P9AebGc4gJ7KonsZZckG1t4vFoA2GMZy+x/891PzA+bge9lKz
 Vn85W5xbmwxpD0ArFtRCpXUqve2+7L5mcadWHIgZS4dPVl1gLjSlg0+VcBsiHe9VMAWp
 kuo6QNn9BTO3P2IvvSWRFb9uFtW68i67oZJfYhH58dctwwrtIdw1DUZkX0lT9LZqiQgA
 jLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K8m+kPJrwSHSgZI1ZsSaQYwfuJiZGGIkk+6qenqcdxQ=;
 b=B40depC2g/pcy2e3rnUuuIyl5s+ntmjntB4pEMcj+uG4JQ8dfBD5MfEWHUlcah48M6
 RVwIfYynNwO2hAS6W4tAs1q6+6RidTgkemJ2o+N6aFHXWVnPD4MGyme8OgC80h2C2hYm
 Ynn0nYzN42uBbWmsBiTQ1nbRQAihrmeQnyXzDhHI7GdAj7lCXZzEtlhD/I47GDEgyOAp
 xyiMGzpqWozD3JrRTiVPG5hCUbuO2tXrRgxj1Fm3XfcoQVs6HIrmepKwK4YWLcl/Go3i
 UH+PgEy2ffVyweI5d6myMCuQoRCn2Q7Qwg1NePIg+8iX4bQ2klNuwd9vFQigheQbAqIj
 ELpQ==
X-Gm-Message-State: AOAM531cThjX/tVYGH1rFjyKPIOcKTmKZwRQ8eWNynXUdeiN05VOjOPe
 zSpxEI/XtpeZUJAs1LO2EgHmcIsABx/WHlcW
X-Google-Smtp-Source: ABdhPJxFi0ukYcer/RbdE5lGgMaqJFAOyVcJ0hPiTENlRr/XsD9rR2WZfYKMIx6v8uzfpNr51Wirxw==
X-Received: by 2002:a4a:d2cc:: with SMTP id j12mr22689288oos.56.1615305190198; 
 Tue, 09 Mar 2021 07:53:10 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:53:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/8] target/arm: Fix sve_zip_p vs odd vector lengths
Date: Tue,  9 Mar 2021 07:52:59 -0800
Message-Id: <20210309155305.11301-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrote too much with low-half zip (zip1) with vl % 512 != 0.

Adjust all of the x + (y << s) to x | (y << s) as a style fix.

We only ever have exact overlap between D, M, and N.  Therefore
we only need a single temporary, and we do not need to check for
partial overlap.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 11c9397dbb..2fb4b2c1ea 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1871,6 +1871,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     intptr_t high = FIELD_EX32(pred_desc, PREDDESC, DATA);
+    int esize = 1 << esz;
     uint64_t *d = vd;
     intptr_t i;
 
@@ -1883,33 +1884,35 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
         mm = extract64(mm, high * half, half);
         nn = expand_bits(nn, esz);
         mm = expand_bits(mm, esz);
-        d[0] = nn + (mm << (1 << esz));
+        d[0] = nn | (mm << esize);
     } else {
-        ARMPredicateReg tmp_n, tmp_m;
+        ARMPredicateReg tmp;
 
         /* We produce output faster than we consume input.
            Therefore we must be mindful of possible overlap.  */
-        if ((vn - vd) < (uintptr_t)oprsz) {
-            vn = memcpy(&tmp_n, vn, oprsz);
-        }
-        if ((vm - vd) < (uintptr_t)oprsz) {
-            vm = memcpy(&tmp_m, vm, oprsz);
+        if (vd == vn) {
+            vn = memcpy(&tmp, vn, oprsz);
+            if (vd == vm) {
+                vm = vn;
+            }
+        } else if (vd == vm) {
+            vm = memcpy(&tmp, vm, oprsz);
         }
         if (high) {
             high = oprsz >> 1;
         }
 
-        if ((high & 3) == 0) {
+        if ((oprsz & 7) == 0) {
             uint32_t *n = vn, *m = vm;
             high >>= 2;
 
-            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+            for (i = 0; i < oprsz / 8; i++) {
                 uint64_t nn = n[H4(high + i)];
                 uint64_t mm = m[H4(high + i)];
 
                 nn = expand_bits(nn, esz);
                 mm = expand_bits(mm, esz);
-                d[i] = nn + (mm << (1 << esz));
+                d[i] = nn | (mm << esize);
             }
         } else {
             uint8_t *n = vn, *m = vm;
@@ -1921,7 +1924,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
                 nn = expand_bits(nn, esz);
                 mm = expand_bits(mm, esz);
-                d16[H2(i)] = nn + (mm << (1 << esz));
+                d16[H2(i)] = nn | (mm << esize);
             }
         }
     }
-- 
2.25.1


