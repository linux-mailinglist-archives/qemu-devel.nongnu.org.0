Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A8D311663
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:07:08 +0100 (CET)
Received: from localhost ([::1]:40934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ABv-0005Fw-7x
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2b-0002I8-E7
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:31 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2Y-0003P4-OV
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:29 -0500
Received: by mail-pg1-x531.google.com with SMTP id s23so5553520pgh.11
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iY5vh2fyihhpXHBTL1OAa7t0Sts/YD95jy25p+z4l7A=;
 b=MLgFxdFQERIgujC/yWcnhkJ+u2dWRKGdx/xVVv/vTgyCCoeTcZGl41q9XuEPUCJlGS
 qNCOgPuOPfPhZ6X5+PQqGTiM3crq8rr9EXvNOpjuf9shLmNRjOVFLOFNx3QX31MRVd5y
 TurypG/CLsE2Jzm4QsMMiIIBmB8wD2kWqrcSJU4yiouYC+RgAAfmTQU6Kxo0iduJvjWA
 ShqJuai4h+ooIO4kmLSbck7vwk+OhydB8euSVtTctT0zctgXD6gd/FPGjTaahrWgvDDu
 mzh/jwVNrp2MsHt/whEYdvsbX/SaMMIMe0qrAQhTWiNe571tTbRiiBtJ1PfK2d4+gGRI
 8myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iY5vh2fyihhpXHBTL1OAa7t0Sts/YD95jy25p+z4l7A=;
 b=bzIjamCn8Fm1fF29eHkNtIZP/d7tbFiXMw2b6SKF5eoweFksPvyriChzK6eGmK3/UY
 Dl17q9RmTAObQDRR/XE/vUkaD4NlQ8F1XAKgayTFauSd3WBZ7LGqFQAHj0PZY2SgsYAC
 Uv73YQRpKmjlhP8QiivnTrND2+z/gM9o3HXxtnnEg15wv87WmLSYVn0X5VLhajw81rWy
 NraF/ZvmHrPlyQs/qDqBmBnqkWHNAfa71tCN0TCz2AGfx1tYjUAp1qgWL4TclGan/xdn
 ++yw+gArxyvGHgIjDN44+m1cKQ4sjQ77YkyZ49a/3ps49PIFZrZmx2u7jEfy+VH0kwrq
 uVPA==
X-Gm-Message-State: AOAM531Ws6iGfG1XGdu/gkER7HKl54XFssJ+YL8VRYHoefchJeXpUuGc
 lJD+/XCXT3R6rF9+DdwVtyiwGJ0+3xRkq3Ds
X-Google-Smtp-Source: ABdhPJwqyaEKouv9mlBj1n/WbgBEU7jWbItZuTJDrfngrqV61c4wW/0lQW1MXQapjr0AEJYML4Oq5A==
X-Received: by 2002:a63:2306:: with SMTP id j6mr6593343pgj.187.1612565845525; 
 Fri, 05 Feb 2021 14:57:25 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/46] tcg/tci: Merge INDEX_op_{ld_i32,ld32u_i64}
Date: Fri,  5 Feb 2021 12:56:21 -1000
Message-Id: <20210205225650.1330794-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


