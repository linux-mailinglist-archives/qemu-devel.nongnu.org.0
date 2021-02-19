Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35531FB9F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:05:28 +0100 (CET)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7LT-0007GI-GP
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73d-0002Sv-E8
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73E-0003Wc-8l
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:01 -0500
Received: by mail-wm1-x331.google.com with SMTP id x4so7881786wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LBypvgOw6fm7qnIXg35YZ3arVZ+jYOMAMlK4mBsw2Ys=;
 b=kxr/SdlydYAojHtL4F9wtQKTtQsLQH589tOfhDQueOiCAhKw6TOVVGxvvjHtiOl/ul
 /GYQusT4i74aMfYzIcFBVOFfHtlBmlo4eHUByJPb7wZ66XA0cR3g22ZQcp1M9nE+dWWp
 dl1PndOKMYXOfYZB5fm6c5k6djsOox8lZhJAa4uICh7NhEjzEKU0frq6VfMB8ZKImapl
 L5d0HflBVjqO2rxTxE5k0g5BGCPYQa6K8BUtdt+AwOosaQagDisXq0sfNWZoXKAc47K3
 hqPSYiDwxc1lNX2FMrqU+F0Zl4mH1izrattVGZVi+XSFHXQFtCkKERVEh/qiZ9y+/Bil
 08CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBypvgOw6fm7qnIXg35YZ3arVZ+jYOMAMlK4mBsw2Ys=;
 b=atU6GmWT16WPbytpqvJEgUPP/4yB0syALByAusFOhrrsYwxflpwNDSi22dhTOmuDrw
 +vz6P5wl8L8aWSWpAKdM1xl+IJlWWiUAainjTPcJrPNZMK63F29nJlg/ZlPxCWp4GWE2
 SxkGq4XicuNp/XlYm5btvB5acub0NYpHU2CMyu3WC2um9MtyblvT7UCSiWmXC/nyeRTe
 wY/VRYMwfQn9ME7N9OUZjRHq2wKNkogcvhF6UlSYVp+dbE1QvMgZaXYlLSAwsIcCeqYU
 YJBLvztu4Al0kH0KMDZOGFEy7IgFmMfu7LLhuWafZAVWZ8RO5haoaVZURD48aT6HfA63
 W5Mw==
X-Gm-Message-State: AOAM533TSdJde08szUUJE86meg+xHMmO/EJzD2+NsYNwK45f+2fej77u
 1IanR06YKBn3mQ5k352GjynuT9iwCLq32w==
X-Google-Smtp-Source: ABdhPJxvLe9oV3jdxZRUCsgmXRpmIBFvKMnyPn7RSps/j93UcS8QhuNX24x5gXlpYf40cUQbASixfw==
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr8497047wmj.178.1613745994743; 
 Fri, 19 Feb 2021 06:46:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/44] hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU
 stanzas to hw/misc
Date: Fri, 19 Feb 2021 14:45:52 +0000
Message-Id: <20210219144617.4782-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The ARMSSE_CPUID and ARMSSE_MHU Kconfig stanzas are for the devices
implmemented by hw/misc/cpuid.c and hw/misc/armsse-mhu.c.  Move them
to hw/misc/Kconfig where they belong.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig  | 6 ------
 hw/misc/Kconfig | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ed007267a91..0492b212840 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -521,9 +521,3 @@ config ARMSSE
     select UNIMP
     select SSE_COUNTER
     select SSE_TIMER
-
-config ARMSSE_CPUID
-    bool
-
-config ARMSSE_MHU
-    bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 19c216f3efb..16b96e4dafb 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -2,6 +2,12 @@ config APPLESMC
     bool
     depends on ISA_BUS
 
+config ARMSSE_CPUID
+    bool
+
+config ARMSSE_MHU
+    bool
+
 config MAX111X
     bool
 
-- 
2.20.1


