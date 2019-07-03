Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E565E27B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 13:04:55 +0200 (CEST)
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hid4I-0003o3-DF
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 07:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59728)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1hid0q-0000Sz-Ln
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:01:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1hid0o-0004T4-Ki
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:01:20 -0400
Received: from relay.sw.ru ([185.231.240.75]:59416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1hid0V-0003oM-4G; Wed, 03 Jul 2019 07:00:59 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1hid0O-0004EW-Nw; Wed, 03 Jul 2019 14:00:53 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: kwolf@redhat.com, mreitz@redhat.com, eblake@redhat.com, armbru@redhat.com
Date: Wed,  3 Jul 2019 14:00:41 +0300
Message-Id: <20190703110044.25610-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v1 0/3] add zstd cluster compression
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
Cc: vsementsov@virtuozzo.com, den@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

change log:

v1:
    * extend qcow2 header instead of adding a new incompatible extension header
      specification re-written accordingly
    * enable zstd compression via config
    * fix zstd (de)compression functions
    * fix comments/description
    * fix function naming

---
The goal of the patch-set is to enable qcow2 to use zstd compression for
clusters. ZSTD provides better (de)compression performance than currently
used ZLIB. Using it will improve perforamnce (reduce compression time)
when the compressed clusters is used, e.g backup scenarios.

Also, the patch-set extends qcow2 specification by adding compression_type
feature. The feature enables adding ZSTD and another compression algorithms
in the future.

Here is some measurements ZSTD vs ZLIB:

The test:
    Test compresses and decompresses qemu qcow2 image with just
    installed rhel-7.6 guest.
    Image cluster size: 64K. Image on disk size: 2.2G
    
    The test was conducted with brd disk to reduce the influence
    of disk subsystem to the test results.
    The results is given in seconds.
    
    compress cmd:
      time ./qemu-img convert -O qcow2 -c -o compression_type=[zlib|zstd]
                      src.img [zlib|zstd]_compressed.img
    decompress cmd
      time ./qemu-img convert -O qcow2
                      [zlib|zstd]_compressed.img uncompressed.img


The results:    
               compression               decompression
             zlib       zstd           zlib         zstd
    ------------------------------------------------------------
    real     65.5       16.3 (-75 %)    1.9          1.6 (-16 %)
    user     65.0       15.8            5.3          2.5
    sys       3.3        0.2            2.0          2.0
    
    Both ZLIB and ZSTD gave the same compression ratio: ~1.5
    compressed image size in both cases: ~1.4G

Denis Plotnikov (3):
  qcow2: introduce compression type feature
  qcow2: rework the cluster compression routine
  qcow2: add zstd cluster compression

 block/qcow2.c             | 283 +++++++++++++++++++++++++++++++++++---
 block/qcow2.h             |  26 +++-
 configure                 |  32 +++++
 docs/interop/qcow2.txt    |  22 ++-
 include/block/block_int.h |   1 +
 qapi/block-core.json      |  23 +++-
 6 files changed, 357 insertions(+), 30 deletions(-)

-- 
2.17.0


