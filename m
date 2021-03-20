Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E21342E79
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 17:59:24 +0100 (CET)
Received: from localhost ([::1]:45616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNewd-0005Rp-5H
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 12:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNeus-0004YZ-8t
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:57:34 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:45751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNeuj-00038s-4P
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:57:34 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 n6-20020a4ac7060000b02901b50acc169fso3087178ooq.12
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xTmOGRmWlxYDLMPIzZzQo2atHTryh01K+coHON9Ait0=;
 b=p17mT/JwiiBbDmTLFuCxcRx6+DppibSMH/kOyFetgk29YQLVRqi+JhGtFCdPDTI5HH
 TKixMXZryXlv2y4tjZip18H5fbHCor7F+beAWI7joew1dddMGFRA2SLPmnfiSUod9WsO
 tk5zyspMqETkW8MYOFFzqd2yJgHSIILyhOIjyyMNzdqAk5UK+pM+ggTWRqwmmyPBxb/E
 BCqJtJcExnqkIzdBj/AQGSKr4htwlU0K8LwTSntWGnGWn0AvowEhkIsr3cyQSlJ7i/BK
 bzNQmLRM+raHmwB72PHQK/MY9HoUZ/AZUaFEEavaWV5WShJDSOzuAop+jq4YnKjkJu1e
 T1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xTmOGRmWlxYDLMPIzZzQo2atHTryh01K+coHON9Ait0=;
 b=aJ8jgZwpf8gO87DBv09UIjaM+wudKumpi4rmhE/fcZuOrLJOyca33bCGnnPaM3W7C5
 mT3u20BFZ/FBRVCFCamedEqkh6NizzTAzaP/cGClVukWH+dsDEXbGGWJSXdqCmNne6cj
 WRoT4Fq2eP4sjAIdrjEMbz6szWkWbrr43wZTy9AMpineaRAY6kuBzu1t2g8ET/q1ML1X
 WCVWPLgUGpPdysP9mz4otXPXrewQ18mHRPWo4az8gkw3CB8SLSVJXv8MobADRdWt5nQi
 9rxqeX3nStYYggpMHFm40eR+GR0Qj/jhogW0CPCcYcZiNmQN5/Npzpub43fyie1gXjbp
 hkYQ==
X-Gm-Message-State: AOAM5308vM+7q8MCwEW/oc4VZ8SSLrJFHGGPmfpI3afHzkNR0nBu7smV
 DWXFhdnuvIXcHlQLFnf6oxPS+Ay5mr5LfXsQ
X-Google-Smtp-Source: ABdhPJycV83pswRhrDwPhxLstsg9830ybCvOCYtGoTXnqz97p5yqlWbSsRsjFOM3dSgn3KDHlVf8PQ==
X-Received: by 2002:a4a:d1da:: with SMTP id a26mr5771791oos.58.1616259443974; 
 Sat, 20 Mar 2021 09:57:23 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm1953966otp.76.2021.03.20.09.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 09:57:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 for-6.0 1/2] tcg: Do not set guard pages on the rx portion
 of code_gen_buffer
Date: Sat, 20 Mar 2021 10:57:19 -0600
Message-Id: <20210320165720.1813545-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210320165720.1813545-1-richard.henderson@linaro.org>
References: <20210320165720.1813545-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
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

The rw portion of the buffer is the only one in which overruns
can be generated.  Allow the rx portion to be more completely
covered by huge pages.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


