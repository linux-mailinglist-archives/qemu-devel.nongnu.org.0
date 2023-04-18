Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE516E6957
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:22:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5S-0006ks-DW; Tue, 18 Apr 2023 12:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5Q-0006jl-FG
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5O-00019l-It
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 a8-20020a05600c348800b003f17ddb04e3so78190wmq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834901; x=1684426901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5lUakfgj7bHmml2pB9qRm9X+2uzhwj9Z43jrFiMKuUs=;
 b=sNwN5GM215cHic7A4Xs+MSOgmAjeHBJqnN4WsRNV6Z/nyjF5zDcSY9YqRy+vo/hubt
 GjiaK5aHQS8WYAbSLUSChebbGmImafadNYrajmfigwiEv1F9L94+5seDUqBqxrmeA382
 9822+z+rC5kWflHOsPG8G1AV23RPZjfsxuzAgfhU07CyN05scD0eLD4tbjqShCwwXbOH
 Lwt0/+nH2ynIQzlbrX82UlpXlru1qmLabISEX1sBVore2D/VJXJ3qcRyIXZJDf53OQxk
 kCYJ9asTIaE58iy+0VLSRcKpooRqh/xxX7rg3kTYiDAtgcBeV0NSQ30bq1LJnBekV5ln
 IwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834901; x=1684426901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5lUakfgj7bHmml2pB9qRm9X+2uzhwj9Z43jrFiMKuUs=;
 b=NIP/fsC80DBgf8N9+NOlcY5K41TPWZ+uKHE5QFhW7tiVrSoD81II7lXqVT/6FlWKDP
 cxsCRDgeIK8kTbDYkZyQNV19HpujPqB8hXELMFbrM17fNGrCJATdx8iREWAtBzy5l2Fc
 lS7UaRPdmrPjmvXhYGkvQpUVqmbkcUw9UZGutbiDo5EVk/G3ayooRB8VQNb6QOvClsxx
 pjR+S4201B2DhG9MBfAwcu1YIowkPTe17BdCgMCteS3fQt1p2BNlmABOCwYhMxF955N/
 4aYtKmNkceS8H8JtouFaOahpixbuTFye0iQbw4wotfnTNSLm/DEqpT4br4DdOpcZljyQ
 Zg8Q==
X-Gm-Message-State: AAQBX9dG5nmj/qif9H0VgHq2O5J2JeAHVhg0g0AAASLqQta5AH+AIxUw
 y0H9bEQeFW1cy+XG3vNuxaE9Yw==
X-Google-Smtp-Source: AKy350aozYqGUHxK9FLQwu0pE5q2SYyclKqiEeFGAnMFc2N7FQHJhzcJlDzXN5No4gSeWPPolrRIqA==
X-Received: by 2002:a05:600c:2048:b0:3ef:6819:b2ad with SMTP id
 p8-20020a05600c204800b003ef6819b2admr13778559wmg.37.1681834901137; 
 Tue, 18 Apr 2023 09:21:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a056000115100b002fa6929eb83sm5713826wrx.21.2023.04.18.09.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27F081FFB7;
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
Subject: [PATCH v2 00/13] virtio: add vhost-user-generic and reduce copy and
 paste
Date: Tue, 18 Apr 2023 17:21:27 +0100
Message-Id: <20230418162140.373219-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

A lot of our vhost-user stubs are large chunks of boilerplate that do
(mostly) the same thing. This series attempts to fix that by defining
a new base class (vhost-user-base) which is used by a generic
vhost-user-device implementation. Then the rng, gpio and i2c
vhost-user devices become simple specialisations of the common base
defining the ID, number of queues and potentially the config handling.

In theory we could convert the rest of the vhost-user stubs but there
are complications caused by the config being split between the daemon
and QEMU. For example:

 -device vhost-user-device-pci,chardev=vus,virtio-id=8,num_vqs=3,config_size=36

works with the WIP vhost-user-scsi backend:

  https://github.com/rust-vmm/vhost-device/pull/301

but the concrete vhost-user-scsi-pci device fails because it expects
to handle config via the command line. You will see the report:

  qemu-system-aarch64: -device vhost-user-scsi-pci,chardev=vus:
  warning: vhost-user backend supports VHOST_USER_PROTOCOL_F_CONFIG
  but QEMU does not.

if you try. We could make the device a bit smarter but then we would
need to untangle the vhost_scsi_common_() logic which is shared with
the pure in kernel vhost implementation. The vhost-user-vsock stub
might be another one worth re-factoring although that has a similar
split architecture.

The overall diffstat shows a net deletion of code as well as
introducing some more documentation and moving the stubs into the
common build, further reducing redundancy.

Next Steps
----------

From Stefan's last email to the v1 posting we need:

vhost-user needs:
- A GET_DEVICE_ID message.
- A GET_CONFIG_SIZE message. Today it is assumed that the vhost-user
  frontend already knows the configuration space size.
- A protocol feature bit indicating that the device is a full VIRTIO
  device. These devices also need to implement the SET_STATUS message,
  which is rarely implemented today.

and implementing the VHOST_USER_GET_QUEUE_NUM and SET_STATUS messages
to make the generic device "self configuring".

Alex.

Alex Bennée (13):
  include: attempt to document device_class_set_props
  include/hw: document the device_class_set_parent_* fns
  hw/virtio: fix typo in VIRTIO_CONFIG_IRQ_IDX comments
  include/hw/virtio: document virtio_notify_config
  include/hw/virtio: add kerneldoc for virtio_init
  include/hw/virtio: document some more usage of notifiers
  virtio: add vhost-user-base and a generic vhost-user-device
  virtio: add PCI stub for vhost-user-device
  hw/virtio: derive vhost-user-rng from vhost-user-device
  hw/virtio: add config support to vhost-user-device
  hw/virtio: derive vhost-user-gpio from vhost-user-device
  hw/virtio: derive vhost-user-i2c from vhost-user-base
  docs/system: add a basic enumeration of vhost-user devices

 docs/system/devices/vhost-user-rng.rst |   2 +
 docs/system/devices/vhost-user.rst     |  41 +++
 include/hw/qdev-core.h                 |  36 +++
 include/hw/virtio/vhost-user-device.h  |  46 +++
 include/hw/virtio/vhost-user-gpio.h    |  23 +-
 include/hw/virtio/vhost-user-i2c.h     |  18 +-
 include/hw/virtio/vhost-user-rng.h     |  11 +-
 include/hw/virtio/virtio.h             |  21 ++
 hw/display/vhost-user-gpu.c            |   4 +-
 hw/net/virtio-net.c                    |   4 +-
 hw/virtio/vhost-user-device-pci.c      |  71 +++++
 hw/virtio/vhost-user-device.c          | 380 +++++++++++++++++++++++
 hw/virtio/vhost-user-fs.c              |   4 +-
 hw/virtio/vhost-user-gpio.c            | 400 ++-----------------------
 hw/virtio/vhost-user-i2c.c             | 255 +---------------
 hw/virtio/vhost-user-rng.c             | 277 ++---------------
 hw/virtio/vhost-vsock-common.c         |   4 +-
 hw/virtio/virtio-crypto.c              |   4 +-
 hw/virtio/meson.build                  |  20 +-
 19 files changed, 686 insertions(+), 935 deletions(-)
 create mode 100644 include/hw/virtio/vhost-user-device.h
 create mode 100644 hw/virtio/vhost-user-device-pci.c
 create mode 100644 hw/virtio/vhost-user-device.c

-- 
2.39.2


