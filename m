Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C054DF2B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:33:53 +0200 (CEST)
Received: from localhost ([::1]:57070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mov-00059H-Q2
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjc-0001Yk-KM
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:20 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:35524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mja-0001sh-Ej
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:20 -0400
Received: by mail-lj1-x230.google.com with SMTP id r24so1014042ljn.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jq5iVhBIsDvC5H41yWqx18p9M9AW42CABPOqjFacazA=;
 b=jbzJSYkULeZUSmRgjJdjEjZ/pLLAtHP1Zft+UMog4rvxIky5QQnoOjCgArFxxMa5aE
 CdNQZRjtF/Zu7NOvQmqweq27449t6SJtwwtwtuphlYWPZQhs8GopZ5OVG5FreF+UzY4y
 q3047CQgu35e3G5U8WRk7TBBsmUuGre8OttkD24LEknRjMq/ramwUVF7Wt9aOCgObc+A
 MZSsc/I5exLaN9BZiGhPypwR4crVNJceB1VaY5Z6UkmDJYpz8rSK598LcHX/QMqx+BAY
 YiMiZGmYg4OkEziTfCx8gLC5uuLwZ1fss7xJYIHGEGecasmeYl3O3+zl8lx4bSfmYjRt
 sqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jq5iVhBIsDvC5H41yWqx18p9M9AW42CABPOqjFacazA=;
 b=OuA3E2P48Ycc3GV6iHBtKbRzACpyzD8Dx6IyonviYIYq27Dq8yujW5KHrNQeLVbA2f
 J7lHDFGxKzncu52oHKEjBqsZcuywg36hDGel9En5XTtLUU0Pttm0Y1Zd5ALwnE4U03gU
 nDpRM8d9xRqu7Jsnqunl3s4wXCdNuZM6kz5TpCxe38ZsgQpwxbMsjNrIjzrajXR9+P68
 9jgxxPBCM603J+KtTWfxGowdxOZDEeyWhzBqIaVFNvWtt0NCTwiPSofjInyK22m9eo3p
 o8B9DrfXlZvP6Jlqolxo+1S4V6WztjXwee5PbiB+ErkF0fktfItwPYkkxzQAVV2Vd+dT
 4WPw==
X-Gm-Message-State: AJIora+E9fjZZZme5aCyWdLKDFdRsk7PVZ/CFQHkLb648q5CV8orL5/5
 1a3ajiKBkrJDOeNxEyFMZcWLJaNBLUwQ2Kyj
X-Google-Smtp-Source: AGRyM1uoo7iQ4qqaGb0eqNlIc9pQ7CWFm0MblGPR8ZxqTuMdEFvFXmwD87QUKmQzH3RmSR0cJ6tefQ==
X-Received: by 2002:a05:651c:2127:b0:258:fb2c:ce5d with SMTP id
 a39-20020a05651c212700b00258fb2cce5dmr2147851ljq.177.1655375295209; 
 Thu, 16 Jun 2022 03:28:15 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:14 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 00/17] migration/snapshot: External snapshot utility
Date: Thu, 16 Jun 2022 13:27:54 +0300
Message-Id: <20220616102811.219007-1-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

Changes v2 -> v3
 * Refactored tool code to decrease duplications of migration code.
 * Used sequential migration for saving which means that vmstate
   will be send first and only after that ram part will be sent.
   For this purpose stream-content-list paramter was used.
 * Removed aio work with block driver. Should be replaced with
   existing in qcow2 format in next versions.
 * Removed postcopy percent. Should be added in next versions.

Changes v1 -> v2:
 * Fixed CI checks

Changes v0 -> v1:
 * Changed command-line format, now use blockdev specification to
   define vmstate image.
 * Don't deal with image creation in the tool, create externally.
 * Better block layer AIO handling in the load path.
 * Reduced fragmentation of the image backing file by using 'writtent-slice'
   bitmaps in RAM blocks. Zero block write is issued to a never written slice
   before the actual memory page write takes place.
 * Improved load performance in postcopy by using 'loaded-slice' bitmaps
   in RAM blocks.
 * Refactored error handling/messages.
 * Refactored namings.

This series is a kind of PoC for asynchronous snapshot reverting. It is
about external snapshots only and doesn't involve block devices. Thus, it's
mainly intended to be used with the new 'background-snapshot' migration
capability and otherwise standard QEMU migration mechanism.

The major ideas behind this version were:
  * Make it compatible with 'exec:'-style migration - options can be create
    some separate tool or integrate into qemu-system.
  * Support asynchronous revert stage by using unaltered postcopy logic
    at destination. To do this, we should be capable of saving RAM pages
    so that any particular page can be directly addressed by it's block ID
    and page offset. Possible solutions here seem to be:
      use separate index (and storing it somewhere)
      create sparse file on host FS and address pages with file offset
      use QCOW2 (or other) image container with inherent sparsity support
  * Make image file dense on the host FS so we don't depend on
    copy/backup tools and how they deal with sparse files. Off course,
    there's some performance cost for this choice.
  * Try to keep page save latencies small while not degrading migration
    bandwidth too much.

