Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E649A4CB0A8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:08:52 +0100 (CET)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWDM-0005Mf-1C
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:08:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxh-0005e5-Cb
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:41 -0500
Received: from [2a00:1450:4864:20::429] (port=33662
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxf-00086L-F7
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id j17so4743877wrc.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uceZrm8t+0Mt9tyMwvyRcCiMhGjKSU6WwAbSSYwHPe8=;
 b=I0hN8BxKNuU+DNvcCTEkkqBPRvIeneOgTeEDXjvHAlPaUwBD+1vYRnV4apNFhmej8A
 7JgDysY7nFsrGLpvk64M3NKk7oNSAJZIGZ4D1Ef7xTx1YiX6GzrwO2Ya6picMfZy7w+e
 maAJlUAsScYETEsQJRyRqB2LRA1/Wq7ouny1lxBIrsCi3SxepSoESifRbx4ioJmiXDW0
 RM5ndXVkZp/tJEXIGNiIK2dYtKbDf2/0yBWbbwVT47b+L7FHYBmVrOmzMWchT1oQ1FOU
 Dijj4ij1EBSmFIG7DoEnqDSiMJiGJmWLuiu0q84RXno6h+ZwttU9c7tyEXqFeO8VOhYu
 /ZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uceZrm8t+0Mt9tyMwvyRcCiMhGjKSU6WwAbSSYwHPe8=;
 b=SHRfKqRNRXmJsi4bPZ8Jx5RNnLN9/EWnXgAfCvNo57BeX0gmCPkWNecm9NVGdVYW6o
 VR0PkKjUW2Xy0ZKbFbO+DWvtxpQFs0TqkufGstqW6XMX6zYVUUbSQub5zHzQoDdhNdNP
 sWcfM0YTWH1LkhxttuOt8LK5rPGbTxKUZ07wYROQSu2Xn+6wyPJS8y+cxHamv4Rg3OQN
 XGtBgVp6WMSF+nYO/BcGm1GevLRIcK6i0xOc8G3+K18y0k9es2n4kqZKyQ1XqncKi1IX
 iCyDp0of0iC+MgbG1vVD1PV8zL0ieFwEzY63jrNWFWP9sgg8IJwyytV7jl/HcQa1cHUz
 qa8g==
X-Gm-Message-State: AOAM533eWq3t9jt6DldXycdDYt2brR7IQFACl7yxFGslshVioMUyimzX
 FipykxWyq9uSVxmJz+bz/cWAzp6tu5f6iQ==
X-Google-Smtp-Source: ABdhPJwhjop5EkefX9CVFNv7TtP5NQmPMRIzQtZFJp6pN2gWJEuYwTf73kOVw4czmrPvo8z/USIVCA==
X-Received: by 2002:a5d:628d:0:b0:1ed:f981:ccc with SMTP id
 k13-20020a5d628d000000b001edf9810cccmr23450314wru.616.1646254358145; 
 Wed, 02 Mar 2022 12:52:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/26] target/arm: Fix early free of TCG temp in
 handle_simd_shift_fpint_conv()
Date: Wed,  2 Mar 2022 20:52:10 +0000
Message-Id: <20220302205230.2122390-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wentao_Liang <Wentao_Liang_g@163.com>

handle_simd_shift_fpint_conv() was accidentally freeing the TCG
temporary tcg_fpstatus too early, before the last use of it.  Move
the free down to where it belongs.

Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: cleaned up commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5a1df25f91e..d1a59fad9c2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9045,9 +9045,9 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
         }
     }
 
-    tcg_temp_free_ptr(tcg_fpstatus);
     tcg_temp_free_i32(tcg_shift);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    tcg_temp_free_ptr(tcg_fpstatus);
     tcg_temp_free_i32(tcg_rmode);
 }
 
-- 
2.25.1


