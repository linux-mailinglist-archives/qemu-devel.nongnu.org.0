Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA114A505B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:42:27 +0100 (CET)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdVK-0007C6-Tm
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:42:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnh-0004ym-0X
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:21 -0500
Received: from [2607:f8b0:4864:20::d29] (port=36659
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002eo-I1
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:20 -0500
Received: by mail-io1-xd29.google.com with SMTP id h7so18427335iof.3
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+QXYNucUNSFJmHLJBCESvObOSc/YtVcWa7eAm4Hhi8=;
 b=b5UvnI2F5VyIjkGYTt8zQLxy3YOGTHkShMwz+doHd37enWW9p6LuKA2+l/ahje3IYc
 6jZp9+G7zudHA6l6GLSVhtZu5ZgzboO8AOVU5t0836XXeI+COZrTvlsLHBO8AO2ASE2j
 fSUThdR8gIdshNIyrGwMhUTXAc70BT4OYNJ4wVLmkK4wU/EEeaRBYwiPID9NWK7GsOE6
 LZTC89rcfM1IjxgzvB5susoBrMIkiHue2rZaOP0z/taFLXzDhqF6OZpJjXxTfOYJXRTa
 30j417EHOKug4+p1VQ11LieTOHcT6R5FUTJ8Fp9EAgTJmiyst1AV57aYuYfi6EEBLDvJ
 gNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+QXYNucUNSFJmHLJBCESvObOSc/YtVcWa7eAm4Hhi8=;
 b=X5NO4xAxeP8NfTeGk5MJrudGyFtV9rNxZ0Wiub3Jt67/UIpmvOu6k79wxcQjgUw6Bg
 wy9q84QXP7iCSESgbv+MTFdKEzzSdUbpGCMfF6qts09hNk9l4wZASjJB2HhVGvcREcG/
 szdKcebN1M+z3AL/uS9r9QqcyYS6PWJHu60h2sMoVTTcK0FLDdMGBN0e0g4sp9xyDwfR
 xu8N51NSePqyVHIOyW43kvIUQq0QGQB15sG/vnM5T6qQo44/CpH4sqYRXJHKp4J6Au5n
 IVkrWHTSdmJjun1q5Dak5GYC0/YlP1994/MISPaOXKJZ8Vb3MHNxIJuIUOxxeQQr53qN
 VXeg==
X-Gm-Message-State: AOAM532WIYOa5xYTHrScEjwCFU3ICI6Ilv+LoI5jIJQrd5ZJB1yf26oi
 F7SM6wsk7JvFlodh2nLYXUghApppAlbZVA==
X-Google-Smtp-Source: ABdhPJyGZi6RcFLV/OpWpK8DCvuVlPRLTTips9P24vequ6H7AwFsmfxvDUNqPshn99DjOWyZexzZeQ==
X-Received: by 2002:a5e:8711:: with SMTP id y17mr11497468ioj.175.1643659013272; 
 Mon, 31 Jan 2022 11:56:53 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:52 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/40] bsd-user: Add trace events for bsd-user
Date: Mon, 31 Jan 2022 12:56:19 -0700
Message-Id: <20220131195636.31991-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the bsd-user specific events and infrastructure. Only include the
linux-user trace events for linux-user, not bsd-user.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c     |  1 +
 bsd-user/trace-events | 11 +++++++++++
 bsd-user/trace.h      |  1 +
 meson.build           |  5 ++++-
 4 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/trace-events
 create mode 100644 bsd-user/trace.h

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index f3e020e004a..cb0036acb61 100644
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
index 00000000000..843896f6271
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
+user_dump_core_and_abort(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
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
index 155403d44f4..5f433550718 100644
--- a/meson.build
+++ b/meson.build
@@ -2458,9 +2458,12 @@ trace_events_subdirs = [
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


