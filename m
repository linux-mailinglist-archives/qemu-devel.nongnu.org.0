Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816EB4ED603
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:43:24 +0200 (CEST)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqOp-000543-K5
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:43:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZqHh-0002WE-AC
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZqHc-000647-Fu
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648715754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5XU1TdhLsuE2Iim5zn1CVweGJVqLkJPf0Y7Ihl/6iw=;
 b=dbZsYuyUrBDTq7/52Y/IGCJ5GYNaVaCp5kdGmpm8nOIx5K6V4KRNrgdJbBbVMw656+a1YU
 VG4QkGaZzwoKUYLoTf+/2MFELy3dejHhaUY8F7UgTQZJCKuzXdlvJfWcQsbz1SF52PnWUe
 +1tyhD3v49ad5elGd11PCo4g21rHDj0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-Wv379xTwOIiXe7kRvL5khg-1; Thu, 31 Mar 2022 04:35:51 -0400
X-MC-Unique: Wv379xTwOIiXe7kRvL5khg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17078185A7A4;
 Thu, 31 Mar 2022 08:35:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9ECA400E10D;
 Thu, 31 Mar 2022 08:35:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 705A618003A2; Thu, 31 Mar 2022 10:35:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] i386: move bios load error message
Date: Thu, 31 Mar 2022 10:35:47 +0200
Message-Id: <20220331083549.749566-2-kraxel@redhat.com>
In-Reply-To: <20220331083549.749566-1-kraxel@redhat.com>
References: <20220331083549.749566-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to usual goto-end-of-function error handling style.
No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 hw/i386/x86.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 4cf107baea34..b2e801a8720e 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1121,9 +1121,7 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
     }
     ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
     if (ret != 0) {
-    bios_error:
-        fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
-        exit(1);
+        goto bios_error;
     }
     g_free(filename);
 
@@ -1144,6 +1142,11 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
     memory_region_add_subregion(rom_memory,
                                 (uint32_t)(-bios_size),
                                 bios);
+    return;
+
+bios_error:
+    fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
+    exit(1);
 }
 
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
-- 
2.35.1


