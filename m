Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC32B711D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 22:52:47 +0100 (CET)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf8tS-0008JJ-7n
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 16:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1kf7bt-00065M-1k
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 15:29:53 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1kf7br-0001TL-61
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 15:29:52 -0500
Received: by mail-wm1-x343.google.com with SMTP id p22so4725232wmg.3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9sEjOsNwc7yQlfV2Mtj3mhAD5UiRco9eoqDghWMf9+8=;
 b=pbIZ3eqJc726BnJuWK8a4XkLVbBjSUTuLFBzq/wfoiG+RWDQwPCyXWP9/4JeMK31df
 ZI/eTkp9jnD4dnX6cuTB/ibFZuinJn6FxrCIBrpLINd63odde1gKfx6KVwjp/FwIiL6t
 cPDVQ0uFqnKlN0o8Yxi1HyDpiVUVWklcO+tSq5M1HajFWd/K5Ie0MqoHKLqLyHL7mxsD
 aOMx4vGlA7MXDFe5UNMoNTf94nedQO8gCh5Y85xUWD3LVANB2XK9IBJk6k8hlA/xmQoO
 20DfPRkSTj6um+n+OIusKLo8bTwmVFlEdisMKdqfiAF3NVGPU9lZ8pV7nvlj4C+zsj3I
 k3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9sEjOsNwc7yQlfV2Mtj3mhAD5UiRco9eoqDghWMf9+8=;
 b=eRtLD2rtbErlPtnPcNZzd23GHcHIaw5MJPMErj2hczvhP8ChpPSp+AzRYeK9CHMdS2
 XETDq9AaHYwzNLMhchWJWg95SODV5O5YE3mXHyXjoWiOJCDLtDl7R//FYVgARCbCnkhO
 2L0La1GGUxhPCyLKbzpiwk5VcGM2NJ2YcczhmKWmgVqUciKEN2JRYHdxHU8q7Vc15f6N
 dmOvKHGVBXbHW4XBbcseQOmLH7pfU5PtZrs8cJ2ME8jA5F3vCeTnyF0eP6FPVLEwWM87
 Zte8q/Ldoc3+FfMPwUhu6x/Y8BbpKQwqrwBooMepc/qi8u91rbxLL5Beo5fV6Gp0Tg+S
 E/Cw==
X-Gm-Message-State: AOAM531rNCbUOtRn8vwMWVMwCYdJkhSYmNbaDpLOEWNsrkpsnOauPj9x
 +7UrbdaEKud4BNNakJ+TcrGTVjhchuyewA==
X-Google-Smtp-Source: ABdhPJxWv/IfA7qyDCk+hvxdkDKdyEpSNd6Tsa8o8TYo2uw0ucwZ0Tl6/ZkJlAhjLxE4chk0+PcYfQ==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr824115wmr.179.1605644988358;
 Tue, 17 Nov 2020 12:29:48 -0800 (PST)
Received: from kali.home (2a01cb0881b76d00c2afd0dfa851d2b9.ipv6.abo.wanadoo.fr.
 [2a01:cb08:81b7:6d00:c2af:d0df:a851:d2b9])
 by smtp.gmail.com with ESMTPSA id t136sm5562352wmt.18.2020.11.17.12.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 12:29:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Fix build with 64 bits time_t
Date: Tue, 17 Nov 2020 21:28:46 +0100
Message-Id: <20201117202846.138463-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 Nov 2020 16:51:05 -0500
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
 contrib/vhost-user-input/main.c | 10 +++++++++-
 hw/input/virtio-input-host.c    | 10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
index 6020c6f33a..e688c3e0a9 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -17,6 +17,11 @@
 #include "standard-headers/linux/virtio_input.h"
 #include "qapi/error.h"
 
+#ifndef input_event_sec
+#define input_event_sec time.tv_sec
+#define input_event_usec time.tv_usec
+#endif
+
 enum {
     VHOST_USER_INPUT_MAX_QUEUES = 2,
 };
@@ -115,13 +120,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
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
index 85daf73f1a..2e261737e1 100644
--- a/hw/input/virtio-input-host.c
+++ b/hw/input/virtio-input-host.c
@@ -16,6 +16,11 @@
 #include <sys/ioctl.h>
 #include "standard-headers/linux/input.h"
 
+#ifndef input_event_sec
+#define input_event_sec time.tv_sec
+#define input_event_usec time.tv_usec
+#endif
+
 /* ----------------------------------------------------------------- */
 
 static struct virtio_input_config virtio_input_host_config[] = {
@@ -193,13 +198,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
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


