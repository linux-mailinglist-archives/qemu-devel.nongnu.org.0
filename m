Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6202337F801
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:33:40 +0200 (CEST)
Received: from localhost ([::1]:60376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAX5-0000g3-BZ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAKA-00063F-Bf
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:20 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAK7-0001I2-3M
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:18 -0400
Received: by mail-qk1-x72c.google.com with SMTP id a2so25207965qkh.11
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFL9t5OD5k5npkYQzODZhaVeI1U1ot/HuEftF5u8qrE=;
 b=XpxoNJX7OHbsr/jteGIygopw3Mu2MQVgWnJJ2iqxdCXXWApWdl+deN8uI/Y6qfQ97/
 RNP+FASZl/XucgFHjmORk1batiCa0v0H0BfuluRBCO9nYbO9pFoiQYMLyzXaxRpHnAcS
 /id+rRrzPCLrtgX/RI+D9t9OQ2+4FtwI0/Z64CLt4/9AP+L7J6MeA5XVf+/zZem10bTL
 m7abie9cf5jWlhC35mLbiHuJ93P/VnspyBHL324OcLzsAOQDOBhQoOk31S2s3I722gXu
 HuAQhmrRdYnWaWrdNzPGGHGpXos/JKhVUu9ZR0qpQ6P633L/SoYoEP/S4raJzWVLh5Y4
 8XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFL9t5OD5k5npkYQzODZhaVeI1U1ot/HuEftF5u8qrE=;
 b=e9FHWz2wOE3NKR9f9HDEAOlqpAS0vcp3popzGAE4AmkYVHcwOw4xp/ybd++skhNmDJ
 zNoW8Vg4TskPvhqqqX5ViByGCK8a5Wz8MCC6bIeYqF79UUUgblxQTDJVcxshymN3Pwr3
 avl1lejB2uLS0rL+qffwH+0VsCdGAcQHfqC1eGjIkFLaprb5i/E5Jtusnk4d+EUmBPJm
 pxg2Hp5t963Z8o3/5ng1QAftjmJkfNcOR1wDvNACGY84H3ofslGOLcH9RRzobDc3YUqT
 0kU9B3ecARczqXSmDzNIvmaVcMMOhh0xd3KXnw4cnjLK2S7AaawY1XsBuzCppMPPp4RY
 hsGQ==
X-Gm-Message-State: AOAM5307deApOu23x/3fYyvcM68e0Ecvx0huhvVi5cYAdd1iY53d/IVn
 mLLnItZ0I0ItP4bcwVxq77ZKcM0Nasja87zzlSs=
X-Google-Smtp-Source: ABdhPJyxRhfKGbN3Ct1ItOnKmK79UZsfcSdVZsH+J1YSxIqFooQP7KQDn7lMchJFdtSp3HiFmrReFQ==
X-Received: by 2002:a37:ef17:: with SMTP id j23mr34117807qkk.392.1620908414259; 
 Thu, 13 May 2021 05:20:14 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id b3sm847262qtg.55.2021.05.13.05.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:20:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] tcg: Add tcg_constant_tl
Date: Thu, 13 May 2021 07:20:08 -0500
Message-Id: <20210513122008.207491-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513122008.207491-1-richard.henderson@linaro.org>
References: <20210513122008.207491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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


