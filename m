Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AB131E0AA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:44:16 +0100 (CET)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTgF-00040C-JD
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLa-0008AK-Fe
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:54 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLX-0007Lt-N8
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:54 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k22so8037388pll.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cx+nFCxFv3Yh5ev57gtG/OnK3pXMi4fhwChTqjnm+qQ=;
 b=D7nLrH2fAEU/I1rluHhYO3MD7CIEtgOY2IB9/dUG8uIwRytDwHw8naY+5qrzNhrSQT
 MEEZ1oJAqfrQGyEYi5Luaj5ug0zE6tjTWOSQUL+Elw9dm9SGiBRtbFsA9JMZYtn91cXo
 XIauc362IvpAfu/Hf61V6Cmuvr1IRULvk7KvJ8vMGHPHRaJYQ/3PL0Bix1Ey/XN3uweE
 4/G1mEHEpa5LGWhFMxbIA5owppiAMKbAcGx3mvxIzY155T4VK1pd3SmH17gMJ/clFCUb
 6XBQH5L5aNN4pUhQSXLwL39nkppHyozvO9Mqg1LRLcUphEfUFDPpP7X73K7OMHPgzM+3
 3wWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cx+nFCxFv3Yh5ev57gtG/OnK3pXMi4fhwChTqjnm+qQ=;
 b=Ql0up6E6675g6zYKD+Y6aZED4/cjo4/TAAtOAllnpAMTdRZrnJKJBxJEAqBmG9viK1
 zDLS6SnOnlMU4hCx5BgOQ2Ig7tyHFZnNT5zdMtqmtvEh2KpHA+t0o5pZfzK0pd/0PqnZ
 h3ipQ8GyA9vC0qHJ4jja9Y1bXSFDdCw6+H1XUE7RzlcU4I9dj9azcDoVfsB47XAMMxq8
 sFLRDVxgH+q438gC/cqzLeXWBLrQBsQ6aYMU4o4EEqZKogMnvL3iojE8nvXPx4eJ8ZE4
 UTIFYqjmEz/2CfTuC7Pxvk0kjpeL/tryOYJjCNusIjhFlgx7eZljdUo9B/MsO6xOgxag
 wCpw==
X-Gm-Message-State: AOAM533Ng3RcvL57Ih9jCTAJtFYocW3Nvmp3IyIUk3cXLy71akAqvZc1
 I5hsaeBwmCzFUzqk6+JR/B6IB86pWVlD3Q==
X-Google-Smtp-Source: ABdhPJzExw6y4IaxErHS6b1VhIFGPVbMugMrPsEMFE04XC2gtGYbiTQB68drwWk2BFyl4K+zyOegPQ==
X-Received: by 2002:a17:90b:33ca:: with SMTP id
 lk10mr542705pjb.186.1613593370208; 
 Wed, 17 Feb 2021 12:22:50 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/71] tcg/tci: Reuse tci_args_l for exit_tb
Date: Wed, 17 Feb 2021 12:19:52 -0800
Message-Id: <20210217202036.1724901-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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


