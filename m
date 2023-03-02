Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F66A78C5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 02:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXXYL-0007Cu-Ko; Wed, 01 Mar 2023 20:16:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alison.schofield@intel.com>)
 id 1pXXYG-0007Bj-92
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:16:08 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alison.schofield@intel.com>)
 id 1pXXYC-0000Sm-VQ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677719764; x=1709255764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2mML6RsAC6bvhaoPqiC+gUeN4bvwDP8JV8z6JOb9TL0=;
 b=ms/h4y9DcjMxWRXW6V3MU3tNcCstUWDYP1TG51R+Sq4zClMTG4INbW7W
 QmSBrBTaDCVnRNedH80RPnOAu+RKXImB5Ic31qx2TaWKEZfAKGIoIszjc
 LLBPHY/GkcRnhoRZ6ojJhzx+uq3/EbM3mV34l9c1kMDNF5GChNc5JeY19
 XBwbNUkIjmg2RQ9Y9u3bO2V2hJ13dewsCyPJzb7YhNmkxkScUBTvlrDiJ
 hukd5MeWGcg4JW171E5IvNSA0+m5uoaYmqOq0z1j1G4/4dntxMe4+sSfd
 Wwy5+A14xa2V9clAGdqLC9SLPseNh3PxFaD30WBmarv7o65YPpyC/cs9V w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="318381016"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="318381016"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:15:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798632692"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="798632692"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2)
 ([10.252.139.73])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:15:58 -0800
Date: Wed, 1 Mar 2023 17:15:56 -0800
From: Alison Schofield <alison.schofield@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Michael Tsirkin <mst@redhat.com>,
 Fan Ni <fan.ni@samsung.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v2 0/6] hw/cxl: Poison get, inject, clear
Message-ID: <Y//4zFIjBCN/Qlkz@aschofie-mobl2>
References: <20230227170311.20054-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227170311.20054-1-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=alison.schofield@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 27, 2023 at 05:03:05PM +0000, Jonathan Cameron wrote:

Hi Jonathan,
Can you share your repo with this support?  How about your qemu cmdline?
I'm more of a 'try it out' type of a reviewer for qemu changes.
Thanks,
Alison

> v2: Thanks to Ira for review and also to Philippe as some of the
>     changes follow through from comments on precusor series.
> 
> - Fixed a bunch of endian issues. Note that QEMU CXL suppport only currently
>   supports platforms that happen to be little endian so these are more
>   theoretical than bugs that can be triggered.
> - Improve handling over mailbox inject poison that overlaps with
>   qmp injected (which can be bigger).
> - Tighter checks on alignment.
> - Add 'Since' entries to qapi docs.
> - Drop the CXLRetCode move out of this series as it isn't needed for this.
>   Will appear in next series I post instead (Ira's event series)
> - Drag down the st24_le_p() patch from Ira's Event series so we can use
>   it in this series.
> 
> Note Alison has stated the kernel series will be post 6.3 material
> so this one isn't quite as urgent as the patches it is based on.
> However I think this series in a good state (plus I have lots more queued
> behind it) hence promoting it from RFC.
> 
> Changes since RFC v2: Thanks to Markus for review.
>  - Improve documentation for QMP interface
>  - Add better description of baseline series
>  - Include precursor refactors around ret_code / CXLRetCode as this is now
>    the first series in suggeste merge order to rely on those.
>  - Include Ira's cxl_device_get_timestamp() function as it was better than
>    the equivalent in the RFC.
> 
> Based on following series (in order)
> 1. [PATCH v4 00/10] hw/cxl: CXL emulation cleanups and minor fixes for upstream
> 2. [PATCH v6 0/8] hw/cxl: RAS error emulation and injection
> 3. [PATCH v2 0/2] hw/cxl: Passthrough HDM decoder emulation
> 4. [PATCH v4 0/2] hw/mem: CXL Type-3 Volatile Memory Support
> 
> Based on: Message-Id: 20230206172816.8201-1-Jonathan.Cameron@huawei.com
> Based-on: Message-id: 20230227112751.6101-1-Jonathan.Cameron@huawei.com
> Based-on: Message-id: 20230227153128.8164-1-Jonathan.Cameron@huawei.com
> Based-on: Message-id: 20230227163157.6621-1-Jonathan.Cameron@huawei.com
> 
> The series supports:
> 1) Injection of variable length poison regions via QMP (to fake real
>    memory corruption and ensure we deal with odd overflow corner cases
>    such as clearing the middle of a large region making the list overflow
>    as we go from one long entry to two smaller entries.
> 2) Read of poison list via the CXL mailbox.
> 3) Injection via the poison injection mailbox command (limited to 64 byte
>    entries)
> 4) Clearing of poison injected via either method.
> 
> The implementation is meant to be a valid combination of impdef choices
> based on what the spec allowed. There are a number of places where it could
> be made more sophisticated that we might consider in future:
> * Fusing adjacent poison entries if the types match.
> * Separate injection list and main poison list, to test out limits on
>   injected poison list being smaller than the main list.
> * Poison list overflow event (needs event log support in general)
> * Connecting up to the poison list error record generation (rather complex
>   and not needed for currently kernel handling testing).
> 
> As the kernel code is currently fairly simple, it is likely that the above
> does not yet matter but who knows what will turn up in future!
> 
> Kernel patches:
>  [PATCH v7 0/6] CXL Poison List Retrieval & Tracing
>  cover.1676685180.git.alison.schofield@intel.com
>  [PATCH v2 0/6] cxl: CXL Inject & Clear Poison
>  cover.1674101475.git.alison.schofield@intel.com
> 
> 
> Ira Weiny (2):
>   hw/cxl: Introduce cxl_device_get_timestamp() utility function
>   bswap: Add the ability to store to an unaligned 24 bit field
> 
> Jonathan Cameron (4):
>   hw/cxl: rename mailbox return code type from ret_code to CXLRetCode
>   hw/cxl: QMP based poison injection support
>   hw/cxl: Add poison injection via the mailbox.
>   hw/cxl: Add clear poison mailbox command support.
> 
>  hw/cxl/cxl-device-utils.c   |  15 ++
>  hw/cxl/cxl-mailbox-utils.c  | 285 ++++++++++++++++++++++++++++++------
>  hw/mem/cxl_type3.c          |  92 ++++++++++++
>  hw/mem/cxl_type3_stubs.c    |   6 +
>  include/hw/cxl/cxl_device.h |  23 +++
>  include/qemu/bswap.h        |  23 +++
>  qapi/cxl.json               |  18 +++
>  7 files changed, 420 insertions(+), 42 deletions(-)
> 
> -- 
> 2.37.2
> 

