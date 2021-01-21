Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3122FF27E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:54:18 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2e9w-0008Qe-68
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2e6r-0006aw-8W
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2e6p-0005eW-38
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611251459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5BIrqjqDF9+3EB8gyBBE01Jtt3rjKarhDJErRHUg2g=;
 b=JP9l1wLoOFwLMYvOUIyhvjEIMAJN8NczeCOGWQiLjnoSSKHr3K1dhLBhufoN84RCfVHfAi
 7vQjhMUO8LUD/60iqokS/PR7vxQheXOi8SEn12P/iWYWrMdVOof+saJlCowJR6VuzrLBrd
 2gei/4+H0I+hm1MjvzKqon+MU4geQ4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-JjzyjrAkMHa5X47odU_ilA-1; Thu, 21 Jan 2021 12:50:54 -0500
X-MC-Unique: JjzyjrAkMHa5X47odU_ilA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9868D8144E0;
 Thu, 21 Jan 2021 17:50:52 +0000 (UTC)
Received: from gondolin (ovpn-113-94.ams2.redhat.com [10.36.113.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FBD977BE2;
 Thu, 21 Jan 2021 17:50:39 +0000 (UTC)
Date: Thu, 21 Jan 2021 18:50:36 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
Message-ID: <20210121185036.41fde30c.cohuck@redhat.com>
In-Reply-To: <9522792d-6677-eed4-f480-4efaaf00dd51@linux.ibm.com>
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
 <511aebd3-fc4f-d7d3-32c2-27720fb38fe8@linux.ibm.com>
 <15dbd981-7dda-2526-8f13-52ead6298ef1@linux.ibm.com>
 <a1d1df76-07df-9879-ae77-ff677efdd291@linux.ibm.com>
 <f3e074d2-4f47-d229-9002-010e91df95d1@linux.ibm.com>
 <914d4af3-32ee-e300-9738-92aececa81d6@linux.ibm.com>
 <789388f4-983b-2810-7f46-ce7f07022a66@linux.ibm.com>
 <ff5674ed-8ce2-73d7-1991-de424d62288c@linux.ibm.com>
 <bd94ca8a-70b2-36b3-d357-3527e8d3dc62@linux.ibm.com>
 <213c00ca-1b8f-ecee-dd22-d86cad8eb63b@linux.ibm.com>
 <4a3e13fe-ec6a-27bc-7f30-9ad9691a4522@linux.ibm.com>
 <a458fa0e-2c4a-551f-2f54-3dcedc4bbade@linux.ibm.com>
 <9522792d-6677-eed4-f480-4efaaf00dd51@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: thuth@redhat.com, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 15:54:22 +0100
Niklas Schnelle <schnelle@linux.ibm.com> wrote:

> On 1/21/21 3:46 PM, Pierre Morel wrote:
> > 
> > 
> > On 1/21/21 2:37 PM, Niklas Schnelle wrote:  
> >>
> >>
> >> On 1/21/21 1:30 PM, Pierre Morel wrote:  
> >   
> >>>>
> >>>> Just wanted to say that we've had a very similar discussion with
> >>>> Cornelia end of last year and came to the conclusion that explicitly
> >>>> matching the PFT is likely the safest bet:
> >>>> https://lkml.org/lkml/2020/12/22/479  
> >>>
> >>> What I see there is a discussion on the relation between relaxed access and MIO without explaining to Connie that we have in the kernel the possibility to know if a device support MIO or not independently of it supports the relaxed access.
> >>>
> >>> The all point here is about taking decisions for the right reasons.
> >>>
> >>> We have the possibility to take the decision based on functionalities and not on a specific PCI function.  
> >>
> >> Yes but that goes both ways the functionality of the region has to match
> >> that of the device and at least in it's current state the regions functionality
> >> matches only ISM in a way that is so specific that it is very unlikely to match anything
> >> else. For example it can't support a PCI device that requires non-MIO but
> >> also MSI-X. In its current form it doesn't even support PCI Store only PCI Store
> >> Block, we had that in an earlier version and it's trivial but then we get the MSI-X
> >> problem.  
> > 
> > 
> > What does that change if we take one or the other solution considering the checking of MIO/MSIX/relax versus PFT?  
> 
> 
> If it's !MIO && !MSIX && relax_align I'm fine with that check but
> then we should also add PCISTG to the region.
> 

Just to double check: that would today cover only ISM (which doesn't
use PCISTG), correct?

/me getting a bit lost in this discussion :)


