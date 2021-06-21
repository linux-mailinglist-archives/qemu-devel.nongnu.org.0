Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C63C3AF95D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:30:42 +0200 (CEST)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTNJ-0000fj-2W
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC3-0000jo-0G
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:03 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC0-0005xP-D2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:02 -0400
Received: by mail-pg1-x533.google.com with SMTP id e22so9217489pgv.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dt3e/7aSErr4Xmb/H8QqWDMz9H+5k2/wrkERlfjCrBQ=;
 b=L3jQ2CS7iEqzVupuxAONnyhFwwT5PR96YEXSuU6+9ytnrVfntUSBxYp2wt0X9O1HSH
 3IH3sP8l9z/Bw0p3GYmCTweI6O7Qyt7k52IcJYFUVxU9TTYgQFRDh6jk9iK2QGc2Pq/X
 EAJKzTsyy00D3pDJd2CLOxHJNpdjibUi3M//2DIG8zs7Viu8kLJ7szCMiwNhHloYhHUf
 egjV9dhmNRJs+3LGyUlTP4zBL8PXbO93a1f/n3HWhz+r4er875ZRF7dL6TyUkUbam0IU
 Z6jJwDic/aqPQTC7HoWGTdhrNWcLptdsrM9iKFpU8+0CuOmvIYacyBYyMeGG0XlFqx4c
 bEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dt3e/7aSErr4Xmb/H8QqWDMz9H+5k2/wrkERlfjCrBQ=;
 b=pkATvN8V5YSDYl9Bw352Vm+aZg/MaQVSk9+kUlZkjSLqKvHTLW/FAPy2tKY2jkiEDd
 a2Cw/m2b1pSJfSsOCtQTu9b0dwN1Mheopi1s+YJr7PuBcYgToy0p8Q9TvMpmDAlM7OOG
 hS0cDsQtZ8TBoVKrWB9Yb2uiMlzAaPUwFN/o0JDyBpCyOzC0d6DSBwtOv2ZxkjSpsav8
 uJvvKdavA8NTaPn9vUdgD6LdFRiToUgvDtuW9BPsckVChscLgLgHAbWHqDmPI745Jjl8
 TfrBC9yd7L1E3gLtf5K7oEG7J9nvIMtcOXC9+VkpJrAJr05xaNz2kjXXHM6RdXZNwXr2
 KE5g==
X-Gm-Message-State: AOAM532W4RPt9YbEjlBElm9NJGKpd8SH6gP7VLB8EQz84g1F4cAR/ZfE
 5Qmp+zfk69rb3jSa3iCb2IC/2pAo8oRCFw==
X-Google-Smtp-Source: ABdhPJwR221J47uxGwq2aqSXmMEPvUJHtFdgRlU5mGIYALnOCGUMLYFduABf6NMz7sTgLjIZjX/xYw==
X-Received: by 2002:a05:6a00:84d:b029:2fb:3d61:51dd with SMTP id
 q13-20020a056a00084db02902fb3d6151ddmr600187pfk.11.1624317539018; 
 Mon, 21 Jun 2021 16:18:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/29] tcg/ppc: Use power10 byte-reverse instructions
Date: Mon, 21 Jun 2021 16:18:32 -0700
Message-Id: <20210621231849.1871164-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
index 33f0139519..ea1734d6be 100644
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
+            tcg_out_ext32s(s, dst, src);
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


