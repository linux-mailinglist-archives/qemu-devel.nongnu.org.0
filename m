Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C422381F3E
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:22:41 +0200 (CEST)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHfE-0007iQ-6k
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUn-00062M-Me
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:53 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:35785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUY-0008OQ-Gn
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:52 -0400
Received: by mail-qt1-x82a.google.com with SMTP id k19so3132540qta.2
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFL9t5OD5k5npkYQzODZhaVeI1U1ot/HuEftF5u8qrE=;
 b=pERvsXpYrqy1KTcDdSioqCE5MxLpyNYghfUyg+g0gfcj348cL1D6YhCHUtPs1jjiIi
 LpOY667M2+Y1dY/7/6YwXp28j9zaVQdgqGvZfLRaLt2VC7TqyE8mixq2+9hznB4wAKiS
 ZeQX9wgrAj42c4NpSOUFKVaLRrBma89odom0cpf1YpPy5FtjMzjTaINZNtGMqERHchuu
 I9+QGSC+4xTVY0iLYrRL9fpjCrNADry4cLEVCMEQsNGKiWdNieZwXRJ4bpWJA8zKmrqv
 NsNvPsENgT2SYJQrqsa9r8Dj6wAfbG5Mqhe7fgW9oL5tZgccVoqknHDgGrFFz+frlZEU
 vtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFL9t5OD5k5npkYQzODZhaVeI1U1ot/HuEftF5u8qrE=;
 b=ZJ/VqkcEhbLr3xA/0u/K333tatw43MUpSAeuJnoXhZKQBljYGgmL33YGSDHCk0EjAV
 +nHdEetRZVAsgJlx1nqr4WYA127COBmvZV8GKIs1OoB5ujFe/QSXBqkTJIA2TRU21Fge
 k/Yyd5MHugPT2dGIlhM+4rM+Cz2455v+A0LsBGF2iU7DPdC+8ziQ9+P5i63oDaeogdGg
 VkwegID0JxrjAmWGMLxFjiSRtUX+5UD16Wcb0Nfmb3Ewa1wVZ81brxXTH/e8xcOrsPRv
 jdLb7vbkZ/7ga8DF4cRRF3RomqvKv1juwAavhwNGRsXmFyXrNgWSjo0c+v1g8IZQNK7j
 aqFA==
X-Gm-Message-State: AOAM530wEKuVw78dqSoW3mQvuA2H0J0PolOBSdNSmoK+IhVf4rH9q8CP
 xCoQ1SPMm3+NKJN4BNqIOgj/CMUvYX9FuuL1dGc=
X-Google-Smtp-Source: ABdhPJzkTdnppOjQAPcJ3HSo0Ir+qpx1OZI8jzSLYg/Z7huH2nKYYl2o6gosAB817VI5kFj58XXZFw==
X-Received: by 2002:a05:622a:202:: with SMTP id
 b2mr20834919qtx.343.1621174297105; 
 Sun, 16 May 2021 07:11:37 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id j28sm8350102qkl.35.2021.05.16.07.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 07:11:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/4] tcg: Add tcg_constant_tl
Date: Sun, 16 May 2021 09:11:32 -0500
Message-Id: <20210516141133.739701-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516141133.739701-1-richard.henderson@linaro.org>
References: <20210516141133.739701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Used in ppc D/DS/X-form load/store implementation.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210512185441.3619828-24-matheus.ferst@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 2cd1faf9c4..ef8a008ea7 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1096,6 +1096,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_sextract_tl tcg_gen_sextract_i64
 #define tcg_gen_extract2_tl tcg_gen_extract2_i64
 #define tcg_const_tl tcg_const_i64
+#define tcg_constant_tl tcg_constant_i64
 #define tcg_const_local_tl tcg_const_local_i64
 #define tcg_gen_movcond_tl tcg_gen_movcond_i64
 #define tcg_gen_add2_tl tcg_gen_add2_i64
@@ -1209,6 +1210,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_sextract_tl tcg_gen_sextract_i32
 #define tcg_gen_extract2_tl tcg_gen_extract2_i32
 #define tcg_const_tl tcg_const_i32
+#define tcg_constant_tl tcg_constant_i32
 #define tcg_const_local_tl tcg_const_local_i32
 #define tcg_gen_movcond_tl tcg_gen_movcond_i32
 #define tcg_gen_add2_tl tcg_gen_add2_i32
-- 
2.25.1


