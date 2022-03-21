Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8EF4E2C8B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:43:32 +0100 (CET)
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKBv-0008F9-8t
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:43:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzY-0005B9-FP
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:44 -0400
Received: from [2a00:1450:4864:20::631] (port=40657
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzV-0004ex-NZ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:44 -0400
Received: by mail-ej1-x631.google.com with SMTP id p15so30601609ejc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXN89JBOg14b4ZNRrtS85bRX0djWKz21Aw2Nc6SLXB8=;
 b=AzBEKAGYjNsjIUieyPGSxtXWPWuyqxvwialors46lM0rSjKQ9ub52/VvsfRrmcveL3
 ryINSvYHxMJfgaUDmExLJp4gdpL9sIUpRTyFxaLykhKddsn82afObvK8M7StpI79PuOI
 n5s/Ot2YqU9oO0lHjU80Rhv7fd3LZ++vjiWE3PnTJvoNKxI0lmG3b/KWQLO8YaqlsAD6
 TpmmcTGlSq8FMyvAxYkvKOnbR8g1eud7MKg92ujwl1hfvqWHVA5ENuvUvx1IZBR9L7Ev
 p5mBtyJae2DWEllQ1SzW7XI/HYq3e6cyYzkHldoYhtpGKfy0mBIvt/vHUJFHTmwt7ubV
 fONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXN89JBOg14b4ZNRrtS85bRX0djWKz21Aw2Nc6SLXB8=;
 b=eKu6LvzHsyQx7I7f1y9VstUnhOgVbAEEnO8r1AX3wrXXBaDpBG55oAEKVdpHl7fKPb
 3V4H3a2LOEkCkLMecumDXG4Tvguv38T9SKSLnWNs/LEh0rofCgew4qa3oTbWSV4DrO4X
 wlmvIs36HBXwxfr7JwTihQoda9VCYz7BGeGpAD4hT2hVj9LGIfq/X+TmzlOI/cgEWKC9
 +4pkvnfjx28eNUIA8+68mWISYgpJpvOnUTWVaWzjLaA6v6Gxb7rEM9hXgeowGHNn8g7x
 /wd86Hyzye9uQcF5yydcXW3zvGGRFSsw/QPxYIbKv7upkLVo52HUSOBnAQ6WwDWPP4PS
 c6tA==
X-Gm-Message-State: AOAM532jLXNhprjkyA2oSd+IGjV8LH9abGxO1rVx5frP2pblBBsbeEoj
 eOlekHiwGeE4VVAHjloLqj7zOw==
X-Google-Smtp-Source: ABdhPJzTV0huQ/QMfybZM09iuiTzK3H7Zs42/Mcpyc1Y+l9E2fH4vbEP3Rl4t1BB5cPMbY3QzVV3IA==
X-Received: by 2002:a17:906:2a0c:b0:6df:ec76:af8c with SMTP id
 j12-20020a1709062a0c00b006dfec76af8cmr9017012eje.269.1647876639597; 
 Mon, 21 Mar 2022 08:30:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a1709063a0500b006da8fa9526esm7040238eje.178.2022.03.21.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 835A61FFB7;
 Mon, 21 Mar 2022 15:30:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/13] various virtio docs, fixes and tweaks
Date: Mon, 21 Mar 2022 15:30:24 +0000
Message-Id: <20220321153037.3622127-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series is a sub-set of patches while I was trying to re-rev my
virtio-rpmb patches. It attempts to address a few things:

  - improve documentation for virtio/vhost/vhost-user
  - document some of the API
  - a hacky fix for F_CONFIG handling
  - putting VhostUserState on a diet, make VhostUserHostNotifier dynamic

In particular I've been trying to better understand how vhost-user
interactions are meant to work and why there are two different methods
for instantiating them. If my supposition is correct perhaps a number
of devices that don't have in-kernel vhost equivalents could be converted?

While working onthe VhostUserHostNotifier changes I found it quite
hard to trigger the code. Is this rarely used code or just requires
backends we don't see in the testing?

Alex Bennée (10):
  hw/virtio: move virtio-pci.h into shared include space
  virtio-pci: add notification trace points
  hw/virtio: add vhost_user_[read|write] trace points
  vhost-user.rst: add clarifying language about protocol negotiation
  libvhost-user: expose vu_request_to_string
  docs/devel: start documenting writing VirtIO devices
  include/hw: start documenting the vhost API
  contrib/vhost-user-blk: fix 32 bit build and enable
  hw/virtio/vhost-user: don't suppress F_CONFIG when supported
  virtio/vhost-user: dynamically assign VhostUserHostNotifiers

Paolo Bonzini (3):
  docs: vhost-user: clean up request/reply description
  docs: vhost-user: rewrite section on ring state machine
  docs: vhost-user: replace master/slave with front-end/back-end

 docs/devel/index-internals.rst            |   1 +
 docs/devel/virtio-backends.rst            | 214 +++++++++
 docs/interop/vhost-user-gpu.rst           |  10 +-
 docs/interop/vhost-user.rst               | 555 ++++++++++++----------
 meson.build                               |   2 +-
 include/hw/virtio/vhost-user.h            |  43 +-
 include/hw/virtio/vhost.h                 | 132 ++++-
 {hw => include/hw}/virtio/virtio-pci.h    |   0
 subprojects/libvhost-user/libvhost-user.h |   9 +
 contrib/vhost-user-blk/vhost-user-blk.c   |   6 +-
 hw/scsi/vhost-user-scsi.c                 |   1 +
 hw/virtio/vhost-scsi-pci.c                |   2 +-
 hw/virtio/vhost-user-blk-pci.c            |   2 +-
 hw/virtio/vhost-user-fs-pci.c             |   2 +-
 hw/virtio/vhost-user-i2c-pci.c            |   2 +-
 hw/virtio/vhost-user-input-pci.c          |   2 +-
 hw/virtio/vhost-user-rng-pci.c            |   2 +-
 hw/virtio/vhost-user-scsi-pci.c           |   2 +-
 hw/virtio/vhost-user-vsock-pci.c          |   2 +-
 hw/virtio/vhost-user.c                    | 133 ++++--
 hw/virtio/vhost-vsock-pci.c               |   2 +-
 hw/virtio/virtio-9p-pci.c                 |   2 +-
 hw/virtio/virtio-balloon-pci.c            |   2 +-
 hw/virtio/virtio-blk-pci.c                |   2 +-
 hw/virtio/virtio-input-host-pci.c         |   2 +-
 hw/virtio/virtio-input-pci.c              |   2 +-
 hw/virtio/virtio-iommu-pci.c              |   2 +-
 hw/virtio/virtio-net-pci.c                |   2 +-
 hw/virtio/virtio-pci.c                    |   5 +-
 hw/virtio/virtio-rng-pci.c                |   2 +-
 hw/virtio/virtio-scsi-pci.c               |   2 +-
 hw/virtio/virtio-serial-pci.c             |   2 +-
 subprojects/libvhost-user/libvhost-user.c |   2 +-
 contrib/vhost-user-blk/meson.build        |   3 +-
 hw/virtio/trace-events                    |  10 +-
 35 files changed, 831 insertions(+), 333 deletions(-)
 create mode 100644 docs/devel/virtio-backends.rst
 rename {hw => include/hw}/virtio/virtio-pci.h (100%)

-- 
2.30.2


