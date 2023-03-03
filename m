Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B266A8F9D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:02:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvco-0007VU-FF; Thu, 02 Mar 2023 21:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcb-0007Pd-KC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:13 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcZ-0001o8-Vq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:13 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i10so1322252plr.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEtCGKXwc5R5woyG/cv3/9an/+vnS/RcluuE2Zr/HR4=;
 b=ma6jETDKNQbGFVQe7d9Ly+86QJKjlO8SZVCIATBQ96evOAQsbbseHBXbj+L4gD0Zey
 secRSGC7JhPGlHaW4TtbBiz3UZJZirGYRdwYY+p65AHQ1a+BYG3ry3CsG0FHNEOpErp6
 BMsjoToi24PE1CLzTrxaS5+rlTt/aKgqOExwcE06/n0IZAmva8+4Zoc5MFkAEWACPnGy
 WmBXuGxBwAijCOzBK6hTNEQHQQ1Jtp0d3/MIAYGjz5cDkA5YKXScvRBhySVnwPFz6/yE
 Qz1AxzEfRhH5kWXDM6xM7VM5rtZfzQT4PxVrNnYOwS6Q5ESD9f+TwqskBkBgPe4q1mRR
 qM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEtCGKXwc5R5woyG/cv3/9an/+vnS/RcluuE2Zr/HR4=;
 b=FfV5V+woj1SyIjZlH0wX1srJs1W+gF/Mn8tY6/SMXB4u5qjQ4X4ZKkMS9GF63biDz+
 Fy6qtzY20nXLxGKDa2GjSix6JWSp5JUP+6Bun3UX2GZZoOc4hNl6y/4MGg4TgJR1Ozfm
 +wxKyxZO/3aLxki19cut4M/0Wrg8KJJK5Xtff0G/CxGPHh7SPekCw5GepcoHX0T2qWxL
 VuV4q4A4Aa21RVy75bHg9tT8K7rPiLNbP8iVTMFHpWhF+cGt5b47fE3vRSPmxGemuXsZ
 4huaA/JVE6iG9N9L63dBNMF6r1WMnFvm5qiQ0byxVRwHqEzIStpsIuiwqWQafXQNlXRD
 yVAQ==
X-Gm-Message-State: AO0yUKWtlVrf2gzaI0FbOoPj1cUXIuE8g0if0maV13abIGoUssehbQHk
 vDGV0YY1CHCzxZCeBRtinc24TjqVaMhTVEgPuxw=
X-Google-Smtp-Source: AK7set8Bei/bq/MsqIq7qbHiieTU65RK+BvubYCyuQ6xhW2GANWJTXAwIMhQWkr8Qwjotialmw3PoA==
X-Received: by 2002:a17:903:11c3:b0:19e:6657:2c21 with SMTP id
 q3-20020a17090311c300b0019e66572c21mr516711plh.7.1677812290351; 
 Thu, 02 Mar 2023 18:58:10 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4.5 03/29] gdbstub: Make syscall_complete/[gs]et_reg
 target-agnostic typedefs
Date: Thu,  2 Mar 2023 18:57:39 -0800
Message-Id: <20230303025805.625589-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
---
 include/exec/gdbstub.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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
2.34.1