This version of snapshot-tool is the first step to integrate tool into
main QEMU. Now tool replace ram hanlers so it can call existing functions
in migration/* part to parse migration stream.

For the storage format, QCOW2 as a container and large (1MB) cluster size seem
to be an optimal choice. Larger cluster is beneficial for performance 
particularly
in the case when image preallocation is disabled. Such cluster size does not 
result
in too high internal fragmentation level (~10% of space waste in most cases) yet
allows to reduce significantly the number of expensive cluster allocations.

"stream-content-list"
There was no strict guarantee that there is no sections in ram part
rather than ram. So to solve this problem we decided to implement
parameters stream-content-list to provide such guarantee strictly.
This decision also helps with reusing of existed migration code.
You can see it in tool load part where tool disables all handlers except
ram using this parameter. If you have already seen it in previous patches you
can skip first 8 commits.

"sequential migration"
One problem remains unsolved. We need to run two migrations first to
save vmstate and second to save ram. We cannot run migration if VM is in
postmigrate state. But if we want to make snapshot this prohibition is
unnecessary so I changed some parts of migration and softmmu so
sequential migration become permitted. But that is not a solution. May
be new capability should be implementedi for that purpose.

Some of the upgrades were removed for now. This happened because of refactoring
and should be implemented in next versions.

How to use:

**Save:**
* > qemu-img create -f qcow2 -o size=<2_x_ram_size>,cluster_size=1M,
           preallocation=off,refcount_bits=8 <image-filename>
* qemu> migrate_set_capability background-snapshot on
* #set SCL to "vmstate" only
* qemu> migrate "exec:qemu-snapshot --save-vmstate
           <image-filename>,cache.direct=off,file.aio=threads"
* #set SCL to "ram" only
* qemu> migrate "exec:qemu-snapshot
           <image-filename>,cache.direct=off,file.aio=threads" 

**Load:**
* Use 'qemu-system-* -incoming defer'
* qemu> migrate_incoming "exec:qemu-snapshot --revert
           <image-filename>,cache.direct=on,file.aio=native"

**Load with postcopy:**
* Use 'qemu-system-* -incoming defer'
* qemu> migrate_set_capability postcopy-ram on
* qemu> migrate_incoming "exec:qemu-snapshot --revert --postcopy
           <image-filename>,cache.direct=on,file.aio=native"

Nikita Lapshin (17):
  migration: Implemented new parameter stream_content
  migration: should_skip() implemented
  migration: Add vmstate part of migration stream
  igration: Add dirty-bitmaps part of migration stream
  Add block part of migration stream
  migration: Add RAM part of migration stream
  migration: analyze-migration script changed
  migration: Test for RAM and vmstate parts
  migration/snapshot: Introduce qemu-snapshot tool
  migration/snapshot: Build changes for qemu-snapshot-tool
  migration/qemu-file: Fix qemu_ftell() for non-writable file
  migration/snapshot: Move RAM_SAVE_FLAG_xxx defines to migration/ram.h
  migration/snapshot: Block layer support in qemu-snapshot
  migration/snpashot: Implement API for RAMBlock
  migration/snapshot: Save part implement
  migration/snapshot: Precopy load implemented
  migration/snapshot: Postcopy load implemented

 include/qemu-snapshot.h                       |   94 ++
 meson.build                                   |   18 +
 migration/meson.build                         |    4 +-
 migration/migration.c                         |  199 ++-
 migration/migration.h                         |    4 +
 migration/qemu-file.c                         |    3 +-
 migration/qemu-snapshot-io.c                  |  112 ++
 migration/qemu-snapshot.c                     | 1126 +++++++++++++++++
 migration/ram.c                               |   22 +-
 migration/ram.h                               |   16 +
 migration/savevm.c                            |  116 +-
 migration/savevm.h                            |    8 +
 qapi/migration.json                           |   21 +-
 qemu-snapshot.c                               |  540 ++++++++
 scripts/analyze-migration.py                  |   19 +-
 .../tests/migrate-ram-stream-content-test     |   96 ++
 .../tests/migrate-ram-stream-content-test.out |    5 +
 17 files changed, 2342 insertions(+), 61 deletions(-)
 create mode 100644 include/qemu-snapshot.h
 create mode 100644 migration/qemu-snapshot-io.c
 create mode 100644 migration/qemu-snapshot.c
 create mode 100644 qemu-snapshot.c
 create mode 100755 tests/qemu-iotests/tests/migrate-ram-stream-content-test
 create mode 100644 tests/qemu-iotests/tests/migrate-ram-stream-content-test.out

-- 
2.31.1


