Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D862631F73E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:21:08 +0100 (CET)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2uJ-00049v-8v
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2sm-00035Q-4e; Fri, 19 Feb 2021 05:19:32 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2sj-0006De-Ls; Fri, 19 Feb 2021 05:19:31 -0500
Received: by mail-pl1-x632.google.com with SMTP id b8so3094221plh.12;
 Fri, 19 Feb 2021 02:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qK6u1kd/x2yhxSOnGN/M0abIxiI0Av0ZOEpmLwGtIG4=;
 b=FmcVleFatkvtWPt27oFFq65D+aqekLNY5DHHPX/t3aBHbWwCw8gsuwpjDH3Tm48keE
 w+kLBPcNDU6LQRBLCMuEVEUgXmy+GjZBNPqVsxh6VQojjZbmk/Uu3ihWfAFh/As2ska5
 FAkau5TRAkG4EYA91CeX041jTnodNVZ9i3M2NLG4uP38tlouXoRwBwoWO/vP3kE0Vgl0
 B52iUQJgFSYTlHc8YtJRO3V64hAuwWiNdPCFtNHbnOQfGR7C7SOjXmHtCZmdiTHuUmwA
 BOXQvOmVICMAAv0F4pUHeKgyicMuk+79ec+HXz8OhMFZ6PjvhP40QBsmJGOGW+1iZDTQ
 sDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qK6u1kd/x2yhxSOnGN/M0abIxiI0Av0ZOEpmLwGtIG4=;
 b=na2nuplc7pSDARuMOemaK5XzJ6TysgXqi3AgZu8OzRD9kqjXSvGcz7JA1flaqcMOzM
 hc+Y+CPQRBIKBJnOAOeS+l5rEtoPOP/o2Ys6out9TvClCEixJEAWKRprFyMJZs5c4jUL
 0sjTITE09MDTzSY5nTfPlysEQ1nx1B3vTLtoDJ0UHv98n0w+RtvyUmqIIOx08QuO55Az
 YmzwR8aWNfdHehTwqu5fMvvdX3Y95fZCiYE9StM/Das9ffSbSkUhe955MxHpOKuieUyq
 UNsGe6djsia5kgQM4jBzoXTDKESHYYitdYDhnXHmrULRMcr0RuHT10uGR5A6bCZ285qp
 pvWg==
X-Gm-Message-State: AOAM531FXg+gRlKvCXINiZw6lJ2G55DB+yL7Ea4meqafFxIZosgUH5Bm
 rtt7fTYN/kBnHtPvDvTBcbp5kL6bVG41/g==
X-Google-Smtp-Source: ABdhPJz0DnMU7f12mjsfJpwb/Y2SeEo1b3LLvjhR49WUbYwJwqJdYRTTdI+RqnKzgHNgYZE6wT8Y8w==
X-Received: by 2002:a17:90a:4a84:: with SMTP id
 f4mr8617846pjh.231.1613729967648; 
 Fri, 19 Feb 2021 02:19:27 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id 188sm7370299pfc.98.2021.02.19.02.19.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 02:19:27 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] virtio-blk: Respect discard granularity
Date: Fri, 19 Feb 2021 19:19:19 +0900
Message-Id: <20210219101919.91069-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index bac2d6fa2b2..692fd17b0e0 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -965,7 +965,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
         virtio_stl_p(vdev, &blkcfg.max_discard_sectors,
                      s->conf.max_discard_sectors);
         virtio_stl_p(vdev, &blkcfg.discard_sector_alignment,
-                     blk_size >> BDRV_SECTOR_BITS);
+                     conf->discard_granularity >> BDRV_SECTOR_BITS);
         /*
          * We support only one segment per request since multiple segments
          * are not widely used and there are no userspace APIs that allow
-- 
2.24.3 (Apple Git-128)


