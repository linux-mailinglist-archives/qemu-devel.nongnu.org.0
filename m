Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5601536F8E6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:01:30 +0200 (CEST)
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQtl-0003SR-AX
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUF-0007on-2S
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUA-0001Nj-Di
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id z6so8707004wrm.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TpMzlnQIttT+ejifMpjAW2s7ucdhXLJmi7FdvCCMxCw=;
 b=icEIph6JqfdFlJ0k514j5wlooyuM1GYqVWiAF+fq3HVGLrzcOYOeAWu9DBmMYuTDTH
 Q2gofhIv3oNNXjHGgV6oHmiBRHxsa9rdOZlGZrqSKqY8c48DQDMiRFcCCmnnsGMAmFWl
 FHDJgUCweQ7nkufCI9YS5bznKQ1lO+6AkPW4GM0mZsEVi8h8kJp7UE5yvSqnqCwGWBi/
 P86jJHz7vjmAdUPxZmzbwmCGDY+1eP/B1x5XfBSk6mEO78ePqeGPk8ReCzZmKzkMDzFu
 5rd53cCkU+gR3rUIi4noXkJS5JK9iqwv5Bu3s4pMlcEfAt5VOk/Cnp2fGJrniy3Tb6Oe
 EB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TpMzlnQIttT+ejifMpjAW2s7ucdhXLJmi7FdvCCMxCw=;
 b=rieypXxS95E1gVqXVU6zakQ+YrTppw6/tvFsgMwwvTGEZrVglpJMGXkPWEqMpsohcp
 GvhZOA7uKMj8Lvrx3JaEtVcd4SYtH3U7RVogRJ3pYdGF/ytqSIPq3vUplgCaQgj5seDq
 awonmfUmHvpc+wF8qOxWdG40RD0/VywW8GkjabyWXG+q+SaX55Q23dPf57F/fIfBvxgN
 66gY4vXpdKTNVbz2zTlGZexqg6ln7GCrzCYC80VoNQxjwR1HDABj4hYzDyUB+wPFfSZI
 3+LaC86CR2eJuqondUNThdySklaHersECuKVCGHFL/K7CT9y/lCD4xoOBiLwxxtMUCVc
 N6fg==
X-Gm-Message-State: AOAM533g9wczP06PiWczEXirw4egSt1qIub9DOWDACeO4fbM66aHPnlL
 LxSweUxb30KxBx6M0AfaGSzRyUPKiGB7xExE
X-Google-Smtp-Source: ABdhPJx05/PXvyUVon3tlDJDR9r04Fe6vL5eEHM2OvFisZbPUxasPnLB3Nw9l8gZcQVQPV8kK/fBZQ==
X-Received: by 2002:a5d:43c1:: with SMTP id v1mr6072986wrr.248.1619778900970; 
 Fri, 30 Apr 2021 03:35:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/43] target/arm: Enforce alignment for SRS
Date: Fri, 30 Apr 2021 11:34:23 +0100
Message-Id: <20210430103437.4140-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b8704d2504b..3b071012cae 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5200,11 +5200,11 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
-- 
2.20.1


