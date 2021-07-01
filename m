Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DC53B940A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:36:41 +0200 (CEST)
Received: from localhost ([::1]:39320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyyk4-0001xC-HS
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZm-0004jp-0R
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:02 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZZ-0008IG-Ol
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:01 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso6857219pjb.4
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DeiOM3E/by38ksgPe4YGpd7ba5mJVtkTjbeFMUwSxAA=;
 b=vk6slx4WjHcLjaxMb7LE1nOcg1I4Y4pK0+0vzpCR30oObBLEg9Ga8bJ8zWdl6z+Nkp
 lJX+LAEkTMIHXcxl1V06HmMF32X7MCH6mTXzJ+s5dzou3X5Ukds4Mn0qmSHecoXw5/GH
 ZV7UYUsNExIV8rbSP/z/SiTJKbXdlLE/j9BqWSlmI27xX4iQs8iVEQN/9VmYAViORfQV
 SJw+xdmbednJI/tqu57/uiY/C8DcaKrALYuTos+LmwFQSkHHpaDy9IC0Rlk/d8+vahNQ
 z4dea7iqPYFWs5m7jj3z+TCxPp6GwJ+iDuVX+MSUTasdvqftk/SlvxNTs+g0GqctUDQI
 gHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DeiOM3E/by38ksgPe4YGpd7ba5mJVtkTjbeFMUwSxAA=;
 b=Rld7sJfL1CivzVjJ9JFeKz55NmWRIM4cW4zNTzttEiPddn5tyZcM90+zgFERtg2yda
 dMEWIjNy6F6uaSaqZZTkt5DRyMLgekbdhj/EHD3KYLvWwINUsvxMnMLQ3A2x/hAWHQ8w
 VAyrSE0FtCJAcr3HW62HwqQ/LsOqB6vt53J2Ge11UGtBoJi2L/jkP4SylalbRSHmWoqM
 baWKnGRbVIHE4MbCAmTnYBxIVWFBoINbR4AaCTJiUiLtSlUM3DNAxy2Yyj7Jio/SSqCC
 nHvDsWwfVLWpoNJwS3sQq/+m4h0oLcIPZVjnskyX/5Qus7KIbc176x72v1asljHa0VX8
 8KsQ==
X-Gm-Message-State: AOAM533xJPK+NvOp1wVdb0mcDtkZsDn8Peo5oNdgK6HwuOwcKzv6/2Nu
 0PhRm4AQPNAQ5DGBHFciluso2ah6hJEbMA==
X-Google-Smtp-Source: ABdhPJz6fpknr0W9J/RH/2VxwVV+gAM7byW5ZiESX5l0XR+AybLhZAx2UOBanpGUvIFAL6Cnm10hPg==
X-Received: by 2002:a17:902:fe10:b029:127:6549:fe98 with SMTP id
 g16-20020a170902fe10b02901276549fe98mr115714plj.25.1625153147853; 
 Thu, 01 Jul 2021 08:25:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/17] accel/tcg: Hoist tb_cflags to a local in translator_loop
Date: Thu,  1 Jul 2021 08:25:35 -0700
Message-Id: <20210701152537.3330420-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 1c44d096d8..449159a27c 100644
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
@@ -125,14 +125,13 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
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


