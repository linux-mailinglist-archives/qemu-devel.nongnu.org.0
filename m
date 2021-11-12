Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2936944E569
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:11:49 +0100 (CET)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUTE-0005oV-93
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:11:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlUQs-0003M7-4M
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:09:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlUQp-0006KD-TN
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nlmAlYAPSehPBG6PvKxpsca85GAAYhDfav60pyxVUAU=;
 b=e36d6pUXTzGU1Z0OHDBZnD6IvhHhzqlfpn9cducyS5hbtbmsItHKp650V3WFllY/ISAMvl
 /F080lpL5CfDILLwcqyQc1sg/JK/RUY5AMx/9QXKIRrVwgDX63OLXXfg4v+NGeRip9vXTg
 NZlXFbROUTe8UMyl1hO2RRyEopL/+LE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-iokilSvXMp2sozlEKgK6VQ-1; Fri, 12 Nov 2021 06:09:14 -0500
X-MC-Unique: iokilSvXMp2sozlEKgK6VQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED2C3BAF83;
 Fri, 12 Nov 2021 11:09:13 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 020F95C1D0;
 Fri, 12 Nov 2021 11:09:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v3 0/5] Fix Q35 ACPI PCI Hot-plug I/O issues
Date: Fri, 12 Nov 2021 06:08:52 -0500
Message-Id: <20211112110857.3116853-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ani@anisinha.ca, mapfelba@redhat.com, jusual@redhat.com, kraxel@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

                                                                                 
Changelog:
  v3:
    * drop unnecessary expected blobs                                                                       
  v2:                                                                            
    * simplify [1/5] and rename property to x-native-hotplug (CC stable)         
    * [4/5]                                                                      
       - rename function parameter to reflect actual action                      
       - drop local 'hotplug' variable and opencode statement                    
    * test with SeaBIOS/OVMF and Linux guest,                                    
      Windows also works with SeaBIOS, can't install it in EFI                   
      mode on current master (it's stuck when formatting disk/or                 
      copying files to hdd).                                                     
                                                                                 
Attempt [1] to fix I/O allocation with the 'reserve-io' hint on each             
pcie-root-port resulted in regression [2-3]. This patchset aims to fix           
it by addressing the root cause of the problem - the disabled PCIe               
Slot HPC bit.
This series enables PCIe Slot HPC bit which allows UEFI to enumerate and
initialize resources on ports, instead we hide PCIe hotplug capability in
host-bridge's ACPI _OSC method, which effectively make guest to use
ACPI based hotplug on host-bridge attached hierarchy.
                                                                                 
[1] 'hw/pcie-root-port: Fix hotplug for PCI devices requiring IO'                
[2] https://gitlab.com/qemu-project/qemu/-/issues/641                            
[3] https://bugzilla.redhat.com/show_bug.cgi?id=2006409                          
                                                          

Igor Mammedov (2):
  pcie: rename 'native-hotplug' to 'x-native-hotplug'
  tests: bios-tables-test update expected blobs

Julia Suvorova (3):
  hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machine type
  bios-tables-test: Allow changes in DSDT ACPI tables
  hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC

 include/hw/acpi/ich9.h                |   1 +
 hw/acpi/ich9.c                        |  18 ++++++++++++++++++
 hw/i386/acpi-build.c                  |  12 ++++++++----
 hw/i386/pc.c                          |   2 ++
 hw/i386/pc_q35.c                      |   9 +++++++--
 hw/pci/pcie_port.c                    |   2 +-
 tests/data/acpi/q35/DSDT              | Bin 8289 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat     | Bin 9614 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge       | Bin 11003 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp         | Bin 8753 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9943 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt       | Bin 8364 -> 8364 bytes
 tests/data/acpi/q35/DSDT.ivrs         | Bin 8306 -> 8306 bytes
 tests/data/acpi/q35/DSDT.memhp        | Bin 9648 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64       | Bin 9419 -> 9419 bytes
 tests/data/acpi/q35/DSDT.multi-bridge | Bin 8583 -> 8583 bytes
 tests/data/acpi/q35/DSDT.nohpet       | Bin 8147 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem      | Bin 8295 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.xapic        | Bin 35652 -> 35652 bytes
 21 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.27.0


