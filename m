Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C83D569329
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:17:11 +0200 (CEST)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BSQ-0004Ad-2w
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLi-0000Ta-8K; Wed, 06 Jul 2022 16:10:14 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLf-0003Tt-Dn; Wed, 06 Jul 2022 16:10:13 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id a184so7127966vsa.1;
 Wed, 06 Jul 2022 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L4xOcG1S0Ttl7aaqk53SEZieV9XBEJt9bqRXNEK9otE=;
 b=Q//zsuHNxuI8vXyUkr8zh4/wyYdRz/MrbEYV3qSBsSveT00dRc45fXksWtk+4/d7lY
 AUXhSF11z/A6v4cE16TTwHk4F+vmdt78qT8ShTyGcsDl6arq3BGHQ/pD0EKfkUGO3gp3
 QLzm7wji0KnRfI7cYrwX+IxCoIms/Ne7BzHzdIb30zTNBfod2/J+0aYwG1uTJJ75uyoX
 bP9fY4HulRDwCxULeu+biA2dyL41nfl44BotOVyb26iruRAQedKyoPkiIm984q0TKlFn
 yQOPUUsASooCONfMwYRfaJKpDV12RYVAXMZgmMOqz9DEQfAKPTP21qaEpSF+Iv4mzBHi
 1NKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4xOcG1S0Ttl7aaqk53SEZieV9XBEJt9bqRXNEK9otE=;
 b=COqZjWyys43LBWbO3VBsWt9Y4V2GZPnsjUKzW8JBIRP1f9ftCOmOXLFoHpH5pS1EGs
 RGvj4FXff+MKICYAlXL6jAu1IEUiXyX0UWvRH4Vt3J2Ik1xlwu//SWGGmJEjc9AG05Me
 blJSnE0eycDyPpgr/t+524McVSpPLsbS3/wJ8+9ZAO6otl6bswlDQZ/F4GPj2LPF8tZR
 NnCYsnNmoNnQqmAVc2BPf9S0G/IjLeP4Nv+Y0z+XgZUSX1+uSWU95CgVQgufNjSwoK1G
 oNwlWLDS5cqbNGiCOf5fX2F7hzWDenMiONKA+UAuHd2Hn71RLi+zIlRFOMQpTmOi7Ju5
 TQTg==
X-Gm-Message-State: AJIora+qHcrXsb+XVjtnE0WW3SG++QcZz/IxZEuXsMcamQ1sNZyXZ3Ma
 WTcOOpDxo44eMxOU0vXHGodTVZSP8vU=
X-Google-Smtp-Source: AGRyM1sdwM/2g8bMzg1lmdNbx1MLRhE3M7RH6nGeF+a7Ib4rEXxZIPT5bWExJluGMUdyyYFlfX+WEw==
X-Received: by 2002:a67:e3b0:0:b0:354:3fff:de84 with SMTP id
 j16-20020a67e3b0000000b003543fffde84mr23032391vsm.49.1657138208488; 
 Wed, 06 Jul 2022 13:10:08 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PULL 09/34] target/ppc: Change FPSCR_* to follow POWER ISA numbering
 convention
Date: Wed,  6 Jul 2022 17:09:21 -0300
Message-Id: <20220706200946.471114-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

FPSCR_* bit values in QEMU are in the 'inverted' order from what Power
ISA defines (e.g. FPSCR.FI is bit 46 but is defined as 17 in cpu.h).
Now that PPC_BIT_NR macro was introduced to fix this situation for the
MSR bits, we can use it for the FPSCR bits too.

