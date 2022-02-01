Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CCC4A5760
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 07:52:29 +0100 (CET)
Received: from localhost ([::1]:35858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEn1g-00062F-EM
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 01:52:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmfi-00038m-VH
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:29:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmfc-0006Wr-Tv
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643696979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oBlNJ4NPkIV9bKqSrwGUz247h+rmQsOHwyWQtbGjKQw=;
 b=IPCRcpUUHS+TJuy7B5UBXcR7KB9I0nB/yVB0mA8phw6F33KMgWTR9q60JpD8CcKcBZ3Op0
 oi0LOzhRdj90xvlNPbgQ8bukQFE3ujmODMdn5cxzpWABraQspfmDpSdOpXPMZ/dKLE9kGq
 Gd2rKdxD5pGwYSxN8tfN+GuX/NeqJqU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-MT2CBas5MGSAwLj79CA_hg-1; Tue, 01 Feb 2022 01:29:36 -0500
X-MC-Unique: MT2CBas5MGSAwLj79CA_hg-1
Received: by mail-oi1-f199.google.com with SMTP id
 w8-20020aca6208000000b002c7da950057so9809032oib.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 22:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oBlNJ4NPkIV9bKqSrwGUz247h+rmQsOHwyWQtbGjKQw=;
 b=0myvxYRvxPh5Fl/35V866cfzhpvWN2WuZUpxXUc4VCAEVqW9mC7ptyBdLixjx6+XuG
 qKaE05hTqwS1NUFL7UKvN5dfTHtVpk5B6E6DfNagEyuSS9GprxxpnsgJrzO8mb+xR6Hi
 1r0d0EzSQwJ7+83f2EGoO4PDB5eQTTtaBpvHh5a7nDJsGDTkq0rZhs9zq5zS8d2wKeBt
 OrvqTVLYykifYZt+mJWTOkmFZLMKjqjFZHM0D3ntgVkY0B/Nz8Z3kuYC/nJCO6qd/ouQ
 O28tGYbvLbpc+ewki9KQ7/Ztknj0iACOfkD4mKDwOU8zmi+vaQ53uzxdFXXzC6pBJolm
 ih1Q==
X-Gm-Message-State: AOAM531tmhLw0S0MNNZPmtiBHxCRih4cDI3RUbGVCP1q+vVKD1ubkcSL
 Ix9Lg4aw617ATKCxUhZYFfrUTlcuTq+FdL+xiO1Zzgg0Qxtmv7qvYg4Q4OJcoNZpbJ2yz/sH7yY
 7HHjz8zH5QcDol3M=
X-Received: by 2002:aca:ad97:: with SMTP id w145mr342205oie.238.1643696975387; 
 Mon, 31 Jan 2022 22:29:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/O4JYGhF1UbYBASWaPoe6mowSjEHU+tXRRm46XGRBJmlSr8p227q6eJqGqUWoc48czITnXw==
X-Received: by 2002:aca:ad97:: with SMTP id w145mr342196oie.238.1643696975166; 
 Mon, 31 Jan 2022 22:29:35 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e])
 by smtp.gmail.com with ESMTPSA id l14sm14424720ooq.12.2022.01.31.22.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 22:29:34 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v8 0/5] MSG_ZEROCOPY + multifd
Date: Tue,  1 Feb 2022 03:28:57 -0300
Message-Id: <20220201062901.428838-1-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series intends to enable MSG_ZEROCOPY in QIOChannel, and make
use of it for multifd migration performance improvement, by reducing cpu
usage.

Patch #1 creates new callbacks for QIOChannel, allowing the implementation
of zero copy writing.

Patch #2 implements io_writev flags and io_flush() on QIOChannelSocket,
making use of MSG_ZEROCOPY on Linux.

Patch #3 adds a "zero_copy_send" migration property, only available with
CONFIG_LINUX, and compiled-out in any other architectures.
This migration property has to be enabled before multifd migration starts.

Patch #4 adds a helper function that allows to see if TLS is going to be used.
This helper will be later used in patch #5.

Patch #5 Makes use of QIOChannelSocket zero_copy implementation on
nocomp multifd migration.

Results:
In preliminary tests, the resource usage of __sys_sendmsg() reduced 15 times,
and the overall migration took 13-22% less time, based in synthetic cpu
workload.

In further tests, it was noted that, on multifd migration with 8 channels:
- On idle hosts, migration time reduced in 10% to 21%.
- On hosts busy with heavy cpu stress (1 stress thread per cpu, but
  not cpu-pinned) migration time reduced in ~25% by enabling zero-copy.
- On hosts with heavy cpu-pinned workloads (1 stress thread per cpu, 
  cpu-pinned), migration time reducted in ~66% by enabling zero-copy.

