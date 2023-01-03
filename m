Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6665C640
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:28:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrb-00007G-9L; Tue, 03 Jan 2023 13:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqo-0008IO-BK
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:42 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqm-00057M-Hb
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:25 -0500
Received: by mail-vs1-xe30.google.com with SMTP id l184so3938290vsc.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/p9QPpDGvjmZI1N9rUlYvW7qA56IptLsG0qWqJxJf9I=;
 b=FRR2GH0Ag6gj3iHFzxmsL/UHVe5qEhqxClc1uJ3QWSh7AAO9wsb2vin2LaRL34NG2I
 fwxer1mWD/I0C2vh/IAyUm/PS/13feGKmMyOPCBwPgc66bEqtPpOmzQkNowWCs7d44gp
 72cxSd2DYZFIS/Qi18wnHjL33SeiKpzNmSa2qmKDVOeLN6z04OmwVnTEHZShIvk8XCoJ
 QWlYQpQQAH9mPgvEjwv2JWM50jOJXVM1tU+fEmaibVtHMMtuJfKPlSUo+ivsno8YOjiC
 3onzly0HalKP7Cq57VXFgVlXnMLYoqooVrSY0hLpGIHU8sgYmV6md2VqUDYZPc80/7PQ
 FexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/p9QPpDGvjmZI1N9rUlYvW7qA56IptLsG0qWqJxJf9I=;
 b=zHxIqvsL5Xy0LB9lAm4IshT8georiAP0TPI1m28+980kgrLexrNR2cHBK+BcjAl/mv
 EMz0NKc45HRnNuhl7VSuNNzxAsPE1X8BPjVU2HFcuLQ9biz2DaJhsot1CyI7gvH25CkH
 /o7MhOZNx+GW6CSz1WTagDfKpxJWIYydc8Ol1MTeSW8jWjF3HcEp/5WhyzQkvn6kLQFi
 waiEyONUjc8Dldl4mTWrLxIUgR74yzsYFHJWib1J52n1311krNQdmEEkFMS810UB4XEs
 r+HnohNNz3vnIV9rehAVDdgvDDufJHXh5TMGorG7Sy7WTDnoVS7Xna8e+l2fhCZ/GA/k
 9y/A==
X-Gm-Message-State: AFqh2kq1MppBCdpBVohl+elPCT+vkG1BryOlkBrTNbC4JELoH9+viyim
 bkceKxH+AfD69YpZaDNXY9lxGfFZZM1/QekJUDA=
X-Google-Smtp-Source: AMrXdXvuwEoT3bE7aDRImdxticCXfZE+ZwLkn4Lfr3ge6aKhmWppbBjSdtowmcqCYqbwt79TAPev6w==
X-Received: by 2002:a67:2681:0:b0:3c4:997b:667b with SMTP id
 m123-20020a672681000000b003c4997b667bmr15874643vsm.6.1672769843258; 
 Tue, 03 Jan 2023 10:17:23 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 11/40] target/arm: Copy features from ARMCPUClass
Date: Tue,  3 Jan 2023 10:16:17 -0800
Message-Id: <20230103181646.55711-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe30.google.com
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

Create a features member in ARMCPUClass and copy to the instance in
arm_cpu_init.  Settings of this value will come in a future patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h | 18 ++++++++++++++++++
 target/arm/cpu.c     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 5509ef9d85..ac58cc3a87 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -74,8 +74,26 @@ struct ARMCPUClass {
 
     /* 'compatible' string for this CPU for Linux device trees */
     const char *dtb_compatible;
+
+    /* Internal CPU feature flags.  */
+    uint64_t features;
 };
 
+static inline int arm_class_feature(ARMCPUClass *acc, int feature)
+{
+    return (acc->features & (1ULL << feature)) != 0;
+}
+
+static inline void set_class_feature(ARMCPUClass *acc, int feature)
+{
+    acc->features |= 1ULL << feature;
+}
+
+static inline void unset_class_feature(ARMCPUClass *acc, int feature)
+{
+    acc->features &= ~(1ULL << feature);
+}
+
 void register_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1bc45b2b25..d64b86b6a5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1191,6 +1191,7 @@ static void arm_cpu_initfn(Object *obj)
     QLIST_INIT(&cpu->el_change_hooks);
 
     cpu->dtb_compatible = acc->dtb_compatible;
+    cpu->env.features = acc->features;
 
 #ifdef CONFIG_USER_ONLY
 # ifdef TARGET_AARCH64
-- 
2.34.1


