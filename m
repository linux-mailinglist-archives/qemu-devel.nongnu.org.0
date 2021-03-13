Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FBB339AB0
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:05:24 +0100 (CET)
Received: from localhost ([::1]:47042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsiZ-0004YK-24
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:05:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsds-00073N-3k
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:32 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdn-0003PK-AH
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:31 -0500
Received: by mail-qv1-xf36.google.com with SMTP id h13so5177986qvu.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NXtQw9hpPp+VCgrduDja0oQSnznjQ9crwR/vZ//mYY=;
 b=yrpCeqk1VagXafGqk024ELWirMpf9poxbx+QtYlGtjPsmfzQv0BYNiSNLT6U+kaKxa
 rEFAs6rqMMvF2Oqrk02Whl6mYH9WPZ2wtd2v5nzra9aPX86wsrH2yah4WeqoW/eR9NFs
 C5u4hBElSaZD+xPvvathLX0/x/1cNkIDFJQ2xQn+4lB1GF01t7SZJnuR1SdBMkkVglyQ
 6sjLNRfP3HJcMvDhN1xNRX+9qRzJTgHXu/vOsBA341GISMoMCha3aWIRQfCAEEFXQeSX
 3xrqgv7wuWdTTBPG8rSuBYuZoyLIsmK60x4iExPVi4lBZuYuMU39NNxhBZcxCHJO0K1y
 lx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NXtQw9hpPp+VCgrduDja0oQSnznjQ9crwR/vZ//mYY=;
 b=WEUOjPM2Rd+0TGDo9NDINtVOK5g71sqbAmB1Xni9jFA3aaj7KMSGgKhYAGoxSly2UQ
 +rL7r5PjgdbeSYFPFreUu6ytUuMTqvwmIMLh2rIqh9HIAOUA+Dat40HekE0EmACNrbIJ
 4SErwzL9nP52MPm25GlXx2qbaOhm8ldiXYL5K+b3WTuT44YOOu06y+8OMl2kD1gbjoo7
 Crx3wNpva/f0e4UPL8arS8YVkBLQAMxt9itHXe99HQk2JWMGRvrhWgZaWvTMnFc4FS8y
 Tra6GCEQEFXZHli+osrRIqgXYRnQfpJqnONnGfdk4xPorOLUADsz8Xa6Zba3s3zkHKX7
 EaAg==
X-Gm-Message-State: AOAM5331FDupOkfkr9yTjdx5rB1vQnVwWEF1XBcJD8LHtcadL4qhzS1h
 UQEmETunsJSmmuyLLKXk5bsCnXp6pjRMABoK
X-Google-Smtp-Source: ABdhPJwnGs8ryhN9a7YxhrJj4mG03AmiwNV7EDrhn/FOJ7YCO4WJiXLowybyOPhYUX7vNEtRjMEwTw==
X-Received: by 2002:ad4:496b:: with SMTP id p11mr14777921qvy.33.1615597225981; 
 Fri, 12 Mar 2021 17:00:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/15] target/ppc: Do not call hreg_compute_mem_idx after
 ppc_store_msr
Date: Fri, 12 Mar 2021 19:00:07 -0600
Message-Id: <20210313010018.819153-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ppc_store_msr we call hreg_compute_hflags, which itself
calls hreg_compute_mem_idx.  Rely on ppc_store_msr to update
everything required by the msr update.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/machine.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 87d7bffb86..f6eeda9642 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -125,9 +125,6 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
 
-    /* Recompute mmu indices */
-    hreg_compute_mem_idx(env);
-
     return 0;
 }
 
@@ -418,14 +415,12 @@ static int cpu_post_load(void *opaque, int version_id)
 
     /*
      * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
-     * before restoring
+     * before restoring.  Note that this recomputes hflags and mem_idx.
      */
     msr = env->msr;
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
 
-    hreg_compute_mem_idx(env);
-
     return 0;
 }
 
-- 
2.25.1


