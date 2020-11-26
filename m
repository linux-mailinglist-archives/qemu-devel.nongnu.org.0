Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2727C2C4AA9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 23:15:12 +0100 (CET)
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki34A-0002o4-KQ
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 17:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1ki32q-0002IN-0u
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 17:13:48 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1ki32o-0006Ri-1u
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 17:13:47 -0500
Received: by mail-wm1-x343.google.com with SMTP id p22so171753wmg.3
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 14:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yG7GtPj8R07sBY9gw+taDeHB5xGlTwgqAe0xaWI5sAw=;
 b=ib5P3hEZ8c+LRPAt1HDt2m0XubqATsPjdGWLVmMo+QSpykm/1gjD5Sx/6mmFcW+HiM
 KGMYMB/Fs3pEO/sEHCs0zDQn3pUVUbatj2nnRB4xTOn6Ytwtt07rkdHxwRY/MJdyEXqN
 WZKoAoNnYuNY0a1iVJvMg2mDaWqnMI617AiYAqF1F9W6vGjlaNV/pv/TGAGctVZw/bA+
 bQvob2japlOYltcUIGLWaYF3SgHvw5yzB43utL/4n64orW2kF3UDicsLvEA94q4k6iKH
 TG/hqBdnOzJbmBDaG5156zb/HvJ6pNN0tmLRUCmgOSpuNmk/QKTm6G8egsjx8LBhfvRG
 MBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yG7GtPj8R07sBY9gw+taDeHB5xGlTwgqAe0xaWI5sAw=;
 b=HDYQwbeA0BKj36qbVWyk/qzoFCF8+oioAKACBp9Bdgvopb/Zenm2p41Cu7O54s0QKZ
 UZ9c3TE9tpc3RMSBEVaiew6IgzDW5ZGLdh/tPEPppCABoOWnFdq63MI0MUccHjGo5h78
 NqVlksOYNNS1jvlYB2B/fwKOe56aBM/ObKtN/flZ+emqJc+speCVaBBONuG2na644ZlN
 bxmWNSTu/VduMRFaSf0RdSSTl60JtZNSl2lfl4K3qItfw2kBvSNbhRte9vVZzig3ICon
 OgK7DM9yNUV6IlTgyh4hEwKe80L/DLyHQQnKRi9r6zpLPMe6Uwe05BfuRtlOuDY9BefJ
 xitA==
X-Gm-Message-State: AOAM531oUbbLIGMU/poE0NZKF2T0gFhcQLzoVSH6w6oL+sDs07WEKHkr
 qQQiHxdhkIwpHY/QqKeWux4wmnngOLiJ5w==
X-Google-Smtp-Source: ABdhPJzhDjMz2u+XyPBx7JqPNCGlnqjpSjq9XojN6T4smmUJ3JZ5umlC/Ypk27wThsrFiO9KJ/218A==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr6285460wma.102.1606342424018; 
 Wed, 25 Nov 2020 14:13:44 -0800 (PST)
Received: from kali.home (2a01cb0881b76d00c2afd0dfa851d2b9.ipv6.abo.wanadoo.fr.
 [2a01:cb08:81b7:6d00:c2af:d0df:a851:d2b9])
 by smtp.gmail.com with ESMTPSA id f2sm7121175wre.63.2020.11.25.14.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 14:13:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] Fix build with 64 bits time_t
Date: Thu, 26 Nov 2020 23:11:11 +0100
Message-Id: <20201126221111.703652-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Changes v2 -> v3 (after review of Gerd Hoffmann):
 - Replace include on <linux/input.h> by
   "standard-headers/linux/input.h" to try to fix build on rhel-7

Changes v1 -> v2 (after review of Michael S. Tsirkin):
 - Drop define of input_event_{sec,usec} as it is already done in
   include/standard-headers/linux/input.h

 contrib/vhost-user-input/main.c | 7 +++++--
 hw/input/virtio-input-host.c    | 5 ++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
index 6020c6f33a..83fdeb4c6d 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -7,13 +7,13 @@
 #include "qemu/osdep.h"
 
 #include <glib.h>
-#include <linux/input.h>
 
 #include "qemu/iov.h"
 #include "qemu/bswap.h"
 #include "qemu/sockets.h"
 #include "contrib/libvhost-user/libvhost-user.h"
 #include "contrib/libvhost-user/libvhost-user-glib.h"
+#include "standard-headers/linux/input.h"
 #include "standard-headers/linux/virtio_input.h"
 #include "qapi/error.h"
 
@@ -115,13 +115,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
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


