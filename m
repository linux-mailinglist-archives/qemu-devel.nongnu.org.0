Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B385602FFD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 17:47:57 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okoot-00057m-Sh
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 11:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1okoTL-0007RY-Ep
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:25:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1okoTJ-0007lN-Jk
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666106731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N5KCY7f83Lh0igECXhaDeMjw4jjPbEEAExBjxUyxCvs=;
 b=Gm2MK/4JjXa5aBogAB6F4tKxVZHpihSYNhcJyiqiTmYXrmdM8J7cF7x2tiUGq55L3BdG/R
 u/poAepBCEWtdEbHcFcLiJfGQc0uYGBiwZ8VAhBlfLWxF4eWWE/uOxc+I4DuvsHE+NhjxD
 Voo3+4rDXU4N6L2uuliiPp7MSNb4bsI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-9fxgV4MJMTuIE17c7cOM2w-1; Tue, 18 Oct 2022 11:25:29 -0400
X-MC-Unique: 9fxgV4MJMTuIE17c7cOM2w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B13C185A7A8
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 15:25:29 +0000 (UTC)
Received: from ovpn-194-11.brq.redhat.com (ovpn-194-11.brq.redhat.com
 [10.40.194.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B7FC401D59;
 Tue, 18 Oct 2022 15:25:27 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [RESEND PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Date: Tue, 18 Oct 2022 17:25:24 +0200
Message-Id: <20221018152524.137598-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the ACPI specification [1], the 'unarmed' bit is set when a device
cannot accept a persistent write. This means that when a memdev is
read-only, the 'unarmed' flag must be turned on. The logic is correct,
just changing the error message.

[1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/mem/nvdimm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7c7d777781..bfb76818c1 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -149,7 +149,7 @@ static void nvdimm_prepare_memory_region(NVDIMMDevice *nvdimm, Error **errp)
     if (!nvdimm->unarmed && memory_region_is_rom(mr)) {
         HostMemoryBackend *hostmem = dimm->hostmem;
 
-        error_setg(errp, "'unarmed' property must be off since memdev %s "
+        error_setg(errp, "'unarmed' property must be on since memdev %s "
                    "is read-only",
                    object_get_canonical_path_component(OBJECT(hostmem)));
         return;
-- 
2.37.3


