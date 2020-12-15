Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BACE2DB140
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:23:59 +0100 (CET)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpD7F-0000bd-VC
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5c-0007Ir-TH
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:22:17 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5b-0003AQ-AF
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:22:16 -0500
Received: by mail-pg1-x544.google.com with SMTP id i7so3870841pgc.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ayx4tR4YhfjCbsPSwjeEGbJ32niuENe82UzurSi722s=;
 b=dTE3JfkIA/YAvsWCM2uemDP8h5VXEiPci1Bm9dzqoMuQ4nHromi8sIee4bHDwp4TYU
 /+x1y/xbWq8UPstYNl6yf6sifPiDQwg59KkO1fxlzTtteqRukTCxtJp0RWgshb2el909
 b40zal9jXPS1t8IyVW7keLGxMMJhTqNkyvnfBdhD++UCRNcIshCHoXT0G6IzUsCk6dTn
 b7AQjO9QHcZrYJc/acZvLxQthQqTdeLkGCsAAK92CiwXkOfd1Cko9YmfcfWo2SrIhqzi
 /DStNSBN2q0mZFwhb72CWdkUvbr5u0ueYlNFON/Zh/TvWTrJEPuBdHmWCnFGGZWomQMu
 4RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ayx4tR4YhfjCbsPSwjeEGbJ32niuENe82UzurSi722s=;
 b=ImrNcrx/t3JUrfVhUrLgDA16ChIN1GYxdjRInLd3EiTDKm0lfmwqSR33Fka/EXa0AL
 TRWx0KozgI4tdwy6mB+7LaPeZQzSzTwWirl/ygjWZwkOunQm0NnOQKm1M8Fbw99S+qz8
 Xe2U+vqAZfpkvs5PHq7861DdByGWILWYiuTpe+6OT0Hp33TU4apWPs5l9/aXDkD72hVv
 /ybUegxChg2gMabRs553JAqP5WhVEjb62NiIGnzuRbJYcB6OmDRxRdvE892HUXLeJavP
 nxzoojvsRnj5fsK2puUjevkrA3SoALVXJRtI2HMZKiW0jtHfP0dSXQ+ab0YGOAEcNWPB
 LG+w==
X-Gm-Message-State: AOAM531m9k9V+80o0Kce1Qrw2uVhpshMlm9i7sTjL3rAoqTn4IWg6pse
 2is42chKPq/gpQHDaHVDQN8o1A==
X-Google-Smtp-Source: ABdhPJxJD4lnOuON3N0Rny7fskycNVrZmglrNMWdCeUJTfHY5Tvra0uLRJYKIGhPso/7ws+m/AFdkg==
X-Received: by 2002:a62:65c5:0:b029:1a0:90f7:55be with SMTP id
 z188-20020a6265c50000b02901a090f755bemr21271353pfb.23.1608049333911; 
 Tue, 15 Dec 2020 08:22:13 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id c10sm24273508pfo.159.2020.12.15.08.22.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 08:22:13 -0800 (PST)
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: [RFC PATCH 9/9] virtiofsd: (work around) Comment qsort in inflight
 I/O tracking
Date: Wed, 16 Dec 2020 00:21:19 +0800
Message-Id: <20201215162119.27360-10-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-pg1-x544.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com, Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a work around. The qsort function will malloc memory instead of use
stack memory when the resubmit_num is larger than 64 (total size larger than
1024 Bytes). This will cause seccomp kill virtiofsd, so we comment qsort.
This work around will not affect the correctness of inflight I/O tracking.

Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 contrib/libvhost-user/libvhost-user.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 8c97013e59..c226d5d915 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -1167,20 +1167,6 @@ vu_check_queue_msg_file(VuDev *dev, VhostUserMsg *vmsg)
     return true;
 }
 
-static int
-inflight_desc_compare(const void *a, const void *b)
-{
-    VuVirtqInflightDesc *desc0 = (VuVirtqInflightDesc *)a,
-                        *desc1 = (VuVirtqInflightDesc *)b;
-
-    if (desc1->counter > desc0->counter &&
-        (desc1->counter - desc0->counter) < VIRTQUEUE_MAX_SIZE * 2) {
-        return 1;
-    }
-
-    return -1;
-}
-
 static int
 vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
 {
@@ -1236,10 +1222,6 @@ vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
             }
         }
 
-        if (vq->resubmit_num > 1) {
-            qsort(vq->resubmit_list, vq->resubmit_num,
-                  sizeof(VuVirtqInflightDesc), inflight_desc_compare);
-        }
         vq->counter = vq->resubmit_list[0].counter + 1;
     }
 
-- 
2.20.1


