Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC98D3368F6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:37:29 +0100 (CET)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9KS-0006Cp-V3
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK960-00055d-Sw
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:32 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95w-0001Qg-6B
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:32 -0500
Received: by mail-ot1-x330.google.com with SMTP id p24so4410952ota.11
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gB+beu2+0kxeUH+95czu1qq98yjGWErKRORgj/iggWM=;
 b=vwwzYh6uPZEyyiuzVMFmQ6VoA09kCGxqKjzUQoauylyiBe4qi4DqYlh8K1EzQi8Spn
 lT0iGi+y6oH7byusBbYrQFiaMb7Gp4B+Fo8caR8EpDqkuwl3Ecq9On2rhQnZuzlicdvC
 jImONtnzHjjy4UDc7GtgoNOkQxSOiJzzpH7vRHqVvg1F+QR0ejee+tkI/l0KA6hbE6M/
 kI9VknjfcnNbiHug1ENSPvqAAdzGEKWw0ebFA3nJDSYTzs1ecaIuTv+x9PUCDKwcB6mk
 BvAluuVgEKuPHpFeDEYJ1nhT33jEt/GJkD64cJ0UNFw5l8RbtzqdEJSYQiyU1Pv+RyRe
 AZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gB+beu2+0kxeUH+95czu1qq98yjGWErKRORgj/iggWM=;
 b=A7eX/gryfs9i1JQ8OxIOdyTQjNtSIWqJhwaghVsIxU1K/N2RDF7+emtuhMi5bxNFFe
 /UjoAlg9Bf4pRaU3luLSHQlu2JscZfVAHpFYm0a9fi+/SXKcrxbbRjllfdJp+P2NlfZ+
 UxulxbWjM+B/+X61yoYJ9c3MqtkpiXGZvARbASSo/oWFPoncIlcsKswwTw+zFPro+KLm
 KL+KexCF9PluwEnFpXhgqXajy7db96WWx2cJeiE79KUM0DHWV1fOozjDDxJwFh2UNlpY
 PWWtT+ILFJGL+2MGhuzyqIHDYzPGgnsV7Pgfi5+uYTJYFzb7Fjd1AP7XeA/7OT9fDy/Z
 2hFA==
X-Gm-Message-State: AOAM532E7lMJOIDC0TgYd1V/Z+XO25X2CPcH9VRUNbD+VnyghhnlU0qf
 RmmZu9K3P3ulotwIIEZ2l/Rjek7BNXw0kGJ3
X-Google-Smtp-Source: ABdhPJyuSlUBuILbnJwEbcq6b+Tch3fz5ZUn50k74ljZCrYlig52Ts+kjBcVvhRhNQ7hWt+2U9R8eA==
X-Received: by 2002:a9d:6196:: with SMTP id g22mr4751527otk.74.1615422147034; 
 Wed, 10 Mar 2021 16:22:27 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/26] tcg: Do not set guard pages in the rx buffer
Date: Wed, 10 Mar 2021 18:21:53 -0600
Message-Id: <20210311002156.253711-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only need guard pages in the rw buffer to avoid buffer overruns.
Let the rx buffer keep large pages all the way through.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 7640aac243..93d03076d1 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -803,7 +803,6 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     size_t page_size;
     size_t region_size;
     size_t i;
-    uintptr_t splitwx_diff;
     int have_prot;
 
     have_prot = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
@@ -845,8 +844,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     /* init the region struct */
     qemu_mutex_init(&region.lock);
 
-    /* set guard pages */
-    splitwx_diff = tcg_splitwx_diff;
+    /* Set guard pages.  No need to do this for the rx_buf, only the rw_buf. */
     for (i = 0; i < region.n; i++) {
         void *start, *end;
         int rc;
@@ -854,10 +852,6 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
         tcg_region_bounds(i, &start, &end);
         rc = qemu_mprotect_none(end, page_size);
         g_assert(!rc);
-        if (splitwx_diff) {
-            rc = qemu_mprotect_none(end + splitwx_diff, page_size);
-            g_assert(!rc);
-        }
     }
 
     tcg_region_trees_init();
-- 
2.25.1


