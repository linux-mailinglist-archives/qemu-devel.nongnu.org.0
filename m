Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2318352D594
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:07:57 +0200 (CEST)
Received: from localhost ([::1]:49232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgom-0003bY-5S
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrgga-0002Bp-GY; Thu, 19 May 2022 09:59:28 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrggV-0001Yw-PU; Thu, 19 May 2022 09:59:28 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 nr2-20020a17090b240200b001df2b1bfc40so8863756pjb.5; 
 Thu, 19 May 2022 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wbk3Tw473kMoNfK7VGBxPHBOaju8kfs9PwAcUJMVe7Q=;
 b=YYhyBW9Jd1pG5irwXYTRgNx72WGUUUe+CtPZO9Fz+2g+g2TikIQ3z/ITgvrlYtcuar
 m15iGHs4lMEtJqUznNJAn6z/lL/CtNs1hSlLZlgVwq4/N/RvT+CID8ozzYv94/yZy6H2
 3ws1B8AUEs//f7gACMS1X3obqhypyBVlmV0RdRUy/kEv+b8pBc8yi8nLh6y7kxSqAZyl
 3o+hBcblocKEDa1ZdsanborFEzbTGKYE9VlqN44g31YABmU4iM/G3tft8KXnCLb3ZDPt
 aHPQ1hOqYAaYUthkFRMFCYFHHj+aa81w/v0Y0weflChiWz1l7obN+hvSoJmw9/6OdrmX
 Y7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wbk3Tw473kMoNfK7VGBxPHBOaju8kfs9PwAcUJMVe7Q=;
 b=3aXJt6oF5CudvAsXac76A0Yl/l25earjwlWUutvHZn5UMgiIPEHNKrBWCSZ+c/3avy
 bFqdJMpl9U++1fj3x+p+rmNVC9VXcmyLZDhHT4o0UFa/7KrDYRf1dE2r3Ir3uen1UAXJ
 2QZeQD/CbGUQJYOCbRBhwWBek3JRgecRGMr7+Si0xsVJn76fxq02HG4npTxyaxpJghkP
 TGniOfZqtJ9J4tDiO0RFMpzgJwPw2N0RWGNkefweqSsXv/7sZJlZ6cpc+zkz/2sqSH2t
 5yaV3oWKIp6jpWcxz9F6BbtQmo5R5EODtTK6PcZI6eHUzkwiQRNZqNUhvKeUOewdVdav
 bf0A==
X-Gm-Message-State: AOAM5323GX8MB8OAfGsqlF1yGJrZA6G3m0MVWJBToYNc2nD8FXSAb3oP
 XMVWyUyq7wLCLYzSxKbviR4T4ohUrEy1uw==
X-Google-Smtp-Source: ABdhPJyrvZ54UvMr527Zo7DSwwxwQ3N/U0/q6j5EK8PVaLoHV2Xo3f7F6f4Q6wNOz/KJdYeohU01Vw==
X-Received: by 2002:a17:90a:d505:b0:1df:7d0e:a03c with SMTP id
 t5-20020a17090ad50500b001df7d0ea03cmr6095287pju.170.1652968761850; 
 Thu, 19 May 2022 06:59:21 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.131.68])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090b078800b001d9927ef1desm5603817pjz.34.2022.05.19.06.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:59:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/4] target/ppc: Fix eieio memory ordering semantics
Date: Thu, 19 May 2022 23:59:05 +1000
Message-Id: <20220519135908.21282-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519135908.21282-1-npiggin@gmail.com>
References: <20220519135908.21282-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generated eieio memory ordering semantics do not match the
instruction definition in the architecture. Add a big comment to
explain this strange instruction and correct the memory ordering
behaviour.

Signed-off: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/translate.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index fa34f81c30..eb42f7e459 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3513,7 +3513,32 @@ static void gen_stswx(DisasContext *ctx)
 /* eieio */
 static void gen_eieio(DisasContext *ctx)
 {
-    TCGBar bar = TCG_MO_LD_ST;
+    TCGBar bar = TCG_MO_ALL;
+
+    /*
+     * eieio has complex semanitcs. It provides memory ordering between
+     * operations in the set:
+     * - loads from CI memory.
+     * - stores to CI memory.
+     * - stores to WT memory.
+     *
+     * It separately also orders memory for operations in the set:
+     * - stores to cacheble memory.
+     *
+     * It also serializes instructions:
+     * - dcbt and dcbst.
+     *
+     * It separately serializes:
+     * - tlbie and tlbsync.
+     *
+     * And separately serializes:
+     * - slbieg, slbiag, and slbsync.
+     *
+     * The end result is that CI memory ordering requires TCG_MO_ALL
+     * and it is not possible to special-case more relaxed ordering for
+     * cacheable accesses. TCG_BAR_SC is required to provide this
+     * serialization.
+     */
 
     /*
      * POWER9 has a eieio instruction variant using bit 6 as a hint to
-- 
2.35.1


