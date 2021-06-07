Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878639E4B3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:03:34 +0200 (CEST)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIez-0002wM-BM
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa7-000702-F8
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa5-0007rk-Nn
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e11so8224794wrg.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WP6bAnl0XFv6sI86ENYvVNq1701QvYCzpF74EEud+5Y=;
 b=PhaTLgSi9W/p1rUl17LGICLkRVA6OEDyFY+ha4IUQMDRY8aX1k41a0O+PafXpU5jgL
 gOhGDF3wcxFsEn9o5oluvuFBQ3iA78D6dQnKfWMrZoLzsSipUGqm2fpqClCwn9JHeUoP
 Zj8wCBbtbhpEati67SPRddT9jetpLNfkHbWHbeATMqPz5mDIU0zk0nyz8QpM6ZfmKAS5
 rGW6KsalHae7dFjPsSYXnvU+sX3d80WrxUJ82JpI0jIb32ixvw9md+VOXDuZR6B1WZPp
 J3r5aDoeLQgRq1w1KftFWgs3u+RmvJ7i5RBO5ae4IVfTRHlS9k01pP4MgW38veDdbbcS
 nFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WP6bAnl0XFv6sI86ENYvVNq1701QvYCzpF74EEud+5Y=;
 b=SGgxPZ7APMoXRcXlDqlxbPanRC60RQOWGkSMVX5ohRQSLX4cNBfbWcWr/AMvOkf8/b
 P7CTU/g/66ADDrXRofBEQWinAiBAk8iadlGCp+8uUJ2n4jMTtZBnoa/w0iJwf1q4HMTa
 pCgGUrCchzCYDs81vsyQxe5m2TWTBTmpwAU9fdFwAQ43QexW50J/rB7dH5E/W0Ly3nmv
 0z2PTqEKtL0lFx2KlLp4oEK2rVGa5SvtysNKzmLL9VLOMwxWzUwuRfcCe+vSUdmgjmLb
 78zBWDPtXGmZ+i20iOQNExz4vdafh/uYaMZhpnUYVSCdsqoM5umcsXv7ovN1aZw2q01s
 dYeg==
X-Gm-Message-State: AOAM531CiLz8/3TH4zt36mubnR7szoercdELwBPhWryaXxU+bFRVdeXS
 Zva0azAEX/CMOLwEUWkl0AFa3Q==
X-Google-Smtp-Source: ABdhPJwLfzfmcBGuJ0MwLBV2fydRrylfiXBqiYHzA/A/nyRFz2W3omrTY/A5cYdvZnm84RZtSnN+dw==
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr18613626wru.242.1623085108405; 
 Mon, 07 Jun 2021 09:58:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/55] target/arm: Let vfp_access_check() handle late NOCP
 checks
Date: Mon,  7 Jun 2021 17:57:31 +0100
Message-Id: <20210607165821.9892-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
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
---
 target/arm/translate-vfp.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 3a56639e708..6a572591ce9 100644
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


