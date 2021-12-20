Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D0A47B471
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:38:57 +0100 (CET)
Received: from localhost ([::1]:40442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPQu-0007S8-J5
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:38:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDi-0001hk-Cb
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:18 -0500
Received: from [2607:f8b0:4864:20::531] (port=46896
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDe-00070W-G8
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:17 -0500
Received: by mail-pg1-x531.google.com with SMTP id r138so10329469pgr.13
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bypa977r/WSLdHMHGE0uu+vGdO4aiDcArSJh/3S9q6U=;
 b=sP3av77yysr2sEoQ0AbFga6th3wsV0hosIKSiaDrlpujlBXCFJAT0fAKPjeKqnSmpz
 aLCmfyvdxYJjfHkz8f2J5fEMUSaePvCewWCMGJbS4G2spkya8eFeR2ilveTz3Pw3K2XO
 EjOuTydR68MrXRGrh30MVt/sRDd3QG0alfH9HOGuvmaeC8NYtZh0C+8VN04D/ygPcqVL
 BLuyrMlXdmZjd6w2DwAp0OnjqVdRaG2CVGMd6FQWyuzQHyBbk1E7QMxEon4dmMCtaeSP
 Ib/VGlslwkb+HXHXvDXlk5BgRT7dSKdgtk5YJp1mdSXACMPG+aZeOyuc+1QjIWyGl+BN
 QNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bypa977r/WSLdHMHGE0uu+vGdO4aiDcArSJh/3S9q6U=;
 b=NIRo8geFZacEwGhQ9ca59SMRsZxJ7fuMzvVojOkqbdQtwB8tkMBCCQuq0OH30gg3SG
 4HZ91q+xcHmQeKNoPM7o1EbIqNJOwe7tKEh5XNUlKj1uquUlT990F8xhX15DgXAQKXoJ
 9yGdLZjcFljSy90a++QOhp3vQLMllbQRNUN/DmS3PpYLbJxrirwopYueJp+LG3BrSj+G
 E8Gq/x24icpmshs4KYQ0Q3SIvUZS8EwmfXr/Gv3tFNHhqeFl5er01RokgmE19LmKd3bf
 es0FQ+BwzVg0XLvf+FTL41WY4f1PZpSDTuTCJX4SxWvUyyrZCGTU71HYuSerugMjDqiF
 9Odg==
X-Gm-Message-State: AOAM531GBD1DTc7tMUyFfsBQocOKrnPjRRTTH3drdoVw8zgQnMiwwomE
 ezGQ8DAB7Weh6MK2NT5InLK0xrP6JKHZ7Q==
X-Google-Smtp-Source: ABdhPJyhcmiN4nsysYkxc+c/tvpinK4SlgEZbCe7JeGctaHszyDtazMioSb2QzZq2Y49FuhdumEq6w==
X-Received: by 2002:a05:6a00:23d2:b0:4ba:e5e6:94f2 with SMTP id
 g18-20020a056a0023d200b004bae5e694f2mr6351046pfc.14.1640031911027; 
 Mon, 20 Dec 2021 12:25:11 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] bsd-user: Create special-errno.h
Date: Mon, 20 Dec 2021 12:24:55 -0800
Message-Id: <20211220202500.111897-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the internal errno used by qemu internally its own
header file, for use by safe-syscall.S.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/errno_defs.h    |  6 +++++-
 bsd-user/special-errno.h | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/special-errno.h

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 141e08456c..73cfa24b7f 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -151,6 +151,10 @@
 /* Internal errors: */
 #define TARGET_EJUSTRETURN      254             /* Just return without modifing regs */
 #define TARGET_ERESTART         255             /* Restart syscall */
-#define QEMU_ERESTARTSYS        TARGET_ERESTART
+
+#include "special-errno.h"
+
+_Static_assert(TARGET_ERESTART == QEMU_ERESTARTSYS,
+               "TARGET_ERESTART and QEMU_ERESTARTSYS expected to match");
 
 #endif /* !  _ERRNO_DEFS_H_ */
diff --git a/bsd-user/special-errno.h b/bsd-user/special-errno.h
new file mode 100644
index 0000000000..03599d9b5a
--- /dev/null
+++ b/bsd-user/special-errno.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * QEMU internal errno values for implementing user-only POSIX.
+ *
+ *  Copyright (c) 2021 Linaro, Ltd.
+ */
+
+#ifndef SPECIAL_ERRNO_H
+#define SPECIAL_ERRNO_H
+
+/*
+ * All of these are QEMU internal, not visible to the guest.
+ * They should be chosen so as to not overlap with any host
+ * or guest errno.
+ */
+
+/*
+ * This is returned when a system call should be restarted, to tell the
+ * main loop that it should wind the guest PC backwards so it will
+ * re-execute the syscall after handling any pending signals.
+ */
+#define QEMU_ERESTARTSYS  255
+
+#endif /* SPECIAL_ERRNO_H */
-- 
2.25.1


