Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C4558C5C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 02:42:47 +0200 (CEST)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4XPJ-0003Ge-H0
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 20:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK9-00084q-6C
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:25 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:62472
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK5-000846-5W
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:23 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25NK2t5j012330
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=OctyYve3tJ8BxXswzxV6+5rB3b9u1SkjkZdFOM3OP3k=;
 b=TzMu9R3XWmXh+4SFdJIPNcaPBRRRF2wA+WGYTdjzV7pyF8SeXdcRCCItSKiaE6vDM4sB
 nTqekh7K+PuT+tRoJtwarPMgbLE4BEI8oOr47Ib/kWGYet3iQEv6iZq/cjvBu+CEWyqL
 QmwNZz4+aDIqlyMk++qkZhqa5upheZ0TfqQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net (PPS) with ESMTPS id 3gvce7yscx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:14 -0700
Received: from twshared18443.03.prn6.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:12 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 2DB4F88BA291; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 0/8] aspeed: Add multi-SoC machine
Date: Thu, 23 Jun 2022 17:36:53 -0700
Message-ID: <20220624003701.1363500-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: WFbieDk8dCRF3aCckYckpL67zAa0n4o_
X-Proofpoint-ORIG-GUID: WFbieDk8dCRF3aCckYckpL67zAa0n4o_
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

v2:
- Rebased on upstream/master + v2 of Cedric's DRAM mapping change:
  https://patchwork.ozlabs.org/project/qemu-devel/patch/20220623202123.3972=
977-1-clg@kaod.org/
- Got rid of all the sysbus patches, not needed (I can send the dead code
  cleanup separately).
- Changed "system-memory" to "memory".
- Moved SoC unimplemented devices into AspeedSoCState, initialized and
  mapped them like normal peripheral devices.
- Added one more patch that removes 1 qemu_get_cpu call in aspeed_ast2600.c
- Kept the aspeed_board_init_flashes change: if you'd like, feel free
  to drop that patch and the one after it, I can work on refactoring
  them more to avoid that.

A few problems I still have before I can add the additional SoC and fix the
boot rom initialization:

1.
    We want to use '-device loader' to load firmware into 0x0000_0000, but
    that's not really how the SoC works. The SoC reads from SPI flash. It
    would be great if I could do '-device loader,file=3Dfirmware,addr=3D0x2=
000_0000',
    and 0x2000_0000 is the firmware controller's mmio region and it would
    store the file into the SPI flash device and the boot ROM (0x0000_0000)
    automatically, but I don't think that's possible right?

    It seems like what I'll need to do is make '-drive' the source of truth,
    and initialize the boot rom from that, similar to the existing code in
    aspeed.c with "write_boot_rom".

2.
    Right now the SoC doesn't initialize the boot rom memory region, the
    machine does it. Perhaps I should fix that, like the DRAM change Cedric
    made?

3.
    Each SoC creates its own SRAM memory with "memory_region_init_ram", so
    the machine doesn't know the name of it.

    Memory regions like that need to have a unique name for vm migration,
    but each SoC just gives it a generic one, "aspeed.sram". If you try to
    run multiple SoC's, the names collide.

    How is an SoC supposed to produce a unique name for each memory region
    it has, so that it doesn't collide with other SoC's?

    Should the machine provide the SRAM region and select a name that
    doesn't collide with other SoC's in the machine?

    That seems weird, because the SRAM is internal to the SoC. It has a size
    and mmio address that's internal to the SoC.

4.
    Lastly, I don't know a good way to allocate serial devices to the SoC
    UART's.

    Perhaps I can make each serial device specify the UART it should connect
    to? Like "-serial stdio,uart=3Dbmc.uart5".

    Maybe I can create a subclass of the normal serial devices for this?

    I'm also not sure how the naming scheme would work. Probably just
    decided by the machine?

Note: I've reduced the number of emails cc'd in this series because I was
having trouble with the mail filter at work. Hopefully this goes through
properly.

Thanks,
Peter

Peter Delevoryas (8):
  aspeed: Set CPU memory property explicitly
  aspeed: Add memory property to Aspeed SoC
  aspeed: Remove usage of sysbus_mmio_map
  aspeed: Map unimplemented devices in SoC memory
  aspeed: Remove use of qemu_get_cpu
  aspeed: Add fby35 skeleton
  aspeed: Make aspeed_board_init_flashes public
  aspeed: Add AST2600 (BMC) to fby35

 MAINTAINERS                 |   1 +
 hw/arm/aspeed.c             |  29 ++--------
 hw/arm/aspeed_ast10x0.c     |  46 ++++++++-------
 hw/arm/aspeed_ast2600.c     |  84 +++++++++++++++------------
 hw/arm/aspeed_soc.c         | 110 +++++++++++++++++++++++++++---------
 hw/arm/fby35.c              |  93 ++++++++++++++++++++++++++++++
 hw/arm/meson.build          |   3 +-
 include/hw/arm/aspeed_soc.h |  13 +++++
 8 files changed, 269 insertions(+), 110 deletions(-)
 create mode 100644 hw/arm/fby35.c

--=20
2.30.2


