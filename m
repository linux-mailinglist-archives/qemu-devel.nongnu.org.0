Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122612FBACF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:13:51 +0100 (CET)
Received: from localhost ([::1]:53540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sha-00016r-2y
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf9-0007Nr-1j
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:19 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf2-00019u-L6
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:18 -0500
Received: by mail-wm1-x335.google.com with SMTP id o10so1753258wmc.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nREgtWlIkoWmnY387CBwv+BaWSwyFBmvbTtCXgk33rE=;
 b=OYZ9IVOpqA14TUatv/Ckhy8V8Ob8VD988pV0R7I7XRAmxrGIOTiT9sBVianB3S1FQG
 hmSe/Xhs2fNtBdFiKPKPZi7D+xqH+QGerK020evd/c7TEonlsg7/xJDJR0MldS/gExGd
 slYpRLkmuKuAsqF3U3qHneriTtyvsTLGA26hRdqCAoo/H71gxmsgcngi4xRUZ7ORn01G
 Vqsc/VaXA73WD1gHzuqxEhcWDp5uyVvBsDLa47xyh6LEs5jhDEXeZVMTNxNeckWCHOPi
 VYih6ZGCZznulTFWMo1d7ybZwDrsPAfCRMwMWv2wsGI1K4Ob4u3xwkAwCYeGuocLD7TX
 9wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nREgtWlIkoWmnY387CBwv+BaWSwyFBmvbTtCXgk33rE=;
 b=Rt3myC7tRWljUslCHkwwVhu4NC06zyKrkMB9sA1Ywx6OB0eN/DPTS7wpX85vRRkgOd
 pLsFwoFaXv8NA/pn+Oii6icNt7MdKHlW7rcV7F0lWCK6Os1XHMfQwvioz2OxoBdV8CGK
 Sit6Xd2Jbnsyjpf7B2xSGmpdSxV8LnniOP4FoN4BXCITUVIrJq6k3Rx5rgtHfRNBUv4J
 WV/Xbo7CS+K/Mkg0g8BY8In5spUctJJeIufFLSiL8agvAFNIHRj/p2I4g1cw7AFFpvhy
 LGugT9ry+pujyIGCzi5InhvtE6srddDp+PofhKMS3hkYinncAg9/FM8ihd0Vp++ddHmB
 Ct+Q==
X-Gm-Message-State: AOAM532XfIeoQBwcm+fsG7JzM8N9ZQp2MOEt2GbFpj+GDkfniAXBZdEy
 8WDeZRCB82vFQc8BVrJ7QIPqP6DZwEBJow==
X-Google-Smtp-Source: ABdhPJzc0rVCWF130n4Kse06eciJ7bkxwQFVmoYHIPtn2YHBZjMlpmbOCn+Rx7ZyipTV4w6sDeb84A==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr96083wmr.162.1611069070777;
 Tue, 19 Jan 2021 07:11:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/33] target/arm: add arm_is_el2_enabled() helper
Date: Tue, 19 Jan 2021 15:10:36 +0000
Message-Id: <20210119151104.16264-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This checks if EL2 is enabled (meaning EL2 registers take effects) in
the current security context.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-2-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f58aada4104..0bdda90914a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2148,6 +2148,18 @@ static inline bool arm_is_secure(CPUARMState *env)
     return arm_is_secure_below_el3(env);
 }
 
+/*
+ * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
+ * This corresponds to the pseudocode EL2Enabled()
+ */
+static inline bool arm_is_el2_enabled(CPUARMState *env)
+{
+    if (arm_feature(env, ARM_FEATURE_EL2)) {
+        return !arm_is_secure_below_el3(env);
+    }
+    return false;
+}
+
 #else
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
@@ -2158,6 +2170,11 @@ static inline bool arm_is_secure(CPUARMState *env)
 {
     return false;
 }
+
+static inline bool arm_is_el2_enabled(CPUARMState *env)
+{
+    return false;
+}
 #endif
 
 /**
-- 
2.20.1


