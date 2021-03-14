Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88633A863
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:58:38 +0100 (CET)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYkH-0001JW-S8
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHJ-0006QC-O4
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:02 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:42129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHG-0008Jr-KL
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:01 -0400
Received: by mail-qk1-x72b.google.com with SMTP id z190so29892161qka.9
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDjwEv5UIDqEnZnnB6TE5sHqCsoYg0tX8iQJ/X9PYNw=;
 b=ay2hUMtI2wg2+819Yv47rInMk8PbuPyYnWXCAuzb1WZSqwXaUz64ubtNJ6k9x6ZAwS
 M1rA69q+02NIG27UWQPDkWZ3ykv0h2Ba40boO68hWOFILLfbRmW877CfQHBa/OCnOXCW
 YhW9TItp9FOFddszYGtnQsNczgcqRPevdx0D45fq4iXHgR23rM1Dii3vAZs4s76B0GuG
 8KmHNjSwAVrB1zpldtTv6av+jYB0mjPGNC/tHjKVXehxLiamJF0sWhYTo7FIe8riDLqM
 Y4HcvgnE03NC4hT7PyVcoMKYZVHh9bVqDRsULz955nH6U9CsuqrrzcXr3Rahz78Dcsuj
 eNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDjwEv5UIDqEnZnnB6TE5sHqCsoYg0tX8iQJ/X9PYNw=;
 b=TRBcnnzbsNf4/+BLYTCgqVF1679Tl0GGPCHw+eTCSVLfne0eWUG2hKG92TF0hmaELQ
 qn18Zo66ePyGKe8Vwk16Sg2T9/Gk13V9lumiE0SD0edPO9Kmr20FHOVfTpkZXmvcZ4pz
 WxMV/Jp5aCPiWQ/Qk8imCl3nY8vguuFYNIvrs1iT1wHHnt13CtMneypHBkvzVtS8QClF
 R5o72PXUpDjLOdXfInCNUBBaj6Lz7o9VVgApza3S2C7GWESaBmWpCzPUTFulTsXOFKtn
 O9TxOTR+R3mIDRqRdL5YCDVYTfNAiwgmaDnPsBJuIP1RFwvZ94G0D+m8GdqF9n/QdC4A
 /BrQ==
X-Gm-Message-State: AOAM5332OwVRzT8oNEyKZiUYbr77SHh8aem7L62um6Sj+EGSHKBki9aV
 s8ieUgqP50rHRIyMd7fIpSxuO+Q5vyKXz+VD
X-Google-Smtp-Source: ABdhPJyEy9a6Y+gIMnLqElqkHkymIk1lVYSHYB54tmlufZy6XlDFYvYZxlQe47umt61XXelcmG6u7g==
X-Received: by 2002:a05:620a:527:: with SMTP id
 h7mr22323566qkh.108.1615757277705; 
 Sun, 14 Mar 2021 14:27:57 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/29] tcg: When allocating for !splitwx,
 begin with PROT_NONE
Date: Sun, 14 Mar 2021 15:27:23 -0600
Message-Id: <20210314212724.1917075-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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

There's a change in mprotect() behaviour [1] in the latest macOS
on M1 and it's not yet clear if it's going to be fixed by Apple.

In this case, instead of changing permissions of N guard pages,
we change permissions of N rwx regions.  The same number of
syscalls are required either way.

[1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f

Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index fac416ebf5..53f78965c7 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -765,12 +765,15 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
         error_free_or_abort(errp);
     }
 
-    prot = PROT_READ | PROT_WRITE | PROT_EXEC;
+    /*
+     * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
+     * rejects a permission change from RWX -> NONE when reserving the
+     * guard pages later.  We can go the other way with the same number
+     * of syscalls, so always begin with PROT_NONE.
+     */
+    prot = PROT_NONE;
     flags = MAP_PRIVATE | MAP_ANONYMOUS;
-#ifdef CONFIG_TCG_INTERPRETER
-    /* The tcg interpreter does not need execute permission. */
-    prot = PROT_READ | PROT_WRITE;
-#elif defined(CONFIG_DARWIN)
+#ifdef CONFIG_DARWIN
     /* Applicable to both iOS and macOS (Apple Silicon). */
     if (!splitwx) {
         flags |= MAP_JIT;
-- 
2.25.1


