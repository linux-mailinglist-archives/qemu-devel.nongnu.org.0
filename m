Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947416AC5A2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:38:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrV-00046a-Mh; Mon, 06 Mar 2023 10:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrT-00045F-C2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:51 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrR-000289-Po
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:51 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so5452513wmq.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=u60JaY9ygpTLAXRdoEzrXQjDtvq2cbnHTzXyUO3Dx2k=;
 b=l+ngQyuN2Nkwv4wODitLUNgMP3+oHoTXVXjM2RmZK5t3vUmGLUJYB7LwgzKlkVykKK
 BdYjOqWuT6gTy5VdkdYPjLhmcndfgXqsDgDbyHx5Yd6OWiWupU95uJKMZdHakkcvVfb1
 QHWJnhVwVlmi7c8wwbH4V+Fw6gy5iM2p8SBIUhiH+w+Zb26jFJvO42UWChtq4TKEwZu2
 6yb9HKYbekiUKyZPCBfUqrk4zRbyAgzxPWXDRt6vxdeaMTMDgbEkY9UfZrYKxycxJuQg
 R1BGrxTckzsT6axfqMwO21zVEDk6kSMHhxutB4pw1FoQi0yTanBrFJqipN54rA3+bz8k
 Vmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u60JaY9ygpTLAXRdoEzrXQjDtvq2cbnHTzXyUO3Dx2k=;
 b=zGlsLfVSVOxpIIM9T1x3wzqQ7tSG/qUP9AjbweosqpO6275Zl30+trniFdnaDM/eCV
 1jp7Ax7nkIBQ5qqVxEYFr7HEbVsRolwQjLiV42THl7wrHkp2HN3tmH1Xz6kITxX7CxjM
 dVTfiWlZl9gGAKbPkor3FyJOAJPzBLDy52e13rDS8vzDhJH2pChttGmpJo8M7eBbQ2zp
 A8mJTPmi/K5Kb7EJo2YFfVEgyiakmhA9emZXjLVcurUprmtDU0FeF11so0begNJXP6Zf
 GGOnSQnUKg5o3JislHhKAVS6IJ6seiubW2hJb8dwRUVPuYVBJJjzxY35DURZZjOQ+P/I
 6QVg==
X-Gm-Message-State: AO0yUKVSWnsS/reegbCumvzBZbmQxq43KHkhc7pTV/1Te5+ZjnVK8R57
 k23mVXUjAjcBv5apGqH1pMXRjAsl7d9Z+byQkMg=
X-Google-Smtp-Source: AK7set+CeeNXPs5l6p+mgANrCU5efmxuAxEFI9MtQ6NP3VaNheHNgDi0mtmqZCL1s5M7mDYtJiUfqA==
X-Received: by 2002:a05:600c:35d5:b0:3eb:3945:d3fd with SMTP id
 r21-20020a05600c35d500b003eb3945d3fdmr9598810wmq.14.1678116889120; 
 Mon, 06 Mar 2023 07:34:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/21] target/arm: Handle m-profile in arm_is_secure
Date: Mon,  6 Mar 2023 15:34:29 +0000
Message-Id: <20230306153435.490894-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1421
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227225832.816605-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c4bd22808ce..ab187012770 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2421,6 +2421,9 @@ static inline bool arm_is_el3_or_mon(CPUARMState *env)
 /* Return true if the processor is in secure state */
 static inline bool arm_is_secure(CPUARMState *env)
 {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return env->v7m.secure;
+    }
     if (arm_is_el3_or_mon(env)) {
         return true;
     }
-- 
2.34.1


