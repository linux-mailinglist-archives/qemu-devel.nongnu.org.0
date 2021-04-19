Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE34363B3D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 08:03:32 +0200 (CEST)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYN0N-0005VF-G4
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 02:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYMyp-00048c-6f
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 02:01:56 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYMyk-00043X-5z
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 02:01:53 -0400
Received: by mail-pj1-x1030.google.com with SMTP id lr7so1127269pjb.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 23:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hI6diI03YN0gzsP1zG7SKXRSFTBjgNgh2fgUlPSLQb0=;
 b=TtD6G8PlN+UjSivWpXHjZTEg/27kXJsnDyCxNvW1+QHouWwVL9D8uHR+n3OSV10YTp
 BMv2NZoxjnkGFOW3mUz0UR74t9rw7kfyZOStixkzXm8UUie2qG7hjhj7gz+UIQQwz3/R
 Dra74kRjYjQ4EKP1EXETYqo6TrfY8oAJ2oL/ImA6TNw8e5chE+6/4Iel61nEdfnjPZ+Q
 jbVOr7/V95o6WTKC6WY4/YMXngCSDoXEqv3+YrVXLQPmXGuu09ymqqYoFgxpJUePgPlk
 jm0Dle01lAzQfcuNe57TJbz8mtMARTuNuTxRIGcM8+g5jt7k2JC1/6gM7alYo/2RMZEy
 8lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hI6diI03YN0gzsP1zG7SKXRSFTBjgNgh2fgUlPSLQb0=;
 b=MXPu5krnDFFdRnue6SYVaM+jcdVlcjF3KSR8Xe9IlSYfuIQ/VQNPs+e2GaG86rAB2g
 GGJxrQw1+TEfOyM1PT1KnZqQyFUS+Sj3BWnelotJycylMJVr8AW76sBUlXCnCMp8aaxU
 JCBEuCMPnu+osvX9xPhcWQ3WBQrKeoYb+fjKJSmSkXDcYSO+fHvrO12YInb3lD1o5t8z
 SBEds3bsPeSmOgtAayVEaQ+pnsZQKAP7U8/LJYY1AUi0Gz/Kb0qfnxx5fT/BaH54Z7lC
 Ghg2BGZXE27GeLWY+DABY5bZFMIiX12q9Xv56p2XKarjYNjO1/iQcG01KeH1pXSSaKuD
 Ej+g==
X-Gm-Message-State: AOAM531o0IIbON3QViISds+fSvFX+7PoH5Ahwpgngo5aBGYJUCvzPka+
 JK25qXxhvKsF0a4x14f9939Qrq25CmR+AY1W
X-Google-Smtp-Source: ABdhPJxALzSb/fRjFn8vxojaley5kI/If7nqtKMeYv8HNXrc4NUZrkDaKjMnRAdHhpVOM7t7lZEFHQ==
X-Received: by 2002:a17:90a:f3cf:: with SMTP id
 ha15mr22864257pjb.214.1618812108381; 
 Sun, 18 Apr 2021 23:01:48 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v1sm11162911pfu.6.2021.04.18.23.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 23:01:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: fix vssub.vv saturation bug
Date: Mon, 19 Apr 2021 14:01:44 +0800
Message-Id: <20210419060145.11152-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Doing a negate (0x0 – 0x80000000) using vssub.vv produces
an incorrect result of 0x80000000 (should saturate to 0x7fffffff)

Fix this bug by treating zero as a positive number.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d281..356cef8a090 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2451,7 +2451,7 @@ static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     int8_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT8_MIN) {
-        res = a > 0 ? INT8_MAX : INT8_MIN;
+        res = a >= 0 ? INT8_MAX : INT8_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2461,7 +2461,7 @@ static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     int16_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT16_MIN) {
-        res = a > 0 ? INT16_MAX : INT16_MIN;
+        res = a >= 0 ? INT16_MAX : INT16_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2471,7 +2471,7 @@ static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int32_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT32_MIN) {
-        res = a > 0 ? INT32_MAX : INT32_MIN;
+        res = a >= 0 ? INT32_MAX : INT32_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2481,7 +2481,7 @@ static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     int64_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT64_MIN) {
-        res = a > 0 ? INT64_MAX : INT64_MIN;
+        res = a >= 0 ? INT64_MAX : INT64_MIN;
         env->vxsat = 0x1;
     }
     return res;
-- 
2.17.1


