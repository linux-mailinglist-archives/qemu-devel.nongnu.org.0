Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CEF536800
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:23:38 +0200 (CEST)
Received: from localhost ([::1]:50508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugUj-0007Bt-K8
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefs-0002G7-2Y
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:27:01 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefn-0005Hi-Fk
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:59 -0400
Received: by mail-pl1-x631.google.com with SMTP id w3so4795366plp.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S7G/+wXbfTkwMLpI6bHSmrJS0Iyb1qAVjRu8LnGyo5Y=;
 b=H/OeZGy6Mnvr1IPsag3usuM/01vEbQ4mugccrykREXQdf532iWYpw9y9Dp9P9FBQkH
 qd9655BR/8HqjOyztPnkJ3LOPcAJBoNH3bg5fGfkru5wIS8XsW9yKJedL0OqWswOMWw4
 akeM8v2Yh7+IXD4Ght1tbFjbwoKwWHP+nhyl1TOWQvu4QuBc5dudyma+Aom76hPKNtI6
 ZFEzfl7G4J9yqyuDPeGZzi2eTfEVtBYga9WsMhCTgfi9BnTAZBaZHUPppLgwxh37lJ63
 BhN7X+jJwMQPDbiVatnEWrY9bha7HoQ2bXx8AMZaIdEKMrE0s+uLVrQ45AyjbFnwhXTx
 L3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7G/+wXbfTkwMLpI6bHSmrJS0Iyb1qAVjRu8LnGyo5Y=;
 b=NoVz/PkFp9kWSCGlx7q8dojVLLrD7hTqfF+TRCDtvbEN/pevNUEQ1U5l4E6I7EsWRo
 /3CnmIl3M5j9y7RBhZH9k6XY3f08VOKxPh/LYG6w8bGu1i3hiNTgfVy3MYpTBBm/Ddcr
 MD7EOA5+piOK1iaC0ZkmoxnNLp1G87HkBVc2KyvxtEVJI0YAexHIdAQJGJHduJV/9n7m
 oTg6Yasz0/LGLAtXjoXp3t8qC6e9K65Rbqt8cwP1/miG6XxgZJ+SCbqqMf2jGP/cgxuA
 Yp9lv7aKgUPV0UB+uTgYp8Se2HC5vtfhXTOMeM0Bexs5q/YRnPsfjdDXOzqFd03R2OgN
 RxQg==
X-Gm-Message-State: AOAM532gPYHmuXu/ieQ32flkJJ0QCC99PjYiiwDjx+6N9b6AHixiHdXW
 sIuNfQDpE3NKvwFOj08cHKI0F7Bl4lMkUg==
X-Google-Smtp-Source: ABdhPJx9KHk+GC4CG7pPUlk4ok7b9bYjtqmNcGW/dxPvvblntmOC3P++eRHLq07/k6JULZdAx1nc9Q==
X-Received: by 2002:a17:902:bf45:b0:163:ad4b:dde9 with SMTP id
 u5-20020a170902bf4500b00163ad4bdde9mr158414pls.25.1653676014334; 
 Fri, 27 May 2022 11:26:54 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 112/114] target/arm: Use TRANS_FEAT for do_FMLAL_zzxw
Date: Fri, 27 May 2022 11:19:05 -0700
Message-Id: <20220527181907.189259-113-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 57bff0d345..5fb66547ec 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7161,33 +7161,15 @@ TRANS_FEAT(FMLSLT_zzzw, aa64_sve2, do_FMLAL_zzzw, a, true, true)
 
 static bool do_FMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sub, bool sel)
 {
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
     return gen_gvec_ptr_zzzz(s, gen_helper_sve2_fmlal_zzxw_s,
                              a->rd, a->rn, a->rm, a->ra,
                              (a->index << 2) | (sel << 1) | sub, cpu_env);
 }
 
-static bool trans_FMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_FMLAL_zzxw(s, a, false, false);
-}
-
-static bool trans_FMLALT_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_FMLAL_zzxw(s, a, false, true);
-}
-
-static bool trans_FMLSLB_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_FMLAL_zzxw(s, a, true, false);
-}
-
-static bool trans_FMLSLT_zzxw(DisasContext *s, arg_rrxr_esz *a)
-{
-    return do_FMLAL_zzxw(s, a, true, true);
-}
+TRANS_FEAT(FMLALB_zzxw, aa64_sve2, do_FMLAL_zzxw, a, false, false)
+TRANS_FEAT(FMLALT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, false, true)
+TRANS_FEAT(FMLSLB_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, false)
+TRANS_FEAT(FMLSLT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, true)
 
 TRANS_FEAT(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_smmla_b, a, 0)
-- 
2.34.1


