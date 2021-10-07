Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7047942516A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:46:01 +0200 (CEST)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQuW-000833-DM
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYQsP-0005uF-N7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:43:49 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYQsN-0002SW-OW
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:43:49 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HQ7Df5snvzWk95;
 Thu,  7 Oct 2021 18:42:10 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:43:40 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 18:43:39 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/3] Improve scalability of the SMP related Docs
Date: Thu, 7 Oct 2021 18:43:34 +0800
Message-ID: <20211007104337.10232-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The motivation of this series is to improve the scalability of SMP
related Docs, so that we can easily/clearly extend them without making
confusion when we plan to introduce more target specific CPU topology
members (e.g. CPU cluster in Arm and CPU drawer/book in s390).

With more and more target specific CPU topology members introduced,
it may not be a good method any longer to put all the mixed parameters
into one single hierarchy and then describe the exact meaning of each
member in the Docs, which makes confusion for the reader. On the contrary,
it may be clearer to describe the currently supported sub-hierarchies
separately and better to list some examples in the Docs. For example,
for now we can describe "sockets/cores/threads" and "sockets/dies/cores/
threads" separately from the mixture of "sockets | dies | cores | threads",
and more sub-hierarchies can be described when new parameters are added.

Based on above consideration, correspondingly -smp docs in qemu-options,
comment of struct CpuTopology and SMP related comments in qapi/machine
are somehow rewritten.

Besides the maintainers, I also keep some people on Cc list who may be
interested in having a look at this. Comments welcome!

Thanks,
Yanan
.

Yanan Wang (3):
  qemu-options: Improve scalability of the -smp documentation
  include/hw/boards: Improve scalability of the CpuTopology comment
  qapi/machine.json: Improve scalability of the SMP related comments

 include/hw/boards.h | 26 +++++++++++--
 qapi/machine.json   | 47 ++++++++++++++++++-----
 qemu-options.hx     | 90 ++++++++++++++++++++++++++++++++++++---------
 3 files changed, 133 insertions(+), 30 deletions(-)

--
2.19.1


