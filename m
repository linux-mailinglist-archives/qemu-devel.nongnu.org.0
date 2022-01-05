Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF0485A96
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:27:19 +0100 (CET)
Received: from localhost ([::1]:54132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DoU-0004D6-KZ
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:27:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlD-00010J-0R; Wed, 05 Jan 2022 16:23:55 -0500
Received: from [2607:f8b0:4864:20::930] (port=35447
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlB-0007pV-6f; Wed, 05 Jan 2022 16:23:54 -0500
Received: by mail-ua1-x930.google.com with SMTP id o20so879269uat.2;
 Wed, 05 Jan 2022 13:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KOXQLeMVOI+HCr/OJP1lcs2Z44BdQW0Tl6se6hCxA6U=;
 b=gv721oWrXnxxNZJa+XivDb53wcQ32Eg9LnzVrcrLceWqeKAV+zFMZ10RmsBFC8OUYU
 pk+3B6q9qvBDhROT7Qk41Uy2En9vh3J07amMr5Z2ZOaO/H8jLpsXpvyVPlKyV82QNEqD
 Lbg7s7qVbz2Bt7X+iB1b3u5SKNxMWfm3fsYExRyimdZx+CGZnUFjnniEvx+lY5BvsQCk
 mcNtV1tdw82ipIwUqbktAJFh94UKV77Gp1Z/c0QXKzOEJPimHGAKh9HU62tWAAjukiJV
 p904mAtOHCQCe3Mqu6O+0IIQF+sGwVPV2M2j0yJC8TbAUFKXzzi7ypudd9yW2JE7DKB/
 PIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KOXQLeMVOI+HCr/OJP1lcs2Z44BdQW0Tl6se6hCxA6U=;
 b=dL+65hX03xR29C+gx/fmZv3it3aBzNdjSBi3/3bYJtfQoLxc52KtA31dkdw8HreFsT
 HvNUXWeooQUTUirMUuTMDUTadxHtbpUjL7zbAetMT3BnLILgv+sfEd1q87K7E3hFbH5I
 wFKraE4ObQWaEjhY2WA+QWFbpp4mY1m7YX6sfn00912t71UY1/UMrSe75462+I/uHTe6
 2pr61F9omti9gZXO0IsgU46jGrDwDg8vfVhcsW8Lt7Hj9WTFtBc8S6B2QD+v95Ec9epS
 U4r7mYJAm/Dc2Ndz7dcScupHGVZEk6zHgLNRTZ6SiTNqylGk0o1UqSO6hY2ToWvvmMxW
 ibFw==
X-Gm-Message-State: AOAM530yVAkO51ObmbS5tqb4hThNzGGBVLnTPTHvY0zpnXfyV3dmU8Hx
 uTHbRTU442YfUGHXzmbG0uqUg2UCzBY=
X-Google-Smtp-Source: ABdhPJy9hDUIIa+J3OOx8KxbzIdF5iMnhTK5GxXNS573nMVsOB5SfuqW7kJdiH2lKNYOyLrkQe/+8w==
X-Received: by 2002:a67:3311:: with SMTP id z17mr17165533vsz.4.1641417831422; 
 Wed, 05 Jan 2022 13:23:51 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:23:51 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/18] user creatable pnv-phb3/pnv-phb4 devices 
Date: Wed,  5 Jan 2022 18:23:20 -0300
Message-Id: <20220105212338.49899-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This second version was rebased with upstream and includes fixed/amended
versions of relevant patches that were sent to the mailing list and aren't
upstream yet. In this process 4 patches from v1 were discarded, becoming
either irrelevant or squashed into others.

The patches are organized as follows:

- patches 1-4: enable user creatable phb3/phb4 root ports
- patches 5-10: enable user creatable pnv-phb3 devices
- patches 11-18: enable user creatable pnv-phb4 devices

Here are some examples of what we're able to do with this series:

* powernv8 machine with -nodefaults,2 pnv-phb3s with 'pcie.N' name,
one of them with a root port and a netcard:

$ qemu-system-ppc64 -m 4G -machine powernv8,accel=tcg -smp 2,cores=2,threads=1 \
-bios skiboot.lid  -kernel vmlinux -initrd buildroot.rootfs.cpio \
-append 'console=hvc0 ro xmon=on' \
-nodefaults \
-serial mon:stdio -nographic \
-device pnv-phb3,chip-id=0,index=0,id=pcie.0 \
-device pnv-phb3,chip-id=0,index=2,id=pcie.2 \
-device pnv-phb3-root-port,bus=pcie.2,id=pcie.5 \
-netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
-device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=pcie.5,addr=0x0

* powernv9 machine with -nodefaults, 3 of the available 12 pnv-phb4 devices
created, 2 root ports, one of the port with a pcie-pci-bridge and
devices connected in the bridge:

$ qemu-system-ppc64 -m 4G -machine powernv9 \
-smp 2,sockets=2,cores=1,threads=1 \
-accel tcg,thread=multi -bios skiboot.lid \
-kernel vmlinux -initrd buildroot.rootfs.cpio \
-append 'console=hvc0 ro xmon=on' \
-nodefaults \
-serial mon:stdio -nographic \
-device pnv-phb4,chip-id=0,index=0,id=pcie.0 \
-device pnv-phb4,chip-id=0,index=4,id=pcie.1 \
-device pnv-phb4,chip-id=1,index=3,id=pcie.2 \
-device pnv-phb4-root-port,id=root0,bus=pcie.2 \
-device pnv-phb4-root-port,id=root1,bus=pcie.1 \
-device pcie-pci-bridge,id=bridge1,bus=root0,addr=0x0 \
-device nvme,bus=bridge1,addr=0x1,drive=drive0,serial=1234 \
-drive file=./simics-disk.raw,if=none,id=drive0,format=raw,cache=none \
-device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=bridge1,addr=0x3 \
-netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
-device nec-usb-xhci,bus=bridge1,addr=0x2 


* powernv8/9 with default settings can be used as usual. The work done
in this series didn't change the name of the buses created by the
default root ports (named pcie.0...N):

$ qemu-system-ppc64 -m 4G \
-machine powernv9 -smp 2,sockets=2,cores=1,threads=1  \
-accel tcg,thread=multi -bios skiboot.lid  \
-kernel vmlinux -initrd buildroot.rootfs.cpio \
-append 'console=hvc0 ro xmon=on' \
-serial mon:stdio -nographic \
-device pcie-pci-bridge,id=bridge1,bus=pcie.0,addr=0x0 \
-device nvme,bus=bridge1,addr=0x1,drive=drive0,serial=1234  \
-drive file=./simics-disk.raw,if=none,id=drive0,format=raw,cache=none \
-device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=bridge1,addr=0x3 \
-netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
-device nec-usb-xhci,bus=bridge1,addr=0x2 


Changes from v1:
- rebased with upstream at 7d4ae4d497807
- added relevant patches that aren't upstream yet from "ppc/pnv:
Preliminary cleanups before user created PHBs" [1] and "ppc/pnv: Add
support for user created PHB3/PHB4 devices" [2] series
- renamed phb3/phb4 default buses name to 'pnv-phb3-root' and
'pnv-phb4-root'
- renamed pnv_pec_get_phb_id() to pnv_phb4_pec_get_phb_id()
- patch 'introduce pnv_pec_init_stack_xscom()' moved to patch 16 to
be closer with patch 17 that uses it
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg04427.html

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03810.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg01548.html


Cédric Le Goater (5):
  ppc/pnv: Attach PHB3 root port device when defaults are enabled
  ppc/pnv: Introduce support for user created PHB3 devices
  ppc/pnv: Reparent user created PHB3 devices to the PnvChip
  ppc/pnv: Complete user created PHB3 devices
  ppc/pnv: Move num_phbs under Pnv8Chip

Daniel Henrique Barboza (13):
  pnv_phb3.c: add unique chassis and slot for pnv_phb3_root_port
  pnv_phb4.c: add unique chassis and slot for pnv_phb4_root_port
  pnv_phb4.c: make pnv-phb4-root-port user creatable
  pnv_phb4.c: check if root port exists in rc_config functions
  pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
  pnv_phb4.c: introduce pnv_phb4_set_stack_phb_props()
  pnv_phb4_pec.c: move pnv_pec_phb_offset() to pnv_phb4.c
  pnv_phb4_pec: use pnv_phb4_pec_get_phb_id() in pnv_pec_dt_xscom()
  pnv_phb4.h: turn phb into a pointer in struct PnvPhb4PecStack
  pnv_phb4_pec.c: use 'default_enabled()' to init stack->phb
  pnv_phb4.c: introduce pnv_pec_init_stack_xscom()
  ppc/pnv: Introduce user creatable pnv-phb4 devices
  pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name

 hw/pci-host/pnv_phb3.c         |  57 ++++++++--
 hw/pci-host/pnv_phb4.c         | 193 ++++++++++++++++++++++++++++++---
 hw/pci-host/pnv_phb4_pec.c     |  86 ++++++---------
 hw/ppc/pnv.c                   |  55 ++++++++--
 include/hw/pci-host/pnv_phb3.h |   4 +-
 include/hw/pci-host/pnv_phb4.h |  15 ++-
 include/hw/ppc/pnv.h           |   8 +-
 7 files changed, 322 insertions(+), 96 deletions(-)

-- 
2.33.1


