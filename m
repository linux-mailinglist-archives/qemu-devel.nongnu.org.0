Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504C132F217
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:03:34 +0100 (CET)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEnU-0006Oo-02
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE32-0006cJ-Op
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:32 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2s-0007Rp-Lu
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:32 -0500
Received: by mail-wr1-x441.google.com with SMTP id w11so2875532wrr.10
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=T+BNs3jqiQasxTMWb+GkYs+ZhrFw1ppFah0i9JXOHB4=;
 b=f6asO3MQxGp+DKDttX2d7IIs4Hv+/VWutuJM7Pxa3FBj79BzDESq3QVXNahPRnXOI6
 BZW4gL1etXDc+YfbAauQ+CT/0ZcKfjvdCwnhN3eoXFNVTraRDWuBQExYDsqNQdObcgdY
 mPYsXYan0j33aWyVeffr5E7WnCzTXOTGD+QN74Z4Z85BZxLCOkv/bC5OJ3p51nQnOvmj
 pdP4hNkN0wgFBThR+xz5O56YgZ5L4xCtyjAN+bKrXMXEroF2Hw+h6q8/FGtBzWKTMV2P
 sBEg3GcGQUB45/oAKtrCo1a36WfFJrmbkUACOVin8WmXb3KzDy5fnEYIB726cPHA/wX2
 HHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T+BNs3jqiQasxTMWb+GkYs+ZhrFw1ppFah0i9JXOHB4=;
 b=B7LvNnL+WzBmwny4SY2Z3CKvxc/pGxQegOs/oF5YgXcE+Isic2MrH2M23mftWHqMTN
 382YHStT1ddKONeKlLnVnwVW0bBwyXYaAosUSSnAV6u6FQ2Vtz5OpWsebGxqek4mgT7i
 x1u1gJZfcyhERGfDa7p5JUcOnTvOAMfq52uYm9qVhrPR0G/7hFBpPAQR/ofrMyoNjuiK
 gRnfuej7xoHTP1s4AlONvmmxOaUfkO+0czvv4cehaWWXutWLD2ACfiDplZD0rdTpQpI8
 7TV+SJ7JaLTtGoGdf0IGv9B5Rlp+Km6SSrFh6P01rMAI+2B52t9f7joxMqHfg3FlGZQS
 MFmQ==
X-Gm-Message-State: AOAM530kdI4ccq+iHhjqeqjOQ/3iRtmS7Kn5Ci4vVURBIxqaLgC59+M9
 oWQM+nlCnJzRUG24TFgKb13mtBhTflTBxg==
X-Google-Smtp-Source: ABdhPJwS4VJeKyGcRcG7yL3P9hJyUAHF/Ecg6deu+A+0xFL31ncmNXZcSKNKGh0V2pvdPBCOxnxzMw==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr10171616wrs.34.1614964520729; 
 Fri, 05 Mar 2021 09:15:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/49] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU
Date: Fri,  5 Mar 2021 17:14:31 +0000
Message-Id: <20210305171515.1038-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rebecca Cran <rebecca@nuviainc.com>

Enable FEAT_SSBS for the "max" 32-bit CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210216224543.16142-4-rebecca@nuviainc.com
[PMM: fix typo causing compilation failure]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b8bc89e71fc..058672c9776 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2217,6 +2217,10 @@ static void arm_max_initfn(Object *obj)
         t = cpu->isar.id_pfr0;
         t = FIELD_DP32(t, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = t;
+
+        t = cpu->isar.id_pfr2;
+        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+        cpu->isar.id_pfr2 = t;
     }
 #endif
 }
-- 
2.20.1


