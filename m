Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF4E6AED6E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe3-0002q0-8J; Tue, 07 Mar 2023 13:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdz-0002Qc-DZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:35 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdx-00014q-OP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:35 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso12635710pjs.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zWXPWsNn/T5rs7QBqKWIBFLCiOz5GjmUC081+TrIco=;
 b=ko5R9sj91YQAh+VyWr54sfQVWf4mVIhxH6SlgYTCM7XMigib5MK0a/q7Q1U9QWsgDN
 2Ju9LV8dfJZV2l3aU/DaRC/F9RXspNcfx0oYef5FNSF89pPX5Qm3q/M9XoPqtLpBErNI
 1y7MbbzZlv62Rbu0k3E9UorAXLTF1UUOnTbLAMtT7tcq3hZAEc8rihCMFepujhwI6qYQ
 Yrlc2rcMq0g8vwzXb6ok4gnfHZFR7ulU1v+OCWr7giTqHL0oq4jzb1Mzr+Hh0O5mQpo3
 7Uxmkhs8LK/qj3jYzlPMLHYdtEYFKASZm0ObB7Dul/ZH9K9BWvQKzKDLtrV9Ig3SYK+J
 5J8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zWXPWsNn/T5rs7QBqKWIBFLCiOz5GjmUC081+TrIco=;
 b=1g49fPUEgLGOq4G5Z1cOYpmkua27V1LUd4C5Zq3XA3kxNrAc7afd51NS/H+hq2ck6O
 y38cCXR639c9gPeVZSNZPd+w6MAQ/VrCX9pv78fzlrRg7AF0S3SS+bRBSBj8lGRU1p/K
 nkQAV2mJpgULDLEVXexstvx1ssOODDLVWVOxyulxbP2L3MLquoiVCUarH0+7q4+Ov7Pf
 ZzFPGLw0pDAH1y/WXuoo5vNzSP2FYT7RqbrbwaNMA6CnCbXdgxFP8FOOj/Cl8pExP/W4
 7qH/gRF89k/p/wVYYcyTWKRLyT2ABMSdfu0vvaSZdWhlmUPgxF78KWFuPVquYWHGTIPe
 HvdQ==
X-Gm-Message-State: AO0yUKUeQfD9jeK4ZAJmdaXUNuvKOAXy3aGUY7Lo0P2QuQ6e42v7mciG
 5j97s0GlEuDW1tQmILyBDK70qZE6kfCWKJxJ+Z8=
X-Google-Smtp-Source: AK7set9hsj48Rs8WMdPWv76yuIzetfU8kdjFJd6Pb3tnsatOXYFc8kJ7u7+qyskva8QigVS8GQp5Og==
X-Received: by 2002:a05:6a20:69a8:b0:c7:7d45:50fb with SMTP id
 t40-20020a056a2069a800b000c77d4550fbmr14475481pzk.28.1678212152793; 
 Tue, 07 Mar 2023 10:02:32 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 54/67] target/rx: Use tcg_gen_abs_i32
Date: Tue,  7 Mar 2023 09:58:35 -0800
Message-Id: <20230307175848.2508955-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Remove the local definition of rx_abs.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 6624414739..998e6e0b7e 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -1126,21 +1126,11 @@ static bool trans_SBB_mr(DisasContext *ctx, arg_SBB_mr *a)
     return true;
 }
 
-static void rx_abs(TCGv ret, TCGv arg1)
-{
-    TCGv neg;
-    TCGv zero;
-    neg = tcg_temp_new();
-    zero = tcg_const_i32(0);
-    tcg_gen_neg_i32(neg, arg1);
-    tcg_gen_movcond_i32(TCG_COND_LT, ret, arg1, zero, neg, arg1);
-}
-
 /* abs rd */
 /* abs rs, rd */
 static bool trans_ABS_rr(DisasContext *ctx, arg_ABS_rr *a)
 {
-    rx_gen_op_rr(rx_abs, a->rd, a->rs);
+    rx_gen_op_rr(tcg_gen_abs_i32, a->rd, a->rs);
     return true;
 }
 
-- 
2.34.1


