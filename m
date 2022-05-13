Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDF525B97
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 08:36:26 +0200 (CEST)
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npOuX-0001W4-Qx
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 02:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOnZ-00075r-Ls
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOnX-0000XD-Cx
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652423349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oJrKxjjuxgXyYjuq1FPQkCRVThRXhb9hFn+/UsCf4xY=;
 b=BGEWN4rUA2Igkn8WlFJ7hTths8XKF1OF4MmCRDqf3nFpq86k7KuVPXMUA8ACmcxwA0LqTI
 OLOuSu7hqvAa96NtKu7QzGHGffgwJJHkHN4q7afkYLxy6NOyiHr4DrZCLY+z+lTqWIfL4L
 V4y/Cq1knVOJ8fLnyGiTno50B+yWYAc=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-J94V4KGLNDmD4sDLkI2v6g-1; Fri, 13 May 2022 02:29:08 -0400
X-MC-Unique: J94V4KGLNDmD4sDLkI2v6g-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-ed9f072c3bso4458220fac.1
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 23:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJrKxjjuxgXyYjuq1FPQkCRVThRXhb9hFn+/UsCf4xY=;
 b=fDSE3kU+vbHmf6xvwSpl8jdSre65UNh9bXqb+Z0J5o+AWDRR3evB5lhl3ZgHWJt4BL
 RubpHYzI+TN2ifxeCOL47IPrhZkPlBpU/8Wt64r5mdZFFWigMpoTucxZnRJ1N35yulQq
 4gV2VxVsgCq7uxLy4z3majnYc5PDovx7bdSdwt9OOZU5+6CcvJD+AtdBsY8GiBruO+5o
 o7d3O5c3NNeLvviUYlb0FSWe7EKLPgKNg1rEpH/89CzW5pjvP1tdnOaW9uw/D3vIqgHB
 42Zui4TEBoitpqRRyAIX4CamL2oG0lAIYfAbiCyMsV9j1UajU36oSX13XkVzh6cV2WuX
 yIrw==
X-Gm-Message-State: AOAM532y2VkyrpnNDtGPjzvXnIkMq8fGbmxVxsA873XqJnH+dCun9iyK
 bGggrSz5ImqPLrdx7oTQcuFoNiQ5ir23JgxvU1z7L1+3lfsiKkbNkff2PH+LjOyJ0LPu8xhRAuL
 T0KWTs8NvS2H9kBE=
X-Received: by 2002:a05:6870:3292:b0:f1:2333:83c6 with SMTP id
 q18-20020a056870329200b000f1233383c6mr1771856oac.129.1652423347518; 
 Thu, 12 May 2022 23:29:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF4S2U0pUxgw/x6JDDcbhqVUZbvwJ+Hm3x6IIHN9vu8FySlrvHORxCMil0KfhCjunw/dBsPg==
X-Received: by 2002:a05:6870:3292:b0:f1:2333:83c6 with SMTP id
 q18-20020a056870329200b000f1233383c6mr1771839oac.129.1652423347262; 
 Thu, 12 May 2022 23:29:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a05680804ce00b00325cda1ffbasm678341oie.57.2022.05.12.23.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 23:29:06 -0700 (PDT)
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
Subject: [PATCH v13 0/8] MSG_ZEROCOPY + multifd
Date: Fri, 13 May 2022 03:28:29 -0300
Message-Id: <20220513062836.965425-1-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

Patch #1 conditionally disables liburing in systems where linux/errqueue.h
conflict with liburing/compat.h (__kernel_timespec redefine)

Patch #2 creates new callbacks for QIOChannel, allowing the implementation
of zero copy writing.

Patch #3 implements io_writev flags and io_flush() on QIOChannelSocket,
making use of MSG_ZEROCOPY on Linux.

Patch #4 adds a "zero_copy_send" migration property, only available with
CONFIG_LINUX, and compiled-out in any other architectures.
This migration property has to be enabled before multifd migration starts.

Patch #5 adds a helper function that allows to see if TLS is going to be used.
This helper will be later used in patch #5.

Patch #6 changes multifd_send_sync_main() so it returns int instead of void.
The return value is used to understand if any error happened in the function,
allowing migration to possible fail earlier.

Patch #7 implements an workaround: The behavior introduced in d48c3a0445 is
hard to deal with in zerocopy, so a workaround is introduced to send the
header in a different syscall, without MSG_ZEROCOPY.

Patch #8 Makes use of QIOChannelSocket zero_copy implementation on
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
Changes since v12:
- New patch #1 added to solve an issue with Gitlab CI on alpine
- Removed unnecessary newline in patch #3 (previously #2)
- Removed incorrect commit change in roms/skiboot on patch #4
  (previously #3)

Changes since v11:
- Patch #3 now wrap lines around column 75
- Patch #2 now introduce some #ifdefs instead of defining a
  default value for MSG_ZEROCOPY and SO_ZEROCOPY

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


Leonardo Bras (8):
  meson.build: Fix docker-test-build@alpine when including
    linux/errqueue.h
  QIOChannel: Add flags on io_writev and introduce io_flush callback
  QIOChannelSocket: Implement io_writev zero copy flag & io_flush for
    CONFIG_LINUX
  migration: Add zero-copy-send parameter for QMP/HMP for Linux
  migration: Add migrate_use_tls() helper
  multifd: multifd_send_sync_main now returns negative on error
  multifd: Send header packet without flags if zero-copy-send is enabled
  multifd: Implement zero copy write in multifd migration
    (multifd-zero-copy)

 meson.build                         |  11 +++
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
 io/channel-socket.c                 | 118 +++++++++++++++++++++++++++-
 io/channel-tls.c                    |   1 +
 io/channel-websock.c                |   1 +
 io/channel.c                        |  49 +++++++++---
 migration/channel.c                 |   3 +-
 migration/migration.c               |  52 +++++++++++-
 migration/multifd.c                 |  74 ++++++++++++++---
 migration/ram.c                     |  29 +++++--
 migration/rdma.c                    |   1 +
 migration/socket.c                  |  12 ++-
 monitor/hmp-cmds.c                  |   6 ++
 scsi/pr-manager-helper.c            |   2 +-
 tests/unit/test-io-channel-socket.c |   1 +
 24 files changed, 397 insertions(+), 44 deletions(-)

-- 
2.36.1


