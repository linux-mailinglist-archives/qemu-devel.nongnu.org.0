Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7462D9A0C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:34:50 +0100 (CET)
Received: from localhost ([::1]:46464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koow5-0004kB-JL
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSM-00023I-T9
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:07 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSJ-00040Q-NR
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:06 -0500
Received: by mail-oi1-x241.google.com with SMTP id x13so10201779oic.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ASquR/6BxZoSVQzDtOnOXOHE8jLTrkcyVCDT0iJkP14=;
 b=z705s80xqeVHMS/roiSeYfSVBMXOb5PsaWRKja4n3jV+4KdUCzM1N9QYfp9RoNliAM
 Eqrp+iXQcpHaUAeVAeN4DmWlp6IBdbLPiUy2tVe/25XOdstrCMbhTVu6IcHrpKXakSc+
 Wq3YbNtNVNF3+ejrfb76ivL7wn93zVAr8gVRj2jAtKFRiJScKEt0PEtx0g5MyHtpnITY
 3LmpkeUzc6j6IE5Y1J+w0nNnOS5rmzHvOxzdIWtqSBJa8T6HPGQo40dhw6djJRGhd9Kg
 EjuMNXpVfGwwwx2tSriQ1Kq1EWvQ8CSHOpEUYZJGsii5wJ0QZZrUAgzoBO31wlhsBNIe
 cEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ASquR/6BxZoSVQzDtOnOXOHE8jLTrkcyVCDT0iJkP14=;
 b=IyWAXAmNQq5co6EhTFuNYyPuLO2k8IYNYkSv4/yjko0sxfipdfXzETwPr6pWw1nPdM
 F8XnRNRkPskMattlo60P3FJQmD8GX26SGwKhTrBr3pBTP2nqTxiCdwbVDocNcaiHbwV8
 kinfcOQo0OJITyC6JLxgB4AOp9HbZG7b6vxtf9b4vghSfja1LUpDHiRg5tN5X1rqxJ5r
 AWgleLxVuboD2T3OzUmZ+iunK6HFL2tPSzXjmdN4lQaWdwjzO5jmRLO6BS5VwnEeczO9
 T8ydYhg10z0e44M3FZ6OplPaWMLJ7gjh5CmN5y/AhCVn5UnfguLB9aRvO1bkqDMskug6
 A//g==
X-Gm-Message-State: AOAM532CXMRtwhkfhjMY/SlqyFmhcxf6GfIHjv8KMCawJ/vvsLMtCVlr
 KtG7YWY0swz++CmDYWdeCPnYIMLkfFUgaxtQ
X-Google-Smtp-Source: ABdhPJz1Q2EvrbhtXWrTYAc2IOH+t9aqRflMEVvDlqpus66kTPsVO94ZP1QXLQrOeyD7e3fJwsxSUg==
X-Received: by 2002:aca:504e:: with SMTP id e75mr18777947oib.170.1607954642255; 
 Mon, 14 Dec 2020 06:04:02 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/43] tcg/ppc: Use tcg_out_mem_long to reset TCG_REG_TB
Date: Mon, 14 Dec 2020 08:02:59 -0600
Message-Id: <20201214140314.18544-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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

The maximum TB code gen size is UINT16_MAX, which the current
code does not support.  Use our utility function to optimally
add an arbitrary constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index ed7a201578..1f8a446b90 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2392,9 +2392,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         set_jmp_reset_offset(s, args[0]);
         if (USE_REG_TB) {
             /* For the unlinked case, need to reset TCG_REG_TB.  */
-            c = -tcg_current_code_size(s);
-            assert(c == (int16_t)c);
-            tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, c));
+            tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
+                             -tcg_current_code_size(s));
         }
         break;
     case INDEX_op_goto_ptr:
-- 
2.25.1


