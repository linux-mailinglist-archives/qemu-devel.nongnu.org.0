Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3ED1FB451
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:28:06 +0200 (CEST)
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCZJ-0000d7-CB
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPS-0001ki-9N; Tue, 16 Jun 2020 10:17:54 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPQ-0006aX-RA; Tue, 16 Jun 2020 10:17:53 -0400
Received: by mail-ot1-x342.google.com with SMTP id s13so16031319otd.7;
 Tue, 16 Jun 2020 07:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q6XluDaYOOk479cbsgjjXKmu3Ok/PF9NSc4xCu24CqU=;
 b=QYywqlptgbUqaOxvbJmon8Vm7HYL3xayB3hD77LpHzIMUMsXMqV7hEPw49RAD7hP6i
 utEXNaRc+sdvGBaBGWQBoJKa0XgE931766QvT3bEYnZtQU5JFNf52B5ozC16dX9NeGWd
 UEEd93DzHj18begMDMdTKS8IdrcYTE+V5PEGfF8Qc+LZmbZz2CuVPV+FLXzAjfLTHxXt
 zMudfCUFSpTGjzjOo6+IrR7VfB5r/grfBOKG3xc75nwy9spiIfJ2RDQtetNNWyQTo9Bz
 E7+VVpiLDPidg/bC35zID1nVCrVD0qlSo5aQzYu2u9wP1xxHIPhdCjzMmunYvkrkKjIY
 m8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Q6XluDaYOOk479cbsgjjXKmu3Ok/PF9NSc4xCu24CqU=;
 b=rqnWNYLD2USw0uF8qqKfv2CNRBXfdwact8VHgRF7GyUv9FShyVzwSxcldFS5OR7dmy
 rK6YoThd/ShTiPYhfgdu2OQlSv29rb9UkFKJleSzEpeFqCjwDPAd/Cxv00reVzrbYuD/
 n5cr1JaNeaXxhN+6gs4pWy7ShoFJvb7S9u72WZ2MKx0OPaCHeRXtZRdHDhKj8N8Qn+ZG
 qepFV/Vt5RFRImmWhb6wCVmpzNdbg0pj2jattrGpJ/K2zmVwy23g47d7dqEF+EKV9elb
 W/AMfHo4oy0n6jhLA94Dl0SyiarJNeM1V89+7dnF4vkZMB+zyne/lf6g2HtfiCe7bMgL
 AwgQ==
X-Gm-Message-State: AOAM533Dz1bWCCaWO3uPNIFvyG9w08ArRU8Q0NIwC05Zsra8RrDknnNQ
 pnxRDHsZnpTl5bbzeunkk25ugvCW
X-Google-Smtp-Source: ABdhPJytV/3r5GKzDIM87wrS0C6/4xt3N8faj60j3E9R5vo385AO+VkHk3FaxFddOk4jc+LmDGv2VA==
X-Received: by 2002:a05:6830:141a:: with SMTP id
 v26mr2613877otp.250.1592317071056; 
 Tue, 16 Jun 2020 07:17:51 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id y68sm4221982oia.37.2020.06.16.07.17.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:17:50 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/78] virtio: make virtio_delete_queue idempotent
Date: Tue, 16 Jun 2020 09:14:49 -0500
Message-Id: <20200616141547.24664-21-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x342.google.com
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
Cc: qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Michael S. Tsirkin" <mst@redhat.com>

Let's make sure calling this twice is harmless -
no known instances, but seems safer.

Suggested-by: Pan Nengyuan <pannengyuan@huawei.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 8cd353ea0fbf0e334e015d833f612799be642296)
*prereq for 421afd2fe8
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 31dd140990..6de3cfdc2c 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2337,6 +2337,7 @@ void virtio_delete_queue(VirtQueue *vq)
     vq->handle_output = NULL;
     vq->handle_aio_output = NULL;
     g_free(vq->used_elems);
+    vq->used_elems = NULL;
 }
 
 void virtio_del_queue(VirtIODevice *vdev, int n)
-- 
2.17.1


