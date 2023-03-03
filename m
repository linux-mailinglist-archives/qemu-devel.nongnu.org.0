Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8486A9AA5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7LT-000102-QO; Fri, 03 Mar 2023 10:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pY7LL-0000zp-Ui
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:29:11 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pY7LJ-0001DQ-Er
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:29:11 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PSsJW3qsnz67PMg;
 Fri,  3 Mar 2023 23:26:35 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 15:29:03 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Alison Schofield <alison.schofield@intel.com>, Michael
 Roth <michael.roth@amd.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Eric Blake <eblake@redhat.com>, Mike Maslenkin
 <mike.maslenkin@gmail.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 0/7] QEMU CXL Provide mock CXL events and irq support
Date: Fri, 3 Mar 2023 15:28:56 +0000
Message-ID: <20230303152903.28103-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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

Whilst I'm an optimist, I suspect this is now 8.1 material because we have
5 CXL patch sets outstanding before it. Current bottleneck being QAPI review
for the RAS error series.

v4 changes: Thanks to Ira and to some feedback I received off list.
- More endian fixes for a future big endian architecture using it.
- Comment typo

One challenge here is striking the right balance between lots of constraints
in the injection code to enforce particular reserved bits etc by breaking
out all the flags as individual parameters vs having a reasonably concise
API.  I think this set strikes the right balance but others may well
disagree :)   Note that Ira raised the question of whether we should be
automatically establishing the volatile flag based on the Device Physical
Address of the injected error. My proposal is to not do so for now, but
to possibly revisit tightening the checking of injected errors in future.
Whilst the volatile flag is straight forwards, some of the other flags that
could be automatically set (or perhaps checked for validiaty) are much more
complex. Adding verification at this stage would greatly increase the
complexity of the patch + we are missing other elements that would interact
with this.  I'm not concerned about potential breaking of backwards compatibility
if it only related to the injection of errors that make no sense for a real
device.

Based on following series (in order)
1. [PATCH v4 00/10] hw/cxl: CXL emulation cleanups and minor fixes for upstream
(in staging currently so fingers crossed that one is fine)
2. [PATCH v6 0/8] hw/cxl: RAS error emulation and injection
3. [PATCH v2 0/2] hw/cxl: Passthrough HDM decoder emulation
4. [PATCH v4 0/2] hw/mem: CXL Type-3 Volatile Memory Support
5. [PATCH v4 0/6] hw/cxl: Poison get, inject, clear

Based on: Message-Id: 20230206172816.8201-1-Jonathan.Cameron@huawei.com
Based-on: Message-id: 20230227112751.6101-1-Jonathan.Cameron@huawei.com
Based-on: Message-id: 20230227153128.8164-1-Jonathan.Cameron@huawei.com
Based-on: Message-id: 20230227163157.6621-1-Jonathan.Cameron@huawei.com
Based-on: Message-id: 20230303150908.27889-1-Jonathan.Cameron@huawei.com

v2 cover letter.

CXL Event records inform the OS of various CXL device events.  Thus far CXL
memory devices are emulated and therefore don't naturally generate events.

Add an event infrastructure and mock event injection.  Previous versions
included a bulk insertion of lots of events.  However, this series focuses on
providing the ability to inject individual events through QMP.  Only the
General Media Event is included in this series as an example.  Other events can
be added pretty easily once the infrastructure is acceptable.

In addition, this version updates the code to be in line with the
specification based on discussions around the kernel patches.

Injection examples;

{ "execute": "cxl-inject-gen-media-event",
    "arguments": {
        "path": "/machine/peripheral/cxl-mem0",
        "log": "informational",
        "flags": 1,
        "physaddr": 1000,
        "descriptor": 3,
        "type": 3,
        "transaction-type": 192,
        "channel": 3,
        "device": 5,
        "component-id": "iras mem"
    }}


{ "execute": "cxl-inject-dram-event",
    "arguments": {
        "path": "/machine/peripheral/cxl-mem0",
        "log": "informational",
        "flags": 1,
        "physaddr": 1000,
        "descriptor": 3,
        "type": 3,
        "transaction-type": 192,
        "channel": 3,
        "rank": 17,
        "nibble-mask": 37421234,
        "bank-group": 7,
        "bank": 11,
        "row": 2,
        "column": 77,
        "correction-mask": [33, 44, 55, 66]
    }}

{ "execute": "cxl-inject-memory-module-event",
  "arguments": {
    "path": "/machine/peripheral/cxl-mem0",
    "log": "informational",
    "flags": 1,
    "type": 3,
    "health-status": 3,
    "media-status": 7,
    "additional-status": 33,
    "life-used": 30,
    "temperature": -15,
    "dirty-shutdown-count": 4,
    "corrected-volatile-error-count": 3233,
    "corrected-persistent-error-count": 1300
  }}


Ira Weiny (4):
  hw/cxl/events: Add event status register
  hw/cxl/events: Wire up get/clear event mailbox commands
  hw/cxl/events: Add event interrupt support
  hw/cxl/events: Add injection of General Media Events

Jonathan Cameron (3):
  hw/cxl: Move CXLRetCode definition to cxl_device.h
  hw/cxl/events: Add injection of DRAM events
  hw/cxl/events: Add injection of Memory Module Events

 hw/cxl/cxl-device-utils.c   |  43 +++++-
 hw/cxl/cxl-events.c         | 248 ++++++++++++++++++++++++++++++
 hw/cxl/cxl-mailbox-utils.c  | 166 ++++++++++++++------
 hw/cxl/meson.build          |   1 +
 hw/mem/cxl_type3.c          | 292 +++++++++++++++++++++++++++++++++++-
 hw/mem/cxl_type3_stubs.c    |  35 +++++
 include/hw/cxl/cxl_device.h |  80 +++++++++-
 include/hw/cxl/cxl_events.h | 168 +++++++++++++++++++++
 qapi/cxl.json               | 120 +++++++++++++++
 9 files changed, 1097 insertions(+), 56 deletions(-)
 create mode 100644 hw/cxl/cxl-events.c
 create mode 100644 include/hw/cxl/cxl_events.h

-- 
2.37.2