Above tests setup:
- Sending and Receiving hosts:
  - CPU : Intel(R) Xeon(R) Platinum 8276L CPU @ 2.20GHz (448 CPUS)
  - Network card: E810-C (100Gbps)
  - >1TB RAM
  - QEMU: Upstream master branch + This patchset
  - Linux: Upstream v5.15 
- VM configuration:
  - 28 VCPUs
  - 512GB RAM


---
Changes since v7:
- Migration property renamed from zero-copy to zero-copy-send
- A few early tests added to help misconfigurations to fail earlier
- qio_channel_full*_flags() renamed back to qio_channel_full*()
- multifd_send_sync_main() reverted back to not receiving a flag,
  so it always sync zero-copy when enabled.
- Improve code quality on a few points


Changes since v6:
- Remove io_writev_zero_copy(), and makes use of io_writev() new flags
  to achieve the same results.
- Rename io_flush_zero_copy() to io_flush()
- Previous patch #2 became too small, so it was squashed in previous
  patch #3 (now patch #2)

Changes since v5:
- flush_zero_copy now returns -1 on fail, 0 on success, and 1 when all
  processed writes were not able to use zerocopy in kernel.
- qio_channel_socket_poll() removed, using qio_channel_wait() instead
- ENOBUFS is now processed inside qio_channel_socket_writev_flags()
- Most zerocopy parameter validation moved to migrate_params_check(),
  leaving only feature test to socket_outgoing_migration() callback
- Naming went from *zerocopy to *zero_copy or *zero-copy, due to QAPI/QMP
  preferences
- Improved docs

Changes since v4:
- 3 patches got splitted in 6
- Flush is used for syncing after each iteration, instead of only at the end
- If zerocopy is not available, fail in connect instead of failing on write
- 'multifd-zerocopy' property renamed to 'zerocopy'
- Fail migrations that don't support zerocopy, if it's enabled.
- Instead of checking for zerocopy at each write, save the flags in
  MultiFDSendParams->write_flags and use them on write
- Reorganized flag usage in QIOChannelSocket 
- A lot of typos fixed
- More doc on buffer restrictions

Changes since v3:
- QIOChannel interface names changed from io_async_{writev,flush} to
  io_{writev,flush}_zerocopy
- Instead of falling back in case zerocopy is not implemented, return
  error and abort operation.
- Flush now waits as long as needed, or return error in case anything
  goes wrong, aborting the operation.
- Zerocopy is now conditional in multifd, being set by parameter
  multifd-zerocopy
- Moves zerocopy_flush to multifd_send_sync_main() from multifd_save_cleanup
  so migration can abort if flush goes wrong.
- Several other small improvements

Changes since v2:
- Patch #1: One more fallback
- Patch #2: Fall back to sync if fails to lock buffer memory in MSG_ZEROCOPY send.

Changes since v1:
- Reimplemented the patchset using async_write + async_flush approach.
- Implemented a flush to be able to tell whenever all data was written.


Leonardo Bras (5):
  QIOChannel: Add flags on io_writev and introduce io_flush callback
  QIOChannelSocket: Implement io_writev zero copy flag & io_flush for
    CONFIG_LINUX
  migration: Add zero-copy-send parameter for QMP/HMP for Linux
  migration: Add migrate_use_tls() helper
  multifd: Implement zero copy write in multifd migration
    (multifd-zero-copy)

 qapi/migration.json                 |  24 ++++++
 include/io/channel-socket.h         |   2 +
 include/io/channel.h                |  38 +++++++++-
 migration/migration.h               |   6 ++
 migration/multifd.h                 |   4 +-
 chardev/char-io.c                   |   2 +-
 hw/remote/mpqemu-link.c             |   2 +-
 io/channel-buffer.c                 |   1 +
 io/channel-command.c                |   1 +
 io/channel-file.c                   |   1 +
 io/channel-socket.c                 | 110 +++++++++++++++++++++++++++-
 io/channel-tls.c                    |   1 +
 io/channel-websock.c                |   1 +
 io/channel.c                        |  53 +++++++++++---
 migration/channel.c                 |   3 +-
 migration/migration.c               |  52 ++++++++++++-
 migration/multifd.c                 |  46 +++++++++---
 migration/ram.c                     |  29 ++++++--
 migration/rdma.c                    |   1 +
 migration/socket.c                  |   6 ++
 monitor/hmp-cmds.c                  |   6 ++
 scsi/pr-manager-helper.c            |   2 +-
 tests/unit/test-io-channel-socket.c |   1 +
 23 files changed, 353 insertions(+), 39 deletions(-)

-- 
2.34.1


