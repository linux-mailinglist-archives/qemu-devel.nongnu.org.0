Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B215C447957
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:25:00 +0100 (CET)
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjwDL-0000qM-TQ
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi9-00075j-ER
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:45 -0500
Received: from [2607:f8b0:4864:20::d36] (port=38731
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi7-0002yx-NG
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:45 -0500
Received: by mail-io1-xd36.google.com with SMTP id v65so17432603ioe.5
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFpyi0tgMhKl7tXQoCZMXjFfUN+vnx/DUS2tS/nbmKU=;
 b=J7pmSwvkjH4XEANYsKD/29RXyn38qCq1l6p+vlTJeevZTKnbflldJuXXoj3b86b8Lo
 dsN+HhtFYCskGsWtghjZkdydI2x4c5ttckJaIXCItXRPAUVwKrC8rdUySE3LWoSnVi7w
 4j0zDFzlsXJs8F5TS7+MKn+ujhP6li/sk8qtq0gwubnLrgGRnbhXXi2QL3v2NyQhN2mZ
 7V17oCH3nkcy8foc4HCBgSQx2Ou78lB+Wzl6LGx7leu24AKnur5Fdtd3vycINEuHH6ZQ
 RQe0bl3Rd6fnDYk1C+CmIm5oGfL38tQwF4JqvVaf5r1PAjcWWeC7CjRQ+iyW5xjvLxF0
 zNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFpyi0tgMhKl7tXQoCZMXjFfUN+vnx/DUS2tS/nbmKU=;
 b=QumiqZNXXf+wq99neRTaQ832hIvkRH8Ql96Qn9QFpPFIZuAPHch7NW7kGEUxMRbDAR
 xInXOVSUb14FFY3E8sj93/mfF368A8ZJy8TEs4akoSHWMvD8uLw44arMTadvAUv8Ckkf
 LOQOo/shZCGxQdXBYTdLLpLOoUBJE6SidR3pMf8y4BeCPq0EjLV80eUVOXzchJpfO3AA
 hAs1nq6kzoVawt0+K1hLN9/WXQ2ZLtsjLSe/kF4eOo5PaAMHztc/UQM745nOE8Ulbv2Z
 btUzY+TtrHuSpt4qL2nWISEG+Aw8AhNCOGkssf3M4LMe75KRso7UyUPA76elW8sxJCYp
 8XLA==
X-Gm-Message-State: AOAM5310DWPiQMox7OQdF6UAU6WZuijuuIlCUx0sIDFHO7ba1aobdCEC
 IpGEdhPKLCOOoerB00vGzm9zwakXXFESug==
X-Google-Smtp-Source: ABdhPJwgO0HdVONrpceShzk/UUN95c/egUmUPnaAM7wXFncsMW5tzZwDoHfmG+rvoCmkpJL8k1Te6w==
X-Received: by 2002:a05:6602:15d3:: with SMTP id
 f19mr11543128iow.211.1636343562551; 
 Sun, 07 Nov 2021 19:52:42 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:42 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 35/37] bsd-user/arm/signal.c: arm get_ucontext_sigreturn
Date: Sun,  7 Nov 2021 20:51:34 -0700
Message-Id: <20211108035136.43687-36-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Update ucontext to implement sigreturn.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index fb6228db6c..1478f008d1 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -185,3 +185,12 @@ abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp, int srflag)
 
     return err;
 }
+
+/* Compare to arm/arm/machdep.c sys_sigreturn() */
+abi_long get_ucontext_sigreturn(CPUARMState *env, abi_ulong target_sf,
+                                abi_ulong *target_uc)
+{
+    *target_uc = target_sf;
+
+    return 0;
+}
-- 
2.33.0


