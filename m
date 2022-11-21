Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7DB63285A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox8qM-0002dq-Gz; Mon, 21 Nov 2022 10:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox8qK-0002dR-Tn
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:36:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox8qJ-0007s9-3r
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669044977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d5PwBbRbXh2ppkms0Q/mqIhsS4j6n6AyfGP3Sphs1L0=;
 b=MfCczQH/SirMLrAeIuuoboRY6w3OkktzKrmxQOWvrWt9diOZFvx/5u0/FpDqNjLitNjeG3
 480OcXB42+9PkDLXwqQ0oYXNlJrW1oi7Tdk667o5meUw933Yy+4BxgdX0noJEjAxjDxXbt
 5O2k6F+L67bOBqzt9tpe3xACy99ryXM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-20j2j0-APrW-3qvhnXvK6Q-1; Mon, 21 Nov 2022 10:36:16 -0500
X-MC-Unique: 20j2j0-APrW-3qvhnXvK6Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D954F811E81;
 Mon, 21 Nov 2022 15:36:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33340492CA2;
 Mon, 21 Nov 2022 15:36:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	kraxel@redhat.com
Subject: [PATCH for-7.2 0/3] Fix lack of keyboard in SeaBIOS/grub/FreeDOS
Date: Mon, 21 Nov 2022 16:36:10 +0100
Message-Id: <20221121153613.3972225-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It's too late for actual SeaBIOS fix to get merged in time for 7.2
so here goes a workaround in QEMU.
See patch 2/3 for full description.

Igor Mammedov (3):
  tests: acpi: whitelist DSDT before moving PRQx to _SB scope
  acpi: x86: move RPQx field back to _SB scope
  tests: acpi: x86: update expected DSDT after moving PRQx fields in _SB
    scope

 hw/isa/lpc_ich9.c                             |  16 ++++------------
 hw/isa/piix3.c                                |  12 ++++--------
 tests/data/acpi/pc/DSDT                       | Bin 6501 -> 6458 bytes
 tests/data/acpi/pc/DSDT.acpierst              | Bin 6461 -> 6418 bytes
 tests/data/acpi/pc/DSDT.acpihmat              | Bin 7826 -> 7783 bytes
 tests/data/acpi/pc/DSDT.bridge                | Bin 9575 -> 9532 bytes
 tests/data/acpi/pc/DSDT.cphp                  | Bin 6965 -> 6922 bytes
 tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8155 -> 8112 bytes
 tests/data/acpi/pc/DSDT.hpbridge              | Bin 6461 -> 6418 bytes
 tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3107 -> 3064 bytes
 tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6573 -> 6530 bytes
 tests/data/acpi/pc/DSDT.memhp                 | Bin 7860 -> 7817 bytes
 tests/data/acpi/pc/DSDT.nohpet                | Bin 6359 -> 6316 bytes
 tests/data/acpi/pc/DSDT.numamem               | Bin 6507 -> 6464 bytes
 tests/data/acpi/pc/DSDT.roothp                | Bin 6699 -> 6656 bytes
 tests/data/acpi/q35/DSDT                      | Bin 8412 -> 8310 bytes
 tests/data/acpi/q35/DSDT.acpierst             | Bin 8429 -> 8327 bytes
 tests/data/acpi/q35/DSDT.acpihmat             | Bin 9737 -> 9635 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8691 -> 8589 bytes
 tests/data/acpi/q35/DSDT.applesmc             | Bin 8458 -> 8356 bytes
 tests/data/acpi/q35/DSDT.bridge               | Bin 11541 -> 11439 bytes
 tests/data/acpi/q35/DSDT.core-count2          | Bin 32552 -> 32450 bytes
 tests/data/acpi/q35/DSDT.cphp                 | Bin 8876 -> 8774 bytes
 tests/data/acpi/q35/DSDT.cxl                  | Bin 9738 -> 9636 bytes
 tests/data/acpi/q35/DSDT.dimmpxm              | Bin 10066 -> 9964 bytes
 tests/data/acpi/q35/DSDT.ipmibt               | Bin 8487 -> 8385 bytes
 tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8500 -> 8398 bytes
 tests/data/acpi/q35/DSDT.ivrs                 | Bin 8429 -> 8327 bytes
 tests/data/acpi/q35/DSDT.memhp                | Bin 9771 -> 9669 bytes
 tests/data/acpi/q35/DSDT.mmio64               | Bin 9542 -> 9440 bytes
 tests/data/acpi/q35/DSDT.multi-bridge         | Bin 8732 -> 8630 bytes
 tests/data/acpi/q35/DSDT.nohpet               | Bin 8270 -> 8168 bytes
 tests/data/acpi/q35/DSDT.numamem              | Bin 8418 -> 8316 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8513 -> 8411 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 9018 -> 8916 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 9044 -> 8942 bytes
 tests/data/acpi/q35/DSDT.viot                 | Bin 9521 -> 9419 bytes
 tests/data/acpi/q35/DSDT.xapic                | Bin 35775 -> 35673 bytes
 38 files changed, 8 insertions(+), 20 deletions(-)

-- 
2.31.1


