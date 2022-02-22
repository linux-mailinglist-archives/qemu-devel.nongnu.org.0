Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BEA4BFE54
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:19:16 +0100 (CET)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXsg-0002KZ-Qk
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:19:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMX01-0000f8-7E
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:22:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMWzr-0004fr-9r
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645543351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hp/EwFR+uEtsNq2GCfty00LH35liwEXEPrIUqiBCpYw=;
 b=aGqBkFTsYVlIwlfeOCmcS2RWko96zgNYYwu+Hj5tfV9Qs4QnM/RTAh2cd9pEoD8y/e5rFO
 4eWttZy8uWfs5ZNf/Tw1zzT5vkGy2rqWjGEZSObbd/BlkvUHS/dhG7bKUyWa/qW09UlsSd
 k0yPULKQllAGLMndxuGWgM48DZ1t/1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-zTZhc8xDOIqgdhdPnCiAoQ-1; Tue, 22 Feb 2022 10:22:30 -0500
X-MC-Unique: zTZhc8xDOIqgdhdPnCiAoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 815931091DA2;
 Tue, 22 Feb 2022 15:22:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B5FC7A53A;
 Tue, 22 Feb 2022 15:22:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AC42C21608C7; Tue, 22 Feb 2022 16:22:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/mem/pc-dimm: Fix error message if no slots were defined
 some more
Date: Tue, 22 Feb 2022 16:22:11 +0100
Message-Id: <20220222152211.1209292-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: ani@anisinha.ca, imammedo@redhat.com, david@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error message added in commit 3ff333effa "pc-dimm: fix error
messages if no slots were defined" is misleading:

    $ qemu-system-x86_64 -object memory-backend-file,id=mem1,size=1M,mem-path=1G.img -device pc-dimm,id=dimm1,memdev=mem1
    qemu-system-x86_64: -device pc-dimm,id=dimm1,memdev=mem1: no slots where allocated, please specify the 'slots' option
    $ qemu-system-x86_64 -object memory-backend-file,id=mem1,size=1M,mem-path=1G.img -device pc-dimm,id=dimm1,memdev=mem1,slots=0
    qemu-system-x86_64: -device pc-dimm,id=dimm1,memdev=mem1,slots=0: Property 'pc-dimm.slots' not found

The property it called 'slot', not 'slots'.  With that fixed, we get
another bad error message:

    $ qemu-system-x86_64 -object memory-backend-file,id=mem1,size=1M,mem-path=1G.img -device pc-dimm,id=dimm1,memdev=mem1,slot=0
    qemu-system-x86_64: -device pc-dimm,id=dimm1,memdev=mem1,slot=0: invalid slot number 0, valid range is [0-18446744073709551615]

Left for another day.

Fixes: 3ff333effa319df6178f138d9cf32e3937419790
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/mem/pc-dimm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 48b913aba6..28fec00575 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -115,7 +115,7 @@ static int pc_dimm_get_free_slot(const int *hint, int max_slots, Error **errp)
 
     if (max_slots <= 0) {
         error_setg(errp, "no slots where allocated, please specify "
-                   "the 'slots' option");
+                   "the 'slot' option");
         return slot;
     }
 
-- 
2.35.1


