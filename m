Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC34349EC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:17:21 +0200 (CEST)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9ay-0007jO-FZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i0-0004fn-IN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hw-0003XJ-5X
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ovgGFzduCrnIeJvjYt5D1svpWOkcO96pV6pxkCNnsKE=;
 b=BxCLpIgDqhJ/y1ocI2vibBYRaQuGBqx44/sam6r/t2rcjX7ga8ZA70wxnnBQpQl1pZU94j
 T9k2EKpO+SsuX/zifFLU6wPxJSHWD1c68ziKNzCQQmB5ljXUZhOszklFr6jSVo3hR9RwFl
 +k8BxOLRjkLyxD7SbEoGm0tfOgmMW40=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-wq3HI3P3OlK9GVaJFhiPzA-1; Wed, 20 Oct 2021 06:20:25 -0400
X-MC-Unique: wq3HI3P3OlK9GVaJFhiPzA-1
Received: by mail-ed1-f71.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so20514298edi.12
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ovgGFzduCrnIeJvjYt5D1svpWOkcO96pV6pxkCNnsKE=;
 b=zLCRg1T/2xkP5e8PIYrvQRevAPWAsyTSoi5/Vsizbq02JCclVOE77FiXDiiyXnflsT
 Oxpdd7QsP8qP3en2cQQeSzCiz4F5IVMNg5GeGVpx90os2IPmx2vNgMMBKLY+xK2iiXpt
 oZtll5m47u19D6pSzsz+cA5VUKNYkLGx1koozEtv0yjFf4rOn1U42YaeWdCAdYLl2wB8
 7NoQuEsOZQ+WGjrHQmFT7BYGdw7StCPqJpNKDgLBZblUZmKjYXWwDwb8PFzmZVTQ9P9l
 qo/O1+CHsURPEjJIh0pnRMO3TaiiIQ4iVvaAC02wdAvBQ2KRUcMIku/8G8zvVTpjIZUR
 lqtQ==
X-Gm-Message-State: AOAM531kgLvJUqf7spPmwgPpatV5Q976mNypjuKgbUF+4XnE7OfUAt9G
 Thfrxp6RbEHsmEc6rc1SHEI/0/x0J/PlLYYmrKW/AKBNZUczQypw1z2qKMUuWLUnHijICN4WJVi
 oPJj3n95W2N3Cx4WxYS0E36OOll8NFauz8DucLkEdvzy4W0zwOlpqBntKGloS
X-Received: by 2002:a50:e183:: with SMTP id k3mr62562068edl.22.1634725223531; 
 Wed, 20 Oct 2021 03:20:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBe5essEzHiEgNYxnMItTUZJNzxqFpoSl/oiY7OPXStM8IxtVRmLVXktJWkDpxbr8YlnrVzQ==
X-Received: by 2002:a50:e183:: with SMTP id k3mr62562040edl.22.1634725223368; 
 Wed, 20 Oct 2021 03:20:23 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id lf17sm831268ejb.25.2021.10.20.03.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:22 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 24/44] docs: Add documentation for vhost based RNG
 implementation
Message-ID: <20211020101844.988480-25-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mathieu Poirier <mathieu.poirier@linaro.org>

Add description and example for the vhost-user based RNG implementation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-Id: <20211012205904.4106769-4-mathieu.poirier@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/system/device-emulation.rst       |  1 +
 docs/system/devices/vhost-user-rng.rst | 39 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 docs/system/devices/vhost-user-rng.rst

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 7afcfd8064..19944f526c 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -88,3 +88,4 @@ Emulated Devices
    devices/usb.rst
    devices/vhost-user.rst
    devices/virtio-pmem.rst
+   devices/vhost-user-rng.rst
diff --git a/docs/system/devices/vhost-user-rng.rst b/docs/system/devices/vhost-user-rng.rst
new file mode 100644
index 0000000000..a145d4105c
--- /dev/null
+++ b/docs/system/devices/vhost-user-rng.rst
@@ -0,0 +1,39 @@
+QEMU vhost-user-rng - RNG emulation
+===================================
+
+Background
+----------
+
+What follows builds on the material presented in vhost-user.rst - it should
+be reviewed before moving forward with the content in this file.
+
+Description
+-----------
+
+The vhost-user-rng device implementation was designed to work with a random
+number generator daemon such as the one found in the vhost-device crate of
+the rust-vmm project available on github [1].
+
+[1]. https://github.com/rust-vmm/vhost-device
+
+Examples
+--------
+
+The daemon should be started first:
+
+::
+
+  host# vhost-device-rng --socket-path=rng.sock -c 1 -m 512 -p 1000
+
+The QEMU invocation needs to create a chardev socket the device can
+use to communicate as well as share the guests memory over a memfd.
+
+::
+
+  host# qemu-system								\
+      -chardev socket,path=$(PATH)/rng.sock,id=rng0				\
+      -device vhost-user-rng-pci,chardev=rng0					\
+      -m 4096 									\
+      -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on	\
+      -numa node,memdev=mem							\
+      ...
-- 
MST


