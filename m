Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90383C754F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:51:24 +0200 (CEST)
Received: from localhost ([::1]:50632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Lcx-00081m-PJ
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUG-0006wg-2p
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:24 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUC-0005hS-Tc
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:23 -0400
Received: by mail-pf1-x434.google.com with SMTP id p36so10460874pfw.11
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgDcFwijqvI5Ustjzi412a6qyjRC0UcEnEWmUALegEQ=;
 b=UtAP+N0VLB7vjoOe328EuJCbOheLmI6MpvCMqEP+gcKTOvx73b5IfF4QEu3wHUigyS
 ZIaKo6yS9Fog5D8lYDorS24LyTAPY2/ZaHMrrPTijOkNQsHNs6wnMpE6dVOc4otgBV2z
 sqfYuweMLaN0tUBfMPoTTrDzNGlpUg97P2Fb8T3GYdTNMlrYiehIoO3KLtjCdbZUhRaz
 34BKvYjkf/Iod4nA5xdq0TpmzGIMSjJiI2eUAm82j51TNVhRSG0OHrIHuHRahXSvvZSH
 kt6WYieVUjSbAgdCRY+D6+vf9eGzONbM1gMUopFEPxu88tDbJs7iJpUYU0t8vC6hh2UX
 jqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgDcFwijqvI5Ustjzi412a6qyjRC0UcEnEWmUALegEQ=;
 b=mFZwNxfCBErgWuOUJfQSXkE5oXvpmrYPHKYNPKM3YPB03ZfedLoxCXzzqji3W1yDAz
 DttxOv99bXzA9bGQkwmvUi4XukWlEGI0XqB+EJtx/HUJpjmyD8CgmtYXjLNYNMBpJdpU
 My7orBc3/cwb+ShNh1OAe2RVIXnouLxkk2fV1EjCp2f/TJurAEwJ6xYHN/9TfUxxstzc
 WqQfquno93e6UKop2nRofD+IWAdHACMJ6twpHojajmI/tuDmluL4jSnNDcEsrtqfpiCr
 YtJiCa8GFbA6urxCJXLF1r08+Xk7L2Pfg2t3k3mjOpqZFK0sqGrBBwdszHHwblQYIOGg
 Opmw==
X-Gm-Message-State: AOAM5307u8T3Kw6FGflCE5PzqLvdw/alvOPQquScUGxjRtNGiG8n3Tc2
 Tzqp7WphD2w35pUgRz+yAtd/Bx/lc4hijQ==
X-Google-Smtp-Source: ABdhPJzd82qQeeHHsQgkglRTtUC/lLPyj9WiHWVQggP3frnMky32FK+c7HLLqyu0Rks37HAOXr3bnA==
X-Received: by 2002:aa7:8683:0:b029:32e:2a35:941e with SMTP id
 d3-20020aa786830000b029032e2a35941emr3072513pfo.44.1626194539415; 
 Tue, 13 Jul 2021 09:42:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/14] target/openrisc: Use dc->zero in gen_add, gen_addc
Date: Tue, 13 Jul 2021 09:42:09 -0700
Message-Id: <20210713164211.1520109-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We still need the t0 temporary for computing overflow,
but we do not need to initialize it to zero first.

Reviewed-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 6aba4c2ffc..059da48475 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -199,10 +199,10 @@ static void gen_ove_cyov(DisasContext *dc)
 
 static void gen_add(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
 {
-    TCGv t0 = tcg_const_tl(0);
+    TCGv t0 = tcg_temp_new();
     TCGv res = tcg_temp_new();
 
-    tcg_gen_add2_tl(res, cpu_sr_cy, srca, t0, srcb, t0);
+    tcg_gen_add2_tl(res, cpu_sr_cy, srca, dc->zero, srcb, dc->zero);
     tcg_gen_xor_tl(cpu_sr_ov, srca, srcb);
     tcg_gen_xor_tl(t0, res, srcb);
     tcg_gen_andc_tl(cpu_sr_ov, t0, cpu_sr_ov);
@@ -216,11 +216,11 @@ static void gen_add(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
 
 static void gen_addc(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
 {
-    TCGv t0 = tcg_const_tl(0);
+    TCGv t0 = tcg_temp_new();
     TCGv res = tcg_temp_new();
 
-    tcg_gen_add2_tl(res, cpu_sr_cy, srca, t0, cpu_sr_cy, t0);
-    tcg_gen_add2_tl(res, cpu_sr_cy, res, cpu_sr_cy, srcb, t0);
+    tcg_gen_add2_tl(res, cpu_sr_cy, srca, dc->zero, cpu_sr_cy, dc->zero);
+    tcg_gen_add2_tl(res, cpu_sr_cy, res, cpu_sr_cy, srcb, dc->zero);
     tcg_gen_xor_tl(cpu_sr_ov, srca, srcb);
     tcg_gen_xor_tl(t0, res, srcb);
     tcg_gen_andc_tl(cpu_sr_ov, t0, cpu_sr_ov);
-- 
2.25.1


