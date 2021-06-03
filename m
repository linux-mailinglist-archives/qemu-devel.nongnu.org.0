Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B1E39A5A4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:21:26 +0200 (CEST)
Received: from localhost ([::1]:57960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq61-00055I-71
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkf-0008OB-CB
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:21 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkd-0006ua-1o
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id y7so1751532wrh.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ipQH9FuAs2789OheroE8XiY1nFKS7axl26Lt0pkbQjg=;
 b=N2yHLRfEC7B5dRQAt6YxfyZsYlhXhwhCE/FKk4yBSGzhHno5HO1KkIQRS3SXi3iMHA
 pQzq6hj9EQr4acjjzvXRDNmozlv5RxdAN4DcGlvR/YQduOsR9a1uad5VJHQii2M/ggtA
 kt0KgFLhV42534ZPYBIvBtlEhaDnaI/13HGC0sfHqCbvPCrDH5WeFlVxYz8SdlpjKhFy
 aNghuST+gbWKw7+2tSe3Kzoqf1g1clfCiUXnZM+TuMYQV+PlC9fAhVke4VsB3ySRe5ru
 trqIWTXFRNAGhdSR956f82YWAdD5rQNKVY5ney+iW/ecaJTkVdJEZF1W2Cn/vhMBNJ1+
 kEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ipQH9FuAs2789OheroE8XiY1nFKS7axl26Lt0pkbQjg=;
 b=Gcska2nlo+Llu1RFXMCxg0apEQix/SrHdTktr1ev47YL2KzkJsqvGHMZ6BCYcDET4F
 T4D7j1wbis96bbr4r7Z29spYloUV8pw+B62rxUEgpwjebDy6TaV6uSW+me5Xs3I2SmK5
 0VYUKl1XcCafQ9I64Rwylh9egC/rrIobgst/pRZ3tF5vBZTlhzYkeNnu5KvOB88U16kA
 GKoI9sOKf1W4WGZMidZa2tu3VskxcU3uX6VZpc4RXNJIqgOermqVVCWJS6r57nGSeJ+J
 yJ7w7J9I4+mZa1cWFCFfIVYFDFG/X5z4VWdXgmxry/jVURcIb0IDaq4dNHxAw6g43GHe
 e/fQ==
X-Gm-Message-State: AOAM531xA5DLufjwyUP/s8HDPbvH8uV8dVPAIWipgWX4nIS4mponElcR
 ka2WFoOduKhvvBosLHymxGeYshk6zQ0DiP6u
X-Google-Smtp-Source: ABdhPJxNjACtSVf2xKz7HRb+O//F95a8lWQhgsh1E3Fu/QUAiaOAjmcU2SGyXvc7s0yCE75RFqHbRw==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr637101wrm.141.1622735957379; 
 Thu, 03 Jun 2021 08:59:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/45] target/arm: use raise_exception_ra for stack limit
 exception
Date: Thu,  3 Jun 2021 16:58:34 +0100
Message-Id: <20210603155904.26021-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jamie Iles <jamie@nuviainc.com>

The sequence cpu_restore_state() + raise_exception() is equivalent to
raise_exception_ra(), so use that instead.  (In this case we never
cared about the syndrome value, because M-profile doesn't use the
syndrome; the old code was just written unnecessarily awkwardly.)

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
[PMM: Retain edited version of comment; rewrite commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c  | 5 +----
 target/arm/op_helper.c | 9 +++------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index eda74e55450..074c5434550 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2601,10 +2601,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             limit = is_psp ? env->v7m.psplim[false] : env->v7m.msplim[false];
 
             if (val < limit) {
-                CPUState *cs = env_cpu(env);
-
-                cpu_restore_state(cs, GETPC(), true);
-                raise_exception(env, EXCP_STKOF, 0, 1);
+                raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
             }
 
             if (is_psp) {
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 4132f5e430f..e98fd863057 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -95,15 +95,12 @@ void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
      * raising an exception if the limit is breached.
      */
     if (newvalue < v7m_sp_limit(env)) {
-        CPUState *cs = env_cpu(env);
-
         /*
          * Stack limit exceptions are a rare case, so rather than syncing
-         * PC/condbits before the call, we use cpu_restore_state() to
-         * get them right before raising the exception.
+         * PC/condbits before the call, we use raise_exception_ra() so
+         * that cpu_restore_state() will sort them out.
          */
-        cpu_restore_state(cs, GETPC(), true);
-        raise_exception(env, EXCP_STKOF, 0, 1);
+        raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
     }
 }
 
-- 
2.20.1


