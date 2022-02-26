Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB74C55BD
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 12:58:27 +0100 (CET)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNviU-00040W-6x
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 06:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvfp-00022D-MX
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:55:41 -0500
Received: from [2607:f8b0:4864:20::62e] (port=37675
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvfk-00040w-Sg
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:55:41 -0500
Received: by mail-pl1-x62e.google.com with SMTP id n15so4672665plf.4
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OE8zP91owAdAv34uCdWfWeqWZ/xtaym8fiSm/ATXeO4=;
 b=AOn7rkPqO+IspT+ZlGbo+gCLcxuWJFl6lJHIw+WO6MFQfNH9SB+yrUYxFz8evfSX21
 PzBBZ/VyyVGgxwCvNAXt4VgBs72WZf8l4HUCM+yRnjjpomTB5U82AxsFXppli+63IbL3
 X2PGJyXQv/d9Lra5aj3+duZy/KYLbIBjoh6lYaUFFwayyWI97uHHGq/Y3qekq2HqRTYi
 nXHwCs/Sr3HiZCFiDqSxeZzk8Q4vRfH8ef+X09HyfWtcGWY7F05Er9xk8T36XlnX0RL5
 ot+nva2I4HBY2sfgGvX+X6ZOL9hRiZQidEw7rLIY06CDYpbqYHpjVXNa4Pbmh5lv4wiN
 TG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OE8zP91owAdAv34uCdWfWeqWZ/xtaym8fiSm/ATXeO4=;
 b=XZde8EzLMmujlMW63NZXcObqdrkTSU+qitLDxvxvuT/KCGQrhhGoNVKS55ITxitYsy
 K0XhgQkNpvPCWGUJNGxjgNFOUpwu72g5qap7XO3in4W3YYYAJOGcfr0KXq/9V7cHQOte
 CXsvelKZhSiUfDgf5k4GSUMAlIJiXOrjnmqYzZUpBBa3cVVJ+F9EhploEP1N6NbRpYzm
 NgslJVt5nBrhlPlM7rgumdWRJzgOP0u0hkkpMYSpRwBqyZo0hRvet39iwNox80DiVnNz
 D1mWKoS/4i339bu7BGmV9jgE8M5dLNd2N2ugRI63CW2zTKGVs7jB5AOfNXE0J0wDNORO
 Vu/A==
X-Gm-Message-State: AOAM530beB9E0/GqXHqBeK5yHk1PTunXbrAcKYm4Uuq6JMDHf9G43hFu
 1UfwdgPmNEqatcnmvyzqlMMeow++TNQ=
X-Google-Smtp-Source: ABdhPJxzxcwqMQgVSDEOScYTCQv+dVNrIoXxffPaEgtRBh3LH6zFDiaNBTknjegkmpJqtJsydO/sFA==
X-Received: by 2002:a17:902:d2c6:b0:150:128:b276 with SMTP id
 n6-20020a170902d2c600b001500128b276mr12050398plc.5.1645876535179; 
 Sat, 26 Feb 2022 03:55:35 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm1323761pjb.0.2022.02.26.03.55.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 03:55:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 0/3] virtio-gpu: Respect UI refresh rate for EDID
Date: Sat, 26 Feb 2022 20:55:13 +0900
Message-Id: <20220226115516.59830-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let virtio-gpu be aware of the refresh rate. The EDID change is delivered with
display hotplugging, which should not happen too frequently. Because of that,
this moves the refresh rate to QemuUIInfo, whose change delivery is throttled.

The delivery throttling also affects xenfb and this change does not maintain
a seperate code path to avoid the throttling because the difference is little
if it xists. Usually the refresh rate of display does not change frequently and
most guests are not prepared for that anyway.

v3: Rebased to the latest QEMU.

Akihiko Odaki (3):
  ui/console: Do not return a value with ui_info
  ui: Deliver refresh rate via QemuUIInfo
  virtio-gpu: Respect UI refresh rate for EDID

 hw/display/virtio-gpu-base.c   |  7 +++---
 hw/display/virtio-gpu.c        |  1 +
 hw/display/virtio-vga.c        |  5 ++--
 hw/display/xenfb.c             | 14 ++++++++---
 hw/vfio/display.c              |  8 +++---
 include/hw/virtio/virtio-gpu.h |  1 +
 include/ui/console.h           |  4 +--
 include/ui/gtk.h               |  2 +-
 ui/console.c                   |  6 -----
 ui/gtk-egl.c                   |  4 +--
 ui/gtk-gl-area.c               |  3 +--
 ui/gtk.c                       | 45 ++++++++++++++++++++--------------
 12 files changed, 54 insertions(+), 46 deletions(-)

-- 
2.32.0 (Apple Git-132)


