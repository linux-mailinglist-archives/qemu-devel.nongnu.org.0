Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7FC43B587
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:27:49 +0200 (CEST)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOMe-0001tK-Ea
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfO6w-00021N-Uv
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfO6v-0004KD-69
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hs44lyH7kz/lQR/nw1zRo9zWMi8XCPpsTXrMpnV8vrs=;
 b=dKF+x+pvIb5P/J9+q7yVJcthZeyLg0k0Y8RzLXSmHpwsaUsIzBmR/HiVTRUf6C8GbG+w+G
 TZXXno8tzM8wOleLeV+Er/UxW99/HhJvF1BNZKBybT8t/+nv99OJp5E8brpXQzXQ2Yrb0z
 e6y9e0QdzHqr9Rvxnv/1Ki2S3dsOEiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-CeLRO342NQe5m0r-f-4Reg-1; Tue, 26 Oct 2021 11:11:31 -0400
X-MC-Unique: CeLRO342NQe5m0r-f-4Reg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C633DEC1AE;
 Tue, 26 Oct 2021 15:11:29 +0000 (UTC)
Received: from localhost (unknown [10.22.17.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0606E17DBA;
 Tue, 26 Oct 2021 15:11:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/smbios: Use qapi for SmbiosEntryPointType
Date: Tue, 26 Oct 2021 11:10:59 -0400
Message-Id: <20211026151100.1691925-3-ehabkost@redhat.com>
In-Reply-To: <20211026151100.1691925-1-ehabkost@redhat.com>
References: <20211026151100.1691925-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This prepares for exposing the SMBIOS entry point type as a
machine property on x86.

Based on a patch from Daniel P. Berrangé.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
First version of this code was submitted at:
https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com

Changes from v2:
* Rename "2_0"/"3_1" to "32"/"64", to
  make the names more QAPI-friendly (as underscores and dots are
  not allowed by QAPI)
* Move definition from smbios.json back to machine.json
  (no need for a separate file just for one enum)

Changes from v1:
* Patch was split in two
* Moved definition to smbios.json
---
 include/hw/firmware/smbios.h | 10 ++--------
 qapi/machine.json            | 12 ++++++++++++
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index d916baed6a9..4b7ad77a44f 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -1,6 +1,8 @@
 #ifndef QEMU_SMBIOS_H
 #define QEMU_SMBIOS_H
 
+#include "qapi/qapi-types-machine.h"
+
 /*
  * SMBIOS Support
  *
@@ -23,14 +25,6 @@ struct smbios_phys_mem_area {
     uint64_t length;
 };
 
-/*
- * SMBIOS spec defined tables
- */
-typedef enum SmbiosEntryPointType {
-    SMBIOS_ENTRY_POINT_TYPE_32,
-    SMBIOS_ENTRY_POINT_TYPE_64,
-} SmbiosEntryPointType;
-
 /* SMBIOS Entry Point
  * There are two types of entry points defined in the SMBIOS specification
  * (see below). BIOS must place the entry point(s) at a 16-byte-aligned
diff --git a/qapi/machine.json b/qapi/machine.json
index 5db54df298f..0a13579275f 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1411,3 +1411,15 @@
      '*cores': 'int',
      '*threads': 'int',
      '*maxcpus': 'int' } }
+
+##
+# @SmbiosEntryPointType:
+#
+# @32: SMBIOS version 2.1 (32-bit) Entry Point
+#
+# @64: SMBIOS version 3.0 (64-bit) Entry Point
+#
+# Since: 6.1
+##
+{ 'enum': 'SmbiosEntryPointType',
+  'data': [ '32', '64' ] }
-- 
2.32.0


