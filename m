Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECC32D144
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:58:36 +0100 (CET)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlgh-00035L-Mx
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleS-0000xX-Gs
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleQ-00031e-36
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqi2lxbUVwBulxgeeARPptYG3Lh25t/5QdRWIosS4zA=;
 b=FGwzGciwuYD2zGC+9CKqQX1He4X1Z5Qv06F8IA6cOsICSWtVBp7AD6Xyh/pvG+Fc+7okxM
 GkPY3abNMAl3gTb9+V12OOex/eCnwzo0AWVRbjEfrAx5V1P98x2lKRKZuT4cKzpngU88sc
 UtsXkFbTHTgs1OxMher0Xp3noQN2gyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-i6SSeGgtNP6m_fQbYubRQw-1; Thu, 04 Mar 2021 05:56:10 -0500
X-MC-Unique: i6SSeGgtNP6m_fQbYubRQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AACEC10059C0;
 Thu,  4 Mar 2021 10:56:08 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 584A8629DA;
 Thu,  4 Mar 2021 10:56:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] microvm: Don't open-code "etc/table-loader"
Date: Thu,  4 Mar 2021 11:55:52 +0100
Message-Id: <20210304105554.121674-3-david@redhat.com>
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
References: <20210304105554.121674-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's just reuse ACPI_BUILD_LOADER_FILE.

Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/acpi-microvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 01f1945ac1..502aac0ba2 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -255,7 +255,7 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
                       ACPI_BUILD_TABLE_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.linker->cmd_blob,
-                      "etc/table-loader", ACPI_BUILD_LOADER_MAX_SIZE);
+                      ACPI_BUILD_LOADER_FILE, ACPI_BUILD_LOADER_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.rsdp,
                       ACPI_BUILD_RSDP_FILE, 0);
-- 
2.29.2


