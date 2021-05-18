Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7AF388156
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:25:12 +0200 (CEST)
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6H9-0001oP-KT
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64f-0000s3-Rk
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:17 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:43916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64T-0006J3-4K
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:17 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 e27-20020a056820061bb029020da48eed5cso2508162oow.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMdpCRKULuXEwtYc9AZQuEF4Jiu7c6b4ewgl9c0X7gU=;
 b=Bt8bz4hiD+w2GHrkwkEpNH11z43D0PGb8VVFn0hvO184O4CNlixbDYISQR4LPv3MVT
 LYL0UzbqEQA7185lNel5yEIsa1a5FeMJ0cinwPPKGthgH2gunFjogq/caPKrUVXlWkUR
 YZ2Tnxq00RAv6R/qcx/gXFQ008xyky0vQxvqiVPZ5Kvit+3p6u7OYFqqKeeB8+DJZruE
 Kzw1p8g3TNBbzmUc9tkr65I+u1VIrFBlJxB05gCkqRZuiWkaVv5xw841VVqNbOTwoAsa
 6D/G3cHooAY1UxIqAEZSb2M6u6tTlmp/Yl9rF+oEVvVo8XjEJUd/f7fSPYHPrFyRpxOi
 Nr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMdpCRKULuXEwtYc9AZQuEF4Jiu7c6b4ewgl9c0X7gU=;
 b=sz6/42sIKdqES01+OSWqsa/QpKomFOPE1rNLEMSpD+LO7+MaDqMxd5JXN2U0PvyWog
 pSW8XLm01CJatb1GXdXSzdfqv0/wCPbUibZnn0jxlAAK5Fdnhasw1Hlc6irq9OANDga5
 YcLq64SqQIEm5GPtEPQuWChsaGn7DNZuliU767SlC4hClDqNiBrTJrIDyiLDBzBcTpLf
 Zna0E4RcQOPQzljthxTN/5YH1w9FTpt0w84Cd5LJEAtCHW5oiQ84ER42a5tQ96jared8
 3jOBfk+V96i/CxMiYzKiKsWATOAlkQIAqE9dHOMGMfceFVe+9Pmty3WSylTClMcmmhDI
 H6sg==
X-Gm-Message-State: AOAM533kLD6kHLkhirqlwU9EUuYP9jUGhUS6wKOxqU2Qt8DLIbhQo+i7
 NP24aT0VtlMkSxT4rOEcXuCp6giSYrsdnyj3
X-Google-Smtp-Source: ABdhPJwUSKeDw1auvp4v+aqk5eUl4dsPArqmS5xTDpBILHXm4VD9FgexkwMOBDCfugxCAWy1ZxOsDA==
X-Received: by 2002:a4a:b50b:: with SMTP id r11mr5875711ooo.64.1621368723267; 
 Tue, 18 May 2021 13:12:03 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/24] target/ppc: Remove type argument for
 mmubooke206_get_physical_address
Date: Tue, 18 May 2021 15:11:37 -0500
Message-Id: <20210518201146.794854-16-richard.henderson@linaro.org>
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 90038e3e76..ef634fcb33 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1026,7 +1026,7 @@ found_tlb:
 static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                                             target_ulong address,
                                             MMUAccessType access_type,
-                                            int type, int mmu_idx)
+                                            int mmu_idx)
 {
     ppcmas_tlb_t *tlb;
     hwaddr raddr;
@@ -1398,7 +1398,7 @@ static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
         break;
     case POWERPC_MMU_BOOKE206:
         ret = mmubooke206_get_physical_address(env, ctx, eaddr, access_type,
-                                               type, mmu_idx);
+                                               mmu_idx);
         break;
     case POWERPC_MMU_MPC8xx:
         /* XXX: TODO */
-- 
2.25.1


