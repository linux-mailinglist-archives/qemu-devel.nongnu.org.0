Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AFC4A04B5
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:57:27 +0100 (CET)
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDb7O-0003Z1-U8
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:57:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafr-0000kY-JN
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:01 -0500
Received: from [2607:f8b0:4864:20::d34] (port=46962
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafh-0001an-1c
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:58 -0500
Received: by mail-io1-xd34.google.com with SMTP id e79so9637634iof.13
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+QXYNucUNSFJmHLJBCESvObOSc/YtVcWa7eAm4Hhi8=;
 b=UfJIkjbc5RndC1KbqQV1UkY8oJCJNKKEbQuGb1LmZaJ88X/4jy/SxxcIl79D7pS0RG
 CHUwY45uFuwroca1Gr2iaWt1m3fm3DVOFZ3yfarJGaljrDDRDQh/ePOsLZO0prs9HIQF
 3ofbp7LEfp5rWxiYcNX3N9h2ZyEKRVMf4VDJkxJYuWZuJTP/5O0IJQrSM4Rf7+Adw2js
 NVtxx9Ab339aBaMbTZKra4fVuScEaWP4i5YIb6t8jNhDJ76XFcsFZ7NqlFplmBejklOE
 T0IqkPYGmWJCIUIP7NP4TdfetCQJulHPygW+ZbG8/raPCEIiYaVax3A8Ol7+/UoLYekP
 6AfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+QXYNucUNSFJmHLJBCESvObOSc/YtVcWa7eAm4Hhi8=;
 b=kOeW5+WTuC8Ogij6hINplirCfATIDDSWVZ+StpH+fiNLVwT8+pPn6yaTsKLWMmeslI
 aBAXfq8ogAxFm18Y4InMJaJuk3nHTRwpT3NaEnekk7FLyvia2R4A7WwzrW8DQnnUKPW6
 9dtVF/n12Fjk7IKGAZLR857VPD1FH2KgD/FTylYjsZxtt1KjV/RcHnnJXpjyd5A4oznf
 dh6VR6E0vDDldgE7Rlel9WWoWm2l5Uv4fWktwjPk4Hm3TvG+OFvgZkMj0B4JNRog9hkp
 vyme0OsNj5sVogphnHyIYn2oCrBg92z6DiF0TpG9IHr7PK6H6Nfck6ZwBT3fmXpV+ws7
 y8Eg==
X-Gm-Message-State: AOAM533irBR/NuUXPEkA3yawdpySXf0F8BBn09pJqtRVE/pkOPxdju2O
 JylT31RWr/+epShRZJZX3wauNHDXWrEFrw==
X-Google-Smtp-Source: ABdhPJwBPnEiCEmXg0pkvQx0cQpL0i+1ldyC83bhvZegwW1hldYWTluBfzHgnr5PBZUy/7CzhfzR/Q==
X-Received: by 2002:a02:c8c8:: with SMTP id q8mr1419088jao.243.1643412507649; 
 Fri, 28 Jan 2022 15:28:27 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:27 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/40] bsd-user: Add trace events for bsd-user
Date: Fri, 28 Jan 2022 16:27:48 -0700
Message-Id: <20220128232805.86191-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


