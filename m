Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBD8698AEF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUe0-0007Hz-DA; Wed, 15 Feb 2023 22:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdt-0007H8-CW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:05 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdr-00005q-Md
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:05 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso5197911pju.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DmwtowJSaitTccWLoWYueof39S9NQxf7bK1L9fJ0J9g=;
 b=itDVOOib8sQbDGGMUBPA8KrlnXmwQ5kMJMGYtuAQx+GXYwgCZuGTrU1p6jzn8I06fX
 aKQtr5wAVGn3q/y2sca4xgJfxIhWQShVos2x7qe9aAkfi8L2DwNCwzoWNbzoR2beK+9u
 8BESgJSO6d7qIyKXOx6YjWkONmekzUWB7DEURkIlZMbOvX/+YeJJggdv7WryQ7M0mFRg
 I2w229Ct0cQ47pPEdR7fbtzvLIZNLAOkKDn1erYaQuNATLRAprCwGGMEZNoaNjY+aaf9
 +qRkId8WQkKSxclGaNCgv6hxpkXTjGLwlw39fnYIh7oqU3jsAxri1KeiGnTOQoCcHhNz
 dYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DmwtowJSaitTccWLoWYueof39S9NQxf7bK1L9fJ0J9g=;
 b=jlqxXcfII3ZQ/H60/O1x5QjGaEOJxa/79/YyWPAYS/UnJptQs4ntrGpMqsh9MC/QeX
 FwzHmfrQFxs38T6VGAW7bNwVzxyx9gBrgLsO3oe2ZjuJQN368/hc1nOL/plSpikfk/5a
 qxZts/Y8TIIKFfSZuh2dJpwnKAl3KnVSoW521+9smYXUg2bHdXJNBFMOLyLO+ZHG2bct
 TJYBI4AZ9r9mq3J/yOpKmW+tAYBPvpITgd6/B+7Ghf+oz2L2q6af/Zdm4nFWh1IYXUmZ
 tDGpJp/r4MYYMWfAkNW63WLOwHUi8jxDvRXeFK0uTlzdrTLC4TSDBM/xo0IQt1IFQHj2
 06AQ==
X-Gm-Message-State: AO0yUKWV7QjcfxjRC4eVcIEgK9Z6qlB2WJ3A675t1paALyjesTERiz3O
 JYmrdO5Ta/22cGXnCQJS1zRwMLNoLZvSh9aV7gM=
X-Google-Smtp-Source: AK7set/OeeePvjVcfnkXm+h8F87fSd+Q2EI/bnLXq+nMQ1sGa2fypadUflnd07CL4Tf7WydGJNNNZw==
X-Received: by 2002:a05:6a21:6d9f:b0:c7:1fff:fab7 with SMTP id
 wl31-20020a056a216d9f00b000c71ffffab7mr729187pzb.54.1676516942243; 
 Wed, 15 Feb 2023 19:09:02 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 03/19] target/arm: Use tcg_gen_qemu_{st,
 ld}_i128 for do_fp_{st, ld}
Date: Wed, 15 Feb 2023 17:08:38 -1000
Message-Id: <20230216030854.1212208-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

While we don't require 16-byte atomicity here, using a single
larger operation simplifies the code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d7d4b68328..edf92a728f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -965,25 +965,20 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
 
     tcg_gen_ld_i64(tmplo, cpu_env, fp_reg_offset(s, srcidx, MO_64));
 
-    if (size < 4) {
+    if (size < MO_128) {
         mop = finalize_memop(s, size);
         tcg_gen_qemu_st_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
-        bool be = s->be_data == MO_BE;
-        TCGv_i64 tcg_hiaddr = tcg_temp_new_i64();
         TCGv_i64 tmphi = tcg_temp_new_i64();
+        TCGv_i128 t16 = tcg_temp_new_i128();
 
         tcg_gen_ld_i64(tmphi, cpu_env, fp_reg_hi_offset(s, srcidx));
-
-        mop = s->be_data | MO_UQ;
-        tcg_gen_qemu_st_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
-                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
-        tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_st_i64(be ? tmplo : tmphi, tcg_hiaddr,
-                            get_mem_index(s), mop);
-
-        tcg_temp_free_i64(tcg_hiaddr);
+        tcg_gen_concat_i64_i128(t16, tmplo, tmphi);
         tcg_temp_free_i64(tmphi);
+
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_st_i128(t16, tcg_addr, get_mem_index(s), mop);
+        tcg_temp_free_i128(t16);
     }
 
     tcg_temp_free_i64(tmplo);
@@ -999,23 +994,18 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
     TCGv_i64 tmphi = NULL;
     MemOp mop;
 
-    if (size < 4) {
+    if (size < MO_128) {
         mop = finalize_memop(s, size);
         tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
-        bool be = s->be_data == MO_BE;
-        TCGv_i64 tcg_hiaddr;
+        TCGv_i128 t16 = tcg_temp_new_i128();
+
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_ld_i128(t16, tcg_addr, get_mem_index(s), mop);
 
         tmphi = tcg_temp_new_i64();
-        tcg_hiaddr = tcg_temp_new_i64();
-
-        mop = s->be_data | MO_UQ;
-        tcg_gen_qemu_ld_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
-                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
-        tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_ld_i64(be ? tmplo : tmphi, tcg_hiaddr,
-                            get_mem_index(s), mop);
-        tcg_temp_free_i64(tcg_hiaddr);
+        tcg_gen_extr_i128_i64(tmplo, tmphi, t16);
+        tcg_temp_free_i128(t16);
     }
 
     tcg_gen_st_i64(tmplo, cpu_env, fp_reg_offset(s, destidx, MO_64));
-- 
2.34.1


