Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C6A6F8AF6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:28:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2va-0000rh-MF; Fri, 05 May 2023 17:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vX-0000q4-F3
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:19 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vP-0004fw-G7
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso16256345e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321910; x=1685913910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bq2h9X5UNDb637fCQb6pFT3eLaF1A8JaUegXUakX2qE=;
 b=OibSM4vE2KwV+ScIoiCvrsYDbgSRWzHCgdY3uAPxGJAYTj8crdHJptn27iRPOEuG+e
 xyhSzmi9AV7HNr1ymbaUnmL/ANTvZ3Pa+qruthJk8fm9yW1n1Vv2c8+Hc8goMr+MGYjQ
 eEc0R9hLgi8B5hAELMzcUpJ6SRaaUy85w1B3J4zH99ilNIqpA5nR1JLbqIa9HFIKg1G7
 bW50P+A6nRDwkBulD/pxm//VcqPn6W+ftFj6Yw6zYfjZSNGY66CL1rCT5VubSwUpmk2c
 DWlCc0LJ0X75exZnvBG9JKLsySxe6w1Rrwllazipde6YAQxJzeQP79+wH7bNNKojuE4V
 GuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321910; x=1685913910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bq2h9X5UNDb637fCQb6pFT3eLaF1A8JaUegXUakX2qE=;
 b=DEqK6pp78/DGbxBTYI6WjuozOOa5gX9MUPTSfIi2yJJ9po2LJPq+vfNdQ59OvuZ9jj
 85FQ6a4IXzb7F9aLvjux3vdSl0p7zjoDmwEgGLr+vmhdHGtDiwfOsUXHskL5vE4linQm
 zkJqdOi2bUfuWDxVpDgS6beFUC//x91w3yNB3w7/T8d15e9fsXhdDQo0fBRcWjdbRVYZ
 qRjZ8B6jD7QWHquK1jz2I/xqPjSBR+B9AVIFYjTnGaARLpDx4r7jQ66CtB41VZehlJpD
 OiODE7n4nCiR86E9a/cISO+DvzHiX3lp3zqDU8vhI/wvDYy78mL8E6lA/2DiijJRjQud
 ttbQ==
X-Gm-Message-State: AC+VfDxEB7b2B3XElRcekqaHR95Kc7n0nhhhCI8qOiynQEiyUZ2XsQo/
 4zV3z++gLAsxSnHXRMSO5SKFnALkihWPVsfn+O2lwg==
X-Google-Smtp-Source: ACHHUZ6vHaHs6yClLSUCbHP4C6xOe50fZC5yUJjG38FNKiS1/3kZUVDCTfh/V03wnOUj81IP9ZDjQg==
X-Received: by 2002:a7b:c38c:0:b0:3f4:e5c:794 with SMTP id
 s12-20020a7bc38c000000b003f40e5c0794mr1957297wmj.3.1683321910150; 
 Fri, 05 May 2023 14:25:10 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 38/42] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Fri,  5 May 2023 22:24:43 +0100
Message-Id: <20230505212447.374546-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index dbe4bf96b9..7e6466d3b6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1178,7 +1178,7 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
 };
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is_64)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1636,10 +1636,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, a0, a1, a2, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, a0, a1, a2, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
-- 
2.34.1


