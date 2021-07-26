Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9DA3D68F3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:50:38 +0200 (CEST)
Received: from localhost ([::1]:52116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Uf-0008Uh-Jf
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rm-0002Mf-1a
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rk-00065h-H6
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:37 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso1120136pjb.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dczMECoCZ2fE11SIUOsBRrLY8h7p8j2HpmwPdyA/v6o=;
 b=Wggx+YzDxrfg/4O9cLnBAxj+Rgk/ng+sse/jf9XIUIxtvJnZsgjMEk4RkZWlLSzNdh
 +k38iNFGyLnB6Jg4Huvx8WHvvLMxQkivZuh7NsMRDwFH4vqnuaNtGmH1/cDgrAbSP74s
 Ta3ZDRLUjs2lG08OghVE/2mOpwRWPgzSfnmIAEAsEBLp2wN2xX8eB2/NyGmCel1i9fon
 QpABpg1tXDMYArPmz8wVKdWNK5veSIWnDQcvdenfaEBnOmxRvx6sFVLSqmo50s9U73Br
 MZo1o1989pnxDXmqBSSVJg+d46uSwz41zkdpU+JLNcBa0qLJ+RI/UWp5itmBiL6joZoP
 iVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dczMECoCZ2fE11SIUOsBRrLY8h7p8j2HpmwPdyA/v6o=;
 b=YacIJ+VIKs3VoxJ1Cx5cwG/EoKxgNqJCEk3o65o5qO/8ATlbOTpWdklJTgkFgoNwOC
 /jtdG2nz14dwdwtUyLprtWA//9/TPspRO7CGjm25YdZjk0XLiF8h14a3W312MHrqWkmw
 D/XVMBJ0lRknQGZOkSwuAu5MXyP3B0WQI9MTjVWLs8eoKTi1OVmKA3HpXGisfLx253d3
 TS5EEk4la6zmyAax1rrdyXHEJTR1kCbctG/k6lrLNwFRFktmv4pdR3141MRk6tW4eyJw
 It1ykZRkWAr2DeAjcLpHDZt0ilYpnzgXgn0BRP3fAtJw0Evwz7rzHF7mcvdGvMyA0A4c
 Ieow==
X-Gm-Message-State: AOAM530+/QhEU07bAaDTfQCG0rd/BoEQFp/aVAkftHDSWTEX92JSjQux
 QZRTRQqK8yUbtRgqWKACw+LgNf6EcatY4g==
X-Google-Smtp-Source: ABdhPJyRxgdustE5umvJM9/ZytUFXbP2beNZNmyxooOV1JKJNMHKmB/q4weEr8Qhg85XCBszgEEL5A==
X-Received: by 2002:a17:902:7c81:b029:12b:6ac2:3ad9 with SMTP id
 y1-20020a1709027c81b029012b6ac23ad9mr15843971pll.76.1627336055122; 
 Mon, 26 Jul 2021 14:47:35 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 02/12] accel/tcg: Remove unnecessary check on
 icount_extra in cpu_loop_exec_tb()
Date: Mon, 26 Jul 2021 11:47:19 -1000
Message-Id: <20210726214729.2062862-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In cpu_loop_exec_tb(), we decide whether to look for a TB with
exactly insns_left instructions in it using the condition
 (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)

The check for icount_extra == 0 is unnecessary, because we just set
  insns_left = MIN(0xffff, cpu->icount_budget);
  icount_extra = icount_budget - insns_left;
and so icount_extra can only be non-zero if icount_budget > 0xffff
and insns_left == 0xffff. But in that case insns_left >= tb->icount
because 0xffff is much larger than TCG_MAX_INSNS, so the condition
will be false anyway.

Remove the unnecessary check, and instead assert:
 * that we are only going to execute a partial TB here if the
   icount budget has run out (ie icount_extra == 0)
 * that the number of insns we're going to execute does fit into
   the CF_COUNT_MASK

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210725174405.24568-3-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 6e8dc29119..5aa42fbff3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -843,7 +843,9 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
      * execute we need to ensure we find/generate a TB with exactly
      * insns_left instructions in it.
      */
-    if (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)  {
+    if (insns_left > 0 && insns_left < tb->icount)  {
+        assert(insns_left <= CF_COUNT_MASK);
+        assert(cpu->icount_extra == 0);
         cpu->cflags_next_tb = (tb->cflags & ~CF_COUNT_MASK) | insns_left;
     }
 #endif
-- 
2.25.1


