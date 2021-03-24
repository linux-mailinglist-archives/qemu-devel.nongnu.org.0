Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0FB346F1E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:57:17 +0100 (CET)
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOslo-0007sF-36
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYp-0005z9-ND
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:51 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYa-0005ia-5R
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:48 -0400
Received: by mail-oi1-x22c.google.com with SMTP id a8so19178506oic.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 18:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRTvaKGiSvx53wjPubAax9jKEnNNfX7W0YfiA8JJ1s4=;
 b=reNos8zTfIQ7Vp9FIn5NP3C46v/nl4ex9Wkm9oek5TMp8Xmt0174cF2NbcN3ORPIIU
 7eyuA1bb+Dxsrh1zJhaiordqcu4O6AcVo7SAcqNC+oaURKxhtNwguszLxfwL8lv5MyJn
 EaQkFX9uPk4qiI9hYZf6OTfhR8ApINQLSvPjAAhGEZW5Q/QXdxmK3GBIh28Wpz30TZYA
 x5AU+V2F4VUqCEcaTAlNKY21BDTPoIYlT5mtzdrUVCU3T600iI8FlufaC9Sty9aplFUE
 AmhHd8g7sv9wJXTQDHL6TPFh8QRvmUnvlTe8dYbiD8T+DoL+ndt/AqqCDamBj4dybdW+
 w95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRTvaKGiSvx53wjPubAax9jKEnNNfX7W0YfiA8JJ1s4=;
 b=jyna/sWlYNq64NwxkgAfhDNfUCOJ33KLSuNQpU6oXx/CH4G1Sy+tGQH9AXrzljXgpa
 67frrQueXl/9cD3pf3a/GmC9iWMSfgtmp+ahbr4sDcoDykowqJ9wF22eKHMR0YU9ELqX
 a/UDMW387cKUVn0lI60Ea7BPqheBAfygelS+Phxi5R6Iu60Ya+5HafTRJXbOzAktU8u3
 /D1EuRlt702/z+MshvbKtWzDK8EWI9VYxbxRuzfupqkLonN3ZpV2e35vNAO1lkIRkpqF
 iQXZCU9nyaH5/8QkcLsQxtJca21O5Kw5C1F9d4D3pBoLh28aWEtFYuU81ZxF7Apcxw47
 rdnQ==
X-Gm-Message-State: AOAM530A05GtWFt0eODqLDZVEZl8fXUmXbOcft8F4iUg5IdFaVtNkqP2
 71YrxeGT0PQxy97h2HJJc5I1+5CW2w4pHPfY
X-Google-Smtp-Source: ABdhPJxrJfHZRLitvQc5Wkywmo+KIzExJeRnLl2yaPh/ny9MrRbccIGqopIThcvawpWqc/Al+VPbZw==
X-Received: by 2002:aca:2103:: with SMTP id 3mr706767oiz.80.1616550214907;
 Tue, 23 Mar 2021 18:43:34 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id c9sm203601ooq.31.2021.03.23.18.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 18:43:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] tcg: Do not set guard pages on the rx portion of
 code_gen_buffer
Date: Tue, 23 Mar 2021 19:43:28 -0600
Message-Id: <20210324014332.6331-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324014332.6331-1-richard.henderson@linaro.org>
References: <20210324014332.6331-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: peter.maydell@linaro.org, Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The rw portion of the buffer is the only one in which overruns
can be generated.  Allow the rx portion to be more completely
covered by huge pages.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20210320165720.1813545-2-richard.henderson@linaro.org>
---
 tcg/tcg.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index de91bb6e9e..88c9e6f8a4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -828,7 +828,6 @@ void tcg_region_init(void)
     size_t region_size;
     size_t n_regions;
     size_t i;
-    uintptr_t splitwx_diff;
 
     n_regions = tcg_n_regions();
 
@@ -858,8 +857,11 @@ void tcg_region_init(void)
     /* account for that last guard page */
     region.end -= page_size;
 
-    /* set guard pages */
-    splitwx_diff = tcg_splitwx_diff;
+    /*
+     * Set guard pages in the rw buffer, as that's the one into which
+     * buffer overruns could occur.  Do not set guard pages in the rx
+     * buffer -- let that one use hugepages throughout.
+     */
     for (i = 0; i < region.n; i++) {
         void *start, *end;
         int rc;
@@ -867,10 +869,6 @@ void tcg_region_init(void)
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


