Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C856765C620
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrc-00009X-4t; Tue, 03 Jan 2023 13:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqj-0008IA-08
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:24 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqg-0005Ce-L8
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:19 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id g65so12258120vkh.8
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1oCoDY8fhpidPn09tNWnDVDs+nP6yjSMDN5nvvhyRs=;
 b=SkvaT8l++k2rTo+ucw3PdOj9N7qGbIGlgBdR8KQ1QRIzlXmYV8+1H4hdSMNWmq5SUc
 ILlEMJ1o8cSB/n9EaYHwU/dlajDWTnJoYTOyWd4/Dj/0xcjmnXXg9trHS8/4BoduShA3
 m5PWANUFjb6E7Ru80MjWTIN0wvPuauRchE6GIERP5SE4oJGKMTFllutkGH5yd+ddjPxn
 0V80OgwPhU92v6k7lY+fuHd8NhVit9NKzqYPuAC8PwnPG8DO22PSpPkiXJJLL5AQMyDW
 FsKpwciT57zio4bVvPXQtYXrjI7KY62ioJSejGl1mWaEY7a+axdIFJwFQZkugoy9JzAG
 wkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1oCoDY8fhpidPn09tNWnDVDs+nP6yjSMDN5nvvhyRs=;
 b=s+CWTDox+ZKJySLO5NwsSLEYn9Q9TK7ME6dg6Vs4uV47pJ33XYv3VOdzDnD/EnqKB4
 r568jJyTYF4ECdjTqPRmycQGInZmNmj84HQNLd6Z6krSLcqBuZflLfRbLSdxRpoPO8h+
 z6TTw4i4dARLQH/Rh8GQGvTl647htzuBpd4cfw3r/bfF4CxHcqCnV3seEpDhV4EbQGnf
 58gdCwqBXBeBg+C6XaeTfF4QtQe3raW8xxSw8HrT7qGnNNq8zY3iXbq+tC/+68ps3Axa
 r0/Um32MVJhDc3RRXCkjDplh0k75NhG0/PCFX5dN3/tF5BakoANhV3Vu0XuzN1RBacPD
 e+Ig==
X-Gm-Message-State: AFqh2kq/8dZAbHQFlZe4qPwMHfA1AY6JPZ58TldJ8Ng5op9PCcWPeICU
 R/mn2Sqpe+OmOBIPfc6jKsXPYt/xwOVEq8/4yyU=
X-Google-Smtp-Source: AMrXdXvZrpGXt5ZW/6W8Uxt7dQHB1FOvxKAJsbuRy4riqN/FbQCPB58gmy2rI97YnYkk7F2qem2qDw==
X-Received: by 2002:a1f:6012:0:b0:3d5:a227:6e46 with SMTP id
 u18-20020a1f6012000000b003d5a2276e46mr6572135vkb.5.1672769837686; 
 Tue, 03 Jan 2023 10:17:17 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 09/40] target/arm: Utilize arm-cpu instance_post_init hook
Date: Tue,  3 Jan 2023 10:16:15 -0800
Message-Id: <20230103181646.55711-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rather than call arm_cpu_post_init ourselves from the
object instance_init, let QOM handle this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b16d9bbe47..a6c6916f36 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2245,14 +2245,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-static void arm_cpu_instance_init(Object *obj)
-{
-    ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
-
-    acc->info->initfn(obj);
-    arm_cpu_post_init(obj);
-}
-
 static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -2270,7 +2262,7 @@ void arm_cpu_register_parent(const ARMCPUInfo *info, const char *parent)
         .parent = parent,
         .instance_size = sizeof(ARMCPU),
         .instance_align = __alignof__(ARMCPU),
-        .instance_init = arm_cpu_instance_init,
+        .instance_init = info->initfn,
         .class_size = sizeof(ARMCPUClass),
         .class_init = arm_cpu_leaf_class_init,
         .class_data = (void *)info,
@@ -2287,6 +2279,7 @@ static const TypeInfo arm_cpu_type_info = {
     .instance_size = sizeof(ARMCPU),
     .instance_align = __alignof__(ARMCPU),
     .instance_init = arm_cpu_initfn,
+    .instance_post_init = arm_cpu_post_init,
     .instance_finalize = arm_cpu_finalizefn,
     .abstract = true,
     .class_size = sizeof(ARMCPUClass),
-- 
2.34.1


