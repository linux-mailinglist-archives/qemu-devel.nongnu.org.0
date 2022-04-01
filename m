Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A84EEE07
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:24:44 +0200 (CEST)
Received: from localhost ([::1]:52218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHGd-00012r-5l
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:24:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHEl-0007gR-BA
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:47 -0400
Received: from [2607:f8b0:4864:20::229] (port=34798
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHEj-0006xt-PW
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:46 -0400
Received: by mail-oi1-x229.google.com with SMTP id v75so2817800oie.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K5QsF/Me1sMjqXAPM+MvX4EF+gM2USL9xlcban/HSlc=;
 b=O8DulEcYqp/vrodFX0dZNxQyXLKQNC3uhWIgvYWxhPhUFY+jeCk5n72x51p+RvPY1V
 b2EznYySCa+4DHgNr2jtHeU6VKrBlDMHtHkzkSSYqaem0djOptH3xm1igY21GkeeGy3K
 F72VuuyXQU4M7GTkX/paTMk1LP51Zq3jc+itWzgi2VEo4yIoNlGJyGmQGLjgAIbmBU3V
 WUSgfrtmwXZr5xecAYXVVUDllgShxuNez8wOXFuXzEuHSju5Jga64zJi0gZOc8jmUcv2
 wwbpsy4k0jb26IGdZuozn2w8+deN468t7sG/0I65EynGKgG/mzEVHBXmVcdz9B/3j3CC
 JB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K5QsF/Me1sMjqXAPM+MvX4EF+gM2USL9xlcban/HSlc=;
 b=q+PVisMPHzZ0lF0+MzR+MZJeadnazf29wNgGf54sFSSyy2AJTBzgmVT64xbrY77LEB
 NwQ7l0ZZtHiD2n05EKJXW1m9jaNe9TYse2c+Nv4r5HRop2wXi8y/wejVQhLRm5HtJkqG
 YGjqAoAWIVKcEXZfxKyJ6nx2GjEzHADcinfaSj2gB3oIn4jOlOwyqQ/rw9ksNIdAhcY6
 7HPAO+hc9ujodYnxn0aYHRPn6sTeqexMbFX4mrCdrRLrEyKPVMEBfagB6BAt4vF1f+1a
 jxPEaKj01z/yxPwXu0UdTjjE5nNKMfK3OGal65Ay/3T++BH/hX9vNOYytrT2fNWSndLA
 1B7g==
X-Gm-Message-State: AOAM530wqkIv6qv9rCrP/9vguJP9iuzQe/DA6AtKs3ep99zBfSnzSnTB
 qOPXcExTII4ADcpDShYHyzDTBZIMn3RoG5npCAY=
X-Google-Smtp-Source: ABdhPJx0pgWrWK4Rs9Fwz6UnLfwP1231FNLIOj045W9CGYrlxuQmGjt47c3kFg1oi2pR1jTJsTcMdQ==
X-Received: by 2002:aca:f288:0:b0:2f4:6cb:4c84 with SMTP id
 q130-20020acaf288000000b002f406cb4c84mr4506901oih.185.1648819364748; 
 Fri, 01 Apr 2022 06:22:44 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 x1-20020a4ae781000000b00320d5d238efsm1006935oov.3.2022.04.01.06.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 06:22:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] softfloat: Use FloatRelation within partsN_compare
Date: Fri,  1 Apr 2022 07:22:39 -0600
Message-Id: <20220401132240.79730-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401132240.79730-1-richard.henderson@linaro.org>
References: <20220401132240.79730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the return type is FloatRelation, it's clearer to
use the type for 'cmp' within the function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index db3e1f393d..bbeadaa189 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1327,16 +1327,19 @@ static FloatRelation partsN(compare)(FloatPartsN *a, FloatPartsN *b,
                                      float_status *s, bool is_quiet)
 {
     int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
-    int cmp;
 
     if (likely(ab_mask == float_cmask_normal)) {
+        FloatRelation cmp;
+
         if (a->sign != b->sign) {
             goto a_sign;
         }
-        if (a->exp != b->exp) {
-            cmp = a->exp < b->exp ? -1 : 1;
-        } else {
+        if (a->exp == b->exp) {
             cmp = frac_cmp(a, b);
+        } else if (a->exp < b->exp) {
+            cmp = float_relation_less;
+        } else {
+            cmp = float_relation_greater;
         }
         if (a->sign) {
             cmp = -cmp;
-- 
2.25.1


