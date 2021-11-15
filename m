Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781BE4509DE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:42:30 +0100 (CET)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf3t-0001l7-Ih
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:42:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf05-0002VF-LK
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:33 -0500
Received: from usb-smtp-delivery-124.mimecast.com ([170.10.151.124]:20553
 helo=us-smtp-delivery-124.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf02-0005EG-H3
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WmFv7QwLptoIeFn8Ljm4ArUBy32oCI/xJ386N3kA1sA=;
 b=Kz6CAs+kdK0jowU8rVtnBbxW+zV0jCvROpia+yjwUxcNd7ayBpfgSgTYSOKQiEVvz9l1p1
 TTkZT1yPDKaQd+tvRw+VvDI2haxcJGvQ/U96G5i9HOUaC4XpNX6CLp5q9DhGBAS/Cs/vGc
 HZ82EJ4Qen+wwjTTtAALgYvZe287qIU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2--bsVTBOKPLGxxx41yKFFQQ-1; Mon, 15 Nov 2021 11:38:26 -0500
X-MC-Unique: -bsVTBOKPLGxxx41yKFFQQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso14472925edj.20
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WmFv7QwLptoIeFn8Ljm4ArUBy32oCI/xJ386N3kA1sA=;
 b=Umu8U9rcWKOLi9s72rTFTTUCjBcnApFpbGB4O9L1vPfWW2wGpL05k3AEKFjs1auGz2
 JRxwfjJhyMnOGrTZXHGmTmfRiKqlnw4V8L2sFZVAINUX/sZrJ0/MDTV/T/QEoxBvw77U
 ivUGGK5iisshoR4Oz9/5vQDHyclSw9jsUSSxX/lLAPKY0XsxZuARHNG6ceFUlxpaDY49
 SsOJfeRg/8OQisrirxHD3FbA5GX9jwrHRNPUSYhv46LgR+tgdxdIcLYzYl2G8tygEOE4
 ftBM0Q16eMfB8CrunihSUR5+RLkBlL8l1xJ8dRvM4XEbCuW2w9AwYaNIbvbjS5YiyU6F
 Fjlg==
X-Gm-Message-State: AOAM5320z1HgR3KKurAm9YoKG6fSi6dMn3IKs7srVtOL+8FHz0raV8Yx
 gt/c4dhEiqK3U4blgNCmyTgqbJabfPuvMwVuXDOEfdDibnVHNxvuLmfj6c89lSfuB102i+U/0vo
 oaw1cYshTG1xhP3MXrvL+kvWXtqYL7JHQV8ZKjS8BbfIo5g+Iao7n6M9j5KZx
X-Received: by 2002:a17:907:75d3:: with SMTP id
 jl19mr382220ejc.520.1636994303632; 
 Mon, 15 Nov 2021 08:38:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR3ioUs/ik9yXfePCutnkl0L+g19oZqZc7dN1svracNo0ZRUQVZCldt5pag6oPZjLrGqntrQ==
X-Received: by 2002:a17:907:75d3:: with SMTP id
 jl19mr382175ejc.520.1636994303402; 
 Mon, 15 Nov 2021 08:38:23 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id hz15sm6841769ejc.63.2021.11.15.08.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:22 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] tests: bios-tables-test update expected blobs
Message-ID: <20211115163607.177432-11-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.151.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

The changes are the result of
        'hw/i386/acpi-build: Deny control on PCIe Native Hot-Plug in _OSC'
