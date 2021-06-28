Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE93B5EE1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:27:23 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrII-0000G5-Sz
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lxrH3-00080S-Cg
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:26:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lxrH1-00075h-3U
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624886761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3pMaNhzT63rTYLHfDBgAlaCFm6Q/1gLslQ26zhUseU=;
 b=VRLAfI9YKGHPyBY6g/gbQt6DoitYK4zgAacLjbeVzcuEVc3R0DMLodzFgATbGOEAh1JA2J
 vxdK3/9zew7HbLxVG03fVKQsBvUOYQA8djBG19TFJbZgPnVPYLe/mDYzX2sP8Bu/qBUIl+
 mM5HteX5bamLssu2feHiOSgL1yAauN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-7YbkOJ0uMIuSa6ADyZ_G1w-1; Mon, 28 Jun 2021 09:25:58 -0400
X-MC-Unique: 7YbkOJ0uMIuSa6ADyZ_G1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC37019067E3;
 Mon, 28 Jun 2021 13:25:56 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B024360C0F;
 Mon, 28 Jun 2021 13:25:51 +0000 (UTC)
Date: Mon, 28 Jun 2021 15:25:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
Message-ID: <20210628152550.6c86a43a@redhat.com>
In-Reply-To: <fabd186e-bfb4-3aaa-e207-72dc67ba4214@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-2-joao.m.martins@oracle.com>
 <20210623110341.0ceca1b4@redhat.com>
 <21f86eb7-e9db-b7ac-9014-2baa9fd44741@oracle.com>
 <20210623140922.404b280b@redhat.com>
 <fabd186e-bfb4-3aaa-e207-72dc67ba4214@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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

On Wed, 23 Jun 2021 14:07:29 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 6/23/21 1:09 PM, Igor Mammedov wrote:
> > On Wed, 23 Jun 2021 10:51:59 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> On 6/23/21 10:03 AM, Igor Mammedov wrote:  
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
> >>> You are talking here about GPA which is guest specific thing
> >>> and then somehow it becomes tied to host. For bystanders it's
> >>> not clear from above commit message how both are related.
> >>> I'd add here an explicit explanation how AMD host is related GPAs
> >>> and clarify where you are talking about guest/host side.
> >>>     
> >> OK, makes sense.
> >>
> >> Perhaps using IOVA makes it easier to understand. I said GPA because
> >> there's an 1:1 mapping between GPA and IOVA (if you're not using vIOMMU).  
> > 
> > IOVA may be a too broad term, maybe explain it in terms of GPA and HPA
> > and why it does matter on each side (host/guest)
> >   
> 
> I used the term IOVA specially because that is applicable to Host IOVA or
> Guest IOVA (same rules apply as this is not special cased for VMs). So,
> regardless of whether we have guest mode page tables, or just host
> iommu page tables, this address range should be reserved and not used.

IOVA doesn't make it any clearer, on contrary it's more confusing.

And does host's HPA matter at all? (if host's firmware isn't broken,
it should never use nor advertise 1Tb hole). So we probably talking
here only about GPA only.
   
> >>> also what about usecases:
> >>>  * start QEMU with Intel cpu model on AMD host with intel's iommu    
> >>
> >> In principle it would be less likely to occur. But you would still need
> >> to mark the same range as reserved. The limitation is on DMA occuring
> >> on those IOVAs (host or guest) coinciding with that range, so you would
> >> want to inform the guest that at least those should be avoided.
> >>  
> >>>  * start QEMU with AMD cpu model and AMD's iommu on Intel host    
> >>
> >> Here you would probably only mark the range, solely for honoring how hardware
> >> is usually represented. But really, on Intel, nothing stops you from exposing the
> >> aforementioned range as RAM.
> >>  
> >>>  * start QEMU in TCG mode on AMD host (mostly form qtest point ot view)
> >>>     
> >> This one is tricky. Because you can hotplug a VFIO device later on,
> >> I opted for always marking the reserved range. If you don't use VFIO you're good, but
> >> otherwise you would still need reserved. But I am not sure how qtest is used
> >> today for testing huge guests.  
> > I do not know if there are VFIO tests in qtest (probably nope, since that
> > could require a host configured for that), but we can add a test
> > for his memory quirk (assuming phys-bits won't get in the way)
> >   
> 
> 	Joao
> 


