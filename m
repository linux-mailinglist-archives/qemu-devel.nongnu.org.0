Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B64668AF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:53:17 +0100 (CET)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspKe-00078G-OK
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.mielke@gmail.com>)
 id 1mspFM-0000ZJ-Vn; Thu, 02 Dec 2021 11:47:49 -0500
Received: from [2a00:1450:4864:20::52d] (port=42801
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mark.mielke@gmail.com>)
 id 1mspFI-0005UC-CA; Thu, 02 Dec 2021 11:47:46 -0500
Received: by mail-ed1-x52d.google.com with SMTP id r11so434922edd.9;
 Thu, 02 Dec 2021 08:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/+pYBHWwoVbB7dUwLy+g2yXoaXy5z2uXR7Do0ZlzUbk=;
 b=e2gg/V3ULVDWGzQiEpuPnOwsg98rKtfLrjoyZnvW0D4MSvARs614YyyQ8rlWGC82Os
 z0PSHUZIhZScVWjdXSdewXR9FevpI9tpZCj7WRBNUnjn8n/M5Kurp3WmDdPhJ6MMqPAv
 5f1xbIvA8GxAL94FSHFgAK0+rftI684r6mak9whrsV9NbePe2AP7W5oxkMHCyeMnMBp1
 kUtns+/Pbpk43BKnY9hJQAUa52s87e8Eplxd6RTIyIec4RrKfDI9njd3Vc0WxptT/wmv
 Rcv1sOntwNXfeoTJRBVA6Pe3QGs2Wh8RFzEIVKEC1KT/Dcu/Om4HWbe8BNpHu7ThI6oq
 0V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/+pYBHWwoVbB7dUwLy+g2yXoaXy5z2uXR7Do0ZlzUbk=;
 b=33yjFhoMJHqo0iVIaip1m4n/WH9bSCHX+avHXFHGbC5FugmXKzmvTpasQ8WVGw84+j
 wAIJ8BkHrCsjRw4BW5bfI7TGuKwKlnG86McYcP78GdbBV9PoZV5a2lqsX9Z9iGY/8xiD
 leCm4LRvaV2blVGU+xXdvRXNKVdgYGkXJwHR9srARz7EFeQZlTce+FTzNCkgEkjtYUKm
 4XiZkN9aOjsTpIfZOqU1URZF4Bu19mmj3keiruaF/+TPC35PReebJayeXgBVvvrUm6tF
 VMBUKJ829jOOKpwcUNbhWAejG0DkqdnL7yaGD5nuLbDUZskMGaC9wXKu4rOdJeq9ML8K
 ZyRg==
X-Gm-Message-State: AOAM532w94T7u2FEXdk68zWvYSJHnj6XMGiN5+calLCu61d986wUdb7p
 MPYA8iCAfv8yqbn2skOjp7zA+7lE8E9aFhh7L5F/tu9wj4Y=
X-Google-Smtp-Source: ABdhPJy1agj58JrKBURoJDugkYptifiAT6Vo80u5cTMPuruDpfdWO4nbNYedSI4MuPCilzzwGERFjnQbPv5XX6CRmw4=
X-Received: by 2002:aa7:c714:: with SMTP id i20mr18856455edq.180.1638463660464; 
 Thu, 02 Dec 2021 08:47:40 -0800 (PST)
MIME-Version: 1.0
References: <CALm7yL08qarOu0dnQkTN+pa=BSRC92g31YpQQNDeAiT4yLZWQQ@mail.gmail.com>
In-Reply-To: <CALm7yL08qarOu0dnQkTN+pa=BSRC92g31YpQQNDeAiT4yLZWQQ@mail.gmail.com>
From: Mark Mielke <mark.mielke@gmail.com>
Date: Thu, 2 Dec 2021 11:47:29 -0500
Message-ID: <CALm7yL2gSF8cstgaCmqWmn-3yn9bt0L5QDn9YnmUZQkXPa-A+A@mail.gmail.com>
Subject: Fwd: [PATCH] virtio-blk: Fix clean up of host notifiers for single MR
 transaction.
To: qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=mark.mielke@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry... I missed copy maintainers and qemu-stable. This should be
considered a regression.

---------- Forwarded message ---------
From: Mark Mielke <mark.mielke@gmail.com>
Date: Thu, Dec 2, 2021 at 11:26 AM
Subject: [PATCH] virtio-blk: Fix clean up of host notifiers for single
MR transaction.
To: <qemu-devel@nongnu.org>


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

