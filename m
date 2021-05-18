Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766FC388138
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:17:40 +0200 (CEST)
Received: from localhost ([::1]:43122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj69r-0003NE-EM
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64Q-0000Nn-E0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:02 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:36721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64L-0006Ab-KP
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:02 -0400
Received: by mail-oi1-x22d.google.com with SMTP id f184so10982740oig.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BX4YtBUOZyW7G2aF5M0ywa7Ji9jq6BV29m78RiFM3Wg=;
 b=i/pYn/vTOU2GJoz0/JubHPgOTBC1ydBnQOMCDUdLJ6xbX+oWLkO5uLNIEOyi+MZn9G
 G9PPv4L6WH+KjOcBsXitNVmA9D+ixuz6GExi8OxSwFMGNRNtT1fzY8J/aBSHVmks9mLQ
 7wBrYdqAcSBiqpWjmjcVllkS/RbIjayZSyD/3bLzWvgjwGOpC0n/W/+W1LJaxjqr3n+g
 0XO/QePNXERM3SE0QD6OiabCwQNTB7BzJBGToCci5T07JXV3FJQSi/wW2JA656FnxOZ8
 zJON7mh5kDBPckNm7KwqTTXvVzIgZ0nNpm1dG0geZQPKR2DzaGLX4P7G6umxRcP8JUuq
 p3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BX4YtBUOZyW7G2aF5M0ywa7Ji9jq6BV29m78RiFM3Wg=;
 b=DGd3XlrwgU1ASNsflQn+tv5WH/cOYtDfjCkArTx4IiM0n1qLaGziUyvdVGbj4zLgeS
 5BOmdK3XFRaYO1+GYyIUvwq4Z0elgLyYjoX7Hfs9uDCeEhkfnhu3eR+D/NB8mzhNyJt9
 O3mCB7uG0/ATXHw9vN2wdBZoPgrEbTZ03kFKV5AQJPv5v8iSGECVA/KSkg9FhGKwvcTd
 wpVROU0l6bzu3R1hTgbFPo8DCL/44wN01h5j/6PThY1RpOY0mRmVQJ0z5fTOkix1OtN+
 W6X2quaXPgCculoNf/nohnLzQ1Qm8NueiYmDVGXYhNauSAzSLbH52vT/cgV8u599+LBo
 RDcQ==
X-Gm-Message-State: AOAM533iNbLxeuxnA1Ao1Ur+JaJ0yU3p1QrwhEcjzhXpZs6w/nO1hAkI
 2S1wVbpzE2ps2u24lywRQ7nUe1KHkZV6z3PZ
X-Google-Smtp-Source: ABdhPJya0KvCPRsgEL9PY2L5kKyo4oadqL6bLnpSDkpYpPqoOklwygQv2siY5m2emAwui/UXwkxyUQ==
X-Received: by 2002:aca:7509:: with SMTP id q9mr622361oic.101.1621368716542;
 Tue, 18 May 2021 13:11:56 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/24] target/ppc: Remove type argument from
 ppc6xx_tlb_pte_check
Date: Tue, 18 May 2021 15:11:30 -0500
Message-Id: <20210518201146.794854-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
index e3912e4094..197a75c9e3 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -134,7 +134,7 @@ static int check_prot(int prot, MMUAccessType access_type)
  
 static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
                                 target_ulong pte1, int h,
-                                MMUAccessType access_type, int type)
+                                MMUAccessType access_type)
 {
     target_ulong ptem, mmask;
     int access, ret, pteh, ptev, pp;
@@ -316,7 +316,7 @@ static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
                   access_type == MMU_DATA_STORE ? 'S' : 'L',
                   type == ACCESS_CODE ? 'I' : 'D');
         switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
-                                     0, access_type, type)) {
+                                     0, access_type)) {
         case -3:
             /* TLB inconsistency */
             return -1;
-- 
2.25.1


