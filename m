Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90536DB877
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:06:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysM-0004B5-Qr; Fri, 07 Apr 2023 23:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys8-00046i-Jo
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:12 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys6-0004XJ-U8
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:12 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1a2b01f5ac0so2480265ad.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FzyqRtK+sy/Z6TtVMGGAfWbqpPjrDQw0gAte8M7H4fw=;
 b=WBbmcMBkf84HRImxrgiMlGphpcTxjmM0y94roAkxI+Nns7qfCz4Bi9a8aFw6mN4SRQ
 4LsDC92CFQgKGtcu3bguK2sXIADMyrSSbcDVhL8wl0VBNhxDghn+3KgpRzR4yakg7zIl
 6BlE8mbh/jvUU6uBi6sjFHR7ciYveEMAUENMsOCayAPZQj1btQIkMCNus1mRzR08zT8w
 6j4U5LoYjl+87E+GU07SnEHZJqep5tIF4tJY0Gs0FBcQ4tQIhv/DtaWFg3cr1aNGo28I
 WEFYth84zFpYI+NSSay0SVihFFa2dM+IdqcSepft93ach8dxbg96G9Box7MsHpk2eI4+
 B/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FzyqRtK+sy/Z6TtVMGGAfWbqpPjrDQw0gAte8M7H4fw=;
 b=f90RZ+MtFx7i/4e3WMWhY0lmhAb7cnsDo+B7QWxp1lufmw3sySihFl77h9Ve/rjL12
 /GTaf5fDb53oqvoagRnJBjGfc1YjT0jcKcYy6xtor1empip7Un37BG2Dtk5ZVdHILhHO
 A4p6D/vwbXPW+IYef7UneGYwzIZV/MS/b6/CgMuOqckwPJwhSx64eQWUBa30CjCWCbKO
 yd3gV3CODCscXd4YDz3ie1MjQ+8RE83Q2zyqHmFCXu5vSL877KCd32bYhlVUuz333SWR
 Us/3XYzrZe+D6YDaZchgEO4d97/cdtJF7hZBUjvcVL+O03ny7zrMeOD46HBRwZHsrUnj
 TG0A==
X-Gm-Message-State: AAQBX9efMQe+I0QTIoXIkB7OrOcUGZLB7sNDvABJOs7TBQ2exhoLj51H
 o8Xv729A8KEQ2v0L2aKTUCcXqcZKntfOGYV+duQ=
X-Google-Smtp-Source: AKy350Yxv/PaKOTJdvLzEDjjNr6GkKLkFmbxgwmoT/xp4oPQXv4YiDq50zHOefzgSejCVMSwsa/02Q==
X-Received: by 2002:a62:1c8f:0:b0:628:1852:8431 with SMTP id
 c137-20020a621c8f000000b0062818528431mr3516875pfc.30.1680923048271; 
 Fri, 07 Apr 2023 20:04:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 09/12] tcg/mips: Try tb-relative addresses in tcg_out_movi
Date: Fri,  7 Apr 2023 20:03:56 -0700
Message-Id: <20230408030359.3368868-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

These addresses are often loaded by the qemu_ld/st slow path,
for loading the retaddr value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index e37aca5986..8c9a4cba9b 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -572,6 +572,8 @@ static void tcg_out_movi_pool(TCGContext *s, TCGReg ret,
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
                              tcg_target_long arg, TCGReg tbreg)
 {
+    tcg_target_long tmp;
+
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
     }
@@ -582,6 +584,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
     assert(TCG_TARGET_REG_BITS == 64);
 
+    /* Load addresses within 2GB of TB with 1 or 3 insns. */
+    tmp = tcg_tbrel_diff(s, (void *)arg);
+    if (tmp == (int16_t)tmp) {
+        tcg_out_opc_imm(s, OPC_DADDIU, ret, tbreg, tmp);
+        return;
+    }
+    if (tcg_out_movi_two(s, ret, tmp)) {
+        tcg_out_opc_reg(s, OPC_DADDU, ret, ret, tbreg);
+        return;
+    }
+
     /* Otherwise, put 64-bit constants into the constant pool. */
     tcg_out_movi_pool(s, ret, arg, tbreg);
 }
-- 
2.34.1


