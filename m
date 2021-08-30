Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E63FB730
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 15:45:57 +0200 (CEST)
Received: from localhost ([::1]:35618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKhbk-0002rY-Th
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 09:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangyuwei.9149@bytedance.com>)
 id 1mKgUv-0005v9-EJ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 08:34:45 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangyuwei.9149@bytedance.com>)
 id 1mKgUr-0001fE-79
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 08:34:43 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x16so6792973pll.2
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fPo9dQfdE2y5oJxkirZSLpXGC3oSVAkckZt6Uo+xcKc=;
 b=mlLdvOJjhhCbJ7uX/36xYkHl19r8NrFlekF0IQCjLlQxJoM86fAXOtTfMwFNfShGma
 DtiZO7azs3GoclJNunLQ19KKy/ZIfWf6+gkqlFSsoOPUyJF730hVx/LyVwgAjezoz5FH
 k9iu7AVTsxJq1dy9jBKvMdbsf3EmM32S0CVUxJ5xqrgDQVEAj8IlSbowDTnh1c0idzar
 Ia0fCGAhhZZ7R/M1kjoh/M4AD5mn1k2jcYy/5j1u/OC4YRBUOvox0NA06j6CdBA1xcWd
 YHyvroKfkQ/yoOPDUP+MjIfYJ2mrSzkS7uOF2pA+EcCy4tKCjkLdfAq8T4KGO/mGR3JF
 xIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fPo9dQfdE2y5oJxkirZSLpXGC3oSVAkckZt6Uo+xcKc=;
 b=gxuxx8naUNsBk1rQgWlZWnw6iut1MCHX9ocUSpwKBhNj+bOePBmyn8ppXRNsWLpVtQ
 YTwVZcJdgjAjPwx+Rc8JwOgOlIaRgZFVJhv3HoRRgWGq9SzStdamWsTNKQGOB0AxW2o6
 VEeu67y33oLDwk3dQhzgX4bW22uy7oUlLU1CdrSBYb5UWh3ttLdMtfKo7OJue7ptQr/H
 zo7O6Z56AiQAXpwcHX4zrxx+poy+8vW4Bcpanx1jKJV50eSQ0T6siym+8Ot4sQL5ijb0
 gH2P4FeKg+Rm1DRZwv0PUZu6AzGZOSxMWLOvkC3CZhnR6qVdURYxwOyYYmPMvIZ8twTm
 vCvA==
X-Gm-Message-State: AOAM531P+eSGHhU5QdQ8gIFMmNvhBj5gBTa0ArVN5WJvyot3DH9U+trN
 2JCbmctqAoPMFL8ZDkEbeU8sdA==
X-Google-Smtp-Source: ABdhPJzA8KspCUkDV9uU9Lke3PSP0QQdZlVwjPnlKNGYfIPUg8rQO2onpovzB2NC9g02SmwQhG2a/w==
X-Received: by 2002:a17:90a:460a:: with SMTP id
 w10mr37227553pjg.144.1630326879160; 
 Mon, 30 Aug 2021 05:34:39 -0700 (PDT)
Received: from C02FR03AMD6V.bytedance.net ([139.177.225.229])
 by smtp.gmail.com with ESMTPSA id h4sm12584494pjs.2.2021.08.30.05.34.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Aug 2021 05:34:38 -0700 (PDT)
From: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
To: mst@redhat.com
Subject: [PATCH] hw/virtio: Add flatview update in vhost_user_cleanup()
Date: Mon, 30 Aug 2021 20:34:33 +0800
Message-Id: <20210830123433.45727-1-zhangyuwei.9149@bytedance.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=zhangyuwei.9149@bytedance.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Aug 2021 09:40:47 -0400
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
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu will crash on vhost backend unexpected exit and re-connect                                                                          │
in some case due to access released memory.

Signed-off-by: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
---
 hw/virtio/vhost-user.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2407836fac..b59ebc7457 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2422,7 +2422,7 @@ void vhost_user_cleanup(VhostUserState *user)
     if (!user->chr) {
         return;
     }
-
+    memory_region_transaction_begin();
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
         if (user->notifier[i].addr) {
             object_unparent(OBJECT(&user->notifier[i].mr));
@@ -2430,6 +2430,7 @@ void vhost_user_cleanup(VhostUserState *user)
             user->notifier[i].addr = NULL;
         }
     }
+    memory_region_transaction_commit();
     user->chr = NULL;
 }
 
-- 
2.32.0


