Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A73F0CCF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:33:24 +0200 (CEST)
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSFS-0000T0-8w
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2V-0008MK-CF
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2T-0006Mv-RG
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:55 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so9699313pjb.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lfVt0eT0nNOIPktjRSBpSBNPqCJhivS9a0zJZSVFgMw=;
 b=Y5xGaA4u+HiyvL1PijjTBEdlG0pTzle5/n4SM0DT04SHj36F5dbfSbVt3z4XwMAYZV
 E3xAEwmUEKo5lY9Xk5l3hPjW3DJs+mV2OmWCzMx6LW6eAfSHjEvs0/IoJDXWsEJjCxRO
 K3/UtRJyp9JmSf9EWsjANqifUcLwKiAPWB0Wvb5mcUI59dYOCOq/VgMGxZ3U9XT0CwpV
 tCPV10H8e8S6jEHXnlMBSef5KUT2qz543lxOadlNAHHSgl3uyWZhCoHlRzW8KyW5vWnN
 QREfarZLoh+5muZbamy8UBgBIOBcV2pOsfig6zXEn1UcsnANMG5odDFtytS6nr+NxOrc
 8HHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lfVt0eT0nNOIPktjRSBpSBNPqCJhivS9a0zJZSVFgMw=;
 b=URLLEg51JHKEch7tQgamb2vvLpLbuQm54QNUkwI8yWUQxRd6hU6VRFcqqOkDJjYrP4
 VpMP3revybYNtxM4E3/DHY07CPGdCn0lswVt04SVi4U/Ei2PC6d3dtzbnK4xmSA4KK+V
 F3ONMg9k6M1pYV2N1gkc3gLLANgXwUMp9X0sv3YHkaaKpH53hLtTDxDmOpFzmErFpSFJ
 d/Oz6ZpntYEaCEW0eAynk/Zq5IavTx+9n6Tp7kUUtiUlSihGLwKWpwauhth/AJbW7b46
 M0HmoAA4Ud0I5KTQxiBGEbEWmjMwgGmds/ZeqlTn9ki51PxBfburNtxgPRj05K2K9BlZ
 qmOw==
X-Gm-Message-State: AOAM532daZAMW6dYaxY0ObM38fXsMKCK+bE+m85+KaZwyYNL6gM2sn1o
 epW0ihWa0IIrkeWMHR5UKrkjA0LCw3RSow==
X-Google-Smtp-Source: ABdhPJz395EwXSvZ+gc8julrEw6gELfbsDRlrwBfa3ULcQtd5NqZP0DJwDw/uDfgsK1qzXoi83Xn3A==
X-Received: by 2002:a17:902:d890:b029:12d:f2:e8d6 with SMTP id
 b16-20020a170902d890b029012d00f2e8d6mr8661525plz.42.1629317989902; 
 Wed, 18 Aug 2021 13:19:49 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/16] tcg/mips: Try three insns with shift and add in
 tcg_out_movi
Date: Wed, 18 Aug 2021 10:19:31 -1000
Message-Id: <20210818201931.393394-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These sequences are inexpensive to test.  Maxing out at three insns
results in the same space as a load plus the constant pool entry.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 27a23662c8..92f324de68 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -583,6 +583,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
                              tcg_target_long arg, TCGReg tbreg)
 {
     tcg_target_long tmp;
+    int sh, lo;
 
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
@@ -605,6 +606,49 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         return;
     }
 
+    /*
+     * Load bitmasks with a right-shift.  This is good for things
+     * like 0x0fff_ffff_ffff_fff0: ADDUI r,0xff00 + DSRL r,r,4.
+     * or similarly using LUI.  For this to work, bit 31 must be set.
+     */
+    if (arg > 0 && (int32_t)arg < 0) {
+        sh = clz64(arg);
+        if (tcg_out_movi_one(s, ret, arg << sh)) {
+            tcg_out_dsrl(s, ret, ret, sh);
+            return;
+        }
+    }
+
+    /*
+     * Load slightly larger constants using left-shift.
+     * Limit this sequence to 3 insns to avoid too much expansion.
+     */
+    sh = ctz64(arg);
+    if (sh && tcg_out_movi_two(s, ret, arg >> sh)) {
+        tcg_out_dsll(s, ret, ret, sh);
+        return;
+    }
+
+    /*
+     * Load slightly larger constants using left-shift and add/or.
+     * Prefer addi with a negative immediate when that would produce
+     * a larger shift.  For this to work, bits 15 and 16 must be set.
+     */
+    lo = arg & 0xffff;
+    if (lo) {
+        if ((arg & 0x18000) == 0x18000) {
+            lo = (int16_t)arg;
+        }
+        tmp = arg - lo;
+        sh = ctz64(tmp);
+        tmp >>= sh;
+        if (tcg_out_movi_one(s, ret, tmp)) {
+            tcg_out_dsll(s, ret, ret, sh);
+            tcg_out_opc_imm(s, lo < 0 ? OPC_DADDIU : OPC_ORI, ret, ret, lo);
+            return;
+        }
+    }
+
     /* Otherwise, put 64-bit constants into the constant pool. */
     tcg_out_movi_pool(s, ret, arg, tbreg);
 }
-- 
2.25.1


