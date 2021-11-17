Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74724454AB2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:12:01 +0100 (CET)
Received: from localhost ([::1]:56474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNXU-0006Fq-Io
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:12:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQP-0000aW-Il
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:41 -0500
Received: from [2a00:1450:4864:20::32f] (port=40564
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQO-00034g-2U
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so5203115wmb.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OArr8UR7K4YMXVKamElRFw6E82XDCuMwJPDbbf5VtT4=;
 b=qJmhe5l+5TvW5jXq8TiaQM8AO7Rtc0ThdpaIpAjzMGs1aTHuTGk52+5h8xjUqpeE4C
 KQd7hFkYrztGuYsQQAwPDhpnmDQ93K0cDF1uYH5iadfWqZTYOcur+tWYlXSNJTsTgZRu
 Zd+x8aW9FSOmguSYe4gS+yMTdIGMsN0Zhz7aJ4gzOtD0OVURjyzuUC6WWR7zZNqukdNl
 +gfRuIY6F1uZq4y8sYRMqBnY0YPEIMFWIddKErwEWBiBpmfWRCwtEXdAuY08P58CqvFq
 0tx7HAkhxoKL7QOyf0PzXV9o7FrtoWL3+fsn/mTKbn0ZhCTwkEVuAawU8fgniA4hrnLH
 41Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OArr8UR7K4YMXVKamElRFw6E82XDCuMwJPDbbf5VtT4=;
 b=uUSatIck3VxTl/Ilvj9+eZ9B7e0/3rpFmBhcGc+6lLXM4xoXSlMeCCZMwf+0aLr+GS
 zMUZnNnWkQ72orPncImep2Ez54w3qx1yz4CeKgvD+LTrhHMx0IJPpwt4vP+NagvgmUOs
 aAxYNGEj00EugINZm2qreRGDIO8ERgpYTDoqWFukvk97yPQKJF9R3BVHI3bfh43JO9TO
 qUGcaBHxA+gdiNdu83XrJs2DzwDHND3Ot3vJTfVuCIW1U/Be+gx74KUy12zBBVJOKtGi
 VV0uKWH1wDBvroWtVuPSXxEnCQQFz7CcrtCrp/7opNIlY7otcyJgEcU3nI5ow8DUm1/U
 I8sQ==
X-Gm-Message-State: AOAM531oBva0mbm0m2NJNCywrszUfq86WdkQBB6uIfenHil3iXmRTnt3
 xwg4k+RZDJmgjjz3pv3uLHpVu09qCd5g8S710ZE=
X-Google-Smtp-Source: ABdhPJwOWGYhlsRJcQx3NP4/e6daIsX1r5p1F1vVfAA862Zph6VFG7OOJG0gXEcapmFkM5CmpVCjvQ==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr890512wmj.13.1637165078760; 
 Wed, 17 Nov 2021 08:04:38 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/17] common-user: Move safe-syscall.* from linux-user
Date: Wed, 17 Nov 2021 17:04:09 +0100
Message-Id: <20211117160412.71563-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move linux-user/safe-syscall.S to common-user so that bsd-user
can also use it.  Also move safe-syscall.h to include/user/.
Since there is nothing here that is related to the guest, as
opposed to the host, build it once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 {linux-user => include/user}/safe-syscall.h | 0
 linux-user/signal.c                         | 2 +-
 linux-user/syscall.c                        | 2 +-
 common-user/meson.build                     | 2 ++
 {linux-user => common-user}/safe-syscall.S  | 0
 linux-user/meson.build                      | 1 -
 6 files changed, 4 insertions(+), 3 deletions(-)
 rename {linux-user => include/user}/safe-syscall.h (100%)
 rename {linux-user => common-user}/safe-syscall.S (100%)

diff --git a/linux-user/safe-syscall.h b/include/user/safe-syscall.h
similarity index 100%
rename from linux-user/safe-syscall.h
rename to include/user/safe-syscall.h
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 12b1705287..510db73c34 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -31,7 +31,7 @@
 #include "trace.h"
 #include "signal-common.h"
 #include "host-signal.h"
-#include "safe-syscall.h"
+#include "user/safe-syscall.h"
 
 static struct target_sigaction sigact_table[TARGET_NSIG];
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 33d342157d..53deb887ca 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -132,7 +132,7 @@
 #include "signal-common.h"
 #include "loader.h"
 #include "user-mmap.h"
-#include "safe-syscall.h"
+#include "user/safe-syscall.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
diff --git a/common-user/meson.build b/common-user/meson.build
index 4f5c0f2f88..c02b5d9cc2 100644
--- a/common-user/meson.build
+++ b/common-user/meson.build
@@ -1 +1,3 @@
 common_user_inc += include_directories('host/' / config_host['ARCH'])
+
+common_user_ss.add(files('safe-syscall.S'))
diff --git a/linux-user/safe-syscall.S b/common-user/safe-syscall.S
similarity index 100%
rename from linux-user/safe-syscall.S
rename to common-user/safe-syscall.S
diff --git a/linux-user/meson.build b/linux-user/meson.build
index d6fa4f4d74..bf9d945504 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -12,7 +12,6 @@ linux_user_ss.add(files(
   'linuxload.c',
   'main.c',
   'mmap.c',
-  'safe-syscall.S',
   'signal.c',
   'strace.c',
   'syscall.c',
-- 
2.25.1


