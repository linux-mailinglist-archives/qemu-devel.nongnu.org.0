Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96924484C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:51:13 +0200 (CEST)
Received: from localhost ([::1]:54346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6XIm-00016j-MX
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1k6W9Y-0006XG-O7
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:37:37 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4189 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1k6W9V-00061y-Iz
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:37:36 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 735294796E7615F5F953
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 17:37:25 +0800 (CST)
Received: from opensource.huawei.com (10.175.100.152) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 14 Aug 2020 17:37:15 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 00/12] fix some error memleaks
Date: Fri, 14 Aug 2020 12:02:29 -0400
Message-ID: <20200814160241.7915-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.152]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:37:26
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kuhn.chenqun@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 zhang.zhanghailiang@huawei.com, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fix some Error/GError memleaks.

Pan Nengyuan (12):
  qga/channel-posix: Plug memory leak in ga_channel_write_all()
  hw/vfio/ap: Plug memleak in vfio_ap_get_group()
  elf2dmp/qemu_elf: Plug memleak in QEMU_Elf_init
  elf2dmp/pdb: Plug memleak in pdb_init_from_file
  target/i386/sev: Plug memleak in sev_read_file_base64
  ui/gtk-gl-area: Plug memleak in gd_gl_area_create_context()
  target/i386/cpu: Fix memleak in x86_cpu_class_check_missing_features
  migration/colo: Plug memleaks in colo_process_incoming_thread
  blockdev: Fix a memleak in drive_backup_prepare()
  block/file-posix: fix a possible undefined behavior
  vnc-auth-sasl: Plug memleak in vnc_socket_ip_addr_string
  test-util-sockets: Fix a memleak in test_socket_unix_abstract_good

 block/file-posix.c         | 2 +-
 blockdev.c                 | 1 +
 contrib/elf2dmp/pdb.c      | 1 +
 contrib/elf2dmp/qemu_elf.c | 1 +
 hw/vfio/ap.c               | 1 +
 migration/colo.c           | 2 ++
 qga/channel-posix.c        | 6 +++++-
 target/i386/cpu.c          | 1 +
 target/i386/sev.c          | 1 +
 tests/test-util-sockets.c  | 1 +
 ui/gtk-gl-area.c           | 5 ++---
 ui/vnc-auth-sasl.c         | 1 +
 12 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.18.2


