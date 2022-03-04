Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984A84CD77E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:16:43 +0100 (CET)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9fe-0003br-Nv
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:16:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8rF-0005Ft-L1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8rD-0002Xv-Gv
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKRpgDNQ2RtBTM72+VusA365l4BToXznUDUzVSdfOUg=;
 b=Ur//MejQdpjvsLMC3t/sWSMgIHjnNuD8OkorHCaBbCh2F00D4J89Zt168l6YnwDqc+CJD5
 m54t2DQNrYipFkMXYHBBz9fKj+LYHly8FpgVEHCHRlSyC30bWnUmmX9gXOqLSnjlmD5ypW
 nNBSi5nbg76jjOap6LzPkAZ6DkB2MTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-uJCeHHzHPdyT9UPSy61dMw-1; Fri, 04 Mar 2022 09:24:31 -0500
X-MC-Unique: uJCeHHzHPdyT9UPSy61dMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F218FC80;
 Fri,  4 Mar 2022 14:24:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2CAC866F5;
 Fri,  4 Mar 2022 14:24:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A97A18009BA; Fri,  4 Mar 2022 15:21:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/35] docs: Add spec of OVMF GUIDed table for SEV guests
Date: Fri,  4 Mar 2022 15:21:15 +0100
Message-Id: <20220304142123.956171-28-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Add docs/specs/sev-guest-firmware.rst which describes the GUIDed table
in the end of OVMF's image which is parsed by QEMU, and currently used
to describe some values for SEV and SEV-ES guests.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220103091413.2869-1-dovmurik@linux.ibm.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/specs/index.rst              |   1 +
 docs/specs/sev-guest-firmware.rst | 125 ++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 docs/specs/sev-guest-firmware.rst

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index ecc43896bb21..2a35700fb322 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -18,3 +18,4 @@ guest hardware that is specific to QEMU.
    acpi_mem_hotplug
    acpi_pci_hotplug
    acpi_nvdimm
+   sev-guest-firmware
diff --git a/docs/specs/sev-guest-firmware.rst b/docs/specs/sev-guest-firmware.rst
new file mode 100644
index 000000000000..3f7f082df594
--- /dev/null
+++ b/docs/specs/sev-guest-firmware.rst
@@ -0,0 +1,125 @@
+====================================================
+QEMU/Guest Firmware Interface for AMD SEV and SEV-ES
+====================================================
+
+Overview
+========
+
+The guest firmware image (OVMF) may contain some configuration entries
+which are used by QEMU before the guest launches.  These are listed in a
+GUIDed table at a known location in the firmware image.  QEMU parses
+this table when it loads the firmware image into memory, and then QEMU
+reads individual entries when their values are needed.
+
+Though nothing in the table structure is SEV-specific, currently all the
+entries in the table are related to SEV and SEV-ES features.
+
+
+Table parsing in QEMU
+---------------------
+
+The table is parsed from the footer: first the presence of the table
+footer GUID (96b582de-1fb2-45f7-baea-a366c55a082d) at 0xffffffd0 is
+verified.  If that is found, two bytes at 0xffffffce are the entire
+table length.
+
+Then the table is scanned backwards looking for the specific entry GUID.
+
+QEMU files related to parsing and scanning the OVMF table:
+ - ``hw/i386/pc_sysfw_ovmf.c``
+
+The edk2 firmware code that constructs this structure is in the
+`OVMF Reset Vector file`_.
+
+
+Table memory layout
+-------------------
+
++------------+--------+-----------------------------------------+
+|    GPA     | Length |               Description               |
++============+========+=========================================+
+| 0xffffff80 | 4      | Zero padding                            |
++------------+--------+-----------------------------------------+
+| 0xffffff84 | 4      | SEV hashes table base address           |
++------------+--------+-----------------------------------------+
+| 0xffffff88 | 4      | SEV hashes table size (=0x400)          |
++------------+--------+-----------------------------------------+
+| 0xffffff8c | 2      | SEV hashes table entry length (=0x1a)   |
++------------+--------+-----------------------------------------+
+| 0xffffff8e | 16     | SEV hashes table GUID:                  |
+|            |        | 7255371f-3a3b-4b04-927b-1da6efa8d454    |
++------------+--------+-----------------------------------------+
+| 0xffffff9e | 4      | SEV secret block base address           |
++------------+--------+-----------------------------------------+
+| 0xffffffa2 | 4      | SEV secret block size (=0xc00)          |
++------------+--------+-----------------------------------------+
+| 0xffffffa6 | 2      | SEV secret block entry length (=0x1a)   |
++------------+--------+-----------------------------------------+
+| 0xffffffa8 | 16     | SEV secret block GUID:                  |
+|            |        | 4c2eb361-7d9b-4cc3-8081-127c90d3d294    |
++------------+--------+-----------------------------------------+
+| 0xffffffb8 | 4      | SEV-ES AP reset RIP                     |
++------------+--------+-----------------------------------------+
+| 0xffffffbc | 2      | SEV-ES reset block entry length (=0x16) |
++------------+--------+-----------------------------------------+
+| 0xffffffbe | 16     | SEV-ES reset block entry GUID:          |
+|            |        | 00f771de-1a7e-4fcb-890e-68c77e2fb44e    |
++------------+--------+-----------------------------------------+
+| 0xffffffce | 2      | Length of entire table including table  |
+|            |        | footer GUID and length (=0x72)          |
++------------+--------+-----------------------------------------+
+| 0xffffffd0 | 16     | OVMF GUIDed table footer GUID:          |
+|            |        | 96b582de-1fb2-45f7-baea-a366c55a082d    |
++------------+--------+-----------------------------------------+
+| 0xffffffe0 | 8      | Application processor entry point code  |
++------------+--------+-----------------------------------------+
+| 0xffffffe8 | 8      | "\0\0\0\0VTF\0"                         |
++------------+--------+-----------------------------------------+
+| 0xfffffff0 | 16     | Reset vector code                       |
++------------+--------+-----------------------------------------+
+
+
+Table entries description
+=========================
+
+SEV-ES reset block
+------------------
+
+Entry GUID: 00f771de-1a7e-4fcb-890e-68c77e2fb44e
+
+For the initial boot of an AP under SEV-ES, the "reset" RIP must be
+programmed to the RAM area defined by this entry.  The entry's format
+is:
+
+* IP value [0:15]
+* CS segment base [31:16]
+
+A hypervisor reads the CS segment base and IP value.  The CS segment
+base value represents the high order 16-bits of the CS segment base, so
+the hypervisor must left shift the value of the CS segment base by 16
+bits to form the full CS segment base for the CS segment register. It
+would then program the EIP register with the IP value as read.
+
+
+SEV secret block
+----------------
+
+Entry GUID: 4c2eb361-7d9b-4cc3-8081-127c90d3d294
+
+This describes the guest RAM area where the hypervisor should inject the
+Guest Owner secret (using SEV_LAUNCH_SECRET).
+
+
+SEV hashes table
+----------------
+
+Entry GUID: 7255371f-3a3b-4b04-927b-1da6efa8d454
+
+This describes the guest RAM area where the hypervisor should install a
+table describing the hashes of certain firmware configuration device
+files that would otherwise be passed in unchecked.  The current use is
+for the kernel, initrd and command line values, but others may be added.
+
+
+.. _OVMF Reset Vector file:
+   https://github.com/tianocore/edk2/blob/master/OvmfPkg/ResetVector/Ia16/ResetVectorVtf0.asm
-- 
2.35.1


