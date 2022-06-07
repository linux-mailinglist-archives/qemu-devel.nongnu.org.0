Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CFB54164F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:51:13 +0200 (CEST)
Received: from localhost ([::1]:57830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygAS-0005gl-0B
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftK-0007mr-LN
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:30 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftD-0007HM-Dy
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:30 -0400
Received: by mail-pl1-x631.google.com with SMTP id d22so15779427plr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVdCbtqKJB+BGb16fkMGEP1znoVx5B0GA093B8K9G20=;
 b=mu92fmZFW7YpiAu2rsNYFPmj6eW/FkAnDyXoUJQ89YmLNE3BIkOXrLebH1Fc8Bm8C8
 2QNSva+iExlPDk2cIbn4ye0e7g57X19c7u1qYqEt8lE2YjKjFlh0PWwBvegY0GJLVx7U
 1EvP2wAA6z9i8s2l/uJ3V83ueS2jqqon71TN2F5c6My6B6SNUf4A8TWVJNwuppTE7HiF
 3zaZiXh2Db3mPiTcuoZnTQphOAgWD4oyIhPjh0uK7P6nrAEN8l9b3bnWuv80vCe2kFd5
 LZmVuxYO+HmXeZlcIl30HlEZkEdBH8Ju6sLM8jyMfcvDeVu4fiOFoglSQu72gQ2ltJFs
 6XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVdCbtqKJB+BGb16fkMGEP1znoVx5B0GA093B8K9G20=;
 b=pn+1M429zMU0+v3MOM3ny1auvx7GwidTi85N7aYssDt5S5ZDYRLR7jM2uOm4ScA/TU
 hFfPUVF2XkJPziqrLtX68k/D89wxIc0vZu8K//cYOZwERRnhDWN2g1WkusYJhk+pwmNZ
 n6shbL4G2EB/UyRzmJJ0O8zgmsK0qk2ouwfzPqa0vBe4In+CTmdS4/bIvTjkkXkA8Mgs
 1/x4HZw4vlH7gbPXXOfXzFVOMQeo2vGitnEN6BMzpLwTsjwqsme4dzj29R/Qf0XXV4LP
 u4KIyI0HmV5H9ZfYwbF6OEwUg8YjzYXnmmghaZpeRYsiE/lV2MreOgP2XHgtDalYu2mi
 8D8w==
X-Gm-Message-State: AOAM532/0X+famEmE2HTaylrW5wYGEIkfIiRj+uDUt3inH3Rulkfut3q
 Dj5/0EvhCTT7iXghZIKEAG34iz4cRkVtGQ==
X-Google-Smtp-Source: ABdhPJwzWqiHR/PDkjglhNHDV2sg9WWjsVhLi7GfpMYSK5YB3DNZlSRo09dY4dv7fPZYc4Od4LaX+Q==
X-Received: by 2002:a17:902:da8d:b0:165:7c1b:6803 with SMTP id
 j13-20020a170902da8d00b001657c1b6803mr30618586plx.157.1654634002145; 
 Tue, 07 Jun 2022 13:33:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 16/71] target/arm: Use expand_pred_b in mve_helper.c
Date: Tue,  7 Jun 2022 13:32:11 -0700
Message-Id: <20220607203306.657998-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
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

Use the function instead of the array directly.

Because the function performs its own masking, via the uint8_t
parameter, we need to do nothing extra within the users: the bits
above the first 2 (_uh) or 4 (_uw) will be discarded by assignment
to the local bmask variables, and of course _uq uses the entire
uint64_t result.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 846962bf4c..403b345ea3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -726,7 +726,7 @@ static void mergemask_sb(int8_t *d, int8_t r, uint16_t mask)
 
 static void mergemask_uh(uint16_t *d, uint16_t r, uint16_t mask)
 {
-    uint16_t bmask = expand_pred_b_data[mask & 3];
+    uint16_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -737,7 +737,7 @@ static void mergemask_sh(int16_t *d, int16_t r, uint16_t mask)
 
 static void mergemask_uw(uint32_t *d, uint32_t r, uint16_t mask)
 {
-    uint32_t bmask = expand_pred_b_data[mask & 0xf];
+    uint32_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -748,7 +748,7 @@ static void mergemask_sw(int32_t *d, int32_t r, uint16_t mask)
 
 static void mergemask_uq(uint64_t *d, uint64_t r, uint16_t mask)
 {
-    uint64_t bmask = expand_pred_b_data[mask & 0xff];
+    uint64_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
-- 
2.34.1


