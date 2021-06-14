Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983BB3A69EB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:18:57 +0200 (CEST)
Received: from localhost ([::1]:58092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoMa-0007qD-Il
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEP-0000Qm-5F
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:29 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEE-00007b-1Y
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q5so14962017wrm.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ookEZLXNZsxmPU5axXuxMuvdxR6PrgPweUugNwQXNto=;
 b=JdfgJ3l1BMfKbUr3nkhLkceMG6Nrdo4ObH3v1piILDcsmiXwWJmI3E9F5ZnOyDDtLd
 t/2k0V51uYk/uKsnX9rRVITN4xFBJlG2zq8m7dBDrlui4LvxcfZ1yL+hORBfGjhDVF2g
 8AtrgJjVaFC+FEOXMoo7nVJEB4fSf+dvmDxX1sgLKsaIhCpu5qnqm9G0w7e+9rIpItfN
 357fmIFmXuPnJ95pBpi1GB35sSjIG+oMMzdl1FkBaY1dNulBN5Zujw024GjMXS9TQZ0B
 nMdM+OhrMjez6GZltwINP7m3ozWJH0QgJ4NXv/VqDKeY9m8AIPjgMdf/8gkJ5St1lQ0H
 Gdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ookEZLXNZsxmPU5axXuxMuvdxR6PrgPweUugNwQXNto=;
 b=aUz04iTMN9uceLbEVTzF3RZoIgran9ciqBsHSgRYhPgb+ZJ9c1yR+0UzzywL2SOqsR
 qvt0rc6+Os0ZwLvO/lq3xu52EFtfAzQUTykM+hWFwCGnVBqmtcLECjIwjWnQQlEppFJK
 e3z9tXXsIu3y1n6vd2i5Rot8n95xDolwYvolMklQqiSSTvERtfVYbqMpFVkW85PqSzBH
 bdIYY+pUu1hKnttEASQeTlymoUsxeWbPkx3NOZUIGy0mu81RwIxDMHnpi6vtYAHk8/71
 Xa+7hEfZFyrpEsERRTY52Tc7ENhFrigUqdbROIegq3p6vc6Wwl26yuRBcInmxH/8vgRp
 Y0Sg==
X-Gm-Message-State: AOAM531YC1MzQh0E1CFNR6vwba3i5fead6V2Rwe1+2rn/QunDnTv0rXp
 SwU1vvPY+LT0QDzI2BKvvzijjA==
X-Google-Smtp-Source: ABdhPJzBPQaF3i8MnvlnlOhd9x4ICobWnQFiBOLgqb+oDbox320LpbWmA4eT2WYAztk1/oc41dV3sw==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr19307966wrt.418.1623683415093; 
 Mon, 14 Jun 2021 08:10:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/57] target/arm: Let vfp_access_check() handle late NOCP
 checks
Date: Mon, 14 Jun 2021 16:09:15 +0100
Message-Id: <20210614151007.4545-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit a3494d4671797c we reworked the M-profile handling of its
checks for when the NOCP exception should be raised because the FPU
is disabled, so that (in line with the architecture) the NOCP check
is done early over a large range of the encoding space, and takes
precedence over UNDEF exceptions.  As part of this, we removed the
code from full_vfp_access_check() which raised an exception there for
M-profile with the FPU disabled, because it was no longer reachable.

For MVE, some instructions which are outside the "coprocessor space"
region of the encoding space must nonetheless do "is the FPU enabled"
checks and possibly raise a NOCP exception.  (In particular this
covers the MVE-specific low-overhead branch insns LCTP, DLSTP and
WLSTP.) To support these insns, reinstate the code in
full_vfp_access_check(), so that their trans functions can call
vfp_access_check() and get the correct behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 2e12c694edc..01e26a246d6 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -143,11 +143,21 @@ static void gen_preserve_fp_state(DisasContext *s)
 static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
-        /* M-profile handled this earlier, in disas_m_nocp() */
-        assert (!arm_dc_feature(s, ARM_FEATURE_M));
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false),
-                           s->fp_excp_el);
+        if (arm_dc_feature(s, ARM_FEATURE_M)) {
+            /*
+             * M-profile mostly catches the "FPU disabled" case early, in
+             * disas_m_nocp(), but a few insns (eg LCTP, WLSTP, DLSTP)
+             * which do coprocessor-checks are outside the large ranges of
+             * the encoding space handled by the patterns in m-nocp.decode,
+             * and for them we may need to raise NOCP here.
+             */
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+        } else {
+            gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                               syn_fp_access_trap(1, 0xe, false),
+                               s->fp_excp_el);
+        }
         return false;
     }
 
-- 
2.20.1


