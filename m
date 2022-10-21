Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A02160745C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:43:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloYg-0000RU-Ff
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:43:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHI-0003Cg-Lc
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmH5-00039M-1Z
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:59 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmH3-0005gQ-8W
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:58 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i3so1784917pfk.9
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L8z30GASyjyVRHVSC+j+Ssl7AGNt135XvRhLazZAsug=;
 b=BJFs+JcNM8Yh+Va2bMuv5w2uKT//TxeggMLjakhUrUKh3svwR1fqajAScoBtlJWK5b
 WeBBeriP4NQ2k7X72SY7tQViARtUx/UOkrk+YqVxZ8NU+NmQf5jALH+/bqcJkcrT2IJi
 Dy9GdLULUgWEnHZnaY1LznK8PWVo6teMKlOAwUIyUJCGO+obfV34vz529jnAdL+fWCI/
 +sBIgxr0OgwN95IxJzUsHPc0DoyFJKjy9YFXT/Vgx9QQ8PKAOoz/s3W0enDsOGrd/+HY
 gBfXcfdXRN3LxVF9BaGbiN28RN4sdfBtdgpvteQdqAAxofFKhc82ltnzVlcRB+H1qW6+
 BUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L8z30GASyjyVRHVSC+j+Ssl7AGNt135XvRhLazZAsug=;
 b=Xt2wDAQ3QAbP8fi2eGwANBEiy7qXeXBD6wlmVyZc3SPR/nVF6EyBk6EyHI+9+97Wsh
 fqs9/N4p8n25w9d6x7iNLe5LSEjGZ73G83J821jlOSI6F17bN4xB9McW74+8W+MbBQzo
 A+49JoB2tGBNJKHWGkYHOGrWtr1LXAvv/qeoWxqlqHw2DM54gVOgXVk3HjaiEU9Vy+5d
 PoW+sbBSsPuhXnZZ8ftfsy56KZW++DFgIP8QkdURljxejPjsRM0BwTMB4HKDPKLjrPhC
 4xGDSanQAIr1r2dSHpcXG17rkmFBy81HVxvKhau9Us9Zfel+Fl9FZ05krp20d6VL2NyT
 12dA==
X-Gm-Message-State: ACrzQf3ZcpekNaAu8vVa4IUrwJnqGMo1BXrsGHFqcMA60wTqVU0pVxO1
 LG0U6YOSarCE74c1h6Wa3J1xEWL9F2oCXum+
X-Google-Smtp-Source: AMsMyM6+D0TDl59avP5gnozkz8Yw9Tw1A9lcN0sH6gXAjS0z2lwt2Ul0C2Dwcj5G2K+uS0HhN+//8w==
X-Received: by 2002:a05:6a00:cce:b0:565:cbe0:16c6 with SMTP id
 b14-20020a056a000cce00b00565cbe016c6mr17964614pfv.56.1666336615857; 
 Fri, 21 Oct 2022 00:16:55 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/36] tcg: Add temp_subindex to TCGTemp
Date: Fri, 21 Oct 2022 17:15:24 +1000
Message-Id: <20221021071549.2398137-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record the location of a TCGTemp within a larger object.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 1 +
 tcg/tcg.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d207bc47be..afa18986b1 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -456,6 +456,7 @@ typedef struct TCGTemp {
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
     unsigned int temp_allocated:1;
+    unsigned int temp_subindex:1;
 
     int64_t val;
     struct TCGTemp *mem_base;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6c4f949c85..135d9a9a0a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -927,6 +927,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts2->mem_allocated = 1;
         ts2->mem_base = base_ts;
         ts2->mem_offset = offset + (1 - bigendian) * 4;
+        ts2->temp_subindex = 1;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_1");
         ts2->name = strdup(buf);
@@ -973,6 +974,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->kind = kind;
         } else {
             ts->base_type = type;
@@ -1091,6 +1093,7 @@ TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
             ts2->type = TCG_TYPE_I32;
             ts2->kind = TEMP_CONST;
             ts2->temp_allocated = 1;
+            ts2->temp_subindex = 1;
             ts2->val = val >> 32;
         } else {
             ts->base_type = type;
-- 
2.34.1


