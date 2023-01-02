Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7865B12C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:31:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJ0b-00076r-Qv; Mon, 02 Jan 2023 06:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0Z-00075t-S3
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0Y-0007zv-Ev
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672658973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHVsxT+wPYlq1BGkKqy9d1FLEscQXhY9hWbVKgk4v44=;
 b=QVw97YmjikJbqMpOLuW2D2Bbt+IDJpdYc1W4fh7Jo38HfeaFaIhAoQJN/CFadwdwrwfV+7
 gz4G9u0lK6deDEoaWSN/6u+suqGBfIUsKIxLuwvm5Ufi58ZvG4nVVpKqA1Vbayb17FTUSd
 elezp977v4hkFANBqi99qVTLpy8pHLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-Flp4cJmBPkWbAfEgwEOzaw-1; Mon, 02 Jan 2023 06:29:30 -0500
X-MC-Unique: Flp4cJmBPkWbAfEgwEOzaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5059A85C064;
 Mon,  2 Jan 2023 11:29:30 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F56440C2064;
 Mon,  2 Jan 2023 11:29:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
Subject: [GIT PULL 2/4] virtio-mem: Fix the iterator variable in a
 vmem->rdl_list loop
Date: Mon,  2 Jan 2023 12:29:19 +0100
Message-Id: <20230102112921.68077-3-david@redhat.com>
In-Reply-To: <20230102112921.68077-1-david@redhat.com>
References: <20230102112921.68077-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Chenyi Qiang <chenyi.qiang@intel.com>

It should be the variable rdl2 to revert the already-notified listeners.

Fixes: 2044969f0b ("virtio-mem: Implement RamDiscardManager interface")
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20221228090312.17276-1-chenyi.qiang@intel.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 5c22c4b876..2b0271442b 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -341,7 +341,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
     if (ret) {
         /* Notify all already-notified listeners. */
         QLIST_FOREACH(rdl2, &vmem->rdl_list, next) {
-            MemoryRegionSection tmp = *rdl->section;
+            MemoryRegionSection tmp = *rdl2->section;
 
             if (rdl2 == rdl) {
                 break;
-- 
2.39.0


