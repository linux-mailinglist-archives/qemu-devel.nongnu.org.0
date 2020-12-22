Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A2A2E10A4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 00:48:20 +0100 (CET)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krrO7-0006RG-HG
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 18:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrG9-0000Mg-T3
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrG6-0005HK-U3
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608680394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S47Xnk8Oc25UKr9aKkM9uB5y70ibtVhMretCEtyYZDY=;
 b=UNbKeGd/g4/jsIJgoIsEtZ5UMYtfAITdQX3DMfG9jUiQlrc1BqJbqWnSx5f76YH/a5WDY0
 0uqv4oTwfiK7QzHsko6V82JaVEJchJ1Ay4e9StI6Nto7DpeRsSDq40Ol5sjUs9D+lmLtpf
 xpr5hq47CtWHqq0UuvF5Q1/RVn2SEW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-mMPecR4iO0CWBWO81Uwk7Q-1; Tue, 22 Dec 2020 18:39:49 -0500
X-MC-Unique: mMPecR4iO0CWBWO81Uwk7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B95D4873155;
 Tue, 22 Dec 2020 23:39:48 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAE65D9CC;
 Tue, 22 Dec 2020 23:39:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/5] pc: support user provided NIC naming/indexing
Date: Tue, 22 Dec 2020 18:39:29 -0500
Message-Id: <20201222233934.451578-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jusual@redhat.com, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Series implements support for 'onboard' naming scheme for network
interfaces (1), which is based on PCI firmware spec and lets user
to explicitly specify index that will be used by guest to name
network interface, ex:
    -device e1000,acpi-index=33
should make guest rename NIC name to 'eno33' where 'eno' is default
prefix for this scheme.

Hope is that it will allow to simplify launching VMs from
template disk images with different set VM configurations
without need to reconfigure guest network intrfaces or
risk of loosing network connectivity.

For more detailed description/examples see patches [3-4/5]

1)
 https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/ 

Git repo for testing:
   https://github.com/imammedo/qemu/branches acpi-index-rfc

Igor Mammedov (5):
  acpi: add aml_to_decimalstring() and aml_call6() helpers
  tests: acpi: temporary whitelist DSDT changes
  pci: introduce apci-index property for PCI device
  pci: acpi: add _DSM method to PCI devices
  tests: acpi: update expected data files

 include/hw/acpi/aml-build.h                 |   3 +
 include/hw/acpi/pci.h                       |   1 +
 include/hw/acpi/pcihp.h                     |   7 +-
 include/hw/pci/pci.h                        |   1 +
 tests/qtest/bios-tables-test-allowed-diff.h |  21 +++++
 hw/acpi/aml-build.c                         |  28 +++++++
 hw/acpi/pci.c                               |  84 ++++++++++++++++++++
 hw/acpi/pcihp.c                             |  25 +++++-
 hw/i386/acpi-build.c                        |  31 +++++++-
 hw/pci/pci.c                                |   1 +
 tests/data/acpi/pc/DSDT                     | Bin 5065 -> 6023 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 6390 -> 7348 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 6924 -> 8689 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 5529 -> 6487 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 6719 -> 7677 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5026 -> 5990 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3084 -> 3177 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 5137 -> 6095 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 6424 -> 7382 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 5071 -> 6029 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 5261 -> 6324 bytes
 tests/data/acpi/q35/DSDT                    | Bin 7801 -> 7863 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9126 -> 9188 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 7819 -> 7911 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8265 -> 8327 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9455 -> 9517 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 7876 -> 7938 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9160 -> 9222 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 8932 -> 9024 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7807 -> 7869 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8407 -> 8468 bytes
 31 files changed, 197 insertions(+), 5 deletions(-)

-- 
2.27.0


