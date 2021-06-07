Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF1939E9B4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 00:39:02 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqNtd-0007Tk-44
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 18:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqNsu-0006ni-Oc
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 18:38:16 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqNst-000316-Ad
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 18:38:16 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso978800pjb.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wHu2qa61wxcTPBbLqtde1CTPIw7+XCGrGTMr7yCftB8=;
 b=IKWVbGdJz1uxAwKxabTSU7v1Zx/LekAC9/rrugpMAlyWBhaFf91bTYmdDE734yYHEI
 65tRCx0l2ZLSGE/3Xa81Mdq4HLiTHBThVxxnpLyix0Bck+HZbVOmblszWqx7CIhas+ls
 GtPimzK0bXNwkfA3Rzz6eINxzVEMb9RTJ3oWx34Z4oEFid1eTeHX4jFfUpKYFOZbHiD6
 UjzBZA7Ss9AwVShqQGFXTwUw8ppzrq43KyJARELUlEO3uUAYN8zaL/is9q4JMwiFRbt0
 hFQ4YUdZPlQrPkKCqoyI4l+AjRS1UvuWahK7+vx2LAgtdFP+fkBel87QrR8baBWv1swI
 Qp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wHu2qa61wxcTPBbLqtde1CTPIw7+XCGrGTMr7yCftB8=;
 b=QWIF7aK+RjEsoUKzuZGv6KQDQL5DAom8XXEoYPyrMLmf0weCE+8mRGQWJPNbPUSiEv
 c038VnMScykiKgEN2gkeA1nz5gRd8V9gukIEDPz/LLZR1XdkKrNwSamkXFpJ5+aPF46e
 /0xgfidCofIJM29TuY1x5zeyZzggFGR/NSgcpECbAz5VpPwFYV3TMANvd/R3iU9z4vyl
 KHuWmFR0gkNYVhLhVP4T9Do+PZPctrB5RNcI1pc7kRS8P7ZRsvzcUk4JVyexG8jJlQDL
 ljn5IUrLTMtXbqAS6ellej2NhqEFiLkZc5ZsXMj9/54WrngKhD45N4owUioTlyqOPzPk
 +zCQ==
X-Gm-Message-State: AOAM530QyvNJS2hYqOTc2oO8WMo/jBQbHUY6cyDZ+7qsmIokUkNb9uqb
 EvmvVauKfCwdBZLXhDzD7yBUA9TDUFoMew==
X-Google-Smtp-Source: ABdhPJyU3dQAcYvXTg3m42wh6uhdZjpiQTx54URG5OGyj5gNbyRwNX8kuCmi3GbTDxC9M67Q7R36qA==
X-Received: by 2002:a17:90a:520f:: with SMTP id
 v15mr22374453pjh.23.1623105493387; 
 Mon, 07 Jun 2021 15:38:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id j17sm8955223pff.77.2021.06.07.15.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 15:38:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] softfloat: Fix tp init in float32_exp2
Date: Mon,  7 Jun 2021 15:38:12 -0700
Message-Id: <20210607223812.110596-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo in the conversion to FloatParts64.

Fixes: 572c4d862ff2
Fixes: Coverity CID 1457457
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 1cb162882b..4d0160fe9c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -4818,7 +4818,7 @@ float32 float32_exp2(float32 a, float_status *status)
 
     float_raise(float_flag_inexact, status);
 
-    float64_unpack_canonical(&xnp, float64_ln2, status);
+    float64_unpack_canonical(&tp, float64_ln2, status);
     xp = *parts_mul(&xp, &tp, status);
     xnp = xp;
 
-- 
2.25.1


