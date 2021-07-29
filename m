Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA6E3D9ADF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:13:35 +0200 (CEST)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uc9-0000TL-Qg
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uD6-0005BD-Kk
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:42 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uD4-0002rC-GQ
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:40 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso6703306pjo.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWnc/AMNPTjbudsvlEpli5+u2SeQW0SQaICfIbxbpsI=;
 b=c5eqIFn4P+kTH32sENk1L2f+msX9e2av2tPkpfnpRXg/Qs4tJNhcftUjKIYTi417Uk
 gK3AvFvEsmJ8dMusB4IyjANVsmzehUSJvy2pJuPPRD0rNBpzvhWbgyQKXm6Nq2Hzf3iS
 yrkXfZmI/4XpD7Y5TboqNKy7qevwPy+wV1x/DHqCzD7q1pMmriyWNdl/S0dAqJ6MS13H
 82BcQpQGV+zZAE1sqmCqD/k5ffDBox8SdZtkWgJawr5TJRjBUK/YeXRFNQWhq6NgGfzA
 CuTKxCTl5xbxXtEbaW9FHn74oTkYY61szH7M7FH5zYIpMF15IiaFKQWJq4wvopAYUgWO
 UtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWnc/AMNPTjbudsvlEpli5+u2SeQW0SQaICfIbxbpsI=;
 b=KdoOTEJvPPsVDoz/8D6cWSlcRs513hDrTjjOnvp2sFrbaJT2TWO//Ohy2ujvkKXTf2
 jSymV/l8oNzTO4bMrpk1WcraX2QuajEgWn0tKQSLVSdE/CmSMjYBmm3Z99soi1+HHcJQ
 YZAZHdrNW2tdO6bJUvRJV7N9VOmsyDtgN3YXtaK6x+vIuwP/ANvsQy2Az4u9Mc62+oES
 kFaeo9l5u3gJ8OtW+o33QX5GGqD7tHJT5Ij9A9QhjVEmzV2qJBgQwJelZHj/zFp9ifX8
 bmcLk5Q2oy0kucIwJ23SVGkt09c5c3podEwG4SFAYP+YauAMuclrgvGCOBx4hNrM4czM
 d6Gw==
X-Gm-Message-State: AOAM53238bLcqDPtc+5phqMd4jPJJfR352tCeYlB+wLB2h8JYUB9tb46
 dT7yHh5w2I3NmT/+qX/P3EYvlflJLv9c7w==
X-Google-Smtp-Source: ABdhPJxUsvTwXx1FDH9kqpks7H15FOk2XbY8BZguozykzbH07ejxm+rMtOSFfnbXF11B1tuANOW+6Q==
X-Received: by 2002:a63:2347:: with SMTP id u7mr1466341pgm.381.1627519654560; 
 Wed, 28 Jul 2021 17:47:34 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 37/43] target/sparc: Use cpu_*_mmu instead of
 helper_*_mmu
Date: Wed, 28 Jul 2021 14:46:41 -1000
Message-Id: <20210729004647.282017-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 5c558d312a..10979404ad 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1328,27 +1328,27 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
             oi = make_memop_idx(memop, idx);
             switch (size) {
             case 1:
-                ret = helper_ret_ldub_mmu(env, addr, oi, GETPC());
+                ret = cpu_ldb_mmu(env, addr, oi, GETPC());
                 break;
             case 2:
                 if (asi & 8) {
-                    ret = helper_le_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 4:
                 if (asi & 8) {
-                    ret = helper_le_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 8:
                 if (asi & 8) {
-                    ret = helper_le_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             default:
-- 
2.25.1


