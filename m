Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A16E2805
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:06:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLvC-0006p5-F9; Fri, 14 Apr 2023 12:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLuh-0006Rh-Ue
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:45 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLue-0007yM-7d
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:38 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so10052941wms.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488274; x=1684080274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=upwamrFOWbXpB0LRg3OycRh6xKp0neSg/Tq8ON+G04o=;
 b=HnHCUASrDHmRpFdQnH/kC4fg1J2tS2b3xMJEHXFblVbTy9J5pJ55BSNL882fCPJ8gY
 e/CTewZXgr7dzO7+Rsr9zF+wnuI1yzLrflv6zkz/2owUK+69L8FH/mJKXQFCALXVsSgS
 XnA4FGy8ciRF5Kdy6gdtpkukRGhhdhKJCKZgdMY2zgMlcSPrYf0JhKukHSFKd2UTmn+o
 vNBaykoigtEb1bCLlIn6Jdg1rG2qV1WxfgUxtZaNkwqEvYvTDy3vzyF0vwJWbUfj88D6
 ixTlxutXKhEb44W4Oo30xKEegTtiLJ+eEX09AvfeLJeTs9zCqvYNVOej8ufg61m6miOn
 Mm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488274; x=1684080274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=upwamrFOWbXpB0LRg3OycRh6xKp0neSg/Tq8ON+G04o=;
 b=Kfh/05/DDHFNEeWrf5+dy6QHg71yl5jeViwXy0bLAI1C76zyWeNIcZlzBYTO6RRdn1
 lfR/h9zowazy0il3+ebiOVCb9Wa9Yn9pe9T1YNmilT4STc4IDhJ+MspZgBzi6jYxQKaW
 t7XA0+6TeMLM+rBfjvyAw7xDhWOzkC6V21+j8pdAxY10LwOSKfLtv8B/BTphjXHQPOAN
 q6KsZ8v7adIgOFczNYJSQGhzRBaInwkXEY2ixxDUbrm6j4tt/kqzAPor1RfPxILCGQ96
 PefLC3o73353rEGzkiJwrOPysQy2BAMMr5s6x4koGmoSE7QLL3tiO4B9tOBKDOS+d8bf
 QouA==
X-Gm-Message-State: AAQBX9e1ykDkb/4rdEY9xwu57XJbqEqM79AM62nrez428LwBiacTvn/h
 Un/pGBEcCbosfrUTRB68mr6Bgg==
X-Google-Smtp-Source: AKy350Zl0TQVeIPg65W7k8+L6S2LTxJXy6tuR/9M+e6Y3ty67QFjTtJN62gKuDmRKmyT55qcUYRSGg==
X-Received: by 2002:a7b:c7d6:0:b0:3f0:a9dc:a369 with SMTP id
 z22-20020a7bc7d6000000b003f0a9dca369mr4481439wmk.19.1681488274531; 
 Fri, 14 Apr 2023 09:04:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1c7902000000b003edd1c44b57sm4639009wme.27.2023.04.14.09.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB7691FFB7;
 Fri, 14 Apr 2023 17:04:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 00/12] virtio: add vhost-user-generic and reduce copy and paste
Date: Fri, 14 Apr 2023 17:04:21 +0100
Message-Id: <20230414160433.2096866-1-alex.bennee@linaro.org>
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
a new base class for vhost-user devices and then converting the rng
and gpio devices to be based off them. You can even use
vhost-user-device directly if you supply it with the right magic
numbers (which is helpful for development).

However the final patch runs into the weeds because I don't yet have a
clean way to represent in QOM the fixing of certain properties for the
specialised classes.

The series is a net reduction in code and an increase in
documentation but obviously needs to iron out a few more warts. I'm
open to suggestions on the best way to tweak the QOM stuff.

Alex.

Alex Bennée (12):
  hw/virtio: fix typo in VIRTIO_CONFIG_IRQ_IDX comments
  include/hw/virtio: document virtio_notify_config
  include/hw/virtio: add kerneldoc for virtio_init
  include/hw/virtio: document some more usage of notifiers
  virtio: add generic vhost-user-device
  virtio: add PCI stub for vhost-user-device
  include: attempt to document device_class_set_props
  qom: allow for properties to become "fixed"
  hw/virtio: derive vhost-user-rng from vhost-user-device
  hw/virtio: add config support to vhost-user-device
  hw/virtio: derive vhost-user-gpio from vhost-user-device (!BROKEN)
  docs/system: add a basic enumeration of vhost-user devices

 docs/system/devices/vhost-user-rng.rst |   2 +
 docs/system/devices/vhost-user.rst     |  41 +++
 qapi/qom.json                          |   2 +
 include/hw/qdev-core.h                 |   9 +
 include/hw/virtio/vhost-user-device.h  |  33 ++
 include/hw/virtio/vhost-user-gpio.h    |  23 +-
 include/hw/virtio/vhost-user-rng.h     |  11 +-
 include/hw/virtio/virtio.h             |  21 ++
 include/qom/object.h                   |  16 +-
 hw/display/vhost-user-gpu.c            |   4 +-
 hw/net/virtio-net.c                    |   4 +-
 hw/virtio/vhost-user-device-pci.c      |  71 +++++
 hw/virtio/vhost-user-device.c          | 359 ++++++++++++++++++++++
 hw/virtio/vhost-user-fs.c              |   4 +-
 hw/virtio/vhost-user-gpio.c            | 405 +------------------------
 hw/virtio/vhost-user-rng.c             | 264 +---------------
 hw/virtio/vhost-vsock-common.c         |   4 +-
 hw/virtio/virtio-crypto.c              |   4 +-
 qom/object.c                           |  14 +
 qom/object_interfaces.c                |   9 +-
 qom/qom-qmp-cmds.c                     |   1 +
 softmmu/qdev-monitor.c                 |   1 +
 hw/virtio/meson.build                  |   3 +
 23 files changed, 613 insertions(+), 692 deletions(-)
 create mode 100644 include/hw/virtio/vhost-user-device.h
 create mode 100644 hw/virtio/vhost-user-device-pci.c
 create mode 100644 hw/virtio/vhost-user-device.c

-- 
2.39.2


