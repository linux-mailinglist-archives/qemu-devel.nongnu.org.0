Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E85367B0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:49:42 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufxt-0006Gp-AX
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecU-0003r3-Tm
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:30 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004Uv-Ob
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:30 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5036062pjq.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UI60zrQ64/2PDkzPp3zl7NJRzZp6j+gQ6xmRMfRFklM=;
 b=ZgFre6cvWH5tuelJy14tOkzXOGrfaDMMsEFUNuwsWdWZDaB32kgLebisOHzoyucdPL
 qTyMGl7E9/EhsyxSCm9A/yzzlrokxUlziqKEZdkwYRJ0zazwI2Wcgq4YAj1iqDkwGUE5
 W/vYFLrg+ZYW+CnSpdFy2Qvj0g1zcApwALdnBB+Z5CfPsK0uY+3szBx6vOJk9xvN72Ds
 y98ptE1gFy76GkPql6PadqIk3UFtEIvZjQGjw9G5D6H17lGv4OBZNW88rMU6gbeBIrvJ
 /XYHHO34H9xOeGBhlDi6NnruOlnA0pip227z2DHd1TC0XpU1gnJdMh/PuqSBSojM/Qba
 I+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UI60zrQ64/2PDkzPp3zl7NJRzZp6j+gQ6xmRMfRFklM=;
 b=I69ElZZ2UxLSa/ZwTK5jsPqpjszpiZIjTfVNEEEHNcT9lG+CbfD/bJaKnGH3R3ss3o
 0gTvQMgtVUsmYM3RRsh2BO/7QRGhPxTVWRvGcIaBLj+kAjm/ZXwA9+FLCddydMngrJZX
 aPe4jX8773w8Fg03ztiuhwxTc/9BfNhjNqN/2sFoa3i89DlB17t37ezg66zXApxesiu8
 aMtJm6zwIcxCfTUCoWkOBhpCouXwRY58+rO18ntQQc9uQ7MoA0CkrHlGJ4iPW2fahatA
 Dk7KjBnOTqWhoHNcBNy9Otn5TBQotiQrVcUBkL2exmPbdpVRj6fcMGeWNMBZP/2n+67j
 kLKA==
X-Gm-Message-State: AOAM533XE1nYKTsFtV/VNeeOl4JgwNFxmMfTKVSZccxFzl8w8tpy8pt4
 v3Kt06Qc1GUB2yia/Ae8rGP4IMeRmdMgOQ==
X-Google-Smtp-Source: ABdhPJzMrKOra3jSzN8LqFS2c1aL5xwDzgPer44dGRbkX6zo9TTSZnv6o+VbBk5Iioul6lkun81jMQ==
X-Received: by 2002:a17:90b:4c88:b0:1df:c5e1:986e with SMTP id
 my8-20020a17090b4c8800b001dfc5e1986emr9687877pjb.8.1653675797478; 
 Fri, 27 May 2022 11:23:17 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 075/114] target/arm: Use TRANS_FEAT for do_zzi_sat
Date: Fri, 27 May 2022 11:18:28 -0700
Message-Id: <20220527181907.189259-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 target/arm/translate-sve.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6b2f235e4a..e6434589f4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3313,25 +3313,10 @@ static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
     return true;
 }
 
-static bool trans_SQADD_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, false, false);
-}
-
-static bool trans_UQADD_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, true, false);
-}
-
-static bool trans_SQSUB_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, false, true);
-}
-
-static bool trans_UQSUB_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, true, true);
-}
+TRANS_FEAT(SQADD_zzi, aa64_sve, do_zzi_sat, a, false, false)
+TRANS_FEAT(UQADD_zzi, aa64_sve, do_zzi_sat, a, true, false)
+TRANS_FEAT(SQSUB_zzi, aa64_sve, do_zzi_sat, a, false, true)
+TRANS_FEAT(UQSUB_zzi, aa64_sve, do_zzi_sat, a, true, true)
 
 static bool do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
 {
-- 
2.34.1


