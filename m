Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF71FCADD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 12:28:20 +0200 (CEST)
Received: from localhost ([::1]:58460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlVIp-0006BP-52
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 06:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@localhost>)
 id 1jlVGr-0004IP-F7; Wed, 17 Jun 2020 06:26:17 -0400
Received: from [114.255.249.163] (port=9998 helo=localhost)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@localhost>)
 id 1jlVGo-0007Oi-E3; Wed, 17 Jun 2020 06:26:17 -0400
Received: by localhost (Postfix, from userid 0)
 id 0EB451415D9; Wed, 17 Jun 2020 18:20:24 +0800 (CST)
From: Lin Ma <lma@suse.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/3] Add Support for GET LBA STATUS 16 command in scsi
 emulation
Date: Wed, 17 Jun 2020 18:20:16 +0800
Message-Id: <20200617102019.29652-1-lma@suse.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.255.249.163 (failed)
Received-SPF: none client-ip=114.255.249.163; envelope-from=root@localhost;
 helo=localhost
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 06:20:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: 68
X-Spam_score: 6.8
X-Spam_bar: ++++++
X-Spam_report: (6.8 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, HELO_LOCALHOST=3.828, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_ZBI=2.7, RCVD_IN_XBL=0.375, RDNS_NONE=0.793,
 SPF_NONE=0.001 autolearn=_AUTOLEARN
X-Spam_action: reject
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, Lin Ma <lma@suse.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2->v1:
Follow Claudio's suggestions and the docker test result, Fix the dereferencing
'void *' pointer issues and the coding style issues.


In this current design, The GET LBA STATUS parameter data only contains
an eight-byte header + one LBA status descriptor.

How to test:
host:~ # qemu-system-x86_64 \
...
-drive file=/vm0/disk0.raw,format=raw,if=none,id=drive0,discard=unmap \
-device scsi-hd,id=scsi0,drive=drive0 \
...


guest:~ # dd if=/dev/zero of=/dev/sda bs=512 seek=1024 count=256

guest:~ # sg_unmap -l 1024 -n 32 /dev/sda

guest:~ # sg_get_lba_status /dev/sda -l 1024
No indication of the completion condition
RTP=0
descriptor LBA: 0x0000000000000400  blocks: 32  deallocated

Lin Ma (3):
  block: Add bdrv_co_get_lba_status
  block: Add GET LBA STATUS support
  scsi-disk: Add support for the GET LBA STATUS 16 command

 block/block-backend.c          | 38 ++++++++++++++
 block/io.c                     | 43 ++++++++++++++++
 hw/scsi/scsi-disk.c            | 90 ++++++++++++++++++++++++++++++++++
 include/block/accounting.h     |  1 +
 include/block/block_int.h      |  5 ++
 include/scsi/constants.h       |  1 +
 include/sysemu/block-backend.h |  2 +
 7 files changed, 180 insertions(+)

-- 
2.26.0


