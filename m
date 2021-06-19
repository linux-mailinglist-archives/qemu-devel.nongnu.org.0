Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672BF3ADB50
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:27:50 +0200 (CEST)
Received: from localhost ([::1]:39400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufh7-0001VM-4W
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufV3-0000ya-PC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:22 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUt-0002OD-KC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so9861589pjo.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dmNnvecqX0hYql4TUxzQSGInY+sbhElg47l+/R1+N+A=;
 b=a29f3HfMkuDoIwPpWQ3r0hOMGXeRaovLEy29yOwwYhmRKDC4RSRdv4GbRzVLxkWDfc
 SiZRBrxmGH6PyHzIeWQ9Nozd/u+dHw5bX+p2nJryDXQOPH+qyyjsRfqbsi6sV2EDWu0R
 CTJqqAShw6mVf5lPVMzA1TvLqOb+CyH62uZh/pXVUxiCXkaKtBW57Y00qfLI/BAb+VcO
 EHR8EzAaRcxTcWu/9Ucm76Az/HiV6PtHHSoRFnj+uDkaarOQskrAo+PenJF77lxS63/N
 cVbwCjn1TXlstvhIQyLbp3uJ6p/uux5l86C5MF3nH6YTgpxhgQvi6HvzepGGTxkTmjgX
 fnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmNnvecqX0hYql4TUxzQSGInY+sbhElg47l+/R1+N+A=;
 b=LnlKAGF5QE49i8ckGrW5He6Ihyy2A0jQEyZ2qCq5NZxg0D3g8mBDtrQn7k2/gE8LCF
 dCLwZEyRfhB18nofOx4vY2jFfqKknbWtz7OI/ywV8yA3Z9UfmFJ3vi8QFFFxbUambWJS
 fODKpz/kuzz+WVeJEV+aNLvfezcB70nnha5SbUFS7FUL166DQN/SKzlLF6kqUL8EPIBZ
 dBlvd+Yx0TBFXiXnVIeLvNVOl2+pRQGCq02G2wCf6mQRJDfGwX/ZujZCo3QI2oRnkYKs
 W8TalxQc/+F95mtrHfDR/xcUhcUZb/LHrSzKvrzyE+gBv+zmfrJ3H3V7ztyz3oBiA7Ba
 gWpw==
X-Gm-Message-State: AOAM530gNVMk5L1cypMBUdp8vcev7T4JEjbnCkh3J4b+vy5PP0s+7Uy2
 CWlCnD7fjU5VwC8s/EXXbn84I3WJ+/mxYg==
X-Google-Smtp-Source: ABdhPJy9jsU+n2ZGFK//38Wrd189nWUgth4Xtf3WA+nGOorhts1itJnx/VWLi2NRA7k90D50j3LKug==
X-Received: by 2002:a17:90b:1893:: with SMTP id
 mn19mr2866548pjb.51.1624126510409; 
 Sat, 19 Jun 2021 11:15:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] tcg: Allocate sufficient storage in temp_allocate_frame
Date: Sat, 19 Jun 2021 11:14:49 -0700
Message-Id: <20210619181452.877683-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-stable@nongnu.org, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function should have been updated for vector types
when they were introduced.

Fixes: d2fd745fe8b
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/367
Cc: qemu-stable@nongnu.org
Tested-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 52e858523c..47cc66f159 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3015,17 +3015,39 @@ static void check_regs(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    if (s->current_frame_offset + (tcg_target_long)sizeof(tcg_target_long) >
-        s->frame_end) {
-        tcg_abort();
+    size_t size, align;
+    intptr_t off;
+
+    switch (ts->type) {
+    case TCG_TYPE_I32:
+        size = align = 4;
+        break;
+    case TCG_TYPE_I64:
+    case TCG_TYPE_V64:
+        size = align = 8;
+        break;
+    case TCG_TYPE_V128:
+        size = align = 16;
+        break;
+    case TCG_TYPE_V256:
+        /* Note that we do not require aligned storage for V256. */
+        size = 32, align = 16;
+        break;
+    default:
+        g_assert_not_reached();
     }
-    ts->mem_offset = s->current_frame_offset;
+
+    assert(align <= TCG_TARGET_STACK_ALIGN);
+    off = ROUND_UP(s->current_frame_offset, align);
+    assert(off + size <= s->frame_end);
+    s->current_frame_offset = off + size;
+
+    ts->mem_offset = off;
 #if defined(__sparc__)
     ts->mem_offset += TCG_TARGET_STACK_BIAS;
 #endif
     ts->mem_base = s->frame_temp;
     ts->mem_allocated = 1;
-    s->current_frame_offset += sizeof(tcg_target_long);
 }
 
 static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
-- 
2.25.1


