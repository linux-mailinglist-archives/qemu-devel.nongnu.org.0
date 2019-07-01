Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16F72221A
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 09:36:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRttY-0003K4-JM
	for lists+qemu-devel@lfdr.de; Sat, 18 May 2019 03:36:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hRtsV-0002rq-1J
	for qemu-devel@nongnu.org; Sat, 18 May 2019 03:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hRtsT-0004M4-TA
	for qemu-devel@nongnu.org; Sat, 18 May 2019 03:35:35 -0400
Received: from charlie.dont.surf ([128.199.63.193]:43016)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <klaus@birkelund.eu>)
	id 1hRtnb-00036W-GC; Sat, 18 May 2019 03:30:31 -0400
Received: from apples.localdomain (ip-5-186-120-196.cgn.fibianet.dk
	[5.186.120.196])
	by charlie.dont.surf (Postfix) with ESMTPSA id 997FEBF659;
	Sat, 18 May 2019 07:30:28 +0000 (UTC)
Date: Sat, 18 May 2019 09:30:25 +0200
From: Klaus Birkelund <klaus@birkelund.eu>
To: "Heitke, Kenneth" <kenneth.heitke@intel.com>
Message-ID: <20190518073024.GA16611@apples.localdomain>
Mail-Followup-To: "Heitke, Kenneth" <kenneth.heitke@intel.com>,
	qemu-block@nongnu.org, keith.busch@intel.com, kwolf@redhat.com,
	qemu-devel@nongnu.org, mreitz@redhat.com
References: <20190405214117.1850-1-kenneth.heitke@intel.com>
	<20190514060225.GA1350@apples.localdomain>
	<1f607df5-b523-e517-c439-392725fd441b@intel.com>
	<20190517053504.GA17341@apples.localdomain>
	<20190517062442.GB17341@apples.localdomain>
	<78248b8b-2684-409a-1e33-77b4c0907cd6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78248b8b-2684-409a-1e33-77b4c0907cd6@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] nvme: add Get/Set Feature
 Timestamp support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: keith.busch@intel.com, kwolf@redhat.com, qemu-devel@nongnu.org,
	qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 17, 2019 at 07:49:18PM -0600, Heitke, Kenneth wrote:
> > > > > > +        if (qemu_iovec_from_buf(&iov, 0, ptr, len) != len) {
> > > > > 
> > > > > This should be `qemu_iovec_to_buf`.
> > > > > 
> > > > 
> > > > This function is transferring data from the "host" to the device so I
> > > > believe I am using the correct function.
> > > > 
> > > 
> > > Exactly, but this means that you need to populate `ptr` with data
> > > described by the prps, hence dma_buf_*write* and qemu_iovec_*to*_buf. In
> > > this case `ptr` is set to the address of the uint64_t timestamp, and
> > > that is what we need to write to.
> > > 
> > 
> > I was going to argue with the fact that nvme_dma_read_prp uses
> > qemu_iovec_from_buf. But it uses _to_buf which as far as I can tell is
> > also wrong.
> > 
> 
> Okay, I'm onboard. You're correct. I'll update my patch and re-submit. I can
> also submit a patch to fix nvme_dma_read_prp() unless you or someone else
> wants to.
> 

Hi Kenneth,

The `nvme_dma_read_prp` case is actually already fixed in one of the
patches I sent yesterday ("nvme: simplify PRP mappings"), but I'll
submit it as a separate patch.

Cheers

