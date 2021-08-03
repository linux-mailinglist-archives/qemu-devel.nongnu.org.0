Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E3D3DE554
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:28:15 +0200 (CEST)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm2I-0006CO-85
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpv-0003r8-QG
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:28 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:50928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpu-0002Ul-2m
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:27 -0400
Received: by mail-pj1-x1034.google.com with SMTP id l19so28136639pjz.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z5GHTABClhIJC54p0f9xKGIGp+EMnbq9v7YA+T66nys=;
 b=MoTS4pJfLmTv6zSAowSW7wf8Ab4LtRtT+6zQkXw5va9+u43fACQ/Vg3NPp4hcHkiPJ
 MlEu1QDxI6+qgDQbjwx7EECaNmB+xxdmXDn528azzzmxjWJacD+YDwNs3UDwT951kQkv
 /YiwkZRW+y4MtO0phCJdB3ms4o51VZnp9ML9OtMZmqyAXSn6qvI52CHeYR/Qzkc2o9Wx
 ZVtcjMubK5qn1hS69YQEKIoKZiwa2dcmNmAH0FlRF4eR9KtzE2ZoasPNdCgHEnsOb/Ud
 OgUDlP32swikyW5bcwnSLvBs9snc964Ywr3CgW1J+Yp6Wau108UFyl7VtGhMPd+nj+Mu
 vrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z5GHTABClhIJC54p0f9xKGIGp+EMnbq9v7YA+T66nys=;
 b=odNMpGFALSWo4XR2ktHOleaTFB2Btjzt1NlwSUMWJZo6TaU7gjMxNVlwifZa0y/y9n
 LEt45Ev8ZxfqLbfdpjY2FMw4T9G7LYIw61+zzKpt1tKJfZOA5fB8XSzGZVaAxvCu1S16
 l0rUdXBiLDlQP7H2Sz8s6dyGwDBUBVIJgtZowojc7AESFqbcXssu/oPu3HPYI5gn3eU9
 47Rn6eDQlDnbJAV1dhF6TnB5wTZ3XahfrFEVkY3N2VISiVdF9Y7PKe+97FmPnGmVX1za
 rLDbuCR4Dc33Qhc9ulVgh5P1LQAlKjZ2nGNq3FZSvrxfD4+DJbtWJ/7rP799rqiWaUIZ
 emBw==
X-Gm-Message-State: AOAM530nvxV8RPH1xIsmmX9Q5dVIQT/g+eS7wLTOpg2jj0tCUozAE1iC
 aD2Fa+LPsYySfuxmpdIP9t3pn4zNHtsF5A==
X-Google-Smtp-Source: ABdhPJyoMKDFBZWuTic+dN77q9XrmYJQpvCVQEWGoqEv+ebDiiios6xyme+5CZYCyBykGXPW6nHXbw==
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr21154845pjo.22.1627964124810; 
 Mon, 02 Aug 2021 21:15:24 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/55] target/hexagon: Implement cpu_mmu_index
Date: Mon,  2 Aug 2021 18:14:21 -1000
Message-Id: <20210803041443.55452-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is trivial for user-only, but still must be present.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 2855dd3881..bde538fd5c 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -144,6 +144,15 @@ static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, target_ulong *pc,
 #endif
 }
 
+static inline int cpu_mmu_index(CPUHexagonState *env, bool ifetch)
+{
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
+#error System mode not supported on Hexagon yet
+#endif
+}
+
 typedef struct CPUHexagonState CPUArchState;
 typedef HexagonCPU ArchCPU;
 
-- 
2.25.1


