Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249A16ED18D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:39:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyHq-0007C7-D9; Mon, 24 Apr 2023 11:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyHl-00078T-Iv
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:39:25 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyHf-0001U8-M8
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:39:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so22843345e9.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350751; x=1684942751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSg0c4M45svDvATHF+7HmzGu/lbW3KNWc01rVX++dHI=;
 b=Qv2NoYTZNL7241Ho/bawh9Ll5+ZjExc3yo6GPKt7ywZV+dnqeIy/d2rjmsRoiEdJzk
 G+TwC4ga5AFdwpS3229a6a+tirOa6SKZKtPrVbxKGQIyTs8cUY4g6lRtaVKDIVMNreM9
 EUUemPbG1mMwl6sC710lToOcb+NOfeG3ImsWDtNJLHEbLgpUf1IblQpw1b0tFmSFjU9h
 Yvhubc5BCY/+jal+Q6H1v3jO0coFOQZFpWtu+y0G2tZWDHCp+++/qzICn74JaEFo+g3d
 gHVb3Y6tjFt22cSFI/r7gkqDwfmbIFTxcJVq/L0Wyal6BjPgTxCVBAVg5PW8GoITgdPc
 lOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350751; x=1684942751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSg0c4M45svDvATHF+7HmzGu/lbW3KNWc01rVX++dHI=;
 b=jkiwXVXlG4lSvjZTA5GldFE1qSR325SUshNKKAHBEtYIPFo58j6jmSQhGuBYdcjlhe
 xqruhHIESkdDZo/iYmEx8f1Ax6q7u/Ro6/TJ5Ff8H0YJgMsDHd/pcx+BzPQ56Gn9UvwT
 pZURmKkNd1OGgxL7v55xuhbj6QzXbgiaZpOhayzell4KC9PfsSWIDoqQI6xcsM3DQOcT
 0ycZvxwghQZtuDA1NVmZm7zt9J45bnbintyALIZ5P3sqG6cyzWX9DvyVbungpzF8bElz
 +IWzaUGN4QS3UbGNvua0IoSk0IZPHMzGorV5Ev3/6lQ3dcusd2r5IgL4tV5cLQCh/i6h
 Dm3Q==
X-Gm-Message-State: AAQBX9ei6WSkBg5bkh2P9RXQGLcCdZnhqIWyVGkHufT2mCshMekm/rkh
 AhnzePNUWKcLwU7hMYXntZPqnL5PD7rnXT75JNQ=
X-Google-Smtp-Source: AKy350ZAgDdw2iyZr0sn+EyU1wMG6AOgqvpzBG2qwMLI18XbVQglrDeFUUsTuZYlvvP2mjYPUPMmVA==
X-Received: by 2002:a05:600c:58d:b0:3f1:7324:c81d with SMTP id
 o13-20020a05600c058d00b003f17324c81dmr7887143wmd.14.1682350751543; 
 Mon, 24 Apr 2023 08:39:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b002efb2d861dasm11041241wrj.77.2023.04.24.08.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:39:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 1/2] target/arm: Define and use new load_cpu_field_low32()
Date: Mon, 24 Apr 2023 16:39:08 +0100
Message-Id: <20230424153909.1419369-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424153909.1419369-1-peter.maydell@linaro.org>
References: <20230424153909.1419369-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In several places in the 32-bit Arm translate.c, we try to use
load_cpu_field() to load from a CPUARMState field into a TCGv_i32
where the field is actually 64-bit. This works on little-endian
hosts, but gives the wrong half of the register on big-endian.

Add a new load_cpu_field_low32() which loads the low 32 bits
of a 64-bit field into a TCGv_i32. The new macro includes a
compile-time check against accidentally using it on a field
of the wrong size. Use it to fix the two places in the code
where we were using load_cpu_field() on a 64-bit field.

This fixes a bug where on big-endian hosts the guest would
crash after executing an ERET instruction, and a more corner
case one where some UNDEFs for attempted accesses to MSR
banked registers from Secure EL1 might go to the wrong EL.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h | 7 +++++++
 target/arm/tcg/translate.c | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 5339c22f1e0..067044292a4 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -61,6 +61,13 @@ static inline TCGv_i32 load_cpu_offset(int offset)
 
 #define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
 
+/* Load from the low half of a 64-bit field to a TCGv_i32 */
+#define load_cpu_field_low32(name)                                       \
+    ({                                                                   \
+        QEMU_BUILD_BUG_ON(sizeof(typeof_field(CPUARMState, name)) != 8); \
+        load_cpu_offset(offsetoflow32(CPUARMState, name));               \
+    })
+
 void store_cpu_offset(TCGv_i32 var, int offset, int size);
 
 #define store_cpu_field(var, name)                              \
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 3c8401e9086..74684767249 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -2816,7 +2816,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
             if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
                 dc_isar_feature(aa64_sel2, s)) {
                 /* Target EL is EL<3 minus SCR_EL3.EEL2> */
-                tcg_el = load_cpu_field(cp15.scr_el3);
+                tcg_el = load_cpu_field_low32(cp15.scr_el3);
                 tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);
                 tcg_gen_addi_i32(tcg_el, tcg_el, 3);
             } else {
@@ -6396,7 +6396,7 @@ static bool trans_ERET(DisasContext *s, arg_ERET *a)
     }
     if (s->current_el == 2) {
         /* ERET from Hyp uses ELR_Hyp, not LR */
-        tmp = load_cpu_field(elr_el[2]);
+        tmp = load_cpu_field_low32(elr_el[2]);
     } else {
         tmp = load_reg(s, 14);
     }
-- 
2.34.1


