Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B130738F77D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:23:17 +0200 (CEST)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLmu-0001ZM-LJ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUx-0001ve-41
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUU-0001nz-JA
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:42 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso867066pjx.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=er/w61vzB6jmCET9oe1687J8UZHT2fYzXceEdfUCDQw=;
 b=hP0h3mhtTW6R8lC94cJAnYv1oYj1EIRRiiiGD042XD6wKIrf53KYvecEJB+WXY/wiz
 kNEU6DPtw8P0lsQFKc5LvdtrpeZAKhRjZbcDn6B6RfTWvnel2oeYrmjo2nBTQhbkUXeL
 oaBTjUdNZQe1hfMbHMFdeDO4Hk9XStw8nNNP0pP38/ishPtrS3d/KspJNv5ylvSHQVb7
 nD7/CVpBlIebtAadHR9w9txypwaWxzqdcYfC3vyVAaeCa/02pELIeZjNqW5lrmARiOKX
 XhnT29oM3yLGysSOnd1Sv/RF0eZMvnOq+3/tvG0Ei/ZFS/3Q0M7uGnkY4b3cDCFR66yj
 H7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=er/w61vzB6jmCET9oe1687J8UZHT2fYzXceEdfUCDQw=;
 b=bWmYjMB5EFokkFDL5mjwEXdBLwQUEP7N5hdQX0zL2rnIHV3Ae4zBS2jg2ddDAacHyF
 iQnjWaAz8UItVeYjMoKfaUo/QlTbBQG/kooT3wZvSi9vDEzn0ZOx6bsKeOI4e9K4uxQw
 sBE5cQ2f+PiLgwweD1F8pSHf8UcsNvDot8jSogBsGV5W89WUyJbi5tnLvCihuN4xv+tB
 4AkdPzN6IhxihU0mJUY3N5gVYeg6FzjoQe36zQY9U0qIesFde31Kqbnh4dyKL84Fuwjc
 J9DE2ngAJaoSMlWYbR+w6OokTHP2URqrqIEtmploU/eUGrVo10X0qdE4zjHWyhe/Ik16
 t3Zw==
X-Gm-Message-State: AOAM532/yZUm1OBOqTJVtZIZBQfE6dnMxAiUmgHqMjp0+Xhg9rAboxPL
 /2Luz0oGYp/5sP3Sij3Dq3z4Q8dLPC3LtA==
X-Google-Smtp-Source: ABdhPJykQIPU5/BZBULixGfub8DZy1hwnyR7bjsZx8gB21HbpYsshNmdyfc3itBPhfCLwwAlxI8iKw==
X-Received: by 2002:a17:90a:ab13:: with SMTP id
 m19mr2080492pjq.124.1621904653186; 
 Mon, 24 May 2021 18:04:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 22/92] target/arm: Implement SVE2 bitwise shift and insert
Date: Mon, 24 May 2021 18:02:48 -0700
Message-Id: <20210525010358.152808-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  5 +++++
 target/arm/translate-sve.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d3c4ec6dd1..695a16551e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1261,3 +1261,8 @@ SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
 USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
 SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
 URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
+
+## SVE2 bitwise shift and insert
+
+SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
+SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1f93b1e3fe..5e42ba350e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6428,3 +6428,13 @@ static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_ursra);
 }
+
+static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sri);
+}
+
+static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sli);
+}
-- 
2.25.1


