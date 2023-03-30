Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC566D0D6D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:08:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwd5-0003Cn-FH; Thu, 30 Mar 2023 14:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcl-000386-Hb
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:50 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcj-0001zN-F0
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:47 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 118BA219E8;
 Thu, 30 Mar 2023 18:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AFAQN/vE6QaTnkS2/NV1Iasv89EmbvTrAb4VMkULGKw=;
 b=tSInl+1jzgRCi9pXb7V7SBbUtfLGLoco+dIQg3DWMlqdGbA5oc5OnjcQMkutAEdDTKUE+X
 E6esCikKmW0F734T+0kPNMfa3pN7JwGx2endBqO3BFC5K1f3LkAQidLczACAiB+jAiWLtq
 CsNYJYsBL+cq8g2YILif1pnLu+1IbQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AFAQN/vE6QaTnkS2/NV1Iasv89EmbvTrAb4VMkULGKw=;
 b=Ohsy9uGXski/+uAlLkO486gBctYd2C9DADl/peSWk6X5SOLZQ5w1+MCOBNyc7ZbLsKaFlF
 MWc9Os+uKZ90f9Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00DE81348E;
 Thu, 30 Mar 2023 18:03:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wPZTLvrOJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:03:38 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 00/26] migration: File based migration with multifd and
 fixed-ram
Date: Thu, 30 Mar 2023 15:03:10 -0300
Message-Id: <20230330180336.2791-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi folks,

I'm continuing the work done last year to add a new format of
migration stream that can be used to migrate large guests to a single
file in a performant way.

This is an early RFC with the previous code + my additions to support
multifd and direct IO. Let me know what you think!

Here are the reference links for previous discussions:

https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01813.html
https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg01338.html
https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg05536.html

The series has 4 main parts:

1) File migration: A new "file:" migration URI. So "file:mig" does the
   same as "exec:cat > mig". Patches 1-4 implement this;

2) Fixed-ram format: A new format for the migration stream. Puts guest
   pages at their relative offsets in the migration file. This saves
   space on the worst case of RAM utilization because every page has a
   fixed offset in the migration file and (potentially) saves us time
   because we could write pages independently in parallel. It also
   gives alignment guarantees so we could use O_DIRECT. Patches 5-13
   implement this;

With patches 1-13 these two^ can be used with:

(qemu) migrate_set_capability fixed-ram on
(qemu) migrate[_incoming] file:mig

--> new in this series:

3) MultiFD support: This is about making use of the parallelism
   allowed by the new format. We just need the threading and page
   queuing infrastructure that is already in place for
   multifd. Patches 14-24 implement this;

(qemu) migrate_set_capability fixed-ram on
(qemu) migrate_set_capability multifd on
(qemu) migrate_set_parameter multifd-channels 4
(qemu) migrate_set_parameter max-bandwith 0
(qemu) migrate[_incoming] file:mig

4) Add a new "direct_io" parameter and enable O_DIRECT for the
   properly aligned segments of the migration (mostly ram). Patch 25.

(qemu) migrate_set_parameter direct-io on

Thanks! Some data below:
=====

Outgoing migration to file. NVMe disk. XFS filesystem.

- Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
  running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
  10m -v`:

migration type  | MB/s | pages/s |  ms
----------------+------+---------+------
savevm io_uring |  434 |  102294 | 71473
file:           | 3017 |  855862 | 10301
fixed-ram       | 1982 |  330686 | 15637
----------------+------+---------+------
fixed-ram + multifd + O_DIRECT
         2 ch.  | 5565 | 1500882 |  5576
         4 ch.  | 5735 | 1991549 |  5412
         8 ch.  | 5650 | 1769650 |  5489
        16 ch.  | 6071 | 1832407 |  5114
        32 ch.  | 6147 | 1809588 |  5050
        64 ch.  | 6344 | 1841728 |  4895
       128 ch.  | 6120 | 1915669 |  5085
----------------+------+---------+------

- Average of 10 migration runs of guestperf.py --mem 32 --cpus 4:

migration type | #ch. | MB/s | ms
---------------+------+------+-----
fixed-ram +    |    2 | 4132 | 8388
multifd        |    4 | 4273 | 8082
               |    8 | 4094 | 8441
               |   16 | 4204 | 8217
               |   32 | 4048 | 8528
               |   64 | 3861 | 8946
               |  128 | 3777 | 9147
---------------+------+------+-----
fixed-ram +    |    2 | 6031 | 5754
multifd +      |    4 | 6377 | 5421
O_DIRECT       |    8 | 6386 | 5416
               |   16 | 6321 | 5466
               |   32 | 5911 | 5321
               |   64 | 6375 | 5433
               |  128 | 6400 | 5412
---------------+------+------+-----

Fabiano Rosas (13):
  migration: Add completion tracepoint
  migration/multifd: Remove direct "socket" references
  migration/multifd: Allow multifd without packets
  migration/multifd: Add outgoing QIOChannelFile support
  migration/multifd: Add incoming QIOChannelFile support
  migration/multifd: Add pages to the receiving side
  io: Add a pwritev/preadv version that takes a discontiguous iovec
  migration/ram: Add a wrapper for fixed-ram shadow bitmap
  migration/multifd: Support outgoing fixed-ram stream format
  migration/multifd: Support incoming fixed-ram stream format
  tests/qtest: Add a multifd + fixed-ram migration test
  migration: Add direct-io parameter
  tests/migration/guestperf: Add file, fixed-ram and direct-io support

Nikolay Borisov (13):
  migration: Add support for 'file:' uri for source migration
  migration: Add support for 'file:' uri for incoming migration
  tests/qtest: migration: Add migrate_incoming_qmp helper
  tests/qtest: migration-test: Add tests for file-based migration
  migration: Initial support of fixed-ram feature for
    analyze-migration.py
  io: add and implement QIO_CHANNEL_FEATURE_SEEKABLE for channel file
  io: Add generic pwritev/preadv interface
  io: implement io_pwritev/preadv for QIOChannelFile
  migration/qemu-file: add utility methods for working with seekable
    channels
  migration/ram: Introduce 'fixed-ram' migration stream capability
  migration: Refactor precopy ram loading code
  migration: Add support for 'fixed-ram' migration restore
  tests/qtest: migration-test: Add tests for fixed-ram file-based
    migration

 docs/devel/migration.rst              |  38 +++
 include/exec/ramblock.h               |   8 +
 include/io/channel-file.h             |   1 +
 include/io/channel.h                  | 133 ++++++++++
 include/migration/qemu-file-types.h   |   2 +
 include/qemu/osdep.h                  |   2 +
 io/channel-file.c                     |  60 +++++
 io/channel.c                          | 140 +++++++++++
 migration/file.c                      | 130 ++++++++++
 migration/file.h                      |  14 ++
 migration/meson.build                 |   1 +
 migration/migration-hmp-cmds.c        |   9 +
 migration/migration.c                 | 108 +++++++-
 migration/migration.h                 |  11 +-
 migration/multifd.c                   | 327 ++++++++++++++++++++----
 migration/multifd.h                   |  13 +
 migration/qemu-file.c                 |  80 ++++++
 migration/qemu-file.h                 |   4 +
 migration/ram.c                       | 349 ++++++++++++++++++++------
 migration/ram.h                       |   1 +
 migration/savevm.c                    |  23 +-
 migration/trace-events                |   1 +
 qapi/migration.json                   |  19 +-
 scripts/analyze-migration.py          |  51 +++-
 tests/migration/guestperf/engine.py   |  38 ++-
 tests/migration/guestperf/scenario.py |  14 +-
 tests/migration/guestperf/shell.py    |  18 +-
 tests/qtest/migration-helpers.c       |  19 ++
 tests/qtest/migration-helpers.h       |   4 +
 tests/qtest/migration-test.c          |  73 ++++++
 util/osdep.c                          |   9 +
 31 files changed, 1546 insertions(+), 154 deletions(-)
 create mode 100644 migration/file.c
 create mode 100644 migration/file.h

-- 
2.35.3


