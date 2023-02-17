Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459769B245
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:18:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5JO-0000lS-Bp; Fri, 17 Feb 2023 13:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pT5JM-0000kC-3B
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:18:20 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pT5JJ-0003d3-IX
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:18:19 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PJKgR5mmrz6J682;
 Sat, 18 Feb 2023 02:13:23 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 17 Feb 2023 18:18:02 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mike Maslenkin <mike.maslenkin@gmail.com>, Markus
 Armbruster <armbru@redhat.com>, Dave Jiang <dave.jiang@intel.com>,
 <alison.schofield@intel.com>
Subject: [PATCH 0/6] hw/cxl: Poison get, inject, clear
Date: Fri, 17 Feb 2023 18:18:06 +0000
Message-ID: <20230217181812.26995-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
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

Note Alison has stated the kernel series will be post 6.3 material
so this one isn't quite as urgent as the patches it is based on.
However I think this series in a good state (plus I have lots more queued
behind it) hence promoting it from RFC.

Changes since RFC v2: Thanks to Markus for review.
 - Improve documentation for QMP interface
 - Add better description of baseline series
 - Include precursor refactors around ret_code / CXLRetCode as this is now
   the first series in suggeste merge order to rely on those.
 - Include Ira's cxl_device_get_timestamp() function as it was better than
   the equivalent in the RFC.

Based on following series (in order)
1. [PATCH v4 00/10] hw/cxl: CXL emulation cleanups and minor fixes for upstream
2. [PATCH v4 0/8] hw/cxl: RAS error emulation and injection
3. [PATCH 0/2] hw/cxl: Passthrough HDM decoder emulation
4. [PATCH v2 0/2] hw/mem: CXL Type-3 Volatile Memory Support

Based on: Message-Id: 20230206172816.8201-1-Jonathan.Cameron@huawei.com
Based-on: Message-id: 20230217172924.25239-1-Jonathan.Cameron@huawei.com
Based-on: Message-id: 20230125152703.9928-1-Jonathan.Cameron@huawei.com
Based-on: Message-id: 20230217175657.26632-1-Jonathan.Cameron@huawei.com

The series supports:
1) Injection of variable length poison regions via QMP (to fake real
   memory corruption and ensure we deal with odd overflow corner cases
   such as clearing the middle of a large region making the list overflow
   as we go from one long entry to two smaller entries.
2) Read of poison list via the CXL mailbox.
3) Injection via the poison injection mailbox command (limited to 64 byte
   entries)
4) Clearing of poison injected via either method.

The implementation is meant to be a valid combination of impdef choices
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

Kernel patches:
 [PATCH v6 0/6] CXL Poison List Retrieval & Tracing
 Message-id: cover.1675983077.git.alison.schofield@intel.com
 [PATCH v2 0/6] cxl: CXL Inject & Clear Poison
 cover.1674101475.git.alison.schofield@intel.com


Ira Weiny (1):
  hw/cxl: Introduce cxl_device_get_timestamp() utility function

Jonathan Cameron (5):
  hw/cxl: Move enum ret_code definition to cxl_device.h
  hw/cxl: rename mailbox return code type from ret_code to CXLRetCode
  hw/cxl: QMP based poison injection support
  hw/cxl: Add poison injection via the mailbox.
  hw/cxl: Add clear poison mailbox command support.

 hw/cxl/cxl-device-utils.c   |  15 ++
 hw/cxl/cxl-mailbox-utils.c  | 300 +++++++++++++++++++++++++++---------
 hw/mem/cxl_type3.c          |  92 +++++++++++
 hw/mem/cxl_type3_stubs.c    |   3 +
 hw/mem/meson.build          |   2 +
 include/hw/cxl/cxl_device.h |  51 ++++++
 qapi/cxl.json               |  16 ++
 7 files changed, 410 insertions(+), 69 deletions(-)

-- 
2.37.2


