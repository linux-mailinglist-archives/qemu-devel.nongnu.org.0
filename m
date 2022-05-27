Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75475536817
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:29:47 +0200 (CEST)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugag-0002uf-5p
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueg6-0002W8-Dw
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:27:14 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefn-0005SE-J4
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:27:14 -0400
Received: by mail-pf1-x430.google.com with SMTP id p8so4984076pfh.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ahvWxWHP71pt6saU+BLZ+S2aDfPkWu1VDazF0BVN8aQ=;
 b=Qi8A9gSz36wut0Aebo6j3cDg8/U7p58ja1o6KUmcWNGpfDY6Oi4seAQLMsrXk8mS1O
 /Dlcfy6WhUDMSauMnYswQ3qLrcIjIbldB3vvsOK5jD6idom7rhPfVcAyKs6+nqallnXT
 O586jZ5EAVnrXvDOvGy0tgmswF4DT7tmC5Fng5hZCfIq98sTW/UFUt2I2q+caj974h6F
 IpJsOoCEfyotBl4B2yDxZQDdGDWjrfVArmhmgMa8qRa3V2SyB0MsbA6jcvLcAw6HI/l/
 jN1vOYYMVeTZ4hxuOz/+TP3O5zE355xdFFkVO4iqaLzD1ESzgpn1aKi50TRUrmUh76Ue
 1UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahvWxWHP71pt6saU+BLZ+S2aDfPkWu1VDazF0BVN8aQ=;
 b=qaO5cGSqFrRL55W5lUKjIqi5vvPcknTk3xJiOUwh4agGr6eT3pDRsEhnaJrIdK734U
 kdZx2WJTVengGo49Uw0cB584bHbtUexIyDpPoUzHi0IDbED7b3Z54t++JmppG7zipfpo
 y0IeFJLS7w/wGpJRHDSbhFE4jeUal9MJlQYXHmKPH0CP3KGe/HCFipXpJEfFt3r2jdH8
 pYQDzMt4KIZJ6msDplytEMBHQpJjaaeQoODvQgHVs6dzWwzOI67Ibn3Er+oQ92x9SW90
 9rFbd9eQrEkhgcCUAudrYiRzpJyox4YDVoSQdPbElPJl2CJBKXiGTeETGVKHpii82BXX
 eeTQ==
X-Gm-Message-State: AOAM530cfX4N1dZsFQI4tikl/nZbYEqgwm1dTRzT3lpPq5Ts4gAXfSuk
 FCZikWUEi9DaEDBosXlEW6COBFnTDArapQ==
X-Google-Smtp-Source: ABdhPJxTDgajNVzDZ8pEHTWhKuYFBuezTN5fj5zNmroDmw2uZtZ9D1vfE5b2Lusc4vlZT2N6mWwkbA==
X-Received: by 2002:aa7:9f4b:0:b0:518:1402:cf6 with SMTP id
 h11-20020aa79f4b000000b0051814020cf6mr45274454pfr.15.1653676013270; 
 Fri, 27 May 2022 11:26:53 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 111/114] target/arm: Use TRANS_FEAT for do_FMLAL_zzzw
Date: Fri, 27 May 2022 11:19:04 -0700
Message-Id: <20220527181907.189259-112-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 44af7530b6..57bff0d345 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7149,33 +7149,15 @@ TRANS_FEAT(FLOGB, aa64_sve2, gen_gvec_fpst_arg_zpz, flogb_fns[a->esz],
 
 static bool do_FMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sub, bool sel)
 {
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
     return gen_gvec_ptr_zzzz(s, gen_helper_sve2_fmlal_zzzw_s,
                              a->rd, a->rn, a->rm, a->ra,
                              (sel << 1) | sub, cpu_env);
 }
 
-static bool trans_FMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_FMLAL_zzzw(s, a, false, false);
-}
-
-static bool trans_FMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_FMLAL_zzzw(s, a, false, true);
-}
-
-static bool trans_FMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_FMLAL_zzzw(s, a, true, false);
-}
-
-static bool trans_FMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_FMLAL_zzzw(s, a, true, true);
-}
+TRANS_FEAT(FMLALB_zzzw, aa64_sve2, do_FMLAL_zzzw, a, false, false)
+TRANS_FEAT(FMLALT_zzzw, aa64_sve2, do_FMLAL_zzzw, a, false, true)
+TRANS_FEAT(FMLSLB_zzzw, aa64_sve2, do_FMLAL_zzzw, a, true, false)
+TRANS_FEAT(FMLSLT_zzzw, aa64_sve2, do_FMLAL_zzzw, a, true, true)
 
 static bool do_FMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sub, bool sel)
 {
-- 
2.34.1


