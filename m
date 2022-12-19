Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C23650878
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 09:18:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7BKr-0001rk-Si; Mon, 19 Dec 2022 03:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BKi-0001qp-LH; Mon, 19 Dec 2022 03:17:13 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BKf-0002pw-1C; Mon, 19 Dec 2022 03:17:12 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so12177417pje.5; 
 Mon, 19 Dec 2022 00:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FKY8ZIoGkAcxH4ejvLJxSdvTsfSI3TFz6YvVApjzUQg=;
 b=gfWW/wlUZyEp1sK6w8kTZ2eIE28qaN8sbaf9ZH0ifcH+tYI1E/zhRXF8gS5Kfj3M2R
 ZhDRexgUBZtZOIOGMHyOvdWK9z1Y14VYMNepbCdlLmwTJKrPFtqmQjS1lXdiBE9VvD4/
 T9HONjp1S8xVbmD7axFTxgNNpqNYC+YO/1iWbfGoQ4vfLA6V+mG+Y7owVeClmCljcFlC
 NjSy6Fj2uhDm4iRgY6ViCWtYlHVAaF01rOIpvHfz/ymiR5WzGyt3nt5S8npactGmFe9z
 vAQB+Qdt5fbKydGhh+gPgNJiKm4ZEojYgUcCQWKhvXRqJYeZ2uQuJfX8g9kyvSlIRZPB
 h6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FKY8ZIoGkAcxH4ejvLJxSdvTsfSI3TFz6YvVApjzUQg=;
 b=PLzEgkmQkMfFM87/8bJ9Xn28o/ypIM2lx5vsI6M6JJj1UPDkW5wL/qfle+3jqE472e
 TXMrU83PVCbKAdNY9jO16kUvX7kurGRbes3yWOBQMaDtRsb3zONuE/nYggxRfyHlXm9c
 9vh3rN9zXqgLzCa0X8pdYuLYKsvZclD0Dlr+g6yC+ImsQs0ucmcBUbaiIoGhBh2uIG3y
 Qs8DTiRSE+5FRR2CeQOf9xqxK5UjWbdJJucjXKwiuq/W+UayGI7jlnmG8gq1ukwGxwoZ
 d3lFOhozFTk3yDbSgFWkKPR9JzOyktfPm8n95EhPFTMzz78QKWLi3Y5PKUpjiNpqYilh
 wKeQ==
X-Gm-Message-State: AFqh2krIX4TijFkYsfvAbE+HOwCWVD5yVeKvQqjxbaXeEe1/5lcQL8fT
 4e3zF5bE5BqlsCD4qTFe7Mo/RRGRbMrK7ckp
X-Google-Smtp-Source: AMrXdXsSh2YiT2LNihxlqmFy52Yt3ObA3zy3SdXK5XowK0Sp3GE4NSitOT55bw8ETpg+HzfkP5Tq6w==
X-Received: by 2002:a17:903:2615:b0:18c:fd25:a934 with SMTP id
 jd21-20020a170903261500b0018cfd25a934mr8379612plb.61.1671437826081; 
 Mon, 19 Dec 2022 00:17:06 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170903234a00b00177fb862a87sm6434337plh.20.2022.12.19.00.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 00:17:05 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 hare@suse.de, qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, dmitry.fomichev@wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 0/3] Add zoned storage emulation to virtio-blk driver
Date: Mon, 19 Dec 2022 16:16:41 +0800
Message-Id: <20221219081644.11790-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1033.google.com
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
marked as an RFC. More information can be found here:
https://patchwork.kernel.org/project/linux-block/cover/20221030043545.974223-1-dmitry.fomichev@wdc.com/

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

Sam Li (3):
  include: update virtio_blk headers
  virtio-blk: add zoned storage emulation for zoned devices
  virtio-blk: add some trace events for zoned emulation

 hw/block/trace-events                       |   7 +
 hw/block/virtio-blk-common.c                |   2 +
 hw/block/virtio-blk.c                       | 395 ++++++++++++++++++++
 include/standard-headers/linux/virtio_blk.h | 158 +++++++-
 4 files changed, 546 insertions(+), 16 deletions(-)

-- 
2.38.1


