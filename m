Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3847051E950
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:09:28 +0200 (CEST)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPny-0007S5-OC
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlE-0004fy-OP; Sat, 07 May 2022 15:06:36 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:39927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlC-0001XG-Ux; Sat, 07 May 2022 15:06:36 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-deb9295679so10547896fac.6; 
 Sat, 07 May 2022 12:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J8SbmmJZOZ2K6d/7pVoqNk6UQWlFpU7U5UPZ7RXCdeM=;
 b=cF/2KQE89oil3BX+KlASoUa9YmiDTbwlXzMkZ533Cy/NTJzorY+8Hpu1WCcyI1CzX8
 4D6P5+riP7fkBlTE+6cBbjFR+R+nXEY72h7yuV5+K1Bn5cGda99H9ddosUTNYs4GL8bn
 nT/54NTE3DD4/hSjydLwG0ZaxuWRGFY/d8ykR84/3AI4zxoXWNp2YCHCiAficYOUg2dG
 bOYr9ieDm1DTmEP9M9jLVegfWRgQ1aC3map850dxdU8TTvhahUTCN1kj7XofbocAvKZr
 boCJbLHazeARp9j834DozDT5dQJhVOv+rAb44U3suRZ+hhKsUJ0NMv96nXx7SQmen7AC
 Fhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J8SbmmJZOZ2K6d/7pVoqNk6UQWlFpU7U5UPZ7RXCdeM=;
 b=qpmbN1LVX2UG7YrkH09+gBRM9o2BOyu5ZrSYYfhi4mzw9VZou1mP4Cl3uzRIcwImoM
 n0H+QC1jAl2QWW47k+IKjPMp06fbKVz+RQV50rI+fHyLOqfFMyXro7l6QhQyMP1b7faX
 z1rkdv2bK2RbN1qS4kigmlkrubX7IXVG8WD15xDw0L4EKqJsp+4FTf2M2hGtGxB8Y+pP
 cQaRTwd+yCHbLXEwiwtLtRN0KjbWV04QGK116+YxQSUAIq+GBf+b7hpKEk9jbM87HIwa
 rdi29cmDB+ImNak1ELaCi03AJzkNTy/Zbz+PTo3ORmCnTgyhbE0hFgpBvZ42Y9uh8pEh
 yxyQ==
X-Gm-Message-State: AOAM531MuMsotiEZIgGGQylWyyyCJk/VR1x4ronBJrP6SKDl7ggnsgoj
 svXUkivDRHJJUOuQNXEr4wKTes/avl8=
X-Google-Smtp-Source: ABdhPJyh3ezbsLYxSRkdSzYGdDZ0/GyjpNFmBMtOKIfKXt0Yfg+jzxvXyZfCvf1tMKWDWbggD/2haQ==
X-Received: by 2002:a05:6871:80e:b0:ed:895a:ae92 with SMTP id
 q14-20020a056871080e00b000ed895aae92mr3472148oap.187.1651950392540; 
 Sat, 07 May 2022 12:06:32 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 00/17] powernv: introduce pnv-phb unified devices
Date: Sat,  7 May 2022 16:06:07 -0300
Message-Id: <20220507190624.507419-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Hi,

Since the 7.0.0 release cycle we have a desire to use the powernv
emulation with libvirt. To do that we need to enable user creatable
pnv-phb devices to allow more user customization an to avoid spamming
multiple default devices in the domain XML. In the middle of the
previous cycle we experimented with user created
pnv-phb3/pnv-phb3-root-port/pnv-phb4/pnv-phb4-root-port/pnv-phb5. The
end result, although functional, is that the user needs to deal with a
lot of versioned devices that, from the user perspective, does the same
thing. In a way we outsourced the implementation details of the PHBs
(e.g. pnv8 uses phb3, pnv9 uses phb4) to the command line. Having more
devices also puts an extra burden in the libvirt support we want to
have.

To solve this, Cedric and Frederic gave the idea of adding a common
virtual pnv-phb device that the user can add in the command line, and
QEMU handles the details internally. Unfortunatelly this idea turned out
to be way harder than anticipated. Between creating a device that would
just forward the callbacks to the existing devices internally, creating
a PnvPHB device with the minimal attributes and making the other devices
inherit from it, and making an 'abstract' device that could be casted
for both phb3 and phb4 PHBs, all sorts of very obscure problems occured:
PHBs not being detected, interrupts not being delivered and memory
regions not being able to read/write registers. My initial impression is
that there are assumptions made both in ppc/pnv and hw/pci-host that
requires the memory region and the bus being in the same device. Even
if we somehow figure all this out, the resulting code is hacky and
annoying to maitain.

