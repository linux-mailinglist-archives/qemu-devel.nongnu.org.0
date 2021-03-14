Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8992633A747
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:08:14 +0100 (CET)
Received: from localhost ([::1]:50760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLV9x-0008NE-Ff
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1Z-0002Of-Cc
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:33 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1R-0002Ah-Dz
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:32 -0400
Received: by mail-qt1-x830.google.com with SMTP id r14so7647040qtt.7
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCT8Z895v2OzlUZ7cD3kW9yujJdvuk9uwCXjA4T3jIk=;
 b=YhTW0sAsOtpvUiWCodzpNWJPPTTZUTPe8VQmqxuJ2ZhGtEdu1BM08RvKBng/hOyzdu
 3AjH0+gNkItE8em5vtw2g9ToFvVLRHtFuIPasGO1hS8Gxx8Ks75roK1ExWqvkZTLAw/r
 UguNEO5vIn1+ksrUzLHimx5lHgCycRyB9VjMMxkH/pKNRzF+LiOIcW7quSLetfHZLgQb
 lAq8wbUfQSQP8wFQUg8HuTor6ElV7PA9t8cK8O7rKrcEAQLHqj6hPcdpcJtdHofOpW3F
 fnYJmVtXTtMk5fxm9t0xcEhclN6dKGYPZ+hdLn4OAZkKdTFMxxeny2C2JHq+47mhZaRf
 OjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCT8Z895v2OzlUZ7cD3kW9yujJdvuk9uwCXjA4T3jIk=;
 b=MJPbeZaGtAfhKRaJ+ug7aED/BeILv9eEwgdgE7B6rX+8xIwu+NkWHhDw25Hu94BErl
 irH6leoulKxG23ZOHA7OA9gTXc9siy/kYS9bJyEwBqZCJ99DM5ViEfK8ctOhgtOkMzbU
 pPh2KwlWcFWi4EvVPWNS15SpaZej0q0IRejvDO37HyVDNNz+ecJHkcJi2dOZUI3dkQ4G
 ZgnZskYdqjyWGOqkOwsD8LO1MF126mtFo51VVBlBTprWm76UD80tlKAssiL1EhxmkGmx
 ceDiIJTYMApq7WmAArqocXkHVt0QT1IxbcfvLfREgU/ICsJ/I3Z07VYFp+Ue4LcE98Ux
 t+XQ==
X-Gm-Message-State: AOAM5319dONPAF5VBpHaNbZ68sCekFMs6Qb/07IIal2YcsUt72L7LIwT
 dzg1uSHQoT+ktIUJ0lGhlVnlGqiDbWFDiGE7
X-Google-Smtp-Source: ABdhPJwSezyp+Nw76o4bIWBo14QFdrzLpkXDiEfYOiMHwLvaj36Aldousx2AFTvc5OXJofhSG6Leig==
X-Received: by 2002:a05:622a:514:: with SMTP id
 l20mr20511296qtx.62.1615744762714; 
 Sun, 14 Mar 2021 10:59:22 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/16] target/ppc: Remove MSR_SA and MSR_AP from hflags
Date: Sun, 14 Mar 2021 11:59:02 -0600
Message-Id: <20210314175906.1733746-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nothing within the translator -- or anywhere else for that
matter -- checks MSR_SA or MSR_AP on the 602.  This may be
a mistake.  However, for the moment, we need not record these
bits in hflags.

This allows us to simplify HFLAGS_VSX computation by moving
it to overlap with MSR_VSX.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 4 +---
 target/ppc/helper_regs.c | 7 +++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 07a4331eec..23ff16c154 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -599,14 +599,12 @@ enum {
     HFLAGS_DR = 4,   /* MSR_DR */
     HFLAGS_IR = 5,   /* MSR_IR */
     HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
-    HFLAGS_VSX = 7,  /* from MSR_VSX if cpu has VSX; avoid overlap w/ MSR_AP */
     HFLAGS_TM = 8,   /* computed from MSR_TM */
     HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
     HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
     HFLAGS_GTSE = 11, /* computed from SPR_LPCR[GTSE] */
     HFLAGS_FP = 13,  /* MSR_FP */
-    HFLAGS_SA = 22,  /* MSR_SA */
-    HFLAGS_AP = 23,  /* MSR_AP */
+    HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 };
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 8479789e24..d62921c322 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -95,8 +95,7 @@ void hreg_compute_hflags(CPUPPCState *env)
 
     /* Some bits come straight across from MSR. */
     msr_mask = ((1 << MSR_LE) | (1 << MSR_PR) |
-                (1 << MSR_DR) | (1 << MSR_IR) |
-                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
+                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
 
     if (ppc_flags & POWERPC_FLAG_HID0_LE) {
         /*
@@ -133,8 +132,8 @@ void hreg_compute_hflags(CPUPPCState *env)
     if (ppc_flags & POWERPC_FLAG_VRE) {
         msr_mask |= 1 << MSR_VR;
     }
-    if ((ppc_flags & POWERPC_FLAG_VSX) && (msr & (1 << MSR_VSX))) {
-        hflags |= 1 << HFLAGS_VSX;
+    if (ppc_flags & POWERPC_FLAG_VSX) {
+        msr_mask |= 1 << MSR_VSX;
     }
     if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
         hflags |= 1 << HFLAGS_TM;
-- 
2.25.1


