Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A751E064
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:53:29 +0200 (CEST)
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn4x6-0003Su-M8
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4sM-0002fe-6w
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4sK-0005pk-AM
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651870111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHsn+Dzk9MOQvvZ+2lLckvYOtFDX2SUbFWXTUXljEzU=;
 b=AOC90HxFdDO0DUNRmWbF+LjTyBYncPXain1I+UGOjZM8j1UUe1k/RHodc/T9kwBbZ3BOh0
 +ihKAT2jYVBQuU2ws8rpj+CvUmDWMNojgsi9FQXRHAflbVYPfh8pws6Y+r3xjtTNIZsl2E
 jH4V6MDfYSMW0Z0zpLdABFBlc3zJphk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-1NUrtc3ON1CVisB0R8izgA-1; Fri, 06 May 2022 16:48:28 -0400
X-MC-Unique: 1NUrtc3ON1CVisB0R8izgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25C071C05196;
 Fri,  6 May 2022 20:48:28 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCC70C15E71;
 Fri,  6 May 2022 20:48:27 +0000 (UTC)
Subject: [PULL 06/11] vfio/common: Fix a small boundary issue of a trace
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: Xiang Chen <chenxiang66@hisilicon.com>
Date: Fri, 06 May 2022 14:48:27 -0600
Message-ID: <165187005716.4166595.13184619743266289073.stgit@omen>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiang Chen <chenxiang66@hisilicon.com>

It uses [offset, offset + size - 1] to indicate that the length of range is
size in most places in vfio trace code (such as
trace_vfio_region_region_mmap()) execpt trace_vfio_region_sparse_mmap_entry().
So change it for trace_vfio_region_sparse_mmap_entry(), but if size is zero,
the trace will be weird with an underflow, so move the trace and trace it
only if size is not zero.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Link: https://lore.kernel.org/r/1650100104-130737-1-git-send-email-chenxiang66@hisilicon.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 2b1f78fdfaeb..6065834717eb 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1544,11 +1544,10 @@ static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
     region->mmaps = g_new0(VFIOMmap, sparse->nr_areas);
 
     for (i = 0, j = 0; i < sparse->nr_areas; i++) {
-        trace_vfio_region_sparse_mmap_entry(i, sparse->areas[i].offset,
-                                            sparse->areas[i].offset +
-                                            sparse->areas[i].size);
-
         if (sparse->areas[i].size) {
+            trace_vfio_region_sparse_mmap_entry(i, sparse->areas[i].offset,
+                                            sparse->areas[i].offset +
+                                            sparse->areas[i].size - 1);
             region->mmaps[j].offset = sparse->areas[i].offset;
             region->mmaps[j].size = sparse->areas[i].size;
             j++;



