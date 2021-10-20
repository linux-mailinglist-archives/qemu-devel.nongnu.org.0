Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5296434901
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:35:23 +0200 (CEST)
Received: from localhost ([::1]:40880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8wL-00068J-Hy
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hC-0003QI-Th
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hB-0002sq-2j
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DojFyI8EvkqW3utABMlfyrMcp5+zRY2rAvm55Ie1TK0=;
 b=DG1EmT0tVODytU58ol5NnbMkPCu9ysq8NyN0DFDrMiIqOW0hkSooLtJrv3KZ0qwl4t26b2
 IbbRYhstQRwo2pq4xnzGYOGQV0JHU6UqIgQdjjt789GCRRWeUvLKJWR9REilAsF2Pv7tyi
 EZGlQMZuZnPG8R9ZCqDxdzw3oTWI4ms=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-jzpyBquOOtWYb4iOq7Xf3A-1; Wed, 20 Oct 2021 06:19:38 -0400
X-MC-Unique: jzpyBquOOtWYb4iOq7Xf3A-1
Received: by mail-ed1-f69.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so20523015edl.18
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DojFyI8EvkqW3utABMlfyrMcp5+zRY2rAvm55Ie1TK0=;
 b=InVfwQpvHTKQAbMLVElVchKtnG6TT54oxseQp14gIJkI8A5tiT3c/TKmg7aZ7F6FOH
 AhMQrFSWXPvgwMjaP0RFs63j0b/jI5i+YJ8SSIG29lujQTOyt/uni/4ztU8pTYQok1eJ
 Rz+VDKbeG8KA+s5eXRlfHmbzp2E9okEu+9Gve8ThIY4f0bonRrxCUXKEbLkW7UznUDBJ
 NXZsCIaVCbwqtBE6FD19GYgM000tH623tLBjTIB8YJixDxscpGzEFLKkKFlMkYT3kvEv
 deUWyzZuhvbOG19hlFsum2xDqDwB2yo99V4I8q6hjRtWc4jbRd5fox/bJ31xsvpMcbCR
 dN9w==
X-Gm-Message-State: AOAM530+cAjXKAeDiAfnmzUBN/h5K++oELuMedaRvrO/hVCqfVJScctX
 T6fWRkJf4AeJStSLYpXCmqDz54FDALE/GskntioTpoPqn6OJd36pIQCOTQ+tPDzv0iK/YAfweEV
 9YNOWFYl+pYvlQSVGsWjAzvbb4c9mnx2Y3PbG3FUqx2G5mj09PRPTT8tNYdht
X-Received: by 2002:a05:6402:447:: with SMTP id
 p7mr61037963edw.261.1634725177425; 
 Wed, 20 Oct 2021 03:19:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7sLPt1sHod/PbcuROnDfc+Mti47qldjbvNbTRIJ1sC8cHASd0/Wf+io6v5zTy6k0lgQE3Yw==
X-Received: by 2002:a05:6402:447:: with SMTP id
 p7mr61037921edw.261.1634725177220; 
 Wed, 20 Oct 2021 03:19:37 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id bw12sm827021ejb.9.2021.10.20.03.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:36 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/44] tests: acpi: add expected blob for DMAR table
Message-ID: <20211020101844.988480-9-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

[000h 0000   4]                    Signature : "DMAR"    [DMA Remapping table]
[004h 0004   4]                 Table Length : 00000078
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 15
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   1]           Host Address Width : 26
[025h 0037   1]                        Flags : 01
[026h 0038  10]                     Reserved : 00 00 00 00 00 00 00 00 00 00

[030h 0048   2]                Subtable Type : 0000 [Hardware Unit Definition]
[032h 0050   2]                       Length : 0040

[034h 0052   1]                        Flags : 00
[035h 0053   1]                     Reserved : 00
[036h 0054   2]           PCI Segment Number : 0000
[038h 0056   8]        Register Base Address : 00000000FED90000

[040h 0064   1]            Device Scope Type : 03 [IOAPIC Device]
[041h 0065   1]                 Entry Length : 08
[042h 0066   2]                     Reserved : 0000
[044h 0068   1]               Enumeration ID : 00
[045h 0069   1]               PCI Bus Number : FF

[046h 0070   2]                     PCI Path : 00,00

[048h 0072   1]            Device Scope Type : 01 [PCI Endpoint Device]
[049h 0073   1]                 Entry Length : 08
[04Ah 0074   2]                     Reserved : 0000
[04Ch 0076   1]               Enumeration ID : 00
[04Dh 0077   1]               PCI Bus Number : 00

[04Eh 0078   2]                     PCI Path : 00,00

[050h 0080   1]            Device Scope Type : 01 [PCI Endpoint Device]
[051h 0081   1]                 Entry Length : 08
[052h 0082   2]                     Reserved : 0000
[054h 0084   1]               Enumeration ID : 00
[055h 0085   1]               PCI Bus Number : 00

[056h 0086   2]                     PCI Path : 01,00

[058h 0088   1]            Device Scope Type : 01 [PCI Endpoint Device]
[059h 0089   1]                 Entry Length : 08
[05Ah 0090   2]                     Reserved : 0000
[05Ch 0092   1]               Enumeration ID : 00
[05Dh 0093   1]               PCI Bus Number : 00

[05Eh 0094   2]                     PCI Path : 1F,00

[060h 0096   1]            Device Scope Type : 01 [PCI Endpoint Device]
[061h 0097   1]                 Entry Length : 08
[062h 0098   2]                     Reserved : 0000
[064h 0100   1]               Enumeration ID : 00
[065h 0101   1]               PCI Bus Number : 00

[066h 0102   2]                     PCI Path : 1F,02

[068h 0104   1]            Device Scope Type : 01 [PCI Endpoint Device]
[069h 0105   1]                 Entry Length : 08
[06Ah 0106   2]                     Reserved : 0000
[06Ch 0108   1]               Enumeration ID : 00
[06Dh 0109   1]               PCI Bus Number : 00

[06Eh 0110   2]                     PCI Path : 1F,03

[070h 0112   2]                Subtable Type : 0002 [Root Port ATS Capability]
[072h 0114   2]                       Length : 0008

[074h 0116   1]                        Flags : 01
[075h 0117   1]                     Reserved : 00
[076h 0118   2]           PCI Segment Number : 0000

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-9-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DMAR.dmar               | Bin 0 -> 120 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a2843335c8..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DMAR.dmar",
diff --git a/tests/data/acpi/q35/DMAR.dmar b/tests/data/acpi/q35/DMAR.dmar
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..0dca6e68ad8a8ca5b981bcfbc745385a63e9f216 100644
GIT binary patch
literal 120
zcmZ?qbquOtU|?Vrb@F%i2v%^42yj*a0!E-1hz+9EKm;5(Kv_5cff&pjK;l18KZphb
W2+atk<zX}vL|mSkiGhOwWE=ohp9%p0

literal 0
HcmV?d00001

-- 
MST


