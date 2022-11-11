Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F4A62549C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:49:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOgQ-000738-0N; Fri, 11 Nov 2022 02:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgA-0006po-NA
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:23 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOg8-0000HZ-PQ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:22 -0500
Received: by mail-pf1-x42a.google.com with SMTP id k22so4249710pfd.3
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e3FO2jzvIYQcueRqn3HizCpFs7YYSJ2M6+2goqVEkVA=;
 b=vzbGTbDDKHAlig8yqbw10X1+5m1n1BFECddiH4nlE8fBsp2rQzhODNkyLdtgtV3cLt
 DKT6f797bQ4sLaYqZjAgb5kVNTxf05eNdOqQ4mhp//f4aWrAQFwhAFaNqzHfjFU4pRlp
 QaQBPcpoXsVwqQ7geF+Yav+hWTnLUREDACmDgn+VyUHv6WTktP/leZwp6xnpqKL5+iTJ
 qJrCjJwxitmUotE2G5unzfvc56ZkgzDEogfOFbUN1ersv64MZINu2a8gK/irwURof/vR
 otHe2zSli/YECRURYRj/i9flRJS5sSki5RdGxA7giX+cLDFL/sEd0kGhj/RIAQStmWha
 JETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3FO2jzvIYQcueRqn3HizCpFs7YYSJ2M6+2goqVEkVA=;
 b=RyCC9Yiqn7d+DMblWJgUFd4xKPfcr4OiEnSXH2BbHrV/sa2xyzBVogYO3Z5bONIk+p
 UvEktukN5HMQltbkWqV0rnnFhHauJ6YYDjIf0ddm5kcVaKRV/DQVbT522fYB0B1Vp2ug
 uXtjhwZA1eiZo5L2GKIKnkrKp1LZ8yrp6xsu9QF5sQ+j7zSWaKzeUfAkxa0l1EMnUMjZ
 87K0LVsGSI6p0W1YxmOZAHYct7lzCZS0juP8TlbD0XY9pXOW2eqrFzwIRMwCgvNipgku
 jGRCytSmKnd8Qscq28Q/CheyDQaQZvzGsdB5IS2RDrTTkw+ZKIuca60gBWmgDhGw8H9b
 LFAA==
X-Gm-Message-State: ANoB5pnu+SdLO5YgtJcHnmPTnPe4qgUPuA1FB4KG9ByKCFQ2Gmq4V3lU
 9phDqmElHl4nPkRvD8mhpNDaH+PrRVp8ce+v
X-Google-Smtp-Source: AA0mqf442/RPKvQq9ezJC4cgnYs3EdDByT/5HtRi2WnzM4bzfKaPDVAUAeiCoLd2m+S5H2GerGvy6Q==
X-Received: by 2002:a63:4551:0:b0:435:7957:559d with SMTP id
 u17-20020a634551000000b004357957559dmr650320pgk.122.1668152539431; 
 Thu, 10 Nov 2022 23:42:19 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.42.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:42:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 31/45] tcg: Allocate objects contiguously in
 temp_allocate_frame
Date: Fri, 11 Nov 2022 17:40:47 +1000
Message-Id: <20221111074101.2069454-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When allocating a temp to the stack frame, consider the
base type and allocate all parts at once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 11948256f2..3eabb6ef4d 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3296,11 +3296,12 @@ static void check_regs(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    int size = tcg_type_size(ts->type);
-    int align;
     intptr_t off;
+    int size, align;
 
-    switch (ts->type) {
+    /* When allocating an object, look at the full type. */
+    size = tcg_type_size(ts->base_type);
+    switch (ts->base_type) {
     case TCG_TYPE_I32:
         align = 4;
         break;
@@ -3331,13 +3332,26 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
         tcg_raise_tb_overflow(s);
     }
     s->current_frame_offset = off + size;
-
-    ts->mem_offset = off;
 #if defined(__sparc__)
-    ts->mem_offset += TCG_TARGET_STACK_BIAS;
+    off += TCG_TARGET_STACK_BIAS;
 #endif
-    ts->mem_base = s->frame_temp;
-    ts->mem_allocated = 1;
+
+    /* If the object was subdivided, assign memory to all the parts. */
+    if (ts->base_type != ts->type) {
+        int part_size = tcg_type_size(ts->type);
+        int part_count = size / part_size;
+
+        ts -= ts->temp_subindex;
+        for (int i = 0; i < part_count; ++i) {
+            ts[i].mem_offset = off + i * part_size;
+            ts[i].mem_base = s->frame_temp;
+            ts[i].mem_allocated = 1;
+        }
+    } else {
+        ts->mem_offset = off;
+        ts->mem_base = s->frame_temp;
+        ts->mem_allocated = 1;
+    }
 }
 
 static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
-- 
2.34.1


