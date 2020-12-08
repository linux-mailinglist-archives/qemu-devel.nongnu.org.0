Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177182D32C7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:47:41 +0100 (CET)
Received: from localhost ([::1]:52284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmixY-0006Pb-0x
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikV-0004wX-OW
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikP-0004if-91
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxJ3f9AkcimEoHVGFWIULEfxtXcI3G+nN2yyJC0qTJU=;
 b=UG4VNi+43AXyf8D4H2Jnj2NmjnXig/mYILQemXIlGfqSmsb6VPuasoPZ/rax02QQzVeg3C
 fZnthDS0ZxoNPISSFGalY6xLcZVu/zIF/pIWP8SOyuaKjZiQfWiystUjQW92Bmgs3aAo7f
 744XCzFMKC1WphLP7MCFpGgdQEOorD0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-MpEYeQ5vMrK9XdMnFdJxMw-1; Tue, 08 Dec 2020 14:34:01 -0500
X-MC-Unique: MpEYeQ5vMrK9XdMnFdJxMw-1
Received: by mail-wr1-f70.google.com with SMTP id n13so6613478wrs.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zxJ3f9AkcimEoHVGFWIULEfxtXcI3G+nN2yyJC0qTJU=;
 b=BCLlfvIwxGk9micPdqpEVivD70tqZ23KpA/gh+MMuTvPFv1/tlS6ipdMbv8WEkVPU+
 IueBJv3HbdOJA4VSAqspNDU80/Q6jT/ZJ2+mNGP++bknoYWJwb+2EMXZamKQ4ccuY3f+
 hHpx3ARv5Y4chRS3bYt1Rslw6JqoYmJnEq89Pnx/8hWbbisq9ODnTVCszYWL9eh7btZM
 +9bAFjpTiZ3AeO845mATMjc4Nynosb6TALt6+VdYwQJpuX1ONEe4huvyeQeM/lq10869
 Z3/MuQuKBobPwn21Y5XM3u9U96voqm9MR6XlBymJdfNmk3nGBExoD2wZXBry1bGh3rls
 s6PA==
X-Gm-Message-State: AOAM5328Cc/v7+YPKWYAB1o8sLu46Bgmb5hgfz3bGm4yPcaHMD+U61t4
 c2r7N9l/m3RLbJjUq2Nn6JSA/4muRqLvXn0ZGh/DjTdHouqNsjwJktoe7IILG0oq4WrVb9s1iKU
 TONt+8dbB25nOG3IQa9PUnWq+yS0906Ir9E3RjicNIt8DJ4ObFnn7XEPd5FyG
X-Received: by 2002:adf:e84c:: with SMTP id d12mr8329449wrn.382.1607456040180; 
 Tue, 08 Dec 2020 11:34:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAG9JPNeJwkjlUyufMASyafhoZDxUXQ4SgnEKFEUJ/dUqDfIJpWq/Y2rvhS84tWY87Qaqr/A==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr8329419wrn.382.1607456039959; 
 Tue, 08 Dec 2020 11:33:59 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id v1sm21652111wrr.48.2020.12.08.11.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:33:59 -0800 (PST)
Date: Tue, 8 Dec 2020 14:33:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/66] memory: Skip bad range assertion if notifier is
 DEVIOTLB_UNMAP type
Message-ID: <20201208193307.646726-7-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Device IOTLB invalidations can unmap arbitrary ranges, eiter outside of
the memory region or even [0, ~0ULL] for all the space. The assertion
could be hit by a guest, and rhel7 guest effectively hit it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20201116165506.31315-6-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 softmmu/memory.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 6ca87e8d73..22bacbbc78 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1947,6 +1947,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
 {
     IOMMUTLBEntry *entry = &event->entry;
     hwaddr entry_end = entry->iova + entry->addr_mask;
+    IOMMUTLBEntry tmp = *entry;
 
     if (event->type == IOMMU_NOTIFIER_UNMAP) {
         assert(entry->perm == IOMMU_NONE);
@@ -1960,10 +1961,16 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
         return;
     }
 
-    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        /* Crop (iova, addr_mask) to range */
+        tmp.iova = MAX(tmp.iova, notifier->start);
+        tmp.addr_mask = MIN(entry_end, notifier->end) - tmp.iova;
+    } else {
+        assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    }
 
     if (event->type & notifier->notifier_flags) {
-        notifier->notify(notifier, entry);
+        notifier->notify(notifier, &tmp);
     }
 }
 
-- 
MST


