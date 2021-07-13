Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5CF3C79BD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:34:37 +0200 (CEST)
Received: from localhost ([::1]:49866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qz6-0005lt-TD
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QfE-0007Qx-M2
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QfC-0001oQ-UN
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2j8JeaRNU7honPrSPdps+w1y4dHjJhJPeexiXUjAfAU=;
 b=XWipdkl4AgcRqQ313kACUL7hYIrHGSoVfHGWbw7wt202xm2T+wD0nnD8OOMPQB8w29GUCC
 5ZxrupHoEk6EzG/H5LRiLncGfQVviB/C8Rj0285NjJcRgI7TJcAUnMH8Y8QKoB2MmI32r0
 SguGbMIaC8lmkC+KJbDKjtPO2MXR76A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-aT1p3KTKOo-AYMh8DCyZig-1; Tue, 13 Jul 2021 18:10:39 -0400
X-MC-Unique: aT1p3KTKOo-AYMh8DCyZig-1
Received: by mail-wm1-f72.google.com with SMTP id
 p9-20020a7bcc890000b02902190142995dso966526wma.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2j8JeaRNU7honPrSPdps+w1y4dHjJhJPeexiXUjAfAU=;
 b=iWyq9Z1/bz2RVzr2OUuE8GEbPYhm08NuuUy+lGBjmYlNeDDCMt7BP1bq68dxNTRJKS
 lmQsauSPtRdFQ2G6slKeU86PPF3ewKoluqu0JGTwkj6/JQZJoEi1pEZWcGbc0lGljo3U
 +isXSeOoA+Y24BrP5wsPHdurJ2q+ssywahVGNLjeYX9HJJA3Sd2JzxsV257y2MbKSdYz
 UG5tjugzfLXCIYZTM8BD45rMEhiX4p1wD+6+PD5YjAvp9c5Yc0AVLn8SlvF8fcZ7H9VP
 pZ2vT7fcW+Br8R/K/CsxMix/SLherllQSmj7ePWfVgfguh4TYdZ2n2huMDq+h1daxjXT
 Lr0g==
X-Gm-Message-State: AOAM5302U0ykjnr9a50X46Ub9Qz+ByV02zurgKEOnhi7bevuv3ANv0iR
 O4C51r9TbKHdozs0lVFMkwIrnR272pIgYwMcrpLP354NTWTyaD8lmDBIEQbBVo/ZhU8fYFYSElX
 rMVu/140hkC+epwVhgtvOsaK9JHdUTYSrNNSnvyhxTQFFQhkWkUJUyOUV+E0R
X-Received: by 2002:a5d:6786:: with SMTP id v6mr8599801wru.290.1626214238523; 
 Tue, 13 Jul 2021 15:10:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/lkoBjhY5OkOfpGb4zj9kVBB4+P7VEuDaps1UiOLb4VTY4yCMme3Wkko5omNabR6r6ZeI9w==
X-Received: by 2002:a5d:6786:: with SMTP id v6mr8599782wru.290.1626214238292; 
 Tue, 13 Jul 2021 15:10:38 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id h15sm108585wrq.88.2021.07.13.15.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:37 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/23] docs: Add documentation for vhost based RNG
 implementation
Message-ID: <20210713220946.212562-11-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Mathieu Poirier <mathieu.poirier@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mathieu Poirier <mathieu.poirier@linaro.org>

Add description and example for the vhost-user based RNG implementation.
Tailored on Viresh Kumar's vhost-user-i2c documentation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-Id: <20210710005929.1702431-5-mathieu.poirier@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/tools/index.rst          |  1 +
 docs/tools/vhost-user-rng.rst | 74 +++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 docs/tools/vhost-user-rng.rst

diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index d923834a73..9d80fa89ec 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -15,5 +15,6 @@ Contents:
    qemu-nbd
    qemu-pr-helper
    qemu-trace-stap
+   vhost-user-rng
    virtfs-proxy-helper
    virtiofsd
diff --git a/docs/tools/vhost-user-rng.rst b/docs/tools/vhost-user-rng.rst
new file mode 100644
index 0000000000..7f69d7bb3c
--- /dev/null
+++ b/docs/tools/vhost-user-rng.rst
@@ -0,0 +1,74 @@
+QEMU vhost-user-rng - RNG emulation backend
+===========================================
+
+Synopsis
+--------
+
+**vhost-user-rng** [*OPTIONS*]
+
+Description
+-----------
+
+This program is a vhost-user backend that emulates a VirtIO random number
+generator (RNG).  It uses the host's random number generator pool,
+/dev/urandom by default but configurable at will, to satisfy requests from
+guests.
+
+This program is designed to work with QEMU's ``-device
+vhost-user-rng-pci`` but should work with any virtual machine monitor
+(VMM) that supports vhost-user. See the Examples section below.
+
+Options
+-------
+
+.. program:: vhost-user-rng
+
+.. option:: -h, --help
+
+  Print help.
+
+.. option:: -v, --verbose
+
+   Increase verbosity of output
+
+.. option:: -s, --socket-path=PATH
+
+  Listen on vhost-user UNIX domain socket at PATH. Incompatible with --fd.
+
+.. option:: -f, --fd=FDNUM
+
+  Accept connections from vhost-user UNIX domain socket file descriptor FDNUM.
+  The file descriptor must already be listening for connections.
+  Incompatible with --socket-path.
+
+.. option:: -p, --period
+
+  Rate, in milliseconds, at which the RNG hardware can generate random data.
+  Used in conjunction with the --max-bytes option.
+
+.. option:: -m, --max-bytes
+
+  In conjuction with the --period parameter, provides the maximum number of byte
+  per milliseconds a RNG device can generate.
+
+Examples
+--------
+
+The daemon should be started first:
+
+::
+
+  host# vhost-user-rng --socket-path=rng.sock --period=1000 --max-bytes=4096
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


