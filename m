Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF795587A4B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:07:02 +0200 (CEST)
Received: from localhost ([::1]:50048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIonl-0001aS-OK
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXq-0001Rr-2i
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXn-0002W3-Jw
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id j1so8785053wrw.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FCj/56VzmS3/60OSoLTpgej5xNapP0emctIC1iwkYIU=;
 b=bFxJ3qwOb707nKyR4nNIQLKNKeQQR1+viFQR0dAVqlfiZY6ZGPAvUXTUppLVzqt1uE
 M1xsMXqeIEk7gLT8layS+87an46D+Ipx+oA3lgvDSDzixyYyrnw4hokeDA25e8ZpyJni
 XvU9PhJZR1ZopZpumVLwwD2/fjdskEoZFEoghBeaioEQupisUytFnj6FPtJsx2KV2Lm7
 CBOKTlpGGVJd5sbbSGPFQJWbwzZmVxFI6mkmKWw9uUA4ijPPhMk9wKTjyinnzsqEpa0S
 FnsU5BzbkWUqDV1TJu1PBxUJmVa+dAFzAI9yPqcmLwhqopys2YfsBtjXDLAXa1h3VZSf
 b/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FCj/56VzmS3/60OSoLTpgej5xNapP0emctIC1iwkYIU=;
 b=Xgy4rCn6Q5KT2aTCjuG6PtxYIX/zp/q0FyO+ARBwkN72qXx0JytzL1ibJXXZnJPJqt
 jn0o6z2EGKqlwN0kS62I1q3UhkE2KdK8/2lgFpbOpkpv4/lrcxzzx9lNfOI4bC03TfWI
 +RGl9eZBM+wVBL1ZFuw0aqvLfX1iK8gdmWK6KpTCB6/NyWmf/3QASe+z93pFodHtzve8
 7tgn0bK3JouT89XKzUx68m+Lzw2FgqZUNSGjE95l6Vcvb3IFXY3j80Q9GzssiPC70xd4
 Jl7hR+zvEUVZlx7BxjWJhj6gkOOFJxpzyNkq+dbEyAw47w/x+P9tF7BktVxp1Hl08FtQ
 ez3g==
X-Gm-Message-State: ACgBeo0lV7+1NNoYk29ye/ZrXpbfo4DdbIJ+i9rqwZOeXJmTZJNRtU5h
 65uzRvTfCx4h2ywWPXrt6mG0Uw==
X-Google-Smtp-Source: AA6agR66Ny/0zKkhcq8f7h1JtU/iKYT+19OgV2JzeP8cSJ4o7YLp+UeciK4997EDEBtmcGX2qXfHEg==
X-Received: by 2002:adf:e10a:0:b0:21e:47f4:6a51 with SMTP id
 t10-20020adfe10a000000b0021e47f46a51mr12948639wrz.276.1659433830316; 
 Tue, 02 Aug 2022 02:50:30 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a5d6043000000b0021efc75914esm14785094wrt.79.2022.08.02.02.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4FEB01FFC0;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH  v4 08/22] hw/virtio: log potentially buggy guest drivers
Date: Tue,  2 Aug 2022 10:49:56 +0100
Message-Id: <20220802095010.3330793-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Acked-by: Jason Wang <jasowang@redhat.com>
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


