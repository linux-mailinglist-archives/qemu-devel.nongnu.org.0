Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FAA424467
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:35:53 +0200 (CEST)
Received: from localhost ([::1]:40320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYApc-00022G-Fl
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAde-0007FA-8c
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:30 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:44935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdc-00089E-3e
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:30 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so2896526pjb.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gDo26nxZuCe6knbSSj4pxxnp0xROgd5wgByOtwEaQmw=;
 b=s/c35FQExy9xRKX4l99eqzFOGhsybjQrbLCBzKrgbA4FHc2Uai8Ue+XZ3vYWZzv9rC
 SFk28WSxTQ3zK7vp2fX9p5Z/ZIG1Sizzm4rixw6UCuCuo95O3CkGyVQF2R1fXEnqhXss
 6EMSZRyEJxorVeMMrZLm3K8kEk7dXB04ibWGnA9dUscSTDIuWKzZaac+a1fFsAREHz7F
 jDn4HkvmF4/65EU34Nb31lErkUNi3/eRCYdQVPFStlncfNOqMo1c2t5cQbyWwBpuQEjC
 KpZGutAdEXapD5Z+nUDIV8GtNDxViPpa4uF+fQiCAIL0EyUpB3/Ugv0p4ZHPsaPhCTxd
 TJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gDo26nxZuCe6knbSSj4pxxnp0xROgd5wgByOtwEaQmw=;
 b=f4Ym2NMFPZXv9zOw5jPMhA6BUyl8N4waQ61Fl1OSQhT88CffZGPXx/VvHhynLXmpcW
 fU9+lhGCe5z/dyROGfVoDahrg3qho4f79bxAOptIsIKLFxAglwZWTTW1nZOo8RghVOYz
 yGnTqPsZIdOXAjurb5kFn67ZK9uy+/i2p1mv7Q21nZtztdNpHmD918uB/u8nBIwoMlMt
 dxanAXEnAnw6eRbcRXMCjJRo0izOhtoeTtQXAAVnyz3JQkYFBZi8LGuoGQ6hF1PHf6+8
 sPmz2Gph/m3GyAKt5Obr+kIwKl3UC5Yj0ToKa956XMGMnKGOZnWJwebYRaVLjyCG4YNl
 ukQw==
X-Gm-Message-State: AOAM531WvfgI3SRkblfiCgTrPve/dxo+znUPLfWrjdPOHgvzM/kOJWy+
 DiKUrtcCcBX6pPxI3AWxDY2/f8uklUw94A==
X-Google-Smtp-Source: ABdhPJzUnSJa0cEFrkFkMggcAAM5uLK/h0nwpMJ90w9HEY3771VqY4H43ne79+e528AvFGIQUc4KHQ==
X-Received: by 2002:a17:902:ab4b:b0:13e:932e:f65 with SMTP id
 ij11-20020a170902ab4b00b0013e932e0f65mr11958681plb.58.1633541006787; 
 Wed, 06 Oct 2021 10:23:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/41] target/arm: Use cpu_loop_exit_sigsegv for mte tag
 lookup
Date: Wed,  6 Oct 2021 10:22:48 -0700
Message-Id: <20211006172307.780893-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new os interface for raising the exception,
rather than calling arm_cpu_tlb_fill directly.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 724175210b..e09b7e46a2 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -84,10 +84,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uintptr_t index;
 
     if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
-        /* SIGSEGV */
-        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
-                         ptr_mmu_idx, false, ra);
-        g_assert_not_reached();
+        cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
+                              !(flags & PAGE_VALID), ra);
     }
 
     /* Require both MAP_ANON and PROT_MTE for the page. */
-- 
2.25.1


