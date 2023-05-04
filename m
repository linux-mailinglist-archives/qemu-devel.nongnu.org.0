Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5BD6F693C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 12:43:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWQA-0007jN-M7; Thu, 04 May 2023 06:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWQ4-0007h0-SJ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:42:41 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWQ2-0000yG-2j
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:42:40 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94f7a0818aeso45129966b.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 03:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683196955; x=1685788955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n7vQQ3BCTeRFq/ysBUUocz5IDjn6DJp11hxaWsFLtKo=;
 b=Ues+fT0fjKGve6XPE8QqkySHLLemHX2SfNzF2f0THkp82wRSgMxGGoUIN+ampSwg5/
 iNO9I/qvhQBjDBgCoxeBNT5e3qCnwocJ3lkgNdLU5wg9Zivstd4WWc9FgP3rwKOoHkH0
 UTmWGUqEOGEfBGx0hhUN2RWEi22Uz6nx06kjk/vr7yGT5R32Z15iscFB5ff5g/pd3A7R
 TiIPiCnX024AV2aCan8BpC+jUaXgkYQQpJ+52F66V9ExAyWSxnalWVm2ZUuyZ70xaLVL
 YS2ey2JN32VBAnWJcpipLYReCyHva/U2VnfflbyBtd9N3/FM46+uHK0H5M9IdfkF111k
 3Q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683196955; x=1685788955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7vQQ3BCTeRFq/ysBUUocz5IDjn6DJp11hxaWsFLtKo=;
 b=TpbNaimSPeGgUFIEDkE0bRlCdfJAkEQYdREeUaeL3yG3Z/LTZhJOSI5WC0VGM1xWCh
 lr1HSzTxQ7g6ZZwWfHmm3kJdvn8U7waaoZdUNAVtbdFoey1NeSZCTKwb+UH0FlBRSPFA
 ELr0VslY5UA1nKdfy6tTGOD7xDYRjyylvsbk7xBO+QUG4aS+N7GWzwD56qBB9virQfdg
 w2Fc9EVO5/I5iHKgp0E/rsXIdwsmlCgAwVQ+ngzyc/zMoeG+ZCiupvgsMXhVg0iBwgvK
 mWM+0yFwQt1oE/s1+nbjQa/thWaBGKdNSuuzWreVIUZkpjPIPwLYSWJUmm/jXhyMJTqh
 dtKQ==
X-Gm-Message-State: AC+VfDyctglF5q4c33Lvb4qS+HUpETGVkn/Elu77fGFAL4LSUBn4SLoO
 GeXbRyHC1Qn3AwY5t7s27W8OlHAQ5pqR9p91dDqooQ==
X-Google-Smtp-Source: ACHHUZ5pI5Ef5pnK7O97rVmYLLOundnY27HugqSXMBsnXeP04AbXiB0I5hIesceoif6e6ZvmrICicw==
X-Received: by 2002:a17:907:948a:b0:947:5acb:920c with SMTP id
 dm10-20020a170907948a00b009475acb920cmr5989140ejc.34.1683196955009; 
 Thu, 04 May 2023 03:42:35 -0700 (PDT)
Received: from stoup.. ([91.223.100.49]) by smtp.gmail.com with ESMTPSA id
 th7-20020a1709078e0700b009596e7e0dbasm14655268ejc.162.2023.05.04.03.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 03:42:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix vd == vm overlap in sve_ldff1_z
Date: Thu,  4 May 2023 11:42:32 +0100
Message-Id: <20230504104232.1877774-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If vd == vm, copy vm to scratch, so that we can pre-zero
the output and still access the gather indicies.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1612
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index ccf5e5beca..0097522470 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -6727,6 +6727,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
     intptr_t reg_off;
     SVEHostPage info;
     target_ulong addr, in_page;
+    ARMVectorReg scratch;
 
     /* Skip to the first true predicate.  */
     reg_off = find_next_active(vg, 0, reg_max, esz);
@@ -6736,6 +6737,11 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
         return;
     }
 
+    /* Protect against overlap between vd and vm. */
+    if (unlikely(vd == vm)) {
+        vm = memcpy(&scratch, vm, reg_max);
+    }
+
     /*
      * Probe the first element, allowing faults.
      */
-- 
2.34.1


