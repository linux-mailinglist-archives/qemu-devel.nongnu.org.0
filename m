Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652692D490A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:32:31 +0100 (CET)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4GK-00060H-RP
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rt-0001QJ-TO
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rr-0007iz-6R
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxJ3f9AkcimEoHVGFWIULEfxtXcI3G+nN2yyJC0qTJU=;
 b=TJ7u0oAF2K0iZ7jdUymuFu0V7ZFUYPobowPmI4eiUyv9kuxdBUJtmL6YZCNfzXCkdLau+Z
 ks9uS4TXIRu6+1zGNktfEkPq8C6vuH7GDzfu2TUxRLqc++77aD2x4OZY0mE0Tn1OoqfmIs
 +ToDYyESqJ4VBbz2H4rJ+KtHzeuJLxQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ONaq8ufYNzC251S1rZI1zQ-1; Wed, 09 Dec 2020 13:07:07 -0500
X-MC-Unique: ONaq8ufYNzC251S1rZI1zQ-1
Received: by mail-wr1-f70.google.com with SMTP id j5so948927wro.12
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zxJ3f9AkcimEoHVGFWIULEfxtXcI3G+nN2yyJC0qTJU=;
 b=ZBgcuIMOXKJa7uhOvhB2JuRtVV+byVUDqKJUTABjlbggKG13sq+7Jt6BZuEvB7OCdC
 thQdAEAceCtUQ3I0liY9iMYMazaVOkLY69y+FvPXyrGphbaD5AmUDpMKGeT1VoZNNxyv
 g3sBDc9Sl7SFneOucD1cZS2LIiTY2vxRaKCZ9hUaGAPkdb8vdQqJg67F1zfNIulQoUgX
 SxfR6M1oW73vJr4b16R5mpg2z+3OHEO5UjBFIwhvJ9HpcqsCxnwgatnlft9BHv1jDUVA
 IJiOkYKQAfTWE4QuHcFPwyPg3cYhFSgdsJ3m9GEFPwPQw24vwqZM1JZSxoP0vTPDcSph
 Yh0Q==
X-Gm-Message-State: AOAM531HqztssMGc1EdaHT/pV91dsdcMF8YTITbgTbZPJf+zOF4K5NcF
 UPGAcdwGIgXBb17GiwT1d868zJMm+e7SYBsPvGbR1kIcjVpyowG3q1z/DsSMGmjLEAzpzoMVttY
 CJL1S7aNSMZSGPqYcp7mm+GRYkwZ1rhneVvej+CU5kMLmvTd0tfgqOhMTwLUB
X-Received: by 2002:adf:dd90:: with SMTP id x16mr3950373wrl.85.1607537226087; 
 Wed, 09 Dec 2020 10:07:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVC6oR2ZrKX9VPHlDs/pKJHwvwr60/ZT4uH5qmXowcMrZ6PGPpOO6b2UuGEPaLD+c/UtLTEA==
X-Received: by 2002:adf:dd90:: with SMTP id x16mr3950348wrl.85.1607537225821; 
 Wed, 09 Dec 2020 10:07:05 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id z17sm4486307wrh.88.2020.12.09.10.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:05 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/65] memory: Skip bad range assertion if notifier is
 DEVIOTLB_UNMAP type
Message-ID: <20201209180546.721296-7-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


