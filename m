Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EB04454A9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:14:11 +0100 (CET)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midVK-0004HV-WD
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNx-0007Hi-0g
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:33 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNt-00012m-Fi
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:32 -0400
Received: by mail-il1-x129.google.com with SMTP id h23so6272982ila.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xSpmZTHUVlMjxvu++nH1NyF/IL0CfnSZPyN2HVK7azg=;
 b=4ahHVQGXl30Jufa7BeyVLDBsX/iXnXU0UsJAKc3QHOQ6SYfcZ8iIPrq6Cbtu2fSD0Y
 5cHxECbJVaPtI/w+Hj/4PJC4OqjR7IFB/q5IpKkHZOsxbDUeOfvflun7iFRs0loN+r6J
 LyzBgmviXqIY4axfbv6wM8Dq565BD5cG68KZJEmqY1XpJwb1cylOChKiRs4HauEAqvzH
 9F8P2QMqKsAPM9J62gkrn+ksqkBzQ3HxrN3tOPaHyc9+/QCK7EMnRAzq3y+pNlyTO18j
 sth2meFNF/zPdDk/WgZNqRd4SP8ae1f/oVf3QtTYa34Vmf2tapxrWtL9fxqrE4/qmx/i
 ieTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xSpmZTHUVlMjxvu++nH1NyF/IL0CfnSZPyN2HVK7azg=;
 b=aINNdaMr9B5E9LdHyxHmo9THQG+aJ6JBq4nA+ucRBo/lg2pYXtgVyP0LfYk8Gj21YI
 l70qmDqkBXRHK5fuFrWNGGWc2ojB+wy4VSh4ymMnYtKkkgR5ULgujcs0Sq8zHzZEQBUS
 pURABfro8uFtMWKlOxA/bquBVAUbIbCNmm2fesu869uipJkOM1w8yZ/dlOEtuPYGu5eg
 RlOWjNQIzTP0+lYQ256WTgZo1KL8K7PuuCB9gc1zuR9IQxC5EPMedozieNlznbyi6iYo
 dGHAEqk5v+Sgi8KZQhpBxPJhoGnzqBBPivw4opM1W+CeVdUIStCdGbtwIeiY0fNiwqIj
 ZAow==
X-Gm-Message-State: AOAM531jwwTMKlJY7qxeQiax6sG6IcPhcFyfJxymgky3Vb3MLwEhrzpP
 r7S3zXN+qCY2P7gfyETKEt5bPRidLvUYfg==
X-Google-Smtp-Source: ABdhPJwoAIcJAA7m6YmTCmekCHgs5BTpPQ5bldUR9eWONJnQKEzZ5N3dv8WHPIYoejoz/Wy/N1b+zA==
X-Received: by 2002:a05:6e02:b24:: with SMTP id
 e4mr12116400ilu.17.1636034788263; 
 Thu, 04 Nov 2021 07:06:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/29] bsd-user/arm/target_arch_signal.h: arm user context
 and trapframe for signals
Date: Thu,  4 Nov 2021 08:05:27 -0600
Message-Id: <20211104140536.42573-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arm specific user context structures for signal handling and the closely
related trap frame.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 3aaced474b..4bdfcbb8d7 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -74,4 +74,12 @@ typedef struct target_mcontext {
     abi_int     mc_spare[33];
 } target_mcontext_t;
 
+#include "target_os_ucontext.h"
+
+struct target_sigframe {
+    target_siginfo_t    sf_si;  /* saved siginfo */
+    target_ucontext_t   sf_uc;  /* saved ucontext */
+    target_mcontext_vfp_t sf_vfp; /* actual saved VFP context */
+};
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


