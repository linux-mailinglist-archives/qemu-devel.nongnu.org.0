Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F768F84F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:49:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqRK-0000SJ-KI; Wed, 08 Feb 2023 14:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqRH-0000Rj-WE
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:49:08 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqRG-00027O-0o
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:49:07 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3BFD320494;
 Wed,  8 Feb 2023 19:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675885744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mEs2/SzismL4scjqzWsC+SMohu9u8P8AgdQEJHL5pos=;
 b=D6jmzYb6kOT/xg2LQpjobHJrHkIKgXe5Q791zSJgC7SiUhSF2YaJI/H5j8sNhJeqkYfPd0
 Rg6BR4Lqet7yXgBZHP+3dp9GygNWhe2/fuyzcCmU/+71pBKb8xw6XkDkWeLcxcM9uA9xOb
 jiqGW1vDzCUz1fOuiN2R891IpgdlhGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675885744;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mEs2/SzismL4scjqzWsC+SMohu9u8P8AgdQEJHL5pos=;
 b=0joSnI7mCGpGgB7uDxuA9e9beaHUgROz103qWWDeFWbVsXXybbQVKPBL7SLHpPh1g6c1Kc
 XrqGg/zOVTHLpjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50FEE13425;
 Wed,  8 Feb 2023 19:49:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zn9RBq/842OZIwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:49:03 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 00/12] qtests vs. default devices
Date: Wed,  8 Feb 2023 16:46:48 -0300
Message-Id: <20230208194700.11035-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Based on: <20230208192654.8854-1-farosas@suse.de>
[PATCH v2 00/10] Kconfig vs. default devices
https://lore.kernel.org/r/20230208192654.8854-1-farosas@suse.de

v2:

patch 3 - fixed typo s/PCIE_ROOT/PCIE_PORT and dropped runtime check;

patch 4 - dropped runtime check and added a dep on CONFIG_VIRTIO_SERIAL;

patch 7 - added skip messages and folded look_for_device_builtin into
          has_device_builtin;

patch 9 - dropped runtime check;

v1:
https://lore.kernel.org/r/20230206150416.4604-1-farosas@suse.de

Most of our tests assume the presence of default devices. When
building --without-default-devices or with individual CONFIGs
disabled, several tests fail.

I went through them one by one and did local changes to skip or avoid
including tests that require devices that are missing. With these
initial changes, 'make check' now passes for the
--without-default-devices build for x86 and arm.

However, the approach of making local changes seems hard to maintain:
every time a CONFIG changes from 'y' to 'n' a test might break and all
new tests need to remember to check before adding devices, which some
tests add several.

So the last patch in the series provides an alternative: Parse the
command line at qtest_init and skip the test if devices are
missing. Individual tests would have to check 'if (!qts)' and
bail. Seems a bit heavy-weight, but it would mean we don't have to put
a qtest_has_device check for every device in every test.

Based on: <20230206140809.26028-1-farosas@suse.de>
[PATCH 00/10] Kconfig vs. default devices
https://lore.kernel.org/r/20230206140809.26028-1-farosas@suse.de

Fabiano Rosas (12):
  tests/qtest: Skip PXE tests for missing devices
  tests/qtest: Do not run lsi53c895a test if device is not present
  tests/qtest: Add dependence on PCIE_PORT for virtio-net-failover.c
  tests/qtest: Don't build virtio-serial-test.c if device not present
  tests/qtest: hd-geo-test: Check for missing devices
  test/qtest: Fix coding style in device-plug-test.c
  tests/qtest: Skip unplug tests that use missing devices
  tests/qtest: drive_del-test: Skip tests that require missing devices
  tests/qtest: Check for devices in bios-tables-test
  tests/qtest: Do not include hexloader-test if loader device is not
    present
  tests/qemu-iotests: Require virtio-scsi-pci
  tests/qtest: bios-tables-test: Skip if missing configs

 tests/qemu-iotests/186             |  1 +
 tests/qtest/bios-tables-test.c     | 75 ++++++++++++++++++++++++++++--
 tests/qtest/device-plug-test.c     | 41 ++++++++++++----
 tests/qtest/drive_del-test.c       | 65 ++++++++++++++++++++++++++
 tests/qtest/fuzz-lsi53c895a-test.c |  4 ++
 tests/qtest/hd-geo-test.c          | 38 +++++++++------
 tests/qtest/meson.build            | 17 +++++--
 tests/qtest/pxe-test.c             |  4 ++
 8 files changed, 214 insertions(+), 31 deletions(-)

-- 
2.35.3


