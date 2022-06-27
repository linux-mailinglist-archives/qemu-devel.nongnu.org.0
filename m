Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F2155B933
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:39:15 +0200 (CEST)
Received: from localhost ([::1]:53400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5m9C-0005Uh-2b
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltJ-0002JL-2w
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:49 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltG-0004s9-5R
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m6-20020a05600c3b0600b003a0489f412cso1151850wms.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mo4a3ghMukRKZTagsQFpVCwO5R9nPbKULZ+sDL0pomM=;
 b=n1pKZ2BRXC70h1ue4c1A4udzo/6vOUGBuUbZlJy9jqsOCXENpsEwwdj1MYcY99R7yN
 TOkngBdjKX9VbSbXvMFmCwsuDK1hMpHMXJkEWnoNHmXTmMvn20OjqCHXWCwiUnno5X6f
 EF/3F1/hGWnGefGB3S/mwGIHgIBH5ZWhfhdCbbZ02PUKUspHVNgsAZF4A0rgsfgJcjEw
 peD7Ya6gHRc2gA3Z8W+YYxHflWrwY/DDo0vmXXxaVjESgkCj9qHpEIkGhe5yfi+KyoOA
 3AE1yNZj6p+fLV5eHBWPFI927vJ0wpgKqw+o0EtkqDriec9+CMQXMbvO8zcEKzClvwsx
 WVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mo4a3ghMukRKZTagsQFpVCwO5R9nPbKULZ+sDL0pomM=;
 b=I5xv6hpNN8Z3MneDRq+0Sl1cu7q/TGREEppE4uL2d+cRESICgSXS8HdRuz9wEmgHyz
 OdiwtB4Dd6Dt00chqZayoLxgJ1dZ+aEwe4zxUU+ct8sTaP9zPlTTA0jQJtSJuRorStHU
 gP9C8GrJYruUnaejzJT7AKQ0JKo1yK6EBGD+LxJrJ9b6GqFzmT8duVW2BfZCE+3Sdu2P
 p5/TiIeUt3IDVbgZjJdx9Q3JbA4Epnpwh0qV4uTGBo0QHFBt8kj+Je3WvbAqzbQzDq62
 KvN8VejR+06CF3nyEENZ47wy7bDN6QsraOWbG98SIMx3/pkDNfDgyDRLa33Hi2WzvCWa
 4gxw==
X-Gm-Message-State: AJIora/ETXjecUaIk3LfOEqtsJ4MOK8Z+neV0gqwNP7D7Mjr2jdoA7HK
 9I5E8+tNb620MntuO27cr3Ugg1Dnd0giVg==
X-Google-Smtp-Source: AGRyM1v50/rVVeo6i5rSwTAZTYpTvh0mzKeVItaTBUylbUhVgAY6uuKMNj2lj24zMLz9trfVPgWipQ==
X-Received: by 2002:a05:600c:a47:b0:39e:f953:84e2 with SMTP id
 c7-20020a05600c0a4700b0039ef95384e2mr19168615wmq.202.1656325362997; 
 Mon, 27 Jun 2022 03:22:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/25] target/arm: Add syn_smetrap
Date: Mon, 27 Jun 2022 11:22:17 +0100
Message-Id: <20220627102236.3097629-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This will be used for raising various traps for SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/syndrome.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index c105f9e6ba5..73df5e37938 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -48,6 +48,7 @@ enum arm_exception_class {
     EC_AA64_SMC               = 0x17,
     EC_SYSTEMREGISTERTRAP     = 0x18,
     EC_SVEACCESSTRAP          = 0x19,
+    EC_SMETRAP                = 0x1d,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -68,6 +69,13 @@ enum arm_exception_class {
     EC_AA64_BKPT              = 0x3c,
 };
 
+typedef enum {
+    SME_ET_AccessTrap,
+    SME_ET_Streaming,
+    SME_ET_NotStreaming,
+    SME_ET_InactiveZA,
+} SMEExceptionType;
+
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
 #define ARM_EL_ISV_SHIFT 24
@@ -207,6 +215,12 @@ static inline uint32_t syn_sve_access_trap(void)
     return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
 }
 
+static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
+{
+    return (EC_SMETRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL) | etype;
+}
+
 static inline uint32_t syn_pactrap(void)
 {
     return EC_PACTRAP << ARM_EL_EC_SHIFT;
-- 
2.25.1


