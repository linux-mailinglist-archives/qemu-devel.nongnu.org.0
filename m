Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B982CDF41
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 21:02:34 +0100 (CET)
Received: from localhost ([::1]:58728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkuoC-0000jl-PG
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 15:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1kkumw-0008Jf-Q4
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 15:01:15 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1kkumt-0005xV-Ml
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 15:01:14 -0500
Received: by mail-wr1-x443.google.com with SMTP id t4so3110826wrr.12
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 12:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbdUcO2CBtCC7YZsTpVnD/9glJfq7di6btlth32kPMY=;
 b=kF1kqpiP5XN4OKge58yZUxPviKwKrqQBJIb4QUEYPve7n+etpOhPjVB4ncCHhKayI5
 sKQTsyO+tnjVPP3uJqV/+9hCjypk+sL+lDaeMVfaWZjJVO03bSAQpNdff1dlWb5MX1Jk
 2tNMppkIvRJrTOl/3XLQlFdZaWN89/MuqkULcQ8ePuxFrA6MBf0UDBmpxRNsnYW00F0q
 gf47N5mnehzU5pqaWF7k5r1W/JiehzCz0u1MfHmxzkB/jTR42bMqLF491VrVV0XLZON3
 drz4j69HVQKr1ciqR23N97kCtnPlHkWXtEo2c7XL9awzEkA2/XxS32d0y5yP6MB8QO+3
 zYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbdUcO2CBtCC7YZsTpVnD/9glJfq7di6btlth32kPMY=;
 b=DR22tRWs+MZl/nYasPJivVZyOPXUoFPUm6mZ4X5SrSUMKZn+N+b6SzF59RpAJaaDWA
 EGErEwO5uMdAp8sV7MF0kTalhjQPmoXFYg2Kz9S61i0VVKc/KpiaTkK3+ghNxC4iXCJ5
 gdfGNEjmkUtiS6Q8DVV30tpE2LBiI2828etYYmSB6CK4cVSkA6Uj2DI0Ppmod3TNq1nm
 qSIMrj2mU8T43wgCmtAwtSqnhzLk7kwfGeRF48BLNFZFvdEy728nHa6GC5V+oVSX6hM2
 2U+fR5PPcN6C1MGJz/sNouc12tBHSlyL8IVUiycum/rDiwlWWZ+evgc6zkrK4M/dSv2U
 8Aew==
X-Gm-Message-State: AOAM532MmnXVoWztprV4mokunxuJ5HUzaGWHe/dQ6OKoeUOj4bF0sooB
 kI1creKvBLDxEu8Cs2RRqffawq81IRV8fw==
X-Google-Smtp-Source: ABdhPJymcxcwwxJ0Moycay3O+PD4L8nbVisq+8vNRpyOb+oFfG1fkQ2nZYZSN2xkYWbcaaiVLxvfgw==
X-Received: by 2002:a5d:620e:: with SMTP id y14mr964856wru.111.1607025668958; 
 Thu, 03 Dec 2020 12:01:08 -0800 (PST)
Received: from kali.home (2a01cb0881b76d00c2afd0dfa851d2b9.ipv6.abo.wanadoo.fr.
 [2a01:cb08:81b7:6d00:c2af:d0df:a851:d2b9])
 by smtp.gmail.com with ESMTPSA id f23sm399517wmb.43.2020.12.03.12.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 12:01:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] Fix build with 64 bits time_t
Date: Thu,  3 Dec 2020 20:58:19 +0100
Message-Id: <20201203195819.583626-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wr1-x443.google.com
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

time element is deprecated on new input_event structure in kernel's
input.h [1]

This will avoid the following build failure:

hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
  198 |     if (gettimeofday(&evdev.time, NULL)) {
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df86d3d599d5
 - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v3 -> v4 (after review of Gerd Hoffmann):
 - Include <sys/ioctl.h>

Changes v2 -> v3 (after review of Gerd Hoffmann):
 - Replace include on <linux/input.h> by
   "standard-headers/linux/input.h" to try to fix build on rhel-7

Changes v1 -> v2 (after review of Michael S. Tsirkin):
 - Drop define of input_event_{sec,usec} as it is already done in
   include/standard-headers/linux/input.h

 contrib/vhost-user-input/main.c | 8 ++++++--
 hw/input/virtio-input-host.c    | 5 ++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
index 6020c6f33a..b27b12733b 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -7,13 +7,14 @@
 #include "qemu/osdep.h"
 
 #include <glib.h>
-#include <linux/input.h>
+#include <sys/ioctl.h>
 
 #include "qemu/iov.h"
 #include "qemu/bswap.h"
 #include "qemu/sockets.h"
 #include "contrib/libvhost-user/libvhost-user.h"
 #include "contrib/libvhost-user/libvhost-user-glib.h"
+#include "standard-headers/linux/input.h"
 #include "standard-headers/linux/virtio_input.h"
 #include "qapi/error.h"
 
@@ -115,13 +116,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
 static void vi_handle_status(VuInput *vi, virtio_input_event *event)
 {
     struct input_event evdev;
+    struct timeval tval;
     int rc;
 
-    if (gettimeofday(&evdev.time, NULL)) {
+    if (gettimeofday(&tval, NULL)) {
         perror("vi_handle_status: gettimeofday");
         return;
     }
 
+    evdev.input_event_sec = tval.tv_sec;
+    evdev.input_event_usec = tval.tv_usec;
     evdev.type = le16toh(event->type);
     evdev.code = le16toh(event->code);
     evdev.value = le32toh(event->value);
diff --git a/hw/input/virtio-input-host.c b/hw/input/virtio-input-host.c
index 85daf73f1a..137efba57b 100644
--- a/hw/input/virtio-input-host.c
+++ b/hw/input/virtio-input-host.c
@@ -193,13 +193,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
 {
     VirtIOInputHost *vih = VIRTIO_INPUT_HOST(vinput);
     struct input_event evdev;
+    struct timeval tval;
     int rc;
 
-    if (gettimeofday(&evdev.time, NULL)) {
+    if (gettimeofday(&tval, NULL)) {
         perror("virtio_input_host_handle_status: gettimeofday");
         return;
     }
 
+    evdev.input_event_sec = tval.tv_sec;
+    evdev.input_event_usec = tval.tv_usec;
     evdev.type = le16_to_cpu(event->type);
     evdev.code = le16_to_cpu(event->code);
     evdev.value = le32_to_cpu(event->value);
-- 
2.29.2


