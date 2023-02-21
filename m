Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76469E37C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:33:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUdq-000685-2f; Tue, 21 Feb 2023 10:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pUUdM-00061J-Qh
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:32:49 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pUUdI-0000uU-72
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:32:46 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PLjsq0q7bz6J9fJ;
 Tue, 21 Feb 2023 23:30:39 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 21 Feb
 2023 15:32:38 +0000
Date: Tue, 21 Feb 2023 15:32:37 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>,
 <linux-cxl@vger.kernel.org>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Mike Maslenkin
 <mike.maslenkin@gmail.com>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v3 0/2] hw/mem: CXL Type-3 Volatile Memory Support
Message-ID: <20230221153237.000068d0@huawei.com>
In-Reply-To: <20230221140023.9315-1-Jonathan.Cameron@huawei.com>
References: <20230221140023.9315-1-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
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

On Tue, 21 Feb 2023 14:00:21 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> v3: Noticed whilst chasing an unrelated kernel bug.
>  - Drop setting of DVSEC range base addresses.  Whilst harmless,
>    expectation is that this will be 0 until the OS sets it (or uses
>    HDM decoders instead)
> 
> Based on following series (in order)
> 1. [PATCH v4 00/10] hw/cxl: CXL emulation cleanups and minor fixes for upstream
> 2. [PATCH v4 0/8] hw/cxl: RAS error emulation and injection

I sent these in the wrong order. Now v5 (comment change and some tags)
Other series unchanged.

> 3. [PATCH 0/2] hw/cxl: Passthrough HDM decoder emulation
> 
> Based on: Message-Id: 20230206172816.8201-1-Jonathan.Cameron@huawei.com
> Based-on: Message-id: 20230217172924.25239-1-Jonathan.Cameron@huawei.com

Based-on: Message-id: 20230221152145.9736-1-Jonathan.Cameron@huawei.com

> Based-on: Message-id: 20230125152703.9928-1-Jonathan.Cameron@huawei.com
> 
> Kernel code is queued up in kernel.org cxl/next for the merge window
> that just opened.
> 
> Now we have some kernel code to test this against (and it looks good)
> I'd like to propose this series for upstream following 3 other series
> already proposed for inclusion:
> 
> Original cover letter with minor updates.
> 
> This patches provides 2 features to the CXL Type-3 Device:
>     1) Volatile Memory Region Support
>     2) Multi-Region support (1 Volatile, 1 Persistent)
> 
> Summary of Changes per-commit:
> 1) Whitespace updates to docs and tests
> 2) Refactor CDAT DSMAS Initialization for multi-region initialization
>    Multi-Region and Volatile Memory support for CXL Type-3 Devices
>    Test and Documentation updates
> 
> The final patch in this series makes 6 major changes to the type-3
> device in order to implement multi-region and volatile region support
>     1) The HostMemoryBackend [hostmem] has been replaced by two
>        [hostvmem] and [hostpmem] to store volatile and persistent memory
>        respectively
>     2) The single AddressSpace has been replaced by two AddressSpaces
>        [hostvmem_as] and [hostpmem_as] to map respective memdevs.
>     3) Each memory region size and total region are stored separately
>     4) The CDAT and DVSEC memory map entries have been updated:
>        a) if vmem is present, vmem is mapped at DPA(0)
>        b) if pmem is present
>           i)  and vmem is present, pmem is mapped at DPA(vmem->size)
>           ii) else, pmem is mapped at DPA(0)
>        c) partitioning of pmem is not supported in this patch set but
>           has been discussed and this design should suffice.
>     5) Read/Write functions have been updated to access AddressSpaces
>        according to the mapping described in #4.  Access to the
>        persistent address space is calculated by (dpa-vmem_len)
>     6) cxl-mailbox has been updated to report the respective size of
>        volatile and persistent memory region
> 
> 
> Gregory Price (2):
>   tests/qtest/cxl-test: whitespace, line ending cleanup
>   hw/cxl: Multi-Region CXL Type-3 Devices (Volatile and Persistent)
> 
>  docs/system/devices/cxl.rst    |  49 ++++--
>  hw/cxl/cxl-mailbox-utils.c     |  26 +--
>  hw/mem/cxl_type3.c             | 294 +++++++++++++++++++++++++--------
>  include/hw/cxl/cxl_device.h    |  11 +-
>  tests/qtest/bios-tables-test.c |   8 +-
>  tests/qtest/cxl-test.c         | 146 +++++++++++-----
>  6 files changed, 392 insertions(+), 142 deletions(-)
> 


