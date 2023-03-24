Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997816C820B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 17:00:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfeZL-0007TN-UU; Fri, 24 Mar 2023 06:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfeZF-0007SY-GU; Fri, 24 Mar 2023 06:22:41 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfeZ4-0007za-NY; Fri, 24 Mar 2023 06:22:41 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id dc30so632283vsb.3;
 Fri, 24 Mar 2023 03:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679653344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N6Vxj015pqt1W0XnDOUHqu9GT8QgN1kOUZXj43n+nL4=;
 b=IYRVfq1QtOBmfVp/Ykn8Uvw9D04Y/lIK7Q9yL2NmxaPtExN2ArK7IkMxDa3IrZwbGQ
 NPZuPMQjpDx0e7e2evSyO/F5ikWHJTH0SMkDQXkZda8ciay66DZdECZ45r2wgBK1UEKw
 8A+CQL/Rc5usZ+zVSZgBBnKaKkeA7QzhkP5j9xrFjizIu7Mn6H1azuAISp+is//BEDEd
 m8w2QJrjoXmNkHEcYS/lf0e8Q9D1Vmu9uwTNcFrGI6FYSIImNC6a+YBz660jc6cnpuGB
 3kjkIK6T9ZG2VaT7KU4l2XQHtxLV+gdjMD+V9jAHp78BXKquP8gA5PuEPLify494CffM
 BoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679653344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N6Vxj015pqt1W0XnDOUHqu9GT8QgN1kOUZXj43n+nL4=;
 b=0tbHO/CKpwMFDUwb6NACUJMRFWuhGBMNqqHcS6ZveGbIFlOeh5GgVnn7bTpIDLfenI
 Ddb5mCVKAsMRSZfY31W6RTWXAyALWUET+LyXtH0KJAFqehVMCfXu79fc2PQgTXQQSohz
 0qVR0yNeHlhKhtXT9SB+bURHSwe3evHZ8jOts9bq6WQJXWysIGahHjpohv2MN8nzkuG5
 H+eXa0zXzlLF1PosdwHKsGjTR8RM9ZOL58x4aScYBCTffwdlvZEQ5ZTa8jlfWgZozSf7
 4HVMRUrQRnFu1D0X/R5qBIsDWOhJVrsUjCsX1ZguWbCxRyX6TxhLmNwbheFK5A8Z+WlA
 5boQ==
X-Gm-Message-State: AAQBX9eoBl/ByoNzYpJVMGxYNtPoQamntraR60Mxe6PgMhpOKYTD6eVJ
 FPpEQMtVwL725BoW1tIwhd/seBnDDA5izw==
X-Google-Smtp-Source: AKy350YVnV5iibdqwKaOIdDBk44LbQ0nGJPEal8htAtmGVh3WGiP7GDTSfJcPSuPsuOnQfkztwY10A==
X-Received: by 2002:aa7:9f8f:0:b0:628:9b4:a6a2 with SMTP id
 z15-20020aa79f8f000000b0062809b4a6a2mr2370516pfr.15.1679652845009; 
 Fri, 24 Mar 2023 03:14:05 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 h24-20020a63df58000000b0050f85ef50d1sm8282421pgj.26.2023.03.24.03.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 03:14:04 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de,
 Cornelia Huck <cohuck@redhat.com>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 damien.lemoal@opensource.wdc.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org,
 Eric Blake <eblake@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 0/5] Add zoned storage emulation to virtio-blk driver
Date: Fri, 24 Mar 2023 18:13:52 +0800
Message-Id: <20230324101357.2717-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe2c.google.com
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

v9:
- address review comments
  * add docs for zoned emulation use case [Matias]
  * add the zoned feature bit to qmp monitor [Matias]
  * add the version number for newly added configs of accounting [Markus]

v8:
- address Stefan's review comments
  * rm aio_context_acquire/release in handle_req
  * rename function return type
  * rename BLOCK_ACCT_APPEND to BLOCK_ACCT_ZONE_APPEND for clarity

v7:
- update headers to v6.3-rc1

v6:
- address Stefan's review comments
  * add accounting for zone append operation
  * fix in_iov usage in handle_request, error handling and typos

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

Sam Li (5):
  include: update virtio_blk headers to v6.3-rc1
  virtio-blk: add zoned storage emulation for zoned devices
  block: add accounting for zone append operation
  virtio-blk: add some trace events for zoned emulation
  docs/zoned-storage:add zoned emulation use case

 block/qapi-sysemu.c                          |  11 +
 block/qapi.c                                 |  18 +
 docs/devel/zoned-storage.rst                 |  17 +
 hw/block/trace-events                        |   7 +
 hw/block/virtio-blk-common.c                 |   2 +
 hw/block/virtio-blk.c                        | 405 +++++++++++++++++++
 hw/virtio/virtio-qmp.c                       |   2 +
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
 qapi/block-core.json                         |  68 +++-
 qapi/block.json                              |   4 +
 21 files changed, 794 insertions(+), 21 deletions(-)

-- 
2.39.2


