Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799E51C955
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:38:02 +0200 (CEST)
Received: from localhost ([::1]:57378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhIW-0000Hy-VS
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYl-0003FL-FB
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:43 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYj-0004b1-P9
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:43 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so3519068otu.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=wcHeraIlfRUWCF9ban2wXAkXXxDLGDWyeTz2XIMbhKwffWZA2Nzaupgx9xpsk3XLjO
 +bchceA4QIe4gRPpZ0aizbVPt1vqCeecMP8dNrOcyfolbyoYLIk4YYtG2J4hHRvybst1
 U9qV3d0RanHUH+JwLbvQC8GQhrv53Ao7zc0Ycb57mJvxJ3mecLd+zG7BC8529ypwZGAF
 h7tI7NOYdqwT0KTheF+szQ2vktvlGdrT5/GxqgxIwXfPcXCn0gizf28svr0LhK5VvzCX
 8PcJhZ0Umyq38HTH9b7/ujzoHC/g5UcIvGSwmPIvm2NWmunFSBCo/akolnt3bAf90nbM
 yujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=e05wyiLrta6RYDGulpCSQoWqmlEciHFyRbSzLE+u60rLzRDnGAUGyIdSi/87z7buDT
 xTuVMnyZcUtS34lPGgTcKVzF77jp11nz+JBAgVQrFlgFFQm1OgwSRQuE332nNk7FDy7V
 vhYZL6SHqJh/8o4pz8DgHlDepSOZet8cXU3WHszi0zcsgnOjqVtKWbyxg6oD8vYwx4ai
 linGZQiS27HpHqVnvuvqiiZuWtcOyT0GzQ/F54L8xAo4On/OBqKJ7rSkfSgXwctdElTh
 9nLVLKSdfh96Ey7yIO39X5sjG1ekTYwFarH3/0YgXJMI9pkXM+cTMxr3+E7+G0xcNaJy
 ON5w==
X-Gm-Message-State: AOAM533e2K4GalAQw3Ow4lr2pjCy+GC83Vm/DJy7pUTjFGpWYUMIgjTH
 VYvtkiNhM91ZIR/i7aMI1kyGuQyWa4aR6NTV
X-Google-Smtp-Source: ABdhPJzn3pvG5afHYGNdRMI6R8dyZptZ/B/iJqgMXaghaUZ5ZYyQmlyBo32/uulsKY0XnD1x6OfOfQ==
X-Received: by 2002:a9d:61:0:b0:606:1513:8ad9 with SMTP id
 88-20020a9d0061000000b0060615138ad9mr7777688ota.307.1651776640624; 
 Thu, 05 May 2022 11:50:40 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 22/24] target/arm: Enable FEAT_DGH for -cpu max
Date: Thu,  5 May 2022 13:50:04 -0500
Message-Id: <20220505185006.200555-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This extension concerns not merging memory access, which TCG does
not implement.  Thus we can trivially enable this feature.
Add a comment to handle_hint for the DGH instruction, but no code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/translate-a64.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 48522b8e1c..8ed466bf68 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -17,6 +17,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_CSV3 (Cache speculation variant 3)
+- FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 40f77defb5..f55121060d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -738,6 +738,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
     t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5a02e076b7..6a27234a5c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1427,6 +1427,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         break;
     case 0b00100: /* SEV */
     case 0b00101: /* SEVL */
+    case 0b00110: /* DGH */
         /* we treat all as NOP at least for now */
         break;
     case 0b00111: /* XPACLRI */
-- 
2.34.1


