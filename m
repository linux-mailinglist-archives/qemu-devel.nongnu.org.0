Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461E2D59D2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:58:10 +0100 (CET)
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKaF-0001nL-Eh
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR2-0001Vc-FB
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQm-00076V-GQ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id e25so5000312wme.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9ceDHVjskAUjyg+VpK8LBhowzV630zUBK2XJK3tLmPA=;
 b=BlafwE25/i4HwUcBvX88FA4j0kAxiP7lwxCYRSwgv+LpxE7G2D5Fou7SRb6FbY/J15
 jW/bM8CkKY/IbPghfJVpMlptEnTMu1wc4xLgSJhcSVDm/jAo4ELz91sM+7Gmk3B08Ghi
 4OepaIucdJvzhrbX1NjV3B70wcALSFkCzlzbahGVVks0dxmy4N9+iqwaAJnJzHyqVf/D
 jHHXNzI1RSp6u27FOLynbH1TNbPMHeI84i++7BaLGJmw/x6r62PLu8sy6999LNc7XOW8
 Dr+SV4k1jwztoqcve4wicpgEZCGbUweNa1AuWnB58Aq3Gw7gd9plZqlnyhj7MjIJFlKP
 bH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ceDHVjskAUjyg+VpK8LBhowzV630zUBK2XJK3tLmPA=;
 b=MJUxFhmmVB4dso0zMgBD1QK1C91pMdD2CLz3wL88qE3qJKPKfCc4pDRVttS/1CCUzB
 Y77M8ccGhJaVJ6/4l2ntyfju3a1JeZZqN/W38j8ch/gTi0kJnvT1l69sxvU/8LfeHqg/
 LsPzgtIjFDpuWnjLt55AE2TnIrjZdYPpN2rYYMKNO9aCnsZw7tUnaySyEcVe4P4lnTAG
 Ge3aqf1A4wjr7zHmPo5zssmdCrZ+tutGk8q2kIhvzItBX8NygtbotyexNzGoCrD6LRc4
 5Xa2AZxIumeQHMHcmwYKmhoXr4wY3rmTt15id+l/AKfWUiUHYhh2HME8xqoCDycLXxVZ
 6JpA==
X-Gm-Message-State: AOAM533JcM7AKMOZJbLLQSMCNYj/EH2kaxRHklfE4vuQyhlqrWDUsbNv
 URZn6f4QPyqziXoGPI9NKegNAGi//Ul+9w==
X-Google-Smtp-Source: ABdhPJxMdgh9iNjz/u4zE5Lcct8sLTuqFMmuIwUsesI0tseDYihq9Qo0u5bJvKQMOhZiEFEJFw90Zw==
X-Received: by 2002:a1c:741a:: with SMTP id p26mr8012032wmc.47.1607600898584; 
 Thu, 10 Dec 2020 03:48:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/36] target/arm: Enforce M-profile VMRS/VMSR register
 restrictions
Date: Thu, 10 Dec 2020 11:47:37 +0000
Message-Id: <20201210114756.16501-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

For M-profile before v8.1M, the only valid register for VMSR/VMRS is
the FPSCR.  We have a comment that states this, but the actual logic
to forbid accesses for any other register value is missing, so we
would end up with A-profile style behaviour.  Add the missing check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-7-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 2a67ed0f6e2..e100182a32c 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -622,7 +622,10 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
          * Accesses to R15 are UNPREDICTABLE; we choose to undef.
          * (FPSCR -> r15 is a special case which writes to the PSR flags.)
          */
-        if (a->rt == 15 && (!a->l || a->reg != ARM_VFP_FPSCR)) {
+        if (a->reg != ARM_VFP_FPSCR) {
+            return false;
+        }
+        if (a->rt == 15 && !a->l) {
             return false;
         }
     }
-- 
2.20.1


