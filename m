Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E96F51BA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:35:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pO-0007sE-Og; Wed, 03 May 2023 03:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ox-0006pj-7h
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6os-0007Id-IX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so49208695e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098552; x=1685690552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=goIerk8+h2mAmH5cdq9rvqtnI9Xor6Xtsg8O4mT4pEA=;
 b=yZKhZ+vX1mt+kIT9bzZipc7AmEfa5uUtMjtbONrGso8YC6mAFXWxrMhHaTU+fcgjSA
 vZyh2a1JXaK7khc6F5+BP9C60q1iWnVArNjR2OM9/MJHiihTBzAtbQ68lWj7vfAtC1o0
 T1tWjievG5oqOfPUjFPJNrWUgKxCFTEKYW+ZVyGY0UWloWE54S2bR6iebN0V23Lbwv5H
 WRowBt2ZsBVC7uqgkg9l9lQrA0heWxYCzmO5QqGt+zFY+afpJaKyN5I/VpQIKb1zZhIo
 27YftFrA6Oym3uz7300jCFzftCXVLUkDfOSAuVFzNZ69AtFcnOvFVMbqObgMVyQqokr+
 rmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098552; x=1685690552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=goIerk8+h2mAmH5cdq9rvqtnI9Xor6Xtsg8O4mT4pEA=;
 b=aMkerXZLOd0Gx02hhMBUoM7eW+9K4c2GOZ3LVFA1U0wXnVm4wdnlztDP9mLktWBL3n
 9Hw6gPOhREVm/F2ihkKWDTTAzUJvuzLbHXuUt9Hmo7mX/8i68yo59Ba4LlT0qZvArPaB
 KqpiffSjalyw75bXNOqJBoKmh26rUUDRvjbXeroBkat2FOO4PjyQdXIBNFFO7mI7foWm
 zrVhfu0oyfWc8f5eKkniKycWhM1kRu8AwT4urrqN/Ad7yziPYV5B4dijiNVewLp3usSz
 7k1b6rEZtKleqIpGwEVyy1VknVkc/ypLQ4V6wHJM6hpqHwAWTiVKoT6S7P5uj4iyKqSo
 BuWw==
X-Gm-Message-State: AC+VfDyclVVI1GmjwMZ+SmZaG+gXrofkNdgTFhewxjuqCDLKlxgmWXAK
 0V9e0YjYbf/ZxrAT1v/bITC2lD9W5UFYc+BGfQAKWw==
X-Google-Smtp-Source: ACHHUZ6bZmLFD5ttbhszEz3k5WG7lIYDNmpVp2OMDMbJxSCKPyN7EzLlje41/lKrO+bqWvUv+HeF+Q==
X-Received: by 2002:a1c:7205:0:b0:3f1:8338:4b8c with SMTP id
 n5-20020a1c7205000000b003f183384b8cmr14382952wmc.1.1683098551870; 
 Wed, 03 May 2023 00:22:31 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 07/84] accel/tcg: Merge gen_mem_wrapped with
 plugin_gen_empty_mem_callback
Date: Wed,  3 May 2023 08:20:58 +0100
Message-Id: <20230503072221.1746802-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As gen_mem_wrapped is only used in plugin_gen_empty_mem_callback,
we can avoid the curiosity of union mem_gen_fn by inlining it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 5efb8db258..04facd6305 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -202,35 +202,17 @@ static void plugin_gen_empty_callback(enum plugin_gen_from from)
     }
 }
 
-union mem_gen_fn {
-    void (*mem_fn)(TCGv, uint32_t);
-    void (*inline_fn)(void);
-};
-
-static void gen_mem_wrapped(enum plugin_gen_cb type,
-                            const union mem_gen_fn *f, TCGv addr,
-                            uint32_t info, bool is_mem)
+void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info)
 {
     enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
 
-    gen_plugin_cb_start(PLUGIN_GEN_FROM_MEM, type, rw);
-    if (is_mem) {
-        f->mem_fn(addr, info);
-    } else {
-        f->inline_fn();
-    }
+    gen_plugin_cb_start(PLUGIN_GEN_FROM_MEM, PLUGIN_GEN_CB_MEM, rw);
+    gen_empty_mem_cb(addr, info);
     tcg_gen_plugin_cb_end();
-}
 
-void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info)
-{
-    union mem_gen_fn fn;
-
-    fn.mem_fn = gen_empty_mem_cb;
-    gen_mem_wrapped(PLUGIN_GEN_CB_MEM, &fn, addr, info, true);
-
-    fn.inline_fn = gen_empty_inline_cb;
-    gen_mem_wrapped(PLUGIN_GEN_CB_INLINE, &fn, 0, info, false);
+    gen_plugin_cb_start(PLUGIN_GEN_FROM_MEM, PLUGIN_GEN_CB_INLINE, rw);
+    gen_empty_inline_cb();
+    tcg_gen_plugin_cb_end();
 }
 
 static TCGOp *find_op(TCGOp *op, TCGOpcode opc)
-- 
2.34.1


