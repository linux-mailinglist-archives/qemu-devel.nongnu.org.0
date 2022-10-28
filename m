Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE0610ED3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:42:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMln-0002As-9a; Fri, 28 Oct 2022 06:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMll-0002Aa-DH
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:21 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlj-000200-Go
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:21 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A460F21982;
 Fri, 28 Oct 2022 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666953556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vEyk6H9OzZv1/fP0gtH+6MrenQkGhhleFOSrtjlkvlE=;
 b=WAhYyPU43yLDApES5PUbze6i/5IX4y5M/AMugiQ1sdlY2p4ctj7mTn0gKA5ZOwd6EHQ302
 y5+QBuN+KAihtDowHWGJpHhbdKxdD6iXBTnatkFnoVQuxtaiRKcSOmFMkDXrEmlDvsBEXn
 ll/tU62VTwt36MDQ80KGqSWXbzFtAHQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B3A013A6E;
 Fri, 28 Oct 2022 10:39:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EqHaC1SxW2PVPwAAMHmgww
 (envelope-from <nborisov@suse.com>); Fri, 28 Oct 2022 10:39:16 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v3 00/14] File-based migration support and fixed-ram features
Date: Fri, 28 Oct 2022 13:39:00 +0300
Message-Id: <20221028103914.908728-1-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=nborisov@suse.com;
 helo=smtp-out1.suse.de
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Here's the 3rd version of file-based migration support [0]. For background
check the cover letter of the initial. The main changes are :

- Updated commit message as per Daniel Berrange's suggestino for Patches 1-2

- Fixed tab in various pages

- Added comments better explaining how json_writer_start_object in
qemu_savevm_state_header is matched and also squashed the analyze-migration.py
parts into patch 3

- Reworked the way pwritv/preadv are introduced. Now there are generic
callbacks in QIOChannel that are implemented for the QIOChannelFile.

- Separated the introduction of QEMUFile-related helpers from the patch
introducing the io interfaces.

- Added qtests for the file-based migration as well as for the fixed-ram
feature.

[0] https://lore.kernel.org/qemu-devel/20221004123733.2745519-1-nborisov@suse.com/

Nikolay Borisov (14):
  migration: support file: uri for source migration
  migration: Add support for 'file:' uri for incoming migration
  migration: Initial support of fixed-ram feature for
    analyze-migration.py
  io: Add generic pwritev/preadv interface
  io: implement io_pwritev for QIOChannelFile
  io: add and implement QIO_CHANNEL_FEATURE_SEEKABLE for channel file
  migration/qemu-file: add utility methods for working with seekable
    channels
  io: Add preadv support to QIOChannelFile
  migration: add qemu_get_buffer_at
  migration/ram: Introduce 'fixed-ram' migration stream capability
  migration: Refactor precopy ram loading code
  migration: Add support for 'fixed-ram' migration restore
  tests: Add migrate_incoming_qmp helper
  tests/qtest: migration-test: Add tests for file-based migration

 include/exec/ramblock.h             |   7 +
 include/io/channel.h                |  50 +++++
 include/migration/qemu-file-types.h |   2 +
 io/channel-file.c                   |  61 ++++++
 io/channel.c                        |  26 +++
 migration/file.c                    |  38 ++++
 migration/file.h                    |  10 +
 migration/meson.build               |   1 +
 migration/migration.c               |  61 +++++-
 migration/migration.h               |   6 +
 migration/qemu-file.c               |  82 +++++++
 migration/qemu-file.h               |   4 +
 migration/ram.c                     | 328 +++++++++++++++++++++-------
 migration/savevm.c                  |  48 ++--
 qapi/migration.json                 |   2 +-
 scripts/analyze-migration.py        |  49 ++++-
 tests/qtest/migration-helpers.c     |  19 ++
 tests/qtest/migration-helpers.h     |   4 +
 tests/qtest/migration-test.c        |  46 ++++
 19 files changed, 743 insertions(+), 101 deletions(-)
 create mode 100644 migration/file.c
 create mode 100644 migration/file.h

--
2.34.1


