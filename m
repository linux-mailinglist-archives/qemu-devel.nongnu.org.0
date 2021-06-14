Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CBF3A7070
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:31:13 +0200 (CEST)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lstEm-000447-9D
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCV-0001Yt-F8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCT-0005fY-5p
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:51 -0400
Received: by mail-pl1-x631.google.com with SMTP id h12so7239329plf.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iVl9/7NzBZ2agnvg6h+ZbTUlBQu2wfwbtMEhqQLZzuM=;
 b=VJ+2KkL71WxbvA7Y5pcHS4E0k/8md8Lb3h6Wj5mOioZSpVgD5pc1x3Ohu6tb6xf0LD
 v5cwduwt+a2tH17VITMdosnxp6KWsUoA2o9v7LwwSOLW81VQfJZPLL8MemYFybt/l/FU
 nPq0H5CtkIStW4CMAcItCFWgJww7FTmDIJvffpUmnFNjkP+1e++Glmqw8Mec58yR8+3X
 ZOQnze1xsm2GjkBVgTSAhm7y7IIONukDa6TcqX1KabbOZp07t1c2rcA1pLFvdHwMaerq
 AMcMIc3rSupnVGM1AJ7IoYvrC3ES0cHrtJBM6gnQubomWp9ayuatBt/L2VynzNgJo4Ro
 mt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iVl9/7NzBZ2agnvg6h+ZbTUlBQu2wfwbtMEhqQLZzuM=;
 b=Vv1/8gnc2QgHi7fSM42kKCL+jH4phE0Bnsx2+Lav6DlfOy8zAE5ORsWApD8jtDhwII
 nPveTTqrzWD3NOMrGz0fsXgrhdw6Bsf/6kQjj+nS34Vn/uL/T7/mk9TIMRMVXHcsF87y
 Fxd7wC+umra8d+HfxkGxID3OdJx7/K/Tln1RvNy/0D1bmuxzk3dzdPAk0repkLhTg8Td
 /Xzr29F01PX+8S2IU8wp0lqBhX5B1vcKAuWB5/7MsN7YnfB0TC2Iy/rOozNXtAq/lvbh
 fBOIvt5mCGfFzfZqi3D4vf53r+Ki8ue0X0EJET1TyfTtG0s/2ogw/YLKmldvkO9h0UVf
 qHrg==
X-Gm-Message-State: AOAM533XVLCIidm2SWrrjoLNPQsrwBnQsSgn46i8vhbjHSA+vQc5qbi1
 dJeG7R0b8gJx4bxCGChVeOcmYg==
X-Google-Smtp-Source: ABdhPJxUwP8jHaY1kj4MmYDD9Uo2OwoQ6VVURDryNQIrs8e7cajPeuQ7JOXPMfy+ihNhItx1Ee5W4Q==
X-Received: by 2002:a17:902:14b:b029:119:ef6b:8039 with SMTP id
 69-20020a170902014bb0290119ef6b8039mr828175plb.84.1623702524511; 
 Mon, 14 Jun 2021 13:28:44 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id fs10sm289029pjb.31.2021.06.14.13.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:28:43 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v2 0/5] virtio: Add vhost-user based RNG 
Date: Mon, 14 Jun 2021 14:28:37 -0600
Message-Id: <20210614202842.581640-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: qemu-devel@nongnu.org, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This sets adds a vhost-user based random number generator (RNG),
similar to what has been done for i2c and virtiofsd, with the
implementation following the patterns already set forth in those.

Applies cleanly to git://git.qemu.org/qemu.git master(1ea06abceec6).

Thanks,
Mathieu

-----
New for V2:
- Replaced "antropy" for "entropy" (Joakim).

Mathieu Poirier (5):
  vhost-user-rng: Add vhost-user-rng implementation
  vhost-user-rng-pci: Add vhost-user-rng-pci implementation
  vhost-user-rng: backend: Add RNG vhost-user daemon implementation
  docs: Add documentation for vhost based RNG implementation
  MAINTAINERS: Add maintainer for vhost-user RNG implementation

 MAINTAINERS                              |   9 +
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
 11 files changed, 922 insertions(+)
 create mode 100644 docs/tools/vhost-user-rng.rst
 create mode 100644 hw/virtio/vhost-user-rng-pci.c
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 include/hw/virtio/vhost-user-rng.h
 create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
 create mode 100644 tools/vhost-user-rng/main.c
 create mode 100644 tools/vhost-user-rng/meson.build

-- 
2.25.1


