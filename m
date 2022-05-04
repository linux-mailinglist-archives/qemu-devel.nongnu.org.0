Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF3051ADB3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:23:43 +0200 (CEST)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmKb8-0000XA-Jt
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXY-0005nR-9W
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:20:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXV-0004uB-0R
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651691995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lCysDFEgEvQakwKklNLv54XrINcnqA1SQYDFYJ9nDHA=;
 b=RgPfjfY0N4/lpdPMjSdv1qKZtWY0NJLF/9WHTuab/w9AV7CQi12UIbI3WDlBP1w4fxNyyP
 UzXbabcclUzRjLUfuLR44jsYiUcelrNfU+etJfUgpnGNn6MVQdc5ahs6tTRA9XH2+ug8TG
 0Y7UPjB2enEMnFvxtKgVoapXTL9Tr+E=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-GX1enzIaNLiSo9_YQLp9bA-1; Wed, 04 May 2022 15:19:54 -0400
X-MC-Unique: GX1enzIaNLiSo9_YQLp9bA-1
Received: by mail-ua1-f69.google.com with SMTP id
 r4-20020ab06604000000b00360317232f6so934510uam.6
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 12:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCysDFEgEvQakwKklNLv54XrINcnqA1SQYDFYJ9nDHA=;
 b=eEgMwVO8D63u+0WF6B3lIboIKJbJ0DBFn6LfufLetn98LLiPflEoYNmr39PrKzoynF
 euNQxdzbg4btqlme80xjNyA/VviQHW+ZjbK+iSVI3fPraBTJQrD7oc81cmWtzidhFTQS
 lnpl6Qcbk6jiCruLPIHL1sIzVVB2iWCgEX+vmQZXEzABhzicQI76Qmg8t8LhMSCtSvht
 K8LlnGorg5oojGrF3xnKQdIlMehkF8LMDifM/pmPajNxi94bd/jk7otKiDPz7/ssSHpZ
 wFKqBjvTJcIdAZCWFS4EBcqHJhdH7zbcxjeWp0zBaY3/32/eMm5bZ3fLvvhewL88uZQ1
 4oEQ==
X-Gm-Message-State: AOAM532rKSb5goZUTezPNt85GGRlsOjwcTbMw/MApVF7Qm4kjurATLAt
 7xqmRrofZU/HE68PJEmO6ke52G0Ss3tpIfnApPPbU3tx0IPv1uzCKDpQepl7i8qih9G6Be/hlZ8
 pi7AfgCiYYa2ynXk=
X-Received: by 2002:ab0:66c1:0:b0:35f:c5a8:8a2e with SMTP id
 d1-20020ab066c1000000b0035fc5a88a2emr6546102uaq.98.1651691993708; 
 Wed, 04 May 2022 12:19:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysiD66dDBSFySAjbFkhqwWbRBkcfUzsQ5+Wb2hSHy7XbjVrZdzGt1Ihix1xgcDGeznhd3IBw==
X-Received: by 2002:ab0:66c1:0:b0:35f:c5a8:8a2e with SMTP id
 d1-20020ab066c1000000b0035fc5a88a2emr6546090uaq.98.1651691993441; 
 Wed, 04 May 2022 12:19:53 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:1312:73ed:3343:f316:7ef5])
 by smtp.gmail.com with ESMTPSA id
 o80-20020a1fa553000000b0034e6f1fd04esm1647302vke.24.2022.05.04.12.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 12:19:52 -0700 (PDT)
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v11 0/7] MSG_ZEROCOPY + multifd
Date: Wed,  4 May 2022 16:18:29 -0300
Message-Id: <20220504191835.791580-1-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Patch #5 changes multifd_send_sync_main() so it returns int instead of void.
The return value is used to understand if any error happened in the function,
allowing migration to possible fail earlier.

Patch #6 implements an workaround: The behavior introduced in d48c3a0445 is
hard to deal with in zerocopy, so a workaround is introduced to send the
header in a different syscall, without MSG_ZEROCOPY.

Patch #7 Makes use of QIOChannelSocket zero_copy implementation on
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
Changes since v10:
- Patch #2 was breaking build on systems with glibc < glibc-2.27,
  and probably non-linux builds.
- Also on Patch #2, replaced bits/socket.h with sys/socket.h,
  (thanks Peter Xu)

Changes since v9:
- Patch #6 got simplified and improved (thanks Daniel)
- Patch #7 got better comments (thanks Peter Xu)

Changes since v8:
- Inserted two new patches #5 & #6, previous patch #5 is now #7.
- Workaround an optimization introduced in d48c3a0445
- Removed unnecessary assert in qio_channel_writev_full_all

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

Leonardo Bras (7):
  QIOChannel: Add flags on io_writev and introduce io_flush callback
  QIOChannelSocket: Implement io_writev zero copy flag & io_flush for
    CONFIG_LINUX
  migration: Add zero-copy-send parameter for QMP/HMP for Linux
  migration: Add migrate_use_tls() helper
  multifd: multifd_send_sync_main now returns negative on error
  multifd: Send header packet without flags if zero-copy-send is enabled
  multifd: Implement zero copy write in multifd migration
    (multifd-zero-copy)

 qapi/migration.json                 |  24 ++++++
 include/io/channel-socket.h         |   2 +
 include/io/channel.h                |  38 ++++++++-
 migration/migration.h               |   6 ++
 migration/multifd.h                 |   4 +-
 chardev/char-io.c                   |   2 +-
 hw/remote/mpqemu-link.c             |   2 +-
 io/channel-buffer.c                 |   1 +
 io/channel-command.c                |   1 +
 io/channel-file.c                   |   1 +
 io/channel-socket.c                 | 122 +++++++++++++++++++++++++++-
 io/channel-tls.c                    |   1 +
 io/channel-websock.c                |   1 +
 io/channel.c                        |  49 ++++++++---
 migration/channel.c                 |   3 +-
 migration/migration.c               |  52 +++++++++++-
 migration/multifd.c                 |  74 ++++++++++++++---
 migration/ram.c                     |  29 +++++--
 migration/rdma.c                    |   1 +
 migration/socket.c                  |  12 ++-
 monitor/hmp-cmds.c                  |   6 ++
 scsi/pr-manager-helper.c            |   2 +-
 tests/unit/test-io-channel-socket.c |   1 +
 23 files changed, 390 insertions(+), 44 deletions(-)

-- 
2.36.0


