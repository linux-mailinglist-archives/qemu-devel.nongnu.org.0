Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7513708A1
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:01:56 +0200 (CEST)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcusF-0007Hr-BQ
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuai-0008HM-EP
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:48 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaV-00006d-FZ
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:48 -0400
Received: by mail-pg1-x532.google.com with SMTP id m12so829374pgr.9
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ANqvCljUwyEEHHedDj3/bUM/EvfjNzycWYdOdklpBSg=;
 b=FDphD1SovhgYYeZsb5ONkplhdEcaGaFD6GWJXRFSD10rs1IFqyX92NwqWvKOwV2OKy
 VrXuXkJXArKqsQE6AkykrJXhW4eZyYoTwrfbGGzmJ3+At7HX/aWDCiJ/YH6PXpwSEu3q
 /5Q2KLk0KRs/bbGdIbPBcxYmAlZNFUgIuSI6OfADkgDyO7RTtM3jL4NfyFUXwBtRDNCa
 QesapefgMLyHEYO9s/yexwZx6FZGGAGUID6cXepZjJvRCaX8YoIuqrCs39ZsSutDvRWp
 yPHJWS6sz3Vi7h559Ag2YwvuD30vi/1yq9K7xpL+oVmlUxD0czc1e1I37KuQ3dqGN/oA
 us0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ANqvCljUwyEEHHedDj3/bUM/EvfjNzycWYdOdklpBSg=;
 b=kRw3e+jlrXklpRCvhKpvXiaMKpIgEi0MnwVQmvQ3ZKRgLVyd4TF0SahIQfL40pTI6l
 fr2srUVb8cvNGdyE4x6kbNC1azwLckrxcRBKTlETSeeA+pCVGzLSKbsq9jPfVW+OuX6T
 2u5oPkmvrKCTwsae2x36cvmvi5WwSpdxSGPjTHFsO+p3uA5ITJ/nVaevZ1BHyG/M4PVo
 jnqiOiYu/oCKLKp5S88Z6fqbd4PgQoallcUwYefZjbDdSWyxrg9lafZ/TO5tvduEWSoe
 1sEarGMc6yV/ZPautOFFMX1H00o9BlsaHt9erfUbJC1iM3VfguXLsWmVUYXl+CiMBeGu
 CxWA==
X-Gm-Message-State: AOAM531zoHhcDmFHKIo6B7SVfjCyNH+50Tpczk4vAjmgEmq3EhOKGaQV
 tkI73Hp4ztXeIkMPgPiR6JIfIH1BPlIiRg==
X-Google-Smtp-Source: ABdhPJyAhe6P/pGkZ16WmAh8bojrIjRAXvvDa0bL2wEh/rDKudeuGxo11LxyRycsfmPXMTRPzWPZCA==
X-Received: by 2002:aa7:9731:0:b029:28e:46dd:97c7 with SMTP id
 k17-20020aa797310000b029028e46dd97c7mr3310814pfg.27.1619894614246; 
 Sat, 01 May 2021 11:43:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/31] Hexagon (target/hexagon) change type of
 softfloat_roundingmodes
Date: Sat,  1 May 2021 11:43:07 -0700
Message-Id: <20210501184324.1338186-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-10-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/arch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 699e2cfb8f..bb51f19a3d 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -95,7 +95,7 @@ int32_t conv_round(int32_t a, int n)
 
 /* Floating Point Stuff */
 
-static const int softfloat_roundingmodes[] = {
+static const FloatRoundMode softfloat_roundingmodes[] = {
     float_round_nearest_even,
     float_round_to_zero,
     float_round_down,
-- 
2.25.1


