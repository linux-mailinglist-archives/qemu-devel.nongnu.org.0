Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEDB1FB505
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:52:33 +0200 (CEST)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCwy-0006Et-4w
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCRK-0004zc-39; Tue, 16 Jun 2020 10:19:50 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCRI-00074V-Gg; Tue, 16 Jun 2020 10:19:49 -0400
Received: by mail-oi1-x243.google.com with SMTP id a137so19385672oii.3;
 Tue, 16 Jun 2020 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YubYL2qiQdxJE/c9v4DMH9xx2TRFI5UD3MIdHmHvxO0=;
 b=J9iP3/rt11NnS2JIkkFCVKlInENyvsvcLl3wBvpZnwpQ9VH735zPiRF4TQiS20iHah
 iJooTCQlYK8amOTh25n1wfaxMaeITCLg9rFRuqr5PHV2q+W67afMbwlXl5cS1JbWG6ea
 rJI6THvY7y2EwGtywEo5ChLT34S3R4tY8JooDoucRD11IEIa4fkVrb4m68ZBM+Dt0mUk
 7MDB+eoOqZymZArvGYU+JjMdn73Q0GYze8ztvpFgWjbi8JwOEQGy99T6j5qvqWXod7v7
 GQkgX/iwMR6eiQ/a15G8cDyFAnyxra/zJCcHDfjyiQXIuWz7zPeyo0EuV+EUrG0uqfmZ
 k/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=YubYL2qiQdxJE/c9v4DMH9xx2TRFI5UD3MIdHmHvxO0=;
 b=m+ErQD7umEmjSNtFioFPBf2/xEiTdprCA+en6qS16+RAoWq7Xn+xaPfSDpw5t33VT+
 PCIKK/elIEfYK12uY+2xjj5rgPiRonnRobsG2NDqmnhpksfiVHg4OTemI1zZMbVEDC9I
 kNGwsZcxOGBKJ9d4FK+PGJ6NueG9DcwcYTJ/ASzr5jJ9OqTjVCzGnwtDEUeaHmOHQC56
 m+yoUzFFdVH6DQxmH4Stob0geYAXaebg2dRjUwT/SO9c3YQv2aR3TtEIHDJBg4Bz/Yj9
 jKwMtynFmkGbEOh2xgcFQpCkC18e/6p0UMPJnqoh+gJzglRrY/SjDqerYyEEackMP9xg
 xFbA==
X-Gm-Message-State: AOAM533yI194MFORl8GJCvW0oxD/1pH7jMLy73/PjBwSMFKJ0nlwctA1
 UH9qHppt9ZZXMP+J7GwVaTpX+cdC5v0=
X-Google-Smtp-Source: ABdhPJwVCkzUVrTV3b8FUsAeQsRC1HL+buu9YdVRXOVUasx7Bt/UR3QMVLKrqrlGQps7ATeBBYcFxw==
X-Received: by 2002:aca:470d:: with SMTP id u13mr3485056oia.157.1592317186712; 
 Tue, 16 Jun 2020 07:19:46 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id 6sm4271111ooy.18.2020.06.16.07.19.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:19:46 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/78] virtio-blk: fix out-of-bounds access to bitmap in
 notify_guest_bh
Date: Tue, 16 Jun 2020 09:14:36 -0500
Message-Id: <20200616141547.24664-8-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=flukshun@gmail.com; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Li Hangjing <lihangjing@baidu.com>, qemu-stable@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Hangjing <lihangjing@baidu.com>

When the number of a virtio-blk device's virtqueues is larger than
BITS_PER_LONG, the out-of-bounds access to bitmap[ ] will occur.

Fixes: e21737ab15 ("virtio-blk: multiqueue batch notify")
Cc: qemu-stable@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Li Hangjing <lihangjing@baidu.com>
Reviewed-by: Xie Yongji <xieyongji@baidu.com>
Reviewed-by: Chai Wen <chaiwen@baidu.com>
Message-id: 20191216023050.48620-1-lihangjing@baidu.com
Message-Id: <20191216023050.48620-1-lihangjing@baidu.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
(cherry picked from commit 725fe5d10dbd4259b1853b7d253cef83a3c0d22a)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 hw/block/dataplane/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 119906a5fe..1b52e8159c 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -67,7 +67,7 @@ static void notify_guest_bh(void *opaque)
     memset(s->batch_notify_vqs, 0, sizeof(bitmap));
 
     for (j = 0; j < nvqs; j += BITS_PER_LONG) {
-        unsigned long bits = bitmap[j];
+        unsigned long bits = bitmap[j / BITS_PER_LONG];
 
         while (bits != 0) {
             unsigned i = j + ctzl(bits);
-- 
2.17.1


