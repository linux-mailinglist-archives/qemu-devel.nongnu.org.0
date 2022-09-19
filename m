Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8595BCBCF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 14:29:58 +0200 (CEST)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaFuP-0003bw-82
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 08:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1oaFos-0006aF-BY
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:24:14 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1oaFoq-00043l-4Q
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:24:13 -0400
Received: by mail-pf1-x42e.google.com with SMTP id a80so19335989pfa.4
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 05:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=udRlNNeBNqhAgXCIOcJa0b4vX++DdmVnpvbaLOj43HU=;
 b=5Q7CqBVrwvTXOAMeIVYEviaxJX1lObD9aPHup8ix8Vo6RvlFbm7mJaV6v3nnJQk4dS
 lDdySGfXB3VSmovMJGdY5cSa5zpMJUom9XU95zVsKI4A8LFZJGciD4UjKHNTVquV5lSp
 yOQeUKjfSw4zzICuFTcTs1SGBKjpFQlvWsp551P/SZgIQOt95xrIMphl4jR9YHiZr7uh
 Edf60yMyoakMoVnjFDC6B0/YGxPfc3XaXso8O4rfYOOGhLksRTVFZd+LHW9CM6K6DQgH
 cvoWHH9XnyWSRuP+eM9+C+Cb0lKNfsKe+WauCgnLxVyTAJCfFBfQdwOlcGIk0fTgvWo/
 MVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=udRlNNeBNqhAgXCIOcJa0b4vX++DdmVnpvbaLOj43HU=;
 b=O6GsKxMl4VEadWVu3alMn31uwrbHrOl/Gou6Wnh0X+O5fINQbSfXLr/hPjcQDKTBns
 9cbLK3V5QduVa0AiethVmP86ESlTNmeK3Jm4aWYg7U9FuqZjAZx6B5tptsiu8W5+3Wl+
 gfyXtJ5150GpkFwyi2bxdDp1yEIPt33mGsz+5fPiDZqcoIpifII2lPbwPDGoYpdYJUnq
 DsdnIfzxZUuqOtdDUb0/ZBuD1DdANxtO9etXyoT+/GI472NnNhOB9Dq2aEjgOTWj2c1P
 GL4TpiXhyU/wTiQ0JFqN4joG/mrCHqCHghouCDDDxZVS0MjMlyALl7JpgoDmPZe3/Gnq
 7PQg==
X-Gm-Message-State: ACrzQf0Dd2Gmh6GLmghALKSV5JutwmixcQz0Z1hCLcTKMaxhCUspBhzl
 bMyrIq87byci8cBXMZsNZJ553tMiphkMaQ2F
X-Google-Smtp-Source: AMsMyM4DEJLK4wUyF+a02Z9HJ3HBoTvF7cBJGunGSt4QlyYkDW4/GhtpOH3ywmkkKY3kDBRUf7gdgg==
X-Received: by 2002:a17:902:e5c2:b0:178:2eca:9dea with SMTP id
 u2-20020a170902e5c200b001782eca9deamr12804529plf.73.1663589918401; 
 Mon, 19 Sep 2022 05:18:38 -0700 (PDT)
Received: from fedora.gitgo.cc ([2400:9ce0:11b3:acbc:7e66:5bee:653c:ded3])
 by smtp.gmail.com with ESMTPSA id
 k2-20020aa79d02000000b0053e8368ec34sm3989869pfp.32.2022.09.19.05.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 05:18:37 -0700 (PDT)
From: Li Feng <fengli@smartx.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core),
 qemu-devel@nongnu.org (open list:All patches CC here)
Cc: lifeng1519@gmail.com,
	Li Feng <fengli@smartx.com>
Subject: [PATCH] vhost-user-blk: fix the resize crash
Date: Mon, 19 Sep 2022 20:18:16 +0800
Message-Id: <20220919121816.3252223-1-fengli@smartx.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=fengli@smartx.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

If the os is not installed and doesn't have the virtio guest driver,
the vhost dev isn't started, so the dev->vdev is NULL.

Reproduce: mount a Win 2019 iso, go into the install ui, then resize
the virtio-blk device, qemu crash.

Signed-off-by: Li Feng <fengli@smartx.com>
---
 hw/block/vhost-user-blk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 9117222456..db30bb754f 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -95,6 +95,10 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
     VHostUserBlk *s = VHOST_USER_BLK(dev->vdev);
     Error *local_err = NULL;
 
+    if (!dev->started) {
+        return 0;
+    }
+
     ret = vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
                                sizeof(struct virtio_blk_config),
                                &local_err);
-- 
2.37.3


