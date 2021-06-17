Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FD83AB3B6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:37:25 +0200 (CEST)
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrGu-0004t2-Lj
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx3-0001cx-84
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:54 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwu-00070Q-8E
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f2so6506711wri.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LqoTp3jMlRSR9bdF6Dg8iV0VxlX7b4D2jVB6chB7grU=;
 b=kqcvUhBLWwRgkpH65VurZD5mtkMoTayHJZvNIOePS/X+j/JrtytpiqnqEO4vu3UU7L
 W6IKVHHv7SuIKIO3DlmCc0j7kIbfWY88kHr9nm9cMhlcfDqXFSTN8iKdX3hl4tuH4dpG
 P19ZB43L7r/oAPaURyfBPiQZPpmBbS4R95QqHc869L4XoeeFnBW/p99sgCLpQZbqq9O+
 Q8cEoW5JhK5fREiKeb1sBSxg9VR30s5VJ7FdTiSgatgmXAQDEd0CLKbpaeD+o/mT7//W
 fttwCmof6p2RnIclcZtvIymP719GZihG28Zd4KYtWD4+cV2b7jNeWA+UehAcPGvsQNE1
 idRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LqoTp3jMlRSR9bdF6Dg8iV0VxlX7b4D2jVB6chB7grU=;
 b=FCKE0mIS5b81+f1i3X2lVAd42irdoT5ZU8qirPns3RFl34b9CbflSeQBDdh4eSs7Nq
 2LxWCTD0wLrv6mpNafHUzzN2tsm/F6XWjsXm5BVtDClq9dXk2QSxM3o7bsDXJlM0Rqu4
 yfDVuEcJ5Abs1xjJn/CG80A+tBFuKodHvtUGh5A60nW5B1su6pU0RztxFYrq/KI9ndhg
 VsybhD1Uhsl1FJeoL1eWIFmKLOlffA/5EOUMVTcvf6logxp/nw7bSf6zHQddgmqB9DBg
 nB75/6YFJHp9r2bO9CnGJuhAt7ycA0/m8scPBbY8t68RPUwLfE+/fHMa1SUn8DIvNcYs
 vFrQ==
X-Gm-Message-State: AOAM530/4TLDQ06NmufQk01KuqYoSk6m2z2YPwAc66NuEXGncwhyUONt
 u4C4uIP7jzWbTNkZcsbPxIzK9g==
X-Google-Smtp-Source: ABdhPJzWl1iZK8OTpEaha2xeBXEAAVPA2SJD1mXsKxCPM9RykmeUIgG44+GxmeS8O9ypsVI/T66u9A==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr5378506wrm.229.1623932202902; 
 Thu, 17 Jun 2021 05:16:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 16/44] target/arm: Implement MVE VABD
Date: Thu, 17 Jun 2021 13:16:00 +0100
Message-Id: <20210617121628.20116-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VABD insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 7 +++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 5 +++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5181d3b9413..5cd4e7d736d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -109,3 +109,10 @@ DEF_HELPER_FLAGS_4(mve_vminsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vabdsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 42d5504500c..087d3db2a31 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -93,6 +93,9 @@ VMAX_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
 VMIN_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 
+VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 888d74d5b1c..65141221b63 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -439,3 +439,8 @@ DO_2OP_S(vmaxs, DO_MAX)
 DO_2OP_U(vmaxu, DO_MAX)
 DO_2OP_S(vmins, DO_MIN)
 DO_2OP_U(vminu, DO_MIN)
+
+#define DO_ABD(N, M)  ((N) >= (M) ? (N) - (M) : (M) - (N))
+
+DO_2OP_S(vabds, DO_ABD)
+DO_2OP_U(vabdu, DO_ABD)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 107c393a997..041fd1ef14f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -355,3 +355,5 @@ DO_2OP(VMAX_S, vmaxs)
 DO_2OP(VMAX_U, vmaxu)
 DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
+DO_2OP(VABD_S, vabds)
+DO_2OP(VABD_U, vabdu)
-- 
2.20.1


