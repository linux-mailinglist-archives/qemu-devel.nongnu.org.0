Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8AF4EF234
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:05:23 +0200 (CEST)
Received: from localhost ([::1]:50510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIq2-0003NX-3G
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:05:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlz-0003mm-Ic
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:11 -0400
Received: from [2a00:1450:4864:20::42c] (port=33335
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlt-0005hO-0a
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c7so4756920wrd.0
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DG3ZxsNvAkuJNsVgMf6nYBpbacq0qbEwob0HWoVkXv0=;
 b=fktvPXe3Bq0kGx0N+xs7wn/F3zJCL0YwGcPWissP3E3yloNhmAMB+xd33e5YS0T9QE
 ZoSrQclIBPCs173lKWtKg2GgtXi9vxk4Na/PotyPokTahWpItxXSZM++NC096HFUu4fb
 sscKaLyHMP8rDoA4VDbddk2TMtXYP3EgH4wkd+pn3v+1sOD4cwJeRtqiV7m4Ofqqjmjj
 3W/cB6to5jx0h1y3T5bSYXxAkvgJA+G7xHmeLNdZOBfjTqCmDEGy8t+q9WpVAE87mO9q
 MVQJQUGMNH8nMz6UOIc3v3maCUGCOlYevrVwQIo/oF4lrB6f58goY2TemJJ3+g2DPhgP
 uUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DG3ZxsNvAkuJNsVgMf6nYBpbacq0qbEwob0HWoVkXv0=;
 b=tvCqs3jOgDHA8ebgriILs6bztBLm0O9jNookWWqr2E0kxeMhrulT33ZKAzNfR5MDkP
 e4FOcQpEQi5oYO0BDDIfrL2Ij9RjmbDEpbLv96lPLcRxejRfI/AceMT1GgYMRihiHVXg
 xUz8w3O0nITI4Gp6b8NsAcVQpKoJZx8m05gUF3c3NtHWygiKaAGXiJ6tpCRr5n2RNzud
 jIVgHOeWMexTQRcwljpDD9W1ZTbmpa4o15cEfXSOx1KsogXUEH6dxQXbPBh8Sy1Mvg8Y
 +JCZUFVK2LE1EJx0AxfiACFZ3gQTXYZhwbO3UpO3vkhiqWwgfxDhkaZgBtc5qbQ0TXPE
 gaqg==
X-Gm-Message-State: AOAM533Cg34zzu8m283Qo5TxHs/n8RGGL3lmpCpxDey+rIDZWq7zvTqm
 SgRZ4Hp2kY9MyanLXaFQ8awNvrZtANMCfg==
X-Google-Smtp-Source: ABdhPJxUjLfZHa1Uz+9BMTGg7QUYwk0ywbDxSzileUNb/qgx7zMnvlYrpG/d/xD6n5iEz8bKoEy+Jg==
X-Received: by 2002:adf:ef11:0:b0:205:b266:68eb with SMTP id
 e17-20020adfef11000000b00205b26668ebmr8310602wro.310.1648825263407; 
 Fri, 01 Apr 2022 08:01:03 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c020600b0038cbb21fb00sm2084023wmi.39.2022.04.01.08.01.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 08:01:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] target/arm: Check VSTCR.SW when assigning the stage 2
 output PA space
Date: Fri,  1 Apr 2022 16:00:51 +0100
Message-Id: <20220401150055.421608-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401150055.421608-1-peter.maydell@linaro.org>
References: <20220401150055.421608-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Idan Horowitz <idan.horowitz@gmail.com>

As per the AArch64.SS2OutputPASpace() psuedo-code in the ARMv8 ARM when the
PA space of the IPA is non secure, the output PA space is secure if and only
if all of the bits VTCR.<NSW, NSA>, VSTCR.<SW, SA> are not set.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220327093427.1548629-2-idan.horowitz@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3aeaea40683..a65b39625db 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12697,7 +12697,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 } else {
                     attrs->secure =
                         !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2.raw_tcr & VSTCR_SA));
+                        || (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
                 }
             }
             return 0;
-- 
2.25.1


