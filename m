Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2DB6C5ED0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDWF-0001Ll-Ek; Thu, 23 Mar 2023 01:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDWD-0001LC-8g; Thu, 23 Mar 2023 01:29:45 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDWB-0004Jt-FD; Thu, 23 Mar 2023 01:29:45 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so885689pjp.1; 
 Wed, 22 Mar 2023 22:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679549381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dClqQIcuf7R3eW9pGWVcMwJ53uA3LgBf03DG2n4TMgk=;
 b=OvvMifh3GPgoXCwK0t9PVEra8hGxbOrnymGpGWknTvFfQAoWfVg9xHEOLoQT1+bkoe
 c7gsSV+KAnwsDhu0nfn8CbXaqhUds9P8atmHcgoEqVcRDVB8Wsqbu/3FcFIqRVf/LRo5
 eN4N7MJ0iHz2Q3Pj9F2RlfN5cksbRQZzeFlWUaLvGe0kyab4bkDScwXZe3/ppK+Pf58I
 2MCsvj51Ltc/ygX7b/Fya7yGiE40FJ6I8GqABck9Ib5JRPmX/zixQ1YmbYrrXjtv8zrM
 0enjnD3SZwTpodkBtlYtNRXqS0YC1Se1ZV/FxNlCphCgzigPCMHeDfs4LNvyPU40Zdgb
 a8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679549381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dClqQIcuf7R3eW9pGWVcMwJ53uA3LgBf03DG2n4TMgk=;
 b=3Z7a60ts+maR880h4JYwt0nBi8Yr/+MUC/adCyLkXSVyaoKmWaNTG/kaIdQ2W/YGMH
 v11/DiGu6XwL/flMD8cHQYABPhrSqbsQRgVfPhwA2uHqHt0G1/Zdb5qn+hIAbGLMFbz1
 R5nwJFNmQTsYfwpW4tvbprKaBLLuRhfLcyLAmDJTUwkKixU5XfFtfU004fsLm7YRwYrg
 FW0YLOS9ItzXysB9cMy2gZ9hXtH1CPqAk7kGMeHHaFUq0ky0YDjFW5hYzceEvUVDJByn
 axV7RFmlJXGg3mIcj1YXYv4QZ7xx0nOFOhZ+rZ0tS5/SNLX1e1tX7BloComwWR4p031H
 riCw==
X-Gm-Message-State: AO0yUKXsRZ5bDJB1Nmc3yfBo+zFpWYZaJBw9deOqjFfccbZ/B4SKkW+L
 QWqK7CKbpwXYRse/6DMPZRGd2f8LhDLa+yk1fy0=
X-Google-Smtp-Source: AK7set81UMgrkGZdNmPQRp61GqSqtcnk49PPSWO5x/DKL5eMUuPAW4fonH4vWXGtuhtChdG64cJAjg==
X-Received: by 2002:a17:902:ce91:b0:19f:2dff:2199 with SMTP id
 f17-20020a170902ce9100b0019f2dff2199mr6334539plg.68.1679549380970; 
 Wed, 22 Mar 2023 22:29:40 -0700 (PDT)
Received: from fedlinux.. ([106.84.129.82]) by smtp.gmail.com with ESMTPSA id
 r18-20020a63ce52000000b00502f4c62fd3sm3302965pgi.33.2023.03.22.22.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 22:29:40 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 kvm@vger.kernel.org, hare@suse.de, Paolo Bonzini <pbonzini@redhat.com>,
 dmitry.fomichev@wdc.com, Hanna Reitz <hreitz@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v8 0/4] Add zoned storage emulation to virtio-blk driver
Date: Thu, 23 Mar 2023 13:28:24 +0800
Message-Id: <20230323052828.6545-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1035.google.com
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
considered in following-up plan.

v7:
- address Stefan's review comments
  * rm aio_context_acquire/release in handle_req
  * rename function return type
  * rename BLOCK_ACCT_APPEND to BLOCK_ACCT_ZONE_APPEND for clarity

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
 block/qapi.c                                 |  18 +
 hw/block/trace-events                        |   7 +
 hw/block/virtio-blk-common.c                 |   2 +
 hw/block/virtio-blk.c                        | 405 +++++++++++++++++++
 include/block/accounting.h                   |   1 +
 include/standard-headers/drm/drm_fourcc.h    |  12 +
 include/standard-headers/linux/ethtool.h     |  48 ++-
 include/standard-headers/linux/fuse.h        |  45 ++-
 include/standard-headers/linux/pci_regs.h    |   1 +
 include/standard-headers/linux/vhost_types.h |   2 +
 include/standard-headers/linux/virtio_blk.h  | 105 +++++
 linux-headers/asm-arm64/kvm.h                |   1 +
 linux-headers/asm-x86/kvm.h                  |  34 +-
 linux-headers/linux/kvm.h                    |   9 +
 linux-headers/linux/vfio.h                   |  15 +-
 linux-headers/linux/vhost.h                  |   8 +
 qapi/block-core.json                         |  62 ++-
 qapi/block.json                              |   4 +
 19 files changed, 769 insertions(+), 21 deletions(-)

-- 
2.39.2


