Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99172479200
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 17:54:41 +0100 (CET)
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myGVD-0003Ok-P3
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 11:54:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myGTK-0001v4-BL
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:52:43 -0500
Received: from relay68.bu.edu ([128.197.228.73]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myGTH-00010w-HD
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:52:40 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1BHGpiVj031791
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 17 Dec 2021 11:51:47 -0500
Date: Fri, 17 Dec 2021 11:51:44 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
Message-ID: <20211217165144.52tqann2nkn65lwx@mozz.bu.edu>
References: <20211217030858.834822-1-alxndr@bu.edu>
 <380ea0e5-a006-c570-4ec8-d67e837547ee@redhat.com>
 <20211217143045.x6ct3dwhc7vmery6@mozz.bu.edu>
 <9ba126ef-8381-bdd1-5866-0e5a05aa5d17@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ba126ef-8381-bdd1-5866-0e5a05aa5d17@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211217 1625, Philippe Mathieu-Daudé wrote:
> On 12/17/21 15:30, Alexander Bulekov wrote:
> > On 211217 1458, Philippe Mathieu-Daudé wrote:
> >> On 12/17/21 04:08, Alexander Bulekov wrote:
> >>> Here's my shot at fixing dma-reentracy issues. This patch adds a flag to
> >>> the DeviceState, which is set/checked when we call an accessor
> >>> associated with the device's IO MRs.
> >>
> >> Your approach is exactly what Gerd suggested:
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg831437.html
> > 
> > Yes - my bad for not searching my mail more carefully.
> 
> Well it is not "exactly" the same, but almost.
> 
> >>
> >>> The problem, in short, as I understand it: For the vast majority of
> >>> cases, we want to prevent a device from accessing it's own PIO/MMIO
> >>> regions over DMA.
> >>>
> >>> This patch/solution is based on some assumptions:
> >>> 1. DMA accesses that hit mmio regions are only dangerous if they end up
> >>> interacting with memory-regions belonging to the device initiating the
> >>> DMA.
> >>> Not dangerous:  sdhci_pio->dma_write->e1000_mmio
> >>> Dangerous:      sdhci_pio->dma_write->sdhci_mmio
> >>
> >> It doesn't have to be dangerous, see Paolo's example which
> >> invalidated my previous attempt and forced me to write 24
> >> patches in multiples series to keep the "niche" cases working:
> >> https://www.mail-archive.com/qemu-block@nongnu.org/msg72939.html
> > 
> > I don't understand what IO accesses this decodes to. This is loading a
> > picture into VRAM?
> 
> I'd say "loading a picture into VRAM via the DMA" but am not sure :)
> 
> This link is helpful:
> http://petesqbsite.com/sections/tutorials/tutorials/peekpoke.txt
>

https://github.com/microsoft/GW-BASIC/blob/edf82c2ebf6bfe099c2054e0ae125c3efe5769c4/GIO86.ASM#L333

AFAICT this would just do repeated MMIO writes to VRAM - no DMA
involved?

Maybe there is some way to log when a device performs a DMA access to
it's own IO regions, so that we could identify these niche cases? We
would still need a way to actually trigger that behavior...

