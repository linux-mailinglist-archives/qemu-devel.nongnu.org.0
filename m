Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353974D9164
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 01:26:58 +0100 (CET)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTv1c-000413-Bg
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 20:26:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTuzv-0003Cw-CP
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 20:25:11 -0400
Received: from [2607:f8b0:4864:20::102c] (port=51045
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTuzt-0001PR-Cc
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 20:25:10 -0400
Received: by mail-pj1-x102c.google.com with SMTP id m22so16371387pja.0
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 17:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0P+G5wofUd4lFLgDTWOBTe9TXR2dgYzNF2PGbDd1RLU=;
 b=zAzvXXXIUI5k01VOgsaHNVrs5faXPXpFSyyDqjRK9hR4Nkj+g6NFhE3dxpBAv5Yy/d
 qRzLI1WTypOZtbXxcX96NE/stG0ZiSoTFMAKx01riNXu5xKq7CNykrIWE9hiZvhaoklV
 u5Za+kYnl6Fn4JIHaZrESdqZV7DJmkBBnYuv7k81E6dYxNSPIViq7yGYDY34t/mg+9WV
 zokuYYzl2WYBU4ixTyFgglWADMQhxBOgqMsMWFX+x2pL04z/VgsRJg11qs4KILR17yBS
 goG/E0Gb/eM5YjUwYz4zWFah/utiLxzXuWziCZUt9Jnkkn8U97FzcdLT29h8iHIzcMI4
 HNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0P+G5wofUd4lFLgDTWOBTe9TXR2dgYzNF2PGbDd1RLU=;
 b=GEwJgiZztEWCAmwWGmCn8f6aSKNMtYL/b6vSFB1HpJjg/Elv+rvXNOy2LF4b4GJIwQ
 K2Nuah5LtA1kKO3ASCrqN7gk7gv1Rpfi26m5CB6XlR6w7UAU2UrjwO45qldL2Z69j+DA
 sbLusUMGjpOwgPbTRofJps2VWbK7doPvRnf8GbQ7oV1s9mkykqNk7h3FevUUekwY2hFL
 GAY1RTIM8vfY8iPabEiSCMtxTvZ1ZJaj1PX7RLQuLXweQ8Hr8pP5sTOFNolwtsz9nMNQ
 KLKZUZV0b6h+lMExkWVQhjJFbFQATZln6jjL7CFysrgnLDzMfdQ1GnD8dxklQ7O0GhJo
 F8Ew==
X-Gm-Message-State: AOAM531NlZ4Ls0PoGgSaQJzho6E4mPapkMcZTcb89CPabio4zwiwM27B
 vk9MWaV+iFufHaF9t3t++P41g2abQW0kSw==
X-Google-Smtp-Source: ABdhPJwK2DSLcK/qcNEEpsXZqeWYJCdZyHqcvxbc5B1uF0VC71SdDoVnCm6EufcrDRSzPjTdg9xWtg==
X-Received: by 2002:a17:902:8c81:b0:153:4a6a:52c8 with SMTP id
 t1-20020a1709028c8100b001534a6a52c8mr13110971plo.120.1647303907647; 
 Mon, 14 Mar 2022 17:25:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 c18-20020a056a000ad200b004f0f9696578sm24387821pfl.141.2022.03.14.17.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 17:25:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: Fix cpu_ldq_be_mmu typo
Date: Mon, 14 Mar 2022 17:25:06 -0700
Message-Id: <20220315002506.152030-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the conversion to cpu_ld_*_mmu, the retaddr parameter
was corrupted in the one case of cpu_ldq_be_mmu.

Cc: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/902
Fixes: f83bcecb1 ("accel/tcg: Add cpu_{ld,st}*_mmu interfaces")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

This really should have affected all big-endian guests regardless
of the host.  I have no idea how the referenced test case fails
on s390x and ppc64le hosts, but passes on x86_64 host.


r~

---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 3b918fe..2035b2a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2174,7 +2174,7 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
 uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, oi, MO_BEUQ, helper_be_ldq_mmu);
+    return cpu_load_helper(env, addr, oi, ra, helper_be_ldq_mmu);
 }
 
 uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
-- 
1.8.3.1


