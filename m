Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00212581A48
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:26:04 +0200 (CEST)
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQBv-0000V1-Vd
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ83-0003F7-RX
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:05 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ81-0002J0-3R
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:02 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso6141019wma.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kIauFkEBziEhsZfmDYmqUoKaLQlqvxSrwk3Mtb6urFc=;
 b=CPInlFtb/85r3ZO40q/xNOn/CdDUM4g0YYOTXgUknWgnTURFYwi+OvC2WwvbyKNbBu
 n3K9eATd/2S/cMZwUhjFQYDGdfRG7PXS7R/x9G2DuJaYu6MAKIuHi7HTVFKfrSa0p0yP
 71ynElwzzRAPg84dNAOkUDNY5+PW+hFzH+NtX1DpnWkLg/gienInDvYVuRh5w4yGtNj5
 ay9YkfdAZ2/dVfBX+XWB70zdvvhfHd2EC/N2xIDDE2Hgc3hXm1Szug50XW41VpKnOifW
 qb/ndMQuwAwkLgkT8SV0+Xi3N2xHgSJC+Eo4nEBP/lba9YtoJy0rgulVHaY9g68dobOK
 LGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kIauFkEBziEhsZfmDYmqUoKaLQlqvxSrwk3Mtb6urFc=;
 b=oS8WDR8KjD7d2O0JHxW9Yx6lOkPxlZDQP9cCLc8+jsxIgu46sz/PvEdRa21yaVqfBr
 IdAYhiWM7Np+vfnruy8FtwBu3B5Dg+d3COeYNrmV3inHpshuXPhQEGDY2j9NCQBOLkKD
 kfQtE8rgBid8pPMeh1UAZnryuLA0bGp2Vb1XIziw+/xP45GqDOqXWZsW9LkGGILPFPl+
 9NwUIfORfCuGtCZgcrPaCS4knqhszcEwkfosNhq44dxFvbV3xpQ9nBLqG6umAHA7RQ30
 +YlwU6ceiwazviwYSZ9UhiDo9s8+b6u4w0VWvsKyONmPiOKj8XU87Hyx8tkDeGIoGDLP
 WRpw==
X-Gm-Message-State: AJIora9cGDFPpV56gO7NGBUKKOIbJEzhosVdAO5s+3MiFOSBemrhwXrv
 StcNLPeuCbPV0HJqrz9By9B2bQ==
X-Google-Smtp-Source: AGRyM1s9YByjn5KoOj2iw8/CbmgG+/WfPSn8ESd0wtaN+D8muVBXAF3RSf15A1XN5J2FRLZQMeTunA==
X-Received: by 2002:a7b:ce8a:0:b0:3a3:1181:20ae with SMTP id
 q10-20020a7bce8a000000b003a3118120aemr456964wmj.96.1658863318849; 
 Tue, 26 Jul 2022 12:21:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n124-20020a1c2782000000b003a2c67aa6c0sm21414582wmn.23.2022.07.26.12.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACE791FFBC;
 Tue, 26 Jul 2022 20:21:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 04/21] hw/virtio: log potentially buggy guest drivers
Date: Tue, 26 Jul 2022 20:21:33 +0100
Message-Id: <20220726192150.2435175-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the guest driver attempts to use the UNUSED(30) bit it is
potentially buggy as 6.3 Legacy Interface: Reserved Feature Bits
states it "SHOULD NOT be negotiated". For now just log this guest
error.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/virtio/virtio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..97a6307c0f 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2980,6 +2980,13 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
     if (vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) {
         return -EINVAL;
     }
+
+    if (val & (1ull << VIRTIO_F_BAD_FEATURE)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: guest driver for %s has enabled UNUSED(30) feature bit!\n",
+                      __func__, vdev->name);
+    }
+
     ret = virtio_set_features_nocheck(vdev, val);
     if (virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
         /* VIRTIO_RING_F_EVENT_IDX changes the size of the caches.  */
-- 
2.30.2


