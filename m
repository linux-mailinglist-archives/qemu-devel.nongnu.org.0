Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D5537B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:15:45 +0200 (CEST)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfFH-0006Cg-1e
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nvfAV-0002oo-E0
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:10:47 -0400
Received: from relay68.bu.edu ([128.197.228.73]:44275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nvfAT-00087H-Gn
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:10:46 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 24UD9ivb005306
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 30 May 2022 09:09:47 -0400
Date: Mon, 30 May 2022 09:09:44 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 1/3] memory: Track whether a Device is engaged in IO
Message-ID: <20220530130944.27md44gr2yp7gx5i@mozz.bu.edu>
References: <20220527161937.328754-1-alxndr@bu.edu>
 <20220527161937.328754-2-alxndr@bu.edu>
 <CAFEAcA-PXO8ZGS_DA6E65MK2pvnnepbpA-vc_90xdARLj73=iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-PXO8ZGS_DA6E65MK2pvnnepbpA-vc_90xdARLj73=iA@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 220530 1219, Peter Maydell wrote:
> On Fri, 27 May 2022 at 17:19, Alexander Bulekov <alxndr@bu.edu> wrote:
> >
> > Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> > This flag should be set/checked prior to calling a device's MemoryRegion
> > handlers, and set when device code initiates DMA.  The purpose of this
> > flag is to prevent DMA reentrancy issues. E.g.:
> > sdhci pio -> dma write -> sdhci mmio
> > nvme bh -> dma write -> nvme mmio
> >
> > These issues have led to problems such as stack-exhaustion and
> > use-after-frees.
> >
> > Assumptions:
> >  * Devices do not interact with their own PIO/MMIO memory-regions using
> >    DMA.
> 
> If you're trying to protect against malicious guest-controlled
> DMA operations, you can't assume that. The guest can program
> a DMA controller to DMA to its own MMIO register bank if it likes.

If this is the case, then it seems the only way to fix this class of
problems is to rewrite device code so that it is safe for re-entrancy.
That seems to require significant upfront work to support behavior that
is often not even specified.
Simply spot-fixing the fuzzer re-entracy bugs seems like a dangerous,
incomplete solution.

Can we disable re-entracy by default, to fix the security issues, and
allow device code to "opt-in" to re-entrancy?

-Alex

> 
> >  * There is now way for there to be multiple simultaneous accesses to a
> >    device's PIO/MMIO memory-regions, or for multiple threads to perform
> >    DMA accesses simultaneously on behalf of a single device.
> 
> This one is generally true because device code runs with
> the iothread lock held.
> 
> -- PMM

