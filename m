Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE132541650
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:51:13 +0200 (CEST)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygAS-0005im-Vg
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfta-00008E-97
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:46 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftR-0007RF-LZ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:46 -0400
Received: by mail-pg1-x532.google.com with SMTP id y187so16974753pgd.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCOG6DsXO7r1GwfN6wKfqvV2SzATr8uc1yKAbhFIADk=;
 b=aMuz+txlVjvsgBhdIn3WNxv49jdideVw0erSeJ1vj7cRgTP+1FfyvABHXoITRywRwa
 S2xUcVxylTDWq6oLBMn1XpvV1IO6VHfWsgFMUtKSyMskV7IQcLujlIiyk8oETNieDsns
 BC/crXwVy+HDsU8ZLOHMp9E1Qk2cQSic3hWh1ad6tu4T/3DTXI/0EQmwcbQbpjseW63z
 TOmX4ccboArq6DQujcCuMEMmbT7gWezeU7oNEGQ1KHLJ4En68d97UCx1tlnJjsLX1sMm
 lA3YT5OANU2tEXgq5438IeZz7f7dKQ2Uqx3MueNqpT2873hcMyPuZyFBgl0B0OAS57ex
 ff4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iCOG6DsXO7r1GwfN6wKfqvV2SzATr8uc1yKAbhFIADk=;
 b=Gi6KjXb4kED871/EWMtK9LBOz6a9V1vKKqkY0oZFb2XAVeq/DnXrnH/VrBQKdlkbYe
 w2+Cp3rV/r7+pUqt2xHSrRLHljPxrFAd2669Z8aZKNd6+ic9hshfgN11QVO8mDbQXOpz
 yyXmeVCR6pkxVsMJuf8nb3+9letLFtYaMav63PHTGh84alCXtZ7BFitcGv5L8A8xNKuw
 iMj+Ssv55E5qUcjbrWe9LIG2nmunIx0ADIhxMw1kZ0jUd2YEpQ1iGmzx/pQU5vM8R1t8
 oEjX/yhblv6kedrk/LMz3gyJcVlwh4vaptsmkpI6RJixPZwcxYvJ/LY9GUQ0yqCDHAzE
 uhkw==
X-Gm-Message-State: AOAM533/7kclixQGvYZUsehVWbOtPWSn7xYlrOlPo4EyKywYjknM/MQ8
 G+CF703bws/fkPmCtN0WMb1f9cJLOH4srg==
X-Google-Smtp-Source: ABdhPJxaalStAAxpYpXZVhfuHTu5xQRIcEjdFWRez0S3u1OLqQ9d+g+QjEv+X3m434DNIrSbxpWXpw==
X-Received: by 2002:a63:1152:0:b0:3fd:b58f:5be7 with SMTP id
 18-20020a631152000000b003fdb58f5be7mr11273838pgr.164.1654634016424; 
 Tue, 07 Jun 2022 13:33:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 31/71] target/arm: Move error for sve%d property to
 arm_cpu_sve_finalize
Date: Tue,  7 Jun 2022 13:32:26 -0700
Message-Id: <20220607203306.657998-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep all of the error messages together.  This does mean that
when setting many sve length properties we'll only generate
one error, but we only really need one.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 51c5d8d4bc..e18f585fa7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -487,8 +487,13 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                                   "using only sve<N> properties.\n");
             } else {
                 error_setg(errp, "cannot enable sve%d", vq * 128);
-                error_append_hint(errp, "This CPU does not support "
-                                  "the vector length %d-bits.\n", vq * 128);
+                if (vq_supported) {
+                    error_append_hint(errp, "This CPU does not support "
+                                      "the vector length %d-bits.\n", vq * 128);
+                } else {
+                    error_append_hint(errp, "SVE not supported by KVM "
+                                      "on this host\n");
+                }
             }
             return;
         } else {
@@ -606,12 +611,6 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot enable %s", name);
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
     cpu->sve_vq_map = deposit32(cpu->sve_vq_map, vq - 1, 1, value);
     cpu->sve_vq_init |= 1 << (vq - 1);
 }
-- 
2.34.1


