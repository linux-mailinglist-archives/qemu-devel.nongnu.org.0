Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E7533769D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:14:02 +0100 (CET)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKN0j-0008J9-UO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVP-00044f-3D
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:39 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:45032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVJ-0006tK-7e
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:35 -0500
Received: by mail-qk1-x72b.google.com with SMTP id 130so20753422qkh.11
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j84CVB2/9NSVvHC05jyj/ExvjNOevKnlsYLw94URCgw=;
 b=NpABv+msWtvS9KebLlL+UDW9UET5LmpbFSuVcFhq2nutEHH8H1ELE4khxNjC57WPhA
 3ZlCXq1x5DPG9X662XjjuhirxQxB7BIzngaCpznnK3o0n2uQeZPepL/CrIYP4lmuUrGk
 qBNrEUG+7R9QexsN1v/r8T7SzIiIKDEAOUIiW1/Y58Un2nTGVxN8YslD+B5dsTntVbHf
 4E1RehyvPHEIo9re+w0II3rdF7nVMdkYpqgpG2qdfS49UCyfc1wNa4hp1qXMtsI0X28z
 BIKKMcRHf9lomLsqmCHyVHPYJbFpL57b2AxOWH75oS8bhWctHAgouZ8bbPNE9sJKmB0v
 2Bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j84CVB2/9NSVvHC05jyj/ExvjNOevKnlsYLw94URCgw=;
 b=HRiNqnyEsQG+xQVMX1biy1LM6ZoZp5DOu5geS+K+JRMf0vWc545WG5XjcKBjv0a4ce
 /Gzadz+XDlmdb25R/bvo/Rtf0XOaTEqpVOdrm0vdyGGV6brkcWXP2S/UD8K84cUqozeq
 ZIiBhaHOnJGE+j8EUMwpssxJlrLLVPnXZ5t0uW/5FHCsxWGogUsw84fo+GT480BF3UE+
 Dz9WRfJyEkQznVO1cYQRWOWDHASBH461uuYJGowIevJra5quaftvDb0kAabLdKEv4JlS
 Iu640hAh3/chsx31asAzahUNDAlFIwAM5Lve2JbFD1zVybfwiR+3xQy+ebgUPl9oDufR
 lQ3g==
X-Gm-Message-State: AOAM531rCX6wlUHy7TqK50YS620rj5jJpEGJvWgkGo2Lx01LbJvXZiqy
 2o2FRQ7KsFMTdbq14GwrPjloTXiVKgwYCaYT
X-Google-Smtp-Source: ABdhPJwlnWgH15qkcNGJdrrvSSNbnpSdq5alLzdCp4fVFdPJ4D4Z6YNVKTHg3L7zDmiT77vAQXJpqg==
X-Received: by 2002:a37:8743:: with SMTP id j64mr7430183qkd.299.1615473688911; 
 Thu, 11 Mar 2021 06:41:28 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 43/57] tcg/tci: Reserve r13 for a temporary
Date: Thu, 11 Mar 2021 08:39:44 -0600
Message-Id: <20210311143958.562625-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to adjust the offset range on host memory ops,
and the format of branches.  Both will require a temporary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 1 +
 tcg/tci/tcg-target.c.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 4df10e2e83..1558a6e44e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -155,6 +155,7 @@ typedef enum {
     TCG_REG_R14,
     TCG_REG_R15,
 
+    TCG_REG_TMP = TCG_REG_R13,
     TCG_AREG0 = TCG_REG_R14,
     TCG_REG_CALL_STACK = TCG_REG_R15,
 } TCGReg;
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c2d2bd24d7..b29e75425d 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -829,6 +829,7 @@ static void tcg_target_init(TCGContext *s)
         MAKE_64BIT_MASK(TCG_REG_R0, 64 / TCG_TARGET_REG_BITS);
 
     s->reserved_regs = 0;
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
 
     /* The call arguments come first, followed by the temp storage. */
-- 
2.25.1


