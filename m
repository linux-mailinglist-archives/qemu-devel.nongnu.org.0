Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A264F447944
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:19:09 +0100 (CET)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjw7g-00021w-Ox
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:19:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi7-0006zB-Vp
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:44 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=41565
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi5-0002w2-BQ
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:43 -0500
Received: by mail-io1-xd2e.google.com with SMTP id p193so17419938iod.8
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xELoQ9MP23ZY0icqqnGEqd1dDOY3xpL6nxhgED/dCUI=;
 b=c2Xml1ebdKMSjPdrT89j/5iAd0LWTgZWFfP4cB50jBECq8YCkvyIaTKH6ylql7tt05
 tM256MR+/MwcYu1pfqTYXC1JnaNsB2f2t9hU5CYMusLs31/4yZJpe03ps4WttqvAD8ym
 Cb5gR2gGP0Rhat+uNOLzC6hCVDjdsP0DM8KhhxzY9AilWNDLl/Ng+eZ/1GIIWac5Xarc
 rY9L8Zu9q4vevzJu3eC8PFhJ9v0djwBkx3vCFAEJjjcDrxwMtJ9RqjX0yhOgzzjF7B/+
 2L6ZqOPKSPei9PuAi4MeIFoZi8SPnDTyDF/ZxkW8BCY0a4grHL/FQ96L5uAlxm57Lbx0
 w3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xELoQ9MP23ZY0icqqnGEqd1dDOY3xpL6nxhgED/dCUI=;
 b=VTNE7WR01q8algcLuIeQWPDb+tfkPmK0B7qAVlQMTScenHrQiTmqbgsOLAybTBkMmo
 l6vgO8RW8mRi/T8+QBcjbi5wSakrzSw4x1Fl/1ZPBknKGD82E6q9huo/zTm9QLF52UhA
 dzjbu/R49AmY18S7gX+DX8UXLXmqOLTqyo2DKcYftpWlbbT24INh5kmGT8xW36gAJxhK
 2igLsmx8S/ALh/Wpy/5QNVIk/J2hJT+Q7T2x3EVNh7OhwJ1QRo9LS8PMHI+uPNZhmeBh
 a57z5ByEig/QGVBLoxZA/xNPw1sG7/SOS/ZtvDXR1mqqi+2XFRi4SAHE+q44P+dLUbsj
 z7cQ==
X-Gm-Message-State: AOAM532heqztEOg10jD4pLwZFC8vlvulNsytgpM42fGSRsdDBX+EOiXx
 WiPRQUk5SIlvew26ACpU58leCYgBIsI+Hw==
X-Google-Smtp-Source: ABdhPJwKOy0qgXp9oVAhWeWwF/m6gle+rrE1GD3icAOwRusDYsAKa/poazBig+WN1Q988MSm4Z4BlA==
X-Received: by 2002:a05:6602:2c46:: with SMTP id
 x6mr5697676iov.38.1636343557198; 
 Sun, 07 Nov 2021 19:52:37 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:36 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/37] bsd-user/arm/target_arch_signal.h: arm specific
 signal registers and stack
Date: Sun,  7 Nov 2021 20:51:28 -0700
Message-Id: <20211108035136.43687-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Defines for registers and stack layout related to signals.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_signal.h

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
new file mode 100644
index 0000000000..973183d99c
--- /dev/null
+++ b/bsd-user/arm/target_arch_signal.h
@@ -0,0 +1,57 @@
+/*
+ *  arm signal definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_SIGNAL_H_
+#define _TARGET_ARCH_SIGNAL_H_
+
+#include "cpu.h"
+
+#define TARGET_REG_R0   0
+#define TARGET_REG_R1   1
+#define TARGET_REG_R2   2
+#define TARGET_REG_R3   3
+#define TARGET_REG_R4   4
+#define TARGET_REG_R5   5
+#define TARGET_REG_R6   6
+#define TARGET_REG_R7   7
+#define TARGET_REG_R8   8
+#define TARGET_REG_R9   9
+#define TARGET_REG_R10  10
+#define TARGET_REG_R11  11
+#define TARGET_REG_R12  12
+#define TARGET_REG_R13  13
+#define TARGET_REG_R14  14
+#define TARGET_REG_R15  15
+#define TARGET_REG_CPSR 16
+#define TARGET__NGREG   17
+/* Convenience synonyms */
+#define TARGET_REG_FP   TARGET_REG_R11
+#define TARGET_REG_SP   TARGET_REG_R13
+#define TARGET_REG_LR   TARGET_REG_R14
+#define TARGET_REG_PC   TARGET_REG_R15
+
+#define TARGET_INSN_SIZE    4       /* arm instruction size */
+
+/* Size of the signal trampolin code. See _sigtramp(). */
+#define TARGET_SZSIGCODE    ((abi_ulong)(9 * TARGET_INSN_SIZE))
+
+/* compare to arm/include/_limits.h */
+#define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
+#define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
+
+#endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