Also, adjust the comments to make then fit in 80 columns

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220622193203.127698-1-victor.colombo@eldorado.org.br>
[danielhb: fixed 'exceptio' typo in target/ppc/cpu.h]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h | 72 ++++++++++++++++++++++++------------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6d78078f37..e109b5902b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -694,42 +694,42 @@ enum {
 
 /*****************************************************************************/
 /* Floating point status and control register                                */
-#define FPSCR_DRN2   34 /* Decimal Floating-Point rounding control           */
-#define FPSCR_DRN1   33 /* Decimal Floating-Point rounding control           */
-#define FPSCR_DRN0   32 /* Decimal Floating-Point rounding control           */
-#define FPSCR_FX     31 /* Floating-point exception summary                  */
-#define FPSCR_FEX    30 /* Floating-point enabled exception summary          */
-#define FPSCR_VX     29 /* Floating-point invalid operation exception summ.  */
-#define FPSCR_OX     28 /* Floating-point overflow exception                 */
-#define FPSCR_UX     27 /* Floating-point underflow exception                */
-#define FPSCR_ZX     26 /* Floating-point zero divide exception              */
-#define FPSCR_XX     25 /* Floating-point inexact exception                  */
-#define FPSCR_VXSNAN 24 /* Floating-point invalid operation exception (sNan) */
-#define FPSCR_VXISI  23 /* Floating-point invalid operation exception (inf)  */
-#define FPSCR_VXIDI  22 /* Floating-point invalid operation exception (inf)  */
-#define FPSCR_VXZDZ  21 /* Floating-point invalid operation exception (zero) */
-#define FPSCR_VXIMZ  20 /* Floating-point invalid operation exception (inf)  */
-#define FPSCR_VXVC   19 /* Floating-point invalid operation exception (comp) */
-#define FPSCR_FR     18 /* Floating-point fraction rounded                   */
-#define FPSCR_FI     17 /* Floating-point fraction inexact                   */
-#define FPSCR_C      16 /* Floating-point result class descriptor            */
-#define FPSCR_FL     15 /* Floating-point less than or negative              */
-#define FPSCR_FG     14 /* Floating-point greater than or negative           */
-#define FPSCR_FE     13 /* Floating-point equal or zero                      */
-#define FPSCR_FU     12 /* Floating-point unordered or NaN                   */
-#define FPSCR_FPCC   12 /* Floating-point condition code                     */
-#define FPSCR_FPRF   12 /* Floating-point result flags                       */
-#define FPSCR_VXSOFT 10 /* Floating-point invalid operation exception (soft) */
-#define FPSCR_VXSQRT 9  /* Floating-point invalid operation exception (sqrt) */
-#define FPSCR_VXCVI  8  /* Floating-point invalid operation exception (int)  */
-#define FPSCR_VE     7  /* Floating-point invalid operation exception enable */
-#define FPSCR_OE     6  /* Floating-point overflow exception enable          */
-#define FPSCR_UE     5  /* Floating-point underflow exception enable          */
-#define FPSCR_ZE     4  /* Floating-point zero divide exception enable       */
-#define FPSCR_XE     3  /* Floating-point inexact exception enable           */
-#define FPSCR_NI     2  /* Floating-point non-IEEE mode                      */
-#define FPSCR_RN1    1
-#define FPSCR_RN0    0  /* Floating-point rounding control                   */
+#define FPSCR_DRN2   PPC_BIT_NR(29) /* Decimal Floating-Point rounding ctrl. */
+#define FPSCR_DRN1   PPC_BIT_NR(30) /* Decimal Floating-Point rounding ctrl. */
+#define FPSCR_DRN0   PPC_BIT_NR(31) /* Decimal Floating-Point rounding ctrl. */
+#define FPSCR_FX     PPC_BIT_NR(32) /* Floating-point exception summary      */
+#define FPSCR_FEX    PPC_BIT_NR(33) /* Floating-point enabled exception summ.*/
+#define FPSCR_VX     PPC_BIT_NR(34) /* Floating-point invalid op. excp. summ.*/
+#define FPSCR_OX     PPC_BIT_NR(35) /* Floating-point overflow exception     */
+#define FPSCR_UX     PPC_BIT_NR(36) /* Floating-point underflow exception    */
+#define FPSCR_ZX     PPC_BIT_NR(37) /* Floating-point zero divide exception  */
+#define FPSCR_XX     PPC_BIT_NR(38) /* Floating-point inexact exception      */
+#define FPSCR_VXSNAN PPC_BIT_NR(39) /* Floating-point invalid op. excp (sNan)*/
+#define FPSCR_VXISI  PPC_BIT_NR(40) /* Floating-point invalid op. excp (inf) */
+#define FPSCR_VXIDI  PPC_BIT_NR(41) /* Floating-point invalid op. excp (inf) */
+#define FPSCR_VXZDZ  PPC_BIT_NR(42) /* Floating-point invalid op. excp (zero)*/
+#define FPSCR_VXIMZ  PPC_BIT_NR(43) /* Floating-point invalid op. excp (inf) */
+#define FPSCR_VXVC   PPC_BIT_NR(44) /* Floating-point invalid op. excp (comp)*/
+#define FPSCR_FR     PPC_BIT_NR(45) /* Floating-point fraction rounded       */
+#define FPSCR_FI     PPC_BIT_NR(46) /* Floating-point fraction inexact       */
+#define FPSCR_C      PPC_BIT_NR(47) /* Floating-point result class descriptor*/
+#define FPSCR_FL     PPC_BIT_NR(48) /* Floating-point less than or negative  */
+#define FPSCR_FG     PPC_BIT_NR(49) /* Floating-point greater than or neg.   */
+#define FPSCR_FE     PPC_BIT_NR(50) /* Floating-point equal or zero          */
+#define FPSCR_FU     PPC_BIT_NR(51) /* Floating-point unordered or NaN       */
+#define FPSCR_FPCC   PPC_BIT_NR(51) /* Floating-point condition code         */
+#define FPSCR_FPRF   PPC_BIT_NR(51) /* Floating-point result flags           */
+#define FPSCR_VXSOFT PPC_BIT_NR(53) /* Floating-point invalid op. excp (soft)*/
+#define FPSCR_VXSQRT PPC_BIT_NR(54) /* Floating-point invalid op. excp (sqrt)*/
+#define FPSCR_VXCVI  PPC_BIT_NR(55) /* Floating-point invalid op. excp (int) */
+#define FPSCR_VE     PPC_BIT_NR(56) /* Floating-point invalid op. excp enable*/
+#define FPSCR_OE     PPC_BIT_NR(57) /* Floating-point overflow excp. enable  */
+#define FPSCR_UE     PPC_BIT_NR(58) /* Floating-point underflow excp. enable */
+#define FPSCR_ZE     PPC_BIT_NR(59) /* Floating-point zero divide excp enable*/
+#define FPSCR_XE     PPC_BIT_NR(60) /* Floating-point inexact excp. enable   */
+#define FPSCR_NI     PPC_BIT_NR(61) /* Floating-point non-IEEE mode          */
+#define FPSCR_RN1    PPC_BIT_NR(62)
+#define FPSCR_RN0    PPC_BIT_NR(63) /* Floating-point rounding control       */
 /* Invalid operation exception summary */
 #define FPSCR_IX     ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXISI)  | \
                       (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZDZ)  | \
-- 
2.36.1


