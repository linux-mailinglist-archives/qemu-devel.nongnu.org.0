Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F133762C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:52:13 +0100 (CET)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMfc-00087c-AU
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTy-00034n-GL
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:10 -0500
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:46713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTw-0006DK-UV
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:10 -0500
Received: by mail-qv1-xf33.google.com with SMTP id j17so2636641qvo.13
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BT+fbUWdo2Z5pG47CxveBKKbFIzxyg6+zMffoyRH9Us=;
 b=HcGHR5VoD/UgzvdOsZQn4apNdeY2RiSDLFDOxZmkvM2RilvTEF6yXBKYkC+ohFXAVz
 2J2kn4hNd+pdjFy7Lld/33V4tOZpqdJNX5hTEWkhEJOr9+EtWIacnfTMs44hhR8+t+zC
 EeWRXRhZtq55gcnd6zjpkApQ348ulol0zZGrl7Zjl/3ognruZV1QJqO1IzzH9dlbQggl
 L94JwJf3IJ/TdhlJljvuLV6W5fnNpllnPYbXx56BS/66Ygk7yGEym7lhh+i90KQcE7kK
 Et1c3WDzvOKMzBuPy7lEi3mCbsDD7Nmr5CDU/tBkr+pvdSKeGILhq7QSmMrL2WlUUOIY
 zawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BT+fbUWdo2Z5pG47CxveBKKbFIzxyg6+zMffoyRH9Us=;
 b=GSt2UCENY/97I0VK798wBQc0sRZenzKDStPN2eF+rJVSphVBo5730XllidtGy99eR7
 OhM45v0keqLQumIoLdsnUNwrBn06Js4boOvnxCKL0TFtas7xsLHLtRwRufglhIUfhE6i
 3SSCY5NN5+1SKRLgOaniQJzSRBp7ZDggendUN+QAZmJIp+z2T2FflsDf+z0tfIZYAaGm
 Qn+pTihyjPkV7oD+zryzwyn6eHsZEqGPFNLAWHenvc4qzXs94HXBHxFoYeeqM16oHXzU
 DvVcRT+ub+J1kPoGQkEUe9yKtqclgFOg5UgF4rOvHRoOA9X+Ak3iF9AMONAXo+wCRdcj
 3Wlg==
X-Gm-Message-State: AOAM531rkjo+69UwPlCokaMSaNibOtZpMEZ9Zx3T+BWd7nl1ZVpcZ7qK
 4Jj0CpAk7fF6YSCAIX+CEZUsrTIixIMbfVND
X-Google-Smtp-Source: ABdhPJxUR9kpt8W9AkrP/PN4uQLYn8djzm6Yl3LE6/bNu9kP7fwJRiGTnjZ7T4gjFirrG5hFRykFxg==
X-Received: by 2002:a0c:8304:: with SMTP id j4mr7971134qva.18.1615473607935;
 Thu, 11 Mar 2021 06:40:07 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/57] tcg/tci: Split out tci_args_rrrc
Date: Thu, 11 Mar 2021 08:39:07 -0600
Message-Id: <20210311143958.562625-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1c879a2536..bdd2127ec8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -207,6 +207,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     *i2 = tci_read_s32(tb_ptr);
 }
 
+static void tci_args_rrrc(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *c3 = tci_read_b(tb_ptr);
+}
+
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
     bool result = false;
@@ -413,11 +422,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tb_ptr = (uint8_t *)label;
             continue;
         case INDEX_op_setcond_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare32(regs[r1], regs[r2], condition);
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
@@ -429,11 +435,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare64(regs[r1], regs[r2], condition);
             break;
 #endif
         CASE_32_64(mov)
-- 
2.25.1


