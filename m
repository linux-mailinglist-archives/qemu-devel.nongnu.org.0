Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F1067FE48
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 11:41:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM56X-0005Aw-2w; Sun, 29 Jan 2023 05:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM56S-0005AN-8l; Sun, 29 Jan 2023 05:40:04 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM56Q-0000Vy-CM; Sun, 29 Jan 2023 05:40:03 -0500
Received: by mail-pf1-x42b.google.com with SMTP id u5so5585320pfm.10;
 Sun, 29 Jan 2023 02:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hx9YI4GAF7fXmV3RcfiCqXWek+E3OAFhySq0hDCfUlM=;
 b=GbbTqgYSdMnlCTeNIrt7drU/DeRJulIEBWxKNsUxGZnbJuFN5RWcGv/iG1V7RDEQbD
 w/9ZCFNh2L3egtJlIL1NF7yaF9zrF2Ce5sItr05Q7fhMt7/Uqe3tKYk3yv2RMDdRgQ19
 R++KkQ3Jnuf8HHBpb2Y2X4EM2HVYa3iBzUPHFWB4CgS8RzRq0ovabqGY2w8UIo/C/LPf
 sxwYHZ9qYpDCycp4ZX/NMFzJ+RX2E+xDm3Wj7yQ1i0sRGyo5doMYdKCLIb+d8p8Oqvr5
 k5PRmnoOzCogGmOBd//Sa8ck/WRP41ZEegF6H8/c3oY4htxJ/n6yrxYPcCGdsbSP/SRo
 +xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hx9YI4GAF7fXmV3RcfiCqXWek+E3OAFhySq0hDCfUlM=;
 b=dWyG7bcWFtbL3ahJDBta+I00QZUfRa6PRXIAFX86qvfrFgeuPkxrAeuN3WRun9jixP
 9by9qE2xHaTmJ1h3I1OcTTQ1Pg1bXu8hpL43NorXEaT6EBrwGw4XGCGngeyFGIgpp4Lk
 rqXxUhnfckZGh6gkBTU66AO0G+0Ki3YNfYGyl447F0rDEFOnfm6IlZbWC30HwzqeuIgm
 i1Iq5gVVFvTl83aGvW1UR++eslYzSvEyrW2JCz/2+ccaOWQYMkkGcc1CjjnEKkjgnNRe
 vEYlZkXmS2tv4BaNUdxJst6aDV4LCFqY4o906eLIbvjh1jagId10KZLNCCvI2FRA0mE4
 A9dw==
X-Gm-Message-State: AO0yUKXHQh29NJ1SCIa9xtCs0VurXRWWWfFkt1bwKI1lY88r0a/MlfYa
 E3QXSJpzEPhv1jb7x95d8jBD5iKYg8TG9HikiHk=
X-Google-Smtp-Source: AK7set8jtpgVi6yJwfBSjKXPSK+hutkc9dacbWbICplZckq8NLnXL5zPy8QOjSl/pHXcnwOilBqipw==
X-Received: by 2002:a05:6a00:1501:b0:590:7103:232a with SMTP id
 q1-20020a056a00150100b005907103232amr18107615pfu.1.1674988799651; 
 Sun, 29 Jan 2023 02:39:59 -0800 (PST)
Received: from fedlinux.. ([106.84.129.237]) by smtp.gmail.com with ESMTPSA id
 o14-20020a62cd0e000000b0058d92d6e4ddsm5458759pfg.5.2023.01.29.02.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 02:39:59 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 stefanha@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, damien.lemoal@opensource.wdc.com,
 hare@suse.de, Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [RFC v6 0/4] Add zoned storage emulation to virtio-blk driver
Date: Sun, 29 Jan 2023 18:39:47 +0800
Message-Id: <20230129103951.86063-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42b.google.com
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

Note: the virtio-blk headers isn't upstream in the kernel yet therefore
marked as an RFC. The VIRTIO spec changes have been merged. The Linux
virtio_blk guest driver patches are in Michael Tsirkin's vhost tree:
https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/tree/drivers/block/virtio_blk.c?h=vhost

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
  include: update virtio_blk headers
  virtio-blk: add zoned storage emulation for zoned devices
  block: add accounting for zone append operation
  virtio-blk: add some trace events for zoned emulation

 block/qapi-sysemu.c                         |  11 +
 block/qapi.c                                |  15 +
 hw/block/trace-events                       |   7 +
 hw/block/virtio-blk-common.c                |   2 +
 hw/block/virtio-blk.c                       | 410 ++++++++++++++++++++
 include/block/accounting.h                  |   1 +
 include/standard-headers/linux/virtio_blk.h | 158 +++++++-
 qapi/block-core.json                        |  56 ++-
 qapi/block.json                             |   4 +
 9 files changed, 637 insertions(+), 27 deletions(-)

-- 
2.38.1


