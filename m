Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513336BA9D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 22:17:25 +0200 (CEST)
Received: from localhost ([::1]:37948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb7fY-0006XY-3I
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 16:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1lb7eY-0005iH-Qr
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1lb7eS-0007Y6-Ss
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619468175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V43DSuOCg+ccchmmjgNJecuETLftESs47uLElIu9Ah8=;
 b=ET4Vtt5ms57y69U57kFVHViaS1IUmqEK31eXRdQ5uYYf6ttFbppaEiQy0CuKzNndiV4kky
 E/ff/wc8OMBOA1JhsXD1JAsMHg0bJ/GgBwFjFFwK48Q2EWhE7fXObGNkQ39wH0gRj9Vxr2
 s1J3ybfgL08jYag5SeLO7iEQfYJDN4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-gq4ipbk2NfiusB8Y__cuwQ-1; Mon, 26 Apr 2021 16:16:11 -0400
X-MC-Unique: gq4ipbk2NfiusB8Y__cuwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 475BD1922961;
 Mon, 26 Apr 2021 20:16:10 +0000 (UTC)
Received: from fuller.cnet (ovpn-112-5.gru2.redhat.com [10.97.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A54BC687DA;
 Mon, 26 Apr 2021 20:16:09 +0000 (UTC)
Received: by fuller.cnet (Postfix, from userid 1000)
 id 54C60416D899; Mon, 26 Apr 2021 15:51:55 -0300 (-03)
Date: Mon, 26 Apr 2021 15:51:55 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Wei Huang <wei.huang2@amd.com>
Subject: Re: constant_tsc support for SVM guest
Message-ID: <20210426185155.GA32439@fuller.cnet>
References: <a6662944-18ac-5075-1427-f92ae8e20163@amd.com>
 <20210423212744.4urvjdirnqdvqcq5@habkost.net>
 <63dc9910-67be-eee4-b3dc-cf60009ebc20@amd.com>
MIME-Version: 1.0
In-Reply-To: <63dc9910-67be-eee4-b3dc-cf60009ebc20@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mtosatti@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mtosatti@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: "Moger, Babu" <babu.moger@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 25, 2021 at 12:19:11AM -0500, Wei Huang wrote:
> 
> 
> On 4/23/21 4:27 PM, Eduardo Habkost wrote:
> > On Fri, Apr 23, 2021 at 12:32:00AM -0500, Wei Huang wrote:
> > > There was a customer request for const_tsc support on AMD guests. Right now
> > > this feature is turned off by default for QEMU x86 CPU types (in
> > > CPUID_Fn80000007_EDX[8]). However we are seeing a discrepancy in guest VM
> > > behavior between Intel and AMD.
> > > 
> > > In Linux kernel, Intel x86 code enables X86_FEATURE_CONSTANT_TSC based on
> > > vCPU's family & model. So it ignores CPUID_Fn80000007_EDX[8] and guest VMs
> > > have const_tsc enabled. On AMD, however, the kernel checks
> > > CPUID_Fn80000007_EDX[8]. So const_tsc is disabled on AMD by default.
> > 
> > Oh.  This seems to defeat the purpose of the invtsc migration
> > blocker we have.
> > 
> > Do we know when this behavior was introduced in Linux?
> 
> This code has existed in the kernel for a long time:
> 
>   commit 2b16a2353814a513cdb5c5c739b76a19d7ea39ce
>   Author: Andi Kleen <ak@linux.intel.com>
>   Date:   Wed Jan 30 13:32:40 2008 +0100
> 
>      x86: move X86_FEATURE_CONSTANT_TSC into early cpu feature detection
> 
> There was another related commit which might explain the reasoning of
> turning on CONSTANT_TSC based on CPU family on Intel:
> 
>   commit 40fb17152c50a69dc304dd632131c2f41281ce44
>   Author: Venki Pallipadi <venkatesh.pallipadi@intel.com>
>   Date:   Mon Nov 17 16:11:37 2008 -0800
> 
>      x86: support always running TSC on Intel CPUs
> 
> According to the commit above, there are two kernel features: CONSTANT_TSC
> and NONSTOP_TSC:
> 
>   * CONSTANT_TSC: TSC runs at constant rate
>   * NONSTOP_TSC: TSC not stop in deep C-states
> 
> If CPUID_Fn80000007_EDX[8] == 1, both CONSTANT_TSC and NONSTOP_TSC are
> turned on. This applies to all x86 vendors. For Intel CPU with certain CPU
> families (i.e. c->x86 == 0x6 && c->x86_model >= 0x0e), it will turn on
> CONSTANT_TSC (but no NONSTOP_TSC) with CPUID_Fn80000007_EDX[8]=0.
> 
> I believe the migration blocker was created for the CONSTANT_TSC case: if
> vCPU claims to have a constant TSC rate, we have to make sure src/dest are
> matched with each other (having the same CPU frequency or have tsc_ratio).
> NONSTOP_TSC doesn't matter in this scope.
>
> > > I am thinking turning on invtsc for EPYC CPU types (see example below). Most
> > > AMD server CPUs have supported invariant TSC for a long time. So this change
> > > is compatible with the hardware behavior. The only problem is live migration
> > > support, which will be blocked because of invtsc. 

It should be blocked, if performed to a host with a different frequency
or without TscRateMsr, if one desires the "constant TSC rate" meaning
to be maintained.

> > > However this problem
> > > should be considered very minor because most server CPUs support TscRateMsr
> > > (see CPUID_Fn8000000A_EDX[4]), allowing VMs to migrate among CPUs with
> > > different TSC rates. This live migration restriction can be lifted as long
> > > as the destination supports TscRateMsr or has the same frequency as the
> > > source (QEMU/libvirt do it).
> > > 
> > > [BTW I believe this migration limitation might be unnecessary because it is
> > > apparently OK for Intel guests to ignore invtsc while claiming const_tsc.
> > > Have anyone reported issues?]

Not as far as i know.

Fact is that libvirt will set the TSC_KHZ (from the value of
KVM_GET_TSC_KHZ ioctl).

That could be done inside QEMU itself, maybe by specifying -cpu
AAA,cpu-freq=auto ?

https://www.spinics.net/linux/fedora/libvir/msg141570.html


