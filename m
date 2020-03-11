Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B95181CDD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:51:08 +0100 (CET)
Received: from localhost ([::1]:54640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3dT-0008Jl-00
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jC3aN-00039v-1E
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:47:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jC3aL-0001Y4-WF
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:47:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:13789)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jC3aL-0001Xc-N0; Wed, 11 Mar 2020 11:47:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 08:47:51 -0700
X-IronPort-AV: E=Sophos;i="5.70,541,1574150400"; d="scan'208";a="236490309"
Received: from ajakowsk-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.78.27.169])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 11 Mar 2020 08:47:51 -0700
Subject: Re: [PATCH RESEND v2] block/nvme: introduce PMR support from NVMe 1.4
 spec
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20200306223853.37958-1-andrzej.jakowski@linux.intel.com>
 <20200310095147.GC140737@stefanha-x1.localdomain>
 <15b8a77d-50de-2228-a0e6-a461b82f1873@linux.intel.com>
 <CAJSP0QXatOWgicLo5sGt9KA2QupC2qXD2LCdHWKgHFdzgt9pEg@mail.gmail.com>
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Message-ID: <3cab3101-6b83-e92b-39e3-6120944e039d@linux.intel.com>
Date: Wed, 11 Mar 2020 08:47:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAJSP0QXatOWgicLo5sGt9KA2QupC2qXD2LCdHWKgHFdzgt9pEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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
Cc: Kevin Wolf <kwolf@redhat.com>, Haozhong Zhang <haozhong.zhang@intel.com>,
 qemu block <qemu-block@nongnu.org>, Dave Gilbert <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Zhang Yi <yi.z.zhang@linux.intel.com>, "He,
 Junyan" <junyan.he@intel.com>, kbusch@kernel.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/20 2:20 AM, Stefan Hajnoczi wrote:
> Oh, I think I see what you mean.  That is not how the term
> "preallocated" is usually used in POSIX file systems.  File systems
> have sparse files by default and the term preallocation is used in the
> context of fadvise(2) for reserving space.
> 
> In this case I think you're saying the file cannot grow.  That is
> implicit since the BAR can't grow either so you could drop the comment
> about preallocation.

Yes, there is no need to have file preallocated in POSIX meaning. Actaul
requirement is to have file that is multiple of MiB and power-of-two in size.
User may (but may not need to) use fallocate/fadvise to fulfill this 
requirement.

