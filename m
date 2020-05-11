Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D91CD084
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 05:52:42 +0200 (CEST)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXzUe-0005QH-L3
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 23:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jXzTw-0004zz-4E
 for qemu-devel@nongnu.org; Sun, 10 May 2020 23:51:56 -0400
Received: from relay64.bu.edu ([128.197.228.104]:58512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jXzTt-000682-Ni
 for qemu-devel@nongnu.org; Sun, 10 May 2020 23:51:55 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 04B3pZNV027134
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 10 May 2020 23:51:39 -0400
Date: Sun, 10 May 2020 23:51:35 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Assertion failure through vring_split_desc_read
Message-ID: <20200511035124.v2ff4f5gyfh6xlgc@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 23:01:23
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,
While fuzzing, I found an input that triggers an assertion failure
through virtio-rng -> vring_split_desc_read. Maybe this is related to:
Message-ID: <20200511033001.dzvtbdhl3oz5pgiy@mozz.bu.edu> 
Assertion failure through virtio_lduw_phys_cached

#8 0x7fe6a9acf091 in __assert_fail /build/glibc-GwnBeO/glibc-2.30/assert/assert.c:101:3
#9 0x564cbe7d96fd in address_space_read_cached include/exec/memory.h:2423:5
#10 0x564cbe7e79c5 in vring_split_desc_read hw/virtio/virtio.c:236:5
#11 0x564cbe7e84ce in virtqueue_split_read_next_desc hw/virtio/virtio.c:929:5
#12 0x564cbe78f86b in virtqueue_split_get_avail_bytes hw/virtio/virtio.c:1009:18
#13 0x564cbe78ab22 in virtqueue_get_avail_bytes hw/virtio/virtio.c:1208:9
#14 0x564cc08aade1 in get_request_size hw/virtio/virtio-rng.c:40:5
#15 0x564cc08aa20b in virtio_rng_process hw/virtio/virtio-rng.c:115:12
#16 0x564cc08a8c48 in virtio_rng_set_status hw/virtio/virtio-rng.c:172:5
#17 0x564cbe7a50be in virtio_set_status hw/virtio/virtio.c:1876:9
#18 0x564cc08d1b8f in virtio_pci_common_write hw/virtio/virtio-pci.c:1245:9

I can reproduce it in a qemu 5.0 build using these qtest commands:
https://paste.debian.net/plain/1146089
(not including them here, as some are quite long)

wget https://paste.debian.net/plain/1146089 -O qtest-trace; ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -M pc-q35-5.0  -device virtio-rng-pci,addr=04.0 -display none -nodefaults -nographic -qtest stdio < qtest-trace

Please let me know if I can provide any further info.
-Alex

