Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0778D64AB2A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:09:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rs1-0007DX-Ud; Mon, 12 Dec 2022 18:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rry-0007CR-Nu
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:58 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrw-0004L2-M6
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:58 -0500
Received: by mail-ej1-x631.google.com with SMTP id fc4so32145965ejc.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PAyoKSmpc73U7mUWxcH2rj9U96WCObqWKu1vwMAguEE=;
 b=M7hh+zs9v02qZwg/pfWXdnWzzvrZNH2j/X6uglqm0f5Mbry+iVIX5OAQfhJI42Qjy2
 ITmNkWMigM6d0d2iEBI47GUCIblbtTFYGstxi+HcH/FjoRrsy6/RqEXyDkGjGZ6opeLQ
 5xcvsqk0bwJA0+EGM7wVyForB5chbxCrhPuckOYUDd1luK5fkpfrYzSEAQ9E9c0XPt7u
 sxs3Sb0bONTpdLOXVYtlb5K6pbfTQnomhL6iAEcCiAGkBfIyu30JKsjjAUlsD3O5vZ2z
 8P1qu8sBUx4JwCZAyS5gCy3M/K/+S2KBac+gnpsNBb8JLoWf+VA9l+ZotRqMBI+2IUyV
 XBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAyoKSmpc73U7mUWxcH2rj9U96WCObqWKu1vwMAguEE=;
 b=xj/gJ6EW6z9PK5b+pkkdmvAruLpJUJjbHkeKDvSim3Jrhndps6vxvasL/R+RcvlBjt
 Vi6ttymXMNgjTCsWGD5PuGuWOxHtt0SwLwmLd9tbcnrD4+H2Cp1lFFj0NYx7rthmv8Xk
 XL1oWKOrptQetWXb7OD0FNLLdHqgxYWyZJe7+lK5DCBGDOUXaqYjbG5INZwBAcilRsaI
 3djxmFFZoFEOE8NIUGIV+ZIc67i7uloR9iQ/Ac4FmPXPphkuypl+6Qy6yQQcpGCvLf0C
 D2SJG0NJ9LqcAFgenqPSlWXg/XMVpHD9HEAWdcPXxqcoxJxr/CaW2SFj1a8dQ+nyb9iY
 8dbg==
X-Gm-Message-State: ANoB5pmwvNmFdQkrEgh+WVPCBtuYUcWIwSqUBCdesrBZ30+6dsU0ni+I
 AYtMmX4ka7BxiSOplcpHSAgEvBI1cM2ysaPMjh8=
X-Google-Smtp-Source: AA0mqf7YSq4Vh2xDvJUHoakJAyA9vgeMYuehzt3g3Gjuk7jNEz/hAEtQKtu45Z8bHHSgecR8pjzduQ==
X-Received: by 2002:a17:906:fa14:b0:7c0:c5b3:cb49 with SMTP id
 lo20-20020a170906fa1400b007c0c5b3cb49mr13813017ejb.31.1670886353931; 
 Mon, 12 Dec 2022 15:05:53 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1709063d2200b0077a8fa8ba55sm3793229ejf.210.2022.12.12.15.05.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:05:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 06/10] hw/virtio: Cache access_is_big_endian value
 in VirtIODevice state
Date: Tue, 13 Dec 2022 00:05:13 +0100
Message-Id: <20221212230517.28872-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212230517.28872-1-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The device endianness doesn't change during runtime.
Cache it in the VirtIODevice state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: I'm not sure virtio_init() is the correct place to add this
     check. We want to initialize this field once the features are
     negociated.
---
 hw/virtio/virtio.c         | 1 +
 include/hw/virtio/virtio.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 09b1a0e3d9..dbb1fe33f7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3193,6 +3193,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
     vdev->vmstate = qdev_add_vm_change_state_handler(DEVICE(vdev),
             virtio_vmstate_change, vdev);
     vdev->device_endian = virtio_default_endian();
+    vdev->access_is_big_endian = virtio_access_is_big_endian(vdev);
     vdev->use_guest_notifier_mask = true;
 }
 
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index acfd4df125..5f28e51e93 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -130,6 +130,7 @@ struct VirtIODevice
     bool vhost_started;
     VMChangeStateEntry *vmstate;
     char *bus_name;
+    bool access_is_big_endian;
     uint8_t device_endian;
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
-- 
2.38.1


