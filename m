Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FA363B2B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:57:14 +0200 (CEST)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMuH-0002oG-SM
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYMtT-0002La-4K
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:56:23 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:56101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYMtQ-0000OO-Oj
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:56:22 -0400
Received: by mail-pj1-x102f.google.com with SMTP id s14so12416792pjl.5
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 22:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=gcqCCC6OKs+bYQSdPy1A/MAjJhQLH5ZK4FDiW+OtHh4=;
 b=m7i3QgsaJ96KVn7aEBZPm1CPlxiTNpQ2UaD+eMH7mEHsNgW3DGyS1LaFFVZPX7DW0Z
 OVDqNtEz5f8O7zENBeRQzK8hz5X3QE26pj/HmnoXoV0ArTGMPKPh4hUy3MIwtuFrlrz2
 f0nXtIdwiibdxew3gct4E6euBJAHv82ACk+XcXjhhtdzrcz3b72mh6p+veVJLDfHETed
 TCH2onH9qNkTazJ8tcXpXsVHzMaGCZe8teav3DhnMqVRiBddvss6uZCTH0HofB8UcUW8
 y3LbdZxC5cMnf1+XcypFCmsiEf+oELsZfexwzR2qPWRWnPrpboXaGAYlDL9kWfaDs+mD
 fD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gcqCCC6OKs+bYQSdPy1A/MAjJhQLH5ZK4FDiW+OtHh4=;
 b=Hd1S6rnFOr6k5uGgr/DfJZsQaYExHDwFGkoB3kvX2/HMsjUMZa17xOwerJ7AuF2sip
 e4ZjGC3s7cO/vKLnFLQE+F+k/CqvdPh8JZNrzEzZ9IqK23Hs6SouoxM9aefxi/shqW5R
 VBL7CjNCWQRZn4ngrsDvUv0nBYw1FRo2acxEmAm0o0nU65bc0faC5cQRwZVx2gRB2m0R
 MEU7Bd7ZMQ7bgdupYcd2JAIkCzx/hhuGK/y2iL6v55MapzM1Q0j9m9zb0D6/sbXIMbvN
 E3Nj375M5pAAkj/4P1Dazf9VFDLkl+Kp2MiLawX3T68Lpo4dLa/jJPzJsGLFM8BzXJuX
 BTmw==
X-Gm-Message-State: AOAM533aW8Qmjf4NhnrSnrIAe24nG9GrwrvQpdOivc9QLL8vmCH5sWXn
 S3Jo2EyhI/6Ofsj9SfLavlTMAIfLJYMjGtVb
X-Google-Smtp-Source: ABdhPJx17sDxZtPdvUJ2wbvaO84l1FKVtm0RwtreNhH8rbfswHqqK5451HtWRDWd28pUFsy1dSBt6A==
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr21157220plq.17.1618811778196; 
 Sun, 18 Apr 2021 22:56:18 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id q63sm14066788pjq.17.2021.04.18.22.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 22:56:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
Date: Mon, 19 Apr 2021 13:56:10 +0800
Message-Id: <20210419055614.28361-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In IEEE 754-2008 spec:
  Invalid operation exception is signaled when doing:
  fusedMultiplyAdd(0, Inf, c) or fusedMultiplyAdd(Inf, 0, c)
  unless c is a quiet NaN; if c is a quiet NaN then it is
  implementation defined whether the invalid operation exception
  is signaled.

In RISC-V Unprivileged ISA spec:
  The fused multiply-add instructions must set the invalid
  operation exception flag when the multiplicands are Inf and
  zero, even when the addend is a quiet NaN.

This commit set invalid operation execption flag for RISC-V when
multiplicands of muladd instructions are Inf and zero.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 fpu/softfloat-specialize.c.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index c2f87addb25..9c37265e20b 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -624,6 +624,23 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     } else {
         return 1;
     }
+#elif defined(TARGET_RISCV)
+    /*
+     * For RISC-V, InvalidOp is set when multiplicands are Inf and zero
+     * and returns default NaN.
+     */
+    if (infzero) {
+        float_raise(float_flag_invalid, status);
+        return 3;
+    }
+
+    if (is_nan(a_cls)) {
+        return 0;
+    } else if (is_nan(b_cls)) {
+        return 1;
+    } else {
+        return 2;
+    }
 #elif defined(TARGET_XTENSA)
     /*
      * For Xtensa, the (inf,zero,nan) case sets InvalidOp and returns
-- 
2.17.1


