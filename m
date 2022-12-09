Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD9A647BF0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slu-0005y8-Ur; Thu, 08 Dec 2022 21:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slo-0005x3-Cq
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:51 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slm-0001wJ-Qo
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:48 -0500
Received: by mail-oi1-x22d.google.com with SMTP id k189so3263420oif.7
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81bUyJ3q1hrBplCCzLWitqxn9dUaRZZOJiTy7eZWBno=;
 b=lNuCi2cDRXWwqgayG1kfNaqGV7g8CdyZtJTRCzSvqUZrDdKIOYgmXxBhODc53L0jcU
 IA//zxgDJ58LgilMRjSiO2IsZOhV6nGJCBdoFeueecdad4fC0lHWb/Be5ZIAQEgBJNC5
 zaeUO2yMt68nRad9BSI03ri5OKpza1YWfSpAu1E9YYoDwVTFVT/Sx5s1jJuwfh+UTKgb
 fU3u9vjpwl4svPT/KK8H4LIv+izyihntGIr8fFFXJt3rm8IIgoV1Te3W+EoAHtyj/iqQ
 h8D74eDAB5We+b0Wp8axs/lHUfs4KzutYDYj1Yle22HqhoMv+e51c4R7CnLpQ31s+dYN
 SW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=81bUyJ3q1hrBplCCzLWitqxn9dUaRZZOJiTy7eZWBno=;
 b=cHdE2Wn5MyHzj4e7gFCdQdMBIURw6ZlOGaRB6lx9SZ1aMx/1NfonxlreBBzKkbZdkf
 bww7kuW98kX+AauCb94IqBdhfpFYj6kJmsv/Sljc1XAK4OqgxM6hZ1Mip4ktsEk3PoQT
 smK9FFs0pJM3xkgXblzWVzgqJi3qJv4gMKlkTVKaHFBeHV49PmTZSQ0zihtuRuZBpCiQ
 Vgr+3fPzkUucoFM0MuA0niuDr2JTeyXtFeb0xUmB0XV70CKaNxQhgNhnPErqc2l7YU/j
 WjoYJAUAttbKK+2QuMAc+T9cKUA+O94U+c2+XndV31brI8yL81EovBtM6t39Fe94UTC7
 dcNA==
X-Gm-Message-State: ANoB5plkgKuQHkSH9j7+q43zx0IGf/m6O/hiPLjcDP6uPEUp4VEwZAXl
 5GL1po2seciCmKfm5QqvEF+VijYAuGV8iX5TWDI=
X-Google-Smtp-Source: AA0mqf615tEUYFCK8gOU9uNQavRE+UbXGURSdi7YCzN6WDeiAKrpOKsZhMBIC0Jq9dk8JYMOnuSalw==
X-Received: by 2002:a05:6808:296:b0:35b:bebf:f89c with SMTP id
 z22-20020a056808029600b0035bbebff89cmr1779789oic.15.1670551545673; 
 Thu, 08 Dec 2022 18:05:45 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 11/27] tcg/s390x: Use LARL+AGHI for odd addresses
Date: Thu,  8 Dec 2022 20:05:14 -0600
Message-Id: <20221209020530.396391-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add one instead of dropping odd addresses to the constant pool.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index e4403ffabf..6cf07152a5 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -806,6 +806,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long sval)
 {
     tcg_target_ulong uval;
+    ptrdiff_t pc_off;
 
     /* Try all 32-bit insns that can load it in one go.  */
     if (maybe_out_small_movi(s, type, ret, sval)) {
@@ -832,14 +833,14 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         return;
     }
 
-    /* Try for PC-relative address load.  For odd addresses,
-       attempt to use an offset from the start of the TB.  */
-    if ((sval & 1) == 0) {
-        ptrdiff_t off = tcg_pcrel_diff(s, (void *)sval) >> 1;
-        if (off == (int32_t)off) {
-            tcg_out_insn(s, RIL, LARL, ret, off);
-            return;
+    /* Try for PC-relative address load.  For odd addresses, add one. */
+    pc_off = tcg_pcrel_diff(s, (void *)sval) >> 1;
+    if (pc_off == (int32_t)pc_off) {
+        tcg_out_insn(s, RIL, LARL, ret, pc_off);
+        if (sval & 1) {
+            tcg_out_insn(s, RI, AGHI, ret, 1);
         }
+        return;
     }
 
     /* Otherwise, stuff it in the constant pool.  */
-- 
2.34.1


