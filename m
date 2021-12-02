Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BE74668D5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:07:31 +0100 (CET)
Received: from localhost ([::1]:32986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspYP-00011m-P2
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:07:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.mielke@gmail.com>)
 id 1msovQ-0000MB-PT
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:27:13 -0500
Received: from [2a00:1450:4864:20::536] (port=43990
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mark.mielke@gmail.com>)
 id 1msovL-0000kl-Nx
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:27:12 -0500
Received: by mail-ed1-x536.google.com with SMTP id o20so176589eds.10
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 08:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=rMDRBAE6JqfCQ6zLRXgMOIeYyBLV3PVfS5lIALN12ww=;
 b=qrxpqqMowlL7UdsKsxC11fe60lt+NjavOncTA3wuUxfZLZOLED6+m9zoWYS8pNaPt6
 PsXxDdtzJV9ytLmeRA93BdHWTTtSH8LPiFrtlHBokqBqOuEQm7NxDOS39Ex7rPsjzznj
 W1+ikPQJzgMCP9AQeVC/ig98Zp3BuJYfvJkX+8fl6ogCpsUl/gTRyck2RXt5sHyUpfXw
 yJaliUABnXUl+XXs313776ONdctYlRJB0pDgFCWLYyYMYiyMszrbYVTQfFcCUvRDfKMb
 kE3KE9ZKiqRc2wVtaOswXHJJF1sIeJ7SpDYVGBNjTXoJrLF/q3f5j6vTCjtzIL7Ytyxj
 5DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rMDRBAE6JqfCQ6zLRXgMOIeYyBLV3PVfS5lIALN12ww=;
 b=bhvJSQeEr6DVaKIOiPH/920aGDlwFkZpn4caxMnq1mj0q1rtQHgYimY01zwFKs7gV6
 tgEOLCFL4oLp0hl5kkiH4LZl4a1v2L7krJtirdK/0qNs3Pl7/o3eyf2IGuwTdlvD/UNv
 WSnolkRimMO1jdQjjn0vnqk7YSQUxZyKa52jJbyV8kKyHrPIGeJ6qgPpY1ED01SgQ8L3
 OQTSc9icEYcs4OSQn9NqKU6eOY6OCsdBXflWX4wOxd7ZXIe9qyW29nphkmx6jd3Z3zO8
 ZosxgbVVRxIBMKfanrYHM5kCTDQD79LwjiqOGYNl+n++diZA7nhLmt9+pFRydB3M0vQ4
 8jkg==
X-Gm-Message-State: AOAM530DLoghKC7e4jhfFulGb9zUCNMIW2Px1XjuO5AjjzTT4zrMH1sM
 WxgrElzqXid2Tg5OKgTUNADW5iq+kdLVjq/gybSt4Y+Srj4=
X-Google-Smtp-Source: ABdhPJzeVbDrm1XjPKm6L9YG668MPc98JJy0xeWUV0HcmF1RLuOP9xi8yuDCyi1/mOxa6XwXKykAzzSysMV9QyCXvOo=
X-Received: by 2002:a50:d88b:: with SMTP id p11mr18496026edj.287.1638462422547; 
 Thu, 02 Dec 2021 08:27:02 -0800 (PST)
MIME-Version: 1.0
From: Mark Mielke <mark.mielke@gmail.com>
Date: Thu, 2 Dec 2021 11:26:51 -0500
Message-ID: <CALm7yL08qarOu0dnQkTN+pa=BSRC92g31YpQQNDeAiT4yLZWQQ@mail.gmail.com>
Subject: [PATCH] virtio-blk: Fix clean up of host notifiers for single MR
 transaction.
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=mark.mielke@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Dec 2021 12:04:19 -0500
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

The code that introduced "virtio-blk: Configure all host notifiers in
a single MR transaction" introduced a second loop variable to perform
cleanup in second loop, but mistakenly still refers to the first
loop variable within the second loop body.

Fixes: d0267da61489 ("virtio-blk: Configure all host notifiers in a
single MR transaction")
Signed-off-by: Mark Mielke <mark.mielke@gmail.com>
---
 hw/block/dataplane/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 252c3a7a23..ee5a5352dc 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -222,7 +222,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
             memory_region_transaction_commit();

             while (j--) {
-                virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
+                virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), j);
             }
             goto fail_host_notifiers;
         }
-- 
2.33.1


-- 
Mark Mielke <mark.mielke@gmail.com>

