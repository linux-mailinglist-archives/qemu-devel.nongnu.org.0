Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6699053678D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:39:19 +0200 (CEST)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufnq-0003Sj-GH
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefL-0001Y3-6O
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:27 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefI-0005HV-GA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id d22so4803637plr.9
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Q89U4kta6lhexkgv8jfPm0BOpmhch8pJh3wP8uQ0Cw=;
 b=VcqtkgfJrSzSGqKfIS8sMPNMc05/mFuJggADlkCSQ3Kjmw8KoGIPcflg+at/fjDNm3
 K53uwGuIH+mEAiux6cqnD076c2Y1A1G37xgm4hvlgMyvVU01+1fsCgm6PVKt0/GNhgZ+
 ViJnj0lFufzqbbKIMxrecPVmpP9M++81WRSxaOCgMAMij7M1D4d2WUv34EXbJQLu1zqL
 7DJH18WpBmXIcIkR1gVmlveIiOaE1vxvE0pC2rlY6J5+4iXM3oB7h1vrwhE7/cunketn
 y1twlNsK3KJkxcjM/zr0rPfb+MWuOk47pRWAqyVTJvtFSqbDpb+9AavhOqIE4weSFy22
 R+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Q89U4kta6lhexkgv8jfPm0BOpmhch8pJh3wP8uQ0Cw=;
 b=FvdjkBJxlg2B11X3Vd/xn7rx3ELb4x5JIUE2SVTq/v4AJYc8HOSTaRYgXlCtkrm5Ms
 5vG+SG7uLCdpdgPwzQTNUxMy00xAOwKbeu1A5tuMXqdJxsZTj6UOYn223CBHl03nGUmG
 B21Wvg54L89V7ttQNxYM+SyecuaV5HiRsd7pdRuT8O2p5stwjzYOL4j/dxJBW7jozgOW
 zc+8A7LudotXhNjeIwd3bAKIqQBGoFz4j2bloXrjuwJvzMXU86qTCU4yTlqt21TE1b5U
 r8z2+jib/RFn+G3Trt3sYBh61nmtFBenctMgcCckmoSg8AGEbbHppT4FSy4xkgyzmrQE
 DuhA==
X-Gm-Message-State: AOAM5336Ch+LCjeF5FNx0P2yw+zdaC5Qc5WNEq3Mq97uT6i6jwJvudSM
 X5WiW93uqELhFHARuWm01YDAV5mowiZ3gQ==
X-Google-Smtp-Source: ABdhPJx7C9K+Nu5qY5erVMUTQNuH9ikMsRYUvYkdGzHzcy37QOulnJbQO+wkhPFRy74FgQedxXWeZQ==
X-Received: by 2002:a17:90a:e7c6:b0:1e0:9cf7:d042 with SMTP id
 kb6-20020a17090ae7c600b001e09cf7d042mr9652233pjb.234.1653675982716; 
 Fri, 27 May 2022 11:26:22 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 080/114] target/arm: Implement NOT (prediates) alias
Date: Fri, 27 May 2022 11:18:33 -0700
Message-Id: <20220527181907.189259-81-richard.henderson@linaro.org>
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

This alias is defined on EOR (prediates).  While the
same operation could be performed with NAND or NOR,
only bother with the official alias.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f33bc9d480..b6b5980e2d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1381,6 +1381,11 @@ static bool trans_EOR_pppp(DisasContext *s, arg_rprr_s *a)
         .fno = gen_helper_sve_eor_pppp,
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
+
+    /* Alias NOT (predicate) is EOR Pd.B, Pg/Z, Pn.B, Pg.B */
+    if (!a->s && a->pg == a->rm) {
+        return gen_gvec_fn_ppp(s, tcg_gen_gvec_andc, a->rd, a->pg, a->rn);
+    }
     return do_pppp_flags(s, a, &op);
 }
 
-- 
2.34.1


