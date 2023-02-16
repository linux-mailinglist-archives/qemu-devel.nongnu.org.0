Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7723698AFA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:11:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUeJ-0007WP-Rl; Wed, 15 Feb 2023 22:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeE-0007VQ-Vq
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:27 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeD-0008WD-92
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:26 -0500
Received: by mail-pf1-x42f.google.com with SMTP id r17so588120pff.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0MajgK0PLGz4vagnIHWmbxLdve4d+jZ1hP+nPlzQtEs=;
 b=ET5y+7oSOgKMsIvGXcy5ePPXva6bPq3m2wSLziv7LSfFCvO1agjLE79mpRrogHxOCD
 jxAWLNTXZx6O6u5n/cbF5tmz7EBtwu4J8oI4lwAuR3AWrdjgp3yCJv9vlQN5a7pQDH06
 7sr9DebKwuN8WbhDEi0lbvfnUKSYtx0haotMmoZbFLsuLa0Auwv0ejXFd6MR2bhdSLO5
 lgaUw1ekXPYKV4RFBhgusoRy2yk/1nS4RaLzWI2BIhTuNu1hOSbI7naZ4NN0DePlZlnq
 Ltzty+pn2QCJxLWt/n0s+zGcQyLhRMGruhRBp1kQ9RRM+VVShbgaU2F2X5ZkI21JnV9/
 7LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0MajgK0PLGz4vagnIHWmbxLdve4d+jZ1hP+nPlzQtEs=;
 b=oFAT0QQhPiLDQFyl6nIpuYFKuwTXTCfB91dRb/uKaoNZqnH6NVhHDIExBtR1i2RWBg
 pR33Z2QA4h9vl3p8eOclLY78MYhliCm4x1DJluoB2KU9jqxqWELsfVBR7dUkYvO8PntH
 H8bna1QVA9enWMPWh4mjRvCHZvItNAUcvSXOUTJf9ZtKpjpe+1u4qzBSSIkhyw8v0cvD
 je9MoTHQCnwgErZR4OXV8OKrFlJsnxUhG9sPCAzJHOJE6Zsi8qzVjazTZcLDxb7gXFl0
 w05Exp3BvUquR+mAlTb1uMkn4qbnK3CYZaWozbhTdLYa8ZVHfwH9PX6cMt1niFM1QFnm
 5f1Q==
X-Gm-Message-State: AO0yUKXnnMPX/0D21ut/+xnoVw48t5U/ryAKE0q4YfHBHW7Pj5DT0ntg
 Igfj9ildAzgYa6w3cfAh2LRYZvRfN2PSea68Gz0=
X-Google-Smtp-Source: AK7set+afGiX1L9ktWzcQHw6hNqoW4kfRUlNV8j0kEePNi/RUo15vqgIEDusZ09am0hyJongI3T8fw==
X-Received: by 2002:aa7:9626:0:b0:5a8:c444:d3e5 with SMTP id
 r6-20020aa79626000000b005a8c444d3e5mr3639432pfg.4.1676516964414; 
 Wed, 15 Feb 2023 19:09:24 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 18/19] test/tcg/multiarch: Adjust sigbus.c
Date: Wed, 15 Feb 2023 17:08:53 -1000
Message-Id: <20230216030854.1212208-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

With -cpu max and FEAT_LSE2, the __aarch64__ section will only raise
an alignment exception when the load crosses a 16-byte boundary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/sigbus.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/multiarch/sigbus.c b/tests/tcg/multiarch/sigbus.c
index 8134c5fd56..f47c7390e7 100644
--- a/tests/tcg/multiarch/sigbus.c
+++ b/tests/tcg/multiarch/sigbus.c
@@ -6,8 +6,13 @@
 #include <endian.h>
 
 
-unsigned long long x = 0x8877665544332211ull;
-void * volatile p = (void *)&x + 1;
+char x[32] __attribute__((aligned(16))) = {
+  0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+  0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10,
+  0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18,
+  0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20,
+};
+void * volatile p = (void *)&x + 15;
 
 void sigbus(int sig, siginfo_t *info, void *uc)
 {
@@ -60,9 +65,9 @@ int main()
      * We might as well validate the unaligned load worked.
      */
     if (BYTE_ORDER == LITTLE_ENDIAN) {
-        assert(tmp == 0x55443322);
+        assert(tmp == 0x13121110);
     } else {
-        assert(tmp == 0x77665544);
+        assert(tmp == 0x10111213);
     }
     return EXIT_SUCCESS;
 }
-- 
2.34.1


