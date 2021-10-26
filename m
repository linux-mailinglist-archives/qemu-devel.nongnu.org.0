Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FA743AAD6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 05:48:48 +0200 (CEST)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfDSB-0003Dw-AM
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 23:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mfDQZ-0001Mf-46
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 23:47:07 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mfDQW-0002Gs-JP
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 23:47:06 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hdd6q3YH4z909T;
 Tue, 26 Oct 2021 11:46:59 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 11:47:01 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 11:47:01 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/2] hw/core/machine: Add an unit test for smp_parse
Date: Tue, 26 Oct 2021 11:46:57 +0800
Message-ID: <20211026034659.22040-1-wangyanan55@huawei.com>
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
 Eduardo Habkost <ehabkost@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is v3 which introduces an unit test for generic smp_parse.

We have had enough discussions about what kind of SMP configurations
by the user should be considered valid and what should be invalid.
Since we have finished optimizing the SMP parsing code, then this
test normatively listed all the possible valid/invalid configurations
that the user can provide. This can be a testing tool when we
introduce new topology members and need to touch the parsing code.

For your reference, some related discussion is here:
https://lore.kernel.org/qemu-devel/YOxf+sxzUSJdbY+j@redhat.com/

Changelog:
v2->v3:
- add Andrew's R-b for PATCH #1
- drop an unused macro definition in PATCH #2
- v2: https://lore.kernel.org/qemu-devel/20211013074119.23028-1-wangyanan55@huawei.com/

v1->v2:
- split smp_parse out into a separate .c file instead of a header (patch #1)
- dropped an unnecessary function and add Andrew's R-b (patch #2)
- v1: https://lore.kernel.org/qemu-devel/20211010103954.20644-1-wangyanan55@huawei.com/

Yanan Wang (2):
  hw/core/machine: Split out the smp parsing code
  tests/unit: Add an unit test for smp parsing

 MAINTAINERS                 |   2 +
 hw/core/machine-smp.c       | 181 +++++++++++
 hw/core/machine.c           | 159 ----------
 hw/core/meson.build         |   2 +
 include/hw/boards.h         |   1 +
 tests/unit/meson.build      |   1 +
 tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++
 7 files changed, 781 insertions(+), 159 deletions(-)
 create mode 100644 hw/core/machine-smp.c
 create mode 100644 tests/unit/test-smp-parse.c

--
2.19.1


