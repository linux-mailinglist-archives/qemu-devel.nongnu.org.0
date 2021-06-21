Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326053AE18E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:52:43 +0200 (CEST)
Received: from localhost ([::1]:59406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv97C-0005tb-9h
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qD-00044e-7Z
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:09 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8py-0005Eu-Eo
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:08 -0400
Received: by mail-pg1-x52e.google.com with SMTP id g22so12832630pgk.1
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUVtXMvYWuDrfg37hSagY/JJxiueWMrq3me9HN4AB0I=;
 b=cLNvt2uZGegKENyxC2T6NtqoJC2Gmdwna53SKZbJXthaqxrvd1H5y9UtwlThvpSAJp
 SavL7RtXqq4pRKbb+RMH2pqA8UsJ17Dy5ddEB0CADaC5Se9q5vSPPOkin5ATz0Q3Fxqy
 TYG5qPG8i22D59wHh6xJLh1UQxcW6F6YbIi3cmsOJQPqOduhaQfQo9jvyTiOdbxtSelI
 1E+QwSBkztEyLF469esrtOuey3eTHeQn9FaZyX2fc/RIsHRqzHWqqMLxOBTkzAX7t2gN
 C1IKQr+omtCu0m7qj94O1cFOMxeE9RtHgULIkx5VGxbP76aj5aGykspzmm6l6Nru/zyp
 6u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUVtXMvYWuDrfg37hSagY/JJxiueWMrq3me9HN4AB0I=;
 b=lkX7dwAfCXVq5lqsoGf5itKjWp6omKKovCcCEGfvDfBOotKktIYjaYq48rPMDBEipd
 RSqdepxnINvrugIrcqPYFHCbJzRLZjrDFKSk4lgNgO9PfzwgWzGYNARGop0GkFfwH9up
 adeEPmfUKGhnvlxbbY7e/T7GphOvLM5y31q7tBZTBQKXQ/Vj390WtVkPIyeeklrdJYSg
 sJn8u1SmRBEO5oTXi3VYpEbB9kOgasquEiBQmqsgQunWmMN6Uw2/zxfi2gbkZLhy9EaD
 ae9GfeIm7pmNFNNuDbvg6Af7hqKAUDMy6n1wu0i7OfYIHyEjFpVHI+So7j3Y357O38c1
 5B/A==
X-Gm-Message-State: AOAM530hIyDhpH4s3BwYuKoynFa0LQtIV6v/vXOrpsdu/yCUrPUSOIyr
 oOVg+Lw9gizHw05BTEk7TuaH5jc9ENdOow==
X-Google-Smtp-Source: ABdhPJwem2ZjZARF2zfOOpYlP0UyfV5ik4SK2+nF4jbvDBS4Co6WJ8JJYbPo6YyoQVm04hvr4cPNUw==
X-Received: by 2002:a63:2011:: with SMTP id g17mr21520113pgg.195.1624239293202; 
 Sun, 20 Jun 2021 18:34:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/26] target/s390x: Remove use_exit_tb
Date: Sun, 20 Jun 2021 18:34:34 -0700
Message-Id: <20210621013439.1791385-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
check for singlestep_enabled is in the preceeding do_debug test.

Which leaves only FLAG_MASK_PER: fold that test alone into
the two callers of use_exit tb.

Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/translate.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 4bb5d82a37..de7d846461 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -685,16 +685,9 @@ static void gen_op_calc_cc(DisasContext *s)
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
@@ -6634,7 +6627,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


