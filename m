Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C62D3C2C3E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 03:03:39 +0200 (CEST)
Received: from localhost ([::1]:50622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m21P8-0003hy-0L
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 21:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m21LC-00012j-Si
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 20:59:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m21LB-0005au-8e
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 20:59:34 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j9so4636125pfc.5
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 17:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Srsptr7gOEVf5hNWwohSD4JUGlIZ8+5cx0/Uy448QQA=;
 b=rUiYRTnDXlL1MzQk3UAbazo9DgFfu0bwBBIemUIPqsN/7t+hgl5RPtiHt2HC8pICeH
 6pCym4dctP4EEL94W87pYhOG9t6Munpoq2C6mFChmRejFHAAp0Rcp+3C8Jg49Rk42XFU
 MZjtHys4GXbiCa8yB07qnJVAomLkTrjMpXIMGPweilj1OVus5vjGXmEIl/+nn7Necx9v
 mUugjFf5ra0HATMpPozAmQQqBKlSREmUVUdWvh0/cvEI6EVl0G8jZe+dJKfD02UrR7+L
 WQhcSBP0uRt+gG7X28otr2U/VFZ73nHz2VaimarlKfaFj8s05/fIrBMbFO3IjbGihfWM
 6T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Srsptr7gOEVf5hNWwohSD4JUGlIZ8+5cx0/Uy448QQA=;
 b=lMNCDcpX/4wcZsZ68EsONq73KI9jV7uXTLJXCQW3NXxk3MFJzuaWXOiI9gXbN3yjsS
 iwcuKnsQueqq/ouF6Ecv2A9DPuVhbSR3eWm3TY6nqpOgzrBPzRRBoXFgmo658+ljuEnq
 Ii8XCDG4MnVHmmDJG1xA7MeJ2zijakunJRPi6H5n6hHtCS89vtU8m868x3o7wFMA2dkT
 yXz9kNBlDXpB8l5hJiZKMNBFkg4xBgrHPkXYuq+33EL+Y/3EiDky3hy4la37pApqcVPo
 YbZPe5ZFtuVIlZnLtiiJm4Khwf16CFoJEGcMQsKaTFUj0uM7XgnnlA5Z5xAZ0sSGxmMz
 OeTg==
X-Gm-Message-State: AOAM530rbiIqE8h82nS0K01eVpqLxySGRZQZFDNDN3JjNGtAI2qT0qnm
 IZWqJ/jiEmhUEQwtNPTvLpE2AQ==
X-Google-Smtp-Source: ABdhPJwWs0L6gBA4VxW0lmMuHI5p89HCpA5SuEz9Ka65FIWElt16sMh9DQ18JmmQ++prFlV3mLMAxQ==
X-Received: by 2002:a63:114d:: with SMTP id 13mr19750729pgr.180.1625878771148; 
 Fri, 09 Jul 2021 17:59:31 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id w2sm6420932pjq.5.2021.07.09.17.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 17:59:30 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v3 0/4] virtio: Add vhost-user based RNG
Date: Fri,  9 Jul 2021 18:59:25 -0600
Message-Id: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This sets adds a vhost-user based random number generator (RNG),
similar to what has been done for i2c and virtiofsd, with the
implementation following the patterns already set forth in those.

Applies cleanly to git://git.qemu.org/qemu.git master(05de778b5b8a).

Thanks,
Mathieu

Mathieu Poirier (4):
  vhost-user-rng: Add vhost-user-rng implementation
  vhost-user-rng-pci: Add vhost-user-rng-pci implementation
  vhost-user-rng: backend: Add RNG vhost-user daemon implementation
  docs: Add documentation for vhost based RNG implementation

----
New for V3:
- Rebased to latest master branch.
- Fixed documentation warning.
- Updated call to vhost_dev_init() to match new signature.
- Dropped MAINTAINERS patch since it was already applied. 

 docs/tools/index.rst                     |   1 +
 docs/tools/vhost-user-rng.rst            |  74 +++++
 hw/virtio/Kconfig                        |   5 +
 hw/virtio/meson.build                    |   2 +
 hw/virtio/vhost-user-rng-pci.c           |  79 +++++
 hw/virtio/vhost-user-rng.c               | 294 +++++++++++++++++
 include/hw/virtio/vhost-user-rng.h       |  33 ++
 tools/meson.build                        |   8 +
 tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
 tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++
 tools/vhost-user-rng/meson.build         |  10 +
 11 files changed, 914 insertions(+)
 create mode 100644 docs/tools/vhost-user-rng.rst
 create mode 100644 hw/virtio/vhost-user-rng-pci.c
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 include/hw/virtio/vhost-user-rng.h
 create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
 create mode 100644 tools/vhost-user-rng/main.c
 create mode 100644 tools/vhost-user-rng/meson.build

-- 
2.25.1


