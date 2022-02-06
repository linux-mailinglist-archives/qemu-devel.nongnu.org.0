Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3E4AAEC4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:08:24 +0100 (CET)
Received: from localhost ([::1]:41632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeT1-0000vi-Pr
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:08:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe08-0000TZ-8R
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe05-0003iI-Ab
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3jUSaSk62Y68RwsubSnE/d3+Hfgk3zd4sX5M9Po2zk=;
 b=hBOKKJgpeA6H5ulXzd17ZpXqqOwqjmfkUGPM4uxmlQ5idNH6kXGfp1DYzqtwG10Nsdgax5
 xhar5ORczgljuxx1YhTof/8f2kIdzFSz/oxASDmeyMGPhni/cOxNKzQbj/7iygQrlDmL1v
 of+yzG2DPCJynaNVtMkd4uj8PkTHFQM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-9wlL8k47MlykyRf1clINlA-1; Sun, 06 Feb 2022 04:38:27 -0500
X-MC-Unique: 9wlL8k47MlykyRf1clINlA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso5869377wmh.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=M3jUSaSk62Y68RwsubSnE/d3+Hfgk3zd4sX5M9Po2zk=;
 b=8BqyLtp6c3ATwzFzyvX9kaxvyeMq5Xre/wJUHmYkS9IxPe4un9JRTmU+8W1UJLL0kg
 OvJ2dsBkqZrglYHOoIGBIedWaX1qTkZGOn5Gu1EdWhzdOEG6JCqoTkVyZ/fEnTvA+94c
 TFH71UE42Cqo2QldY8MmIC5GD3vgPRNCsPjVvWRZZEVMEvUrhN/IYHGKtbLFy13RAqhR
 EDaJwu+ixFhfaNaI9mMVz9g+JJNFVLiNKZ9mBUg27zmPo4jNvmfxOWdkZ+jfDcRACbQK
 fVrgILQ/O6h3qk/R9kb/foFqYuU4TpART+U+1Oa2PnAZG/pY4b2yYgUOJoB01adJa9kE
 k8hQ==
X-Gm-Message-State: AOAM530ABu5oLIH8M1+7N+QGS2axKvulSpLvtGUAeTA4CIGBaoQNwzcI
 Yf/U7/2BSrvwAbihNsl2TKKY4Q711SQay1eI/emWYPGewfDtbnyrYXazLDTlYkS8LctUTSb8z65
 kVF2YKgWUnKl9UNynPdBqmIKyQT5n2W0lxDLtiKkl5kKDDwBDuMnUuP5qSi46
X-Received: by 2002:adf:e750:: with SMTP id c16mr5496399wrn.431.1644140306213; 
 Sun, 06 Feb 2022 01:38:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztChWgn3V37dleqFQmaCkCAOMoyxRVtwOfuZ/K18Xa4RSYUzO9AAp262GiIEFgcIdEocBbHw==
X-Received: by 2002:adf:e750:: with SMTP id c16mr5496376wrn.431.1644140305952; 
 Sun, 06 Feb 2022 01:38:25 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id v3sm6553358wru.15.2022.02.06.01.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:25 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/24] libvhost-user: Map shared RAM with MAP_NORESERVE to
 support virtio-mem with hugetlb
Message-ID: <20220206093702.1282676-15-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

For fd-based shared memory, MAP_NORESERVE is only effective for hugetlb,
otherwise it's ignored. Older Linux versions that didn't support
reservation of huge pages ignored MAP_NORESERVE completely.

The first client to mmap a hugetlb fd without MAP_NORESERVE will
trigger reservation of huge pages for the whole mmapped range. There are
two cases to consider:

1) QEMU mapped RAM without MAP_NORESERVE

We're not dealing with a sparse mapping, huge pages for the whole range
have already been reserved by QEMU. An additional mmap() without
MAP_NORESERVE won't have any effect on the reservation.

2) QEMU mapped RAM with MAP_NORESERVE

We're delaing with a sparse mapping, no huge pages should be reserved.
Further mappings without MAP_NORESERVE should be avoided.

For 1), it doesn't matter if we set MAP_NORESERVE or not, so we can
simply set it. For 2), we'd be overriding QEMUs decision and trigger
reservation of huge pages, which might just fail if there are not
sufficient huge pages around. We must map with MAP_NORESERVE.

This change is required to support virtio-mem with hugetlb: a
virtio-mem device mapped into the guest physical memory corresponds to
a sparse memory mapping and QEMU maps this memory with MAP_NORESERVE.
Whenever memory in that sparse region will be accessed by the VM, QEMU
populates huge pages for the affected range by preallocating memory
and handling any preallocation errors gracefully.

So let's map shared RAM with MAP_NORESERVE. As libvhost-user only
supports Linux, there shouldn't be anything to take care of in regard of
other OS support.

Without this change, libvhost-user will fail mapping the region if there
are currently not enough huge pages to perform the reservation:
 fv_panic: libvhost-user: region mmap error: Cannot allocate memory

Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111123939.132659-1-david@redhat.com>
Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 0ee43b8e93..47d2efc60f 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -751,12 +751,12 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
          * accessing it before we userfault.
          */
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_NONE, MAP_SHARED,
+                         PROT_NONE, MAP_SHARED | MAP_NORESERVE,
                          vmsg->fds[0], 0);
     } else {
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_READ | PROT_WRITE, MAP_SHARED, vmsg->fds[0],
-                         0);
+                         PROT_READ | PROT_WRITE, MAP_SHARED | MAP_NORESERVE,
+                         vmsg->fds[0], 0);
     }
 
     if (mmap_addr == MAP_FAILED) {
@@ -920,7 +920,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
          * accessing it before we userfault
          */
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_NONE, MAP_SHARED,
+                         PROT_NONE, MAP_SHARED | MAP_NORESERVE,
                          vmsg->fds[i], 0);
 
         if (mmap_addr == MAP_FAILED) {
@@ -1007,7 +1007,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
          * mapped address has to be page aligned, and we use huge
          * pages.  */
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_READ | PROT_WRITE, MAP_SHARED,
+                         PROT_READ | PROT_WRITE, MAP_SHARED | MAP_NORESERVE,
                          vmsg->fds[i], 0);
 
         if (mmap_addr == MAP_FAILED) {
-- 
MST


