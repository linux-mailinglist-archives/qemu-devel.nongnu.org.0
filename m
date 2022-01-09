Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA03488A9A
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:36:36 +0100 (CET)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bBL-0006J4-J9
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:36:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av8-0005qO-Cm
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:50 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=44759
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av5-00078p-Tc
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:49 -0500
Received: by mail-io1-xd2c.google.com with SMTP id h23so14307271iol.11
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+/wWrTe4LnbRZSWmDfzF4YJqyeP25q6xhkQF31qFpIY=;
 b=QkW3se70RUui28GL7YyzzUnNe4OrguooRhK5xTmOYCtKPbYYpypyc+jlr0M8MkfYn3
 FjgkLRjzOlOBk+0lRuKaQLq9W2OQEdY5slLJ1GEx5zyfZdR0H/u8WHk9KcpJc7sH2EOL
 hbYYwP1nZaMQwS1I6RvC1weWb2kkisIrzxXL4O/1i44vgS96277YtEDEJ+17V2uOyaTt
 Uu/y1j8c0obJdsWUIpQR39dEBMK8ilzcoNfeuAAjh5YlU0zP7cshin8ciOswZ5qZigva
 8ziTqENq6ZDmuN7qKJq2oydFLjHEjDUmmYQJLJvJcTnRMHXvCKViiDX0wp/e7elF2Qx1
 VIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+/wWrTe4LnbRZSWmDfzF4YJqyeP25q6xhkQF31qFpIY=;
 b=NY0EZfzQ31AdHj3r3lGRE2vUcPAyfu0By0SJpwo082D8QlwVrYmPS2Xl/7bd9ZCtEP
 a3Srrd/z2KO8Zke7fZVXJMYBHZWA4W34zOj2fPj57tqgqiEvKpk2a9tud2xHSFSsFkpv
 ZnlrY5RWWOW+Vzrt1dsPyzcMi5a4DzgJnx1Ec/z6ll3fkPC0nmhQ3N90aK4mc7lgxuuJ
 myDZ/CNSLrZtOC/uVKZOFJSzAwEa/JDNI/c/yC4IQbb3aTWZRiq0bmOdPXYrRnAFx+Gc
 sylJUoTSlfotVSW+EjTmmZtKFVHxiSPDFpyp7gK/AXPoNFr13MuYgmzVgwV1gaAXKM92
 SKCw==
X-Gm-Message-State: AOAM531oYicCEaj6JQumtxi5b7qq4k1+cbJm9qAsbJNywJGiPyoiWrNE
 kwjG8qOFxYbCg9rIhb3DCodPdL34B+Wbcuvo
X-Google-Smtp-Source: ABdhPJwMaoCuISxY7rYYmuT1DAZQQl2E+CgHJMgKjxK8P+aTN6ivsrZpm3H0YlrWt0J5+BFBNesk6Q==
X-Received: by 2002:a05:6638:2641:: with SMTP id
 n1mr33151002jat.265.1641745186723; 
 Sun, 09 Jan 2022 08:19:46 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:46 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/30] bsd-user: Add trace events for bsd-usr
Date: Sun,  9 Jan 2022 09:19:08 -0700
Message-Id: <20220109161923.85683-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the bsd-user specific events and infrastructure. Only include the
linux-user trace events for linux-user, not bsd-user.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c     |  1 +
 bsd-user/trace-events | 11 +++++++++++
 bsd-user/trace.h      |  1 +
 meson.build           |  5 ++++-
 4 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/trace-events
 create mode 100644 bsd-user/trace.h

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index bf5c7eb0c02..7168d851be8 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "trace.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "host-signal.h"
 
diff --git a/bsd-user/trace-events b/bsd-user/trace-events
new file mode 100644
index 00000000000..a624a9fc34e
--- /dev/null
+++ b/bsd-user/trace-events
@@ -0,0 +1,11 @@
+# See docs/tracing.txt for syntax documentation.
+
+# bsd-user/signal.c
+user_setup_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
+user_setup_rt_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
+user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
+user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
+user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
+user_handle_signal(void *env, int target_sig) "env=%p signal %d"
+user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d("
+user_queue_signal(void *env, int target_sig) "env=%p signal %d"
diff --git a/bsd-user/trace.h b/bsd-user/trace.h
new file mode 100644
index 00000000000..593c0204add
--- /dev/null
+++ b/bsd-user/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-bsd_user.h"
diff --git a/meson.build b/meson.build
index 99bb7ba3a57..9fc9e0ddab9 100644
--- a/meson.build
+++ b/meson.build
@@ -2437,9 +2437,12 @@ trace_events_subdirs = [
   'monitor',
   'util',
 ]
-if have_user
+if have_linux_user
   trace_events_subdirs += [ 'linux-user' ]
 endif
+if have_bsd_user
+  trace_events_subdirs += [ 'bsd-user' ]
+endif
 if have_block
   trace_events_subdirs += [
     'authz',
-- 
2.33.1


