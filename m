Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDFA36EA38
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:18:45 +0200 (CEST)
Received: from localhost ([::1]:50726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5cy-0007lp-8Z
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5Qf-0007rR-Ld
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:01 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QZ-0000UD-DE
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:06:01 -0400
Received: by mail-pg1-x52f.google.com with SMTP id q10so46972783pgj.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8nv2yvyvuYnzapvFj9RI6LUgJYktalhrXkUmoXfxiI=;
 b=YlmDbPXuIrmmIMe4u00ukxM3Y5wrrmFC6vMQP4KSNfPDhK/MIr0mK+0m64Q1GWNkC6
 +M5bLzGLkm/WRsVCdv55pkbFfARFffBg//b517I3l6cT8ikafnsGuXT48CmJHh2uVaEi
 +ACItcRp+RwQQZtCwTRXjZ23c4j+6/2NZFdzx3UDGrCEzz37uyyWVF4siAYwoFaVVMpD
 2pUJik55qeYPL2H5dHqSezyAmCgq30Vct+6WLyfrTYl8OGDbjnUpMjSronB5+uFmgSU3
 do8EqyUE+7167iJYTxn+aokSxVRzlmijN2K+JI9dphVusjds4WdClrgG/VJBqqF3P7Ky
 qpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8nv2yvyvuYnzapvFj9RI6LUgJYktalhrXkUmoXfxiI=;
 b=T9kVfwEC4CxoZhpBPq0zVtfsYy6USdDXn3EMxuK1uFlCvZ7YEW6g115+FjSiGCFPSP
 cXeSJtnxrt6/yQnEM0oKz59ndBIY1lanzSbm9HVYmZuknVAb5h0dc4KmpoOTF51VyelA
 mC8xpKHvNqvaBSLw4G4m31OXK3mGWQDOhh/we28FKw5g/igq0DkLMoTXjAlyC/qJbWwh
 hInyXsrXCctbceahjRhN7RaAWBtxL+ppl8KE9phODgNlE/Z8APraUy+j0SGtYbW3Kz3D
 mdF8rYaJrSxC9iAv6s/e4qVzpqdP0tlD4Q/HrwKmOYVR6rvITzcgRmjcBw3mSv+Zv9FV
 d7lw==
X-Gm-Message-State: AOAM532wKW/h5Fy9OstHSFS4d2ALglD1akxk2I71112t7AqkXC22knJp
 DWZP682fTNMfd4eqhwJlfDg=
X-Google-Smtp-Source: ABdhPJzVcv3172fq3gBSrGzS+d9kx6yrFu1MLlcMK/dr5sWQr5kfZSbR/dUMcCXyox+GtFQC4M7Vxw==
X-Received: by 2002:a63:e443:: with SMTP id i3mr32348790pgk.114.1619697953496; 
 Thu, 29 Apr 2021 05:05:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:52 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 09/27] virtio-snd: Add code for set config function
Date: Thu, 29 Apr 2021 17:34:27 +0530
Message-Id: <20210429120445.694420-10-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x52f.google.com
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
 hw/audio/virtio-snd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
index afa38adee7..edaeffd6b7 100644
--- a/hw/audio/virtio-snd.c
+++ b/hw/audio/virtio-snd.c
@@ -54,6 +54,14 @@ static void virtio_snd_get_config(VirtIODevice *vdev, uint8_t *config)
 
 static void virtio_snd_set_config(VirtIODevice *vdev, const uint8_t *config)
 {
+    VirtIOSound *s = VIRTIO_SOUND(vdev);
+    virtio_snd_config sndcfg;
+
+    memcpy(&sndcfg, config, sizeof(virtio_snd_config));
+
+    memcpy(&s->snd_conf.jacks, &sndcfg.jacks, sizeof(uint32_t));
+    memcpy(&s->snd_conf.streams, &sndcfg.streams, sizeof(uint32_t));
+    memcpy(&s->snd_conf.chmaps, &sndcfg.streams, sizeof(uint32_t));
 }
 
 static const VMStateDescription vmstate_virtio_snd_device = {
-- 
2.25.1


