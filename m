Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D888581A89
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:51:55 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQaw-0003A4-3Z
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ88-0003HN-Li
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:09 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ86-0002MG-6o
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso11898659wma.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dtgiw49DbQeIrzltHG3Fc2GoOsMK1WlBSvR6Tgd5p8o=;
 b=I6++dGXR/r6EXe9HQKIYlBLX+SqqIxoZcw+d+iIfMwVYNxH/NSY9NygXDz8bBeZ0Es
 bfASyqOUHuvZxLxcE9QbCL4FiS807KLVrKpTqgafHNFfHzpOGvHhsRa4z6EY9mWXCVrm
 mGt706UgzQ/xCxXijQ5kyG6CpCQ4f+rNBO60kV2z0yZNveEzWYMJ5cHaPFTUM/IrFzur
 72X+Mo7FVf64po3N3yV7qAgVp/AhSoLCKsRR2FhTVVRXnzEGvdIyffrhXmxtJUIq+YzP
 uvISeaaXkEg1cJWuSYWcetNf6yvMSAXiOjtskWIZZ2VDkJU0EQruugQy8eZxN/tsBycM
 QPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtgiw49DbQeIrzltHG3Fc2GoOsMK1WlBSvR6Tgd5p8o=;
 b=JqO/sa7V4o7bwYgiciNSnrgSUXkFH8imYrX0bvdqUPkUV0QQpz1GYWIhj74AYMKB7f
 LRafd2ppGc0blTHQ6n4LjPhbxJHX0SIPBmU72tHKACTEHQzu/uSw2r47dLxelTChdk08
 Vvbiej9d7q8whmwwDZZlhHemYhvAtY1DSLQAg3JRw+bLhHBgnqUKJL8A9jlow+YY+apc
 21VZwLESg73x7HsHdqqiUI86DrcgZJvAcqnmidoJ7V2mfT8CD0yNDRdRodBhScpiTm1w
 NmBY6Qr2XHxwj4cs61qsbnSkT571sT4d2B81D5g236HBxFLXVKb7KkYPYghM+fobCzNz
 BjyQ==
X-Gm-Message-State: AJIora9BS/fJf2/IeIUjdrFy8UB7ROGPpr7wPsGLXSGMYKoDC3QQhK/E
 Ni1I8qc/TLHnrKrNasKUNtcr7g==
X-Google-Smtp-Source: AGRyM1tbIhT5QzrdEnJ49sSvrDLcNqnJT4ba9qMgOpgoC8K8n38uBBDrWtL9/Bxb9tyP7mlHns8VfQ==
X-Received: by 2002:a05:600c:3546:b0:3a3:2df8:42c9 with SMTP id
 i6-20020a05600c354600b003a32df842c9mr429614wmq.161.1658863324857; 
 Tue, 26 Jul 2022 12:22:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a17ab4e7c8sm27433520wmp.39.2022.07.26.12.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:21:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F347A1FFC0;
 Tue, 26 Jul 2022 20:21:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 08/21] hw/virtio: handle un-configured shutdown in
 virtio-pci
Date: Tue, 26 Jul 2022 20:21:37 +0100
Message-Id: <20220726192150.2435175-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

The assert() protecting against leakage is a little aggressive and
causes needless crashes if a device is shutdown without having been
configured. In this case no descriptors are lost because none have
been assigned.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/virtio/virtio-pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0b31..5ce61f9b45 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -996,9 +996,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
 
     nvqs = MIN(nvqs, VIRTIO_QUEUE_MAX);
 
-    /* When deassigning, pass a consistent nvqs value
-     * to avoid leaking notifiers.
+    /*
+     * When deassigning, pass a consistent nvqs value to avoid leaking
+     * notifiers. But first check we've actually been configured, exit
+     * early if we haven't.
      */
+    if (!assign && !proxy->nvqs_with_notifiers) {
+        return 0;
+    }
     assert(assign || nvqs == proxy->nvqs_with_notifiers);
 
     proxy->nvqs_with_notifiers = nvqs;
-- 
2.30.2


