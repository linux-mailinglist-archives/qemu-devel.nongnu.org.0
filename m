Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19EF4CAD80
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:26:24 +0100 (CET)
Received: from localhost ([::1]:55204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTg7-0002C2-Uy
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:26:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRs-0006eS-5d
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:41 -0500
Received: from [2a00:1450:4864:20::436] (port=35354
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRp-0008L6-R4
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:39 -0500
Received: by mail-wr1-x436.google.com with SMTP id b5so4106275wrr.2
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XSNdP+HSfhWyR23m65HxA8Yw/w2mhAWnWd2zaA70j0c=;
 b=mHHkZc2Tx+yzqjUsSbOEk6wt9lM1EakwXb/4quZnDXlHzC1cR3Yv1mZ+RKnEQkpXcj
 +U8t8HzKAox389dsZNMPFQSGGxqdGDboTrcxsmOkv2F2r04asPEVhOcvp82F+XImmjZV
 RCUu0GTFyHI+CQ4wY0l1k3M4Ck+m50RuRkBYnfZoMFdIHp1iwqEPPR4535jNt8L1D+5w
 yWKjXFn29GeK00umJFIYsSKdvjeja1rfAU5YW/b9RTowQGyyEVGIXcauVHbdf/IPzgcM
 k6LlTiP0X+WlDuNhwghVCSh1HHwrAT7Z9aI2JYls1fIxQvweKF/VhPuTEVOJQpds2fdG
 zUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XSNdP+HSfhWyR23m65HxA8Yw/w2mhAWnWd2zaA70j0c=;
 b=VQYLYBIx76uELf9B1t/t69EcyrvR6doZD6QJFFtkEbRta6D7FXCS+ukw7zrSMS6iFP
 l30YJ/HjbdqpQUPFupTUhoNyzlnWn6SBMmr8cR5Bs2tpoq5HoqYmjFRU0hTu7FFFG5TG
 SfX8AEnB8++E3qH9jGl3I8bhaZTbpKq8Emj81/iGA3w1eXB5x2uIQdWxPcNB2KKhKyqI
 z7nJJ3MOiRwYzULzAnfwR+8oJpwgCA5os/k7rNVtk9e6Noyl/E2uAHm9FSA1eBVxBEfN
 zxWOGms6SYNZYCD4Vbq5bx2nGCCpGc2VaZI5y/mNTMLkEi1MbY9zqBBwVzssJgljZuWO
 Lkwg==
X-Gm-Message-State: AOAM531p8KQFBOorCA325fJY4CXZRHSf4Gc8XkzdF8faneJmCMgVksk9
 dGuwQbK5iphw2bglJhfqE4ZW1k7k+PY=
X-Google-Smtp-Source: ABdhPJzmlKAtplrlHDx/OBriiA9Z3Q+UbjflZai6e6zAvkncfyPngb56+xxQoZiSv12OqITaPcL24w==
X-Received: by 2002:adf:bc09:0:b0:1f0:2483:48b with SMTP id
 s9-20020adfbc09000000b001f02483048bmr4360289wrg.118.1646244696116; 
 Wed, 02 Mar 2022 10:11:36 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] QEMU changes for 2021-03-02
Date: Wed,  2 Mar 2022 19:11:23 +0100
Message-Id: <20220302181134.285107-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 99c53410bc9d50e556f565b0960673cccb566452:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2022-02-28' into staging (2022-03-01 13:25:54 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 9e685c6c574a9e1f1e3affbb900f7c38fb4bff6e:

  target/i386: Throw a #SS when loading a non-canonical IST (2022-03-02 10:38:40 +0100)

----------------------------------------------------------------
* whpx fixes in preparation for GDB support (Ivan)
* VSS header fixes (Marc-André)
* Add 5-level EPT support to vmxcap (Vitaly)
* Bundle changes to MSI routes (Longpeng)
* More precise emulation of #SS (Gareth)

----------------------------------------------------------------
Gareth Webb (1):
      target/i386: Throw a #SS when loading a non-canonical IST

Ivan Shcherbakov (2):
      whpx: Fixed reporting of the CPU context to GDB for 64-bit
      whpx: Fixed incorrect CR8/TPR synchronization

Longpeng (Mike) (2):
      kvm-irqchip: introduce new API to support route change
      kvm/msi: do explicit commit when adding msi routes

Marc-André Lureau (3):
      meson: fix generic location of vss headers
      qga/vss-win32: check old VSS SDK headers
      qga/vss: update informative message about MinGW

Paolo Bonzini (2):
      update meson-buildoptions.sh
      target/i386: only include bits in pg_mode if they are not ignored

Vitaly Kuznetsov (1):
      vmxcap: Add 5-level EPT bit

 accel/kvm/kvm-all.c                  |  7 +++---
 accel/stubs/kvm-stub.c               |  2 +-
 hw/misc/ivshmem.c                    |  5 +++-
 hw/vfio/pci.c                        |  5 +++-
 hw/virtio/virtio-pci.c               |  4 ++-
 include/sysemu/kvm.h                 | 23 +++++++++++++++--
 meson.build                          |  5 +++-
 qga/meson.build                      |  2 +-
 qga/vss-win32/install.cpp            |  4 +++
 qga/vss-win32/provider.cpp           |  4 +++
 qga/vss-win32/vss-common.h           |  3 ++-
 scripts/kvm/vmxcap                   |  1 +
 scripts/meson-buildoptions.sh        |  2 +-
 target/i386/kvm/kvm.c                |  4 ++-
 target/i386/tcg/seg_helper.c         | 49 +++++++++++++++++++++++++++++++++++-
 target/i386/tcg/sysemu/excp_helper.c | 40 ++---------------------------
 target/i386/whpx/whpx-all.c          | 30 +++++++++++++++++++++-
 17 files changed, 136 insertions(+), 54 deletions(-)
-- 
2.34.1


