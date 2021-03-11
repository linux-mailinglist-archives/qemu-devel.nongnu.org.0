Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C133762D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:52:17 +0100 (CET)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMfg-0008PE-PS
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUD-0003Lc-3D
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:25 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU7-0006IH-KQ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:24 -0500
Received: by mail-qt1-x82b.google.com with SMTP id l13so1267144qtu.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cx+nFCxFv3Yh5ev57gtG/OnK3pXMi4fhwChTqjnm+qQ=;
 b=LUa4LpkGyBaVasFH5DtoUt/db2sH2PotFJveGboAWuZaUXxeFu+QGX2DUhos6dkup5
 sUqM5niYJPV+fTEwP3aQFimsWwQb/nBKsj8FisA5TqyG4gE0Nwl7/HjFugCxECHjdaKP
 oe6rVilqpSKaPcvBzLNPjJVV2Mt+Q0uUMrHTVEWG+0H6LFMaxwn54JkTURbOPqe74jto
 8P+YYWPaPenAG7STo/2Klx5pplNAGkqk+Ofis7svMuYiIhKHrb5+3BjXs7hEkpyu7eis
 v728bORqRUAMGhOao8aiVp4ilQssGkhu5W/omvN4v1KgEH8IG7fnVlyMhkkJLivqcV5t
 EmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cx+nFCxFv3Yh5ev57gtG/OnK3pXMi4fhwChTqjnm+qQ=;
 b=LqZ7q5TLgddGdyxlmUQvtX+0u7k3JXRlSonVi3ZK1bS1Tz8sl0wInjPpsy0vic7LpF
 ALkNZ8NxACm6QbwntsxMOJrMvzbxm9Lwfrd0CcSXuK6bIU0EFyRDqGxe7p5qDEhW7rPJ
 46t2oPPykOPidX51bV9YGQgwTly/8fdozDRmegZvjftQllFHCI6DOpou5bin4QTjh7Kl
 vzQKFn5Kfi4VW9CstCdoayFRZeleumfqTMjOqYTQ0+B6ZGcZHBLTO7jvOoVKEq0hG7LA
 ZOuq1k3jjIHYfrwVEL+vrQ1h3WxpiictouC3fjz0WuOCHVX+B9nHdiXJMns6tnU1EcCN
 ipvQ==
X-Gm-Message-State: AOAM531MScroXgfZoCjfYPgKkaxm2AfTYoNcLz+uolPXzTD+VjL/pqHa
 n0o42PrXPuoPKuFe8nUi7GPXBX8H8MlYNM++
X-Google-Smtp-Source: ABdhPJwYwnM9tesV2RvtcOKkWZ/bt7W6U4M25fkR08Z3nOhUqPInQPPfgIqcZl7gbd2ePpExMwf86w==
X-Received: by 2002:ac8:6746:: with SMTP id n6mr7702190qtp.236.1615473614795; 
 Thu, 11 Mar 2021 06:40:14 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/57] tcg/tci: Reuse tci_args_l for exit_tb
Date: Thu, 11 Mar 2021 08:39:13 -0600
Message-Id: <20210311143958.562625-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not emit a uint64_t, but a tcg_target_ulong, aka uintptr_t.
This reduces the size of the constant on 32-bit hosts.
The assert for label != NULL has to be removed because that
is a valid value for exit_tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 13 ++++---------
 tcg/tci/tcg-target.c.inc |  2 +-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 066e27b492..6fbbc48ecf 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -160,9 +160,7 @@ tci_read_ulong(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
 
 static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
 {
-    tcg_target_ulong label = tci_read_i(tb_ptr);
-    tci_assert(label != 0);
-    return label;
+    return tci_read_i(tb_ptr);
 }
 
 /*
@@ -400,7 +398,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     long tcg_temps[CPU_TEMP_BUF_NLONGS];
     uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
-    uintptr_t ret = 0;
 
     regs[TCG_AREG0] = (tcg_target_ulong)env;
     regs[TCG_REG_CALL_STACK] = sp_value;
@@ -815,9 +812,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* QEMU specific operations. */
 
         case INDEX_op_exit_tb:
-            ret = *(uint64_t *)tb_ptr;
-            goto exit;
-            break;
+            tci_args_l(&tb_ptr, &ptr);
+            return (uintptr_t)ptr;
+
         case INDEX_op_goto_tb:
             /* Jump address is aligned */
             tb_ptr = QEMU_ALIGN_PTR_UP(tb_ptr, 4);
@@ -975,6 +972,4 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         }
         tci_assert(tb_ptr == old_code_ptr + op_size);
     }
-exit:
-    return ret;
 }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c79f9c32d8..ff8040510f 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -401,7 +401,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     switch (opc) {
     case INDEX_op_exit_tb:
-        tcg_out64(s, args[0]);
+        tcg_out_i(s, args[0]);
         break;
 
     case INDEX_op_goto_tb:
-- 
2.25.1


