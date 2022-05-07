Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555EE51E35E
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:00:43 +0200 (CEST)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn9kN-0007oy-7H
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9iH-00056m-Q5
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9iD-0006gf-W1
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651888704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ONCm746Gt3xjUVMZ/433Dq9y9lDxuwBwaeDgOSa1pU=;
 b=OPkbnvD78PwELoM/wg1MVfFTNd2817HfwOsxPGygJMWuReXl88hDPxOhv9o9pYzgkx43AT
 qeNBQkCsXHBdLHydpsTQQMVKAtoeTascAk3beCzI5tteXrSExUzP9sBR/lM45LD/RacuzE
 elEU9rUlAxdZ7N1/nbxXkc5u+PYYdTc=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-7EUNyFqJNviGnJqfPdELXQ-1; Fri, 06 May 2022 21:58:22 -0400
X-MC-Unique: 7EUNyFqJNviGnJqfPdELXQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 m9-20020a9d4c89000000b0060602648685so3598329otf.19
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 18:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ONCm746Gt3xjUVMZ/433Dq9y9lDxuwBwaeDgOSa1pU=;
 b=cBedQBy8dcdenIDulhtZBzZ4iKSmZoPhJlZrvU0/Z2x5uAh0os39Pa4gdpnJ/yszx1
 yTsQSu8p5nQ/17yy8R/oCK4aB041/HyamPdAai0Owslu4junTzPH0HGfzUnIFI29vBHD
 fqQTt3uOWBPxZ+3/V6svVcp6VYXWjUQqJod52gM1Klj7R7WSW9m24p6cEG2tkOQxBlBv
 rcm/9FgDjDLVPO1gIUb6OMDBDvkM+MA6Y2tiW8S9ptqOHxNIpqBUem/WAdSCDDU1Wrud
 AtW0w2NMd0bZ3fAqyy3ZrZ//2xv1LQx/anb8+7GcFP+lBu4IAxYT3TQVmrG1fR1UVP0E
 KhvA==
X-Gm-Message-State: AOAM5319Ymyuhq4b/Wm+Q6Pi7I8L7240K14LcxxAy7xtjNUhv0OX8gSL
 mizxQYSeJSIyR+GnNkicS1+GD45VFJXbFUu62kJyhXWbYyqA8J/g7t/uHsnIvE+7WOhYU7T6K0E
 bMIjpj50WCZ3hBOU=
X-Received: by 2002:a05:6870:41ca:b0:e9:c84:987a with SMTP id
 z10-20020a05687041ca00b000e90c84987amr2417376oac.149.1651888701901; 
 Fri, 06 May 2022 18:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTqa6BXyClaCqKx3UGaIZEC9DgtgGCh58ScOlKRSpXedXHyfuw6pmpU7Z1LkkMEk1/6yMt3A==
X-Received: by 2002:a05:6870:41ca:b0:e9:c84:987a with SMTP id
 z10-20020a05687041ca00b000e90c84987amr2417362oac.149.1651888701625; 
 Fri, 06 May 2022 18:58:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a056830141200b0060603221281sm2218124otp.81.2022.05.06.18.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:58:20 -0700 (PDT)
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
Subject: [PATCH v12 0/7] MSG_ZEROCOPY + multifd
Date: Fri,  6 May 2022 22:57:52 -0300
Message-Id: <20220507015759.840466-1-leobras@redhat.com>
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
 io/channel-socket.c                 | 119 +++++++++++++++++++++++++++-
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
 roms/skiboot                        |   2 +-
 24 files changed, 388 insertions(+), 45 deletions(-)

-- 
2.36.0

From ba4f153da0dd727a301b24764f033eee5dbf5978 Mon Sep 17 00:00:00 2001
From: Leonardo Bras <leobras@redhat.com>
Date: Wed, 4 May 2022 14:44:22 -0300
Subject: [PATCH v11 0/7] MSG_ZEROCOPY + multifd
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: "Marc-André Lureau" <marcandre.lureau@redhat.com>,Paolo Bonzini <pbonzini@redhat.com>,Elena Ufimtseva <elena.ufimtseva@oracle.com>,Jagannathan Raman <jag.raman@oracle.com>,John G Johnson <john.g.johnson@oracle.com>,"Daniel P. Berrangé" <berrange@redhat.com>,Juan Quintela <quintela@redhat.com>,"Dr. David Alan Gilbert" <dgilbert@redhat.com>,Eric Blake <eblake@redhat.com>,Markus Armbruster <armbru@redhat.com>,Fam Zheng <fam@euphon.net>,Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 

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


