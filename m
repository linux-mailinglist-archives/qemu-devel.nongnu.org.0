Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB914424381
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:56:54 +0200 (CEST)
Received: from localhost ([::1]:40120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYADt-00051p-Uq
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA75-00041Y-AZ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA73-0007Sb-PA
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633538989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+ZAZbWmuK9qI+HMawgY0ECoHoMJ3zL59+qK7eacaOw=;
 b=Bi4ABnmGRFofKRfDdQObMTve/PGjaiEMyd0rBbWVRamgshGCM8jxTirJ31s8Tw49XGjOVN
 5vx4dw/VtPi1ndU8laiwOmMGkTQS3FMhG/UaH+6RZCdD9S0oFNKsG4KsVgGKWoI5V203js
 hdoZks405I/SX+pUtnh5I7B01lu8JJA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-QievpNW1NrWL99p3dC3uGQ-1; Wed, 06 Oct 2021 12:49:48 -0400
X-MC-Unique: QievpNW1NrWL99p3dC3uGQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso2541134wrr.15
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k+ZAZbWmuK9qI+HMawgY0ECoHoMJ3zL59+qK7eacaOw=;
 b=RbuNwdh+xUmqonjIWYfDHFd4YSxfzTh0y9KTHM+Xn5P4RtJRU0JN02OxkhjJUto9MQ
 sy4L3iJztfzzngsr08x73Wnj7tAzjluiHDvZyR7s18QzpC2nCWeP9V6XJDKgZIhaBpVo
 /II6Z4IGijVw514aF/UgtRPnhvNGUVOPYmzGIdTFwtlFuXrg3LDlUyXZPm3B4N+rE6p6
 lcWuif+0reFvCW1Wj1VcrGIPZBLpZF8G8qhPyIvmqBWIXAbXT40K5IpGHyw+WZ2LUSGS
 ORC1inArIdwfd/iOu5LG5liSn09QInSs/9a/ORro+qtf0m+5H8E3vjXeo3p7v4JHADxw
 LbRQ==
X-Gm-Message-State: AOAM531CbxEC+iPC5gTX+ncSTLFR41anzoaHNkiLgwbPmHtIqLeKb+hB
 cxFrongmiahq7lhFHqFIXyTBdct/hoZVYpbxwVAbGjoD0RSF6vJeU9JrqrJPQoeygEGkjN1JLru
 kIBROoQbHmdPgKatN7y3EFFJcD2iEuKreN/BFYIT+hSPR77OeGY+Tb+7HrcnONiUe
X-Received: by 2002:adf:b353:: with SMTP id k19mr30254337wrd.325.1633538986717; 
 Wed, 06 Oct 2021 09:49:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzutprFgfB/UY53Z6w3HOQ7RCmMEs6QikmtESWYnrbW09dujC14zqUXYhEDaS34vi7r1rD9HA==
X-Received: by 2002:adf:b353:: with SMTP id k19mr30254305wrd.325.1633538986440; 
 Wed, 06 Oct 2021 09:49:46 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id r2sm6275534wmq.28.2021.10.06.09.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:49:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] block/nvme: Extract nvme_free_queue() from
 nvme_free_queue_pair()
Date: Wed,  6 Oct 2021 18:49:29 +0200
Message-Id: <20211006164931.172349-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006164931.172349-1-philmd@redhat.com>
References: <20211006164931.172349-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of duplicating code, extract the common helper to free
a single queue.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 0c94799a541..e4f336d79c2 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -183,15 +183,20 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
     return r == 0;
 }
 
+static void nvme_free_queue(NVMeQueue *q)
+{
+    qemu_vfree(q->queue);
+}
+
 static void nvme_free_queue_pair(NVMeQueuePair *q)
 {
     trace_nvme_free_queue_pair(q->index, q, &q->cq, &q->sq);
     if (q->completion_bh) {
         qemu_bh_delete(q->completion_bh);
     }
+    nvme_free_queue(&q->sq);
+    nvme_free_queue(&q->cq);
     qemu_vfree(q->prp_list_pages);
-    qemu_vfree(q->sq.queue);
-    qemu_vfree(q->cq.queue);
     qemu_mutex_destroy(&q->lock);
     g_free(q);
 }
-- 
2.31.1


