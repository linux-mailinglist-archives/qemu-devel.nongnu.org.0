Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB838813C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:19:20 +0200 (CEST)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6BT-0006cE-5W
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64W-0000Y4-5s
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:09 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:45578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64O-0006FH-NA
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:07 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so9736038otc.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qp5VjSCeaT10WMmzJ0whXnqim/gDuoCvf6zAj9wZwT4=;
 b=GmIT0E9dNqlPSLKX2lWhkfNbxTMjDnJPhrvCOsqWtpRcaRLDUY7RFkPprkXuj3HTSE
 U/l9Hm0OaXAZPBGcy0M2S1sd6AqkpIPqaTJsre3c1AVxjOFIfn6Y9sTnMF0hoyXhj4oQ
 TjMfvs0VJvBKRelcRc+yNxR3hHhuN0SnCiodZrMtV1U7Y2a+/o9E2J5IG04KNmiFBRou
 SW45+fDsYUyury84129J8bCa60nYe/+CGVpO6wAeidRjW6KDvh3Ikes0NvXh7jTFwbT0
 feJpf85cc93dbdnbzjszFr9o8lyg3SHxwU2RjLGWUChG8prXM8nrJvgZznkKgZHLLQyh
 YC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qp5VjSCeaT10WMmzJ0whXnqim/gDuoCvf6zAj9wZwT4=;
 b=KwXOmyR75TTwtJdXLD01cxVV8bWvShKJgd5Wze+Nz+B6FOEMUOgleoOZ7XlTA4xqPU
 592qQEWFZGYfQBePvvOzkcitSafS7q2qA0/pQIA5lxWrotqwqPCRvSEYFGUo708mlaU3
 w9wEa33fboybX4AWcWzPYtkuifpFOugO9Tns+kCSJKh+5OZmjbPImVSMq3LV8r8Qv/FS
 nD5WiYTghq1gZK0kNzU+AkQZTAVDGGWVFobzfU4B07j4YHkG75oCAZ2hwnaK+pJya4Z6
 LCvrL7jwb6iaKyZvOZ4h1syRjRG+dr6H6PcOiUC5nvFP64if4cLCvWczOR7Mt3Qj3F0K
 sr7g==
X-Gm-Message-State: AOAM531C1vmXq4T8RB9NuzN6nDhCTCjqY8H0mA/Iz+31o+ue7aqp4cP8
 qo8XdWB8klBuCZNsLYaMN3qoizBFham3VuuX
X-Google-Smtp-Source: ABdhPJwCWDS/y+BIDB/CMUjDDZvqmD/GkoSm95TIvqRYg6NJ/dlBJWYkUd+WDCZN3reRGL00w5QDKA==
X-Received: by 2002:a9d:3782:: with SMTP id x2mr5657632otb.228.1621368719402; 
 Tue, 18 May 2021 13:11:59 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/24] target/ppc: Remove type argument from
 mmu40x_get_physical_address
Date: Tue, 18 May 2021 15:11:33 -0500
Message-Id: <20210518201146.794854-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
 target/ppc/mmu_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 0809210d3b..6860a2aea0 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -662,8 +662,7 @@ static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
 
 static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                                        target_ulong address,
-                                       MMUAccessType access_type,
-                                       int type)
+                                       MMUAccessType access_type)
 {
     ppcemb_tlb_t *tlb;
     hwaddr raddr;
@@ -1426,8 +1425,7 @@ static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
         if (real_mode) {
             ret = check_physical(env, ctx, eaddr, access_type);
         } else {
-            ret = mmu40x_get_physical_address(env, ctx, eaddr,
-                                              access_type, type);
+            ret = mmu40x_get_physical_address(env, ctx, eaddr, access_type);
         }
         break;
     case POWERPC_MMU_BOOKE:
-- 
2.25.1


