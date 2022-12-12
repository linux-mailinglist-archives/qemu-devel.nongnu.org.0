Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7994364AB1B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:07:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rrX-00070d-3F; Mon, 12 Dec 2022 18:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrQ-0006yU-H3
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:26 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rrO-00048J-5A
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:05:23 -0500
Received: by mail-ej1-x62f.google.com with SMTP id kw15so32172442ejc.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DvNIR7NTWvgAqT+pGbHdByH0XnAlcZcR6YdbCb672bc=;
 b=XhEUtRcUUXq74uk1YVgRxt0vSwhoxAnAlLnxIbbJfPHrk1g5ovVeXhf1vnD6DDNvW+
 HgfwQoCu0DWrPlaIOZJ3mrlmqpeTtcm/rvB9G/ATzXcAb7De1Cqh08SNIKOz0Bbl1nzO
 o3g8xb82FeEm8kjtG44iXgD0GWuA8CZ0qg0u6Tx0WMuFYrAbMDAoCa3/TJRNk5njlxes
 sUPVihm0TUIjZFG4hhMAyNeGjJnlRmfH6x4OCHL1fxdQzd6IGA9/vg57Kq94pxcxRj+e
 2uLBQNsmt3u0pRfybj0oXGxHqNDdcVJCJ8ul7yTSKVyBLybeYp6Wt3fIi9hMnkzHhQNi
 9BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DvNIR7NTWvgAqT+pGbHdByH0XnAlcZcR6YdbCb672bc=;
 b=nM2FYH/15vawWOpCom4xBsDEMtdXeb0qGBA5PIyKRQutgClKGqmQykG1vq7kxHwJNf
 lnmj6wgphaRblLxQW3kpE0Tj9GF5kRrO0580LZ1rlnOpUvqRhxSlagktj0OcRrGMiiGA
 pF+8kbmw1cooT4SslhSKn+Dk5azbOYz74QfN5ZXlY60S6+IrElK9hewZu2O8FBNQf1TP
 Z9ca8eTp9patCLcioSwl23lCAq8AyrKuEnWUMduzjFIFdEjt+2w28zaj+w4e12vrRHbM
 2RwUVuMFgPnhYm3bEMto6Wbwf+KU3wzHf0AtF82/JpRI40k+cdguCs+G0uj8SQTItRVF
 w6kA==
X-Gm-Message-State: ANoB5pkdgNwsBFqbTPPqC1CXGLiaqYPzBMZh8XhzQDxlDizi/ErSKgnQ
 MI5BjqlVmZV6IL64q0jWGk46r1XFrCVHYSRcPis=
X-Google-Smtp-Source: AA0mqf6sxXJweYKR9XzxgGU69NCrak+3t8BQtQMjIdGt54Hvfjm5h0I7GlQQVOrj+3/aZA6CroZshg==
X-Received: by 2002:a17:906:79d7:b0:7bb:7d69:da90 with SMTP id
 m23-20020a17090679d700b007bb7d69da90mr14754282ejo.31.1670886320095; 
 Mon, 12 Dec 2022 15:05:20 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b007bd28b50305sm3699223ejg.200.2022.12.12.15.05.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:05:19 -0800 (PST)
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
Subject: [RFC PATCH-for-8.0 00/10] hw/virtio: Build most objects as target
 independent units
Date: Tue, 13 Dec 2022 00:05:07 +0100
Message-Id: <20221212230517.28872-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently the inlined virtio_access_is_big_endian() function
"hw/virtio/virtio-access.h" which is used by all I/O accesses
force any virtio device to be built as target-dependent object.

This series isolates the few VirtIO target specific bits, trying
to not impact the performance (a function is un-inlined once
not in the hot path).

At the end only 6 files remain in the target specific source set,
all other files are built once.

On a Linux/x86_64 host when building QEMU configured with
--disable-user, before this series a "make clean all" builds
7713 objects, after it only build 6831... I don't think my maths
are correct, because that would save building a few hundreds objects.

RFC because only build-tested.

Regards,

Phil.

Philippe Mathieu-Daudé (10):
  hw/virtio: Add missing "hw/core/cpu.h" include
  hw/virtio: Rename virtio_ss[] -> specific_virtio_ss[]
  hw/virtio: Constify qmp_virtio_feature_map_t[]
  hw/virtio: Extract config read/write accessors to virtio-config.c
  hw/virtio: Extract QMP related code virtio-qmp.c
  hw/virtio: Cache access_is_big_endian value in VirtIODevice state
  hw/virtio: Directly access cached VirtIODevice::access_is_big_endian
  hw/virtio: Un-inline virtio_access_is_big_endian()
  hw/virtio: Extract vhost_user_ram_slots_max() to vhost-user-target.c
  hw/virtio: Make most of virtio devices target-independent

 hw/9pfs/meson.build               |   2 +-
 hw/block/dataplane/meson.build    |   2 +-
 hw/block/meson.build              |   4 +-
 hw/char/meson.build               |   2 +-
 hw/net/meson.build                |   2 +-
 hw/virtio/meson.build             |  45 +-
 hw/virtio/vhost-user-target.c     |  29 ++
 hw/virtio/vhost-user.c            |  26 +-
 hw/virtio/virtio-config.c         | 224 +++++++++
 hw/virtio/virtio-qmp.c            | 631 +++++++++++++++++++++++
 hw/virtio/virtio-qmp.h            |  20 +
 hw/virtio/virtio.c                | 799 +-----------------------------
 include/hw/virtio/vhost-user.h    |   7 +
 include/hw/virtio/virtio-access.h |  63 +--
 include/hw/virtio/virtio.h        |   1 +
 15 files changed, 974 insertions(+), 883 deletions(-)
 create mode 100644 hw/virtio/vhost-user-target.c
 create mode 100644 hw/virtio/virtio-config.c
 create mode 100644 hw/virtio/virtio-qmp.c
 create mode 100644 hw/virtio/virtio-qmp.h

-- 
2.38.1


