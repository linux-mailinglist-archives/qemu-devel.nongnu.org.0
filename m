Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFF03B09AC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:56:41 +0200 (CEST)
Received: from localhost ([::1]:37468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvilU-0004uP-1j
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidd-0005AL-La
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:33 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidW-0005Iv-SI
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:33 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 21so1758240pfp.3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dML7HVO3SIUvu7+ZiyMAW2r1aYzDyVht2iysbBCWL0=;
 b=jJdRi7vB+Rlaqngnxx63ms2B9DbygBFa0KcONauqK1OiSwsfGoD2sIPyWd+z6qxv4d
 s7jTn3vyOtkr50ko+31LTDv6GTC9lOZ9Peqor79HcETTwNtOFANF00iQgMqgsx+MU1g0
 PvIrrSBij6JO6Y5VpEcIIjKJGgcl5i6vNWxPB2RHFGn2fYUA8T5hAyILvZ1vMPCQDUcp
 k+phY4PKxW9CyINwMz6/HiCpPCS6USB2ej2l/eNrVxhNV7vWZ+Er1PVFPHfonmh0biVV
 7BQlqPjyZPKXV08bwwqJmvqJT8YJAo8TmHwDw0tbR0NkVf8aVKTJYM6KM0FsBCvudv4r
 lLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dML7HVO3SIUvu7+ZiyMAW2r1aYzDyVht2iysbBCWL0=;
 b=Pi4sYkO4xz3irnPPH7sVgYRvPjpVveiVbS/bvh/zF4tvSecZeKyOOtmtQInsfXJniS
 C2ASf7Y3fdej1rxQF4OGUKZJSl9hGbyaL7tK5tu6JTdfYYMBt3ymqdA3HewkHhG32fYm
 7QrGbCG7dUNxzxY6P/W1nK5/tg80ir6JMBLhfjlZlN+gs5SWmzntwvp3m+HKu71NtFfC
 39M5WCI1SzQSYDjPUW4mgY+jxwQTvGTcOBOcRlffgeN2BhICCNnjpujeo+i+SBA8+zAT
 URYauMJD3W56n7UYEL6iZOmutJIGTJs33PoaVHe70FdT7zKwCZOisT1yjlQVP7+1oBDG
 997Q==
X-Gm-Message-State: AOAM530AsyGTYcDi8S+656R3A3dtuWjlWSBU64L6mxTlRvPYTCMZ61px
 2p3GJ9k03RpArOX8yNmPce0PD8oSp1ELPw==
X-Google-Smtp-Source: ABdhPJx/4GDiIpHcjo0GMCtSecYK7p7ISVlQtUIIdEKsK3ojjh+uvm83md12O/AwH1DPKmai00UxBA==
X-Received: by 2002:a63:5442:: with SMTP id e2mr4383044pgm.365.1624376905174; 
 Tue, 22 Jun 2021 08:48:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/15] target/cris: Fix use_goto_tb
Date: Tue, 22 Jun 2021 08:48:10 -0700
Message-Id: <20210622154820.1978982-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not skip the page check for user-only -- mmap/mprotect can
still change page mappings.  Only check dc->base.pc_first, not
dc->ppc -- the start page is the only one that's relevant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 24dbae6d58..9e1f2f9239 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -524,14 +524,9 @@ static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
     gen_set_label(l1);
 }
 
-static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
+static bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-#ifndef CONFIG_USER_ONLY
-    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-           (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
 }
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
-- 
2.25.1


