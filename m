Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB530E9D9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:03:25 +0100 (CET)
Received: from localhost ([::1]:49330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7TzQ-00086y-QL
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiO-0004li-H1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:49 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiM-0003ly-TR
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:48 -0500
Received: by mail-pg1-x536.google.com with SMTP id i7so1022761pgc.8
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iY5vh2fyihhpXHBTL1OAa7t0Sts/YD95jy25p+z4l7A=;
 b=PFci3iCVCZfar2NBhb3BCxINMV+x11a2Zg020BkxAI/SenMJ45nxB8NnPha86GpSIX
 qHguMFrblwLTbXFSKZeaIfebi1OEC+v6sIcVnFv6jmDe1XuuajjOo5AawBwMaE31/ZIH
 sV+rUd7zyu+od4glZHb3z49NSx4GYJqqL8kCg1slS/YDRSzNlsZ/4i5jvcB0XaV4Bpzy
 dTI+ZhYvMTqmvvE5favsrzSpB8gu5EkFBML7QnUvwSvbBiFzcW5fbJ8WcCEWojOP2o8h
 2284xgxwotO+X7ZBMhh8Ig3WoH/Bsnci+sYSrBnr+14ffdmYtCdcyjf8c5RxwgJGOTHO
 MiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iY5vh2fyihhpXHBTL1OAa7t0Sts/YD95jy25p+z4l7A=;
 b=jKHIPWwSKWJTUD9m9RvMGzzqQUdW3Iy6dYLDyfbSzo+FdaXPkkhpv7vzEyDMc9R6n0
 NHhAF2dzuqAKJ239wRSzQWAa3P2mK+DT3EAzV652JVt5M3CCG+ZZIdlKt2wrZD/0Hv3Y
 nwje1au1wIY/KtmjrKFGZzyjSdCw5J6MnxG7pwGz/5atYVdeYEchbtU4DT90ZwqFdK57
 wICS2it/d7F2WEs6fw+cV2ilW0onvYi37y6FrIDBRDb2ljEfJR5lckfduyrftHZ4Zmeb
 noGPI6MVG/BA+s9F1x7c2T41LxT/XT28r74C4QI/ji6IomSKLqnIyJuFlLw8fwDL8R8z
 a3uw==
X-Gm-Message-State: AOAM530FOvGq8jMjiIhalkuzYglZTiLtShTGnCYkagqcFhLzaM7vh/PH
 QbtVA97mPwYhYcv7pST44UxXK23a+1hMdFza
X-Google-Smtp-Source: ABdhPJzq5zdSedanEOzMAwg2IsEjbWIV7CvKgpYXsHT7ONjLLwFl0e6xnJIKDN9SOnc3BaPPOU7lxg==
X-Received: by 2002:a62:5e44:0:b029:1a4:daae:e765 with SMTP id
 s65-20020a625e440000b02901a4daaee765mr5872629pfb.8.1612403145522; 
 Wed, 03 Feb 2021 17:45:45 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/93] tcg/tci: Merge INDEX_op_{ld_i32,ld32u_i64}
Date: Wed,  3 Feb 2021 15:43:53 -1000
Message-Id: <20210204014509.882821-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 259a8538bf..55863f76a7 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -606,6 +606,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i32:
+        CASE_64(ld32u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -861,12 +862,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld32u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
-            break;
         case INDEX_op_ld32s_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


