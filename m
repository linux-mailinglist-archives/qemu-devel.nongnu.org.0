Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80045198304
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 20:08:37 +0200 (CEST)
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIypw-0002lb-9o
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 14:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41541)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jIyp4-0002Bt-6W
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 14:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jIyp3-0000lh-86
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 14:07:42 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47084)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jIyp0-0000fS-Qn; Mon, 30 Mar 2020 14:07:38 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 15B6FBF720;
 Mon, 30 Mar 2020 18:07:36 +0000 (UTC)
Date: Mon, 30 Mar 2020 20:07:32 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RESEND v4] nvme: introduce PMR support from NVMe 1.4 spec
Message-ID: <20200330180732.towfrznvxovggzqk@apples.localdomain>
References: <20200330164656.9348-1-andrzej.jakowski@linux.intel.com>
 <20200330165518.GA8234@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200330165518.GA8234@redsun51.ssa.fujisawa.hgst.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: kwolf@redhat.com, haozhong.zhang@intel.com, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, dgilbert@redhat.com,
 qemu-devel@nongnu.org, yi.z.zhang@linux.intel.com,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, mreitz@redhat.com, junyan.he@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mar 31 01:55, Keith Busch wrote:
> On Mon, Mar 30, 2020 at 09:46:56AM -0700, Andrzej Jakowski wrote:
> > This patch introduces support for PMR that has been defined as part of NVMe 1.4
> > spec. User can now specify a pmrdev option that should point to HostMemoryBackend.
> > pmrdev memory region will subsequently be exposed as PCI BAR 2 in emulated NVMe
> > device. Guest OS can perform mmio read and writes to the PMR region that will stay
> > persistent across system reboot.
> 
> Looks pretty good to me.
> 
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> 
> For a possible future extention, it could be interesting to select the
> BAR for PMR dynamically, so that you could have CMB and PMR enabled on
> the same device.
> 

I thought about the same thing, but this would require disabling MSI-X
right? Otherwise there is not enough room. AFAIU, the iomem takes up
BAR0 and BAR1, CMB (or PMR) uses BAR2 and BAR3 and MSI-X uses BAR4 or 5.

