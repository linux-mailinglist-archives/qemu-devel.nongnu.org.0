Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48119D21B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 10:25:58 +0200 (CEST)
Received: from localhost ([::1]:52012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKHeC-0003ZF-DF
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 04:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45453)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jKHdK-0002uB-S2
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:24:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jKHdJ-0007jZ-IR
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:24:58 -0400
Received: from mga04.intel.com ([192.55.52.120]:46380)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jKHdJ-0007iM-9l
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 04:24:57 -0400
IronPort-SDR: lP/4bFlTHw4TMOOZWEZqdXGv3G8tO62a0QpNQ3/COGCWlgcjdMjxVW+LKeimIHdPOsZ/v4cFXN
 epkc8s1YFOlA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 01:24:55 -0700
IronPort-SDR: kVGBvT13BcLzlgElSuESf8JzJmRVuonZONg6Lk0vEUdCeGV6lwyY/JLmN2ms/6R3J0dJrZBd18
 xN2Ng0MQQHHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="423452394"
Received: from unknown (HELO joy-OptiPlex-7040) ([10.239.13.16])
 by orsmga005.jf.intel.com with ESMTP; 03 Apr 2020 01:24:53 -0700
Date: Fri, 3 Apr 2020 04:15:19 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 0/3] drop writes to read-only ram device & vfio regions
Message-ID: <20200403081519.GA31607@joy-OptiPlex-7040>
References: <20200403165657.20566-1-yan.y.zhao@intel.com>
 <20200403170823.20805-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403170823.20805-1-yan.y.zhao@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.120
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot the changelog, so sent this patch 0/3 again.
sorry about that.

On Sat, Apr 04, 2020 at 01:08:23AM +0800, Zhao, Yan Y wrote:
> patch 1 modifies handler of ram device memory regions to drop guest writes
> to read-only ram device memory regions
> 
> patch 2 modifies handler of non-mmap'd read-only vfio regions to drop guest
> writes to those regions 
> 
> patch 3 let mmap'd read-only vfio regions be able to generate vmexit for
> guest write. so, without patch 1, host qemu would crash on guest write to
> this read-only region. with patch 1, host qemu would drop the writes.
> 
> Changelog:
> v2:
> -split one big patches into smaller ones (Philippe)
> -modify existing trace to record guest writes to read-only memory (Alex)
> -modify vfio_region_write() to drop guest writes to non-mmap'd read-only
>  region (Alex)
> 
> Yan Zhao (3):
>   memory: drop guest writes to read-only ram device regions
>   hw/vfio: drop guest writes to ro regions
>   hw/vfio: let read-only flag take effect for mmap'd regions
> 
>  hw/vfio/common.c     | 12 +++++++++++-
>  hw/vfio/trace-events |  2 +-
>  memory.c             |  6 +++++-
>  trace-events         |  2 +-
>  4 files changed, 18 insertions(+), 4 deletions(-)
> 
> -- 
> 2.17.1
> 

