Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BFA3F483C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:07:15 +0200 (CEST)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6rL-0005yZ-0R
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6pF-0003z8-1b
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:05:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6pD-00051B-8q
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629713102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3MNa52CjStDNo7Dg9qJDNMNu1i98ikPvkmb0ZODO0I=;
 b=KAU4b4lAxk0Yn5QPNHH1TVtRomDij0BPfqOXdMoOwLKvWpPxu84qU/E6BR62yoZN8O/4vD
 Ehtn8p9L2aJSPwrvBAeNYikWe0omoqnrUnq2Np5dGZUGwfx8c9swIwO3g9R/kNX1JQoA2n
 ZR/GDmREfPDOqKnyqG/UZpMvA6ysEtM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-kbASzOY0OHmqccdtXPCM-A-1; Mon, 23 Aug 2021 06:05:01 -0400
X-MC-Unique: kbASzOY0OHmqccdtXPCM-A-1
Received: by mail-wr1-f71.google.com with SMTP id
 a13-20020adfed0d000000b00156fd70137aso4826590wro.8
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x3MNa52CjStDNo7Dg9qJDNMNu1i98ikPvkmb0ZODO0I=;
 b=p7KAENv5pL1/C6elC4nxzP1ufroflTh3c+ZnfLcXEDII4UO3ofh8M4xcDovG19FmDk
 MahNCwmRcovnkeWx3FlDrmZ/6rDHX1Gd0VQb1V/5+L2IYIe7AbSwRx63YGb/ATMoaT5W
 2vCgXu9NVnrg9xEAScC6slWqht9P8YjuX0hbR/zK7zNosRbHyCH5Tt09T9qYw2KNhGqF
 qmRzsCVA8m6AO4mSJ1Skwaegajnp0/WxAA1+xnBaLctvg2ffKl19irReHxtx/1BT09r9
 jl35JM8gWOQ9gwyBzsfCG34VRtFq2QYLeX38xbT4vo1UtevsQQ2ennj2xXvU/KvF/iMS
 NyQw==
X-Gm-Message-State: AOAM532yobEJU6OGnKfONksf330I2t9w3zbfr0tkWz4mAKRLxoRO45i7
 HIDKf5em3VihYFzyoEyqDR4sfwr5uYVWHjd7S9mRjygtyd+wekJaCNF1PLlmjyDfEv5NbK/z7wo
 6v8qP6ueCYTCqHbcoCfXVKZohMibxhPEHe1m8fyakIDNdSe2Eg5CL6ASUb4feHJxQ
X-Received: by 2002:adf:fc45:: with SMTP id e5mr12361469wrs.127.1629713099769; 
 Mon, 23 Aug 2021 03:04:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgfaIKWWOOcZaqO6LfhJ6ygV0aqL+WrvXT6WWC2NRZHhqW3M0V7TUBEbH2xf4QkCRX8xKVPg==
X-Received: by 2002:adf:fc45:: with SMTP id e5mr12361446wrs.127.1629713099556; 
 Mon, 23 Aug 2021 03:04:59 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b18sm14621051wrr.89.2021.08.23.03.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 03:04:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/display: Restrict virtio-gpu-udmabuf stubs to !Linux
Date: Mon, 23 Aug 2021 12:04:53 +0200
Message-Id: <20210823100454.615816-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823100454.615816-1-philmd@redhat.com>
References: <20210823100454.615816-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Maxim R ." <mrom06@ya.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using qemu configured with --enabled-modules, the
generic stubs are used instead of the module symbols:

  qemu-system-x86_64: -device virtio-vga,blob=on: cannot enable blob resources without udmabuf

Restrict the stubs to Linux and only link them when
CONFIG_VIRTIO_GPU is disabled (only the modularized
version is available when it is enabled).

Reported-by: Maxim R. <mrom06@ya.ru>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/553
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
index 1e6b707d3c0..861c43ff984 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -56,7 +56,8 @@
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
                     if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
-  virtio_gpu_ss.add(when: 'CONFIG_LINUX', if_true: files('virtio-gpu-udmabuf.c'))
+  virtio_gpu_ss.add(when: 'CONFIG_LINUX', if_true: files('virtio-gpu-udmabuf.c'),
+                                          if_false: files('virtio-gpu-udmabuf-stubs.c'))
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
diff --git a/stubs/meson.build b/stubs/meson.build
index d3fa8646b38..3d7cfac608e 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -53,7 +53,6 @@
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-  stub_ss.add(files('virtio-gpu-udmabuf.c'))
 else
   stub_ss.add(files('qdev.c'))
 endif
-- 
2.31.1


