Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F133A85C2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:58:32 +0200 (CEST)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBSR-0007Ux-B5
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFI-0006WP-Qr
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEl-0000zk-RC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n7so12688555wri.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8vabLcCtrF8uUUIQZDanF4/sCkub8suDllFj2RsW/JU=;
 b=aPRpdzllKkGN17tateaaXG/4dKBTJorY/n8BdrgmJlzfSM7DaH90w+MH5txpUIpV+v
 DtIR/G5n7k8h7P5fjcKPhQRcTB/AQ1TWCeSbmmCUVlrhoY46t28vufBdhGyM51V6KvRp
 kM4wSup7pR+kMbGMN7ebHpR/PKwy2hIFNUZjpflYjaWumNvds0WCpuVu4g6Q0qBEG0mM
 SUNONo8Ri5RJVsRJFVvWM9AYiEMZ0Yi/durXU7jnU+bgQIlZhMwhmReOXU+iiAkKdEaf
 80dvIxREojexu4M9v0quwpXWsNi5WtcULXj1+mJeWM7cQ3tynvib/ijGWZpn8Wh75lpy
 9abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vabLcCtrF8uUUIQZDanF4/sCkub8suDllFj2RsW/JU=;
 b=YJRzyTqwMKX9RurfmUlnWTkXRf6zZFt+JUWYSxWdWkem0za3lew+NvztAnH5Vm2DXs
 lzEqxTLF0bH4QRaW8/8ZNu+xYX1aMgLOrVyQ/JpDpyCumMW+sX0PfF7s6yfP/EWE1JIz
 Sh8ZG0LaRrR04RrBDJ5JpCDncEEXChX5SBQwbVEjTaTAgnPogZxMXMP0or9jgXGMeYEV
 +foA7zoa0NKKj1Xhrj+ZmP/0w3ATutMxjzIvBwCuXZYsNwnJ0Ev18dymZ3iLRN0PiVki
 HGuvq+ua+WMvd1C4lG5C59OCPa40cBQA35JPBF5FSuWdnqYaquRD93f0LpCM2f8vP2n1
 jO+Q==
X-Gm-Message-State: AOAM5329aIGbleRuMSXyIvF+MiMnLoPQHj/ipLLYfJHEW/HUE+08i3pj
 P7aPGgvzp3u6v50mlHpkaKP/6DF4t+Absw==
X-Google-Smtp-Source: ABdhPJwPNQHKVcfSEpYHwEJlPx4U+CqkkBXfh6IPju90fu8APCYI+WnK4JmJ+RoueaFzmauiOmAhVA==
X-Received: by 2002:adf:ed03:: with SMTP id a3mr26161647wro.166.1623771862716; 
 Tue, 15 Jun 2021 08:44:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/28] target/arm: Let vfp_access_check() handle late NOCP
 checks
Date: Tue, 15 Jun 2021 16:43:57 +0100
Message-Id: <20210615154405.21399-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Message-id: 20210614151007.4545-6-peter.maydell@linaro.org
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


