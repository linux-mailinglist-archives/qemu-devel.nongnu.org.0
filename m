Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854BF33C6A2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:15:44 +0100 (CET)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsgp-0002fA-Jc
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEg-0007aV-Qk
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:38 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEe-0001hr-Qj
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:38 -0400
Received: by mail-oi1-x22b.google.com with SMTP id x78so35532870oix.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2SLkDKUkvRbhYpK5cToVW+A+jc+3yI/l50hLyBp9kdo=;
 b=kWSvRFVaQzx5O7wYtw1Xtl1YUOz/E1lbaFCHnhBqUik1Nxym2RKEwDw8GiRbmnB4iX
 ug+cpJ8mCZwFum1IS3oGG0jwFRNC0X+iLxmSjJ/p555hg6RNtfiSZUkDiVB5Y7Nx7m0x
 LRNbghxETBB33HAED2fl78cl+b6047DO6gff2i97uMZimSJhBKqEhdDZcSf0BKP9LW4K
 /KN8YWdSNmHqzgcwci4WVkbsmQEJe9OG75TaDLgL5dgBceCvFjxcnz0qhvqPZAzipGD+
 NxI6Lq4YkKfDf44Z6ciA/TmqH5pL9exk7iI9n4EsjdlJGgJYav5dFhlIvJFtaxVBho35
 8Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2SLkDKUkvRbhYpK5cToVW+A+jc+3yI/l50hLyBp9kdo=;
 b=Elx+NobKapTn3pQQX/8g52LNtZnAlnU8hEZ0NOOnY/78lKlSdqPO2KLWEORTNEHYFq
 G7ILG+LCrsBGC0g+4xplvLE4QdkqQgGXNgK7olqbic9Kb/39l+dA/WUh1Hc0us7CnhBc
 TjlRSLnuz4CPoj2UZUAsG9Wy1wcg+e7dT2PeLaYlijgkD+Se88FhU8b7UdxrLSlsZTCf
 c48ubATlDyb6qI0pgBxTSgOVfSt6z4qKK5Z7CgS4ZlPr4ijBcfisLdo+QtEdUzfX1F/t
 BPGAd/PWtFYYn6rW/JbHf+nI4Pr5lAyeKvVjgfQ7dF5gO/FRFm0JbHS6bwpAYkbFi9OX
 eLiA==
X-Gm-Message-State: AOAM533KZWCegU4BFDBFd4eW8civgHSFbNY6g6lQdbmyrFYPMZ/Ynj1v
 Rmh+sNEleU/GEA4EnWijg0xUjGdeC3Lgbui3
X-Google-Smtp-Source: ABdhPJxw6io4MR0ti6lzwZp/kgY/Uh/S6WCq+gNl6B8VNDpVYMRr090Es9N2mIblptGAMLiQ2EsqSQ==
X-Received: by 2002:aca:ea8a:: with SMTP id i132mr381852oih.68.1615833995826; 
 Mon, 15 Mar 2021 11:46:35 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/17] hw/ppc/spapr_rtas: Update hflags after setting msr
Date: Mon, 15 Mar 2021 12:46:13 -0600
Message-Id: <20210315184615.1985590-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ppc/spapr_rtas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 8a79f9c628..6ec3e71757 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -51,6 +51,7 @@
 #include "target/ppc/mmu-hash64.h"
 #include "target/ppc/mmu-book3s-v3.h"
 #include "migration/blocker.h"
+#include "helper_regs.h"
 
 static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                    uint32_t token, uint32_t nargs,
@@ -163,6 +164,7 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     cpu_synchronize_state(CPU(newcpu));
 
     env->msr = (1ULL << MSR_SF) | (1ULL << MSR_ME);
+    hreg_compute_hflags(env);
 
     /* Enable Power-saving mode Exit Cause exceptions for the new CPU */
     lpcr = env->spr[SPR_LPCR];
-- 
2.25.1


