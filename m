Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F93F3FB163
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:49:08 +0200 (CEST)
Received: from localhost ([::1]:37562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb6R-00057e-Kq
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajJ-0004Hg-CW
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:13 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajH-0007c7-MM
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id j1so8746262pjv.3
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kn4VA0Gfiy2fMT/+j/7s6nwywXz5CecsdEcFGy7JPD8=;
 b=pVvsADB+4ng/k7U6ZSCRxFCc8/tX16PDK5hV+bXfspy7y4PXq13aETxxjAcb3/v4+U
 W+gHYNgwWp2pxJ1/etvix+AYV3bUlxl4DZgZSrUoI3/LhFGZv7yEaSPu3g9zGpFJIy0v
 OukEv2fbgrw3lDgtmGCs9psOW5DRsMBaLyEGUjq1z0B0ZRX8DKLnkPTgMacnjR5acMi3
 wF7zipIbVD1bgQ546dWAPWHglfub+BP2kvmQTyNEJeUbg0mV32i7OAaQcBd8vf7mr2h7
 KhKR3eFCHO3Pl1pstFR7GzctF6SlPiJSlAYYmTL/dtC51NnfHiAxAvj7YaUZGioDSmnw
 hFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kn4VA0Gfiy2fMT/+j/7s6nwywXz5CecsdEcFGy7JPD8=;
 b=QbR/jKQuz/CwjCn2IHuIqK4FDQGGP8OnaE1ci7WLYVnVyZ+7XyCP9cIZXqcnw5Z8go
 0Eq6xQf0wQfCdknUMeOo0c3E2QXzUGJNpL2MKDs/UeULVIQpg7G9Bb58ceFK6NaN/NAR
 HDLDhNWeIPAJolGP6ee4aPUa701JTHsN5mzCG9SlPC+y9NfDIBoiSAD3zy0AlhdCtwQc
 OcABNSokR9Y0UOIoIAA7gVt+HYs5C+30ymDZ2T/VJ8P+/pJQTPIFGzpEBKaqTSZoUdLh
 x5LlMbge9304BovolU/+SQyKHz+8uZVSF8Odibgd8O7pqpzeFtRUDfjiSLWzf/dLS5Sm
 ebug==
X-Gm-Message-State: AOAM5334bOQTv3jdvMIIR1S6MSzFmc29BycDLaRZS6hVDasBAGIwv/iQ
 2yfS6t2IAz6h3pXjPec8Rf8Y4TZ9umNf8Q==
X-Google-Smtp-Source: ABdhPJzn8SPYOBNJyqAA53t+a16ZBKiMTUEbI4CZmqF7HM+fnRIClonxWDkGjLyS9KXhjh2+121toQ==
X-Received: by 2002:a17:90a:4316:: with SMTP id
 q22mr37787512pjg.151.1630304710386; 
 Sun, 29 Aug 2021 23:25:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/48] tcg/optimize: Split out fold_bswap
Date: Sun, 29 Aug 2021 23:24:30 -0700
Message-Id: <20210830062451.639572-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 79e46fec23..1366bbaa17 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -843,6 +843,17 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_bswap(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t = arg_info(op->args[1])->val;
+
+        t = do_constant_folding(op->opc, t, op->args[2]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_call(OptContext *ctx, TCGOp *op)
 {
     TCGContext *s = ctx->tcg;
@@ -1729,17 +1740,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(bswap16):
-        CASE_OP_32_64(bswap32):
-        case INDEX_op_bswap64_i64:
-            if (arg_is_const(op->args[1])) {
-                tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
-                                          op->args[2]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1764,6 +1764,11 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
+        CASE_OP_32_64(bswap16):
+        CASE_OP_32_64(bswap32):
+        case INDEX_op_bswap64_i64:
+            done = fold_bswap(&ctx, op);
+            break;
         CASE_OP_32_64(clz):
         CASE_OP_32_64(ctz):
             done = fold_count_zeros(&ctx, op);
-- 
2.25.1


