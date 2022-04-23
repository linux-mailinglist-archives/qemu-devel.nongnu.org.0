Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEDC50CA3F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 14:56:22 +0200 (CEST)
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFJF-000135-E7
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 08:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFF2-0006R9-Tw
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:01 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFF0-00052y-PD
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:00 -0400
Received: by mail-ej1-x634.google.com with SMTP id ks6so21214689ejb.1
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ljJt+2C3FEpBT3KMIVdAhzcxlkF2oyJj5/s+VkS5iy8=;
 b=iwEIB5Pz9q0K3zAqxjZLVX1raOhptbFg6ghLv9lTHpC3bbjYqMuFKJRzJA3OdXTaVS
 guPdwFIMBbFchTxU/rcknnuNEfnfap4lJp3qBKI8Le/D9a2RheX/A5R27Yy+7vcoGZva
 xnZ9UplWZa9sPanydgSse6HVwyQMl+HU8TCFYIy/2NMLEbWNmQDSItv0S/7KngwgXNhr
 yhWXbm4iJch6K+Fj9p50mzoORtl1DxEHfwOqGsNBI36IAg0X4fP7mApwskyOKDE/TBMX
 hK0f7Yu3HCVhqgxwLhKKVfYT36NTsq5im9n8w/Y3TrQDVfXvA9huXsNXb8y71zPE21+q
 9izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ljJt+2C3FEpBT3KMIVdAhzcxlkF2oyJj5/s+VkS5iy8=;
 b=55ZFpb6DCkNrntSg6Dofqbf4/7no7agWuOjqJtiWMzF4WUl0suA8pMDC1L+rP7lSKM
 KmuA1MZ7Yj0qui2YEulbMYcw83mfo09gwMsvUalhtuTyzz/mjljKQn9cC3BmINpnq/IU
 0xFx+QSlb+TjOGzMkI2lbvBgR750PhKlh3oA/pNd1T1Y/iq51faswhHMo48Rp9iU2z53
 sQixubReQ8vCkxP3ASS1TNxkJO5b7UpSvm23lMZ4QmTTW3Qg5P07XYpctQQdsBpSxrk6
 LM/+y3VpSVXJCA0Y/TWKp2N4AfxcZROxkhmxn/pxk45J1jSB6LyLBgeU70x/Sl3TbZiS
 t4XQ==
X-Gm-Message-State: AOAM532UGoNstexINDqrxXjn+ZnieOq7tkIxbFYiSffzFARxwqn8f9Uj
 q7NSVNi+8f7jhrIqLzcc55pusTcITBcCEw==
X-Google-Smtp-Source: ABdhPJzavET9becB4zP3TwpZ2MSA/WQhvXo+glEdWsqXWO5DH8sqKrbgGMLuwQSTf4QQcPT5A3LdHQ==
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr8490201ejy.385.1650718316989; 
 Sat, 23 Apr 2022 05:51:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:51:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/34] Misc meson conversions for QEMU 7.1
Date: Sat, 23 Apr 2022 14:51:17 +0200
Message-Id: <20220423125151.27821-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The more interesting bits here are:

* move all remaining dependencies except glib to Meson (glib depends on
  https://github.com/mesonbuild/meson/pull/10206/)

* many more options are parsed from introspection data, including
  string options

* make all -D options optional on the meson command line

v1->v2:
- remove CONFIG_XEN_PCI_PASSTHROUGH symbol [patch 12]
- fix get_option('optimization') comparison to use a string [patch 17]
- fix RO/RW typo [patch 20]

Other patches are exactly the same.

Based-on: <20220422100825.3692002-1-mjt@msgid.tls.msk.ru>

Paolo Bonzini (34):
  meson: show final set of compiler flags
  configure: remove dead code
  qga: wixl: get path to sysroot from pkg-config as intended
  configure: pc-bios/qemu-icon.bmp does not exist
  configure: gcov should not exclude fortify-source
  configure: move --enable/--disable-debug-info to second option parsing
    pass
  configure, meson: move OpenGL check to meson
  meson, configure: move RDMA options to meson
  meson, configure: move keyctl test to meson
  meson, configure: move usbfs test to meson
  meson, configure: move libgio test to meson
  meson: remove CONFIG_XEN_PCI_PASSTHROUGH from config-target.h
  meson, configure: move --enable-module-upgrades to meson
  meson, configure: move Xen detection to meson
  meson-buildoptions: add support for string options
  configure, meson: move iasl detection to meson
  configure: move Windows flags detection to meson
  configure: switch string options to automatic parsing
  meson, configure: move --tls-priority to meson
  meson, configure: move bdrv whitelists to meson
  meson, configure: move --with-pkgversion, CONFIG_STAMP to meson
  meson, configure: move --interp-prefix to meson
  meson: always combine directories with prefix
  configure: switch directory options to automatic parsing
  meson: pass more options directly as -D
  configure: omit options with default values from meson command line
  meson, virtio: place all virtio-pci devices under virtio_pci_ss
  configure: simplify vhost-net-{user, vdpa} configuration
  build: move vhost-vsock configuration to Kconfig
  build: move vhost-scsi configuration to Kconfig
  build: move vhost-user-fs configuration to Kconfig
  meson: create have_vhost_* variables
  meson: use have_vhost_* variables to pick sources
  configure, meson: move vhost options to Meson

 Kconfig.host                    |    3 -
 backends/meson.build            |   10 +-
 configure                       | 1010 ++-----------------------------
 contrib/rdmacm-mux/meson.build  |    4 +-
 crypto/meson.build              |    4 +-
 docs/meson.build                |    2 +-
 hw/net/meson.build              |    8 +-
 hw/scsi/Kconfig                 |    5 +
 hw/virtio/Kconfig               |   18 +-
 hw/virtio/meson.build           |   34 +-
 hw/xen/meson.build              |   20 +-
 include/hw/virtio/virtio-scsi.h |    2 -
 meson.build                     |  405 ++++++++++---
 meson_options.txt               |   40 +-
 migration/meson.build           |    2 +-
 net/meson.build                 |   12 +-
 qga/meson.build                 |    2 +-
 scripts/meson-buildoptions.py   |   86 ++-
 scripts/meson-buildoptions.sh   |   93 ++-
 scripts/qemu-stamp.py           |   24 +
 scripts/xen-detect.c            |  203 +++++++
 tests/meson.build               |    2 +-
 tests/qtest/meson.build         |    9 +-
 tools/meson.build               |    2 +-
 ui/meson.build                  |   24 +-
 util/meson.build                |    2 +-
 26 files changed, 872 insertions(+), 1154 deletions(-)
 create mode 100644 scripts/qemu-stamp.py
 create mode 100644 scripts/xen-detect.c

-- 
2.35.1


