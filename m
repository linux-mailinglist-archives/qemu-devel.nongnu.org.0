Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8913D48824C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:27:18 +0100 (CET)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n674H-0007GR-FB
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:27:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ih-0005K6-W8
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:11 -0500
Received: from [2607:f8b0:4864:20::12e] (port=39663
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ic-0003OP-9L
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:05 -0500
Received: by mail-il1-x12e.google.com with SMTP id o1so6332785ilo.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nePtE5ZTuo2h1AKS5faGNz7Ftuxfg1QV7jdqmeDiQY=;
 b=l5hvCeEfckp2u2f1C1KhtD/tVLhthtkiJnRex4IvEMCWPmTJOQ1QYqa+s0fr7bwfWt
 5KwpqEzjQNT42WxQ9kyaoPFRDfB4YY0wxRPUraeTU0CBuifNoq6ag6+mRatnjLrcEN0T
 PSEDWLVkygwVDTNKwYImHn/DV7oUG4RHwXPJ3E2DoybezGLuYobmrQIdVbCQKcm2qOtw
 lO3tkU1I/tLCR3usanRW8oYaTSK/EMLJhvxLJJ5h3+DCpsRDPgqN6pBL2hzN4ZCnNrZC
 2TkgGnGxiB7B7ckvIPTRCiVR/WL2LTjgWE2kdR7O2DQXb5BH6QuTLOvvaN/VlXGFIxY5
 gyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nePtE5ZTuo2h1AKS5faGNz7Ftuxfg1QV7jdqmeDiQY=;
 b=mkcYxjgQni3LdAMIZlxz9XeuqLkOwyNrgZ1FSDG7T+uF+DKuWU3gswxinVhvOLIwcb
 oIDlVPWhFGzqAwgC/3DuDhYMykbGCSnpN6Arn+hyTlZowINtzkCqWUOO1XW4q7ThufeW
 gqUCk9OKxfHT+/jir0DR3asOYy7mANs17vVCIJjSSn+LtxrC3u708OJXp32o4AXzqi7A
 DcCCs4rHk3B4RbBI4r0/uvMgv5HmrzX984ovSGrlXcqk7l/7lpV5oi6UqS42ZAp/7trG
 8SYdAR+Hqiz9/h9xw62e5RAfNB/C33d2VGyqsJ0xj38CyVHLY+RkIakk3qVFJJTAVGaE
 extg==
X-Gm-Message-State: AOAM530HIlI2dWe09XQozK7+vEFrVvJpOw1KE3v1goQoTxyhGtUO+Awr
 cTDFaLxOMDB5Zy96X/QOehEZ8lVL2poPPgak
X-Google-Smtp-Source: ABdhPJxAAUoHezTAirx/IiF37/gjwNMuD7KauWfOuz9Bb+WoCg2PQZcqp2cOlHtLPDo3KkrVUsmVCQ==
X-Received: by 2002:a05:6e02:1d92:: with SMTP id
 h18mr30648155ila.314.1641627479588; 
 Fri, 07 Jan 2022 23:37:59 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:59 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/37] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Sat,  8 Jan 2022 00:37:17 -0700
Message-Id: <20220108073737.5959-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement target_cpu_clone_regs to clone the resister state on a fork.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 66215684d6f..fa45d9335d6 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -36,6 +36,14 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
+{
+    if (newsp) {
+        env->regs[13] = newsp;
+    }
+    env->regs[0] = 0;
+}
+
 static inline void target_cpu_reset(CPUArchState *cpu)
 {
 }
-- 
2.33.1


