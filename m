Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097233F7366
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:37:13 +0200 (CEST)
Received: from localhost ([::1]:40046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqHQ-0005az-2o
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFy-0002hw-Ed
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFw-0005Em-0Q
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u16so35668817wrn.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X46IYmwDa0Vu+Tiq/N7j9UCGpxEaqTWhGbb7xdBU5TU=;
 b=X/m7ikXAgSy7LphyiTEgZRpVREXqQNT+qXf170Jvvv6FBa8s24fJxClFTODQ+3n6Ws
 m7siw6sYorG7xAc3ht6Q75jtOxMl4TlQmkkj8v4Cd8MghDrPOABqkEU866uJ0o+dN/Yq
 NLmB/Z/oPAUNU6ah49EvvSBHaYmip66yuJ2xjzYmGFRcydekLAnf4F8zW0gODdpVP13W
 MDNfsNWpN2+PuT5oaOtYtch7qu6puDUhnRgl9Nd0QJlhEoVCVcr9HQgg6DwN8e6HJTXZ
 DMfuC8jGffCQcKmqkNRHjjn3r6nOvpTUnHSuC89bD3DKUhBFYz9PNN2olVzOtRsuLz4T
 EJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X46IYmwDa0Vu+Tiq/N7j9UCGpxEaqTWhGbb7xdBU5TU=;
 b=EZHRnyYOoH3MqcA8yrOFTvJ3n4lHmSz4QlzveGHAnrwLnxGrQZfDMoEkSFZKC6tZyb
 I638xZ+vNgV3M8GTwkdANbDwgT+B7t/IbnuazbKNztzCu+BHqZ7OllnLCNJ2RKmFv3rH
 Ou6TskWYX6VCEoOPJ4VU5frNimvKeTxMENcY7F9wGiiNJhoWGijmoFx1oYA0qm8Zqlgx
 /pGhMfyOghuJSS39UP8eWBoOiwLuI36EbkQs91dbbA8kFII77b2PMS63D2wvvcwsjLHC
 8JvnNqSMlyGCk00ChyV4D3x5A6JiYtNR/mkQyubrLppDqgra+3mRjgGpij9tut6t6aUv
 Wddw==
X-Gm-Message-State: AOAM5316EEwPnBLmTU8BC9+hDC1GjqFfcjg7erYLRJJnRPkHs5S7oy6K
 Smwr+j8mPN4oZUXBo7fPQ2VweiDNAJIFoA==
X-Google-Smtp-Source: ABdhPJxtr0eF1/m2LYk6qNiCB0t6Wl4FTl80LtV7Drl3K9NvUcxqn61QzB3H7D/DHzUhElFsK239hA==
X-Received: by 2002:adf:b347:: with SMTP id k7mr21927125wrd.239.1629887738053; 
 Wed, 25 Aug 2021 03:35:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/44] target/arm: Print MVE VPR in CPU dumps
Date: Wed, 25 Aug 2021 11:34:52 +0100
Message-Id: <20210825103534.6936-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include the MVE VPR register value in the CPU dumps produced by
arm_cpu_dump_state() if we are printing FPU information. This
makes it easier to interpret debug logs when predication is
active.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd76588..a82e39dd97f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1017,6 +1017,9 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                          i, v);
         }
         qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            qemu_fprintf(f, "VPR: %08x\n", env->v7m.vpr);
+        }
     }
 }
 
-- 
2.20.1


