Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253ED44E1A1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 06:43:26 +0100 (CET)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlPLQ-0000cl-TS
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 00:43:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHa-00067L-H2
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHX-0005O3-07
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636695560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BB3+A26khnbD+dMCm/emaNTgB/imgTEHN/jF0L6MHUM=;
 b=ERbekO3xoe1VqR6seRvu8KblLqGHW51ooNN7T0uN8vae60A53rOQEGY1co6Ftm3Q/kRVvl
 2JI22O0aHI2WK8mjM4L2OnGHkX2mJSAIPXCdp3mT/MaIODCsZFLG313wLmqfwAyUE8R36l
 KIsJIMxuq7P4ShdWBjtvKKP83I3BTxM=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-dMFkDP_sPou2cStc0rmRUw-1; Fri, 12 Nov 2021 00:39:16 -0500
X-MC-Unique: dMFkDP_sPou2cStc0rmRUw-1
Received: by mail-vk1-f199.google.com with SMTP id
 m67-20020a1f5846000000b002e5e58a826cso3807934vkb.23
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 21:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BB3+A26khnbD+dMCm/emaNTgB/imgTEHN/jF0L6MHUM=;
 b=Nt3js3QDurHzvy4InGxK24+6BBVa2xVSC4v/nXmGDvtQ9hrCN5+UTv2azd+yuRKgVW
 +uHecGL+bJ5ioq5IAC390ec3lQHPny5EFZepcQms03fB+RDD4CUe7FtWxlZ3Rk6xqH1y
 wWJyxWMtx1YwFaCTt8VBFD2bBZjnw0RX3cO1Vi9eDug6bf0jI1jAE0E/hT9/d5shA76N
 c3g/yuQMnJwV0ApngQlo8HTzWXRFSqiYb/Gl5+nmLffdA6uWRWW8xezRIcJEc5wcJfB5
 5Cmkmc+cfF8y5zV0tZ81PIwbjIiM0mF34s/hsxu1Nffl4JHZeajC3dGDJ45Au32r9Xr+
 LMCg==
X-Gm-Message-State: AOAM533y9Gh0SnikeW21P8hoj1rxXHi7cxyR8ai/RN8F+7xtw+78rAeh
 rB6Y8xZ9tsKg9XWMhSE7TPcuzr9umeu8KPXoTVgHp55S6fNb975hTAD7Enym9Rs3oEhwcs96jES
 rcZIL9YhM9+vN4Co=
X-Received: by 2002:a05:6122:997:: with SMTP id
 g23mr19644014vkd.15.1636695556112; 
 Thu, 11 Nov 2021 21:39:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZZrxvBl5KrCgj68HFJGBQJG9kosLZ+1mGsEoR+XxJmInLv9Rr0DCyfBrZ+ctuDF6epK06gg==
X-Received: by 2002:a05:6122:997:: with SMTP id
 g23mr19643968vkd.15.1636695555869; 
 Thu, 11 Nov 2021 21:39:15 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:7e14:3b94:fb27:f0ad:a824])
 by smtp.gmail.com with ESMTPSA id r2sm1465280vsk.28.2021.11.11.21.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 21:39:15 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v5 0/6] MSG_ZEROCOPY + multifd
Date: Fri, 12 Nov 2021 02:10:35 -0300
Message-Id: <20211112051040.923746-1-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
use of it for multifd migration performance improvement. 

Patch #1 creates new callbacks for QIOChannel, allowing the implementation
of zerocopy writing.

Patch #2 reworks qio_channel_socket_writev() so it accepts flags for 
that are later passed to sendmsg().

Patch #3 implements writev_zerocopy and flush_zerocopy on QIOChannelSocket,
making use of MSG_ZEROCOPY on Linux.

Patch #4 adds a "zerocopy" migration property, only available with
CONFIG_LINUX, and compiled-out in any other architectures. 
This migration property has to be enabled before multifd migration starts.

Patch #5 adds a helper function that allows to see if TLS is going to be used.
This helper will be later used in patch #6.

Patch #6 Makes use of QIOChannelSocket zerocopy implementation on
nocomp multifd migration.

Results:
So far, the resource usage of __sys_sendmsg() reduced 15 times, and the
overall migration took 13-22% less time, based in synthetic cpu workload.

The objective is to reduce migration time in hosts with heavy cpu usage.

---
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
  QIOChannel: Add io_writev_zerocopy & io_flush_zerocopy callbacks
  QIOChannelSocket: Add flags parameter for writing
  QIOChannelSocket: Implement io_writev_zerocopy & io_flush_zerocopy for
    CONFIG_LINUX
  migration: Add zerocopy parameter for QMP/HMP for Linux
  migration: Add migrate_use_tls() helper
  multifd: Implement zerocopy write in multifd migration
    (multifd-zerocopy)

 qapi/migration.json         |  18 ++++
 include/io/channel-socket.h |   2 +
 include/io/channel.h        |  94 ++++++++++++++++---
 migration/migration.h       |   6 ++
 migration/multifd.h         |   4 +-
 io/channel-socket.c         | 176 ++++++++++++++++++++++++++++++++++--
 io/channel.c                |  63 ++++++++++---
 migration/channel.c         |   6 +-
 migration/migration.c       |  41 +++++++++
 migration/multifd.c         |  64 ++++++++++---
 migration/ram.c             |  29 ++++--
 migration/socket.c          |   5 +
 monitor/hmp-cmds.c          |   6 ++
 13 files changed, 455 insertions(+), 59 deletions(-)

-- 
2.33.1


