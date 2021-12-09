Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C171146E5B7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:41:36 +0100 (CET)
Received: from localhost ([::1]:51762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFvj-0002YU-JJ
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:41:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuI-0000Qo-3T
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuE-0008Ew-SK
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639042801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PVS8SqTxhf3bS3g7cpZDRlgy3L6FG0AJYKE4wRaolKo=;
 b=KHusWvwDTmiNUGL362wkyLFRjWbyam7CofHKQ9sWIrmr6zrmh5IkhZShFA4FPTcHm51NE4
 fQiTUhe7pCaa3tRDrH5LbblqneFz3FsqspJ1ExMe5P3GxKeCDgM3RXw44wjIRUb1lqjU2F
 jOC2jajtR4ddfQUIoATiLH7demIpEgA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-3pSi-NzWN3-unNMWtTzGxg-1; Thu, 09 Dec 2021 04:39:58 -0500
X-MC-Unique: 3pSi-NzWN3-unNMWtTzGxg-1
Received: by mail-vk1-f197.google.com with SMTP id
 x5-20020a056122118500b002efcd7b7990so2939231vkn.15
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PVS8SqTxhf3bS3g7cpZDRlgy3L6FG0AJYKE4wRaolKo=;
 b=jhI6vDSHYfX0EgRY4X+06M7jYW82z/o4zadweSgFsUA4VePw49hxY0kkLRwATVwjOn
 mkCzCLQkExP8INadVAxv9F33vXzwVjIabQ+/VSMeDVyRZzy/+vvfgEQNnlpsskbGmF7e
 fXqY2Lci9+RsdV0YQWgi4L6zIG0tjFinvVb7bVy8H2MZe0ABfFJwBsapq6QNeO2kp6Q8
 N/Q/lo3FztgdqH0lF0Bw7VrK5RZFbQJK/V5iNAq7Ru7TxcuqRYStalj/9CJioFZQSETt
 cufazdcL9ntjfDudavHgmmst7vZPYDsjqDw1RId1Tu7AfayRkvCUGydrrwHIeXlItSGY
 s7nQ==
X-Gm-Message-State: AOAM530l9lWBKRGSEYzvvL82PQHkw375IuKni4kdU85Mn1qNyJO/ChQQ
 zx0LXGiwM4hFYGRNbFXDC9XVqKqHrxl7aHy1+KRgrgDJL99PPSk3PGYpqmE9Vczbn5yB7bTOxa0
 uCoYIvXbRWGyUkmY=
X-Received: by 2002:a67:c993:: with SMTP id y19mr6045519vsk.36.1639042797665; 
 Thu, 09 Dec 2021 01:39:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8I7JlEuRl1qF+5/C+SNKp+9d9jd8Fsh3/9FH/oVsFEH4pjzbfKXvPmsWXqHodo+IrxMcIHw==
X-Received: by 2002:a67:c993:: with SMTP id y19mr6045486vsk.36.1639042797384; 
 Thu, 09 Dec 2021 01:39:57 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:dadb:5bd9:f52:7a4a:a8af])
 by smtp.gmail.com with ESMTPSA id s22sm3460215vkm.28.2021.12.09.01.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:39:56 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 0/6] MSG_ZEROCOPY + multifd
Date: Thu,  9 Dec 2021 06:39:18 -0300
Message-Id: <20211209093923.1293701-1-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series intends to enable MSG_ZEROCOPY in QIOChannel, and make
use of it for multifd migration performance improvement, by reducing cpu
usage.

Patch #1 creates new callbacks for QIOChannel, allowing the implementation
of zero copy writing.

Patch #2 reworks qio_channel_socket_writev() so it accepts flags for
that are later passed to sendmsg().

Patch #3 implements writev_zero_copy and flush_zero_copy on QIOChannelSocket,
making use of MSG_ZEROCOPY on Linux.

Patch #4 adds a "zero_copy" migration property, only available with
CONFIG_LINUX, and compiled-out in any other architectures.
This migration property has to be enabled before multifd migration starts.

Patch #5 adds a helper function that allows to see if TLS is going to be used.
This helper will be later used in patch #6.

Patch #6 Makes use of QIOChannelSocket zero_copy implementation on
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


Leonardo Bras (6):
  QIOChannel: Add io_writev_zero_copy & io_flush_zero_copy callbacks
  QIOChannelSocket: Add flags parameter for writing
  QIOChannelSocket: Implement io_writev_zero_copy & io_flush_zero_copy
    for CONFIG_LINUX
  migration: Add zero-copy parameter for QMP/HMP for Linux
  migration: Add migrate_use_tls() helper
  multifd: Implement zero copy write in multifd migration
    (multifd-zero-copy)

 qapi/migration.json         |  24 ++++++
 include/io/channel-socket.h |   2 +
 include/io/channel.h        |  98 +++++++++++++++++++++---
 migration/migration.h       |   6 ++
 migration/multifd.h         |   4 +-
 io/channel-socket.c         | 145 +++++++++++++++++++++++++++++++++---
 io/channel.c                |  66 +++++++++++++---
 migration/channel.c         |   6 +-
 migration/migration.c       |  49 ++++++++++++
 migration/multifd.c         |  45 ++++++++---
 migration/ram.c             |  29 ++++++--
 migration/socket.c          |   6 ++
 monitor/hmp-cmds.c          |   6 ++
 13 files changed, 434 insertions(+), 52 deletions(-)

-- 
2.33.1


