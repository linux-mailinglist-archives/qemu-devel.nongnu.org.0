Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AB936EA22
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:14:22 +0200 (CEST)
Received: from localhost ([::1]:42398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc5Yi-0004Cz-RA
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QJ-0007Xd-JY
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:39 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lc5QH-0000DX-DI
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:05:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id c19so1294705pfv.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ig1JXhD7v222C44og9xc1xsmm+l6y1xpCVdKjFd1wk=;
 b=uEQ6j+Eji63Nkp/Foouz7M9kbFrqEN5nZdqd/VzTp9SaA+ohXu4B55S7oJQtk1IvLY
 1AaNdRrdARquvsRbqo5m/NjWkAMkuEbEyajLTJpfRmUwgFyspYiF4HYrfyppSr4otiPp
 50hOizE01CrYbetw+dIUmJ86m1jxMR6bUa54NgDA38v1rhFaq2WO6mLiSlTV2aPUKMAP
 IULfsz+eheBJhazpKYFP+ZkKFUje/1g8GYaxBdHUj6xI5vruukdyhrpGyUq2JzNbG7zq
 Z+JlUG1XRIJqfmM5a9mTjQBxy+LY2fuzxJ1C01LXcHix7D32aqOtsrCgW4ABrW4Q1XLZ
 VJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ig1JXhD7v222C44og9xc1xsmm+l6y1xpCVdKjFd1wk=;
 b=emoLyEGZ4+c69IPbH7PPahq7egcvwh350qaX90PlMu/zJgWcslBC9EVS88EMqrzmXd
 qLIJI1yZUTk00yGE8OccpoOnkhRgejXDMvslScUMxeBcdou183jCFJh68MnUo2e8BR3q
 YXJKdBGVTPjXRW7xywfgkxMIiCq5v03Ngmi2b8+8XieoGHH0Sz/9E+OhSY8A3SJZ4BR0
 9WulaewB0RvFcvoRn56XAGJRMSAS+SIK5NR34thazI8/Fy+ewJUWOnN528V7s6gFrYeU
 TaFLafHgsGG5jD+jx50dGeGTW7ucBFPUKQJxG2H5H3JkDfxQMv8KT57Z6zui52e1wq/x
 xoFA==
X-Gm-Message-State: AOAM530WVfylJvnDcJ4LVAS3e2W0HnJauMlIT3scqgbVxsKAYlgqqLsX
 bpbzweUl4g0BcraOCGvrUPA=
X-Google-Smtp-Source: ABdhPJxDufT8Hp6JvS9msZ90vmTQksOb8NIXxmezYm3FZd+HLfcvYP25hGYbABS+LB1ZM67sUKAMGQ==
X-Received: by 2002:a63:6f8e:: with SMTP id
 k136mr32876614pgc.326.1619697936151; 
 Thu, 29 Apr 2021 05:05:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6008:61b4:c0b1:be0f:608e:9a45])
 by smtp.gmail.com with ESMTPSA id p6sm713643pjg.35.2021.04.29.05.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:05:35 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH 02/27] virtio-snd: Add jack control structures
Date: Thu, 29 Apr 2021 17:34:20 +0530
Message-Id: <20210429120445.694420-3-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x433.google.com
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

Added structures for handling jack control requests
to the header file.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 include/hw/virtio/virtio-snd.h | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
index bbbf174c51..f58b06a949 100644
--- a/include/hw/virtio/virtio-snd.h
+++ b/include/hw/virtio/virtio-snd.h
@@ -94,4 +94,44 @@ typedef struct virtio_snd_info {
     uint32_t hda_fn_nid;
 } virtio_snd_info;
 
+/* JACK CONTROL MESSAGES */
+
+typedef struct virtio_snd_jack_hdr {
+    /* VIRTIO_SND_R_JACK_* */
+    virtio_snd_hdr hdr;
+    /* 0 to (virtio_snd_config.jacks - 1) */
+    uint32_t jack_id;
+} virtio_snd_jack_hdr;
+
+/* Supported jack features */
+enum {
+    VIRTIO_SND_F_JACK_REMAP = 0
+};
+
+/* jack information structure */
+typedef struct virtio_snd_jack_info {
+    /* common header */
+    virtio_snd_info hdr;
+    /* 1 << VIRTIO_SND_JACK_F_* */
+    uint32_t features;
+    /* pin default configuration from HDA spec */
+    uint32_t hda_reg_defconf;
+    /* pin capabilities from HDA spec */
+    uint32_t hda_reg_caps;
+    /* connection status (0: disconnected, 1: connected) */
+    uint8_t connected;
+
+    uint8_t padding[7];
+} virtio_snd_jack_info;
+
+/* jack remapping control request */
+typedef struct virtio_snd_jack_remap {
+    /* .code = VIRTIO_SND_R_JACK_REMAP */
+    virtio_snd_jack_hdr hdr;
+    /* selected association number */
+    uint32_t association;
+    /* selected sequence number */
+    uint32_t sequence;
+} virtio_snd_jack_remap;
+
 #endif
-- 
2.25.1


