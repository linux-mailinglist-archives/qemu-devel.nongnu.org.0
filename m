Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A422E327569
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:55:40 +0100 (CET)
Received: from localhost ([::1]:57072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVuV-000076-Jh
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVUd-00042H-3p
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:28:55 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVUb-0001R2-0x
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:28:54 -0500
Received: by mail-pl1-x636.google.com with SMTP id u11so8749231plg.13
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuWrYyiZWdulIwmEpBK4yxV1iSuukhkkcBuC0p9tN6M=;
 b=B0v1cPXteMsT+3w3zGYlGw29tHorlcQHWbiCXqZkkordvWOG40hDDeaRxMDs7xJaSd
 xodD+jF6OQnkfxd0Q8yFl9i94kCUVK6zX4guMCRJxUXkP3wavmhYONWryFrtca9hoVKJ
 1cItzgQDQpxxJKdZxDU925tIWNcsML3Xwyx6Nr7k9+arPhq7hGkbVW8VCZMV8qYkymIG
 G4P3GQNxSL9kOqg04BlbYseUkImQuv50x14GA8jx0OOxfMFvJ4mXDBsNKpK29RGwp2YJ
 N05QUW+V8l9PYxA1K/d3EDlHXfKNRn3F4i3bJSzF2IX1ai0zjcyyYLICJoiHPIxlPzul
 MWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuWrYyiZWdulIwmEpBK4yxV1iSuukhkkcBuC0p9tN6M=;
 b=HXm0+mgzsaSO4K4XC4KsFXbHWCxvT7cGhc/qQ/tkd0kMHBk+FWf80Rf55sY4SZZ7nw
 lXJdyPxF/AyhGv+KdqXNg8gI43BaXwzL5iWyFGIuLNRo+ByaAy9gvEVk5j5H2vbqvR2Z
 29TNveCEe9SxjllmIG0ixMTPPs1rgn/vgxYXocbh4G1PoVV3+qfCv0SyyBXdOeazI1Em
 wg7WePkyJYHOes1qLM/F6VUK0OP2fODDueAbJi8qc2X8FEunT5fqKOANEzw7KsmwydqV
 m30dZewj2DE0WLFp5v3ARQuz/O1R+dRdSmwtntyJiut9pCeM+4R30n49CW5/8EV0WWPr
 IL9A==
X-Gm-Message-State: AOAM532dAUu8upmKbyUF8SDyp6By247YUV6vsOPbEFdcntEq36qhgRSN
 E2u7/nt9ESTCJ7USZjac3CoLqTt9BQR2cA==
X-Google-Smtp-Source: ABdhPJysmjtA7ZXc0kWAgWmd+ffc2IIJuoWBlt6a684O7tgU9YvRIhakEd9kzXv3cT4WP++fNDn75Q==
X-Received: by 2002:a17:902:9a49:b029:df:fab8:384 with SMTP id
 x9-20020a1709029a49b02900dffab80384mr13072776plv.37.1614554928816; 
 Sun, 28 Feb 2021 15:28:48 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q91sm6050767pjk.37.2021.02.28.15.28.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:28:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/aarch64: Fix constant subtraction in tcg_out_addsub2
Date: Sun, 28 Feb 2021 15:28:47 -0800
Message-Id: <20210228232847.322468-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

An hppa guest executing

0x000000000000e05c:  ldil L%10000,r4
0x000000000000e060:  ldo 0(r4),r4
0x000000000000e064:  sub r3,r4,sp

produces

 ---- 000000000000e064 000000000000e068
 sub2_i32 tmp0,tmp4,r3,$0x1,$0x10000,$0x0

after folding and constant propagation.  Then we hit

tcg-target.c.inc:640: tcg_out_insn_3401: Assertion `aimm <= 0xfff' failed.

because aimm is in fact -16, but unsigned.

The ((bl < 0) ^ sub) condition which negates bl is incorrect and will
always lead to this abort.  If the constant is positive, sub will make
it negative; if the constant is negative, sub will keep it negative.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1376cdc404..ec0a86d9d8 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1410,10 +1410,10 @@ static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
     }
 }
 
-static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
-                                   TCGReg rh, TCGReg al, TCGReg ah,
-                                   tcg_target_long bl, tcg_target_long bh,
-                                   bool const_bl, bool const_bh, bool sub)
+static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
+                            TCGReg rh, TCGReg al, TCGReg ah,
+                            tcg_target_long bl, tcg_target_long bh,
+                            bool const_bl, bool const_bh, bool sub)
 {
     TCGReg orig_rl = rl;
     AArch64Insn insn;
@@ -1423,11 +1423,13 @@ static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
     }
 
     if (const_bl) {
-        insn = I3401_ADDSI;
-        if ((bl < 0) ^ sub) {
-            insn = I3401_SUBSI;
+        if (bl < 0) {
             bl = -bl;
+            insn = sub ? I3401_ADDSI : I3401_SUBSI;
+        } else {
+            insn = sub ? I3401_SUBSI : I3401_ADDSI;
         }
+
         if (unlikely(al == TCG_REG_XZR)) {
             /* ??? We want to allow al to be zero for the benefit of
                negation via subtraction.  However, that leaves open the
-- 
2.25.1


