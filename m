Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E12953937F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 17:01:33 +0200 (CEST)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw3NE-0000Yw-Nk
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 11:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nw3Jx-00080O-2j
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nw3Ju-0000Ku-0C
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654009083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AiLph97Q913tZ/Q87m5wOxPfOmnJpxebZn8inFq50HA=;
 b=gadG++ELzD1pDudCzNzH2Xo+bcRXF6L9K5w3EhSq/ItU11o8DXKRRq2eZL6BdOdLIPf1pN
 D8iGjgfxbrXRcKKVx9iuDD8Mc/l2jQTbHqCoijBZNECoNbrfIvZdJ/kyESYcdnM/omCX3c
 rM2SUvrYnUJnpJAOQ+608XiAxvvvewk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-MF1zy5vWN82-ZWV_s0Jxow-1; Tue, 31 May 2022 10:51:54 -0400
X-MC-Unique: MF1zy5vWN82-ZWV_s0Jxow-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81F78101A54E;
 Tue, 31 May 2022 14:51:54 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EA8D492C3B;
 Tue, 31 May 2022 14:51:52 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Julia Suvorova <jusual@redhat.com>
Subject: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Date: Tue, 31 May 2022 16:51:47 +0200
Message-Id: <20220531145147.61112-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In the ACPI specification [1], the 'unarmed' bit is set when a device
cannot accept a persistent write. This means that when a memdev is
read-only, the 'unarmed' flag must be turned on. The logic is correct,
just changing the error message.

[1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3

Signed-off-by: Julia Suvorova <jusual@redhat.com>
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
2.35.1


