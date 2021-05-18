Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F4938815D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:27:30 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6JN-0007oG-Aq
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64d-0000ij-HA
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:15 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:41519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64Q-0006GB-Il
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:13 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 q17-20020a4a33110000b029020ebab0e615so591364ooq.8
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCYHwJd3aHPp89iGRxDBfWMsI6JKv06e4ILxtJtVTfA=;
 b=UdWIE5oPv1BNi9fV6GXVXYE9i+Vl8kHyeZH1qYh+NqvsxprJXcaMMM6gfTWzvi7SKS
 bnNwSv/p7jSnfi659yoQZHvp0EkcgkMg9Kh99DRBW5FZX6j5NQ/Th+22UfxENlAqfJl1
 QbS5qQ+8TexlyVOTKweL0ZKdkmKDljwWGOHfJqE+prwHtGJdDY6Isj0jMu/gNe24dKLa
 OtP3HHBFJ3Z1X2lLj6KDFv4swamft4DvVImBpyBt4QJasjtTk7NDG3zlWhuktlDzFJgH
 GH7jgyZdtWQgWjm8gfEE3dytHpyHP3OB0r46AmraDfZ2qpfP/gbhs5HyFZHgVf/MUovF
 6Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCYHwJd3aHPp89iGRxDBfWMsI6JKv06e4ILxtJtVTfA=;
 b=PgZa0cHeXeiH1Tqnatb+vTzQHklk27fuhuHDbWLtiA+Uf7PRFmFHeTja4Bl+mRoCMv
 ZpAt1N/uOXiiN0Rf4r9hPVy5LW12XJH/hjeaPV1XEyeaLDeGlz0/KNGbxbj5Q9fdyvN/
 7MHKnrYJRWTHpwB0SEi4mytfwlbCkCtZVkjaVQPsD7RTteo7PHt5BnLuOE1iDSjzWc29
 W6McrflZv+qrkb6i4K5rGAqHAWpI+crrEFco2qJctOVuWefZw8Ph7m/VX1dFKG8ECFmy
 XB2PwjlS7l0iwAoZ56BdrohIZSFnGdmd/iCCfrdkwb1xsV/Qeyd9R4yb3l/jHJy3zeiu
 sdtw==
X-Gm-Message-State: AOAM531D6J72AkkVwI19w8Q+B9jKp6Ba9Z4p/VYMPjKUeuLBiOsyte30
 T3mqKPMwf19UB+dI9GL26mf4FBTAcME5iSg+
X-Google-Smtp-Source: ABdhPJzyLBMgPr3lOppi9QSd3jeAGd7pHgTR4AjUvQRkIs0cdXGfceDhn44oAQVwfBsK9mTCU0hH+A==
X-Received: by 2002:a4a:ca0f:: with SMTP id w15mr5755041ooq.35.1621368721326; 
 Tue, 18 May 2021 13:12:01 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/24] target/ppc: Remove type argument from
 mmubooke_get_physical_address
Date: Tue, 18 May 2021 15:11:35 -0500
Message-Id: <20210518201146.794854-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 83e7e0dd13..bf0fcca9be 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -789,8 +789,7 @@ found_tlb:
 
 static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                                          target_ulong address,
-                                         MMUAccessType access_type,
-                                         int type)
+                                         MMUAccessType access_type)
 {
     ppcemb_tlb_t *tlb;
     hwaddr raddr;
@@ -1411,8 +1410,7 @@ static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
         }
         break;
     case POWERPC_MMU_BOOKE:
-        ret = mmubooke_get_physical_address(env, ctx, eaddr,
-                                            access_type, type);
+        ret = mmubooke_get_physical_address(env, ctx, eaddr, access_type);
         break;
     case POWERPC_MMU_BOOKE206:
         ret = mmubooke206_get_physical_address(env, ctx, eaddr, access_type,
-- 
2.25.1


