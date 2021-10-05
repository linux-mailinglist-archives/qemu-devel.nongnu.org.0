Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F2422E76
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:54:27 +0200 (CEST)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnhy-0005du-7c
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvi-0002Nq-Rt
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvg-0007QP-6o
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHHs6Vz7+L9GpkA+xcD4+gX89xg4Q8BgFi/Oic5oyms=;
 b=e6s4+1yUaQ/K6Gb9/YPooVDmpcDeBi4SVPJjX5SroxmClB7CqmaHk6uVw9ABq/hJ0aFpKj
 UVFaZZVGiSBU49oRZAN5CaQ35WzCdGLYar/QkTxHF8qEAL467f35xMafs1cagibjri6OYK
 o+V6B5mPU9fhKOelSJobeCa1e6irLTY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-DJhmfcXBM9yKRCm9CT2hDQ-1; Tue, 05 Oct 2021 12:04:30 -0400
X-MC-Unique: DJhmfcXBM9yKRCm9CT2hDQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so196383wrr.9
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lHHs6Vz7+L9GpkA+xcD4+gX89xg4Q8BgFi/Oic5oyms=;
 b=UUMI2zjeTadIlIKAm2zgC72SoTQ+GXUVdNafm+WXiuny2/g8eePR4tv4rdTPLM1QmZ
 +508tOnVVlUAPUuPw3QaG6oyeqd7UTv5Dgf3RvQqpn5Ue0hAAspmS751HnNF75hVWsg3
 eFh3BFjWsjLlO3X81XyEUG0seuxkxpb6KODndkKy0GL4wN2M67vRB1guaKoqi1FHacfo
 s3WgLCRQw+p8Z5tU5i2nSHH1EojIY0KyV1FEGv1yQFOte4h+KwiQA1oD/73pSsOBHqs/
 oST9OUB1siUoMRnuOwntWfEaV+9rwTTuYOXKMznseERgD/1aMQN5t1/l94+btOVpBmTp
 RHDw==
X-Gm-Message-State: AOAM530+V95/nu4Num1vPsxC6/ZgY4X1PhNiGBCIbvjWHFfz5fG3kj+9
 GIEqsCYcNbdBgkitjJ4LVC4j8135Q0IsHjNdGadJt+FGnQtISi56jVucjYUWCVvtWiHHZJJyj1Z
 tJpRkeHdcR06U+hxKbYIhPgExWdV7QWbsEBmtN/z50mqMSLuW7U7FR9k9UB1p
X-Received: by 2002:adf:e549:: with SMTP id z9mr3870600wrm.334.1633449868777; 
 Tue, 05 Oct 2021 09:04:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuCW+A1xUO9mTH+ZMXvCm+0VCrThFmQGa3PxSYYBh9PX/vETXMASB13Uwm5dJrXmV3eC5f7g==
X-Received: by 2002:adf:e549:: with SMTP id z9mr3870568wrm.334.1633449868522; 
 Tue, 05 Oct 2021 09:04:28 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id a2sm4503309wru.82.2021.10.05.09.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:27 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 51/57] hw/i386/acpi: fix conflicting IO address range for acpi
 pci hotplug in q35
Message-ID: <20211005155946.513818-52-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
starts at address 0x0cc4 and ends at 0x0cdb. At the time when the patch was
written but the final version of the patch was not yet pushed upstream, this
address range was free and did not conflict with any other IO address ranges.
However, with the following change, this address range was no
longer conflict free as in this change, the IO address range
(value of ACPI_PCIHP_SIZE) was incremented by four bytes:

b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")

This can be seen from the output of QMP command 'info mtree' :

0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug

It shows that there is a region of conflict between IO regions of acpi
pci hotplug and acpi cpu hotplug.

Unfortunately, the change caf108bc58790 did not update the IO address range
appropriately before it was pushed upstream to accommodate the increased
length of the IO address space introduced in change b32bd763a1ca92.

Due to this bug, windows guests complain 'This device cannot find
enough free resources it can use' in the device manager panel for extended
IO buses. This issue also breaks the correct functioning of pci hotplug as the
following shows that the IO space for pci hotplug has been truncated:

(qemu) info mtree -f
FlatView #0
 AS "I/O", root: io
 Root memory region: io
  0000000000000cc4-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
  0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug

Therefore, in this fix, we adjust the IO address range for the acpi pci
hotplug so that it does not conflict with cpu hotplug and there is no
truncation of IO spaces. The starting IO address of PCI hotplug region
has been decremented by four bytes in order to accommodate four byte
increment in the IO address space introduced by change
b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")

After fixing, the following are the corrected IO ranges:

0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
0000000000000cc0-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug

This change has been tested using a Windows Server 2019 guest VM. Windows
no longer complains after this change.

Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20210916132838.3469580-3-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ich9.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index a329ce43ab..f04f1791bd 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -29,7 +29,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/tco.h"
 
-#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
+#define ACPI_PCIHP_ADDR_ICH9 0x0cc0
 
 typedef struct ICH9LPCPMRegs {
     /*
-- 
MST


