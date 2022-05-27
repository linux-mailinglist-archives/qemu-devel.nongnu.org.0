Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A65367BB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:56:53 +0200 (CEST)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nug4q-00060y-UX
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecQ-0003h2-51
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:28 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004RT-IL
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:25 -0400
Received: by mail-pg1-x52c.google.com with SMTP id g184so4605935pgc.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=02JdN4H2o9VVqutTBt0Mh0X95ZgODcZg43p8fFQRzHM=;
 b=OJdTzXZDnRXl5kF7BnDeRyw3dqW5oZx9eRV5aNjMU9GBAjeHIB3iepqhnNaPYhRP6H
 91jVFRxaA0jwwM6oRV3nwOtNR+7eEk8WrNfhNE2kBbEqSouwpWMMx1N9xvazkOG9eWtl
 A4FqTucj0xqOgv7NX+TaZVUKWb6Rrbc08MZq7ti4idlloy++E1BLe12VSJkk5PZSuPsw
 ntDiXvnN7D/OOoxmRG7liic9npNluLWQ4rpP070SRVpTCTIn3b/K8ocL+Nw26feJhV8n
 2PjvseHl6oym7BzJyCmBlBcXB/ineY2XILCYLShBmFiRZSIEytRO0rxzSuUpRxOIp60c
 Fsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=02JdN4H2o9VVqutTBt0Mh0X95ZgODcZg43p8fFQRzHM=;
 b=0DJIHy9qYJ5kKDcqQBJyJFHC/CjYnHVADk2Vj1OO4ZQ8sKow3hhcSm2eINnQOorZn+
 3oQhz8sNlAvvaPGpRIJft8WFQx8TCW7cG3LzfwhTQ70W3XOZ4dOZcY893A9rusUa+Aek
 ZgG5kBBqIvbJoBQqFpOs+FmQ6zAIqImj2SJF6Acr89NihCJHfTJymTYT9uhKTVfJWE3K
 rsBuGVrBrqRiWyCRnIVaxWCvgWGVtsA9Wcegnfrsbow5I93zrMk9ZQ01MJSfJyeV/he2
 AUY1etO+7a5x4+XtPQzwHnCnNDEH1LM0ZQn7D2bM3iBdvQpn581Duza8OIOJKm9Lov1u
 Mtfw==
X-Gm-Message-State: AOAM533YDWGGtDkmcmEwD4e1gy9lQqGzhq1WsvjRo/YN0eg1uICBFRyU
 1A49GGll8h7VpKHgCwsY2Nixzz/GDn8DUA==
X-Google-Smtp-Source: ABdhPJw/3T80YB45oEM6rTnYJbDFHNUegwRh8PfKgzAenuYxKf++/sU5X7d65UlpUycOblOd9bP+Zw==
X-Received: by 2002:a05:6a00:3023:b0:518:4721:13c6 with SMTP id
 ay35-20020a056a00302300b00518472113c6mr41382051pfb.34.1653675785497; 
 Fri, 27 May 2022 11:23:05 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 061/114] target/arm: Use TRANS_FEAT for do_clast_fp
Date: Fri, 27 May 2022 11:18:14 -0700
Message-Id: <20220527181907.189259-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5135866798..21c2bd099d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2542,15 +2542,8 @@ static bool do_clast_fp(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_CLASTA_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_fp(s, a, false);
-}
-
-static bool trans_CLASTB_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_fp(s, a, true);
-}
+TRANS_FEAT(CLASTA_v, aa64_sve, do_clast_fp, a, false)
+TRANS_FEAT(CLASTB_v, aa64_sve, do_clast_fp, a, true)
 
 /* Compute CLAST for a Xreg.  */
 static bool do_clast_general(DisasContext *s, arg_rpr_esz *a, bool before)
-- 
2.34.1


