Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34282B85CB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 21:40:34 +0100 (CET)
Received: from localhost ([::1]:39416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfUFl-0001J4-AR
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 15:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1kfUEJ-0000r5-0w
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 15:39:04 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1kfUEE-00043S-Na
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 15:39:02 -0500
Received: by mail-wr1-x441.google.com with SMTP id r17so3569386wrw.1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 12:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dvR09NMMf4PZ1neOM0o3Gmh0k5nrtY9nkMGmznVxYeI=;
 b=b4vdHNDcZw4N4hYTMD0GiWlZCeZzhq8nMj9PgP76DC/REx0NO4mpgbGs1XJmrDcK4Z
 ipII2LTv1eBA+6+8SditO9C9hnQtqhbTyfZ8ubMIOHpYOhICYyC2ozKchsK3Ou5ou1f4
 J4yyChR2o2HsI5+4NplzIYCKEyrukjzN8VxvsW+WvMZlyKdt+n/GFvJiHgxlp2artt3/
 Njf0ZOYX9M2wckQcB5DlmlcIS7Ohg3nbBJnWA3zD9GdFIuRtP11hqsjs100njtEvVxMh
 spWHEsFshgMuTSCYEobJke+8DhF1IoIlPC0G6w2JVTdapbTMWGgSWZdmmWvufRGVzk6j
 p/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dvR09NMMf4PZ1neOM0o3Gmh0k5nrtY9nkMGmznVxYeI=;
 b=jmuazjSGbTYLGHVpfkIJWAax9xceqZn7MvemhooPDrnltL7GBTiMoybY0nU26l2vCd
 xcjFH37e+p6XXI+lTqeTAK15U1YdgYSlSpm75EhSahh5VJIKBUhdTDU15WZd4bz9Pe2a
 WK3H2/er8blMXQbBtPtIWTytecP8NbvfjCFgRl1tvg6f2V0PvQ/ktLqFHvBo3hkLbClk
 T/NURDTYKxA1m3wtU+3Vdq7P6B8GGqD8mlur3jYPEIfNGE3i1nE6khSf7PDt8q7BqSY+
 p32n51r2T3KePvP4QdoNAG6DJ3rhIFIhWEYzcywsu6PiCXX91iK6amGqqlekiyJO/BFW
 L20A==
X-Gm-Message-State: AOAM530BWEIzPTRyAHJOeUgONMTCJREWN/IejxiekRrrQe++wQ17Dxq/
 Nl4ayMiLY7KtBvoZNwmaRusYuamFe/uSfg==
X-Google-Smtp-Source: ABdhPJy4BlaPbnB1HxByl7nK8SYHzpopCU5KJD3uMzbrUajftNL4qpM3DeVyv5eGNEnZKB+MIOx8Gw==
X-Received: by 2002:a5d:4ec4:: with SMTP id s4mr6434617wrv.31.1605731934909;
 Wed, 18 Nov 2020 12:38:54 -0800 (PST)
Received: from kali.home (2a01cb0881b76d00c2afd0dfa851d2b9.ipv6.abo.wanadoo.fr.
 [2a01:cb08:81b7:6d00:c2af:d0df:a851:d2b9])
 by smtp.gmail.com with ESMTPSA id 34sm36508340wrq.27.2020.11.18.12.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 12:38:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Fix build with 64 bits time_t
Date: Wed, 18 Nov 2020 21:38:24 +0100
Message-Id: <20201118203824.1624924-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wr1-x441.google.com
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
Changes v1 -> v2 (after review of Michael S. Tsirkin):
 - Drop define of input_event_{sec,usec} as it is already done in 
   include/standard-headers/linux/input.h

 contrib/vhost-user-input/main.c | 5 ++++-
 hw/input/virtio-input-host.c    | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
index 6020c6f33a..84de1f0b87 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
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


