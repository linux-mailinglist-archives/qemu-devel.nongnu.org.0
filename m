Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD61486D16
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:17:12 +0100 (CET)
Received: from localhost ([::1]:40564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5b4I-0008Ib-S0
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:17:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1S-0005IC-GS
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1P-0006Fl-QO
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641507246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=anWWQ4vEtUqXFKIg965WlalJhRYjkyt8/7ghKW/uHmY=;
 b=RIwLLBVwcyRw+AdD+FKGCMYmg7IjeJQECem/FmyAEyn97DPgKyDoKhQbkXQIuyZuWlev5K
 +J2z3vuZqxdPSwh+uhn6B2aH+7/GT2F7ElFuvr7FQwZVixZvJ3uxh0FM5wXUEw/p83i875
 XjF9AHRyL3INMmhYuK0DsYwMFH9hkGw=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-y-NuwhQ4MrybtsKlKScP6A-1; Thu, 06 Jan 2022 17:14:05 -0500
X-MC-Unique: y-NuwhQ4MrybtsKlKScP6A-1
Received: by mail-vk1-f197.google.com with SMTP id
 g198-20020a1f20cf000000b00313e1efcfc4so1077738vkg.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anWWQ4vEtUqXFKIg965WlalJhRYjkyt8/7ghKW/uHmY=;
 b=ziXWbyyiXXs0KuD+ILxF8HbaW4220BlJ+8NkFI1YEE9v3MuG8UJC2i2i77BEmD9Eph
 wDMN8EHAlqTWgOogNK6H3CqU9OJ47HSb/GC8+dru0StNmDZo1aoXx6ACQV4ylc/wkwhN
 1AQu7XcP55z9Bazh6vRuhCWqwjUIY8JZB4fo+V7Z3Th3x2FL7z9RpsrbuocH/lYDGu9a
 k6MRxZimq7AUyM5vLpRDbuZeK1Zy1nn8oMDUDCYxoMz/eTnflJ5jcTyUvNDEZWDNHHH4
 dWlGBO77RxflnxiBUPyLRaEkklKaFEIhJUFVeHO+A8F/51K0ks/WaG/jzaRwZy0fc6rc
 tw6w==
X-Gm-Message-State: AOAM531238IfU7Hnv9cwYc3wmWCtV9Ei+erRmOjWGTsQ6Sm6Rqjav622
 1UYxSBhBRhERkRXmToY0/boHCUaf2WveYVi1/0+x+SOUKxkHRGAhEJFtt0bLWar6Bb/5X6IyU6F
 lo5AOCEZHY38EOMo=
X-Received: by 2002:a67:6783:: with SMTP id b125mr18523370vsc.54.1641507244828; 
 Thu, 06 Jan 2022 14:14:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVzBnGxoHOxsOUc/ubIUyDoKlCxj+a+G8F5svMZuM9C9bIZqvdV1Swl5hDCM+2Z9CCH30xXA==
X-Received: by 2002:a67:6783:: with SMTP id b125mr18523355vsc.54.1641507244582; 
 Thu, 06 Jan 2022 14:14:04 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:cc01:fae1:7982:b010:d91])
 by smtp.gmail.com with ESMTPSA id c15sm2098831uaj.13.2022.01.06.14.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:14:04 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v7 0/5] MSG_ZEROCOPY + multifd
Date: Thu,  6 Jan 2022 19:13:37 -0300
Message-Id: <20220106221341.8779-1-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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

Patch #2 implements io_writev flags and io_flush() on QIOChannelSocket,
making use of MSG_ZEROCOPY on Linux.

Patch #3 adds a "zero_copy" migration property, only available with
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
  migration: Add zero-copy parameter for QMP/HMP for Linux
  migration: Add migrate_use_tls() helper
  multifd: Implement zero copy write in multifd migration
    (multifd-zero-copy)

 qapi/migration.json         |  24 ++++++++
 include/io/channel-socket.h |   2 +
 include/io/channel.h        |  67 +++++++++++++++++-----
 migration/migration.h       |   6 ++
 migration/multifd.h         |   4 +-
 io/channel-buffer.c         |   1 +
 io/channel-command.c        |   1 +
 io/channel-file.c           |   1 +
 io/channel-socket.c         | 109 ++++++++++++++++++++++++++++++++++--
 io/channel-tls.c            |   1 +
 io/channel-websock.c        |   1 +
 io/channel.c                |  51 ++++++++++++-----
 migration/channel.c         |   6 +-
 migration/migration.c       |  52 ++++++++++++++++-
 migration/multifd.c         |  45 ++++++++++++---
 migration/ram.c             |  29 +++++++---
 migration/rdma.c            |   1 +
 migration/socket.c          |   6 ++
 monitor/hmp-cmds.c          |   6 ++
 19 files changed, 360 insertions(+), 53 deletions(-)

-- 
2.34.1



