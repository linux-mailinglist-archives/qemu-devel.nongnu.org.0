Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B4EC2681
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 22:31:47 +0200 (CEST)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iF2Kg-000573-1N
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 16:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iF2Aw-0004eZ-EC
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iF2Av-0005bA-Ah
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:21:42 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46084)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iF2Av-0005as-5Z
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:21:41 -0400
Received: by mail-pf1-x443.google.com with SMTP id q5so6209746pfg.13
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 13:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oQgyY0q4tGN1HeWPOTFfa3ocMl6lXl7njB6OKQDxYM4=;
 b=jpCoM8ihiHgJwEIxHdvVj4lVK4Y3iRb0lOVcH4KfTe8mqhgnHcEWHnGucJRn+9NbpY
 iJ2+eLXx5Op15ZL4nmtPa36ZGdmABupAxEvejvBbM9GJj1SHdPZDMGRtwwjoHOM5Zd8K
 +MbUMY2MRLmx+U6ng8ErSEhMmvLSQTpxTgMVDpfX6XjGq3xM0tk3WEG0cQZBYRfOchsi
 ztkPEZ0jdwj7DwSIeOrSeaDciz/PCZeJH4nu+B0qK1PkDf4tSGZKjBosXaJga2i6ku/G
 GL53wGzGUfNFfQSyFB7mvAL5UxuWrWj9cKwh6nb8WEf9Ff/tw2VdMQM4vFNE8+CYi9Lx
 Pv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oQgyY0q4tGN1HeWPOTFfa3ocMl6lXl7njB6OKQDxYM4=;
 b=dGqP9QzXs9FEuVCHwI03+XAWyeZPtpL3SLW22k6nnx9qlbYUph1WtcWWwPADBL2cZW
 fBa45nRVQ+H8Qs8//FWDMPRU8xk9B89SNNrsMF7EH5+UYOU5MY5Ud3BIhudHn6xr8OUc
 MyVE+6iWazxOBjvFkd/idmcrC77N6S0rVuxZ6yNsX8XVHbjppcsCG/1e8kng+z7wPlAX
 YVj8OvFkgwnZqWx+eiceNf7R1aE3NpPzNZSBZ1f7VHg89knHcSZ/5lgER1kfFeNeD1m8
 VMtJrrZNXhi95/P/o3rLeTarEP8j9+Knryo+YerXHSKL8Q+gPoZ7mScNsi4zoMhKoI6B
 NRTQ==
X-Gm-Message-State: APjAAAVEemVjbMAxNxi+LMCJEbPInqSVX03ADEKAILHITF50Kw7fpRps
 Ip3/UkBm3xjUhm3mzcPlE2wQAsshSuw=
X-Google-Smtp-Source: APXvYqxHePHrVJkLtCD4OHeUNYxgBVpbWsnFWZynCJ9DvmT/IkjGJV/2YliiQIZ+R+ncR+eWh8+vtw==
X-Received: by 2002:a63:3709:: with SMTP id e9mr26198565pga.53.1569874899822; 
 Mon, 30 Sep 2019 13:21:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r28sm15336802pfg.62.2019.09.30.13.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 13:21:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/22] tcg/ppc: Add support for vector add/subtract
Date: Mon, 30 Sep 2019 13:21:13 -0700
Message-Id: <20190930202125.21064-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930202125.21064-1-richard.henderson@linaro.org>
References: <20190930202125.21064-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: mark.cave-ayland@ilande.co.uk, amarkovic@wavecomp.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for vector add/subtract using Altivec instructions:
VADDUBM, VADDUHM, VADDUWM, VSUBUBM, VSUBUHM, VSUBUWM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 tcg/ppc/tcg-target.inc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 6879be6f80..6cfc78bb59 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -471,6 +471,14 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define STVX       XO31(231)
 #define STVEWX     XO31(199)
 
+#define VADDUBM    VX4(0)
+#define VADDUHM    VX4(64)
+#define VADDUWM    VX4(128)
+
+#define VSUBUBM    VX4(1024)
+#define VSUBUHM    VX4(1088)
+#define VSUBUWM    VX4(1152)
+
 #define VMAXSB     VX4(258)
 #define VMAXSH     VX4(322)
 #define VMAXSW     VX4(386)
@@ -2830,6 +2838,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_andc_vec:
     case INDEX_op_not_vec:
         return 1;
+    case INDEX_op_add_vec:
+    case INDEX_op_sub_vec:
     case INDEX_op_smax_vec:
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
@@ -2930,6 +2940,8 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            const TCGArg *args, const int *const_args)
 {
     static const uint32_t
+        add_op[4] = { VADDUBM, VADDUHM, VADDUWM, 0 },
+        sub_op[4] = { VSUBUBM, VSUBUHM, VSUBUWM, 0 },
         eq_op[4]  = { VCMPEQUB, VCMPEQUH, VCMPEQUW, 0 },
         gts_op[4] = { VCMPGTSB, VCMPGTSH, VCMPGTSW, 0 },
         gtu_op[4] = { VCMPGTUB, VCMPGTUH, VCMPGTUW, 0 },
@@ -2953,6 +2965,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
         return;
 
+    case INDEX_op_add_vec:
+        insn = add_op[vece];
+        break;
+    case INDEX_op_sub_vec:
+        insn = sub_op[vece];
+        break;
     case INDEX_op_smin_vec:
         insn = smin_op[vece];
         break;
@@ -3251,6 +3269,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
         return (TCG_TARGET_REG_BITS == 64 ? &S_S
                 : TARGET_LONG_BITS == 32 ? &S_S_S : &S_S_S_S);
 
+    case INDEX_op_add_vec:
+    case INDEX_op_sub_vec:
     case INDEX_op_and_vec:
     case INDEX_op_or_vec:
     case INDEX_op_xor_vec:
-- 
2.17.1


