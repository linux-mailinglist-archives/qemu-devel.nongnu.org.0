Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7474FAC3B
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 08:12:03 +0200 (CEST)
Received: from localhost ([::1]:57760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndQnq-0006ji-K3
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 02:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZp-0001z7-Mq
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:33 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZn-0002zU-HV
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:33 -0400
Received: by mail-pl1-x62f.google.com with SMTP id s10so3820034plg.9
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 22:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BroqQ5N0uu4nZwWtW7xJ22ciYDILNp0aXNIR5uju8Ao=;
 b=Uhto1k+dAOduyX7/+XOokKlwX1uZlDIdJNMeskp+/DoNbO8Hrv/cToki9dPW8M8mpl
 P7IAiGFBT6CoVNcB2vc25q6v/iQx4ntL10lmZTVqVobynJNoQfwrn+c7VpGj9YFOcf1H
 Gg6WmOqKKQNjAcZEGzHGXvm1bYif2J5upgwCKiMIQxXVw+wCcFPMc7SZ6Ac9vhsdK/aV
 dr4oaLEbB3xaFDqOXt65HI3rGnT1qHd5woW4UDzzaDZwVsYLx+7sRYjEo3mfZmDKprXv
 EJzoiCRxhtoSbmFWVEApDgIySS0Z8gkl7vs/J44Lgask6oyDkxQ3kJHd/WIf3JEr8VLA
 nQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BroqQ5N0uu4nZwWtW7xJ22ciYDILNp0aXNIR5uju8Ao=;
 b=Osq3luPNPFalGq5mHbj36uabBAPtd6bbjiDw/PygIXCc/C5LEIgLE+GG11U85Offmx
 R7iQggbg5WDqZie6r1OSN1vnNnTFfAOxWmDkFD/oDmHfDms+sfDa1Z82hc76Y+bO7w98
 GthSjiKDPNuuK5ir5YtDAOBenPv4ps798R/AHg01YEYJY0w44SoltDVrCTLQBKS5sQea
 OTkXPyiGf4iemuxfgfez4yENjo1Vht++Q911YSFBxXEAIsuCXfmkMW//HX85ZwYsnH32
 h9D+GksR82w2SPgkF1UUpkgzJo6A53zMLJ//N+RXtg7PdBjDV/K3vnN4vth3u3E4rFzE
 BOsQ==
X-Gm-Message-State: AOAM5334zXKrNLDLPBZgCrE7x4rvjLXpODyfogEYLz4K+IUliX/r1DIK
 Uhwws8I7hWuQDmo6tQPkeFIYltwl2JCVJw==
X-Google-Smtp-Source: ABdhPJwNb8/ZrtXLYw9SAL8LQe6gGmK/QhWje1KN+fyOrY/7pe3GlraHmA7ui2PQpUENfTIjSxV6XQ==
X-Received: by 2002:a17:902:c403:b0:158:5831:4e0e with SMTP id
 k3-20020a170902c40300b0015858314e0emr986597plk.134.1649570250214; 
 Sat, 09 Apr 2022 22:57:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Sat,  9 Apr 2022 22:57:22 -0700
Message-Id: <20220410055725.380246-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 1 +
 target/arm/cpu_tcg.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9ff08bd995..a0429538cc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -806,6 +806,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 2750cbebec..31ea5a90e0 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -77,6 +77,7 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.25.1


