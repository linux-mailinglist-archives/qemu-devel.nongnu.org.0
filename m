Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3403AD7EE
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 06:59:17 +0200 (CEST)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luT4e-000635-5r
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 00:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luT2a-0002xf-QG
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 00:57:08 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luT2V-0000Mo-PX
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 00:57:08 -0400
Received: by mail-pg1-x530.google.com with SMTP id v7so9560771pgl.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 21:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tEW/fJi/hH3gdu+mIHV/IgnrMMh/sh6iojGv1lBJoQk=;
 b=CUPdDWoGJOfx0NJdc+uSpOJ/Ji4BtWT15K+WmsyHsXxPPNbawMVTINcAaL8fJaXnZ4
 RvfEB08SiHkbZsrkbrqcDiojVL+myRTtKQUWH0vdyWyxkkwsxvZ9thJ3xWYw3fXxI4RP
 MDRNyCJ3a3zMWc24vmArjk9/CyajIgg+vZDe++VtKK5sa9nEMAp5nXdc5MpPp5FhvkEo
 r0tdXdv6sTPB/7Pgg/GsKgUkUZwWjHIINeigjBqYvp5R9VBAMf1FWajlmwIb6lzqxA3W
 Q+WY0s3hQbgP/NxgLECvHkKNtjEc597gw7AwTxM7SPRRCs1rhZoHzwO0Dc8imi0usIDf
 Mt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tEW/fJi/hH3gdu+mIHV/IgnrMMh/sh6iojGv1lBJoQk=;
 b=LMXHPb2JmF4QF7maYHDsoY1VXmBzm7V+PlqDPi9f5Hs+bWrsogutZbtGzq8mFXpBhy
 hikOG+9kdJmBfzOPnWJJg6/zSVBuz2gaHMAfrjYKYijJ1gkvVObZvICMpPOl5fy6YK4A
 ESbeU4SD1T+igfOB762pDmeDCAXFYd0ia90MGarwnfNb6TkzY+OwN+yDlpTNLIt1vwNw
 MLYB1orSxLMZ/a6IVXsPfRXyY2XoThvyjQZJVNd+fR/cpvbwJYpfgdyQGa5SN4UVyE8r
 yS19jlgZ+8RYvvjJ9wUpt48FSc/0zgV63VJUGNElbBGYpboL6kSnpSteqUMFYYk+0b37
 UAAA==
X-Gm-Message-State: AOAM532QtVTGChjxWntmA64h8IL6ARFEAOI+SoZTS51tLyRV9noH0hdN
 0sh3VH6CXS0Vqjm7DhxJxM/Wk3m/zeeWlA==
X-Google-Smtp-Source: ABdhPJz9GSal/2dK6CHAa3Pg8hjx4AoZg7gZ61fPQahpVP/jTuWIlbLu0jqdj1rDnP7yJ7Abov+jjA==
X-Received: by 2002:a65:5c87:: with SMTP id a7mr13189799pgt.312.1624078622567; 
 Fri, 18 Jun 2021 21:57:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id i6sm11581378pgg.50.2021.06.18.21.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 21:57:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tcg: Allocate sufficient storage in temp_allocate_frame
Date: Fri, 18 Jun 2021 21:57:00 -0700
Message-Id: <20210619045700.46907-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619045700.46907-1-richard.henderson@linaro.org>
References: <20210619045700.46907-1-richard.henderson@linaro.org>
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
Cc: sw@weilnetz.de, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function should have been updated for vector types
when they were introduced.

Cc: qemu-stable@nongnu.org
Fixes: d2fd745fe8b
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/367
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 52e858523c..1bad423bde 100644
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
+        size = 32, align = TCG_TARGET_STACK_ALIGN;
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


