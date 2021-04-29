Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B7636EAAE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:41:18 +0200 (CEST)
Received: from localhost ([::1]:40236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5yn-0001gW-3q
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5RA-0008HF-8L
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:32 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5R8-0000iZ-65
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:31 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 k3-20020a17090ad083b0290155b934a295so4400059pju.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eReMX3ANhPPMjJr7QmiwEhWO8N+Y9+guNfcwperYoeo=;
 b=hatChg4kM/gL/dGvlfu8MPV3dxnT26FDScRi+1R+PwH4mcZlqlIYML/tlEFRHFGd8H
 0KU4cpKPyFIixjFUusMSk0IIZEo6TwDARjx7GPvTQEQntldONjTZhYioALlw6XwCqZWX
 yaOdc7SqgOBPLGsjupDWpiWnx/siY1slCkLNTaBwNU0ueDbYev31RqyOjyeFvBarVAV7
 nJDDfqPP0j8peP8t4WcrM4dCiCpJhLlaU3ttW8fIlAcdYjVsMY4VdxwqS9A33WDKqz1C
 3zFr4eRb4hXBFk9E3VxzvnFazW+VqHsVjru8ohsgMvAhJAaC87/LRmokRrYe+ze+UlUf
 sktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eReMX3ANhPPMjJr7QmiwEhWO8N+Y9+guNfcwperYoeo=;
 b=hujmQPXJEbY3BrnDsaH7H2Pc4JHQ/UOaHNv7y8352TFMS4iPZAVBFZ3cfeSiLwfS5H
 wD9VVL8VaIRYHp32gFldUMDI/2M2GmTJtQETsP3yv7Zz2IJfJZx372RMHP4Q0X0JzDmb
 WqCHTk9byF6Qs1YvI/eHt0fCrjcO53UDstSZWIG5iTlULplTRPQ/SRuN/9Tafk/7a9Y4
 qkKmTKQfBaiDUsQ0ziYD5CyJ+a8eYV4lF9h6ZZan6MDepnLLyDKFtpct2A7Z1//9I4lv
 n7EP013jyO7bJz/gHq+LAi8yMt6nfdyvP3slYqkwiM6DK5jqgH0MVOj6PrlXNLTmBhFB
 wu/w==
X-Gm-Message-State: AOAM531Y6nX9qff8BltFWq3/+telq6xaUbOsOBLG/tzR8+LuUOAIdqgC
 55gVdsKTgA7BsQ/GL60FIo4=
X-Google-Smtp-Source: ABdhPJzkW3wg3Z9YRJbWuP1dHUioClC5IwzrUSZjOfNcAU7y3emvB6cfhZNFXDmJf90MgElwZXEnTg==
X-Received: by 2002:a17:90a:ba16:: with SMTP id s22mr62380pjr.12.1619697988907; 
 Thu, 29 Apr 2021 05:06:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:06:28 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 23/27] virtio-snd: Replaced goto with if else
Date: Thu, 29 Apr 2021 17:34:41 +0530
Message-Id: <20210429120445.694420-24-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removed goto from the ctrl vq handler and added an if else
branch for error handling.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index 56e07a41f8..5f12375d95 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -862,7 +862,7 @@ static uint32_t virtio_snd_handle_pcm_release(VirtIOSound *s,
 static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOSound *s = VIRTIO_SOUND(vdev);
-    virtio_snd_hdr ctrl;
+    virtio_snd_hdr ctrl, resp;
 
     VirtQueueElement *elem = NULL;
     size_t sz;
@@ -874,7 +874,7 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         if (!elem) {
             break;
         }
-        if (iov_size(elem->in_sg, elem->in_num) < sizeof(ctrl) ||
+        if (iov_size(elem->in_sg, elem->in_num) < sizeof(resp) ||
                 iov_size(elem->out_sg, elem->out_num) < sizeof(ctrl)) {
             virtio_snd_err("virtio-snd ctrl missing headers\n");
             virtqueue_detach_element(vq, elem, 0);
@@ -890,40 +890,34 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         if (sz != sizeof(ctrl)) {
             /* error */
             virtio_snd_err("virtio snd ctrl could not read header\n");
+            resp.code = VIRTIO_SND_S_BAD_MSG;
         } else if (ctrl.code == VIRTIO_SND_R_JACK_INFO) {
             sz = virtio_snd_handle_jack_info(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_JACK_REMAP) {
             sz = virtio_snd_handle_jack_remap(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_INFO) {
             sz = virtio_snd_handle_pcm_info(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_SET_PARAMS) {
             sz = virtio_snd_handle_pcm_set_params(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_PREPARE) {
             sz = virtio_snd_handle_pcm_prepare(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_START) {
             sz = virtio_snd_handle_pcm_start(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_STOP) {
             sz = virtio_snd_handle_pcm_stop(s, elem);
-            goto done;
         } else if (ctrl.code == VIRTIO_SND_R_PCM_RELEASE) {
             sz = virtio_snd_handle_pcm_release(s, elem);
-            goto done;
         } else {
             /* error */
             virtio_snd_err("virtio snd header not recognized: %d\n", ctrl.code);
+            resp.code = VIRTIO_SND_S_BAD_MSG;
         }
 
-        virtio_snd_hdr resp;
-        resp.code = VIRTIO_SND_S_OK;
-        sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
+        if (resp.code == VIRTIO_SND_S_BAD_MSG) {
+            sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp,
+                              sizeof(resp));
+        }
 
-done:
         virtqueue_push(vq, elem, sz);
         virtio_notify(vdev, vq);
         g_free(iov2);
-- 
2.25.1


