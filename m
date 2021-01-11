Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D292F2308
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 00:13:43 +0100 (CET)
Received: from localhost ([::1]:49534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz6Na-0006a2-6L
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 18:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LL-0004gE-5c
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:11:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LG-0006Ck-Rc
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:11:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id w1so612265pjc.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 15:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=LoZfIxoD7Nz1tDre55zbWQu0XPFcB8AXj6EfmE950Jsx0jdtFtFVexhVD2cFyLyRYH
 vFOAjSmRX1AhFRNCVURM1mU5FsQ4OMZyDRVj1sR9Rs6cY2S+WwXVZR2OIzwkncgxF14u
 96y8wWqLUYYV8N/Bw182BX8p08yjRnYYi1eGN8j4oQAp603PSZVr4aiIHyA9HmduQrnk
 YmKnFOuOa2jCtXCxQYjBHPNmuM7bZx0Ue+uPi8I4Bay6tasdvjTPK/LELM16OaOTQbn4
 MS7RxXO3uE9swpV03k5g/C6jA6bxhVfCKh3JHeW+aUFO2Pnpmi1KfnHyaNYoiJq2pWB1
 02PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=dcrkXo0HkPzK17LUlZSzFE8LtmBxgbiU9Io1ytnS0kAJSMUqLHX9OX+6FkNwDxuzdF
 Ko/1fsK1UOEiZr/uDihOKe1ul8iRIBTpvMhQM/xYW1CJWNeKCPBo0/9ALnrb/apZatiP
 WUpwwkA7pOV4cHNxL8ZmLLiAdighNs388GU0mXe5gTJhDnT1I6bKhGUdShMtgF6Nx/et
 x67GrUnrP3eu6nwdA/LFJgq3RTATbtKpBc8y7Ae/8BHyQX5ixdIqYnX0fyfHSwAW8Iaf
 BoIV9ROF8NayMIUGx7mCxNFbjTSb8z519CwHOBaifu4ykWWLuKwegI9xxFOZN7s99jQv
 c1Ug==
X-Gm-Message-State: AOAM530S5SnT5wJyyR9y1HQU6dDMMF02a59KG0mxIeYzB6cSHtifl1hi
 LNepkYnbNt+Vf/S7q0+HNmJtAPlp4pXRnA==
X-Google-Smtp-Source: ABdhPJy+cJglhwlafMvPRB6kj4gljIHPPNJXWsRCX5HZZsfXp/Hk9kc7ddJNQhSL4bPHd5g7gpF66A==
X-Received: by 2002:a17:90a:c082:: with SMTP id
 o2mr1211934pjs.197.1610406677218; 
 Mon, 11 Jan 2021 15:11:17 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g202sm658105pfb.196.2021.01.11.15.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:11:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/3] target/arm: Use object_property_add_bool for "sve"
 property
Date: Mon, 11 Jan 2021 13:11:08 -1000
Message-Id: <20210111231108.461088-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111231108.461088-1-richard.henderson@linaro.org>
References: <20210111231108.461088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The interface for object_property_add_bool is simpler,
making the code easier to understand.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d9feaa9cdb..8e1fad00bb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -488,6 +488,12 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
     cpu->sve_max_vq = max_vq;
 }
 
+/*
+ * Note that cpu_arm_get/set_sve_vq cannot use the simpler
+ * object_property_add_bool interface because they make use
+ * of the contents of "name" to determine which bit on which
+ * to operate.
+ */
 static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
@@ -529,26 +535,17 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
     set_bit(vq - 1, cpu->sve_vq_init);
 }
 
-static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
-                            void *opaque, Error **errp)
+static bool cpu_arm_get_sve(Object *obj, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    bool value = cpu_isar_feature(aa64_sve, cpu);
-
-    visit_type_bool(v, name, &value, errp);
+    return cpu_isar_feature(aa64_sve, cpu);
 }
 
-static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
-                            void *opaque, Error **errp)
+static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    bool value;
     uint64_t t;
 
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-
     if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
         error_setg(errp, "'sve' feature not supported by KVM on this host");
         return;
@@ -563,8 +560,7 @@ void aarch64_add_sve_properties(Object *obj)
 {
     uint32_t vq;
 
-    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                        cpu_arm_set_sve, NULL, NULL);
+    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
 
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
         char name[8];
-- 
2.25.1