This brings us to this series. The cleaner way I found to accomplish
what we want to do is to create real, unified pnv-phb/phb-phb-root-port
devices, and get rid of all the versioned ones. This is done by
merging all the PHB3/PHB4 attributes in unified devices. pnv_phb3* and pnv_phb4*
files end up using the same pnv-phb and phb-phb-root-port unified devices,
with the difference that pnv_phb3* only cares about version 3 attributes
and pnv_phb4* only cares about PHB4 attributes. Introducing new PHB
versions in the future will be a matter of adding any non-existent
attributes in the unified pnv-phb* devices and using them in separated
pnv_phbN* files. 

The pnv-phb implementation per se is just a router for either phb3 or
phb4 logic, done in init() and realize() time, after we check which powernv
machine we're running. If running with powernv8 we redirect control to
pnv_phb3_realize(), otherwise we redirect to pnv_phb4_realize(). The
unified device does not do anything per se other than handling control
to the right version.

After this series, this same powernv8 command line that boots a powernv8
machine with some phbs and root ports and with network:

./qemu-system-ppc64 -m 4G \
-machine powernv8 -smp 2,sockets=2,cores=1,threads=1  \
-accel tcg,thread=multi -bios skiboot.lid  \
-kernel vmlinux -initrd buildroot.rootfs.cpio -append 'console=hvc0 ro xmon=on'  \
-nodefaults  -serial mon:stdio -nographic  \
-device pnv-phb,chip-id=0,index=0,id=pcie.0 \
-device pnv-phb,chip-id=0,index=1,id=pcie.1 \
-device pnv-phb,chip-id=1,index=2,id=pcie.2 \
-device pnv-phb-root-port,id=root0,bus=pcie.2 \
-device pnv-phb-root-port,id=root1,bus=pcie.1 \
-device pcie-pci-bridge,id=bridge1,bus=root0,addr=0x0  \
-device nvme,bus=bridge1,addr=0x1,drive=drive0,serial=1234  \
-drive file=./simics-disk.raw,if=none,id=drive0,format=raw,cache=none  \
-device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=bridge1,addr=0x3 \
-netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
-device nec-usb-xhci,bus=bridge1,addr=0x2


Can be used to boot powernv9 and powernv10 machines with the same attributes
just by changing the machine type. 


Daniel Henrique Barboza (17):
  ppc/pnv: rename PnvPHB3.ioda* to PnvPHB3.ioda2*
  ppc/pnv: rename PnvPHB3.regs[] to PnvPHB3.regs3[]
  ppc/pnv: rename PnvPHB3.dma_spaces to PnvPHB3.v3_dma_spaces
  ppc/pnv: add unified pnv-phb header
  ppc/pnv: add pnv-phb device
  ppc/pnv: remove PnvPHB3
  ppc/pnv: user created pnv-phb for powernv8
  ppc/pnv: remove PnvPHB4
  ppc/pnv: user creatable pnv-phb for powernv9
  ppc/pnv: use PnvPHB.version
  ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
  ppc/pnv: user creatable pnv-phb for powernv10
  ppc/pnv: add pnv_phb_get_current_machine()
  ppc/pnv: add pnv-phb-root-port device
  ppc/pnv: remove pnv-phb3-root-port
  ppc/pnv: remove pnv-phb4-root-port
  ppc/pnv: remove pecc->rp_model

 hw/pci-host/meson.build        |   3 +-
 hw/pci-host/pnv_phb.c          | 258 ++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb3.c         | 256 +++++++++++-----------------
 hw/pci-host/pnv_phb3_msi.c     |  12 +-
 hw/pci-host/pnv_phb3_pbcq.c    |   8 +-
 hw/pci-host/pnv_phb4.c         | 298 ++++++++++++---------------------
 hw/pci-host/pnv_phb4_pec.c     |  14 +-
 hw/ppc/pnv.c                   |  41 ++++-
 include/hw/pci-host/pnv_phb.h  | 224 +++++++++++++++++++++++++
 include/hw/pci-host/pnv_phb3.h | 118 +------------
 include/hw/pci-host/pnv_phb4.h | 108 ++----------
 include/hw/ppc/pnv.h           |   3 +-
 12 files changed, 757 insertions(+), 586 deletions(-)
 create mode 100644 hw/pci-host/pnv_phb.c
 create mode 100644 include/hw/pci-host/pnv_phb.h

-- 
2.32.0


