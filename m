Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C648DC72
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:01:04 +0100 (CET)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83TD-0006Ta-MJ
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:01:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n83Oc-0001gE-UG
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:56:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n83OR-0004ra-Pe
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642092967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnbELTmcyAtnylRxklQM5J14dTT7Kjm6dMwphBUIj4g=;
 b=BrGO0R7hKJ1OhahS5vEYR8ZytzLDiR14FSBm3H4IR18oSvgrycFFLuuyM93NKLSlvaXvmX
 QgWOKdyiEXIIp+ZlmX0m2k2jOAG5aaZdpN0BAMzM8tTm2RNRNI70eIUAg3csTL2V7N0RBt
 wQ1JSzEB09cu0q7C9OcXoFqsf4+jKvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-n063_-LNMV6pfnt-YO_gwA-1; Thu, 13 Jan 2022 11:55:59 -0500
X-MC-Unique: n063_-LNMV6pfnt-YO_gwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5CA41018733;
 Thu, 13 Jan 2022 16:55:57 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B172C7DE35;
 Thu, 13 Jan 2022 16:55:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/i386: support loading OVMF using -bios too
Date: Thu, 13 Jan 2022 16:55:11 +0000
Message-Id: <20220113165511.46098-3-berrange@redhat.com>
In-Reply-To: <20220113165511.46098-1-berrange@redhat.com>
References: <20220113165511.46098-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Traditionally the OVMF firmware has been loaded using the pflash
mechanism. This is because it is usually provided as a pair of
files, one read-only containing the code and one writable to
provided persistence of non-volatile firmware variables.

The AMD SEV build of EDK2, however, is provided as a single
file that contains only the code. This is intended to be used
read-only and explicitly does not provide any ability for
persistance of non-volatile firmware variables. While it is
possible to configure this with the pflash mechanism, by only
providing one of the 2 pflash blobs, conceptually it is a
little strange to use pflash if there won't be any persistent
data.

A stateless OVMF build can be loaded with -bios, however, QEMU
does not currently initialize SEV in that scenario. This patch
introduces the call needed for SEV initialization of the
firmware.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/x86.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b84840a1bb..c79d84936f 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -45,6 +45,7 @@
 #include "target/i386/cpu.h"
 #include "hw/i386/topology.h"
 #include "hw/i386/fw_cfg.h"
+#include "hw/i386/pc.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "target/i386/sev.h"
@@ -1157,6 +1158,10 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
     memory_region_add_subregion(rom_memory,
                                 (uint32_t)(-bios_size),
                                 bios);
+
+    pc_system_ovmf_initialize_sev(
+        rom_ptr((uint32_t)-bios_size, bios_size),
+        bios_size);
 }
 
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
-- 
2.33.1


