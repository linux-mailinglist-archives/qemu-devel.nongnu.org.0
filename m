Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634915F9F9C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:45:44 +0200 (CEST)
Received: from localhost ([::1]:60822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oht6F-0000gC-DZ
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvG-000109-Lf
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:23 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvB-0005Jn-0W
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:20 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E61321979;
 Mon, 10 Oct 2022 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665408853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XDWAO/OswlJ43vdlqYg2Z6eKKjoB+LdH0MB7soSLN98=;
 b=IMBq5BHkFyTXGQhmXd8TNiAdXsvnc+9YcgRmL3F7gWuwZ5Yu6o7hjtIybP3YKrUy1xH7GM
 H18o7z8MQZbuG1Fw8YwSP6VndT94bzNwxtAmmMsxJcCeVSiUzgE2E7FB3gl8heuZIfWaSr
 swGg2DPdsnkEZBgEzIXEqSII21niUe4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E61B113479;
 Mon, 10 Oct 2022 13:34:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2klTNVQfRGNsAwAAMHmgww
 (envelope-from <nborisov@suse.com>); Mon, 10 Oct 2022 13:34:12 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 00/11] Add support for fixed ram offsets during migration
Date: Mon, 10 Oct 2022 16:33:57 +0300
Message-Id: <20221010133408.3214433-1-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's a slightly updated version of the patchset. In its core it remains
however I have addressed a couple of issue, namely :

* Don't initialize the shadow bitmap as all set - this was causing the full ram
to be copied always.

* Fixed a memory leak in parse_ramblocks_fixed_ram by making the dirty bitmap
variable an g_autofree one

* Slightly reworked how ram is being copied during restore and now the code is
working in chunks of 4mb (might have to tweak this?)

For a more general overview of what this series is all about refer to the
initial posting [0].

[0] https://lore.kernel.org/qemu-devel/20221004123733.2745519-1-nborisov@suse.com/

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
 migration/ram.c                     | 328 +++++++++++++++++++++-------
 migration/savevm.c                  |  39 ++--
 qapi/migration.json                 |   2 +-
 scripts/analyze-migration.py        |  49 ++++-
 16 files changed, 594 insertions(+), 101 deletions(-)
 create mode 100644 migration/file.c
 create mode 100644 migration/file.h

--
2.34.1