which hides PCIE hotplug bit in host-bridge _OSC

Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
             {
                 CreateDWordField (Arg3, Zero, CDW1)
                 If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
                     Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
-                    Local0 &= 0x1F
+                    Local0 &= 0x1E

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211112110857.3116853-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  16 ----------------
 tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9614 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11003 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8753 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9943 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8364 -> 8364 bytes
 tests/data/acpi/q35/DSDT.ivrs               | Bin 8306 -> 8306 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9648 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9419 -> 9419 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8583 -> 8583 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8147 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8295 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 35652 -> 35652 bytes
 16 files changed, 16 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 48e5634d4b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,17 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/DSDT.xapic",
diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 281fc82c03b2562d2e6b7caec0d817b034a47138..c1965f6051ef2af81dd8412abe169d87845bb033 100644
GIT binary patch
delta 24
gcmaFp@X&$FCD<h-QGtPh@z+GID~xg*?>ET<0BnZ{w*UYD

delta 24
gcmaFp@X&$FCD<h-QGtPh@#jRYD~$3R?>ET<0BnK?w*UYD

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 8c1e05a11a328ec1cc6f86e36e52c28f41f9744e..f24d4874bff8d327a165ed7c36de507aea114edd 100644
GIT binary patch
delta 24
fcmeD4?(^ny33dtTQ)OUa+&+=(3ZvY{`|DKzU@Hhn

delta 24
fcmeD4?(^ny33dtTQ)OUa+%}Qx3ZwkS`|DKzU?vDi

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 6f1464b6c712d7f33cb4b891b7ce76fe228f44c9..424d51bd1cb39ea73501ef7d0044ee52cec5bdac 100644
GIT binary patch
delta 24
gcmewz`a6`%CD<k8w-y5fBg;gtD~xg*@5^Wb0CWThXaE2J

delta 24
gcmewz`a6`%CD<k8w-y5fBlASAD~$3R@5^Wb0CWEcXaE2J

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index f8337ff5191a37a47dcf7c09a6c39c4e704a15bf..f1275606f68eeba54bfb11e63d818420385a62b9 100644
GIT binary patch
delta 24
fcmdn!veAXhCD<jzP>F$oF>WH)6-K#@_k$DxTWtqt

delta 24
fcmdn!veAXhCD<jzP>F$oF?J%?6-N1u_k$DxTWAMo

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index fe5820d93d057ef09a001662369b15afbc5b87e2..76e451e829ec4c245315f7eed8731aa1be45a747 100644
GIT binary patch
delta 24
gcmccad)=4ICD<k8x*7umqsK(9D~xg*@BdH*0B$o00{{R3

delta 24
gcmccad)=4ICD<k8x*7umqx(dzD~$3R@BdH*0B$Y`0{{R3

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 631741065860fd5036aa303904dabd1d2839f9c6..6ad2411d0ec95f204cfc64b430c537bce09c35bd 100644
GIT binary patch
delta 24
gcmZ4ExW<voCD<iojRFG$quxZWD~xg*@1K<i0AMf(82|tP

delta 24
gcmZ4ExW<voCD<iojRFG$qwYkmD~$3R@1K<i0AMQ!82|tP

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index b0eafe90e5832935557ec5e6802c0147c88f379c..cad26e3f0c27a40a33101155a5282ed9bcb1d441 100644
GIT binary patch
delta 24
gcmez5@X3M8CD<jTNP&TYan?kxD~xg*?@yKo0BrUMn*aa+

delta 24
gcmez5@X3M8CD<jTNP&TYappv>D~$3R?@yKo0BrFHn*aa+

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 9bc11518fc57687ca789dc70793b48b29a0d74ed..4e9cb3dc6896bb79ccac0fe342a404549f6610e8 100644
GIT binary patch
delta 24
gcmdnsy}_HyCD<iogDL|9<C}?GR~Y3s-oK~<0BV~F1poj5

delta 24
gcmdnsy}_HyCD<iogDL|9<LilBR~Y3t-oK~<0BV*A1poj5

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 713288a12ef2b70a20b4e8836c036ba4db3a57a8..eb5a1c7171c02d153487bfcecfb7019b7c1bf406 100644
GIT binary patch
delta 24
gcmX@@dD@f9CD<k8v<d?Q<BEw~R~Y3s-hZPE0B$h}CjbBd

delta 24
gcmX@@dD@f9CD<k8v<d?Q<MN4IR~Y3t-hZPE0B$S^CjbBd

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index a24c713d22102a1a1583b5c902edffe1694e5cfe..45808eb03b78d07ebbe853f674abfed589d35e26 100644
GIT binary patch
delta 24
fcmZp7Zg=K#33dr-S7cyd?3>7Sg;8$f{S^uTTRaEr

delta 24
fcmZp7Zg=K#33dr-S7cyd?48JUg;9Rv{S^uTTQ>*m

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index e8202e6ddfbe96071f32f1ec05758f650569943e..83d1aa00ac5686df479673fb0d7830f946e25dea 100644
GIT binary patch
delta 24
gcmca?f7zbPCD<k8vOEI=<B^G6R~Y3s-v1&80B=4CMF0Q*

delta 24
gcmca?f7zbPCD<k8vOEI=<Kc;1R~Y3t-v1&80B<=7MF0Q*

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 151e7cf42953f3f5fe61ff0140ab7b976fe9e5b8..050aaa237b466b0bda8cca5cfaa06f84661d622e 100644
GIT binary patch
delta 24
gcmaFv@Z5pRCD<h-U4emtamhrkD~xg*?{~-p0BWTOc>n+a

delta 24
gcmaFv@Z5pRCD<h-U4emtaq&d1D~$3R?{~-p0BWEJc>n+a

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index c96b5277a14ae98174408d690d6e0246bd932623..0ebdf6fbd77967f1ab5d5337b7b1fed314cfaca8 100644
GIT binary patch
delta 24
gcmdnzy3du%CD<iopArKDqxwXyD~xg*@84Gh0A(f!W&i*H

delta 24
gcmdnzy3du%CD<iopArKDquNBSD~$3R@84Gh0A(QvW&i*H

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index c92d4d29c79352a60974ea9f665d0b9a410a4bac..dcbb7f0af377425db53130e8ba1c62c09c22e006 100644
GIT binary patch
delta 24
gcmdnzy3du%CD<iopArKD<D-dOR~Y3s-oLL10Bm##ApigX

delta 24
gcmdnzy3du%CD<iopArKD<HLzuR~Y3t-oLL10BmmwApigX

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index 119fc90f1f8a7b6934df6fd95609446e627ce15d..17552ce363ae81985f69f9ae85837a1540b79ae0 100644
GIT binary patch
delta 26
icmX>yjp@iVCN7s?mk^h31_s6r6S=N1%5A)#+64f6_X&Rh

delta 26
icmX>yjp@iVCN7s?mk^h31_s9U6S=N1%5S`%+64f6@(F(c

-- 
MST


