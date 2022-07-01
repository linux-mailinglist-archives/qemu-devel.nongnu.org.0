Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CBD563474
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:39:12 +0200 (CEST)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GrW-00041f-Hu
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Go1-00012A-0s
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Gnw-0004ED-6U
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656682519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6/FWS+LssYhMQdLESIJYNjBuV1aEJsZpBfIkPaJWx7Q=;
 b=FB4FSyecMzU6O1JhiVPfOYRCv3iJxz5eyDR/Riznjh2TCF2CIGxfseuWsUDKM+qLV+QP9a
 yVQNfHFoDcKWIQYb2dNcpMAWU3nAv5sI3wFThNoMOC2su4bY9o82mlDX2qd7volsrbDwmq
 /ByD1gvLI4k/jd2mVPHSWbl687oUOjQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-u2-5FBq7OUK-HYpLOYXxcA-1; Fri, 01 Jul 2022 09:35:18 -0400
X-MC-Unique: u2-5FBq7OUK-HYpLOYXxcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9760801233;
 Fri,  1 Jul 2022 13:35:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AD30400DEFC;
 Fri,  1 Jul 2022 13:35:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 00/17] acpi:pc/q35: minor PCI refactoring/cleanups
Date: Fri,  1 Jul 2022 09:34:58 -0400
Message-Id: <20220701133515.137890-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Flushing out ACPI PCI cleanups that preceed conversion of
DSDT PCI slots ennumeration to AcpiDevAmlIf interface.
It's is mostly collection of patches thraet removes code
duplication, we've accumulated around PCI relaterd AML
in DSDT.

git:
   https://gitlab.com/imammedo/qemu.git x86_pci_cleanups

Igor Mammedov (17):
  tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
  acpi: x86: deduplicate HPET AML building
  tests: acpi: update expected blobs after HPET move
  tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
  acpi: x86: refactor PDSM method to reduce nesting
  x86: acpi: _DSM: use Package to pass parameters
  tests: acpi: update expected blobs
  tests: acpi: whitelist pc/q35 DSDT before switching _DSM to use ASUN
  x86: acpi: cleanup PCI device _DSM duplication
  tests: acpi: update expected blobs
  tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
  x86: pci: acpi: reorder Device's _ADR and _SUN fields
  tests: acpi: update expected blobs
  tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
  x86: pci: acpi:  reorder Device's _DSM method
  tests: acpi: update expected blobs
  x86: pci: acpi: deduplate PCI slots creation

 hw/i386/acpi-build.c                  | 302 ++++++++++++++------------
 tests/data/acpi/pc/DSDT               | Bin 5987 -> 6422 bytes
 tests/data/acpi/pc/DSDT.acpierst      | Bin 5954 -> 6382 bytes
 tests/data/acpi/pc/DSDT.acpihmat      | Bin 7312 -> 7747 bytes
 tests/data/acpi/pc/DSDT.bridge        | Bin 8653 -> 9496 bytes
 tests/data/acpi/pc/DSDT.cphp          | Bin 6451 -> 6886 bytes
 tests/data/acpi/pc/DSDT.dimmpxm       | Bin 7641 -> 8076 bytes
 tests/data/acpi/pc/DSDT.hpbridge      | Bin 5954 -> 6382 bytes
 tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3069 -> 3069 bytes
 tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6059 -> 6494 bytes
 tests/data/acpi/pc/DSDT.memhp         | Bin 7346 -> 7781 bytes
 tests/data/acpi/pc/DSDT.nohpet        | Bin 5845 -> 6280 bytes
 tests/data/acpi/pc/DSDT.numamem       | Bin 5993 -> 6428 bytes
 tests/data/acpi/pc/DSDT.roothp        | Bin 6195 -> 6656 bytes
 tests/data/acpi/q35/DSDT              | Bin 8274 -> 8320 bytes
 tests/data/acpi/q35/DSDT.acpierst     | Bin 8291 -> 8337 bytes
 tests/data/acpi/q35/DSDT.acpihmat     | Bin 9599 -> 9645 bytes
 tests/data/acpi/q35/DSDT.applesmc     | Bin 8320 -> 8366 bytes
 tests/data/acpi/q35/DSDT.bridge       | Bin 10988 -> 11449 bytes
 tests/data/acpi/q35/DSDT.cphp         | Bin 8738 -> 8784 bytes
 tests/data/acpi/q35/DSDT.cxl          | Bin 9600 -> 9646 bytes
 tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9928 -> 9974 bytes
 tests/data/acpi/q35/DSDT.ipmibt       | Bin 8349 -> 8395 bytes
 tests/data/acpi/q35/DSDT.ipmismbus    | Bin 8363 -> 8409 bytes
 tests/data/acpi/q35/DSDT.ivrs         | Bin 8291 -> 8337 bytes
 tests/data/acpi/q35/DSDT.memhp        | Bin 9633 -> 9679 bytes
 tests/data/acpi/q35/DSDT.mmio64       | Bin 9404 -> 9450 bytes
 tests/data/acpi/q35/DSDT.multi-bridge | Bin 8568 -> 8640 bytes
 tests/data/acpi/q35/DSDT.nohpet       | Bin 8132 -> 8178 bytes
 tests/data/acpi/q35/DSDT.numamem      | Bin 8280 -> 8326 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 8375 -> 8421 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8880 -> 8926 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8906 -> 8952 bytes
 tests/data/acpi/q35/DSDT.viot         | Bin 9383 -> 9429 bytes
 tests/data/acpi/q35/DSDT.xapic        | Bin 35637 -> 35683 bytes
 35 files changed, 161 insertions(+), 141 deletions(-)

-- 
2.31.1


