Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF8506492
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:33:49 +0200 (CEST)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghQq-0002V4-LE
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm1-0001AE-1r
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:39 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglv-0004RC-Mz
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id k22so20924277wrd.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=doPYRJXO4FIrj8QeZrC5l66bCm+FyhPuKeiN1xstxHU=;
 b=ZuF9/23aKKC/zTTgo4hVe0DL/YRA53J7lB8hxAMuplVzA81fnFGjVb/hpK5dA1YiL8
 tYLqabpy1WnG20I/cDt1kt7Jcuv1IODkDyTpH/+37+YKO58KE8NsK56pYmsAeWcbNL+Z
 EKBwnKpy9TRDR/t7hQkNHn5DKaI0YgDYVIGaJdUrJr5mLqQl/03ClBoY2tPTpB3Gy2lH
 /ypBqAz3wWbVTmUx4xjr6D9B8DlJhGmAoOY64mqB1SbZv4hzUkmIfcxYFFhYXRA92B6v
 vnjNjUmSoCnv7HoVedkxBHdSBgpiCk81jAIUGXge1yjHjy7q1wqfJN1fPFZYQdUbuM5M
 Xq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=doPYRJXO4FIrj8QeZrC5l66bCm+FyhPuKeiN1xstxHU=;
 b=BowN7uXyuyHF1ji7Z8uoyaT8skSy9j63hQj3pd92BxBQbgNc6yoEf88VcUy+Syv5Fj
 94d9NnLA+0Kq3Z6QXv2KnquS7J2wk0dQrZUAg7KYhSG2HV/kUMPuT2Jc4DOyiQYR7hb0
 QEoNDaaB+Z8zFOLDJw/BvAX06Cvv3NVXLZjiRnbbCLUyio29fSmDrSpQ4sN4XkH+weie
 yuwDxEjmqDEWTcQvOHGiW1gowPy8n4+LjNviZrkJERLsIRv4NfSX5epZdMMzYBdX6TQp
 EZ4DHSWaXXANxOzN2x+BwXo4yB7U4FTlcbbWY9I+tMCMHQUGO9NdBcZr11cpuwr2VQuP
 9FQQ==
X-Gm-Message-State: AOAM533bkY7i4B3gJ64mmKSXVzsEyO0DazJsW30x+hbFllyAWDmIljha
 fHj7OAA9RN9nwzB4ncwZbTO7Lx4EThadGw==
X-Google-Smtp-Source: ABdhPJxw/uimt23pKAo/NxsQLh6mc4c3Y7p5voDxYSu1DiJEDyRa9On+ACoYFd6kAhja4SQxpVnO+A==
X-Received: by 2002:a05:6000:1002:b0:207:a28a:c86a with SMTP id
 a2-20020a056000100200b00207a28ac86amr10349904wrx.361.1650347490409; 
 Mon, 18 Apr 2022 22:51:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/53] include: move C/util-related declarations to cutils.h
Date: Tue, 19 Apr 2022 07:50:42 +0200
Message-Id: <20220419055109.142788-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-22-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/dma/xlnx_dpdma.c            |  2 +-
 hw/usb/ccid-card-passthru.c    |  2 +-
 hw/usb/dev-smartcard-reader.c  |  2 +-
 hw/usb/redirect.c              |  2 +-
 hw/virtio/vhost-vdpa.c         |  2 +-
 include/qemu-common.h          | 20 --------------------
 include/qemu/cutils.h          | 20 ++++++++++++++++++++
 net/announce.c                 |  2 +-
 tests/qtest/npcm7xx_rng-test.c |  2 +-
 util/hexdump.c                 |  2 +-
 10 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 2d7eae72cd..dd66be5265 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/dma/xlnx_dpdma.h"
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index fa3040fb71..f530ab2565 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "qemu/units.h"
 #include <libcacard.h>
 #include "chardev/char-fe.h"
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 91ffd9f8ae..28164d89be 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -37,7 +37,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 8692ea2561..3bc4dee7fe 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -26,7 +26,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bc54f9fc44..b57be529c7 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -20,10 +20,10 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost-vdpa.h"
 #include "exec/address-spaces.h"
+#include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "trace.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 
 /*
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 5f53a0e112..08f40a9d1e 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -54,26 +54,6 @@ const char *qemu_get_vm_name(void);
 void os_setup_early_signal_handling(void);
 int os_parse_cmd_args(int index, const char *optarg);
 
-/*
- * Hexdump a line of a byte buffer into a hexadecimal/ASCII buffer
- */
-#define QEMU_HEXDUMP_LINE_BYTES 16 /* Number of bytes to dump */
-#define QEMU_HEXDUMP_LINE_LEN 75   /* Number of characters in line */
-void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
-                       unsigned int len, bool ascii);
-
-/*
- * Hexdump a buffer to a file. An optional string prefix is added to every line
- */
-
-void qemu_hexdump(FILE *fp, const char *prefix,
-                  const void *bufptr, size_t size);
-
-/*
- * helper to parse debug environment variables
- */
-int parse_debug_env(const char *name, int max, int initial);
-
 void page_size_init(void);
 
 #endif
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 320543950c..2137e65260 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -214,4 +214,24 @@ static inline const char *yes_no(bool b)
      return b ? "yes" : "no";
 }
 
+/*
+ * helper to parse debug environment variables
+ */
+int parse_debug_env(const char *name, int max, int initial);
+
+/*
+ * Hexdump a line of a byte buffer into a hexadecimal/ASCII buffer
+ */
+#define QEMU_HEXDUMP_LINE_BYTES 16 /* Number of bytes to dump */
+#define QEMU_HEXDUMP_LINE_LEN 75   /* Number of characters in line */
+void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
+                       unsigned int len, bool ascii);
+
+/*
+ * Hexdump a buffer to a file. An optional string prefix is added to every line
+ */
+
+void qemu_hexdump(FILE *fp, const char *prefix,
+                  const void *bufptr, size_t size);
+
 #endif
diff --git a/net/announce.c b/net/announce.c
index 3b9e2f1f14..62c60192a3 100644
--- a/net/announce.c
+++ b/net/announce.c
@@ -7,7 +7,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "net/announce.h"
 #include "net/net.h"
 #include "qapi/clone-visitor.h"
diff --git a/tests/qtest/npcm7xx_rng-test.c b/tests/qtest/npcm7xx_rng-test.c
index 797f832e53..35b1c1f5f6 100644
--- a/tests/qtest/npcm7xx_rng-test.c
+++ b/tests/qtest/npcm7xx_rng-test.c
@@ -20,7 +20,7 @@
 
 #include "libqtest-single.h"
 #include "qemu/bitops.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 
 #define RNG_BASE_ADDR   0xf000b000
 
diff --git a/util/hexdump.c b/util/hexdump.c
index 2c105a8846..9921114b3c 100644
--- a/util/hexdump.c
+++ b/util/hexdump.c
@@ -14,7 +14,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 
 void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
                        unsigned int len, bool ascii)
-- 
2.35.1



