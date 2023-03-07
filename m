Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4019A6AF778
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:23:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekm-0001eB-Ik; Tue, 07 Mar 2023 16:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekj-0001Wq-7Y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:45 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekh-00081X-EN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id e13so13482265wro.10
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BX3YvcmSLRF9NpgkkXb0E1NzJghZEbcg5m5XOvkqtlQ=;
 b=e4cga0wqy0cKs4XIbDjANpjXFfd+4flPndWLTTkHHsOtuW7fTvjKTAU5E/cTox1JGB
 2e5yXJsVLQ/7KLx0h1pHa1vWtURa2Rw0GDdGXHuDBi+sXlAOX+apooAxhnThQ2svSUE/
 l6P7shIaRdaltJ20IA+XGJj+cROddw3fp2fYj4iTT392AKeQEm+dIHoOWYDP/HopfRGB
 3dxkPmYlpvNJ7/TbJ/nPtGI9Q6wLqIKyhQPfLaA1EWECyx4sspPR1K/mno0LXCDO76jQ
 wf+uF5y+bbQbsvKnK+a1BKmqOt3eulX1FFGsMlR4434N1Lvb5bRufuIqKdvvrNlB+gBl
 9qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BX3YvcmSLRF9NpgkkXb0E1NzJghZEbcg5m5XOvkqtlQ=;
 b=y6UFiIsl51mZHisujr5IBdwanK96K1S7rZV5r7in3nDOeKWRQNcnYjSaeadAzozWmC
 aV2Gw7evQi8PX+pWPHe0OdL4/AMSno5QNa0BCP1IyI7qwxbaCN34gGaDADG7FrESAVF4
 M+ulfi9oeC3yRbUjAQBtU+xi73LCYLSPy4Haru/idrvBD/5vuvG3VgEmZiFhqshez4tl
 07XV4DOpKLrzqH7GzW+AeypqxzzIhFFWk8vmjCF5vNhxFf+ywneZF7Dkxu8/ISec4hI7
 sYA76j6Gn9Zne3JkcA44/3EC+oUKUO4IyMJOvhxQuW3PJ1Jx3MfyqCxB4joBK+4kz0xA
 V8yA==
X-Gm-Message-State: AO0yUKWqBQqcuQidGtPdL1zMz8mYOp9S+0XVD7kcYK90LaxBocAuqc8l
 JjWY/RnPBQAS2OtSzCZNax/HK0CdI2CIhQ49Vyc=
X-Google-Smtp-Source: AK7set8hyjn8PqCFVRolBRUoXYuiL7EqT+PZidS2MrByJklauA2qBJInFwSA4astBSRmSnzM+rgBPw==
X-Received: by 2002:a05:6000:128a:b0:2c7:17a0:c6b5 with SMTP id
 f10-20020a056000128a00b002c717a0c6b5mr10896128wrx.34.1678224101504; 
 Tue, 07 Mar 2023 13:21:41 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n1-20020adffe01000000b002c4084d3472sm13684889wrr.58.2023.03.07.13.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 817451FFBB;
 Tue,  7 Mar 2023 21:21:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 03/30] gdbstub: Make syscall_complete/[gs]et_reg
 target-agnostic typedefs
Date: Tue,  7 Mar 2023 21:21:12 +0000
Message-Id: <20230307212139.883112-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Prototypes using gdb_syscall_complete_cb() or gdb_?et_reg_cb()
don't depend on "cpu.h", thus are not target-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221214143659.62133-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-4-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-4-richard.henderson@linaro.org>

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index f667014888..1636fb3841 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -71,9 +71,6 @@ struct gdb_timeval {
   uint64_t tv_usec;   /* microsecond */
 } QEMU_PACKED;
 
-#ifdef NEED_CPU_H
-#include "cpu.h"
-
 typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);
 
 /**
@@ -126,6 +123,7 @@ int gdb_handlesig(CPUState *, int);
 void gdb_signalled(CPUArchState *, int);
 void gdbserver_fork(CPUState *);
 #endif
+
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
 typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
@@ -133,6 +131,9 @@ void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos);
 
+#ifdef NEED_CPU_H
+#include "cpu.h"
+
 /*
  * The GDB remote protocol transfers values in target byte order. As
  * the gdbstub may be batching up several register values we always
-- 
2.39.2


