Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D04A36EA42
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:24:32 +0200 (CEST)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5iZ-0003Q8-8p
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qf-0007qc-Dw
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:01 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QX-0000Sl-7U
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:01 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 20so30676687pll.7
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlYr5NYk+qncXJMOq+DUj3BiufxdWsLefx4rmBqrZwE=;
 b=R5BTukv+Cb6RhsvQubCEnNr/sEGGUfhDS6dAaz2YRz3y1bocXbqxwR9e+5reEzv2k3
 naA4tuUGpHze1AtHl1HE4oiT+TCXOJmo4vbxE+MBmHGtTw1sjMDazEiTlZXP0aSO7RqC
 fAp7VCkhrEHLH1YmZ9IEpYdAT/l665NA6nE7xDRTHm7V9uAidtbfLyDaAr8BSYLkSDIX
 jCtsOciWP3yyjuCVQ2ncz8cYptKlsgcDb8/2J9+n6Ze+djL8tt5JFyh+JPceG3gnIYkg
 yFXqy1lRJ7W0It7OFBhUdtv2/KIq+TdNzf4BzWqi4h1fvo9h12x6SoVnP3zL11c1GORK
 IfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlYr5NYk+qncXJMOq+DUj3BiufxdWsLefx4rmBqrZwE=;
 b=EuNrvxhKxcs5WyBeShZJnHxd60OfaVpgDhNIUH+aKhHH/sXvEJ6sCUIlrQPPlZE0XD
 Vetay0m/Ys4LmWT+7gYJAmZ2OrWV6DBT3o9QDG7jxhBICxbfd9KcA5f5X67m3pWzHfil
 twW9zT4bXpX2nbIxe5joi35g7busg1v30tlFiIUX4VverFwPdEKegZnnDhC+l+98BJqh
 xaV4lnopubD8v4458d64fgdlpAsPujif6jG4ABVrqlmWOzU4l/cViuRmAXNaKipiY0kQ
 DwJAtGT96kJUNab8GdBkq4+g0EAFpD1We7oYa9PmA18NTyjusMvqmAHo/CdzRia98eQc
 Iu0A==
X-Gm-Message-State: AOAM530ffv+DKy6sJMV7xIbnmGTHD3vzVm338wzf3ebrjJ8xX8l3eKlY
 /CCl1nHw/6MoRV5DKFrwEAw=
X-Google-Smtp-Source: ABdhPJw+tLohaHSk2tQLHQ8VZCoBMVPUTB+krrq8+vbRK4VV18pjyYcp+bRSgFswjiIWoTpJ6WlUsg==
X-Received: by 2002:a17:90b:14c9:: with SMTP id
 jz9mr4273675pjb.156.1619697950768; 
 Thu, 29 Apr 2021 05:05:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:50 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 08/27] virtio-snd: Add code for get config function
Date: Thu, 29 Apr 2021 17:34:26 +0530
Message-Id: <20210429120445.694420-9-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x62d.google.com
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

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 hw/audio/virtio-snd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index ae438aa7ec..afa38adee7 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -41,6 +41,15 @@
 
 static void virtio_snd_get_config(VirtIODevice *vdev, uint8_t *config)
 {
+    VirtIOSound *s = VIRTIO_SOUND(vdev);
+    virtio_snd_config sndcfg;
+
+    memset(&sndcfg, 0, sizeof(virtio_snd_config));
+    stl_le_p(&(sndcfg.jacks), s->snd_conf.jacks);
+    stl_le_p(&(sndcfg.streams), s->snd_conf.streams);
+    stl_le_p(&(sndcfg.chmaps), s->snd_conf.chmaps);
+
+    memcpy(config, &sndcfg, sizeof(virtio_snd_config));
 }
 
 static void virtio_snd_set_config(VirtIODevice *vdev, const uint8_t *config)
-- 
2.25.1


