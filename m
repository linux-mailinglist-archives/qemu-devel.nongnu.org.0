Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476A3C17BD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:07:27 +0200 (CEST)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XUk-0007ly-5b
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5I-0001vD-MI
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5F-0008EV-6D
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:08 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 cs1-20020a17090af501b0290170856e1a8aso6265536pjb.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uIG9Ge2zjjc1swLSEjOmuiLSgNcwqVn8gkMMGDc8fxw=;
 b=aVatAm06YxSOSf2cxC1QwpKeFPPyv0ELPDXOIaqHAx2I113TXpkBxqV/+uGium/vBb
 LC38+3UtXq+gODQzGHWch2CwrB5FgWmhi4UPkg7jAkcRiVv6/UBEtGLSuQg58CJR7Rji
 wFgpT3IpInUj8fPWja4iMkNTKjI92KQpnEMEWFBchjNKTLW/zOerUxX82OOzCW/fR2Hc
 Z4rp+AFyeFjcTsYIiRdBM4JOTGs+bYMe5aRPIEs/8/5QZkG5fBLmAEmNxr/FHUHVKrrA
 nK0yRqKpQ2BxhB+MAe4zF+iKHBXaCfVC0zM8Hrk69WsdtWUjZnvJUcoBwHVrFCT4znHS
 zqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uIG9Ge2zjjc1swLSEjOmuiLSgNcwqVn8gkMMGDc8fxw=;
 b=mgsjq2DhHG9JX9U5rR2268hdhKsFkO+5BHcg6PNADlgg2poOqZ7LQHk/41xCFT/thv
 B/VBPr0QKo8tu26k+ljzC9CYAwrzUb05k3F+nw8jIpP1N0Nb0AkU6gOOyjLncapVwuNY
 lNxZRtoee16m24LQc7yABVrgxEvW6hbGogX+y71o64rCsAiKb9E0FvZkk5ccQInP8I8u
 NLytMWO4VqWjAVOPYOMJSgZ0R9zAak+4XpQiTwlWbiXHjNgNI8TvZAHiJX6pei5u26tL
 kx+uA26lmQ1FR33voDuvFW5EicJh70PAV70i5NllJxoXk4tofMftk4cAPykZ6B3We30v
 8hyA==
X-Gm-Message-State: AOAM533vZHqEpC91U/niQ7UguO8et6g7lc7DgzKMTPqtThPN0Udjeafe
 lQW0qHiI4X8QG9MDZ4kBRYYYyQicMYtMlA==
X-Google-Smtp-Source: ABdhPJwsboVL4aqGwgPjxogJZs3LS1fzLQVmBzRvovruQDngTF6ZzHfeLVxWBAt0+tUt9XdRy2pV3A==
X-Received: by 2002:a17:90a:aa14:: with SMTP id
 k20mr5855461pjq.88.1625762463972; 
 Thu, 08 Jul 2021 09:41:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/28] target/s390x: Remove use_exit_tb
Date: Thu,  8 Jul 2021 09:40:45 -0700
Message-Id: <20210708164050.711967-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


