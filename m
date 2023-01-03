Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F1065C643
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:28:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrj-0000TB-57; Tue, 03 Jan 2023 13:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrH-0008Mi-Sn
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:55 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrF-0005HE-W9
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:55 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id o63so27788835vsc.10
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDbFWUAdD66ccbGgAfeLRZAs/Smk+GVAFx7IHK4amAk=;
 b=QIfFCDIx/W7d74QjtjWe7bt8JniVrY7ODkBsJwGryfLm9jAp3K+oF9eh23UGyaskA5
 9+ZUJr8zCkJcxqA7fljwMnWU5AGmSyD9V6KsEe7i2KkCCMQONDSBe0GL6FksPFtfdp4r
 zLxyyjES04YtJmMkKVRo1lKMbBdzALphAdct2ln5vbIS7YALojYeenm9/MUc+GmVPR6a
 Ci+6VOqkIoCqkUwj57lgGdKQIjQx+0u06pfgbe1vogvXORoNlyNPwu6WmvTrfcDJP9z0
 1XLwuwTPvuVjzZx9V+OX4TMsFtAKrTTqj6LoLrrJOnCj4K9Ft/v1fivZhIXJS5K0JolM
 O/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDbFWUAdD66ccbGgAfeLRZAs/Smk+GVAFx7IHK4amAk=;
 b=Qlh5rXxzRjoiypf+CPPIoPBIUnCtIFwJ7rc3ow711PwxaodRSv0ckHjrsV6tI50KDz
 T9GEMypVJS0sAmp1W4WN3OKFltG/5jVKMpmbik5zDgHVgSCCMN4ccwrOd78N5d1cwDin
 VXim/SnETREN3hCpVJBuvE2wfSNnlD/soKUTd2Nx6G3dwSIACI0B70//h5FTJgCN1p1L
 IWVmUwbtz6qidLBQaMaV0iOf8h0xNDsjWQKjUG7sSSHEu6Vo15/WCOHO8gOsNZRYIy3Y
 MmUI6LXs3FgaE5VPOBpnqdG1vcPw2pHTAGvT2WWz5DUDNEuQnAOu9CIMjjhoe9y4/ged
 wR4Q==
X-Gm-Message-State: AFqh2kqgdfz4BYw4+DLveuKw+PdFIGURHVDD7NgTEreO7rL6pZYio4Ts
 ZHUOZ30IyZsUln+J8vH41qFc0hcgxzuwrJyIreI=
X-Google-Smtp-Source: AMrXdXuwCjNIGQk+TxvCKCwbaNS1HP82OeSo7pgaFM39/QFBEPtEFuOxcB/m3I+/65egM4Je+WJ34w==
X-Received: by 2002:a67:b44a:0:b0:3b2:fe5e:6b73 with SMTP id
 c10-20020a67b44a000000b003b2fe5e6b73mr19424674vsm.22.1672769873102; 
 Tue, 03 Jan 2023 10:17:53 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 21/40] target/arm: Remove aarch64 check from
 aarch64_host_object_init
Date: Tue,  3 Jan 2023 10:16:27 -0800
Message-Id: <20230103181646.55711-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2e.google.com
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

Since kvm32 was removed, all kvm hosts support aarch64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 28b5a07244..668e979a24 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1095,10 +1095,8 @@ static void aarch64_host_object_init(Object *obj)
 #if defined(CONFIG_KVM)
     ARMCPU *cpu = ARM_CPU(obj);
     kvm_arm_set_cpu_features_from_host(cpu);
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
-        aarch64_add_pauth_properties(obj);
-    }
+    aarch64_add_sve_properties(obj);
+    aarch64_add_pauth_properties(obj);
 #elif defined(CONFIG_HVF)
     ARMCPU *cpu = ARM_CPU(obj);
     hvf_arm_set_cpu_features_from_host(cpu);
-- 
2.34.1


