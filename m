Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639E942808E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 12:42:59 +0200 (CEST)
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZWID-0001t6-PZ
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 06:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mZWFx-0008FA-Rx
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 06:40:37 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mZWFv-0005rN-42
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 06:40:37 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HRyxd6Fgqz900H;
 Sun, 10 Oct 2021 18:35:33 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 10 Oct 2021 18:40:21 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 10 Oct 2021 18:40:20 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] hw/core/machine: An an unit test for smp_parse
Date: Sun, 10 Oct 2021 18:39:52 +0800
Message-ID: <20211010103954.20644-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series introduces an unit test for generic smp_parse().

We have had enough discussions about what kind of SMP configurations
by the user should be considered valid and what should be invalid.
Since we have finished optimizing the SMP parsing code, then this
test normatively listed all the possible valid/invalid configurations
that the user can provide. This can be a testing tool when we
introduce new topology members and need to touch the parsing code.

For your reference,
Some related discussion is here [1]:
[1] https://lore.kernel.org/qemu-devel/YOxf+sxzUSJdbY+j@redhat.com/

The originally posted test is here [2]:
[2] https://lore.kernel.org/qemu-devel/20210910073025.16480-17-wangyanan55@huawei.com/
Compared to [2], the test in this series is reworked and more brief.

Yanan Wang (2):
  hw/core/machine: Split out smp_parse as an inline API
  tests/unit: Add an unit test for smp parsing

 MAINTAINERS                 |   2 +
 hw/core/machine.c           | 160 +---------
 include/hw/core/smp.h       | 185 +++++++++++
 tests/unit/meson.build      |   1 +
 tests/unit/test-smp-parse.c | 613 ++++++++++++++++++++++++++++++++++++
 5 files changed, 802 insertions(+), 159 deletions(-)
 create mode 100644 include/hw/core/smp.h
 create mode 100644 tests/unit/test-smp-parse.c

-- 
2.19.1


