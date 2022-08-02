Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ABD58773A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 08:47:02 +0200 (CEST)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIlgD-0002k5-Aw
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 02:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlYo-0003aY-Mb
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlYh-00068i-Ee
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659422354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B9aDt4mN66U/bSVGNwjw5vcaRbznif0y3k+To/9KEEg=;
 b=LzGN6xYApfYALmMwrLrlnXeTMrWv9js+FbHEaFqaQ0ptgwzqjGZIV3aG4LnhfPqeDj3bYb
 IfSQr+5kC2HSPc81gKogVhiGQ5QbGyDScfrjtllxJFcjD2yaaPcNVTzd+FY6Qgu7Lw4+kN
 Y1N0NJsQYz64Pamit6ZsXWns2W1zh+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-uh7tJ3tbMDeVHc60QMvQyg-1; Tue, 02 Aug 2022 02:39:11 -0400
X-MC-Unique: uh7tJ3tbMDeVHc60QMvQyg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B453E811E80;
 Tue,  2 Aug 2022 06:39:10 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17340492C3B;
 Tue,  2 Aug 2022 06:39:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v7 00/12] Migration: Transmit and detect zero pages in the
 multifd threads
Date: Tue,  2 Aug 2022 08:38:55 +0200
Message-Id: <20220802063907.18882-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

In this version:

- rebase to latest upstream
- convert multifd-zero-pages property into main-zero-page capability, because:
  * libvirt handles capabilities way easiert
  * capabilities are off by default, so I have to change the name
  * this way one can check if zero_page is enabled or not
- minor changer here and there

Please review, Juan.

[v6]
In this version:
- document what protects each field in MultiFDRecv/SendParams
- calcule page_size once when we start the migration, and store it in
  a field
- Same for page_count.
- rebase to latest
- minor improvements here and there
- test on huge memory machines

Command line for all the tests:

gdb -q --ex "run" --args $QEMU \
	-name guest=$NAME,debug-threads=on \
	-m 16G \
	-smp 6 \
	-machine q35,accel=kvm,usb=off,dump-guest-core=off \
	-boot strict=on \
	-cpu host \
	-no-hpet \
	-rtc base=utc,driftfix=slew \
	-global kvm-pit.lost_tick_policy=delay \
	-global ICH9-LPC.disable_s3=1 \
	-global ICH9-LPC.disable_s4=1 \
	-device pcie-root-port,id=root.1,chassis=1,addr=0x2.0,multifunction=on \
	-device pcie-root-port,id=root.2,chassis=2,addr=0x2.1 \
	-device pcie-root-port,id=root.3,chassis=3,addr=0x2.2 \
	-device pcie-root-port,id=root.4,chassis=4,addr=0x2.3 \
	-device pcie-root-port,id=root.5,chassis=5,addr=0x2.4 \
	-device pcie-root-port,id=root.6,chassis=6,addr=0x2.5 \
	-device pcie-root-port,id=root.7,chassis=7,addr=0x2.6 \
	-device pcie-root-port,id=root.8,chassis=8,addr=0x2.7 \
	-blockdev driver=file,node-name=storage0,filename=$FILE,auto-read-only=true,discard=unmap \
	-blockdev driver=qcow2,node-name=format0,read-only=false,file=storage0 \
	-device virtio-blk-pci,id=virtio-disk0,drive=format0,bootindex=1,bus=root.1 \
	-netdev tap,id=hostnet0,vhost=on,script=/etc/kvm-ifup,downscript=/etc/kvm-ifdown \
	-device virtio-net-pci,id=net0,netdev=hostnet0,mac=$MAC,bus=root.2 \
	-device virtio-serial-pci,id=virtio-serial0,bus=root.3 \
	-device virtio-balloon-pci,id=balloon0,bus=root.4 \
	$GRAPHICS \
	$CONSOLE \
	-device virtconsole,id=console0,chardev=charconsole0 \
	-uuid 9d3be7da-e1ff-41a0-ac39-8b2e04de2c19 \
	-nodefaults \
	-msg timestamp=on \
	-no-user-config \
	$MONITOR \
	$TRACE \
	-global migration.x-multifd=on \
	-global migration.multifd-channels=16 \
	-global migration.x-max-bandwidth=$BANDWIDTH

Tests have been done in a single machine over localhost.  I didn't have 2 machines with 4TB of RAM for testing.

Tests done on a 12TB RAM machine.  Guests where running with 16GB, 1TB and 4TB RAM

tests run with:
- upstream multifd
- multifd + zero page
- precopy (only some of them)

tests done:
- idle clean guest (just booted guest)
- idle dirty guest (run a program to dirty all memory)
- test with stress (4 threads each dirtying 1GB RAM)

Executive summary

16GB guest
                Precopy            upstream          zero page
                Time    Downtime   Time    Downtime  Time    Downtime
clean idle      1548     93         1359   48         866    167
dirty idle     16222    220         2092   371       1870    258
busy 4GB       don't converge      31000   308       1604    371

In the dirty idle, there is some weirdness in the precopy case, I
tried several times and it always took too much time.  It should be
faster.

In the busy 4GB case, precopy don't converge (expected) and without
zero page, multifd is on the limit, it _almost_ don't convrge, it took
187 iterations to converge.

1TB
                Precopy            upstream          zero page
                Time    Downtime   Time    Downtime  Time    Downtime
clean idle     83174    381        72075   345       52966   273
dirty idle                        104587   381       75601   269
busy 2GB                           79912   345       58953   348

I only tried the clean idle case with 1TB.  Notice that it is already
significantively slower.  With 1TB RAM, zero page is clearly superior in all tests.

4TB
                upstream          zero page
                Time    Downtime  Time    Downtime
