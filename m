Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839CB5AB6EA
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:55:00 +0200 (CEST)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9wZ-0007NH-2Y
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tJ-0001yk-7T
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tF-0003O2-M7
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662137492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HI92pK/CZ54wqDK4XFIH21/EhQkpD15WepPZ0yCs5s8=;
 b=cQ503A/g2lClw+ezWfrlmlX4B/u5AxUEvkOym21VcQs91DmSkeWwJR1T3uFg6u6jv67dl2
 XOy6pOrooJVzzcu69d86iirytF98Vb6ymB3f//xz9Y2uJe0jF9VVlHpH1u4fwgsQbD3adW
 +SSUU7GelDq9xH483qQ/EsJ5Odtr40U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-OOKmBL4FMQK6XdP9jwgZ7w-1; Fri, 02 Sep 2022 12:51:31 -0400
X-MC-Unique: OOKmBL4FMQK6XdP9jwgZ7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED8FC101AA4A;
 Fri,  2 Sep 2022 16:51:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59EA02026D4C;
 Fri,  2 Sep 2022 16:51:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 0/8] tests: Make expliction defaults for tests
Date: Fri,  2 Sep 2022 18:51:18 +0200
Message-Id: <20220902165126.1482-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Hi

For a long, long time I have had local hacks on my tree to be able to
run "make tests" when I have a minimal configure guest.  This is a
first try to upstream some of it.

- by default we always setup -display none (it already was the
  default, but some places added it anyways)

- by default we always setup -net none.  Not clear what was the
  default, but no tests use the default net, so it is safe change and
  now it is explicit.

- by default we always setup -vga none.  This is a complete difference
  can of worms.  Every tests that use vga already set vga correctly,
  so this is quite obvious, right?  Now they are acpi tables.  They
  are a mess.  And basically this means remove a device for each one
  of them.  Why going through all the trouble?  Because while I am
  develping, I normall compile out vga.

- Fix several error strings that were set with copy paste.

- replication test requires CONFIG_REPLICATION.
- test-crypto-secret requires CONFIG_SECRET_KEYRING.

Please review.  Except for the acpi changes (that I hope I have done
right following the instructions) the rest is quite obvious.

Later, Juan.

Juan Quintela (8):
  qtest: "-display none" is set in qtest_init()
  qtest: Set "-net none" in qtest_init()
  tests/acpi: The new default is -vga none
  tests/qtest: Add -vga none by default
  tests/acpi: Regenerate all needed tables
  tests: Fix error strings
  meson-build: Enable CONFIG_REPLICATION only when replication is set
  meson-build: test-crypto-secret depends on CONFIG_SECRET_KEYRING

 meson.build                           |   2 +-
 tests/qtest/bios-tables-test.c        |   2 +-
 tests/qtest/boot-serial-test.c        |   4 ++--
 tests/qtest/dbus-display-test.c       |   2 +-
 tests/qtest/display-vga-test.c        |  12 ++++++------
 tests/qtest/e1000-test.c              |   2 +-
 tests/qtest/es1370-test.c             |   2 +-
 tests/qtest/fuzz-lsi53c895a-test.c    |   2 +-
 tests/qtest/fuzz-megasas-test.c       |   2 +-
 tests/qtest/fuzz-sb16-test.c          |   6 +++---
 tests/qtest/fuzz-sdcard-test.c        |   6 +++---
 tests/qtest/fuzz-virtio-scsi-test.c   |   2 +-
 tests/qtest/fuzz-xlnx-dp-test.c       |   2 +-
 tests/qtest/fuzz/generic_fuzz.c       |   3 +--
 tests/qtest/fuzz/i440fx_fuzz.c        |   2 +-
 tests/qtest/fuzz/qos_fuzz.c           |   2 +-
 tests/qtest/libqtest.c                |   2 ++
 tests/data/acpi/pc/DSDT               | Bin 5987 -> 5992 bytes
 tests/data/acpi/pc/DSDT.acpierst      | Bin 5954 -> 5959 bytes
 tests/data/acpi/pc/DSDT.acpihmat      | Bin 7312 -> 7317 bytes
 tests/data/acpi/pc/DSDT.bridge        | Bin 8653 -> 8658 bytes
 tests/data/acpi/pc/DSDT.cphp          | Bin 6451 -> 6456 bytes
 tests/data/acpi/pc/DSDT.dimmpxm       | Bin 7641 -> 7646 bytes
 tests/data/acpi/pc/DSDT.hpbridge      | Bin 5954 -> 5959 bytes
 tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3069 -> 3023 bytes
 tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6059 -> 6064 bytes
 tests/data/acpi/pc/DSDT.memhp         | Bin 7346 -> 7351 bytes
 tests/data/acpi/pc/DSDT.nohpet        | Bin 5845 -> 5850 bytes
 tests/data/acpi/pc/DSDT.numamem       | Bin 5993 -> 5998 bytes
 tests/data/acpi/pc/DSDT.roothp        | Bin 6195 -> 6151 bytes
 tests/data/acpi/pc/ERST.acpierst      | Bin 912 -> 912 bytes
 tests/data/acpi/q35/DMAR.dmar         | Bin 120 -> 112 bytes
 tests/data/acpi/q35/DSDT              | Bin 8274 -> 8228 bytes
 tests/data/acpi/q35/DSDT.acpierst     | Bin 8291 -> 8245 bytes
 tests/data/acpi/q35/DSDT.acpihmat     | Bin 9599 -> 9553 bytes
 tests/data/acpi/q35/DSDT.applesmc     | Bin 8320 -> 8274 bytes
 tests/data/acpi/q35/DSDT.bridge       | Bin 10988 -> 10944 bytes
 tests/data/acpi/q35/DSDT.cphp         | Bin 8738 -> 8692 bytes
 tests/data/acpi/q35/DSDT.cxl          | Bin 9600 -> 9502 bytes
 tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9928 -> 9882 bytes
 tests/data/acpi/q35/DSDT.ipmibt       | Bin 8349 -> 8303 bytes
 tests/data/acpi/q35/DSDT.ipmismbus    | Bin 8363 -> 8317 bytes
 tests/data/acpi/q35/DSDT.ivrs         | Bin 8291 -> 8245 bytes
 tests/data/acpi/q35/DSDT.memhp        | Bin 9633 -> 9587 bytes
 tests/data/acpi/q35/DSDT.mmio64       | Bin 9404 -> 9358 bytes
 tests/data/acpi/q35/DSDT.multi-bridge | Bin 8568 -> 8524 bytes
 tests/data/acpi/q35/DSDT.nohpet       | Bin 8132 -> 8086 bytes
 tests/data/acpi/q35/DSDT.numamem      | Bin 8280 -> 8234 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 8375 -> 8329 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8880 -> 8834 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8906 -> 8860 bytes
 tests/data/acpi/q35/DSDT.viot         | Bin 9383 -> 9339 bytes
 tests/data/acpi/q35/DSDT.xapic        | Bin 35637 -> 35591 bytes
 tests/data/acpi/q35/ERST.acpierst     | Bin 912 -> 912 bytes
 tests/data/acpi/q35/IVRS.ivrs         | Bin 104 -> 100 bytes
 tests/data/acpi/q35/VIOT.viot         | Bin 112 -> 112 bytes
 tests/unit/meson.build                |   4 +++-
 57 files changed, 31 insertions(+), 28 deletions(-)

-- 
2.37.2


