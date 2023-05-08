Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205476F9EFA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 07:19:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvtHV-0005Xw-TE; Mon, 08 May 2023 01:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtHU-0005Xh-KH; Mon, 08 May 2023 01:19:28 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtHS-0002rc-Fs; Mon, 08 May 2023 01:19:27 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64395e2a715so4005040b3a.3; 
 Sun, 07 May 2023 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683523164; x=1686115164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=urFUln5yDcErfE9VzZpJo4TE72TWyNGlpjCIUcZqP/o=;
 b=aZu0JFUvc0URuOdKA8nO5yfw53CfQlWIUnOI/HJzPnduD8CTg0wFaHVwLk3aAQ/Qhb
 wUH8HYvdBeMGNgRj9j4CAw6SEcfoMrXmDX3sknd5Cl9bXMTZB6fuHB6j6nT1XTwylz+f
 lMuDsQPNkKMtjn/2R+00mIe6e7mzbC7FWgk1C9U5Vsecj2H2knb0ZXShvLAXEoiPAhZx
 37mJPQW9jWjG89R0ozOkYPtM5xDf1icVP1PsNI54OmHm3z2KW2dO98YbHxm82ftnKidE
 jCO6jfvZg72Uw4gvj47hHxUAb5Q4kPbxnoEgk9F/PmCYB0HLp0PuH+QqvplaDq4CZdFo
 oHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683523164; x=1686115164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=urFUln5yDcErfE9VzZpJo4TE72TWyNGlpjCIUcZqP/o=;
 b=iQUnmenScfnGgOqswiiZDLebJ6FgQ70nPo+9tXilT525eN/KOvohGVREX2kkGzpwyn
 0SfmLiMBTx3xckRZWTBbi4M5wWkqs6bJVs/KJttjm/PucJNuMts6ua9E7g5Y7dOL22FH
 NwMZVGjGfqM+85BJ51zNNtxZmyuCWKQ7bIlb4ulVHLxjxCLu07LTvY+2MRf2mjYBIsEM
 zTXci9jsB/mEWPrtwuaCmvhx8K4dw1cLZjCyIaltMIjjM0fsvJzV4vK3u135aODfuHuc
 +sLVwEmTPs5sWbDNrr2NluJEkhMJujCI/gKf2Eh26oyp0b1sO+C8pAFMcHi/Q2C8ywOn
 T8Mg==
X-Gm-Message-State: AC+VfDzsemyOYfUaaj1810DmsLU3AxIFHDApvPQAnlfX3l8Zkjhq39F4
 ty2IpZurHzWJalReeXuUIAyv4bviSlGBSCp8
X-Google-Smtp-Source: ACHHUZ68R10FF4MZTqA3CT0ZycaBYjVh+U+kcdpK8LtXGDMbfQY0OJK8HyB/DU358y+A96eYMkn01A==
X-Received: by 2002:a05:6a20:7d8c:b0:ef:e240:b552 with SMTP id
 v12-20020a056a207d8c00b000efe240b552mr11778580pzj.46.1683523163761; 
 Sun, 07 May 2023 22:19:23 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 j1-20020aa783c1000000b0063a1e7d7439sm5247997pfn.69.2023.05.07.22.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 22:19:23 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de, qemu-block@nongnu.org,
 dlemoal@kernel.org, dmitry.fomichev@wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 0/4] Add zoned storage emulation to virtio-blk driver
Date: Mon,  8 May 2023 13:19:12 +0800
Message-Id: <20230508051916.178322-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch adds zoned storage emulation to the virtio-blk driver. It
implements the virtio-blk ZBD support standardization that is
recently accepted by virtio-spec. The link to related commit is at

https://github.com/oasis-tcs/virtio-spec/commit/b4e8efa0fa6c8d844328090ad15db65af8d7d981

The Linux zoned device code that implemented by Dmitry Fomichev has been
released at the latest Linux version v6.3-rc1.

Aside: adding zoned=on alike options to virtio-blk device will be
considered in following-up plan.

v11:
- drop update virtio-blk header patch
- fix CI issues [Stefan]

v10:
- adapt to the latest zone-append patches: rename bs->bl.wps to bs->wps

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

Sam Li (4):
  virtio-blk: add zoned storage emulation for zoned devices
  block: add accounting for zone append operation
  virtio-blk: add some trace events for zoned emulation
  docs/zoned-storage:add zoned emulation use case

 block/qapi-sysemu.c          |  11 +
 block/qapi.c                 |  18 ++
 docs/devel/zoned-storage.rst |  17 ++
 hw/block/trace-events        |   7 +
 hw/block/virtio-blk-common.c |   2 +
 hw/block/virtio-blk.c        | 405 +++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-qmp.c       |   2 +
 include/block/accounting.h   |   1 +
 qapi/block-core.json         |  68 +++++-
 qapi/block.json              |   4 +
 tests/qemu-iotests/227.out   |  18 ++
 11 files changed, 542 insertions(+), 11 deletions(-)

-- 
2.40.0


