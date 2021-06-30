Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A718E3B88C3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:51:20 +0200 (CEST)
Received: from localhost ([::1]:50876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfIt-0000BY-L7
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0v-0005dZ-0S
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:45 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0t-00027P-2q
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:44 -0400
Received: by mail-pg1-x530.google.com with SMTP id a7so3214536pga.1
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rewGNkgTjS5g4OXefHXoaM3PsmWPITsUkhsWrEnLmU=;
 b=uK4HlgFg76DHiAcOgJDyWgRGibhhWJBv6ccDe2cnqFzOjvCiQIPpZm3xUk2xDml5z9
 9xYIvituBRhutIUexLuCHB/7glmyCXKCDLeEl7Q/koHwawLxz/chIrupZJqZywIM7cpP
 ajVytP2E+T21aQhhFVyS/Tm52QnHbg+4GXgvlbS4YvauclAm82E739aVXfga2uoy1IcH
 V0WdKoO7JFRrHCBeXxcrec3X6xZXPnt2GplAd17raA5Gj/g/My7Hjs+OBmriMPMsRldo
 Np54yru95EBcz5yfRhbuo9QyPuICu8KwhAz1mXUzQ2LyjOU/87R6wPIuaZWDXnLWOAqM
 6PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9rewGNkgTjS5g4OXefHXoaM3PsmWPITsUkhsWrEnLmU=;
 b=dpI2his0u+vhdXfVOSqm1G+RvKjeowsbb9IqwXnMKNx8k7B9OLa3poBNTWTR21gFQr
 eLNSJmVPuruNkiIQRYMy7IK5Q0XlJgHXRILlHeF5FqAZpEfCELRFzyBrjda3arMu+Cgd
 jk7u38WS4FH9PCmICiZKKCAEnTF8K12zOdWZgIXzhwnTCxsCUEP+82/AjBzu653/drQm
 ryvcSaSQo4/FrqR1sOiY7TNssc5Busz1fvthxmDTf2neNodCTM4UK/hnBfUzfsYCcTDa
 YYPi92nVYQDvAiBqgNzumP1vcrGvlOAEDcx5l1LXNwq1F2QoxZ73L1WgOyUOn96THTgC
 i5Uw==
X-Gm-Message-State: AOAM531zdcN9CVPZYZjP3UU1T9uMtFgQhizoyAa08wot6zUU073hCLlB
 toLqPcA95n/4QgJhpv3+1vcoEZ2MZj4lQQ==
X-Google-Smtp-Source: ABdhPJwBdCGEWZDmJqnqzq7SC/qEwAQQUFzGZyioEEwWxfu96NSNL6WUPiTOccoz6pZnlxVF/Y5zhg==
X-Received: by 2002:a65:5302:: with SMTP id m2mr35137862pgq.187.1625077961723; 
 Wed, 30 Jun 2021 11:32:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/28] target/s390x: Remove use_exit_tb
Date: Wed, 30 Jun 2021 11:32:21 -0700
Message-Id: <20210630183226.3290849-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
index 117a890ecd..4742f59ca9 100644
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


