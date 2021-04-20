Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA29364FDE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 03:33:22 +0200 (CEST)
Received: from localhost ([::1]:38600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYfGT-0003oc-HB
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 21:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYfF6-0002xV-7d
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 21:31:56 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYfF4-0006ev-Kh
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 21:31:55 -0400
Received: by mail-pf1-x436.google.com with SMTP id p67so19479910pfp.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=UNUuA/Culgon66fOzzg1a4dNV1+/D++sWBiWxJ7kOjM=;
 b=EcydkXCoXT0EWNRbqKgonPVhvC+/1DITDZw5BqhRYt37bYX/ZiRUd3BlkZXzQkHp8P
 g5AYyYsx1qV6sDkfFut5Ne+mGyjqy/uTJ38UTO790wTHKgUtmyQEU54CVvS3JRUDG+l9
 /A8Jrc2MF9q3ChmnlIGxAvCp9c7E02Y2JpDPVH7gk28ZbBCYrMQ8q3axsuZ2aFnOYwwI
 0wRgG2gZ+Pd8plcs7/9pppqVT/xhzcZX5vUbf587AkyP6OMWMKgjiHBOTLATvkqUFpmt
 nEr+Vr0h5yW9Axg90wfdjbpD5cH82n8cnV1lSJJyzvemMmeMtFee3SE9/4qmt5zjv0n/
 kCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UNUuA/Culgon66fOzzg1a4dNV1+/D++sWBiWxJ7kOjM=;
 b=aYZrVDCFID2gqNZ9pNbc2uJ45TjzPwhDy+1GydPgxvPlZyHalIIHNrD9nTD09FpAIo
 OyaPm1VxYWjNbz1Lq2Sl4ipxr16b29+YfhEftC69YQ87fwDxU1mGBaNhHrxnM8aLCbcI
 z/SLaWOH/e1rgCkXiY1xsTtGX0U8SnnXd9lI4KnhLZpG1Y43bg8zE/lI1CugqpzYvpfA
 ehbs3CRDhg/hmg7T8jYfCV/IOGNPj+jU+iN9xjWYaWyWZPdcyo3hia9k1v/ytJuiP7bz
 x+POTwbbTZCNKMROE0LRhvigtgz8Js90N6f6EjlRjT7izbSnB3DXl3BVsXtoy568RKZS
 FVJw==
X-Gm-Message-State: AOAM530qsJtuoWQxwZWbXp4O7HDkZJqpDF2vKZIN7wnCvd/hSFdlhHdL
 dHdFUNAnB7ZdUv1/8pyDAhAtSQlkozis5QPK
X-Google-Smtp-Source: ABdhPJx8m0Zp5BTHdKZcUiUmOnnGkyro3yrB1bxZ+pNtF19uwrBm1fLi4Te8zQ3CqVKLZihWRdfOjQ==
X-Received: by 2002:a63:e5c:: with SMTP id 28mr14286129pgo.365.1618882313074; 
 Mon, 19 Apr 2021 18:31:53 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id o15sm577529pjk.48.2021.04.19.18.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 18:31:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
Date: Tue, 20 Apr 2021 09:31:48 +0800
Message-Id: <20210420013150.21992-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
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
 fpu/softfloat-specialize.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index c2f87addb25..12f29fbfc5e 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -624,6 +624,12 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     } else {
         return 1;
     }
+#elif defined(TARGET_RISCV)
+    /* For RISC-V, InvalidOp is set when multiplicands are Inf and zero */
+    if (infzero) {
+        float_raise(float_flag_invalid, status);
+    }
+    return 3; /* deafult NaN */
 #elif defined(TARGET_XTENSA)
     /*
      * For Xtensa, the (inf,zero,nan) case sets InvalidOp and returns
-- 
2.17.1


