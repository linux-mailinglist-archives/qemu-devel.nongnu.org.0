Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F68443988
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:20:13 +0100 (CET)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi34e-0008Rc-EO
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f3-0007S9-7Q
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:45 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:39640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ez-0002rJ-ER
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:44 -0400
Received: by mail-io1-xd35.google.com with SMTP id h81so582045iof.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=crPhJy59MKpji7XeYQ6bfKjbA//sfiHqEKw3bAcAfno=;
 b=mldgy1i8lu6/cfOfAvSpK/LykAQO4D7Pkr+uKkua/homUz5Drv02CCVyO8hriLNVKP
 4VxJ1talzv9UbcbnvGRHW7pdhF2kW1P5crbKiJc25W4plxCnx0fiOrjOIHym6BUZWnZP
 f1GsIdJ7HPZoHprBucN3R/bbwHBXw8xmYAdrme+ttUX9tUD74cn7FaT7+dbTvQbnWTEB
 g9CgvGKxnOzJz4E1NZU9S5V/grGnC4ykNmWgVpqoe4Ca+l/orOG9MqcjRc4Ls4AHbPVp
 G+OhTCAenb4B8SfP/8ltZNAvAvuXs+FJVtf0EtrTVZOPazcWhGKm+QPix41TvPNakDK8
 7hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=crPhJy59MKpji7XeYQ6bfKjbA//sfiHqEKw3bAcAfno=;
 b=kts3s0rmRNTskULMD5avLpxxKS9seGZfR/S6wes5iX+Vr2jGplpTeOApk3dL2L2RFM
 ZduZEdQPEMfJMmWAZcI7FnRJ60lOI6c/P/WCQ9FXExrDuHiVyn0BTxTzRz4JZOyR1meN
 fsrW/0W+cNgDz+wWG8kBiDxhk+anQs1wIjPT0WGR012F0luVG4mMmbnLyDpWVFhxuj9z
 jxArqh6imLsdkztxIVrBGCAmVtc9bZob77rEo2Iy39mTd3Ta3z7omgm/XNIR6MSp9xFC
 5ydAEEWc4WK25cmpxn0ATxhopR/kFfyWN61/mtKf/DteYDUUarTAtDwIvOLZpstOKsC6
 Noyw==
X-Gm-Message-State: AOAM533NyUb3jJUQMBMmkbUeLHzeOJff7xXGahjl9J8Nqgut/9eAktsL
 RLQXKBhwB4Wqurkr950Z7yGjE8NxGoPZlg==
X-Google-Smtp-Source: ABdhPJwvdtHjh5SxFQ8ZPp7UGoVcro1ZZu9OGqWRjNoyHPYleyi1mJCJ0H1cCNseHuXBAGkcxENIeQ==
X-Received: by 2002:a5d:878e:: with SMTP id f14mr28773240ion.111.1635893619122; 
 Tue, 02 Nov 2021 15:53:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:38 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/30] bsd-user/freebsd: Create common target_os_ucontext.h
 file
Date: Tue,  2 Nov 2021 16:52:36 -0600
Message-Id: <20211102225248.52999-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD has a MI ucontext structure that contains the MD mcontext
machine state and other things that are machine independent. Create an
include file for all the ucontext stuff. It needs to be included in the
arch specific files after target_mcontext is defined. This is largely
copied from sys/_ucontext.h with the comments about layout removed
because we don't support ancient FreeBSD binaries.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/target_os_signal.h   |  3 ---
 bsd-user/freebsd/target_os_ucontext.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 bsd-user/freebsd/target_os_ucontext.h

diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 1a4c5faf19..3ed454e086 100644
--- a/bsd-user/freebsd/target_os_signal.h
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -1,9 +1,6 @@
 #ifndef _TARGET_OS_SIGNAL_H_
 #define _TARGET_OS_SIGNAL_H_
 
-/* FreeBSD's sys/ucontext.h defines this */
-#define TARGET_MC_GET_CLEAR_RET 0x0001
-
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
 
diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
new file mode 100644
index 0000000000..20b8a9188e
--- /dev/null
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -0,0 +1,26 @@
+/*
+ * FreeBSD has a common ucontext definition for all architectures.
+ *
+ * Copyright 2021 Warner Losh <imp@bsdimp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+ */
+
+/*
+ * Defines the common bits for all of FreeBSD's architectures. Has to be
+ * included AFTER the MD target_mcontext_t is defined, however, so can't
+ * be in the grab-bag that is target_os_signal.h.
+ */
+
+/* See FreeBSD's sys/ucontext.h */
+#define TARGET_MC_GET_CLEAR_RET 0x0001
+
+/* FreeBSD's sys/_ucontext.h structures */
+typedef struct target_ucontext {
+    target_sigset_t     uc_sigmask;
+    target_mcontext_t   uc_mcontext;
+    abi_ulong           uc_link;
+    target_stack_t      uc_stack;
+    int32_t             uc_flags;
+    int32_t             __spare__[4];
+} target_ucontext_t;
-- 
2.33.0


