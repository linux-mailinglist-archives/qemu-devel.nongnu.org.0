Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947383C355C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:53:11 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FHy-0000A9-Kh
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exa-0005tI-TP
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:06 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExZ-0002Pc-5n
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:06 -0400
Received: by mail-pf1-x436.google.com with SMTP id f17so11691109pfj.8
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rWhSjxDGBxYaiJEkKRwtWFyISfQcdIqDSvEuPe1mAyo=;
 b=ZRM+lDQp7Q2Y+HXX/bJEw6GGFJcqvi7u3I17ZlX06Wpg01l8x/Hz7XuQEUTYlfzhxw
 LDPJMWl42KF7j3iHA3PgCU0lkk+5PU4woRjl+3auZxdur7xai39F4cfr+E3SB+FwNuX4
 RQGWjLkVWv1EZEZ7ZfTV/uxn4yo4KNywhsOe9cmVBMYzz7/jxE2eToEpihNYh0zwPmOY
 W0qSTQA0Qdh8r/fMaAcH7CdRetYRIfLniXSXb8iiIgMLLcGWbwszA/l3ARHOO76K5Kqc
 vf4YFGUthNwYZjbaQ/fDwtjzZukFOZ7bwqDrNkAK1CvNIgZieVWXXtes3V8/BB/XV2BP
 IiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rWhSjxDGBxYaiJEkKRwtWFyISfQcdIqDSvEuPe1mAyo=;
 b=rEm/p9bUucIN35fmAYJVlPgg82dZPs1KtGJYN0Vp6B/O9J9Iz7yFdKPiQE4qxmi0w+
 h9DQ+6Oijj6dW589KhgamzTLZ17zOTR1lU3VzoRbi/DHSpy3ShSXo994OXf2Yl4/KAXk
 DoZxFNRgE8bELVS0qIAbU1r8Mjss6VB1BhSscnRksgMY3AUWIAMcYYF7rzLTT7CPEFb6
 1gfiyxRKr2Ij83OSORw3HnOAh5esP6K4HIBf9wFG96Ou4R3NrgEuwmpJ6YICJHCHA5iS
 rWVrMk1TLwd788GKbYfbYB2PKcJTP9r9NNSellTB4lPmdX+mhanMiDzhaVI77wNi0jqo
 Edkg==
X-Gm-Message-State: AOAM531LSDE/ctCzRG5o8v0ZKv5F38Las4/95EOtjufCWln+DE2DQi4l
 pgPYqKm9gJiaZqoprtoAvMavS2VOrI4Smw==
X-Google-Smtp-Source: ABdhPJyMprnDTzJFjui/rqTG4fqKxGxq9AF67WDlx5kPDBuUnXwXBnayaQWkGMhxmSWbS2aCgZLbRA==
X-Received: by 2002:a63:e948:: with SMTP id q8mr44639338pgj.52.1625931123953; 
 Sat, 10 Jul 2021 08:32:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/41] target/s390x: Remove use_exit_tb
Date: Sat, 10 Jul 2021 08:31:30 -0700
Message-Id: <20210710153143.1320521-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have not needed to end a TB for I/O since ba3e7926691
("icount: clean up cpu_can_io at the entry to the block").

In use_goto_tb, the check for singlestep_enabled is in the
generic translator_use_goto_tb.  In s390x_tr_tb_stop, the
check for singlestep_enabled is in the preceding do_debug test.

Which leaves only FLAG_MASK_PER: fold that test alone into
the two callers of use_exit tb.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/translate.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 767e77ca19..0cfe29d227 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -684,16 +684,9 @@ static void gen_op_calc_cc(DisasContext *s)
     set_cc_static(s);
 }
 
-static bool use_exit_tb(DisasContext *s)
-{
-    return s->base.singlestep_enabled ||
-            (tb_cflags(s->base.tb) & CF_LAST_IO) ||
-            (s->base.tb->flags & FLAG_MASK_PER);
-}
-
 static bool use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    if (unlikely(use_exit_tb(s))) {
+    if (unlikely(s->base.tb->flags & FLAG_MASK_PER)) {
         return false;
     }
     return translator_use_goto_tb(&s->base, dest);
@@ -6633,7 +6626,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         /* Exit the TB, either by raising a debug exception or by return.  */
         if (dc->do_debug) {
             gen_exception(EXCP_DEBUG);
-        } else if (use_exit_tb(dc) ||
+        } else if ((dc->base.tb->flags & FLAG_MASK_PER) ||
                    dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
             tcg_gen_exit_tb(NULL, 0);
         } else {
-- 
2.25.1


