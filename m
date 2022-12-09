Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4952C647C0A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:11:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3SmM-00064M-W0; Thu, 08 Dec 2022 21:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sm2-00062S-8a
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:05 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slz-0001yz-Iv
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:01 -0500
Received: by mail-oi1-x22e.google.com with SMTP id v70so3277544oie.3
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xRarcor/wbrlmQ6/1SUQDwNV/2PA1HoUGLA4N0wOFk=;
 b=lxkyvnioQU5/iwuqGHWagUJT9vWBv/eDRUHk4ZU7ycDBbaldSTWSkGOCwyc6aNCOMo
 x4+PfnljtkElewLgp+b8TfSIg5QECIt5VG2XGUH4WqUGbfSH83X/NOW6/MADgdV0P846
 WnKfNReNPlGpquncdlMnjn15TZyWpmnNZ5yuMP+RFBO97gSwV9v+wUHY8cyc5KfNusjE
 sb67f4fFPcF2MKAFW0zKd5gCq2GJoMy8CmxgORNxf6uXPtw6b4D6aGQls0c0EdHrJeBF
 DUt8jH9QbBfiAlwdOiDcCdPVHvwztlEI80ZKHfWElWsk+NO8KIHd1NDjhjJg9AgMTmH3
 J5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xRarcor/wbrlmQ6/1SUQDwNV/2PA1HoUGLA4N0wOFk=;
 b=hZxTLpBnMD2unSmGB4d8rWovzuoxCHEpN5QmRqOK2VfCyit0CT/e2oi1aMwIaAvl4m
 3GQzMraf85VL9i7RvUJclK9/Zqh4tAZjURMEnK0cmYMbtfxQvYGXpXmcZ6DRq4lZvoe4
 lDuRwloSum6EiuTe57Ck9sANwGnSd6hNH7V78/svUZSRCBDWITlMqGjGGY5Du0pliMaq
 /+vD4KDf0x+oI5QQhMvL34PFBMlRex3UCKCOU+fLNO9oLUGyFsafuRw8jEaQ32Hv6+pf
 UBXBT7q/e88zXVoZGS+TYB56sBsFhhP5o33UXTglbz7DqsU5do+g++Yj1ybzT+peS5iA
 gQyQ==
X-Gm-Message-State: ANoB5pm7eZRfZIa8NWUffWSH5pIVU13sEClscdvy/EELfNzGJroJheve
 kfCPdG3dfEduaOk2n7BoQ5bOPj65SnEYGnZqmTI=
X-Google-Smtp-Source: AA0mqf44dO5ln/dDKOm24NeVgMR44iM5n0p8sQrJ13xdDb5vA3S6rQdHogeNm44OZr6LrI0Mm1d/IA==
X-Received: by 2002:a05:6808:1b1e:b0:35e:4589:19cf with SMTP id
 bx30-20020a0568081b1e00b0035e458919cfmr2114298oib.42.1670551558369; 
 Thu, 08 Dec 2022 18:05:58 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 22/27] tcg/s390x: Support SELGR instruction in movcond
Date: Thu,  8 Dec 2022 20:05:25 -0600
Message-Id: <20221209020530.396391-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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

The new select instruction provides two separate register inputs,
whereas the old load-on-condition instruction overlaps one of the
register inputs with the destination.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 30c12052f0..ab1fb45cc2 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -202,6 +202,8 @@ typedef enum S390Opcode {
     RRFa_XRK    = 0xb9f7,
     RRFa_XGRK   = 0xb9e7,
 
+    RRFam_SELGR = 0xb9e3,
+
     RRFc_LOCR   = 0xb9f2,
     RRFc_LOCGR  = 0xb9e2,
 
@@ -626,12 +628,20 @@ static void tcg_out_insn_RRE(TCGContext *s, S390Opcode op,
     tcg_out32(s, (op << 16) | (r1 << 4) | r2);
 }
 
+/* RRF-a without the m4 field */
 static void tcg_out_insn_RRFa(TCGContext *s, S390Opcode op,
                               TCGReg r1, TCGReg r2, TCGReg r3)
 {
     tcg_out32(s, (op << 16) | (r3 << 12) | (r1 << 4) | r2);
 }
 
+/* RRF-a with the m4 field */
+static void tcg_out_insn_RRFam(TCGContext *s, S390Opcode op,
+                               TCGReg r1, TCGReg r2, TCGReg r3, int m4)
+{
+    tcg_out32(s, (op << 16) | (r3 << 12) | (m4 << 8) | (r1 << 4) | r2);
+}
+
 static void tcg_out_insn_RRFc(TCGContext *s, S390Opcode op,
                               TCGReg r1, TCGReg r2, int m3)
 {
@@ -1376,6 +1386,11 @@ static void tgen_movcond_int(TCGContext *s, TCGType type, TCGReg dest,
             src = v4;
         }
     } else {
+        if (HAVE_FACILITY(MISC_INSN_EXT3)) {
+            /* Emit: dest = cc ? v3 : v4. */
+            tcg_out_insn(s, RRFam, SELGR, dest, v3, v4, cc);
+            return;
+        }
         if (dest == v4) {
             src = v3;
         } else {
-- 
2.34.1


