Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E033C54B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:12:18 +0100 (CET)
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrhR-0007bN-Ny
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrWq-0000yc-0U
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrWm-0008KW-RE
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MOF0ZnP0m64Wgmka4/yEy1of/F6iYEj+kL3MAPzvm0o=;
 b=AjiFURfYQPjL9KGqq7OZd0RtnVNnwxZq4OaOrZ7FIor+2vNT5HJU/8bbDjto4zvOa2Qn1s
 MpNsnlTRghQvuTAEW96x0mh66F79L/YQMvzadeVWZjIg3sLNad137P+jWOmmEmDrVjz6sG
 jj5/r5llG6TgJYSzxyhq4k5KXWRpJLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-JppfKYYSMCSVAv5Fvv4vHQ-1; Mon, 15 Mar 2021 14:01:13 -0400
X-MC-Unique: JppfKYYSMCSVAv5Fvv4vHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAC42101F02C
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 18:01:09 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B5A876C20;
 Mon, 15 Mar 2021 18:01:05 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] pc: support user provided NIC naming/indexing
Date: Mon, 15 Mar 2021 14:00:56 -0400
Message-Id: <20210315180102.3008391-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


Changes since rfc:
  * make sure that acpi-index unique
  * use dedicated MMIO register for it
  * drop syntetic acpi-label field in _DSM
  * add more comments

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
   https://github.com/imammedo/qemu/branches acpi-index-v1


CC: laine@redhat.com
CC: mst@redhat.com
CC: jusual@redhat.com

Igor Mammedov (6):
  tests: acpi: temporary whitelist DSDT changes
  pci: introduce apci-index property for PCI device
  pci: acpi: ensure that acpi-index is unique
  acpi: add aml_to_decimalstring() and aml_call6() helpers
  pci: acpi: add _DSM method to PCI devices
  tests: acpi: update expected blobs

 include/hw/acpi/aml-build.h      |   3 +
 include/hw/acpi/pci.h            |   1 +
 include/hw/acpi/pcihp.h          |   9 ++-
 include/hw/pci/pci.h             |   1 +
 hw/acpi/aml-build.c              |  28 ++++++++
 hw/acpi/pci.c                    |   1 -
 hw/acpi/pcihp.c                  | 104 ++++++++++++++++++++++++++-
 hw/acpi/piix4.c                  |   3 +-
 hw/acpi/trace-events             |   2 +
 hw/i386/acpi-build.c             | 118 +++++++++++++++++++++++++++++--
 hw/pci/pci.c                     |   1 +
 tests/data/acpi/pc/DSDT          | Bin 5065 -> 6002 bytes
 tests/data/acpi/pc/DSDT.acpihmat | Bin 6390 -> 7327 bytes
 tests/data/acpi/pc/DSDT.bridge   | Bin 6924 -> 8668 bytes
 tests/data/acpi/pc/DSDT.cphp     | Bin 5529 -> 6466 bytes
 tests/data/acpi/pc/DSDT.dimmpxm  | Bin 6719 -> 7656 bytes
 tests/data/acpi/pc/DSDT.hpbridge | Bin 5026 -> 5969 bytes
 tests/data/acpi/pc/DSDT.ipmikcs  | Bin 5137 -> 6074 bytes
 tests/data/acpi/pc/DSDT.memhp    | Bin 6424 -> 7361 bytes
 tests/data/acpi/pc/DSDT.nohpet   | Bin 4923 -> 5860 bytes
 tests/data/acpi/pc/DSDT.numamem  | Bin 5071 -> 6008 bytes
 tests/data/acpi/pc/DSDT.roothp   | Bin 5261 -> 6210 bytes
 22 files changed, 261 insertions(+), 10 deletions(-)

-- 
2.27.0


