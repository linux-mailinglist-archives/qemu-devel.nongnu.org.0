Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418DF1C8BF7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 15:21:15 +0200 (CEST)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWgSg-0006Z0-4x
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 09:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jWgOa-0000Xt-BV
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:17:00 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49158
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jWgOY-0005TZ-HK
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588857417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JMZPNU/ZJ2CNEmE/b+rTtNXJRN47WtkPKsFSw/1iR88=;
 b=bwDhBLLg2T1bCqqfWikhu4ou5BcELnN542dbGKCwsRSOmf4rLU3yBKCq6EQdLJ+DIlxDU1
 OZUmtZYG3PI5ilgHVQ/poETV9BzbRnpLhhgU6LHNLUTwfPxuJkTQPc9lvSm8c5FLdCMeWh
 hJVax+1ByOaR1M0MOsR4u2N/3p0CuGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-MRdRggt6OG2ACEjL1MBbbw-1; Thu, 07 May 2020 09:16:51 -0400
X-MC-Unique: MRdRggt6OG2ACEjL1MBbbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BEB48018A2;
 Thu,  7 May 2020 13:16:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 320295C1BE;
 Thu,  7 May 2020 13:16:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4C77717477; Thu,  7 May 2020 15:16:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/15] acpi: i386 tweaks
Date: Thu,  7 May 2020 15:16:25 +0200
Message-Id: <20200507131640.14041-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First batch of microvm patches, some generic acpi stuff.
Split the acpi-build.c monster, specifically split the
pc and q35 and pci bits into a separate file which we
can skip building at some point in the future.

v2 changes: leave acpi-build.c largely as-is, move useful
bits to other places to allow them being reused, specifically:

 * move isa device generator functions to individual isa devices.
 * move fw_cfg generator function to fw_cfg.c

v3 changes: fix rtc, support multiple lpt devices.

v4 changes:
 * drop merged patches.
 * split rtc crs change to separata patch.
 * added two cleanup patches.
 * picked up ack & review tags.

v5 changes:
 * add comment for rtc crs update.
 * add even more cleanup patches.
 * picked up ack & review tags.

take care,
  Gerd

Gerd Hoffmann (15):
  qtest: allow DSDT acpi table changes
  acpi: move aml builder code for rtc device
  acpi: rtc: use a single crs range
  acpi: serial: don't use _STA method
  acpi: move aml builder code for serial device
  acpi: parallel: don't use _STA method
  acpi: move aml builder code for parallel device
  acpi: move aml builder code for floppy device
  acpi: move aml builder code for i8042 (kbd+mouse) device
  acpi: factor out fw_cfg_add_acpi_dsdt()
  acpi: simplify build_isa_devices_aml()
  acpi: drop serial/parallel enable bits from dsdt
  acpi: drop build_piix4_pm()
  acpi: q35: drop _SB.PCI0.ISA.LPCD opregion.
  floppy: make isa_fdc_get_drive_max_chs static

 hw/i386/fw_cfg.h                            |   1 +
 include/hw/block/fdc.h                      |   2 -
 tests/qtest/bios-tables-test-allowed-diff.h |  17 ++
 hw/block/fdc.c                              |  87 +++++-
 hw/char/parallel.c                          |  22 ++
 hw/char/serial-isa.c                        |  22 ++
 hw/i386/acpi-build.c                        | 312 +-------------------
 hw/i386/fw_cfg.c                            |  28 ++
 hw/input/pckbd.c                            |  31 ++
 hw/rtc/mc146818rtc.c                        |  24 ++
 stubs/cmos.c                                |   7 +
 stubs/Makefile.objs                         |   1 +
 12 files changed, 244 insertions(+), 310 deletions(-)
 create mode 100644 stubs/cmos.c

-- 
2.18.4