clean idle      317054  552       215567  500
dirty idle      357581  553       317428  744

The busy case here is similar to the 1TB guests, just takes much more time.

In conclusion, zero page detection on the migration threads is from a
bit to much faster than anything else.

I add here the output of info migrate and perf for all the migration
rounds.  The important bit that I found is that once that we introduce
zero pages, migration spends all its time copyng pages, that is where
it needs to be, not waiting for buffer_zero or similar.

Upstream
--------

16GB test

idle

precopy

Migration status: completed
total time: 1548 ms
downtime: 93 ms
setup: 16 ms
transferred ram: 624798 kbytes
throughput: 3343.01 mbps
remaining ram: 0 kbytes
total ram: 16777992 kbytes
duplicate: 4048839 pages
skipped: 0 pages
normal: 147016 pages
normal bytes: 588064 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 651825
precopy ram: 498490 kbytes
downtime ram: 126307 kbytes

  41.76%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
  14.68%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   9.53%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   5.72%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   3.89%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.50%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   2.45%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   1.87%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   1.28%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
   1.03%  live_migration   qemu-system-x86_64       [.] find_next_bit
   0.95%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   0.95%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   0.68%  live_migration   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.67%  live_migration   qemu-system-x86_64       [.] kvm_log_clear
   0.56%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
   0.51%  live_migration   qemu-system-x86_64       [.] qemu_put_byte
   0.43%  live_migration   [kernel.kallsyms]        [k] copy_page
   0.38%  live_migration   qemu-system-x86_64       [.] get_ptr_rcu_reader
   0.36%  live_migration   qemu-system-x86_64       [.] save_page_header
   0.33%  live_migration   [kernel.kallsyms]        [k] __memcg_kmem_charge_page
   0.33%  live_migration   qemu-system-x86_64       [.] runstate_is_running

upstream

Migration status: completed
total time: 1359 ms
downtime: 48 ms
setup: 35 ms
transferred ram: 603701 kbytes
throughput: 3737.66 mbps
remaining ram: 0 kbytes
total ram: 16777992 kbytes
duplicate: 4053362 pages
skipped: 0 pages
normal: 141517 pages
normal bytes: 566068 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 568076 kbytes
pages-per-second: 2039403
precopy ram: 35624 kbytes
downtime ram: 1 kbytes

  36.03%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
   9.32%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   5.18%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   4.15%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.60%  live_migration   [kernel.kallsyms]        [k] copy_page
   2.30%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   2.24%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   1.96%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   1.30%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
   1.12%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.00%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.94%  live_migration   qemu-system-x86_64       [.] find_next_bit
   0.93%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   0.91%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.88%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   0.88%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt
   0.81%  live_migration   qemu-system-x86_64       [.] kvm_log_clear
   0.81%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.79%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.75%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.72%  live_migration   libc.so.6                [.] __pthread_mutex_lock
   0.70%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.70%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
   0.70%  qemu-system-x86  [kernel.kallsyms]        [k] perf_event_alloc
   0.69%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.68%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.67%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.66%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.64%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.63%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.63%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.60%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.53%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.47%  live_migration   qemu-system-x86_64       [.] qemu_put_byte

zero page

Migration status: completed
total time: 866 ms
downtime: 167 ms
setup: 42 ms
transferred ram: 14627983 kbytes
throughput: 145431.53 mbps
remaining ram: 0 kbytes
total ram: 16777992 kbytes
duplicate: 4024050 pages
skipped: 0 pages
normal: 143374 pages
normal bytes: 573496 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 14627983 kbytes
pages-per-second: 4786693
precopy ram: 11033626 kbytes
downtime ram: 3594356 kbytes

   6.84%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   4.06%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   3.46%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.39%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   1.59%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.50%  multifdsend_3    qemu-system-x86_64       [.] buffer_zero_avx512
   1.48%  multifdsend_10   qemu-system-x86_64       [.] buffer_zero_avx512
   1.32%  multifdsend_12   qemu-system-x86_64       [.] buffer_zero_avx512
   1.29%  multifdsend_1    qemu-system-x86_64       [.] buffer_zero_avx512
   1.25%  live_migration   qemu-system-x86_64       [.] find_next_bit
   1.24%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.20%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.20%  multifdsend_13   qemu-system-x86_64       [.] buffer_zero_avx512
   1.18%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   1.16%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.13%  live_migration   qemu-system-x86_64       [.] multifd_queue_page
   1.08%  multifdsend_0    qemu-system-x86_64       [.] buffer_zero_avx512
   1.06%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.94%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.92%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.91%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.90%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string

16GB guest

dirty

precopy

Migration status: completed
total time: 16222 ms
downtime: 220 ms
setup: 18 ms
transferred ram: 15927448 kbytes
throughput: 8052.38 mbps
remaining ram: 0 kbytes
total ram: 16777992 kbytes
duplicate: 222804 pages
skipped: 0 pages
normal: 3973611 pages
normal bytes: 15894444 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 241728
precopy ram: 15670253 kbytes
downtime ram: 257194 kbytes

  38.22%  live_migration   [kernel.kallsyms]        [k] copy_page
  38.04%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.55%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
   2.45%  live_migration   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   1.43%  live_migration   [kernel.kallsyms]        [k] free_pcp_prepare
   1.01%  live_migration   [kernel.kallsyms]        [k] _copy_from_iter
   0.79%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   0.79%  live_migration   [kernel.kallsyms]        [k] __list_del_entry_valid
   0.68%  live_migration   [kernel.kallsyms]        [k] check_new_pages
   0.64%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   0.49%  live_migration   [kernel.kallsyms]        [k] skb_release_data
   0.39%  live_migration   [kernel.kallsyms]        [k] __skb_clone
   0.36%  live_migration   [kernel.kallsyms]        [k] total_mapcount
   0.34%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   0.32%  live_migration   [kernel.kallsyms]        [k] __dev_queue_xmit
   0.29%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   0.29%  live_migration   [kernel.kallsyms]        [k] __alloc_skb
   0.27%  live_migration   [kernel.kallsyms]        [k] __ip_queue_xmit
   0.26%  live_migration   [kernel.kallsyms]        [k] copy_user_generic_unrolled
   0.26%  live_migration   [kernel.kallsyms]        [k] __tcp_transmit_skb
   0.24%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   0.24%  live_migration   [kernel.kallsyms]        [k] skb_page_frag_refill

