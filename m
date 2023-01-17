Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA92670CE3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv70-0003cD-5G; Tue, 17 Jan 2023 18:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6v-0003WL-DC
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:21 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6t-0001OQ-Lx
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:21 -0500
Received: by mail-pl1-x636.google.com with SMTP id jl3so34323plb.8
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oa81JIYEewSyioKLFrfVkUjD0MZYKzwLtI6BWxCUHw=;
 b=wkPICFupvL+zxISpBJQauu5pNNGA+rAurHxxjTZx8y8YfKXaok8eQ5SMfiwoHn9JFC
 +0uUTnNYx4bEEpmWHOMg6htELbxXMFg5hmuu8R7Gwccm4mwV4ocugvQvI1DVTdfj0Ik4
 +Ru9g47Io5ni8QXdolgSZLtHHA8GPudVvxu6J3luqRQHn2an95xqwwxsqq76tF568SIc
 JMQASWR/eP8iAt4//c15SQF3WFJOIXrKxXeD3b47MmjWyGKjckJHE+3U0uO29d6oVyJA
 Kj2NfrJZ5XY9QvyAX346BpyWuYf3bsDvx2EhTi//JI+rP9oiQmfS92eyt0RE3VewBnNO
 aaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8oa81JIYEewSyioKLFrfVkUjD0MZYKzwLtI6BWxCUHw=;
 b=s1rDo7/egtsLvw7tQctmKXPVdRztTnYqI94Qx2cAgCUbKjcwH2dHoz51cU+5lhXXxd
 anaSuQ7mthBUUhFiGK74wNxZn4LyQTLZxbHRUoS/mBkjA7eK/N3Dukb0/I7mYSsTrihx
 LAiFPzgvooIrR0DL870/pdy+TimGbZGcEKYVRAaZQ5vjmMWNAzGg9ltShgwhR+iO2awI
 K3a5YNgg8RxcWUBV4AZznRcCodj2yrL9Q3A8Nhzdr4pP0sFCJetnUadTMS1zD7J3v10B
 Hea1Le8kHk5tFWjy+e7KJYnVVXzNbh0K/lAu0U2gu/u2LQLdtsNkNvglOLA/qbPROLSo
 IB+Q==
X-Gm-Message-State: AFqh2kopJS2D2CYo/5pmFvFy05wg34ddOwFzWRydqVx0Hu1wJphOIMB6
 40qmuERR8PN6U7lQVxtdNhngUu2VHq3fLVPG
X-Google-Smtp-Source: AMrXdXv7XZbK8EyzqM/x058WJk2/c1j/53GeuZSeICtK6NYbsbu//kN5sx/hQZ/+eZwyl0eyQGA8ZQ==
X-Received: by 2002:a05:6a20:8f21:b0:b5:389e:870e with SMTP id
 b33-20020a056a208f2100b000b5389e870emr6193348pzk.4.1673997077854; 
 Tue, 17 Jan 2023 15:11:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 14/22] tcg: Always define tb_target_set_jmp_target
Date: Tue, 17 Jan 2023 13:10:43 -1000
Message-Id: <20230117231051.354444-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Install empty versions for !TCG_TARGET_HAS_direct_jump hosts.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc   | 6 ++++++
 tcg/mips/tcg-target.c.inc  | 6 ++++++
 tcg/riscv/tcg-target.c.inc | 6 ++++++
 tcg/tci/tcg-target.c.inc   | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b8f3b0c634..b21dd561fa 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1964,6 +1964,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index e54df4128b..0b5e100cb1 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1977,6 +1977,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index ee6759f787..e6a3915859 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1310,6 +1310,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f2ac356900..54779d86d9 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -603,6 +603,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
-- 
2.34.1


