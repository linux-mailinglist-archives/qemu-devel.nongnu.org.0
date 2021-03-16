Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3B33CF7F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:16:46 +0100 (CET)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4sf-000734-HB
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pO-00023v-E7
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:22 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pM-0007mP-Ml
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:22 -0400
Received: by mail-ej1-x633.google.com with SMTP id e19so70701500ejt.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=9ZQ6AOd1nro/moZocOdsvBQpIZ609NYlDfUQCOQCk48=;
 b=OHGwo+SPUr4fnedP77sbQ+kKFi3+5N1HzSbQJ/0VKHpqN7m8QcMoWlpR5zlsLc6Q/3
 8/YaOimYxwqvP5RgNJQouKaUk1Z5BcPmtbObih/uFQna+FScmk3riEHm228qn4pnriob
 ACdWGXTBNZSO23EnsLLjW8DJ8vJv21SbbvXD/HZzn95EBQqia5xkJN+/QvVfposfcuOJ
 0hrejphNO1MdZgajSU5/0pQ3uNHpYM2CvaM65Nqj1iy9kBR2K1wFYcDy5KrwRtsvMbAh
 6ZW7CALDVHP+1mIApPYkq3OT2jx0N8jQpuhxRAd3pXoUjWdbViQLJRiWMOjgixS7g/0l
 usnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=9ZQ6AOd1nro/moZocOdsvBQpIZ609NYlDfUQCOQCk48=;
 b=eIB6g8h1ueLLgEI8yhbn8gVjc/whDpBNo2kX3HtZKs8NCQueiXK2AsrtJmJpqGtdoA
 jf7lHMNfQCY/sDFmZMQApuVrJipgiSWfPCVLWCsEnptKozApXzIjhYvMKmoolZh1gbec
 6oGnPfIB0EnVb14uMHuuziHnUWJAqvemAagXQJr08bAwD+YoQHbNoagXCjpQognftpF1
 gehQTmBy0ss0gDpCe+3RYy6n5k7i3L6ijjBQ/GVB5q0T1ZYQWCjfkDAu0WII/yYMzXFJ
 KREmtwsckK4tVNrLupNlSMjUq9juCon0UJT/xesCVbSvV94gNC9JM+IxMflEAUEy2AQx
 SMZQ==
X-Gm-Message-State: AOAM533bbxOoMyeHuOsYv9KDGC8h9zcY+V+YFRhMv5+xwAi/FJlTn9up
 nJ3spyL/EqrIgfXIr5PAo7k=
X-Google-Smtp-Source: ABdhPJymblS7j+1W7dDToE9CqFPbb0Gd0563e/GbYsSoJhI4caCAbrt0BBhTOt3EB6Jj1mMaGk64IA==
X-Received: by 2002:a17:906:f6ce:: with SMTP id
 jo14mr28625514ejb.476.1615882399274; 
 Tue, 16 Mar 2021 01:13:19 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] net: tap: Pad short frames to minimum size before
 send
Date: Tue, 16 Mar 2021 16:12:45 +0800
Message-Id: <20210316081254.72684-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do the same for tap backend as what we did for slirp.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v3:
- use the pad_short_frame() helper for tap

 net/tap-win32.c | 9 +++++++++
 net/tap.c       | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/net/tap-win32.c b/net/tap-win32.c
index 2b5dcda36e..e044a5ca35 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -31,6 +31,7 @@
 
 #include "qemu-common.h"
 #include "clients.h"            /* net_init_tap */
+#include "net/eth.h"
 #include "net/net.h"
 #include "net/tap.h"            /* tap_has_ufo, ... */
 #include "qemu/error-report.h"
@@ -688,9 +689,17 @@ static void tap_win32_send(void *opaque)
     uint8_t *buf;
     int max_size = 4096;
     int size;
+    uint8_t min_pkt[ETH_ZLEN];
 
     size = tap_win32_read(s->handle, &buf, max_size);
     if (size > 0) {
+        if (!s->nc.peer->do_not_pad) {
+            if (pad_short_frame(min_pkt, buf, size)) {
+                buf = min_pkt;
+                size = ETH_ZLEN;
+            }
+        }
+
         qemu_send_packet(&s->nc, buf, size);
         tap_win32_free_buffer(s->handle, buf);
     }
diff --git a/net/tap.c b/net/tap.c
index b7512853f4..aa69cf1c73 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -32,6 +32,7 @@
 #include <sys/socket.h>
 #include <net/if.h>
 
+#include "net/eth.h"
 #include "net/net.h"
 #include "clients.h"
 #include "monitor/monitor.h"
@@ -189,6 +190,7 @@ static void tap_send(void *opaque)
 
     while (true) {
         uint8_t *buf = s->buf;
+        uint8_t min_pkt[ETH_ZLEN];
 
         size = tap_read_packet(s->fd, s->buf, sizeof(s->buf));
         if (size <= 0) {
@@ -200,6 +202,13 @@ static void tap_send(void *opaque)
             size -= s->host_vnet_hdr_len;
         }
 
+        if (!s->nc.peer->do_not_pad) {
+            if (pad_short_frame(min_pkt, buf, size)) {
+                buf = min_pkt;
+                size = ETH_ZLEN;
+            }
+        }
+
         size = qemu_send_packet_async(&s->nc, buf, size, tap_send_completed);
         if (size == 0) {
             tap_read_poll(s, false);
-- 
2.17.1