upstream

Migration status: completed
total time: 2092 ms
downtime: 371 ms
setup: 39 ms
transferred ram: 15929157 kbytes
throughput: 63562.98 mbps
remaining ram: 0 kbytes
total ram: 16777992 kbytes
duplicate: 224436 pages
skipped: 0 pages
normal: 3971430 pages
normal bytes: 15885720 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 15927184 kbytes
pages-per-second: 2441771
precopy ram: 1798 kbytes
downtime ram: 174 kbytes

  5.23%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
   4.93%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.92%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.84%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.56%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.55%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.53%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.48%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.43%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.43%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.33%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.21%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.19%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.13%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.01%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.86%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.83%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.90%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   0.70%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   0.69%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt
   0.62%  live_migration   libc.so.6                [.] __pthread_mutex_lock
   0.37%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   0.29%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   0.27%  live_migration   qemu-system-x86_64       [.] multifd_send_pages

zero page

Migration status: completed
total time: 1870 ms
downtime: 258 ms
setup: 36 ms
transferred ram: 16998097 kbytes
throughput: 75927.79 mbps
remaining ram: 0 kbytes
total ram: 16777992 kbytes
duplicate: 222485 pages
skipped: 0 pages
normal: 3915115 pages
normal bytes: 15660460 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 16998097 kbytes
pages-per-second: 2555169
precopy ram: 13929973 kbytes
downtime ram: 3068124 kbytes

   4.66%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.60%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.49%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.39%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.36%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.21%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.20%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.18%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.17%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.07%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.97%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.96%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.89%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.73%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.68%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.44%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.52%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt
   2.09%  live_migration   libc.so.6                [.] __pthread_mutex_lock
   1.03%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   0.97%  multifdsend_3    [kernel.kallsyms]        [k] copy_page
   0.94%  live_migration   qemu-system-x86_64       [.] multifd_send_pages
   0.79%  live_migration   qemu-system-x86_64       [.] qemu_mutex_lock_impl
   0.73%  multifdsend_11   [kernel.kallsyms]        [k] copy_page
   0.70%  live_migration   qemu-system-x86_64       [.] qemu_mutex_unlock_impl
   0.45%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   0.41%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable

16GB guest

stress --vm 4 --vm-bytes 1G --vm-keep

precopy

Don't converge

upstream

