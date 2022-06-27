Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B093E55B946
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:51:35 +0200 (CEST)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mL8-0006fw-PW
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltM-0002NT-Pb
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:54 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltK-0004uD-5X
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so5320183wml.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3IGOCsty5CkSzsrEjkN+pqZJ0VKeRGXGjb/wc7qfDxw=;
 b=lZCW7LQpoj4VWxc4zFfbKKYf2Hp3eclLg3Okg0RrW9+J5W7HjZje8ABYS+BAZ08iOG
 UKkJt1PBzPBK0pfrfbzMPvUT1BuxfV8DkkKqeA0AQuGywf1G8DJu/mVSQlQi76lcDQiB
 tZqX2salNfVpdMzxUySEaQEooMhSq/srD+lil+SvHkrtcOYBlAcjNUQrsHs/4pGR2ZHf
 +MHZ0aIsJbURwJahsqwqxv5ksTKZlO1oS5IfcIGnuYvbqiGKfMeSz6zdt7A7EdSoFbrc
 Vs2aZYvq6CWhV9UsXYMb1rhJ1kcK0mPC1VUa92d6uQeLyQJNL+N0gHI0C2OdlBti8qpW
 toPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3IGOCsty5CkSzsrEjkN+pqZJ0VKeRGXGjb/wc7qfDxw=;
 b=27UVUaHEa9OnxN5tWBZnY+lAib/JGaXAQ+FRdzEWkN0a0gjkqB/kF4EJQjC+WlYDCS
 uBCDDfqvkHXqJbADDcH+k6EVjrpjMHxA0JpswxdMQw8vO0c/XZet4CfWfXjUa/2ZaVYT
 Hlf8kZpRZaDIQxQ24TI+2fwMkCdvI2mkmJnnhWVPUKjA4A0aP3EhkRFYjJrx7hE8pxjN
 ekSJgWBRsv8UbB+NCx+jFxtuPKWfka5S6ghtvOh9K571PzhkZ7GsQPt8t3T91YPqJElq
 CW0kpMlMOixx1DH4mza/xAQ+gBQ6OwwQmtgSGvjY7HtAigSKRXIv18vKpkDfC5Efusj9
 favQ==
X-Gm-Message-State: AJIora807J7L2A/0zm83060OR/dPvEDgmm7d3JJOakKSi84RMCgO7it/
 ZBVvMlmsyO69GuhA8SOQTWgkhKmyW7DLeA==
X-Google-Smtp-Source: AGRyM1vCblH6OElq2fd8pvKnbC+vSpkVCqsU9NrUSFnsk4LZa5UQwZ02M8Pe3c6O4tlzBVpKG9ebHw==
X-Received: by 2002:a05:600c:3543:b0:3a0:2a72:e4d2 with SMTP id
 i3-20020a05600c354300b003a02a72e4d2mr19817232wmq.58.1656325368811; 
 Mon, 27 Jun 2022 03:22:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/25] target/arm: Move error for sve%d property to
 arm_cpu_sve_finalize
Date: Mon, 27 Jun 2022 11:22:25 +0100
Message-Id: <20220627102236.3097629-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Keep all of the error messages together.  This does mean that
when setting many sve length properties we'll only generate
one error, but we only really need one.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 15665c962b2..a46e40f4f2f 100644
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
2.25.1


