Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CDD3071DC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:48:52 +0100 (CET)
Received: from localhost ([::1]:58796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52yx-00057P-Ff
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52az-0006F5-1h
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:05 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ax-0005lZ-G6
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:04 -0500
Received: by mail-pf1-x42d.google.com with SMTP id q20so3522892pfu.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=huDZUDnwZEbcEx1xTqJKL+fBHu7QT2Tcumuy/oBbgvo=;
 b=d1HYdIxNR6vTAT1gZs/Yft4/Ky0dleA8cmZoNIh4s+kKATxXntsZ2oE3iSqaLuUpIn
 HB0gtysTwsDEzPwuZ9ZjR9bPCliVv8Kq0LJMuZqHZ2OhfSj5+npRnlsOWuzZ2NrAiehT
 mN76Uv4uwmAXhqslScsJLP3u7qCQnXrBlPQlOkYuJpwyk/IrPRViyBltrmmUmQVJVw/9
 xNEsok6+U+JyFyvSGaNCIMSyB3/D0Z2q9QGG5dhIgYRfMy0xstViIQJW/iUBIl56KCLK
 q0e4EzRQajmzZqSX/JeCQmp1PtXkAA7/bTe0HdaGRKk21iufC9O2J/cnZiaK2IoYl7Qi
 P7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=huDZUDnwZEbcEx1xTqJKL+fBHu7QT2Tcumuy/oBbgvo=;
 b=l28APZwEvJkUs+FdLosRCAmRI+hjoBUB+BnIrbO2VLTnjPqRwZvmSG7Djth+LXMfpT
 U3u7sD7n4xnZUTVZs0kMYRqq82rzKpuX011b9Is3jwi1ISukL6iaMz+W057fGKTq4GrU
 OJyk14OkJzEtTvamcU6ixDkRDJPSZLhnebm8W5DFYhksWXMBdUrKkLxKaHAf/5xMniGT
 ZP0dbjTpaN8sBoj62pvoPvIteY7T2B//k0yT83ClWEXJ1Lgsw0lWDHvrx0eQBf9tyFi7
 2/CyeJUYe/pyPXTbp3v86xCpiK/a7523wcVoDFMSt9765TugYDEzFlfmSQzSu0YZP8yy
 L+vA==
X-Gm-Message-State: AOAM5308zt2fdB7rQKci/xGOTR5krCDrEe4tIipdzKQ/WmryFE6YFbe+
 AJrUzs1Z42v6IgbBPo1jf+ecP0HCuLPEOtcV
X-Google-Smtp-Source: ABdhPJxzcgXRFTBq+9Kr/D/a2X4SEqSN2AO0HXdXOFVXJu+DOf6cfOIN7p6rAcPEiwxFHkNtwfmmpg==
X-Received: by 2002:a62:144c:0:b029:1c0:d62d:e16e with SMTP id
 73-20020a62144c0000b02901c0d62de16emr14506550pfu.25.1611822242226; 
 Thu, 28 Jan 2021 00:24:02 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:24:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/23] tcg/tci: Merge INDEX_op_st16_{i32,i64}
Date: Wed, 27 Jan 2021 22:23:25 -1000
Message-Id: <20210128082331.196801-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0978a5c554..67875636a5 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -613,6 +613,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             *(uint8_t *)(t1 + t2) = t0;
             break;
         case INDEX_op_st16_i32:
+        case INDEX_op_st16_i64:
             t0 = tci_read_r16(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -868,12 +869,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
-        case INDEX_op_st16_i64:
-            t0 = tci_read_r16(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint16_t *)(t1 + t2) = t0;
-            break;
         case INDEX_op_st32_i64:
             t0 = tci_read_r32(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


