Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C3370FF3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:59:30 +0200 (CEST)
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLzl-0000mk-R2
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxt-0007TO-JR
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:33 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxs-0000WU-04
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id g24so1297909pji.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+SLOw4zsRtuPC9MYeuJNMGokzj+MHBcGdvFfOSgGj3c=;
 b=stlPEPy5uQ9BGpmOgRwpaI7ggIE8FVCulQkiKP4u2+8/4bvChdjD7np47AwhzkMM3D
 1zZx2FruFIb4wYuYHF07rl3krRNQ8hqO5lzv1nygODpPZjovJXtucILl8juSi2+T5x+d
 ZgmRb622liDsj34rZWAt4N4zXfR+zJ4r2sDBkQf1y/VtKLaNsNxQaDAgJbaihde00nIa
 Qmv4vD9GVFS74AbAolFEUiu7bgfIGnL85vNcqOZUM50CC3kE7iDIpY4TrgiOKdrbJinx
 umdK5mIqSwhKnS43KQQfwizbE9QPn1LcupcxSeZOXzPP5wU8fZF83r2D/Y5lYiLZBGYc
 P74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+SLOw4zsRtuPC9MYeuJNMGokzj+MHBcGdvFfOSgGj3c=;
 b=AAicinZ41oo4qZ6vnwHhjxPPetNav5dNZP6AARwSThN3iYkTQWP1Yfqqq0mrPN6qCv
 DKpzMC+10GFEBaHIgDDOnoW0udJjUgKKApoc/WR/CmbGXK52PfqmvIQHiDoL/j3/0yMJ
 Qy2aOd8oi1tjgFo21+4yNMNmu+haH0K2KSizE6LhWC1KTuvELjxEBMgdsL54L9chsVVb
 UGR9hgCB88SqKZzSij8vnMKS3THVvXi6usRey79LrMyyxH6PJyzgZaG8Nq6Cyw9bAXNH
 auL0hoe7PEgvw1Uy1n8e/Ra+kl7uBrSTo9APxAHsfOYSLoWfWW+bmSuAA1Tj8hyLNd9h
 rNCw==
X-Gm-Message-State: AOAM531gYfAi7BdUaXddYYr4QxPxhRfQhADIfbHnJ2Bi9Ncw091MgGwM
 I6RAkpIa3tFohoMuQwrF0Em3Tb2ZVb3cXw==
X-Google-Smtp-Source: ABdhPJwAhLzPzovkRhyOnTFRCXARruW+rGWuikyJQeHIM+WgaZZRzJ6O4OC1HbjXE6CmSGZ0lNAL9g==
X-Received: by 2002:a17:90b:514:: with SMTP id
 r20mr27903182pjz.193.1619999850920; 
 Sun, 02 May 2021 16:57:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/26] accel/tcg/plugin-gen: Drop inline markers
Date: Sun,  2 May 2021 16:57:04 -0700
Message-Id: <20210502235727.1979457-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Let the compiler decide on inlining.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index c3dc3effe7..eb99be52d0 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -161,9 +161,8 @@ static void gen_empty_mem_helper(void)
     tcg_temp_free_ptr(ptr);
 }
 
-static inline
-void gen_plugin_cb_start(enum plugin_gen_from from,
-                         enum plugin_gen_cb type, unsigned wr)
+static void gen_plugin_cb_start(enum plugin_gen_from from,
+                                enum plugin_gen_cb type, unsigned wr)
 {
     TCGOp *op;
 
@@ -180,7 +179,7 @@ static void gen_wrapped(enum plugin_gen_from from,
     tcg_gen_plugin_cb_end();
 }
 
-static inline void plugin_gen_empty_callback(enum plugin_gen_from from)
+static void plugin_gen_empty_callback(enum plugin_gen_from from)
 {
     switch (from) {
     case PLUGIN_GEN_AFTER_INSN:
@@ -514,9 +513,8 @@ static bool op_rw(const TCGOp *op, const struct qemu_plugin_dyn_cb *cb)
     return !!(cb->rw & (w + 1));
 }
 
-static inline
-void inject_cb_type(const GArray *cbs, TCGOp *begin_op, inject_fn inject,
-                    op_ok_fn ok)
+static void inject_cb_type(const GArray *cbs, TCGOp *begin_op,
+                           inject_fn inject, op_ok_fn ok)
 {
     TCGOp *end_op;
     TCGOp *op;
-- 
2.25.1


