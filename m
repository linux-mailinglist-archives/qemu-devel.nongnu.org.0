Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033CB3C1EA0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:50:05 +0200 (CEST)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iSi-0001Rv-0o
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i6F-0006oH-PZ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:51 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5l-0001ZO-Ic
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:50 -0400
Received: by mail-pj1-x102e.google.com with SMTP id p9so5059024pjl.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zos/XIBM0Jy9VE3NQaTNYLdt/FcSmttabh3+wO3UTg8=;
 b=iO6szx4BWtH+ue6cE4Dgzyuy6w+HxTBmStd1LHV+kV9WPBfLviA7eWeqzi1xXWN5l1
 aSlg2odQAU3nmp4d1MbGSovVsVz0ky6qmONrDzDx2LkBSUrMZkDuyoMg2W8HMBFn/kL1
 Dqk/vC6HK2O/Yw80wVouRQtApSP0nCH8ab+S6+pS9+/6+D9I9KGQ4abZYk0S4xqRyz//
 eAy55ZPbse/7RdaPO3faBkl43V8UmdhcxS7cpKG6oAOa628ERuJ/D6w85vCBnD6cjSsL
 icX/odWpBImZjGr+rQb0MSs+T4UWsbUrrsf7j9eBSXoSDGdg3PlB2OD8ctmUQMra59F3
 iNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zos/XIBM0Jy9VE3NQaTNYLdt/FcSmttabh3+wO3UTg8=;
 b=alLVLkTkqioUFsQX4FhVRmLSo2LxyYwSVeleZItAooMRxJTR77dz4CXQ0AS4Zb5dav
 kqZPQVytxWGQ/EWt+OH+Z7ChqKJZApVcrm6q/p0pziXtIiKvxd49bfrfyA4wv0thZztT
 LSu6EjtoAhf2FugiZFqtp/Es+3uQzxeAn5RS1wfKE1RFkXl3X8k0wBO0OS2u7JUAIj7a
 LvenBSk+3uJYXBwOafImEe7yiTMuQHRUlI+uUicxQPBwgvHgdF9aQGaTWUE+izSA5xhs
 hTYR2WhU7UJFg8FY7hGAgFYhdJqEA7wzTBUpkhhPNdSZsWGSfut/QQJlIhT5K0NjMGUN
 Wb4g==
X-Gm-Message-State: AOAM532pBQ9cp0ObhlbgL1FAJL3Khr5zIV5rVZmbOmi0DcuSL64fAWrX
 JQl99LrkGMQWcvMpxuaaweAkZMOfH5ZDrw==
X-Google-Smtp-Source: ABdhPJx5LUqNrYCo8I5jdDC2eM+NfRgE0fY8ea1rU50C0NLSTbnKdvdP6fwNSQsOfzCreERoIxPyZg==
X-Received: by 2002:a17:90a:4404:: with SMTP id
 s4mr8628604pjg.218.1625804780049; 
 Thu, 08 Jul 2021 21:26:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/17] target/riscv: Remove gen_get_gpr
Date: Thu,  8 Jul 2021 21:26:08 -0700
Message-Id: <20210709042608.883256-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is now unused.
The corresponding gen_set_gpr function is still in use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8ff75a5798..a6c850e9d3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -195,15 +195,6 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 /* Wrapper for getting reg values - need to check of reg is zero since
  * cpu_gpr[0] is not actually allocated
  */
-static inline void gen_get_gpr(TCGv t, int reg_num)
-{
-    if (reg_num == 0) {
-        tcg_gen_movi_tl(t, 0);
-    } else {
-        tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
-    }
-}
-
 static TCGv gpr_src(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0) {
@@ -1046,9 +1037,11 @@ void riscv_translate_init(void)
 {
     int i;
 
-    /* cpu_gpr[0] is a placeholder for the zero register. Do not use it. */
-    /* Use the gen_set_gpr and gen_get_gpr helper functions when accessing */
-    /* registers, unless you specifically block reads/writes to reg 0 */
+    /*
+     * cpu_gpr[0] is a placeholder for the zero register. Do not use it.
+     * Use the gpr_src and gpr_dst helper functions when accessing regs,
+     * unless you specifically block reads/writes to reg 0.
+     */
     cpu_gpr[0] = NULL;
 
     for (i = 1; i < 32; i++) {
-- 
2.25.1


