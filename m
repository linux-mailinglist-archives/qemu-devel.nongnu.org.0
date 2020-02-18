Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E2162329
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 10:15:32 +0100 (CET)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3yyZ-000339-Cd
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 04:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j3yxO-0001Rf-QL
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:14:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j3yxN-0000uk-Oq
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:14:18 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:43354 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j3yxN-0000rz-Dd; Tue, 18 Feb 2020 04:14:17 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0F6BFCCF683006166240;
 Tue, 18 Feb 2020 17:14:08 +0800 (CST)
Received: from HGHY4C002233111.china.huawei.com (10.133.205.93) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Tue, 18 Feb 2020 17:13:58 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>, <jcmvbkbc@gmail.com>,
 <crwulff@gmail.com>, <marex@denx.de>, <edgar.iglesias@gmail.com>,
 <david@gibson.dropbear.id.au>
Subject: [PATCH 0/3]hw: Fixs memleak of fdevice tree blob
Date: Tue, 18 Feb 2020 17:11:51 +0800
Message-ID: <20200218091154.21696-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, pannengyuan@huawei.com,
 zhang.zhanghailiang@huawei.com, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

The device tree blob returned by load_device_tree is malloced.
We should free it after cpu_physical_memory_write().Otherwise,
if we repeatedly call 'system_reset',it will repeatedly load fdt,
so there are many memleaks.

Paolo Bonzini :
https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg00129.html

Pan Nengyuan:
https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg03594.html

After searching the device code, I found three similar issues.
This series fixes the last three.

Chen Qun (3):
  hw/nios2:fix leak of fdevice tree blob
  hw/ppc/virtex_ml507:fix leak of fdevice tree blob
  hw/xtensa/xtfpga:fix leak of fdevice tree blob

 hw/nios2/boot.c       | 1 +
 hw/ppc/virtex_ml507.c | 1 +
 hw/xtensa/xtfpga.c    | 1 +
 3 files changed, 3 insertions(+)

-- 
2.23.0



