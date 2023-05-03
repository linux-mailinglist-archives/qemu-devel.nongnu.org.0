Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B16F514D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:26:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qY-00039A-Vj; Wed, 03 May 2023 03:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q8-0001uN-Bs
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q4-0001hO-Tg
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so4410380f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098627; x=1685690627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mgY9KyTjh5Ab8oqjaY6/9nqVQ4nZ2xmbaw4485PUKM4=;
 b=FvcnI0Ll9n8KTjnAym1oEaMXMi8y9PxNn+dv7YLUMo9POK2/eXhVWWoriBsKBmKhYi
 Z0UeIVdgM+9G0PQmm8Nu14SxGRXEUUrgkAR3CBaDk6eLREn+ept8xmamzftIdkYrA6L8
 E8JMQRj9ADYpGsfbC+mGA47jOMvnAkoKr3XDIwl157aixb5Pq702XpjT8HkoQDeTmD1H
 yCEVLSVlPgaEAt7LyU7NqRu6cyGCj7GgHvIKACbP0nfDSPaSnnfY5CTZ6NtRJSCTmazY
 c44dN542fq2prfGcG1z0xPAfaz38UvfeIlIajrWG4aDsFyonv4LTZ9ahvm6zXV5yUVLd
 sywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098627; x=1685690627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mgY9KyTjh5Ab8oqjaY6/9nqVQ4nZ2xmbaw4485PUKM4=;
 b=ItSvcjpwKnmIhWyNXXW+3coRHC9lFF/u/grTCali+4C1vuz3rBAH+1333EAcC05TmL
 h2Q7dTa+o79PiR5PIVTzjOXhTyAaA3pdIbDgesKy7n2Q3cMxHwEi9nMZiFycGAcL2L1l
 XSxfvn1pJoaEneJ9zHyZYrpMZKve3q9E+hYZOEzRsc3kK51xvIaO4oMgeACJq1rcSoS0
 2D5GM/5YNH7H4TacLSkAaLKNtbH0Tf46GbhSZs1OrBiWSFpy29gd1St8fOz0A7t/M9US
 YGCVuXXHmRLAeBGufTKPPZOM7Ra3aqSi0YHd7shFVgGntZ7kqU35fHI+3f6X0x9p0Yo1
 B2+g==
X-Gm-Message-State: AC+VfDw6h3OiKSuVpp13NDHj0WNyXIveWXbASGA/xYxZxMsOdMLM2KZk
 Ye06vchMR4SdS9m7bc2kFUCWX2aKz6GdUuohluXBOw==
X-Google-Smtp-Source: ACHHUZ53XWjMvELVrwK7N2oFdh4u7CvxYct9lix4CguH9I/JfsOujxe0nKTMpIUt95rbrRlQSwB7mg==
X-Received: by 2002:adf:e442:0:b0:306:3911:dff0 with SMTP id
 t2-20020adfe442000000b003063911dff0mr3283617wrm.4.1683098627398; 
 Wed, 03 May 2023 00:23:47 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 17/84] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Date: Wed,  3 May 2023 08:22:24 +0100
Message-Id: <20230503072331.1747057-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since TCG_TYPE_I32 values are kept zero-extended in registers, via
omission of the REXW bit, we need not extend if the register matches.
This is already relied upon by qemu_{ld,st}.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 85fdea42b9..f8e7325a8b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1323,7 +1323,9 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 {
-    tcg_out_ext32u(s, dest, src);
+    if (dest != src) {
+        tcg_out_ext32u(s, dest, src);
+    }
 }
 
 static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg dest, TCGReg src)
-- 
2.34.1


