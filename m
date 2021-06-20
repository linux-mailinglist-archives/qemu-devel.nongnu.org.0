Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F53ADCD7
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:35:44 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lupBP-0006Yx-VA
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lup25-0008Gj-BX
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:05 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lup22-0002ns-Vp
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:05 -0400
Received: by mail-pf1-x430.google.com with SMTP id a127so469116pfa.10
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsK6eGflrqzpg74RcKiOT6THyIaZB+hexy/XIeztJ0Y=;
 b=MwGuZUJntcqGdZ5Tm2kwZzp0kYPHw6rXSITmdSdzR9DcjRKlp91KdB8bMjajXp59uE
 oSov4zH6gDQ8ogmZhrWoeY4c9LVjxmPNdYkWvez4qS7sVSAo1aP9lhebUDb1mbfany0Q
 C+1hxw+/Js8l1B5mPNmvRoAaRgaY0ok/+rOk/GC6VNTQ+Shd3DfupIxARITHg9sE1+mg
 VcUSLQUn0P/ltVzAa1uzYNV6p5Ve+nWvUxuSaEMEUDXeJhUUVqC7fgXJizvquNQuDmSl
 yqBNTgBQAHYl69+0yhoqUAH8HZFe7w7eRB4I1i+7Lr50sVjuwLjBHj9veWOZ2A96UUhY
 CZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsK6eGflrqzpg74RcKiOT6THyIaZB+hexy/XIeztJ0Y=;
 b=boImhsdDJpp3Aq5vp9SLkWdw+4LiWhh/7nMOR7J7q6zyRdQxAOj/gyQg0Mzl995Fil
 08Yq2y74fxm6erL9ob9Evd1+tx32vT0Ia7YcN/7ZY6wf3yb5lkUANNemNhG1cRTmE2Ss
 f8B54R4/WekppGIUOVXkUmaIHitYOIqGFUuHVzA1AKiU9wdUndybLB5e4g2QouPMRVop
 Ba3nw0sM9gpx3E8CMmNR5cAtEMCM+LNz6qH8i56A602ueMdkBs0pSghaYg86Zxe97idc
 2kThfSqzr1njigFkWKVnE6zHsqttrDs13aY2qsMU1Vvk9n9sczFgHm0cW/l4MN3j/yxQ
 8HfA==
X-Gm-Message-State: AOAM531WCxNa9GY8wt6hhXlal/s0Dty0qoc1PSEm62Il6HqKSvgvAmka
 pyU2DdeRmszVIKMuKy3qpTKUvX4xJlZRpg==
X-Google-Smtp-Source: ABdhPJyIBqjDsUiziiBj4b8iPraQoFaXjBpn6f+Pvgg8ejNVuNIUv91YjiTOnnj/EL+fP+uvcn/wog==
X-Received: by 2002:aa7:824a:0:b029:2ec:89ee:e798 with SMTP id
 e10-20020aa7824a0000b02902ec89eee798mr13262701pfn.12.1624163161456; 
 Sat, 19 Jun 2021 21:26:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b18sm11925859pfb.131.2021.06.19.21.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:26:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 30/33] tcg: Allocate sufficient storage in
 temp_allocate_frame
Date: Sat, 19 Jun 2021 21:25:59 -0700
Message-Id: <20210620042559.1236022-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620042559.1236022-1-richard.henderson@linaro.org>
References: <20210620042559.1236022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 tcg/tcg.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 52e858523c..bdeea18234 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3015,17 +3015,38 @@ static void check_regs(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    if (s->current_frame_offset + (tcg_target_long)sizeof(tcg_target_long) >
-        s->frame_end) {
-        tcg_abort();
+    intptr_t off, size, align;
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


