Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D63AF15D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:06:04 +0200 (CEST)
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNN5-0000Fw-BE
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnT-0007XV-2b
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnN-0007fm-2i
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j2so9831449wrs.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HFGUgM56e88x21361oAcl7VvMIw8P+VtGSq1mk6WIWA=;
 b=eCW1PLd+kBih6nR92XjaoLgoUll/0pIjs3FWDw+cIJgWIw65mdSNB8d1/CnbmIE/Vr
 99rEtnyZq+RybL5H86sxVEeCqQHeaAHM7n1/pJAjlgAi7RkYDUq9DlLbFEQUBUoHeGKV
 YguhggWdhq2uUdy5vz6QivmYK/cgUzNgSkgavwuHnZVflOQsnR4Q44E7pBWqUsV/AjhK
 4bmQDnxWaQ88TJNFZeKs2w6VwXPiMiE+uFXoxrnr9kkrQtCc9c/v/x/cmrgUI76HBUAq
 zwRlc4ja+dWve7wdnw5PUz5mBeU8oyf/rfae67vb6d7+mRXYUzAzmOBIfgBaj6auStRj
 5ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HFGUgM56e88x21361oAcl7VvMIw8P+VtGSq1mk6WIWA=;
 b=la6QD3QslidH0D453YQCaTAq4aQtcaFQ/hws10jqmaeLF0erFmszrAZf7k4L4aRSpi
 y0tIb7ASBn2w8x0hatxcC7MRH0xqm/wVWpdv70EZWuR0vcR6IYXF53GTwDhTyxyEQAmY
 C+6slGN2nd1THJw1FecZTiXMF7/udsz8U/O60ddJ5b8P6ht3SY8UrOydXI9S2A3SZzft
 b22ePXrFoDBT4m/S0wP7b5Yz0ftMlm3VpTJnSXlECR9CUXAM5rL99tfId5yVry/eJGiP
 WD7dhHYVdwoSMxFbBCuiZY+SzIIl0bRw+DH3OJ946ZXGgsxnF0FHX8h9emYLXTyHeTyd
 qLZg==
X-Gm-Message-State: AOAM533KvLywi2ibOcc3oFO9XMP03gpoe5RnSjQ3d4CqNsDaqateXJg8
 V9Hyp/2FMG48P154TwtldDBIgfp7/+b/ADAH
X-Google-Smtp-Source: ABdhPJzDISTfdK8XEHIoCCif291HheSzz9pd/bQ4u05AcKfWoCe9kmnLzVHR1QuZ0YRW2HerdcjP0g==
X-Received: by 2002:adf:e904:: with SMTP id f4mr30035351wrm.334.1624292947839; 
 Mon, 21 Jun 2021 09:29:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/57] target/arm: Implement MVE VSUB, VMUL (scalar)
Date: Mon, 21 Jun 2021 17:28:10 +0100
Message-Id: <20210621162833.32535-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the scalar forms of the MVE VSUB and VMUL insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-24-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 2 ++
 target/arm/mve_helper.c    | 2 ++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 16b974a4270..912505d0152 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -149,6 +149,14 @@ DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vsub_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vsub_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vsub_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vmul_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmul_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 0ee7a727081..af5fba78ce2 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -161,3 +161,5 @@ VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_no
 # Scalar operations
 
 VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
+VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
+VMUL_scalar      1110 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index cb97709fcac..3c62627f2c7 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -512,6 +512,8 @@ DO_2OP_U(vhsubu, do_vhsub_u)
     DO_2OP_SCALAR(OP##w, 4, uint32_t, FN)
 
 DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
+DO_2OP_SCALAR_U(vsub_scalar, DO_SUB)
+DO_2OP_SCALAR_U(vmul_scalar, DO_MUL)
 
 /*
  * Multiply add long dual accumulate ops.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 388848b4ff0..3c059ad91cd 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -427,6 +427,8 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
     }
 
 DO_2OP_SCALAR(VADD_scalar, vadd_scalar)
+DO_2OP_SCALAR(VSUB_scalar, vsub_scalar)
+DO_2OP_SCALAR(VMUL_scalar, vmul_scalar)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
-- 
2.20.1


