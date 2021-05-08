Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B17376E50
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:00:24 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCGU-0007Hs-RW
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4i-00043j-Sq
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:12 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4f-0003XH-MX
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:12 -0400
Received: by mail-pf1-x430.google.com with SMTP id a5so2094743pfa.11
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+lENBfCn+Nf5//dPYW1SMMYldoBTpdzj3Cr2k1/SLCM=;
 b=aFrWMwUemCIVduTyNC1fWrIzqKCKmWR6pIedTWdViMiZY4K5UoftD3dN8NBqpQV7g0
 6Ktg9IGulL/YCAYoT1/HWYt2qqzcZQX9Xcd1nkFSqY7X8OMXyonbPMBdb+tusJU1hrs/
 CdyfHLKhizSbg22XFI/4vpCiMr3QvCHGle3kwvArT6iB9avDcJ1CG/B//W8nDdeJdVlB
 RXY/ohCWmWBFPDZnRTo+Qe5cIJ1VswC9dZ9NulqnURTlhr7LPSc0pSqWteA//sCYRzx7
 otFP+xX1aPyJpkud/l0WdzP8dF+wE1MltJtelw/VJ08SX3Zbkata5qTbKA7+8PH7iQA3
 Em/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+lENBfCn+Nf5//dPYW1SMMYldoBTpdzj3Cr2k1/SLCM=;
 b=ivC4Bognp1avBims85YuNlWZ/dJTXhyNdb9p8vykPC8imq23/3bHBqKReLAnKsfky9
 r5pB0hZ3/e0ECsqk2ngiNhHkwYQvMNPmvk3BJ0Ar6YKFVoTaEINYR0rV8hya0KGz7STI
 m1ESMjr8mHCy/7s5K3h6vn1hC2BwfEPQaD7H/wc1XZFXcN32IB7vzq2N5doGENNtoFR+
 cX6avOiEDa0d6+R1B0qVkR6n0ENEhh20sxOsGD5o0+gahs8/Now8ogdXssebBLcJkDX0
 9qUTucxdoCANMNHDrtimD/cQIodGFZoGjurZUPHkl1RpAgxn21B3qT/+/xuyBmrhtOP5
 z6Mg==
X-Gm-Message-State: AOAM530+er+m8j4QvKK0h+NOvofVgXHFjj7zEVMuLB4BT/bpa/de1ICq
 T8Jxuyg19l+sPUUUhowT1Q6pqHLGA9QZrw==
X-Google-Smtp-Source: ABdhPJyp4DkGxQYGKDDWWD2kAnM0hi6TWMdaxBwCFulj2d+xYdZDmzfrJyVwCIL9+vRi0CKUAqX6Fg==
X-Received: by 2002:aa7:8a84:0:b029:231:ff56:2c7e with SMTP id
 a4-20020aa78a840000b0290231ff562c7emr13641999pfc.50.1620438488480; 
 Fri, 07 May 2021 18:48:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/72] softfloat: Inline float_raise
Date: Fri,  7 May 2021 18:46:57 -0700
Message-Id: <20210508014802.892561-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat.h        |  5 ++++-
 fpu/softfloat-specialize.c.inc | 12 ------------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 78ad5ca738..019c2ec66d 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -100,7 +100,10 @@ typedef enum {
 | Routine to raise any or all of the software IEC/IEEE floating-point
 | exception flags.
 *----------------------------------------------------------------------------*/
-void float_raise(uint8_t flags, float_status *status);
+static inline void float_raise(uint8_t flags, float_status *status)
+{
+    status->float_exception_flags |= flags;
+}
 
 /*----------------------------------------------------------------------------
 | If `a' is denormal and we are in flush-to-zero mode then set the
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 9ea318f3e2..487b29155c 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -228,18 +228,6 @@ floatx80 floatx80_default_nan(float_status *status)
 const floatx80 floatx80_infinity
     = make_floatx80_init(floatx80_infinity_high, floatx80_infinity_low);
 
-/*----------------------------------------------------------------------------
-| Raises the exceptions specified by `flags'.  Floating-point traps can be
-| defined here if desired.  It is currently not possible for such a trap
-| to substitute a result value.  If traps are not implemented, this routine
-| should be simply `float_exception_flags |= flags;'.
-*----------------------------------------------------------------------------*/
-
-void float_raise(uint8_t flags, float_status *status)
-{
-    status->float_exception_flags |= flags;
-}
-
 /*----------------------------------------------------------------------------
 | Internal canonical NaN format.
 *----------------------------------------------------------------------------*/
-- 
2.25.1


