Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3029765C5F2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:19:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrX-0008OB-3B; Tue, 03 Jan 2023 13:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqW-0008G6-UU
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:20 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqV-00058X-F5
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:08 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-47fc4e98550so305385157b3.13
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWi29oKGa+vNl3/kuxAMom41NeEPlRY6brtaMJqGau4=;
 b=szhoI5zwtteKos9lUVeocuGnQAcdqo7k4yGb9qE/WsNE/JExEf2qrecxspkRSlQyuN
 QeYXjGNS4BqDVfPLCav6j/4h0K8UAsbJ74+V1HJxL0Vgg32DUOl9NrAdg4+lQvo9vrur
 /CKrPOyJgymNphAysSjDh5mmxf9oOdY2BExKccyLYRM8YncQNCQz0FqYDYmgX3H1RO+n
 uVH1Bq9d8wQSnWrPa3lHFDLCxBZK5x9mkwdVtPz27q9bdMNZh7l5/CcCu3cRv9iGAQug
 PITIYjm1akfMrNhoStub11QhqK+CtFyz7NTasnGiW5Gr/VXH0v9mC46ku0iwIg284q/N
 sTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWi29oKGa+vNl3/kuxAMom41NeEPlRY6brtaMJqGau4=;
 b=mdZ0PY2/u1pu5+02T4DE+XzG3DRH5964Nx5CjLkOPAcxqkRLKByEM9+qxbxy27WDZG
 ppjBTPE5+aIJWGWiqDrtuzLHcYY8UOuY9DWq+4Ze7sahO+pKJGNkjjMD8Ow7nWWQfOCQ
 +h0GdhSzHzjjXIX5QgWsI7J+lKl/TmTpq/oWQMiAhSHX2cwpV0wLnJS056Z11Znt9cdb
 GAScXDCtxWPA0hPUbCBMTFM1HwxrcEhBUcl8/BEGNhkVsjYcglh+Q0eV1aNJBT8Dvckh
 oXxyFMIH5Vf2sj8y/+BPliWvGHFTHEjyiVTobI90BiWyTYiv58rEUeySlNYHc9q2anKR
 tqXQ==
X-Gm-Message-State: AFqh2kpNwH0L3d6eroHvkfNkakLsiIe2ydAJhN/ovRrguwmyE8MQ5Lec
 thhGtF7zQS2rW4OPrT0EQFPol0BMM2b+FRk2sco=
X-Google-Smtp-Source: AMrXdXvrnU8AnAyG6IcZWpi0t28dyQ3I71UU65B5wVigPYTUEChuScPFe/ABaZ53CLPJydF1OLacng==
X-Received: by 2002:a81:6c56:0:b0:3d1:1a2f:2706 with SMTP id
 h83-20020a816c56000000b003d11a2f2706mr43478165ywc.50.1672769826146; 
 Tue, 03 Jan 2023 10:17:06 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 05/40] target/arm: Create arm_cpu_register_parent
Date: Tue,  3 Jan 2023 10:16:11 -0800
Message-Id: <20230103181646.55711-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1136.google.com
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

Create an arm cpu class with a specific abstract parent class.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h | 7 ++++++-
 target/arm/cpu.c     | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 514c22ced9..95f7805076 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -37,9 +37,14 @@ typedef struct ARMCPUInfo {
     void (*class_init)(ObjectClass *oc, void *data);
 } ARMCPUInfo;
 
-void arm_cpu_register(const ARMCPUInfo *info);
+void arm_cpu_register_parent(const ARMCPUInfo *info, const char *parent);
 void aarch64_cpu_register(const ARMCPUInfo *info);
 
+static inline void arm_cpu_register(const ARMCPUInfo *info)
+{
+    arm_cpu_register_parent(info, TYPE_ARM_CPU);
+}
+
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2fa022f62b..c97461e164 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2260,10 +2260,10 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
     acc->info = data;
 }
 
-void arm_cpu_register(const ARMCPUInfo *info)
+void arm_cpu_register_parent(const ARMCPUInfo *info, const char *parent)
 {
     TypeInfo type_info = {
-        .parent = TYPE_ARM_CPU,
+        .parent = parent,
         .instance_size = sizeof(ARMCPU),
         .instance_align = __alignof__(ARMCPU),
         .instance_init = arm_cpu_instance_init,
-- 
2.34.1


