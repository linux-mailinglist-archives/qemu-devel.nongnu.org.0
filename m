Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE552277C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 01:19:27 +0200 (CEST)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noZ8X-00028o-MZ
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 19:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noZ6S-0000AS-8t
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:17:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noZ6P-0002dV-LZ
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652224631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BQ7JTAI/5uEevzoHIF9srMV32OhSDjmjOn/zNSvVpfk=;
 b=afnl4wqC/UOhWA9mI5efJSiuDrDLcbcZ9QTxHpytOqYtiGxOdCETu8x7T6xK/tyYg9k81g
 TSFpzWetpF4k4gdcFwrs4zAm/uWrU3abYsK/bo99RSx+CBOLMpt0nWWDGJ+dmNXXLWnJAo
 mXtblwbIz0dSEEnfBLpREWWUhh3Qhpk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-LFEdeEmyNda9PguLbeWWTw-1; Tue, 10 May 2022 19:17:10 -0400
X-MC-Unique: LFEdeEmyNda9PguLbeWWTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4400D101AA45
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 23:17:10 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A265F40D0161;
 Tue, 10 May 2022 23:17:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>
Subject: [PATCH 0/2] migration: Store ram size value
Date: Wed, 11 May 2022 01:17:06 +0200
Message-Id: <20220510231708.7197-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Hi

Current migration code recalculates the amount of RAM each time that
is needed.  This calculation requires RCU and other operations.
During migration we disable hot/unplug of memory, so we can store it.

Notice the times difference, and specially that ram_bytes_total()
don't appears anymore in the perf output.

total time: 75852 ms
downtime: 264 ms
setup: 273 ms
transferred ram: 19671939 kbytes
throughput: 2132.28 mbps
remaining ram: 0 kbytes
total ram: 1077936904 kbytes
duplicate: 265170289 pages
skipped: 0 pages
normal: 4316628 pages
normal bytes: 17266512 kbytes
dirty sync count: 4
page size: 4 kbytes
multifd bytes: 17341329 kbytes
pages-per-second: 1236658
precopy ram: 2330608 kbytes
downtime ram: 1 kbytes

  37.97%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
  10.42%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   6.67%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   3.71%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.79%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   2.69%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   2.41%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   1.55%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
   1.26%  live_migration   qemu-system-x86_64       [.] find_next_bit
   1.07%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.07%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.06%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.05%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.04%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.03%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.02%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   1.01%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.01%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.01%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.98%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   0.96%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.93%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.92%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.90%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.88%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.85%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.83%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.61%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
   0.48%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string

Migration status: completed
total time: 70033 ms
downtime: 279 ms
setup: 280 ms
transferred ram: 19692747 kbytes
throughput: 2312.82 mbps
remaining ram: 0 kbytes
total ram: 1077936904 kbytes
duplicate: 265164421 pages
skipped: 0 pages
normal: 4322415 pages
normal bytes: 17289660 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 17362190 kbytes
pages-per-second: 2523447
precopy ram: 2330555 kbytes
downtime ram: 1 kbytes

  43.64%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
  11.32%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   7.60%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   2.95%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   2.73%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   1.76%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
   1.44%  live_migration   qemu-system-x86_64       [.] find_next_bit
   0.84%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.84%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.81%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.80%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.80%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.79%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.79%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.79%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.78%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.78%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   0.77%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.77%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.77%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.77%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.77%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.76%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.71%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.66%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
   0.62%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   0.54%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.51%  live_migration   qemu-system-x86_64       [.] qemu_put_byte

Please, review.

Thanks, Juan.

Juan Quintela (2):
  migration: Split ram_bytes_total_common() in two functions
  migration: Calculate ram size once

 migration/ram.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

-- 
2.35.1


