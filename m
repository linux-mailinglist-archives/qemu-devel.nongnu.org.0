Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2449A22D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:55:00 +0100 (CET)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB2x-0000JP-FC
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:54:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfB-0002FS-67
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:30 -0500
Received: from [2607:f8b0:4864:20::d29] (port=41732
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAf3-0001cs-VC
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:20 -0500
Received: by mail-io1-xd29.google.com with SMTP id q204so7309385iod.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JTWhVqKCstOU5FgvuzfWAofNmVQ+VpRI+KgX0kH49N8=;
 b=lEVU/BRgoWxD7tp8r9ABLdPNZs60V4cfRXhG2D2M9mIVMIXbmB9xeb+EsqsVLiYCYF
 hm4uY6jpg6NXVuvHF7IUSLJtjK8cpusN9ik5/s7IdvdNTWnolIzR/Aw4T2Yh6DRNEhzx
 awhanticd9H34HNFoBV1UqNhWK+X9KlZlP1ElfOpz6jsv1LRZtx0OwDR//XEX/o8q/Xd
 c0+9ivX+DNE2tmtgIFrUAs4AetK49BO3AOktspi5f+9ZK1IH21dit2MykI2haaQ/NCEd
 FtsDkrcjQ1EC6CAkwf3+WPE8s8Jlace5YiC40mWXoIntIoPFps9qMrEtQw6SmfT3D5Iy
 CRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTWhVqKCstOU5FgvuzfWAofNmVQ+VpRI+KgX0kH49N8=;
 b=VAYSYuIP0hdp8cXlQbtSDUOPwS+joQZvzalOIP+diqiodJ/H4Y92/W64HgsnIez33O
 kRgApvk6pwgeKD+h3IKzc94Q5xRkGcRbeXg43dVmK5uiT0uFNnz5q0k2oTzhOYxF4ii8
 PH0WpgOCGAZMCi0/Hk2iwU5cxTmuTaiR4rfs1pvtbmLRXtL5ToDOokDpZpgBCNXQA2Wy
 2cRgvLSJyE2Ve0mmUQBRNZ0DqRZa6pRGkdRmpS/6lFMJzcbk4fEhZ2BkI4m/UjpWP982
 TmfsX1+gqRRiJH684DRJStW6jsQDIL0MYXqNEzATIYQI4f58zUAbsR7sVEYLjhSboiYh
 P3lw==
X-Gm-Message-State: AOAM530EjTgeRtjZ0x95XdTrcnXGG7Ifqiq+KrEI87MJo17TBXiy1CIM
 wqTmpzPXqIJY7qaSimLxXtyA2245axSXUg==
X-Google-Smtp-Source: ABdhPJyrHFg9VEIJUvZKNqeom6PZ4Up2CotcQyof0bzxr41Mfa7opzaZe6wuRIFD19UWGOgb8dklTw==
X-Received: by 2002:a5d:8f86:: with SMTP id l6mr1278075iol.138.1643074216054; 
 Mon, 24 Jan 2022 17:30:16 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:15 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/40] bsd-user: Add trace events for bsd-user
Date: Mon, 24 Jan 2022 18:29:30 -0700
Message-Id: <20220125012947.14974-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
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


