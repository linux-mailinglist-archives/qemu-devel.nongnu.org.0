Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7DF5F4379
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 14:49:31 +0200 (CEST)
Received: from localhost ([::1]:56336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhMY-0003TZ-PW
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 08:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ofhBB-0006lp-S5
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:37:49 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:49884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ofhB8-0005rA-K2
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:37:45 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F0471F894;
 Tue,  4 Oct 2022 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1664887058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XHnUtYHqCg0h7EsARYxsBMmSnc3fZP+U4Ej6eypF0UE=;
 b=EC3A/1XlvKpCNMcdNNkqON1p2NcHyidcrkUTDoWCFOuTXTd8ZWo3WTxcghWZgyqXEDOY7q
 nvDZ9cN9QTBu7kO7iDLmu3Y5RLAi8SmKe/BSlGf2AiaBWz6m05lhrfL6u5Dxl54CCTHaom
 fTauoED9AdBqW8+wlUFg2qHdGpci/XI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6168139EF;
 Tue,  4 Oct 2022 12:37:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MAzPJREpPGNlRQAAMHmgww
 (envelope-from <nborisov@suse.com>); Tue, 04 Oct 2022 12:37:37 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [RFC PATCH 00/11] Add support for fixed ram offsets during migration
Date: Tue,  4 Oct 2022 15:37:22 +0300
Message-Id: <20221004123733.2745519-1-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=nborisov@suse.com; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series implements what I call "fixed-ram" capability (I'm happy to change
the name if people deem it necessary). The idea is that while performing ram
migration each dirty page will have a specific offset in the resulting file.
The main benefit this has is that now when migrating to a file it will have an
upper limit to its size since a page that has been dirtied multiple times won't be
saved multiple times in the stream. More details about the actual stream changes
necessary to accommodate this can be found in patch 8.

Furthermore I intend on using this code as a foundation for implementing DIO-based
save directly from qemu. The current iteration also introduces the "file:" URI to
perform the save/restore to a file, however in the past there was a discussion that
instead of a file an externally passed FD can be used.

What's missing/pending improvements:

 - No tests, I've yet to spend some time with qtest to introduce some tests,
 will work on this based on the interest the series garners

 - I feel the restore is somewhat suboptimal, namely that each and every page is
 read individually, probably there are some effects of read-ahead caching from
 linux that we are gaining but I feel it'd be more efficient if it'll be possible
 to read multiple pages provided they are sequential ( I have to check what support
 is in there in the bitmap ops to scan for contiguous ranges of sets bits)

 - Finish support in analyze-migration.py

 - Possibly implement the "external fd" support for "fixed-ram" capability.

All feedback is welcome.

Nikolay Borisov (11):
  migration: support file: uri for source migration
  migration: Add support for 'file:' uri for incoming migration
  migration: Make migration json writer part of MigrationState struct
  io: add pwritev support to QIOChannelFile
  io: Add support for seekable channels
  io: Add preadv support to QIOChannelFile
  migration: add qemu_get_buffer_at
  migration/ram: Introduce 'fixed-ram' migration stream capability
  migration: Refactor precopy ram loading code
  migration: Add support for 'fixed-ram' migration restore
  analyze-migration.py: add initial support for fixed ram streams

 include/exec/ramblock.h             |   7 +
 include/io/channel-file.h           |  10 +
 include/io/channel.h                |   1 +
 include/migration/qemu-file-types.h |   2 +
 io/channel-file.c                   |  55 +++++
 migration/file.c                    |  38 ++++
 migration/file.h                    |  10 +
 migration/meson.build               |   1 +
 migration/migration.c               |  61 +++++-
 migration/migration.h               |   6 +
 migration/qemu-file.c               |  82 +++++++
 migration/qemu-file.h               |   4 +
 migration/ram.c                     | 322 +++++++++++++++++++++-------
 migration/savevm.c                  |  39 ++--
 qapi/migration.json                 |   2 +-
 scripts/analyze-migration.py        |  49 ++++-
 16 files changed, 587 insertions(+), 102 deletions(-)
 create mode 100644 migration/file.c
 create mode 100644 migration/file.h

--
2.34.1


