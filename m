Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7718C31E0A9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:44:16 +0100 (CET)
Received: from localhost ([::1]:42142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTgF-00040R-Hs
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLG-0007rB-Rr
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:34 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLF-0007GG-B7
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:34 -0500
Received: by mail-pj1-x1029.google.com with SMTP id c19so2143701pjq.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OneSdNbhFRwD/gEDSE1iypW9deQBMDbQopH2CXvtbwE=;
 b=w1z/tEvSl4UvzRpU4Yns377zAFekAd0cAm0jjD6Urf4KkeeSuW8LVC4YdVx/TSGAja
 k8XZinSlvCZuMTCbiQTfgN5sfJekMD28pcED438TprklN5nWdU+rvtac3BPCuIemGFbX
 wJk8Uf60iUPNelfNbAdPPH0ZaPqwKpj0m42xzAcMCGlrs126mql1oafz00M1Vg9T+3AK
 pYT4qJm99DLlli89PRt3tY3tKro1UbkJ6h7sjV3KaiP5Hk7Oz9672Z0wBkbl0R7dSwBk
 xzR49XTGAXe2bx8tWGvFQxbOnc44IVbWqU+5SKNcQuvAOkthnPhVYU2EG8f+d/8VHyDA
 DJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OneSdNbhFRwD/gEDSE1iypW9deQBMDbQopH2CXvtbwE=;
 b=XpYN2mZvfwHZQdJ34lD3DFbgzz/GC4rxCoBXCwc5/mMynoR8iZMPLWGz8/bzZPiJfD
 GbSPmgPI7J97QhAABubEV+oqVsvRmXtAyBiNK1FkPP0HFYvysCMTSrs/FJv6UD98j2xM
 xutC48dBakprL5pIb45EQ/GqCRJNelqDbBnONGpfKwN4SQgioPDTLRTxgWMgy6UybsKh
 6EI1r+yp46ZArqiCfWLxdpsS7InuZul8fXR/KUNIv5acUQGafUpLg2U+2/IytxmncJWq
 HUrYZj2Ui0rN/GMcvAJSDsEk5TpzzYLWf+WYS7nNgxGHQuIuwk3P5rrVgZ4MR3ktodV2
 /g5Q==
X-Gm-Message-State: AOAM531Try4oG6e2iyFUVh5X+eU4LBWCZRSBDUPTxkWwzqSho8yTx70G
 N6T48M+426C98S/02XjVnVuoGYb0ma2SyA==
X-Google-Smtp-Source: ABdhPJzqQntpHhtXR0eotyEAd4esY8IHBwBGHEkXaS9IH9vvoZnFBYnsUYcvO1AP4V1IQzIJIMYECw==
X-Received: by 2002:a17:902:52a:b029:da:989f:6c01 with SMTP id
 39-20020a170902052ab02900da989f6c01mr721322plf.45.1613593352065; 
 Wed, 17 Feb 2021 12:22:32 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/71] tcg/tci: Merge bswap operations
Date: Wed, 17 Feb 2021 12:19:40 -0800
Message-Id: <20210217202036.1724901-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

This includes bswap16 and bswap32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index a5ee37eb4e..288a70287e 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -635,15 +635,15 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_bswap16_i32
-        case INDEX_op_bswap16_i32:
+#if TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
+        CASE_32_64(bswap16)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
-#if TCG_TARGET_HAS_bswap32_i32
-        case INDEX_op_bswap32_i32:
+#if TCG_TARGET_HAS_bswap32_i32 || TCG_TARGET_HAS_bswap32_i64
+        CASE_32_64(bswap32)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap32(t1));
@@ -791,20 +791,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1);
             break;
-#if TCG_TARGET_HAS_bswap16_i64
-        case INDEX_op_bswap16_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap16(t1));
-            break;
-#endif
-#if TCG_TARGET_HAS_bswap32_i64
-        case INDEX_op_bswap32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap32(t1));
-            break;
-#endif
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


