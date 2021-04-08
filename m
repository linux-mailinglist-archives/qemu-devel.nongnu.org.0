Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF683589CF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:33:08 +0200 (CEST)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXad-0008EY-A9
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUXWr-0006Eu-OE
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:29:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUXRv-0004kG-Aa
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:24:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j5so1805421wrn.4
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 09:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K+poOW94BowNCInGKJvJSDOLc8fjcU95Yt+lwLQ1q/w=;
 b=Vc5gDIDOn0XJ2DBDn5Tcu/8bbphqogRvcGfpy/GddIrklOd4NM87BxQu00EdqCfUXs
 xquSrJxV94vnLgtMLK7RFgoDFfUtmBb/s0qn7L7oQdO67GBTGWkwebdhxHiLDcYybU2J
 umszi5lyyeRNsz6kcXZbFyLz+sZATxS0HuckwMv4qF2CRYy6z0W3AL7gP4MskYPy21V1
 PixwYWW4KYlalG+fC7XB1wIbsYXVomp6cTzLCXFXMu/dcEyoF33dgpOB7sOAuPJ46+kE
 D+134yFQcEbX5jeQrM45B8c8RXn08CS2VFBjU5pit6A/bxTrYG+8LiDflKvAcBvIsIuq
 /ftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K+poOW94BowNCInGKJvJSDOLc8fjcU95Yt+lwLQ1q/w=;
 b=HjIuiMQyA0zxUjQ+Em01Q1QPaGLzk+pGu812CtmH9PugCeV35FKgenjOj7/Fuj4+/6
 T9Fdr5EIOcJKbIBbMv/t3A6U0EcgEmZZQXMIHAUw/cj8iabl51VNvBdf2rZv00Zuw07p
 7pls72+p1hlm7q7uI51Gk0LKcekuoJbYU/9MFMTDUQlFTdjqolAnmpHR3Wdc6PAkE+28
 YTJlQhI7gvLxouFdTIQ34VXCGQtZjHKHNN27A5Afq6iwTZQ7N68LoKCRRoGFgRxGAxTW
 sYNI2pfWeB+fFlJTIJWMdKFG8tk/3ZgmfFXvtL60QJRFDIMlNqjl95SiuUAFzV8SP4wr
 Kdsg==
X-Gm-Message-State: AOAM530ZHcKtCguTJ92Du+VwwC4Dl98FtwgwDsAD28ad7yUEi2U2jLPU
 tfUbSjR/KuIdseKZuPwZybaosQ==
X-Google-Smtp-Source: ABdhPJxNQLe/CxvNqRLDIHcbA82L9V5CGBBsr9A4jx4uCsai/UeCGpK3I/aP3JnRZIrOZVSaMXZ3YA==
X-Received: by 2002:a5d:6345:: with SMTP id b5mr12393705wrw.299.1617899045361; 
 Thu, 08 Apr 2021 09:24:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x14sm46403428wrw.13.2021.04.08.09.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 09:24:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Make Thumb store insns UNDEF for Rn==1111
Date: Thu,  8 Apr 2021 17:24:02 +0100
Message-Id: <20210408162402.5822-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The Arm ARM specifies that for Thumb encodings of the various plain
store insns, if the Rn field is 1111 then we must UNDEF.  This is
different from the Arm encodings, where this case is either
UNPREDICTABLE or has well-defined behaviour.  The exclusive stores,
store-release and STRD do not have this UNDEF case for any encoding.

Enforce the UNDEF for this case in the Thumb plain store insns.

Fixes: https://bugs.launchpad.net/qemu/+bug/1922887
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b6..aa4aa9b99a2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6476,6 +6476,14 @@ static bool op_store_rr(DisasContext *s, arg_ldst_rr *a,
     ISSInfo issinfo = make_issinfo(s, a->rt, a->p, a->w) | ISSIsWrite;
     TCGv_i32 addr, tmp;
 
+    /*
+     * In Thumb encodings of stores Rn=1111 is UNDEF; for Arm it
+     * is either UNPREDICTABLE or has defined behaviour
+     */
+    if (s->thumb && a->rn == 15) {
+        return false;
+    }
+
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
@@ -6620,6 +6628,14 @@ static bool op_store_ri(DisasContext *s, arg_ldst_ri *a,
     ISSInfo issinfo = make_issinfo(s, a->rt, a->p, a->w) | ISSIsWrite;
     TCGv_i32 addr, tmp;
 
+    /*
+     * In Thumb encodings of stores Rn=1111 is UNDEF; for Arm it
+     * is either UNPREDICTABLE or has defined behaviour
+     */
+    if (s->thumb && a->rn == 15) {
+        return false;
+    }
+
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-- 
2.20.1


