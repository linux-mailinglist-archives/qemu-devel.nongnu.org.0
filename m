Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5F686407
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:17:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNA0V-0000pT-MN; Wed, 01 Feb 2023 05:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pN9yP-0000HY-Np
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:04:14 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pN9yD-0005Z3-Pj
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:04:04 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P6HXg365qz6J9pN;
 Wed,  1 Feb 2023 18:02:43 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 1 Feb 2023 10:03:46 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Alison Schofield
 <alison.schofield@intel.com>
Subject: [RFC PATCH v2 0/3] hw/cxl: Poison get, inject, clear
Date: Wed, 1 Feb 2023 10:03:47 +0000
Message-ID: <20230201100350.23263-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RFC mostly because we already have 4 CXL QEMU series waiting for review
ahead of this and I don't want to distract too much from those.

I posted an RFC of part of this series a long time back [1]. It's been more
or less entirely rewriten since then and gained support for mailbox based
injection and clearing (including writing the cacheline). Note that I still
don't check for poison on direct reads of memory. That may be added in future
but isn't really that useful for testing the kernel code - it will end up
being the same as injecting a Machine Check or equivalent for the Host
Physical Address in question.

The series supports:
1) Injection of variable length poison regions via QMP (to fake real
   memory corruption and ensure we deal with odd overflow corner cases
   such as clearing the middle of a large region making the list overflow
   as we go from one long entry to two smaller entries.
2) Read of poison list via the CXL mailbox.
3) Injection via the poison injection mailbox command (limited to 64 byte
   entries)
4) Clearing of poison injected via either method.

The implementation is meant to be a valid combination of imdef choices
based on what the spec allowed. There are a number of places where it could
be made more sophisticated that we might consider in future:
* Fusing adjacent poison entries if the types match.
* Separate injection list and main poison list, to test out limits on
  injected poison list being smaller than the main list.
* Poison list overflow event (needs event log support in general)
* Connecting up to the poison list error record generation (rather complex
  and not needed for currently kernel handling testing).

As the kernel code is currently fairly simple, it is likely that the above
does not yet matter but who knows what will turn up in future!

Tested against Alison's latest kernel patches.
https://lore.kernel.org/linux-cxl/cover.1674070170.git.alison.schofield@intel.com/
https://lore.kernel.org/linux-cxl/cover.1674101475.git.alison.schofield@intel.com/
and set timestamp patch
https://lore.kernel.org/linux-cxl/20230130151327.32415-1-Jonathan.Cameron@huawei.com/

[1] https://lore.kernel.org/linux-cxl/20220620162056.16790-1-Jonathan.Cameron@huawei.com/

Jonathan Cameron (3):
  hw/cxl: QMP based poison injection support
  hw/cxl: Add poison injection via the mailbox.
  hw/cxl: Add clear poison mailbox command support.

 hw/cxl/cxl-mailbox-utils.c  | 199 ++++++++++++++++++++++++++++++++++++
 hw/mem/cxl_type3.c          |  92 +++++++++++++++++
 hw/mem/cxl_type3_stubs.c    |   3 +
 hw/mem/meson.build          |   2 +
 include/hw/cxl/cxl_device.h |  21 ++++
 qapi/cxl.json               |  11 ++
 6 files changed, 328 insertions(+)

-- 
2.37.2


