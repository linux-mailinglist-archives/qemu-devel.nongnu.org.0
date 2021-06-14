Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617CD3A5E95
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:50:03 +0200 (CEST)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiIE-0007Ya-DE
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6u-0002HI-3u
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6j-0003Z8-O8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:19 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so9605178pjs.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zQzRjvOakCYe5ymfrsL9K6I+o9h5yKvhTAHMO1Me0hs=;
 b=AcyJl20AfC6nMQHjLHLKXQKkpEH2Ww0L2W82ZL6QjHSn5z01PHtC/LCXQRwkhJ8S13
 CBqE1atndraO9Z9zInGA7jZeiMb8Xze19bwc8O7OntzCYgEu/Vi+0MfTFtwObtXNDXrP
 RizSbO3Du/lzkaNEwMGpKLcGNPEDiaftUhv+BJw0+9J2SitnSeh0DZATjvYwYiyk7Gq6
 DjdBWQDm5NCxEZ/kQl0g5e7i2DjbEtn0VNFKbuuEK1GEcUuFDaKbryQQA8Jem1WM9y7F
 CiJDJX9kHf2N5MEHllgJHEilvcB/rpM79EYeLK0NPMonmQ5ZeuiPWxW4eIxGrwUFy8QZ
 Bn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zQzRjvOakCYe5ymfrsL9K6I+o9h5yKvhTAHMO1Me0hs=;
 b=J7e4boxyav/2KISdklT5Cmb84I9EX5EOOQuPr7F/kT0oyz8T5299RDfUiyRnvp0I9R
 PJ8i4DFWzczStG2TXyB0q1ON4IUop8LcfxnVkOIL50Gs6RxU3qdm567E9Lykai/8//4m
 vPE/PRGlP2cEpTlnQ43fuetUazA9LmyeK3c+fpIOprQPwkOS4wzIw0jAx63P8s0C4iWn
 GrL7n2O8sxvsdsodUjdCTAIZBnDcS7m1HTd1wscUSDszOmVvYDlOalQaY51tm5WkZjMR
 GCDZhW7XsncHBsQh+Y2GWL7635iU9g89WCBnmrUyVoLqzUxQ3VYCWDWxMVbjaKnDJnqZ
 X83g==
X-Gm-Message-State: AOAM533LvQtHokRGy1UOeYfaWQaClZKMDUSaqNuKHQOhQTq9ehiEMqqt
 63GI64KUA5trlmDdMwc3BZKiR0IugZ/iWQ==
X-Google-Smtp-Source: ABdhPJzbC7Vl8Oq7mk0j4ush9Iex5aSf9tpX1uam2VLWmjC+ZR0ALLupW+k2LztgXejPqpSiuQkOcw==
X-Received: by 2002:a17:90b:3882:: with SMTP id
 mu2mr12872586pjb.170.1623659888287; 
 Mon, 14 Jun 2021 01:38:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/28] tcg/ppc: Use power10 byte-reverse instructions
Date: Mon, 14 Jun 2021 01:37:43 -0700
Message-Id: <20210614083800.1166166-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e868417168..af87643f54 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -413,6 +413,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define SRAD   XO31(794)
 #define SRADI  XO31(413<<1)
 
+#define BRH    XO31(219)
+#define BRW    XO31(155)
+#define BRD    XO31(187)
+
 #define TW     XO31( 4)
 #define TRAP   (TW | TO(31))
 
@@ -748,6 +752,11 @@ static inline void tcg_out_ext16s(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out32(s, EXTSH | RA(dst) | RS(src));
 }
 
+static inline void tcg_out_ext16u(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, ANDI | SAI(src, dst, 0xffff));
+}
+
 static inline void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
 {
     tcg_out32(s, EXTSW | RA(dst) | RS(src));
@@ -792,6 +801,16 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
+    if (have_isa_3_10) {
+        tcg_out32(s, BRH | RA(dst) | RS(src));
+        if (flags & TCG_BSWAP_OS) {
+            tcg_out_ext16s(s, dst, dst);
+        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_ext16u(s, dst, dst);
+        }
+        return;
+    }
+
                                                    /* src = xxxx abcd */
     tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);  /* tmp = 0000 000c */
     tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);   /* tmp = 0000 00dc */
@@ -807,6 +826,16 @@ static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
+    if (have_isa_3_10) {
+        tcg_out32(s, BRW | RA(dst) | RS(src));
+        if (flags & TCG_BSWAP_OS) {
+            tcg_out_ext32s(s, dst, src);
+        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_ext32u(s, dst, dst);
+        }
+        return;
+    }
+
     /* Stolen from gcc's builtin_bswap32.             src = xxxx abcd */
     tcg_out_rlw(s, RLWINM, tmp, src, 8, 0, 31);    /* tmp = 0000 bcda */
     tcg_out_rlw(s, RLWIMI, tmp, src, 24, 0, 7);    /* tmp = 0000 dcda */
@@ -824,6 +853,11 @@ static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
     TCGReg t0 = dst == src ? TCG_REG_R0 : dst;
     TCGReg t1 = dst == src ? dst : TCG_REG_R0;
 
+    if (have_isa_3_10) {
+        tcg_out32(s, BRD | RA(dst) | RS(src));
+        return;
+    }
+
                                                    /* src = abcd efgh */
     tcg_out_rlw(s, RLWINM, t0, src, 8, 0, 31);     /* t0  = 0000 fghe */
     tcg_out_rlw(s, RLWIMI, t0, src, 24, 0, 7);     /* t0  = 0000 hghe */
-- 
2.25.1


