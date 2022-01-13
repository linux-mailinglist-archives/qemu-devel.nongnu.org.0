Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28AA48DA3D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:58:19 +0100 (CET)
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81YQ-0005ck-GB
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n7yjB-0000qL-Gk
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:57:14 -0500
Received: from [2607:f8b0:4864:20::1030] (port=44709
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n7yj7-0005OL-9m
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:57:11 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so10807233pji.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0vimvdTs4a/mEZ72Q90/D+Pfn53Sv01YbWRm5SpKVsc=;
 b=v9cyrKtqJCMoIiTUZa1QO91AZeOhKQmvRXcjhJC63O+0XkEvPxNrgyL+3etUD5Axf8
 9UIvMQQvRhfP1c1WcjZm0FR3WkxmfKSy4NUwJ0MTO5/Bvjd1KLOUE6m0dd9i/bjhgzHH
 SEHizIKwRopVNCRebXgvFq5wUzUx7Y7d7lxDSTZV6LjFzFFmuHql4rUFUbzs10tkCiwC
 cSyoHEt2Qm8Ps/eFE6pDrY6xqMVKU5xbuDGlDmBl3I3h9I9tUeKduwBzXxvUT8eGs4pr
 tZh8tPOlv8z6Fxx0W+c23Xen8tKuRkbQCXhf4b8U4fSbemyUonS62ogSQw7h06ffHYR8
 Cgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0vimvdTs4a/mEZ72Q90/D+Pfn53Sv01YbWRm5SpKVsc=;
 b=q2HaQo/Ha3QGGCLgpvlaHXMZ7xmahuiZHI2a+3Qi/2F61QUR76ETmKTZoDGmcl/LeI
 JrFBTSAC7AVr5aog4qYSxLQLx6hSZ/o1tIieZDmTB86d8wgXQipeRG3lWwqOeQ9fM216
 EAA/akLDl96tLfVREj1ClEWXNSj+SSJwLgiOIoOagcJK7A4PEC7mZshBmoEPhJBNTPht
 O7q8ORgdr41si/jIQhjJ/z9/rKYbaydVMAf8p8kHwgIeuQe4buShEvAKjOO0DYa7EYTR
 +4zIgMmXHq/6FL5VQQSR+GxDnDINxfSAwrjAZgM6dxhTZ0xEVbIbzmiJLWIdyCwM6ij/
 h8vA==
X-Gm-Message-State: AOAM533VmZpkwybJvn/VPIY1PEtsonNMtGUoYXtxEwh0BGzO6pR4eFXT
 Cl2KhxR+nJUEXQauaAu88BoSMw==
X-Google-Smtp-Source: ABdhPJzIPWcAZR0XRfjIWnKC34l40ccdY/sHOqe+CfcJcMQvTbl7yUxklR4nY/grbUMU6J+zHw6Zew==
X-Received: by 2002:a17:902:b202:b0:149:9a8a:f93b with SMTP id
 t2-20020a170902b20200b001499a8af93bmr3917979plr.127.1642075027249; 
 Thu, 13 Jan 2022 03:57:07 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id f9sm2387572pjh.18.2022.01.13.03.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 03:57:06 -0800 (PST)
From: Ruien Zhang <zhangruien@bytedance.com>
To: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 eblake@redhat.com, pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH 0/2] Introduce printer subsystem and USB printer device
Date: Thu, 13 Jan 2022 19:56:57 +0800
Message-Id: <20220113115659.72788-1-zhangruien@bytedance.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=zhangruien@bytedance.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Jan 2022 09:54:20 -0500
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
Cc: qemu-devel@nongnu.org, zhangruien <zhangruien@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhangruien <zhangruien@bytedance.com>

Currently, printer support in QEMU can generally be considered with these
approaches:

1) USB passthrough & redirection, with the limitation of flexibility and
   transport-specific issues that come along with.

2) Network reachability with network printers, which is also driver-specific,
   thus less friendly to small systems.

Driverless Printing [1] may or may not be network-dependent, the former is the
general case while the latter imposes less restraints on cloud environments, and
it doesn't necessarily mean that we have to follow the methods in 1) to achieve
this. Transport protocols targeted at devices such as USB printer class [2] with
the extension of IPP-over-USB [3] and many others can be integrated into QEMU,
presenting more flexibility and functionality.

This patchset introduces:

1) Skeleton of QEMU printer subsystem with a dummy builtin driver.

2) USB printer device emulation, with definitions in the extension of IPP-over-
   USB [3].

WIP:

1) QEMU printer subsystem interfaces, which will be finalized with a concrete
   backend driver.

2) IPP-over-USB implementation.

[1]: https://openprinting.github.io/driverless
[2]: https://www.usb.org/sites/default/files/usbprint11a021811.pdf
[3]: https://www.usb.org/document-library/ipp-protocol-10

zhangruien (2):
  printer: Introduce printer subsystem
  usb-printer: Introduce USB printer class

 MAINTAINERS                 |   7 +
 docs/system/devices/usb.rst |   3 +
 hw/usb/Kconfig              |   5 +
 hw/usb/dev-printer.c        | 423 ++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/meson.build          |   1 +
 hw/usb/trace-events         |  11 ++
 include/hw/usb/printer.h    |  93 ++++++++++
 include/printer/printer.h   |  42 +++++
 meson.build                 |  12 +-
 meson_options.txt           |   3 +
 printer/builtin.c           |  61 +++++++
 printer/meson.build         |  14 ++
 printer/printer.c           | 191 ++++++++++++++++++++
 printer/trace-events        |   5 +
 printer/trace.h             |   1 +
 qapi/meson.build            |   1 +
 qapi/printer.json           |  47 +++++
 qapi/qapi-schema.json       |   1 +
 qemu-options.hx             |   8 +
 softmmu/vl.c                |   4 +
 20 files changed, 932 insertions(+), 1 deletion(-)
 create mode 100644 hw/usb/dev-printer.c
 create mode 100644 include/hw/usb/printer.h
 create mode 100644 include/printer/printer.h
 create mode 100644 printer/builtin.c
 create mode 100644 printer/meson.build
 create mode 100644 printer/printer.c
 create mode 100644 printer/trace-events
 create mode 100644 printer/trace.h
 create mode 100644 qapi/printer.json

-- 
2.11.0


