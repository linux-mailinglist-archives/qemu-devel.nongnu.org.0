Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6455FC23
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:37:33 +0200 (CEST)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6U8a-0000Bo-13
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6U4M-0005HX-BO
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:33:11 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:45841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6U4F-0008V2-TN
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=GJAKp9PqnOifilfwFTj5vcUwpyeo0cewR1dIeuH22q0=;
 b=BU0NZn0P2KQh13DJ5KzWkDtWH29VDVqbQ0EkFHa4f7G4ru2/Oo0A0v4L
 09NVw1p6x3r+7H5c9nXfdJZm3+FQAKqD8zyPM1gM5SpNptBZYJl3gYTyL
 SziROlTGpj1n6z0Q8FW6tEUyWIjX3bHSbHQvRXvxMVlQI0XL8OV6At67R I=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,231,1650924000"; d="scan'208";a="18060701"
Received: from clt-128-93-179-171.vpn.inria.fr (HELO [128.93.179.171])
 ([128.93.179.171]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 11:33:00 +0200
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
From: Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH v3 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>
Date: Wed, 29 Jun 2022 11:32:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=192.134.164.104;
 envelope-from=Brice.Goglin@inria.fr; helo=mail3-relais-sop.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow -numa without initiator value when hmat=on so that we may
build more complex topologies, e.g. NUMA nodes whose best initiators
are not just another single node.

changes v2->v3:
* improve messages for patches 0/4 and 3/4
changes v1->v2:
* add q35 acpi test

Brice Goglin (4):
   hmat acpi: Don't require initiator value in -numa
   tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
   tests: acpi: q35: add test for hmat nodes without initiators
   tests: acpi: q35: update expected blobs *.hmat-noinitiators

  hw/core/machine.c                             |   4 +-
  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
  tests/data/acpi/q35/FACP.acpihmat-noinitiator | Bin 0 -> 244 bytes
  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
  tests/qtest/bios-tables-test.c                |  45 ++++++++++++++++++
  7 files changed, 46 insertions(+), 3 deletions(-)
  create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/FACP.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator

-- 
2.30.2



