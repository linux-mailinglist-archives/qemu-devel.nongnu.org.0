Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D147733AD0B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:08:25 +0100 (CET)
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiH2-0002xK-SF
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lLi9a-0004Kb-Pl
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lLi9X-00068i-L5
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615795237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VX/kedqTLOcvwkt5J8WY3atmKUvR0TGQjkORowEsDl4=;
 b=Nxogg97HZipem/6DHIOqkhu7XrLDzKJnRelyF8ESOSZrO/MNmNzwvrecFZY06drmZ3tjnc
 IpFA8whqAqRZMmbNq9HpaD6z+KYgXXvCL6lpRERtqMvrgteneoeh8QqOSWBwmYGHKwVsJp
 +Mw+Oe5qGU0ebIi7F8EFy/5RsJa/ziM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-CxeIfk9YODaIkB5Fes6k7g-1; Mon, 15 Mar 2021 04:00:35 -0400
X-MC-Unique: CxeIfk9YODaIkB5Fes6k7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBCEA100C660
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 08:00:34 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown [10.40.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE4551F43B;
 Mon, 15 Mar 2021 08:00:33 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Add missing initialization for g_autofree variables
Date: Mon, 15 Mar 2021 09:00:32 +0100
Message-Id: <20210315080032.152210-1-mrezanin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

When declaring g_autofree variable without inicialization, compiler
will raise "may be used uninitialized in this function" warning due
to automatic free handling.

This is mentioned in docs/devel/style.rst (quote from section
"Automatic memory deallocation"):

  * Variables declared with g_auto* MUST always be initialized,
    otherwise the cleanup function will use uninitialized stack memory

Add inicialization to NULL for these declaration to prevent this
warning.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>

---
* From v1:
  -- Removed fixes in hw/remote/memory.c and hw/remote/proxy.c
     fixed by patch sent by Zenghui Yu (multi-process: Initialize
     variables declared with g_auto*)
---
 hw/s390x/s390-pci-vfio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index ead4f222d5..0ee7dc21f2 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -29,7 +29,7 @@
  */
 bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
 {
-    g_autofree struct vfio_iommu_type1_info *info;
+    g_autofree struct vfio_iommu_type1_info *info = NULL;
     uint32_t argsz;
 
     assert(avail);
@@ -230,7 +230,7 @@ static void s390_pci_read_pfip(S390PCIBusDevice *pbdev,
  */
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
 {
-    g_autofree struct vfio_device_info *info;
+    g_autofree struct vfio_device_info *info = NULL;
     VFIOPCIDevice *vfio_pci;
     uint32_t argsz;
     int fd;
-- 
2.27.0


