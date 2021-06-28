Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D863B6179
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:34:11 +0200 (CEST)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsKw-00057V-Eb
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lxsJb-0004Ac-AA
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lxsJX-00073v-R1
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624890763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtJYgDveCiC/NWJb/xEsN4NfZs/iP798CAk6DUwpU6M=;
 b=UVVty6YffvYfZwh5brFfXM77lj3gOXRqxyFbrYwuO51lslLqhYaYQXXH1INt5yEJYV4jMw
 mCN9KmKoCT9cCsjqLy/FmG2kQTEmC4dlNFh7bWYARO5iSHGk7/2NaqwzNC5N/CVpFFJshv
 zAkpGX41uiVedgQepVQ/g/uOELYtLaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-2cPh7ECzOm67fh1HPEt9xg-1; Mon, 28 Jun 2021 10:32:39 -0400
X-MC-Unique: 2cPh7ECzOm67fh1HPEt9xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 736E81926DA8;
 Mon, 28 Jun 2021 14:32:38 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F61D60CC9;
 Mon, 28 Jun 2021 14:32:33 +0000 (UTC)
Date: Mon, 28 Jun 2021 16:32:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
Message-ID: <20210628163232.5669563c@redhat.com>
In-Reply-To: <a8668c8d-22c5-6168-3f29-3f5055d99c32@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-2-joao.m.martins@oracle.com>
 <20210623091138.2f7828dd@redhat.com>
 <ea55dc1b-b48a-3af1-be03-e72abc358f46@oracle.com>
 <20210623133954.2be8f24e@redhat.com>
 <a8668c8d-22c5-6168-3f29-3f5055d99c32@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Jun 2021 14:04:19 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 6/23/21 12:39 PM, Igor Mammedov wrote:
> > On Wed, 23 Jun 2021 10:37:38 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> On 6/23/21 8:11 AM, Igor Mammedov wrote:  
> >>> On Tue, 22 Jun 2021 16:49:00 +0100
> >>> Joao Martins <joao.m.martins@oracle.com> wrote:
> >>>     
> >>>> It is assumed that the whole GPA space is available to be
> >>>> DMA addressable, within a given address space limit. Since
> >>>> v5.4 based that is not true, and VFIO will validate whether
> >>>> the selected IOVA is indeed valid i.e. not reserved by IOMMU
> >>>> on behalf of some specific devices or platform-defined.
> >>>>
> >>>> AMD systems with an IOMMU are examples of such platforms and
> >>>> particularly may export only these ranges as allowed:
> >>>>
> >>>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
> >>>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
> >>>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb)
> >>>>
> >>>> We already know of accounting for the 4G hole, albeit if the
> >>>> guest is big enough we will fail to allocate a >1010G given
> >>>> the ~12G hole at the 1Tb boundary, reserved for HyperTransport.
> >>>>
> >>>> When creating the region above 4G, take into account what
> >>>> IOVAs are allowed by defining the known allowed ranges
> >>>> and search for the next free IOVA ranges. When finding a
> >>>> invalid IOVA we mark them as reserved and proceed to the
> >>>> next allowed IOVA region.
> >>>>
> >>>> After accounting for the 1Tb hole on AMD hosts, mtree should
> >>>> look like:
> >>>>
> >>>> 0000000100000000-000000fcffffffff (prio 0, i/o):
> >>>> 	alias ram-above-4g @pc.ram 0000000080000000-000000fc7fffffff
> >>>> 0000010000000000-000001037fffffff (prio 0, i/o):
> >>>> 	alias ram-above-1t @pc.ram 000000fc80000000-000000ffffffffff    
> >>>
> >>> why not push whole ram-above-4g above 1Tb mark
> >>> when RAM is sufficiently large (regardless of used host),
> >>> instead of creating yet another hole and all complexity it brings along?
> >>>     
> >>
> >> There's the problem with CMOS which describes memory above 4G, part of the
> >> reason I cap it to the 1TB minus the reserved range i.e. for AMD, CMOS would
> >> only describe up to 1T.
> >>
> >> But should we not care about that then it's an option, I suppose.  
> > we probably do not care about CMOS with so large RAM,
> > as long as QEMU generates correct E820 (cmos mattered only with old Seabios
> > which used it for generating memory map)
> >   
> OK, good to know.
> 
> Any extension on CMOS would probably also be out of spec.
ram size in CMOS is approximate at best as doesn't account for all holes,
anyways it's irrelevant if we aren't changing RAM size.

> >> We would waste 1Tb of address space because of 12G, and btw the logic here
> >> is not so different than the 4G hole, in fact could probably share this
> >> with it.  
> > the main reason I'm looking for alternative, is complexity
> > of making hole brings in. At this point, we can't do anything
> > with 4G hole as it's already there, but we can try to avoid that
> > for high RAM and keep rules there simple as it's now.
> >   
> Right. But for what is worth, that complexity is spread in two parts:
> 
> 1) dealing with a sparse RAM model (with more than one hole)
> 
> 2) offsetting everything else that assumes a linear RAM map.
> 
> I don't think that even if we shift start of RAM to after 1TB boundary that
> we would get away top solving item 2 -- which personally is where I find this
> a tad bit more hairy. So it would probably make this patch complexity smaller, but
> not vary much in how spread the changes get.

you are already shifting hotplug area behind 1Tb in [2/6],
so to be consistent just do the same for 4Gb+ alias a well.
That will automatically solve issues in patch 4/6, and all
that at cost of several lines in one place vs this 200+ LOC series.
Both approaches are a kludge but shifting everything over 1Tb mark
is the simplest one.

If there were/is actual demand for sparse/non linear RAM layouts,
I'd switch to pc-dimm based RAM (i.e. generalize it to handle
RAM below 4G and let users specify their own memory map,
see below for more).

> > Also partitioning/splitting main RAM is one of the things that
> > gets in the way converting it to PC-DIMMMs model.
> >   
> Can you expand on that? (a link to a series is enough)
There is no series so far, only a rough idea.

current initial RAM with rather arbitrary splitting rules,
doesn't map very well with pc-dimm device model.
Unfortunately I don't see a way to convert initial RAM to
pc-dimm model without breaking CLI/ABI/migration.

As a way forward, we can restrict legacy layout to old
machine versions, and switch to pc-dimm based initial RAM
for new machine versions.

Then users will be able to specify GPA where each pc-dimm shall
be mapped. For reserving GPA ranges we can change current GPA
allocator. Alternatively a bit more flexible approach could be
a dummy memory device that would consume a reserved range so
that no one could assign pc-dimm there, this way user can define
arbitrary (subject to alignment restrictions we put on it) sparse
memory layouts without modifying QEMU for yet another hole.


> > Loosing 1Tb of address space might be acceptable on a host
> > that can handle such amounts of RAM
> >   
> 


