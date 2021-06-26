Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC2B3B4D28
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:41:25 +0200 (CEST)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx20K-0005k1-Fs
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vp-00026P-KK
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:45 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vl-0000KU-CC
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:45 -0400
Received: by mail-pl1-x634.google.com with SMTP id i4so5853279plt.12
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDYsvndrLTL2LdvLcaKKN2n0k6ceAIipBgOmDD0G3xI=;
 b=SVvARxvsAfx3qO6J9WnCRDNJ1nKrG22ZssgWYOq/Q1jCr7Ylx9fI9krgW6XEJeD5AU
 BS6jlED7mQnUEewKYJLfsowIlvRauNQfQVItOuc9F1MMAYH3LEUce89JI9+MdwYXNM1D
 JvlV4CFc7JU5G52nKUDoKpxmM2dke1K6j8qKjqATAfwfEJY9tetNgRm88UjxeSUX/K+p
 af01F7Ol1OB/AS5ztJOYcy3uYujtCtaZhoBq/GLlQeF3epnKndVfJTQFFUaf3ZjxHQmk
 6433uvaTTxr8qL8QaJHIBaWgQPXIjWMWe6LcqP5GA6kAs1WvPwMH7nXbjaPLYrqf5RQD
 HBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDYsvndrLTL2LdvLcaKKN2n0k6ceAIipBgOmDD0G3xI=;
 b=HaaxYEO8xMydPh5bkfh0F/xbiYFRsAVf4a05zKtdSrjxZnHpEwWVMWxeWRgB3qzBXK
 OmAIhtxj6IotbB/Fb4zlVqSkTghQqvP4yCV4hgtFIE0d2YyUoEMEtoNFXyuFInsTCZeS
 JhGjDsKflkvasPJgTNxmbCKrpPS4Ugxp3/qlRa4FIf3APzK2hNpI5dajAkq5tS8/7sjf
 cUhpFwNExNkub0h0dejn+StLXvBNDUkglmYltK+nnxrXXfSmaYI48T2ZQ8LSRMp2l33l
 eRuCRkpyjRZD3Ic6VWgjH35TvIH7USEsJPBx6GXvWW1Tv6Gbbd9iU4Pg1ogfkfcrXu4S
 U1eg==
X-Gm-Message-State: AOAM532YCvYdBBot0l3g+rB+hwrMINuY+euFrhPtBdr0OTbbMSadG49E
 mCI+HiX7VGLRX7Ja3dudeHDCHcDNpz43bA==
X-Google-Smtp-Source: ABdhPJzVJx8L0WxO/XY/548d03Sxl7SjChxzl52hKVf5xVnuO7lahyiW/Lp0VGuujghDAL8sXkvZ7Q==
X-Received: by 2002:a17:902:14b:b029:119:ef6b:8039 with SMTP id
 69-20020a170902014bb0290119ef6b8039mr12603096plb.84.1624689399972; 
 Fri, 25 Jun 2021 23:36:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/29] tcg/ppc: Use power10 byte-reverse instructions
Date: Fri, 25 Jun 2021 23:36:14 -0700
Message-Id: <20210626063631.2411938-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 33f0139519..e0f4665213 100644
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
@@ -793,6 +802,16 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
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
     /*
      * In the following,
      *   dep(a, b, m) -> (a & ~m) | (b & m)
@@ -815,6 +834,16 @@ static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
+    if (have_isa_3_10) {
+        tcg_out32(s, BRW | RA(dst) | RS(src));
+        if (flags & TCG_BSWAP_OS) {
+            tcg_out_ext32s(s, dst, dst);
+        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_ext32u(s, dst, dst);
+        }
+        return;
+    }
+
     /*
      * Stolen from gcc's builtin_bswap32.
      * In the following,
@@ -841,6 +870,11 @@ static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
     TCGReg t0 = dst == src ? TCG_REG_R0 : dst;
     TCGReg t1 = dst == src ? dst : TCG_REG_R0;
 
+    if (have_isa_3_10) {
+        tcg_out32(s, BRD | RA(dst) | RS(src));
+        return;
+    }
+
     /*
      * In the following,
      *   dep(a, b, m) -> (a & ~m) | (b & m)
-- 
2.25.1


