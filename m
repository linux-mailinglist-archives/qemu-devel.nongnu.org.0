Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21C663E9FC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:50:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dNG-0002up-H7; Thu, 01 Dec 2022 01:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhoff749@gmail.com>)
 id 1p0dN2-0002t0-Pq
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:48:33 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dhoff749@gmail.com>)
 id 1p0dN1-0005Zb-7z
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:48:32 -0500
Received: by mail-qv1-xf34.google.com with SMTP id q10so721082qvt.10
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 22:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UucLXh0bkSc/Y9kQoyoC2lXw8T18ROHjCmeP67b4XCM=;
 b=fSDDCvcFPkNNw6FLWJHjqK2bNpZUWWoJ7fTvwi/7jZyfuy9TGBhAue3Zvgf9kXNdUo
 H0Bh4jZSdbKG2gbkdf/D2REayrDSbYqIF4j3DohaqcDSd/wVs94Q8WQHQvats3PDp6a0
 YSdAFQn/AzZBCEedC9o6U3n7UzUKx1XZwVhktdzcmRtCaq2aHL0ygkKDxbrv3HX8h6SL
 QrrqssItBF1jTYkR7MGefwe7lN35gKIx+wWirlA8YD3Ub3gi9MvkDTown5mJxxg+Hfja
 qgplhX5GRRJa6VwSfTqZejoIUDVSdz9TWZgE/dSzZX6eP8nOIi3u8E7eJSHgmuRAe//k
 E/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UucLXh0bkSc/Y9kQoyoC2lXw8T18ROHjCmeP67b4XCM=;
 b=LpQWvv2aACZBKkDdqjJNiFYynjdXF8ztzaqByTe1LGZMmSwPzW4pJ1GXKVQhneCnbf
 CBgRX6jIxxU447PkGY7i2fFC6XOH7cd+1rQTbAPNDzqy48REnpSq+YIbUcW5vMJE7V2a
 P31eRboy5JjIKCF76YUqWHjM7RzIez0NZk3X45Fzl+xP0Vc73OoCgYjqns3X0QWqbF8m
 pq4Kp50hNUFmEKQZeQcrEFPSfp0T03RUNco64VFYKvVNeF8ORzyxfs98fV6Kkjm1dxzS
 67vWwBOnb0YD1hCpuH60PUMTwcPsTKsacQkJNB7e3QIY9MOKNSu+LY1A/Hj8JeoP+tWC
 d+3g==
X-Gm-Message-State: ANoB5plR2DNhP2e42OQSfLosffagRBhAm8LS7Kdh4JHspl/RGLqcJTrQ
 /p79JjqwG0+aJmdLJ0qJcFf1XV58jSQ=
X-Google-Smtp-Source: AA0mqf4jkZ+e5yKmqRoXU6bDeaGM+XLm9TDjfTKTJbkwuBtFo4qgbh7AroxnhQlFUBTZachUQ8627w==
X-Received: by 2002:a05:6214:221:b0:4bb:6aac:5b5d with SMTP id
 j1-20020a056214022100b004bb6aac5b5dmr40460526qvt.57.1669877308726; 
 Wed, 30 Nov 2022 22:48:28 -0800 (PST)
Received: from lft-vm.tuyobwrpnb0enbtwqcvs3babjg.cx.internal.cloudapp.net
 ([20.94.93.94]) by smtp.gmail.com with ESMTPSA id
 q10-20020a05620a0d8a00b006eeae49537bsm2911645qkl.98.2022.11.30.22.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 22:48:28 -0800 (PST)
From: Daniel Hoffman <dhoff749@gmail.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 Daniel Hoffman <dhoff749@gmail.com>
Subject: [PATCH] accel/tcg: Fix undefined jump with x86_cpu_tlb_fill
Date: Thu,  1 Dec 2022 06:48:13 +0000
Message-Id: <20221201064813.1315752-1-dhoff749@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=dhoff749@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 405a5d414a..6a93e96eb7 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -595,6 +595,7 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     CPUX86State *env = cs->env_ptr;
     TranslateResult out;
     TranslateFault err;
+    bool use_stage2 = env->hflags2 & HF2_NPT_MASK;
 
     if (get_physical_address(env, addr, access_type, mmu_idx, &out, &err)) {
         /*
@@ -615,7 +616,7 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         return false;
     }
 
-    if (err.stage2 != S2_NONE) {
+    if (use_stage2 && err.stage2 != S2_NONE) {
         raise_stage2(env, &err, retaddr);
     }
 
-- 
2.34.1


