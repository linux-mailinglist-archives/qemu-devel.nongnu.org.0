Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BFF6E6964
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:24:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5V-0006ms-SO; Tue, 18 Apr 2023 12:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5S-0006lE-I4
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5R-0001AV-1S
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:46 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so2355641f8f.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834903; x=1684426903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9tB5/chm/xr33XCg/P0FBnvaCeSkgyIRzyFrSzsSo0k=;
 b=uxF/LM8P9SZYpCizN3Zui8qVlBYHD8UmnmrC1P4/cPHgzoMR+6tpEocqtb4OTObdFu
 MkKKQLOd1q0sqZlccxyH79EF8Db7LqSH5t0w6Kz6I1XZaW+wf3uDOiFWRaXBNVT+Sosk
 1fdAurJNSm2ochL9YoawEwmvEVBOBOR73UBembnnlJRi35X+u2AHAbjvX25jWfbtoM7o
 l0tjtL1FEYufZXHPZxvC2aBfP/FDGzY09bo3q6ZCjvzCp0GRuxM/va62LMOY0UN8C2SG
 Clwy3iaEr3rEXPYtcaBYs2rBsHDMhCblSAqmqIGWohtaZZnUJzou1hJ3TDc36wjPmCnl
 K75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834903; x=1684426903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9tB5/chm/xr33XCg/P0FBnvaCeSkgyIRzyFrSzsSo0k=;
 b=RW3YyFijaP8QK5f+W1g7PBHkK3YCERPuFjRfhLiwUTNQjraZtV2RXInXW7YrBYX5AU
 6zlUiS+W27FbeRe2pTvs0imACMg+TXdrFlBPBnScWL6B7u3Yj6qZ0gw7exGHdZjY52kG
 PHdCdkFeFqu34VIbjIWJYnNObKvQZyVVIuF/utQeHofP1DwD5z72i/YAgJsFVXyEE0js
 UWDz8ZVI3aO//0yRDtU/sbR8gNYCduzvghx9uPpqLd04pGG5oy+0X1B2DQptwzOkHcS7
 z26Non4YuiGbyBvob2rrveIFWyk21q47GMDZHt8FLHjPeA2sQ6WW2DbUK1eV3ktaOvCL
 9TPg==
X-Gm-Message-State: AAQBX9f4REPFKQql0e7G5unliSJ+DVxlKmQsa8wiZw/vllWS+CmgLLf+
 +E+urzk189ZfMpPUE5fOJ/y8CQ==
X-Google-Smtp-Source: AKy350ZSbDhPNukuBQYrJAwopH8Us33Dgb44bESVXGoJen8nL+g1bwkAPFnFp56YcBgIWrO3epaPkA==
X-Received: by 2002:adf:ef8b:0:b0:2ef:8c85:771b with SMTP id
 d11-20020adfef8b000000b002ef8c85771bmr2392857wro.51.1681834903650; 
 Tue, 18 Apr 2023 09:21:43 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b002f9ff443184sm6499966wro.24.2023.04.18.09.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD4911FFBD;
 Tue, 18 Apr 2023 17:21:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, virtio-fs@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 05/13] include/hw/virtio: add kerneldoc for virtio_init
Date: Tue, 18 Apr 2023 17:21:32 +0100
Message-Id: <20230418162140.373219-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/virtio.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 22ec098462..1ba7a9dd74 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -217,6 +217,12 @@ struct VirtioDeviceClass {
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
+/**
+ * virtio_init() - initialise the common VirtIODevice structure
+ * @vdev: pointer to VirtIODevice
+ * @device_id: the VirtIO device ID (see virtio_ids.h)
+ * @config_size: size of the config space
+ */
 void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
 
 void virtio_cleanup(VirtIODevice *vdev);
-- 
2.39.2


