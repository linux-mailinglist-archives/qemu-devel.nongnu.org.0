Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527F944554E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:28:30 +0100 (CET)
Received: from localhost ([::1]:59174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midjB-0008Ec-GB
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO2-0007fK-RZ
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:38 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:39900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNx-00014J-Cl
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:38 -0400
Received: by mail-il1-x12c.google.com with SMTP id x9so6266300ilu.6
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ebPUBinz5Y5WFe0LKLcheZIJ1i2oBR9MtV2qXwIpw5s=;
 b=OzK0SWGdaXMz308HxPZrwuqNjP2JkApVXxzcT3fr9XsqHh2Fo5btuDqdX/jpbbBm98
 Yc8wM0xJoZFu20nzy8y7sTXA1+/yhQea7NZiTT1mkztmejU1GDRzIQ8luMrN/d7mf3pq
 lJfpfoJR18u5HMqzOW0oU4o8wCCv0O/gHT5lQR7bQueze7mxWTxs1K0PohxgoSWu/H2O
 8ey8BEFHYJg3ffdWOIKleMllqSnYc3YJZUrRCttnPtq/6lmYOOuAlNKCMtZFzBJ6xuFR
 8y14O41fifmTLgLnfOn3eBdzlaQA3iw2rzroMby4rBYRvI8hqY8iiNSLVwkVLc9fM6Fz
 mMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ebPUBinz5Y5WFe0LKLcheZIJ1i2oBR9MtV2qXwIpw5s=;
 b=xHkZg6ryk/r8WOImP9NTS0H8SNZ1QWNgQgF/D4zqpVRP/QfArichG/3SDLvA3KRbHk
 WqutZsCp8h19Ytq3EPhFyMZ0HbHjufizdVGZWBlB7NWHpYLo4+mNAfTXyAWwYsyCjSBH
 l3YbLQIq1zxV/TPUVXc4aX/VxO0tb6SUijrg8atLkd4JgH4A1PehZC0tb/5YpoYV3i8d
 T+H27sWuFxpowLu2aq7c/yLdTfItFK198r2gvqjW7PqOUSi5ssgM31f0jfmfx2qFdvNU
 Ue1ABbswZjh6P7TIwpySZ04nxi/77jD62fS7BbK3jAx+5Cdp9DS4FXm9vb9YhXwm/ger
 tmbw==
X-Gm-Message-State: AOAM532oI6a7xR8ww2E4oSWIPbxJj4+Gn/203pP68RFFGvF2/Rw9KpT0
 YgZOw6u+ZO16vCqO8Dh5EfqaVEvbpL9akw==
X-Google-Smtp-Source: ABdhPJzXOjfWJqoGH+Gl3jMNrawoaVxU2ceEwMS1ASBRhK5SXQQmiFoQxBxideiUbStB/duMD6+NzQ==
X-Received: by 2002:a92:c562:: with SMTP id b2mr20701791ilj.30.1636034792179; 
 Thu, 04 Nov 2021 07:06:32 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:31 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/29] bsd-user/arm/target_arch_signal.h: arm
 get_ucontext_sigreturn
Date: Thu,  4 Nov 2021 08:05:31 -0600
Message-Id: <20211104140536.42573-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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

Update ucontext to implement sigreturn.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 177617ea8b..fd38b14c33 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -246,4 +246,13 @@ static inline abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp,
     return err;
 }
 
+/* Compare to arm/arm/machdep.c sys_sigreturn() */
+static inline abi_long get_ucontext_sigreturn(CPUARMState *env,
+        abi_ulong target_sf, abi_ulong *target_uc)
+{
+    *target_uc = target_sf;
+
+    return 0;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


