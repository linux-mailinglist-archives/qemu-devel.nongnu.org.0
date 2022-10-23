Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A26098F6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:50:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omnJK-0005Wv-P3; Sun, 23 Oct 2022 22:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1omh7a-00054F-6F
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 15:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1omh7Y-0004hS-BK
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 15:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666555133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lKaTvXN9Pf4j3fPBlRvJpkx9hmnAr7s6MwxXFsTJ8s0=;
 b=eGm4mvMh7tDj2Gq/nqfILPHkOpF1ji9obXyHWVJDCIF82nPCQgjGsNcg2paSf9sWPMO2vZ
 O2qX4PFNkNt12fUsVAZdZPEcPknQSbGC2zE6+VkGeyToeL1iJH8txPN0IPimqG9i0m/2EJ
 s13nomF2/qd8NEdMP4+fnA6hwQjC+jc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-myKxtAlhM5mOEtAwyofxNg-1; Sun, 23 Oct 2022 15:58:49 -0400
X-MC-Unique: myKxtAlhM5mOEtAwyofxNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BDAC800B23;
 Sun, 23 Oct 2022 19:58:34 +0000 (UTC)
Received: from apc-ap8641-3a-d11c.mgmt.pnr.lab.eng.rdu2.redhat.com
 (ovpn-208-3.brq.redhat.com [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 716C340C2064;
 Sun, 23 Oct 2022 19:58:29 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Pankaj Gupta <pankaj.gupta@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v2] hw/mem/nvdimm: fix error message for 'unarmed' flag
Date: Sun, 23 Oct 2022 21:58:12 +0200
Message-Id: <20221023195812.15523-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In the ACPI specification [1], the 'unarmed' bit is set when a device
cannot accept a persistent write. This means that when a memdev is
read-only, the 'unarmed' flag must be turned on. The logic is correct,
just changing the error message.

[1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3

Fixes: dbd730e859 ("nvdimm: check -object memory-backend-file, readonly=on option")
Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: David Hildenbrand <david@redhat.com>
---
v2:
    * enquote 'on' [Philippe]

 hw/mem/nvdimm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7c7d777781..31080c22c9 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -149,7 +149,7 @@ static void nvdimm_prepare_memory_region(NVDIMMDevice *nvdimm, Error **errp)
     if (!nvdimm->unarmed && memory_region_is_rom(mr)) {
         HostMemoryBackend *hostmem = dimm->hostmem;
 
-        error_setg(errp, "'unarmed' property must be off since memdev %s "
+        error_setg(errp, "'unarmed' property must be 'on' since memdev %s "
                    "is read-only",
                    object_get_canonical_path_component(OBJECT(hostmem)));
         return;
-- 
2.37.3


