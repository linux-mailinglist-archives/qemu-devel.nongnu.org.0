Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F511A248C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 17:03:49 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMCF2-0006O3-5N
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 11:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56517)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jMCDy-0005bP-Dv
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 11:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jMCDt-0000Us-KW
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 11:02:42 -0400
Received: from charlie.dont.surf ([128.199.63.193]:35884)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jMCDr-0000S6-6B; Wed, 08 Apr 2020 11:02:35 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 17032BF5E2;
 Wed,  8 Apr 2020 15:02:33 +0000 (UTC)
Date: Wed, 8 Apr 2020 17:02:29 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v6 32/42] nvme: allow multiple aios per command
Message-ID: <20200408150229.rv6z5qspuwpnrlhv@apples.localdomain>
References: <20200316142928.153431-1-its@irrelevant.dk>
 <20200316142928.153431-33-its@irrelevant.dk>
 <d7ed3bb2e27814d414bcba2ace23e633ebe5df9f.camel@redhat.com>
 <20200331054647.pvcjrsnz2xbar3zf@apples.localdomain>
 <bd3c2be383491f1eb321f4e8b5eb5a7df2fc30eb.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd3c2be383491f1eb321f4e8b5eb5a7df2fc30eb.camel@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mar 31 12:10, Maxim Levitsky wrote:
> On Tue, 2020-03-31 at 07:47 +0200, Klaus Birkelund Jensen wrote:
> > On Mar 25 12:57, Maxim Levitsky wrote:
> > > On Mon, 2020-03-16 at 07:29 -0700, Klaus Jensen wrote:
> > > > @@ -516,10 +613,10 @@ static inline uint16_t nvme_check_prinfo(NvmeCtrl *n, NvmeNamespace *ns,
> > > >      return NVME_SUCCESS;
> > > >  }
> > > >  
> > > > -static inline uint16_t nvme_check_bounds(NvmeCtrl *n, NvmeNamespace *ns,
> > > > -                                         uint64_t slba, uint32_t nlb,
> > > > -                                         NvmeRequest *req)
> > > > +static inline uint16_t nvme_check_bounds(NvmeCtrl *n, uint64_t slba,
> > > > +                                         uint32_t nlb, NvmeRequest *req)
> > > >  {
> > > > +    NvmeNamespace *ns = req->ns;
> > > >      uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
> > > 
> > > This should go to the patch that added nvme_check_bounds as well
> > > 
> > 
> > We can't really, because the NvmeRequest does not hold a reference to
> > the namespace as a struct member at that point. This is also an issue
> > with the nvme_check_prinfo function above.
> 
> I see it now. The changes to NvmeRequest together with this are a good candidate
> to split from this patch to get this patch to size that is easy to review.
> 

I'm factoring those changes and other stuff out into separate patches!



