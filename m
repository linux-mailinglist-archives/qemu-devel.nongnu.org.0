Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F544FDD8E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 13:10:07 +0200 (CEST)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neEPM-0007FC-2l
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 07:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1neEIN-0000ob-H3
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:02:52 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1neEIJ-0004Nf-Pw
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649761299; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=8CzEsyoTNupsMIXmy2nIF8a6yklE+1ntuS7Z7ZtWQ/k=;
 b=YlrP5CahI2MjPn6EKGAq/S2YrkLa4avUHoY8IlnwPWi0yLh4isDG1fhW8Xpqc/Fo
 UMLNLx1a7BCA6L7v7r18mJBWWCk6kqlrgmpKESS0gaQVo3vnup5zfUhQo/qwpixxzI2
 XuSjhij2cbtkywCazelW2tbIRG5yKf6h8SVRZ9Iw=
Received: from localhost (91.110.139.125 [91.110.139.125]) by mx.zoho.com.cn
 with SMTPS id 1649761296370668.3420783206761;
 Tue, 12 Apr 2022 19:01:36 +0800 (CST)
Date: Tue, 12 Apr 2022 12:01:25 +0100
From: Fam Zheng <fam@euphon.net>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V6 21/27] vfio-pci: cpr part 3 (intx)
Message-ID: <20220412110125.GA18753@fam-dell>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <1628286241-217457-22-git-send-email-steven.sistare@oracle.com>
 <20220329110326.GA447081@fam-dell>
 <f18cf0e7-bb4f-1b43-ee2b-5e00c0c282d6@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f18cf0e7-bb4f-1b43-ee2b-5e00c0c282d6@oracle.com>
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam.zheng@bytedance.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-04-11 12:23, Steven Sistare wrote:
> On 3/29/2022 7:03 AM, Fam Zheng wrote:
> > On 2021-08-06 14:43, Steve Sistare wrote:
> >> Preserve vfio INTX state across cpr restart.  Preserve VFIOINTx fields as
> >> follows:
> >>   pin : Recover this from the vfio config in kernel space
> >>   interrupt : Preserve its eventfd descriptor across exec.
> >>   unmask : Ditto
> >>   route.irq : This could perhaps be recovered in vfio_pci_post_load by
> >>     calling pci_device_route_intx_to_irq(pin), whose implementation reads
> >>     config space for a bridge device such as ich9.  However, there is no
> >>     guarantee that the bridge vmstate is read before vfio vmstate.  Rather
> >>     than fiddling with MigrationPriority for vmstate handlers, explicitly
> >>     save route.irq in vfio vmstate.
> >>   pending : save in vfio vmstate.
> >>   mmap_timeout, mmap_timer : Re-initialize
> >>   bool kvm_accel : Re-initialize
> >>
> >> In vfio_realize, defer calling vfio_intx_enable until the vmstate
> >> is available, in vfio_pci_post_load.  Modify vfio_intx_enable and
> >> vfio_intx_kvm_enable to skip vfio initialization, but still perform
> >> kvm initialization.
> >>
> >> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> > 
> > Hi Steve,
> > 
> > Not directly related to this patch, but since the context is close: it looks
> > like this series only takes care of exec restart mode of vfio-pci, have you had
> > any thoughts on kexec reboot mode with vfio-pci?
> > 
> > The general idea is if DMAR context is not lost during kexec, we should be able
> > to set up irqfds again and things will just work?
> > 
> > Fam
> 
> Hi Fam,
>   I have thought about that use case, but only in general terms.
> IMO it best fits in the cpr framework as a new mode (rather than as 
> a new -restore command line argument).  

Yes I think that is better, I will try that.

> 
> In your code below, you would have fewer code changes if you set 
> 'reused = true' for the new mode, rather than testing both 'reused and restored' 
> at multiple sites. Lastly, I cleaned up the vector handling somewhat from V6 
> to V7, so you may want to try your code using V7 as a base.

I am cleaning up the kernel patches and will post both parts once ready.

Fam

