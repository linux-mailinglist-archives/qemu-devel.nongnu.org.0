Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2553FD21B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 06:22:23 +0200 (CEST)
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLHlW-0000xP-S2
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 00:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHit-0006DV-U6
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHiq-0001bl-MO
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630469975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKwg0VQcdFfI07acq9qgH8ESSyc/U9PZURU5QzhyFcM=;
 b=JxlS6+QvPXfiTMJt+W6eHPUJmPJwczispwlTsiDBUCbMqxH+1YVIGMa4VH7rd4oXL6hjV4
 4KWNog5d820IimzPrS8UB6RmepmTowl0QqB6kVxxGXBft+KNDzA+D/cDDQgbucNcm9gKzi
 NIWpITslSxb36PiwvBYcfr6sD3KuPWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-X3Cx6mv0NJGZ74wsjmKlKg-1; Wed, 01 Sep 2021 00:19:33 -0400
X-MC-Unique: X3Cx6mv0NJGZ74wsjmKlKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E8688712D6;
 Wed,  1 Sep 2021 04:19:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 484F260C9F;
 Wed,  1 Sep 2021 04:19:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4333518007A4; Wed,  1 Sep 2021 06:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] hw/display: Restrict virtio-gpu-udmabuf stubs to !Linux
Date: Wed,  1 Sep 2021 06:18:59 +0200
Message-Id: <20210901041903.3111086-3-kraxel@redhat.com>
In-Reply-To: <20210901041903.3111086-1-kraxel@redhat.com>
References: <20210901041903.3111086-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, "Maxim R ." <mrom06@ya.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When using qemu configured with --enabled-modules, the
generic stubs are used instead of the module symbols:

  qemu-system-x86_64: -device virtio-vga,blob=on: cannot enable blob resources without udmabuf

Restrict the stubs to Linux and only link them when
CONFIG_VIRTIO_GPU is disabled (only the modularized
version is available when it is enabled).

Reported-by: Maxim R. <mrom06@ya.ru>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/553
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210823100454.615816-2-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 .../display/virtio-gpu-udmabuf-stubs.c                         | 0
 hw/display/meson.build                                         | 3 ++-
 stubs/meson.build                                              | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename stubs/virtio-gpu-udmabuf.c => hw/display/virtio-gpu-udmabuf-stubs.c (100%)

diff --git a/stubs/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf-stubs.c
similarity index 100%
rename from stubs/virtio-gpu-udmabuf.c
rename to hw/display/virtio-gpu-udmabuf-stubs.c
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 1e6b707d3c0a..861c43ff9847 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -56,7 +56,8 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
                     if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
-  virtio_gpu_ss.add(when: 'CONFIG_LINUX', if_true: files('virtio-gpu-udmabuf.c'))
+  virtio_gpu_ss.add(when: 'CONFIG_LINUX', if_true: files('virtio-gpu-udmabuf.c'),
+                                          if_false: files('virtio-gpu-udmabuf-stubs.c'))
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
diff --git a/stubs/meson.build b/stubs/meson.build
index 717bfa9a9997..275ac89c1600 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -52,7 +52,6 @@ if have_system
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-  stub_ss.add(files('virtio-gpu-udmabuf.c'))
 else
   stub_ss.add(files('qdev.c'))
 endif
-- 
2.31.1


