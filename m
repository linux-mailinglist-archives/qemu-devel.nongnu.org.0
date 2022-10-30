Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61061297A
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 10:34:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op4gs-0003vj-Vj; Sun, 30 Oct 2022 05:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1op4gm-0003tp-QH; Sun, 30 Oct 2022 05:33:09 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1op4gl-0000kJ-96; Sun, 30 Oct 2022 05:33:08 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u6so8380985plq.12;
 Sun, 30 Oct 2022 02:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L7OIgGMbcV7uogqV3w5zHhXCX1IdqrFw11S6KkpWt8c=;
 b=pkDe0ZxvZ+ufryFwWzEsHIOde42ahFaXJMIiu2IickzVHFEk0jheJvm3h4UgkgUmDd
 5Kao8Q2RWMxR0OOp1IZofTMxt0UhU3Ja/t2+S7ry9WYzzAMJnskWHHAqZCiyylhAjp9w
 6acElzGzlYpN2ZKZwXpJnA5pCzJtSrGbCcdIBCbU1//oY0x9b5I1ENZHNPI9iOxNOChR
 vSAVo3bygJ6/t0cpqaGNyw5A9GCWL8uQOc+wAAfq1Llchp+r20FtZMDo38sBvlAO6vrf
 0tDVfftfwnnJxUWu1OWynRbgfVFQqVmQLQ1iRhHLFwUQIiixfteb7fCL4s3olOvuY9RD
 8phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7OIgGMbcV7uogqV3w5zHhXCX1IdqrFw11S6KkpWt8c=;
 b=sDqXgXe8t4lXJS475p9bi9d/86hmieqfwvYJCX1q0qW8ysKOokYcyatCT3Ui0QDKaf
 xA8E6Zw1D5Cfg411QNfgLPGRqF7AIT4TYTrrIzMu2jPbrlIL1RD5i1/pglse+gtf4J4b
 sadoTc2fVlRep09clmOsNT10b/pPkekQXR7RkMUyuK99TbkpTtNz7OC1NRvPg40l4QGh
 WHQkfH53oYTM9iBLq7KiQJj3cxv9Mrw+YPxJoAFI+ausXcScqqqXco0CQh+NL6LS+sr0
 VL0f4xUV7OGPirccnicI5cDSh60T2b0ajM8TC42rhcsVNlWCyy4h3TgBdYNh+Z1+1tPl
 nBbw==
X-Gm-Message-State: ACrzQf2JQJ9x/kmfZwkUDCiINtZ0yBxtOdVHwuYdR72j8eEEIT/mFvxr
 RsRr503lBtASGK0EkUh9b5Mi7/Spjahbvfc2
X-Google-Smtp-Source: AMsMyM4lg2v0qJpNa0d7t2yIxivhZsIQ993OUwFA1YbEYjdndEwf5CV4/j/ffFE58ZfGe04OWp9dsQ==
X-Received: by 2002:a17:902:ef51:b0:180:7922:ce40 with SMTP id
 e17-20020a170902ef5100b001807922ce40mr8423900plx.8.1667122383198; 
 Sun, 30 Oct 2022 02:33:03 -0700 (PDT)
Received: from fedora.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0d4100b00205db4ff6dfsm2113445pju.46.2022.10.30.02.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 02:33:02 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 damien.lemoal@opensource.wdc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 0/3] Add zoned storage emulation to virtio-blk driver
Date: Sun, 30 Oct 2022 05:32:39 -0400
Message-Id: <20221030093242.208839-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Note: the virtio-blk headers isn't upstream in the kernel yet therefore
marked as an RFC. More information can be found here:
https://patchwork.kernel.org/project/linux-block/cover/20221030043545.974223-1-dmitry.fomichev@wdc.com/

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

Sam Li (3):
  include: update virtio_blk headers
  virtio-blk: add zoned storage emulation for zoned devices
  virtio-blk: add some trace events for zoned emulation

 hw/block/trace-events                       |   7 +
 hw/block/virtio-blk-common.c                |   2 +
 hw/block/virtio-blk.c                       | 399 ++++++++++++++++++++
 include/standard-headers/linux/virtio_blk.h | 158 +++++++-
 4 files changed, 550 insertions(+), 16 deletions(-)

-- 
2.38.1


