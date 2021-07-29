Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A779F3D9AB7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:00:54 +0200 (CEST)
Received: from localhost ([::1]:33448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uPt-0008Bq-Ko
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCb-0004Lw-OB
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:14 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCa-0002Y8-Ar
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:09 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so6656425pji.5
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=If88clLck1Ve4WrqmFZyOXYwzAbRNmecUVGpv0istVU=;
 b=YKLnlYmDcrq0j70cIlfTS7N9fOIQP7m6qSvT1j3wt+WWN5IGH2bE3z39PcwUfUtRQ7
 kmdwL39WVITy1YdfpDuUw1NIpQU5h2FaPFDifmq98cejX1grYGUrM5rjzZLXZ3Puv3Dx
 Ia1e2r31rKjJuk7pA5WANnMRd4fi0IzPfDfljv+aEFobuXnQm5kUOwqtvPyMoC8bU7Zk
 0mweBu/kMlY28b1Ugm8FEeZjE6Yl4LmLYAsiQMCzUIBvSuN7TDwDxqonrCnfJWc8r70E
 nQhpoGPCXVPwBQR79Q7cpUdMRT/baGSZ8/Ag0wmcHgsSCBn0USUowvp/6PbP0nzB57Pl
 fGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=If88clLck1Ve4WrqmFZyOXYwzAbRNmecUVGpv0istVU=;
 b=ExN7LufAb12YyOqAzgBmwnYaWSQHh+nmgfSpfl+0naqZmj2Xya+XgsL50dA7Sqem6E
 WxUOQCyU3CO4+VBTWfJdoejeBjxb5yhpmdejUYv8bX2d4KvqWXcWBK7gIJ8OVI8t497K
 DGND1XDhIyu1uCnckmuazEItJvsgR9FMaTfuoSSPU9yM1b7SSCGDe2HGehqb34ElcHGU
 Rqiebgw7Al2ywzTiPiPZ9piJb+nTwNFUzpu0Uy3bi+CtMLaN+WeykEmlkZ/IsEsSD4+k
 d/CNOl5dEQOj7zFdworfrQUMJ6dh7vZQ9KoyJnP8reuBdGUW08Di5RXsu4OUS9Ta+Le3
 7IHQ==
X-Gm-Message-State: AOAM530YCL3LcBIMhg5j+BmRTFu/rxj4fsXnHkxKn9eTj/vJvNoYgqe/
 4naXW0fdLMlz+Nlp/vi8lxcYgkiKwazDyg==
X-Google-Smtp-Source: ABdhPJzITQ6zK4v3aiGE8fMknp6o9x5D9UWeo1gxk66AKiprfiHGg1q5K2wEAHJPH1PDPh5FZawgLA==
X-Received: by 2002:a17:90a:b28a:: with SMTP id
 c10mr11803598pjr.59.1627519627161; 
 Wed, 28 Jul 2021 17:47:07 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 14/43] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
Date: Wed, 28 Jul 2021 14:46:18 -1000
Message-Id: <20210729004647.282017-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.  Mirror the SFSR FIXME from the sparc64
version of get_physical_address_data.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 974afea041..7367b48c8b 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1963,6 +1963,14 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
 
+#ifdef TARGET_SPARC64
+    /* FIXME: ASI field in SFSR must be set */
+    env->dmmu.sfsr = SFSR_VALID_BIT; /* Fault status register */
+    env->dmmu.sfar = addr;           /* Fault address register */
+#else
+    env->mmuregs[4] = addr;
+#endif
+
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
 #endif
-- 
2.25.1


