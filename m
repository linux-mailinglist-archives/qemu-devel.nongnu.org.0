Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66983CEE1A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:27:31 +0200 (CEST)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5anS-00050L-TW
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ajC-0004kR-89
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:06 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ajA-0000yH-Iy
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:05 -0400
Received: by mail-pg1-x535.google.com with SMTP id o4so15918026pgs.6
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PNGGuAbGOXbZh1djyRYowe+1Bkitpoo3mG0dYZQDf8E=;
 b=B5W/Szyufhxasv3mMpCsxf2tkU8IT80c0ljF5ByNfGKDEGUimqY3bhaggkyG6wl2pG
 86ldck98u6eKw2gUiBVZL/wgsjcLpO5Z34lWRKqs0NSnpVXYaZ39+TOyYY+kwnXAKexr
 kV1CN8D8xgTEir2PiaCExNWMXD/sshObMetv9tW7KTWLGAiR1t1fwIQGHQ2WXBrU9sZS
 xLr2bPZHXTASY1e5oN8mjr/GDnulJhmIqDgv6MDO4PxIIz4qY07aO89YEODKRbpxAZYX
 P399gB+/jKx6Cioc42sfpCw0yLm6z4hIyK4VYByNLZeHQMpatbdvLfQV8WRaA8UD0SXn
 +FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PNGGuAbGOXbZh1djyRYowe+1Bkitpoo3mG0dYZQDf8E=;
 b=Cut4ZyUZlb2Zwd2IMX1KA/ZX5EtWzKEXawsX8tDZfBicj+wfdKQRzQF2mtXRRVbt5y
 IoEBBUHrzhNFbIDzSTh7Hd8EhNrt7FnBvfZdOurA7gKKtRxkyis7UdjUkzoNoJOp38zh
 HlXqvqmRHVIqWrB0X3eU9qPhWQaQ3zNopMpMmELuvZJRtqyk780/3OZZdII6ia2A0lkH
 x5RnGnVXRkdrTcJWV3EvBpNWNr/nq4mzopHZrLYvOXk2eXAW0dADklJhi+qux63RDWFZ
 gqQYSMasIP3nfdU0aCk7BJcYZ8eW2Pz9NftmhG7q1RsgpmxeTEXXSiRhWDt+vxwqanqk
 b+7w==
X-Gm-Message-State: AOAM533LQFBtFDQJK4SANVlWoa+UG1pPhAIHRq1+u9/U6b2Fn6qXA+Ne
 /Uzy/+e+utTQl0KtrA+1VW1zXsH5Q/TQvw==
X-Google-Smtp-Source: ABdhPJyzcWhrdArtbT10Dcee23xfrp3lX9ikorORoSa9x430IiRmlf1/kx2beQ3TnMJomHK2jRKzow==
X-Received: by 2002:a63:ef57:: with SMTP id c23mr27072051pgk.60.1626729783233; 
 Mon, 19 Jul 2021 14:23:03 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:23:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 14/15] accel/tcg: Hoist tb_cflags to a local in
 translator_loop
Date: Mon, 19 Jul 2021 11:22:38 -1000
Message-Id: <20210719212239.428740-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The access internal to tb_cflags() is atomic.
Avoid re-reading it as such for the multiple uses.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 4f3728c278..b45337f3ba 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -50,6 +50,7 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
+    uint32_t cflags = tb_cflags(tb);
     bool plugin_enabled;
 
     /* Initialize DisasContext */
@@ -72,8 +73,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb,
-                                         tb_cflags(db->tb) & CF_MEMI_ONLY);
+    plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
 
     while (true) {
         db->num_insns++;
@@ -88,14 +88,13 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
            update db->pc_next and db->is_jmp to indicate what should be
            done next -- either exiting this loop or locate the start of
            the next instruction.  */
-        if (db->num_insns == db->max_insns
-            && (tb_cflags(db->tb) & CF_LAST_IO)) {
+        if (db->num_insns == db->max_insns && (cflags & CF_LAST_IO)) {
             /* Accept I/O on the last instruction.  */
             gen_io_start();
             ops->translate_insn(db, cpu);
         } else {
             /* we should only see CF_MEMI_ONLY for io_recompile */
-            tcg_debug_assert(!(tb_cflags(db->tb) & CF_MEMI_ONLY));
+            tcg_debug_assert(!(cflags & CF_MEMI_ONLY));
             ops->translate_insn(db, cpu);
         }
 
-- 
2.25.1


