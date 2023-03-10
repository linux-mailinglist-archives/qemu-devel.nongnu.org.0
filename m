Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D778F6B3CEB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:55:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paaOo-0001gk-N5; Fri, 10 Mar 2023 05:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paaOf-0001fI-Nl; Fri, 10 Mar 2023 05:54:49 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paaOc-0001Hl-7T; Fri, 10 Mar 2023 05:54:48 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso4802678pjs.3; 
 Fri, 10 Mar 2023 02:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678445679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QRufKAyLxjKGlTDzNK5hk1ALQxFTVsjBVFZl5h8MydA=;
 b=Pd8khHHe5CImWDnZWtfulUJX5UhYX8a7z564TFkj8Nt/QHu4iWBP1qTs2ck/5aXTuY
 IoSWRiUJGc36qr67An4Ji9vkC6Cv4BsF2osXvmRXm1qU6XFKBCqcuX3S7XHGI1+ldQD9
 sHbsIjfY0wPmX0PftJwvCRCPXo2iYo3Y9pl2aS9RPQoYGATkbSjhOpRPgITIJXfiD0Yv
 axkO6LPNwbmFMUwnsoO0a8QUvu3S8FM4CzGS62qGwEuHFHIUsHC+Y4vROskyawvgPsV4
 eq7ssqy4+VdhLHd5hXeBO8uVT3fAnVFE9Rj8tyl3WDwnTszGgaj/iXcCGS0IRlnw0ORR
 QpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678445679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QRufKAyLxjKGlTDzNK5hk1ALQxFTVsjBVFZl5h8MydA=;
 b=Duko7dFiR0YUXR2FUei2Bte1bHC56xl1xx9W8YgmErpp1JUHwHnR79b9+gzN3T87G7
 EIydV7oKyL/ntKTYoUriOlRAAPw3NSCnUSxkYG0NB/wCojmzRpM2QKulFX9FTFMVt96W
 P8xCsEpfgX/0X46tPLe/xQgSvRcN6K8Sa+kGNuCwYmJJuVSwTyH/sfB8CD2PvUtNd+KG
 iLZqxaA2wUp7VP3INgzzvoiaKhqLIQT7lLjAw5PzA5oifqbVtjP6sgTBUHplZcpp8EmW
 ndoyyOSTrlsviR4Hyteml1GkhdHpA8lchm6VKvH+deGJ32RW9dVTO/Zk+5iaQ0XyqGSU
 zuSg==
X-Gm-Message-State: AO0yUKWA06dlqO4sWZZwTCQe+Gz2EpFyTf/6bEUrL+eWuvWdH3qyWz2D
 rsI1Ifd//78rHYhkrVJueEUx3B0CfH1oS2xFU+k=
X-Google-Smtp-Source: AK7set/RBLqWR0HY4X5t25XP0S1kcx8Er/mPJE7Jhr235ZJDdcnvw9Xl/Wq8hhReib8559oSP8MDlw==
X-Received: by 2002:a17:90b:4b44:b0:237:72e5:61bd with SMTP id
 mi4-20020a17090b4b4400b0023772e561bdmr26849538pjb.49.1678445678848; 
 Fri, 10 Mar 2023 02:54:38 -0800 (PST)
Received: from fedlinux.. ([106.84.129.9]) by smtp.gmail.com with ESMTPSA id
 j9-20020a654309000000b00502e6bfedc0sm1081397pgq.0.2023.03.10.02.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:54:38 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, damien.lemoal@opensource.wdc.com,
 Hanna Reitz <hreitz@redhat.com>, hare@suse.de, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 dmitry.fomichev@wdc.com, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 0/4] Add zoned storage emulation to virtio-blk driver
Date: Fri, 10 Mar 2023 18:54:27 +0800
Message-Id: <20230310105431.64271-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch adds zoned storage emulation to the virtio-blk driver.

The patch implements the virtio-blk ZBD support standardization that is
recently accepted by virtio-spec. The link to related commit is at

https://github.com/oasis-tcs/virtio-spec/commit/b4e8efa0fa6c8d844328090ad15db65af8d7d981

The Linux zoned device code that implemented by Dmitry Fomichev has been
released at the latest Linux version v6.3-rc1.

Aside: adding zoned=on alike options to virtio-blk device will be
considered as following-ups in future.

v6:
- update headers to v6.3-rc1

v5:
- address Stefan's review comments
  * restore the way writing zone append result to buffer
  * fix error checking case and other errands

v4:
- change the way writing zone append request result to buffer
- change zone state, zone type value of virtio_blk_zone_descriptor
- add trace events for new zone APIs

v3:
- use qemuio_from_buffer to write status bit [Stefan]
- avoid using req->elem directly [Stefan]
- fix error checkings and memory leak [Stefan]

v2:
- change units of emulated zone op coresponding to block layer APIs
- modify error checking cases [Stefan, Damien]

v1:
- add zoned storage emulation

Sam Li (4):
  include: update virtio_blk headers to v6.3-rc1
  virtio-blk: add zoned storage emulation for zoned devices
  block: add accounting for zone append operation
  virtio-blk: add some trace events for zoned emulation

 block/qapi-sysemu.c                          |  11 +
 block/qapi.c                                 |  15 +
 hw/block/trace-events                        |   7 +
 hw/block/virtio-blk-common.c                 |   2 +
 hw/block/virtio-blk.c                        | 410 +++++++++++++++++++
 include/block/accounting.h                   |   1 +
 include/standard-headers/drm/drm_fourcc.h    |  12 +
 include/standard-headers/linux/ethtool.h     |  48 ++-
 include/standard-headers/linux/fuse.h        |  45 +-
 include/standard-headers/linux/pci_regs.h    |   1 +
 include/standard-headers/linux/vhost_types.h |   2 +
 include/standard-headers/linux/virtio_blk.h  | 105 +++++
 linux-headers/asm-arm64/kvm.h                |   1 +
 linux-headers/asm-x86/kvm.h                  |  34 +-
 linux-headers/linux/kvm.h                    |   9 +
 linux-headers/linux/vfio.h                   |  15 +-
 linux-headers/linux/vhost.h                  |   8 +
 qapi/block-core.json                         |  56 ++-
 qapi/block.json                              |   4 +
 19 files changed, 765 insertions(+), 21 deletions(-)

-- 
2.39.2