Migration status: completed
total time: 31800 ms
downtime: 308 ms
setup: 40 ms
transferred ram: 295540640 kbytes
throughput: 76230.23 mbps
remaining ram: 0 kbytes
total ram: 16777992 kbytes
duplicate: 3006674 pages
skipped: 0 pages
normal: 73686367 pages
normal bytes: 294745468 kbytes
dirty sync count: 187
page size: 4 kbytes
multifd bytes: 295514209 kbytes
pages-per-second: 2118000
precopy ram: 26430 kbytes

  7.79%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
   3.86%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.83%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.79%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.72%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.46%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.44%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.38%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.32%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.31%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.22%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.21%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.19%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.07%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.95%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.95%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.77%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.78%  live_migration   [kernel.kallsyms]        [k] kvm_set_pfn_dirty
   1.65%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   0.68%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   0.62%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   0.46%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   0.41%  live_migration   [kernel.kallsyms]        [k] __handle_changed_spte
   0.40%  live_migration   [kernel.kallsyms]        [k] pfn_valid.part.0
   0.37%  live_migration   qemu-system-x86_64       [.] kvm_log_clear
   0.29%  CPU 2/KVM        [kernel.kallsyms]        [k] copy_page
   0.27%  live_migration   [kernel.kallsyms]        [k] clear_dirty_pt_masked
   0.27%  CPU 1/KVM        [kernel.kallsyms]        [k] copy_page
   0.26%  live_migration   [kernel.kallsyms]        [k] tdp_iter_next
   0.25%  CPU 1/KVM        [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.24%  CPU 1/KVM        [kernel.kallsyms]        [k] mark_page_dirty_in_slot.part.0
   0.24%  CPU 2/KVM        [kernel.kallsyms]        [k] mark_page_dirty_in_slot.part.0

Zero page

Migration status: completed
total time: 1604 ms
downtime: 371 ms
setup: 32 ms
transferred ram: 20591268 kbytes
throughput: 107307.14 mbps
remaining ram: 0 kbytes
total ram: 16777992 kbytes
duplicate: 2984825 pages
skipped: 0 pages
normal: 2213496 pages
normal bytes: 8853984 kbytes
dirty sync count: 4
page size: 4 kbytes
multifd bytes: 20591268 kbytes
pages-per-second: 4659200
precopy ram: 15722803 kbytes
downtime ram: 4868465 kbytes

   3.21%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.92%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.86%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.81%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.80%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.79%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.78%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.73%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.73%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.69%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.62%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.60%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.59%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.58%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.55%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.38%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.44%  live_migration   libc.so.6                [.] __pthread_mutex_lock
   1.41%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   1.37%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt
   0.80%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   0.78%  CPU 4/KVM        [kernel.kallsyms]        [k] _raw_read_lock
   0.78%  CPU 2/KVM        [kernel.kallsyms]        [k] _raw_read_lock
   0.77%  CPU 4/KVM        [kernel.kallsyms]        [k] tdp_mmu_map_handle_target_level
   0.77%  CPU 2/KVM        [kernel.kallsyms]        [k] tdp_mmu_map_handle_target_level
   0.76%  CPU 5/KVM        [kernel.kallsyms]        [k] tdp_mmu_map_handle_target_level
   0.75%  live_migration   qemu-system-x86_64       [.] multifd_send_pages
   0.74%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   0.73%  CPU 5/KVM        [kernel.kallsyms]        [k] _raw_read_lock
   0.67%  CPU 0/KVM        [kernel.kallsyms]        [k] copy_page
   0.62%  CPU 0/KVM        [kernel.kallsyms]        [k] tdp_mmu_map_handle_target_level
   0.62%  live_migration   qemu-system-x86_64       [.] qemu_mutex_lock_impl
   0.61%  CPU 0/KVM        [kernel.kallsyms]        [k] _raw_read_lock
   0.60%  CPU 2/KVM        [kernel.kallsyms]        [k] mark_page_dirty_in_slot.part.0
   0.58%  CPU 5/KVM        [kernel.kallsyms]        [k] mark_page_dirty_in_slot.part.0
   0.54%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   0.53%  CPU 4/KVM        [kernel.kallsyms]        [k] mark_page_dirty_in_slot.part.0
   0.52%  CPU 0/KVM        [kernel.kallsyms]        [k] mark_page_dirty_in_slot.part.0
   0.49%  live_migration   [kernel.kallsyms]        [k] kvm_set_pfn_dirty

1TB guest

precopy

Migration status: completed
total time: 83147 ms
downtime: 381 ms
setup: 265 ms
transferred ram: 19565544 kbytes
throughput: 1933.88 mbps
remaining ram: 0 kbytes
total ram: 1073742600 kbytes
duplicate: 264135334 pages
skipped: 0 pages
normal: 4302604 pages
normal bytes: 17210416 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 0 kbytes
pages-per-second: 412882
precopy ram: 19085615 kbytes
downtime ram: 479929 kbytes

  43.50%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
  11.27%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   8.33%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   7.47%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   4.41%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   3.42%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   3.06%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   2.62%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   1.78%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
   1.43%  live_migration   qemu-system-x86_64       [.] find_next_bit
   1.13%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   1.12%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   0.70%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
   0.51%  live_migration   qemu-system-x86_64       [.] qemu_put_byte
   0.49%  live_migration   qemu-system-x86_64       [.] save_page_header
   0.48%  live_migration   qemu-system-x86_64       [.] qemu_put_be64
   0.40%  live_migration   qemu-system-x86_64       [.] migrate_postcopy_ram
   0.40%  live_migration   qemu-system-x86_64       [.] runstate_is_running
   0.35%  live_migration   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.32%  live_migration   qemu-system-x86_64       [.] get_ptr_rcu_reader
   0.30%  live_migration   qemu-system-x86_64       [.] qemu_file_rate_limit
   0.30%  live_migration   qemu-system-x86_64       [.] migrate_use_xbzrle
   0.27%  live_migration   [kernel.kallsyms]        [k] __memcg_kmem_charge_page
   0.26%  live_migration   qemu-system-x86_64       [.] migrate_use_compression
   0.25%  live_migration   qemu-system-x86_64       [.] kvm_log_clear
   0.25%  live_migration   qemu-system-x86_64       [.] qemu_file_get_error

upstream

Migration status: completed
total time: 72075 ms
downtime: 345 ms
setup: 287 ms
transferred ram: 19601046 kbytes
throughput: 2236.79 mbps
remaining ram: 0 kbytes
total ram: 1073742600 kbytes
duplicate: 264134669 pages
normal: 4301611 pages
normal bytes: 17206444 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 17279539 kbytes
pages-per-second: 2458584
precopy ram: 2321505 kbytes
downtime ram: 1 kbytes
(qemu)

 39.09%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
  10.85%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   6.92%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   4.41%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.87%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   2.63%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   2.54%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   1.70%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
   1.31%  live_migration   qemu-system-x86_64       [.] find_next_bit
   1.11%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   1.05%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   0.80%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.79%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.78%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.78%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.76%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.75%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.75%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.73%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.73%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.72%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.72%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.71%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.71%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.69%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.66%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.65%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.63%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
   0.53%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.48%  live_migration   qemu-system-x86_64       [.] qemu_put_byte
   0.44%  live_migration   qemu-system-x86_64       [.] save_page_header
   0.44%  live_migration   qemu-system-x86_64       [.] qemu_put_be64
   0.39%  live_migration   qemu-system-x86_64       [.] migrate_postcopy_ram
   0.36%  live_migration   qemu-system-x86_64       [.] runstate_is_running
   0.33%  live_migration   qemu-system-x86_64       [.] get_ptr_rcu_reader
   0.28%  live_migration   [kernel.kallsyms]        [k] __memcg_kmem_charge_page
   0.27%  live_migration   qemu-system-x86_64       [.] migrate_use_compression
   0.26%  live_migration   qemu-system-x86_64       [.] qemu_file_rate_limit
   0.26%  live_migration   qemu-system-x86_64       [.] migrate_use_xbzrle
   0.24%  live_migration   qemu-system-x86_64       [.] qemu_file_get_error
   0.21%  live_migration   qemu-system-x86_64       [.] kvm_log_clear
   0.21%  live_migration   qemu-system-x86_64       [.] ram_transferred_add
   0.20%  live_migration   [kernel.kallsyms]        [k] try_charge_memcg
   0.19%  live_migration   qemu-system-x86_64       [.] ram_control_save_page
   0.18%  live_migration   qemu-system-x86_64       [.] buffer_is_zero
   0.18%  live_migration   qemu-system-x86_64       [.] cpu_physical_memory_set_dirty_lebitmap
   0.12%  live_migration   qemu-system-x86_64       [.] qemu_ram_pagesize
   0.11%  live_migration   [kernel.kallsyms]        [k] sync_regs
   0.11%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt
   0.11%  live_migration   [kernel.kallsyms]        [k] clear_page_erms
   0.11%  live_migration   [kernel.kallsyms]        [k] kernel_init_free_pages.part.0
   0.11%  live_migration   qemu-system-x86_64       [.] migrate_background_snapshot
   0.10%  live_migration   qemu-system-x86_64       [.] migrate_release_ram
   0.10%  live_migration   [kernel.kallsyms]        [k] pte_alloc_one
   0.10%  live_migration   libc.so.6                [.] __pthread_mutex_lock
   0.10%  live_migration   [kernel.kallsyms]        [k] native_irq_return_iret
   0.08%  live_migration   [kernel.kallsyms]        [k] kvm_clear_dirty_log_protect
   0.07%  qemu-system-x86  [kernel.kallsyms]        [k] free_pcp_prepare
   0.06%  qemu-system-x86  [kernel.kallsyms]        [k] __free_pages
   0.06%  live_migration   [kernel.kallsyms]        [k] tdp_iter_next
   0.05%  live_migration   qemu-system-x86_64       [.] cpu_physical_memory_sync_dirty_bitmap.con
   0.05%  live_migration   [kernel.kallsyms]        [k] __list_del_entry_valid
   0.05%  live_migration   [kernel.kallsyms]        [k] _raw_spin_lock_irqsave
   0.05%  multifdsend_2    [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.05%  multifdsend_11   [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.05%  live_migration   [vdso]                   [.] 0x00000000000006f5
   0.05%  multifdsend_15   [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  multifdsend_1    [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  multifdsend_13   [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  multifdsend_4    [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  multifdsend_8    [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  live_migration   qemu-system-x86_64       [.] multifd_send_pages
   0.04%  multifdsend_0    [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  multifdsend_9    [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  multifdsend_14   [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  live_migration   [kernel.kallsyms]        [k] kvm_arch_mmu_enable_log_dirty_pt_masked
   0.04%  live_migration   [kernel.kallsyms]        [k] obj_cgroup_charge_pages
   0.04%  multifdsend_7    [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  multifdsend_12   [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  multifdsend_5    [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  multifdsend_10   [kernel.kallsyms]        [k] native_queued_spin_lock_slowpath.part.0
   0.04%  live_migration   [kernel.kallsyms]        [k] _raw_spin_lock
   0.04%  live_migration   qemu-system-x86_64       [.] qemu_mutex_unlock_impl

1TB idle, zero page

Migration status: completed
total time: 52966 ms
downtime: 409 ms
setup: 273 ms
transferred ram: 879229325 kbytes
throughput: 136690.83 mbps
remaining ram: 0 kbytes
total ram: 1073742600 kbytes
duplicate: 262093359 pages
skipped: 0 pages
normal: 4266123 pages
normal bytes: 17064492 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 879229317 kbytes
pages-per-second: 4024470
precopy ram: 874888589 kbytes
downtime ram: 4340735 kbytes

  14.42%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0          ◆
   2.97%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common                  ▒
   2.56%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable                  ▒
   2.50%  live_migration   qemu-system-x86_64       [.] multifd_queue_page                      ▒
   2.30%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic            ▒
   1.17%  live_migration   qemu-system-x86_64       [.] find_next_bit                           ▒
   1.12%  multifdsend_14   qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.09%  live_migration   qemu-system-x86_64       [.] multifd_send_pages                      ▒
   1.08%  multifdsend_15   qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.07%  multifdsend_11   qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.03%  multifdsend_1    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.03%  multifdsend_0    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.03%  multifdsend_7    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.03%  multifdsend_4    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.02%  multifdsend_2    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.02%  multifdsend_10   qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.02%  multifdsend_9    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.02%  multifdsend_8    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.01%  multifdsend_6    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   1.00%  multifdsend_5    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   0.99%  live_migration   libc.so.6                [.] __pthread_mutex_lock                    ▒
   0.98%  multifdsend_13   qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   0.98%  multifdsend_3    qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   0.93%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared                   ▒
   0.93%  multifdsend_12   qemu-system-x86_64       [.] buffer_zero_avx512                      ▒
   0.89%  live_migration   [kernel.kallsyms]        [k] futex_wake                              ▒
   0.83%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt          ▒
   0.70%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string          ▒
   0.69%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string

1TB: stress  stress --vm 4 --vm-bytes 512M

Wait until load in guest reach 3 before doing the migration

upstream

Migration status: completed
total time: 79912 ms
downtime: 345 ms
setup: 300 ms
transferred ram: 23723877 kbytes
throughput: 2441.21 mbps
remaining ram: 0 kbytes
total ram: 1073742600 kbytes
duplicate: 263616778 pages
normal: 5330059 pages
normal bytes: 21320236 kbytes
dirty sync count: 4
page size: 4 kbytes
multifd bytes: 21406921 kbytes
pages-per-second: 2301580
precopy ram: 2316947 kbytes
downtime ram: 9 kbytes

  38.87%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
   9.14%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   5.84%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   3.80%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.41%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   2.14%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   2.10%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   1.44%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
   1.17%  live_migration   qemu-system-x86_64       [.] find_next_bit
   0.95%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   0.91%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.89%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   0.88%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.87%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.84%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.84%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.80%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.79%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.79%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.78%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.78%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.78%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.77%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.76%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.75%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.74%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.70%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.66%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.58%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
   0.45%  live_migration   qemu-system-x86_64       [.] kvm_log_clear

zero page

Migration status: completed
total time: 58953 ms
downtime: 373 ms
setup: 348 ms
transferred ram: 972143021 kbytes
throughput: 135889.41 mbps
remaining ram: 0 kbytes
total ram: 1073742600 kbytes
duplicate: 261357013 pages
skipped: 0 pages
normal: 5293916 pages
normal bytes: 21175664 kbytes
dirty sync count: 4
page size: 4 kbytes
multifd bytes: 972143012 kbytes
pages-per-second: 3699692
precopy ram: 968625243 kbytes
downtime ram: 3517778 kbytes

 12.91%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   2.85%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.16%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   2.05%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   1.17%  live_migration   qemu-system-x86_64       [.] multifd_queue_page
   1.13%  multifdsend_4    qemu-system-x86_64       [.] buffer_zero_avx512
   1.12%  multifdsend_1    qemu-system-x86_64       [.] buffer_zero_avx512
   1.08%  live_migration   qemu-system-x86_64       [.] find_next_bit
   1.07%  multifdsend_14   qemu-system-x86_64       [.] buffer_zero_avx512
   1.07%  multifdsend_15   qemu-system-x86_64       [.] buffer_zero_avx512
   1.06%  multifdsend_2    qemu-system-x86_64       [.] buffer_zero_avx512
   1.06%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   1.06%  live_migration   qemu-system-x86_64       [.] multifd_send_pages
   1.04%  multifdsend_9    qemu-system-x86_64       [.] buffer_zero_avx512
   1.04%  multifdsend_0    qemu-system-x86_64       [.] buffer_zero_avx512
   1.04%  multifdsend_3    qemu-system-x86_64       [.] buffer_zero_avx512
   1.03%  multifdsend_11   qemu-system-x86_64       [.] buffer_zero_avx512
   1.01%  multifdsend_5    qemu-system-x86_64       [.] buffer_zero_avx512
   0.99%  multifdsend_7    qemu-system-x86_64       [.] buffer_zero_avx512
   0.98%  multifdsend_6    qemu-system-x86_64       [.] buffer_zero_avx512
   0.98%  multifdsend_8    qemu-system-x86_64       [.] buffer_zero_avx512
   0.95%  multifdsend_13   qemu-system-x86_64       [.] buffer_zero_avx512
   0.94%  multifdsend_12   qemu-system-x86_64       [.] buffer_zero_avx512
   0.92%  multifdsend_10   qemu-system-x86_64       [.] buffer_zero_avx512
   0.89%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt
   0.85%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.84%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.84%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.81%  live_migration   libc.so.6                [.] __pthread_mutex_lock

1TB: stress  stress --vm 4 --vm-bytes 1024M

upstream

Migration status: completed
total time: 79302 ms
downtime: 315 ms
setup: 307 ms
transferred ram: 30307307 kbytes
throughput: 3142.99 mbps
remaining ram: 0 kbytes
total ram: 1073742600 kbytes
duplicate: 263089198 pages
skipped: 0 pages
normal: 6972933 pages
normal bytes: 27891732 kbytes
dirty sync count: 7
page size: 4 kbytes
multifd bytes: 27994987 kbytes
pages-per-second: 1875902
precopy ram: 2312314 kbytes
downtime ram: 4 kbytes

  35.46%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
   9.27%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   6.02%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   3.68%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.64%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   2.51%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   2.31%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   1.46%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
   1.23%  live_migration   qemu-system-x86_64       [.] find_next_bit
   1.05%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.03%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.01%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.01%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.01%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.00%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.99%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.99%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.99%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.96%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   0.95%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.93%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.91%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   0.90%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.87%  live_migration   qemu-system-x86_64       [.] kvm_log_clear
   0.87%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.82%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.82%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.65%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.58%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
   0.47%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string

zero_page

900GB dirty + idle

mig_mon mm_dirty -m 10000 -p once

upstream

Migration status: completed
total time: 104587 ms
downtime: 381 ms
setup: 311 ms
transferred ram: 943318066 kbytes
throughput: 74107.80 mbps
remaining ram: 0 kbytes
total ram: 1073742600 kbytes
duplicate: 33298094 pages
skipped: 0 pages
normal: 235142522 pages
normal bytes: 940570088 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 943025391 kbytes
pages-per-second: 3331126
precopy ram: 292673 kbytes
downtime ram: 1 kbytes

  7.71%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
   4.55%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.48%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.36%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.36%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.31%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.29%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.27%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.23%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.17%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.06%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.94%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.89%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.59%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.25%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.12%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   2.72%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.54%  live_migration   [kernel.kallsyms]        [k] copy_page
   1.39%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   0.86%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   0.50%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   0.49%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   0.26%  multifdsend_7    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.25%  multifdsend_4    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.25%  multifdsend_10   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.25%  multifdsend_9    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.25%  multifdsend_15   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.24%  multifdsend_12   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.23%  multifdsend_5    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.23%  multifdsend_0    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.23%  multifdsend_3    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.21%  multifdsend_14   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.18%  live_migration   qemu-system-x86_64       [.] find_next_bit

Migration status: completed
total time: 75601 ms
downtime: 427 ms
setup: 269 ms
transferred ram: 1083999214 kbytes
throughput: 117879.85 mbps
remaining ram: 0 kbytes
total ram: 1073742600 kbytes
duplicate: 32991750 pages
skipped: 0 pages
normal: 232638485 pages
normal bytes: 930553940 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 1083999202 kbytes
pages-per-second: 3669333
precopy ram: 1080197079 kbytes
downtime ram: 3802134 kbytes

   4.41%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.38%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.37%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.32%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.29%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.29%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.28%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.27%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.16%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.09%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.07%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.07%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.07%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.07%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.07%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.07%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.59%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt
   1.59%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   1.39%  live_migration   libc.so.6                [.] __pthread_mutex_lock
   0.80%  live_migration   qemu-system-x86_64       [.] multifd_send_pages
   0.65%  multifdsend_14   [kernel.kallsyms]        [k] copy_page
   0.63%  multifdsend_1    [kernel.kallsyms]        [k] copy_page
   0.58%  live_migration   qemu-system-x86_64       [.] qemu_mutex_lock_impl
   0.48%  live_migration   qemu-system-x86_64       [.] qemu_mutex_unlock_impl
   0.40%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   0.29%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   0.26%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable

4TB idle

upstream

Migration status: completed
total time: 317054 ms
downtime: 552 ms
setup: 1045 ms
transferred ram: 77208692 kbytes
throughput: 2001.52 mbps
remaining ram: 0 kbytes
total ram: 4294968072 kbytes
duplicate: 1056844269 pages
skipped: 0 pages
normal: 16904683 pages
normal bytes: 67618732 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 67919974 kbytes
pages-per-second: 3477766
precopy ram: 9288715 kbytes
downtime ram: 2 kbytes

 44.27%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
  10.21%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   6.58%  live_migration   qemu-system-x86_64       [.] add_to_iovec
   4.25%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.70%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
   2.43%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   2.34%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   1.59%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
   1.30%  live_migration   qemu-system-x86_64       [.] find_next_bit
   1.08%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   0.98%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   0.78%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.74%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.70%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.68%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.67%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.66%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.66%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.64%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.62%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.61%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
   0.56%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.55%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.54%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.52%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.52%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.52%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.51%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.49%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.45%  live_migration   qemu-system-x86_64       [.] qemu_put_byte
   0.42%  live_migration   qemu-system-x86_64       [.] save_page_header
   0.41%  live_migration   qemu-system-x86_64       [.] qemu_put_be64
   0.35%  live_migration   qemu-system-x86_64       [.] migrate_postcopy_ram

zero_page

Migration status: completed
total time: 215567 ms
downtime: 500 ms
setup: 1040 ms
transferred ram: 3587151463 kbytes
throughput: 136980.19 mbps
remaining ram: 0 kbytes
total ram: 4294968072 kbytes
duplicate: 1048466740 pages
skipped: 0 pages
normal: 16747893 pages
normal bytes: 66991572 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 3587151430 kbytes
pages-per-second: 4104960
precopy ram: 3583004863 kbytes
downtime ram: 4146599 kbytes

 15.49%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   3.20%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   2.67%  live_migration   qemu-system-x86_64       [.] multifd_queue_page
   2.33%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   2.19%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   1.19%  live_migration   qemu-system-x86_64       [.] find_next_bit
   1.18%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
   1.14%  live_migration   qemu-system-x86_64       [.] multifd_send_pages
   1.02%  multifdsend_10   qemu-system-x86_64       [.] buffer_zero_avx512
   1.01%  multifdsend_9    qemu-system-x86_64       [.] buffer_zero_avx512
   1.01%  multifdsend_8    qemu-system-x86_64       [.] buffer_zero_avx512
   1.00%  multifdsend_5    qemu-system-x86_64       [.] buffer_zero_avx512
   1.00%  multifdsend_3    qemu-system-x86_64       [.] buffer_zero_avx512
   1.00%  multifdsend_15   qemu-system-x86_64       [.] buffer_zero_avx512
   0.99%  multifdsend_2    qemu-system-x86_64       [.] buffer_zero_avx512
   0.99%  multifdsend_6    qemu-system-x86_64       [.] buffer_zero_avx512
   0.99%  multifdsend_14   qemu-system-x86_64       [.] buffer_zero_avx512
   0.99%  multifdsend_0    qemu-system-x86_64       [.] buffer_zero_avx512
   0.98%  multifdsend_13   qemu-system-x86_64       [.] buffer_zero_avx512
   0.97%  multifdsend_1    qemu-system-x86_64       [.] buffer_zero_avx512
   0.97%  multifdsend_7    qemu-system-x86_64       [.] buffer_zero_avx512
   0.96%  live_migration   [kernel.kallsyms]        [k] futex_wake
   0.96%  multifdsend_11   qemu-system-x86_64       [.] buffer_zero_avx512
   0.93%  multifdsend_4    qemu-system-x86_64       [.] buffer_zero_avx512
   0.88%  multifdsend_12   qemu-system-x86_64       [.] buffer_zero_avx512
   0.81%  live_migration   [kernel.kallsyms]        [k] send_call_function_single_ipi
   0.71%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
   0.63%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string

4TB dirty + idle

    mig_mon mm_dirty -m 3900000 -p once

upstream

Migration status: completed
total time: 357581 ms
downtime: 553 ms
setup: 1295 ms
transferred ram: 4080035248 kbytes
throughput: 93811.30 mbps
remaining ram: 0 kbytes
total ram: 4294968072 kbytes
duplicate: 56507728 pages
skipped: 0 pages
normal: 1017239053 pages
normal bytes: 4068956212 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 4079538545 kbytes
pages-per-second: 3610116
precopy ram: 496701 kbytes
downtime ram: 2 kbytes

   5.07%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
   4.99%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.99%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.97%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.96%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.95%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.91%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.65%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.56%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.33%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.16%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.83%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.79%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.75%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.73%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.58%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   0.95%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   0.88%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
   0.36%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
   0.32%  multifdsend_4    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.30%  multifdsend_5    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.30%  multifdsend_2    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.30%  multifdsend_0    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.30%  multifdsend_9    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.30%  multifdsend_7    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.30%  multifdsend_10   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.26%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
   0.22%  multifdsend_8    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.22%  multifdsend_11   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.19%  multifdsend_13   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.19%  multifdsend_3    [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.17%  multifdsend_12   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.15%  multifdsend_14   [kernel.kallsyms]        [k] tcp_sendmsg_locked
   0.14%  multifdsend_10   [kernel.kallsyms]        [k] _copy_from_iter

zero_page

Migration status: completed
total time: 317428 ms
downtime: 744 ms
setup: 1192 ms
transferred ram: 4340691359 kbytes
throughput: 112444.34 mbps
remaining ram: 0 kbytes
total ram: 4294968072 kbytes
duplicate: 55993692 pages
normal: 1005801180 pages
normal bytes: 4023204720 kbytes
dirty sync count: 3
page size: 4 kbytes
multifd bytes: 4340691312 kbytes
pages-per-second: 3417846
precopy ram: 4336921795 kbytes
downtime ram: 3769564 kbytes

  4.38%  multifdsend_5    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.38%  multifdsend_10   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.37%  multifdsend_11   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.34%  multifdsend_3    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.29%  multifdsend_4    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.28%  multifdsend_9    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.27%  multifdsend_12   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.26%  multifdsend_1    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.23%  multifdsend_13   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.18%  multifdsend_6    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   4.18%  multifdsend_2    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.90%  multifdsend_0    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.86%  multifdsend_14   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.84%  multifdsend_7    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.73%  multifdsend_8    [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   3.73%  multifdsend_15   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
   1.59%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   1.45%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt
   1.28%  live_migration   libc.so.6                [.] __pthread_mutex_lock
   1.02%  multifdsend_8    [kernel.kallsyms]        [k] copy_page
   0.96%  multifdsend_15   [kernel.kallsyms]        [k] copy_page
   0.83%  multifdsend_14   [kernel.kallsyms]        [k] copy_page
   0.81%  multifdsend_7    [kernel.kallsyms]        [k] copy_page
   0.75%  multifdsend_0    [kernel.kallsyms]        [k] copy_page
   0.69%  live_migration   qemu-system-x86_64       [.] multifd_send_pages
   0.48%  live_migration   qemu-system-x86_64       [.] qemu_mutex_unlock_impl
   0.48%  live_migration   qemu-system-x86_64       [.] qemu_mutex_lock_impl

[v5]

In this version:
- Rebase to latest
- Address all comments
- statistics about zero pages are right now (or at least much better than before)
- changed how we calculate the amount of transferred ram
- numbers, who don't like numbers.

Everything has been checked with a guest launched like the following
command.  Migration is running through localhost.  Will send numbers
with real hardware as soon as I get access to the machines that have
it (I checked with previous versions already, but not this one).

[removed example]

Please review, Juan.

[v4]
In this version
- Rebase to latest
- Address all comments from previous versions
- code cleanup

Please review.

[v2]
This is a rebase against last master.

And the reason for resend is to configure properly git-publish and
hope this time that git-publish send all the patches.

Please, review.

[v1]
Since Friday version:
- More cleanups on the code
- Remove repeated calls to qemu_target_page_size()
- Establish normal pages and zero pages
- detect zero pages on the multifd threads
- send zero pages through the multifd channels.
- reviews by Richard addressed.

It pases migration-test, so it should be perfect O:+)

ToDo for next version:
- check the version changes
  I need that 6.2 is out to check for 7.0.
  This code don't exist at all due to that reason.
- Send measurements of the differences

Please, review.

[

Friday version that just created a single writev instead of
write+writev.

]

Right now, multifd does a write() for the header and a writev() for
each group of pages.  Simplify it so we send the header as another
member of the IOV.

Once there, I got several simplifications:
* is_zero_range() was used only once, just use its body.
* same with is_zero_page().
* Be consintent and use offset insed the ramblock everywhere.
* Now that we have the offsets of the ramblock, we can drop the iov.
* Now that nothing uses iov's except NOCOMP method, move the iovs
  from pages to methods.
* Now we can use iov's with a single field for zlib/zstd.
* send_write() method is the same in all the implementaitons, so use
  it directly.
* Now, we can use a single writev() to write everything.

ToDo: Move zero page detection to the multifd thrteads.

With RAM in the Terabytes size, the detection of the zero page takes
too much time on the main thread.

Last patch on the series removes the detection of zero pages in the
main thread for multifd.  In the next series post, I will add how to
detect the zero pages and send them on multifd channels.

Please review.

Later, Juan.

Juan Quintela (12):
  multifd: Create page_size fields into both MultiFD{Recv,Send}Params
  multifd: Create page_count fields into both MultiFD{Recv,Send}Params
  migration: Export ram_transferred_ram()
  multifd: Count the number of bytes sent correctly
  migration: Make ram_save_target_page() a pointer
  multifd: Make flags field thread local
  multifd: Prepare to send a packet without the mutex held
  multifd: Add capability to enable/disable zero_page
  migration: Export ram_release_page()
  multifd: Support for zero pages transmission
  multifd: Zero pages transmission
  So we use multifd to transmit zero pages.

 qapi/migration.json      |   8 ++-
 migration/migration.h    |   1 +
 migration/multifd.h      |  44 ++++++++++--
 migration/ram.h          |   3 +
 hw/core/machine.c        |   1 +
 migration/migration.c    |  14 +++-
 migration/multifd-zlib.c |  14 ++--
 migration/multifd-zstd.c |  12 ++--
 migration/multifd.c      | 140 ++++++++++++++++++++++++++++-----------
 migration/ram.c          |  50 +++++++++++---
 migration/trace-events   |   8 +--
 11 files changed, 221 insertions(+), 74 deletions(-)

-- 
2.37.1


