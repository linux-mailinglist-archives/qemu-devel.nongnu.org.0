Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CAC3AE168
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:39:08 +0200 (CEST)
Received: from localhost ([::1]:47558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8u3-0003Yn-Pe
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pq-0003e4-8g
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:46 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8po-00059Y-N5
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:46 -0400
Received: by mail-pg1-x52f.google.com with SMTP id i34so7202404pgl.9
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6WQ3bnQo/skjw94EgsrmvIJtusx9rxJm6Wr3acFcG08=;
 b=KRhJJj2xrHqG0+pPyEIHgjis6Odgl5PSBgwwPYxuRREaYVPHGC9SgbHihEGiXbY4/G
 FPbHD+Jstgzs3cL4Bevb9G7hm8v1i+DSvCgoWpMY3uLF25C6mq+XqSnUFBqnDuJ8QnBU
 hm76MvLA0975exeHvHzpSka4pOPA1V8dDr0Ihqy+ti333Q+0RP/v0j529qIEAf0GwtAB
 i0CVwGNUoX3Sk5gSW5JeDf3rPAfrTIDPst8WI5OxOL5cu5y0BfuhPm1ni12UvcDqKejc
 RX7Bb5+oT3QgwVz2uHG6GbLVSRMBTk5oRXEbzmVn8VJEHJhg9kwwWjkykB696bpolEJG
 /0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6WQ3bnQo/skjw94EgsrmvIJtusx9rxJm6Wr3acFcG08=;
 b=bfO3Q2WYkxfx+TCD9ot2Fwny9eQEPl7iIIK49u2/MIB7GAeJ5yIzUDo8SSRV+zZmi5
 8GhyQcIZ9EjCEwHyhmA3Ky4DeKSjgTQNc14Aea9W3I+XhSc+CnXbikfj8YiXDLyQ+wIU
 jzJVRm+8A5caBUuonoGCIN3shTE/kgYRyaiLxfD+9NRpOARPA1sFNF/UXLVA86HqQRXm
 EgcQrbWY3Ry3MvjRw7u8HZ9mdBMgdxLI5/ugc3XjH9ZtWuRRKrbewI9CYAMw/eFodiVL
 axrFguIRLOBwMoM+mAvNdPsNGdDuUqVwvLCZ+HYVSG8b4as0ajVxE3zcrhKpTXi4rSC3
 FqHA==
X-Gm-Message-State: AOAM531tyEe2kJqEj8g1b9YyDhj+g9JYs3Ze4vSOO96vzvAdhpMhQu//
 WqHeHUXd5VBKXk5JzL3mp4RSCzebFoZ6+A==
X-Google-Smtp-Source: ABdhPJzLid/eN8r+W2I0SDtHGe4CU1vEhpMMjTHtWZSuGPYmuWl6+tHgZCQAmqC72Lw86HFhbOa+Lw==
X-Received: by 2002:a62:76ce:0:b029:2fe:f4fc:b2db with SMTP id
 r197-20020a6276ce0000b02902fef4fcb2dbmr16844933pfc.12.1624239283448; 
 Sun, 20 Jun 2021 18:34:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/26] target/alpha: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:17 -0700
Message-Id: <20210621013439.1791385-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 6ea19a1d4c..1aa6d24d83 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -441,12 +441,7 @@ static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
 
 static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
 {
-#ifndef CONFIG_USER_ONLY
-    /* Check for the dest on the same page as the start of the TB.  */
-    return ((ctx->base.tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static DisasJumpType gen_bdirect(DisasContext *ctx, int ra, int32_t disp)
-- 
2.25.1


