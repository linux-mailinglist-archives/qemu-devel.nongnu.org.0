Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ACC2F1CBB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:08 +0100 (CET)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1Dg-0002Cd-2w
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rs-0003Mt-93
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:37 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0re-0000DF-H0
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:34 -0500
Received: by mail-pj1-x102e.google.com with SMTP id m5so10973089pjv.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hx+ccawlJdzu7GbQDl+NdiAx6KUHgVaeD5cM1vlFohs=;
 b=wobriLJzJ6gfevHbCw3GrQRYWeV07F1rVS4DNcjigW5gLPbUrURgrqOhabaaLzcCg2
 hzFmiNSKeV+iD5uPGMBvGMsEvShThPPhjho3X3/KMIvw17mi975bCgzSkMpmYzuVB8j7
 8Z+Mq01NTxajNjx/WsI6fy/wh8Gu6HljqWyjddc03n6vzKP+Tcgk9408DmtDd5G9cTAt
 6y73GKGSD+/j9MmoVoU2xWqucKEolLLJRayn6FwJnc/hi++S362l1JiiwCksow69JfTh
 gS0BomZ0kPXKeJTxrrhYvC+XbdIMSnUQYpJcumtzD5SoO39a0bk5N7WMZ8NjW5dxMqjI
 zp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hx+ccawlJdzu7GbQDl+NdiAx6KUHgVaeD5cM1vlFohs=;
 b=FiQu8fpeJbDUTrt8PvPpd05Pf6V0rhiSjw9ybwdJCGXxJvue6YmUNq+BXB2yU0lyX6
 et9UqErmOFy7WjVmJz132aARSvDQ3/0OFohbQeyKu4bgxYuvjOGbqsxoA+YlCXoyHUnI
 cXA0SaJsxt3WKHuC9o6gT/3H8TKWhRRlPc44CpSwMvfAeP5c0RlsA6egAxf3S+hiy5P2
 A0Kez/C9QcQkFLVnnKNHduvmCgwyVttZ/HWfjsf5131CX6PIDAa1YrrsUgVkY3EhYSf9
 JO2II94cL5OSVGxDF9tOblqm7mSI+GaXttmX1N04VDSGjHviM98U/+/NZDGsWz/FBP9v
 Y0dA==
X-Gm-Message-State: AOAM530g+Ct293FXpJDYiCaCJ8+xAbVHLNtLWpp5jdA/V4Sutq4CWZwq
 JRtD+UbD/yl+8ztOS2jd7b1NS3qAyK8HdQ==
X-Google-Smtp-Source: ABdhPJwNMbqFDV/xvBTnxoi9AZqEGCSnjK6uLYhPPFaf0pmvkum5elEKP7fNmPpx++6y2RaV7Ktngw==
X-Received: by 2002:a17:902:694c:b029:da:afba:beab with SMTP id
 k12-20020a170902694cb02900daafbabeabmr339412plt.32.1610385617728; 
 Mon, 11 Jan 2021 09:20:17 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/23] tcg/tci: Add special tci_movi_{i32,i64} opcodes
Date: Mon, 11 Jan 2021 07:19:40 -1000
Message-Id: <20210111171946.219469-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The normal movi opcodes are going away.  We need something
for TCI to use internally.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h    | 8 ++++++++
 tcg/tci.c                | 4 ++--
 tcg/tci/tcg-target.c.inc | 4 ++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 70a76646c4..43711634f6 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -278,6 +278,14 @@ DEF(last_generic, 0, 0, 0, TCG_OPF_NOT_PRESENT)
 #include "tcg-target.opc.h"
 #endif
 
+#ifdef TCG_TARGET_INTERPRETER
+/* These opcodes are only for use between the tci generator and interpreter. */
+DEF(tci_movi_i32, 1, 0, 1, TCG_OPF_NOT_PRESENT)
+#if TCG_TARGET_REG_BITS == 64
+DEF(tci_movi_i64, 1, 0, 1, TCG_OPF_64BIT | TCG_OPF_NOT_PRESENT)
+#endif
+#endif
+
 #undef TLADDR_ARGS
 #undef DATA64_ARGS
 #undef IMPL
diff --git a/tcg/tci.c b/tcg/tci.c
index 2bcc4409be..2311aa7d3a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -593,7 +593,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg32(regs, t0, t1);
             break;
-        case INDEX_op_movi_i32:
+        case INDEX_op_tci_movi_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_i32(&tb_ptr);
             tci_write_reg32(regs, t0, t1);
@@ -864,7 +864,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg64(regs, t0, t1);
             break;
-        case INDEX_op_movi_i64:
+        case INDEX_op_tci_movi_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_i64(&tb_ptr);
             tci_write_reg64(regs, t0, t1);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d5a4d9d37c..e9e5f94c04 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -529,13 +529,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     uint8_t *old_code_ptr = s->code_ptr;
     uint32_t arg32 = arg;
     if (type == TCG_TYPE_I32 || arg == arg32) {
-        tcg_out_op_t(s, INDEX_op_movi_i32);
+        tcg_out_op_t(s, INDEX_op_tci_movi_i32);
         tcg_out_r(s, t0);
         tcg_out32(s, arg32);
     } else {
         tcg_debug_assert(type == TCG_TYPE_I64);
 #if TCG_TARGET_REG_BITS == 64
-        tcg_out_op_t(s, INDEX_op_movi_i64);
+        tcg_out_op_t(s, INDEX_op_tci_movi_i64);
         tcg_out_r(s, t0);
         tcg_out64(s, arg);
 #else
-- 
2.25.1


