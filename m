Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D85386B7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:22:14 +0200 (CEST)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj5p-0002D1-BA
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwT-0003wl-Ie
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwQ-0007Be-Ib
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so15257378wrg.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gpFeOP5hFHQHN7rmmvGomwQ+EZc/H5uDtVH+BHzCxlI=;
 b=o6MiJ15V9Sdr57L5kxxxZ4hpd6r3/nhNuloTITs4FHywu8xxRbjPspgqnmeq+c76l1
 ZRPJOmqk0C7rnmNig4VEQc68rHbwFFPe62IDD1lDzBxznAqo2zbb6FdAupz9CjmvPoGz
 LuBNJdp0ilqbe9NzZaIJKAUzMuhJX+du+CCfTNV65i8JVDni8SpJ7Saoyl5cKAbxSXq2
 2H9U5z/iKoFuKtinzTRvP4Nbo+44cfMEcVgVhueLPgHFsYGCndXAftNNOcHTKsM4DaGK
 cbth2443oaw1BOtJQXJFEFOiThR6cNq/74ahT4zEAgOMDvWKZ+EHihro+Yuj9k0fNlTp
 VYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gpFeOP5hFHQHN7rmmvGomwQ+EZc/H5uDtVH+BHzCxlI=;
 b=ciErCxVlIWpgDlqdSWZ9o0bc9RDZ+cEjUjqjGQNvFJzfEw34GFvuMeafI5lvyIQcJT
 /kXQM6xSBxvJF0BUE0vc7o0cVOnz2hV9oJNMOXw5xi6ajLveeGBDeRBkcyIn6EnAw5sP
 Pd4AUmd6KWtDoE90uvAmgI1bjFJHYpTJ+JXuotOvgl+kpeubooXL/Ov/d4xIWCLfGXR1
 acreIkQcW2JdxgV4TlFTWWKrlEjaooRHLYOFeYMBfpK8RWXhOa258/UBrYoR8kxksJJv
 cz3V9Vf/OAEkAYQMbTRW7sn0kCEBs4NqxdZiI6vgdczFyGlX1KaDXa/LL4zQ7W0J9XgG
 aJaQ==
X-Gm-Message-State: AOAM533PGYOj/8pFBrPwTOHxk7LlrSZkNbEebQ3ICWUweEtwAJHva0Q+
 C/p3XkD+CC7IPVtlajrpPkV9uUxTGCl4cA==
X-Google-Smtp-Source: ABdhPJz3sKef1Ins64tDP8Gqkol41+MO294z78466c6pKGHbp2/P6CcoXZmtqsF0fMw5DgHrf8g6fQ==
X-Received: by 2002:a5d:47a1:0:b0:20f:ecc4:7f6c with SMTP id
 1-20020a5d47a1000000b0020fecc47f6cmr28373503wrb.236.1653926903225; 
 Mon, 30 May 2022 09:08:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 079/117] target/arm: Use TRANS_FEAT for do_zzi_ool
Date: Mon, 30 May 2022 17:06:30 +0100
Message-Id: <20220530160708.726466-80-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-77-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e6434589f46..b8bd1047b0a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3330,14 +3330,11 @@ static bool do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
 }
 
 #define DO_ZZI(NAME, name) \
-static bool trans_##NAME##_zzi(DisasContext *s, arg_rri_esz *a)         \
-{                                                                       \
-    static gen_helper_gvec_2i * const fns[4] = {                        \
+    static gen_helper_gvec_2i * const name##i_fns[4] = {                \
         gen_helper_sve_##name##i_b, gen_helper_sve_##name##i_h,         \
         gen_helper_sve_##name##i_s, gen_helper_sve_##name##i_d,         \
     };                                                                  \
-    return do_zzi_ool(s, a, fns[a->esz]);                               \
-}
+    TRANS_FEAT(NAME##_zzi, aa64_sve, do_zzi_ool, a, name##i_fns[a->esz])
 
 DO_ZZI(SMAX, smax)
 DO_ZZI(UMAX, umax)
-- 
2.25.1


