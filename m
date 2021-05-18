Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134D83880A5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:41:35 +0200 (CEST)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5aw-0004L7-38
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lj5Z9-0002ym-Kf
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:39:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lj5Z7-0002UG-6V
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621366780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zqqX1IaXTEbDmyAG1p0aodW9voE4HBxeQmi3CXD/I0=;
 b=Wccv5XlfQLMpK7FEIGKLC0tJRQddEaXxiNGfLsvKSr5XMkwcfZeCRAWaU3fX7ufuUwoDiR
 blC0sB9qpA/9IdO83tBKT5M/QJXXqCco5RJkRUwgtS1NfpMumbamu+9K+DJ1trvlmxW0vf
 cmow+UY3JpCoLPnO+8Xi2wjGIQjyflY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-ClJTDOeWPvuJVwkRki2Zfg-1; Tue, 18 May 2021 15:39:38 -0400
X-MC-Unique: ClJTDOeWPvuJVwkRki2Zfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F419D107ACC7;
 Tue, 18 May 2021 19:39:36 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8716E5C1CF;
 Tue, 18 May 2021 19:39:36 +0000 (UTC)
Date: Tue, 18 May 2021 13:39:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [Question] Indefinitely block in the host when remove the PF
 driver
Message-ID: <20210518133936.0593d3fc.alex.williamson@redhat.com>
In-Reply-To: <c09fed39-bde5-b7a9-d945-79ef85260e5a@hisilicon.com>
References: <c9466e2c-385d-8298-d03c-80dcfc359f52@hisilicon.com>
 <20210430082940.4b0e0397@redhat.com>
 <c09fed39-bde5-b7a9-d945-79ef85260e5a@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: kvm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cohuck@redhat.com,
 Linuxarm <linuxarm@huawei.com>, qemu-devel@nongnu.org,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 11:44:49 +0800
Yicong Yang <yangyicong@hisilicon.com> wrote:

> [ +qemu-devel ]
> 
> On 2021/4/30 22:29, Alex Williamson wrote:
> > On Fri, 30 Apr 2021 15:57:47 +0800
> > Yicong Yang <yangyicong@hisilicon.com> wrote:
> >   
> >> When I try to remove the PF driver in the host, the process will be blocked
> >> if the related VF of the device is added in the Qemu as an iEP.
> >>
> >> here's what I got in the host:
> >>
> >> [root@localhost 0000:75:00.0]# rmmod hisi_zip
> >> [99760.571352] vfio-pci 0000:75:00.1: Relaying device request to user (#0)
> >> [99862.992099] vfio-pci 0000:75:00.1: Relaying device request to user (#10)
> >> [...]
> >>
> >> and in the Qemu:
> >>
> >> estuary:/$ lspci -tv
> >> -[0000:00]-+-00.0  Device 1b36:0008
> >>            +-01.0  Device 1af4:1000
> >>            +-02.0  Device 1af4:1009
> >>            \-03.0  Device 19e5:a251 <----- the related VF device
> >> estuary:/$ qemu-system-aarch64: warning: vfio 0000:75:00.1: Bus 'pcie.0' does not support hotplugging
> >> qemu-system-aarch64: warning: vfio 0000:75:00.1: Bus 'pcie.0' does not support hotplugging
> >> qemu-system-aarch64: warning: vfio 0000:75:00.1: Bus 'pcie.0' does not support hotplugging
> >> qemu-system-aarch64: warning: vfio 0000:75:00.1: Bus 'pcie.0' does not support hotplugging
> >> [...]
> >>
> >> The rmmod process will be blocked until I kill the Qemu process. That's the only way if I
> >> want to end the rmmod.
> >>
> >> So my question is: is such block reasonable? If the VF devcie is occupied or doesn't
> >> support hotplug in the Qemu, shouldn't we fail the rmmod and return something like -EBUSY
> >> rather than make the host blocked indefinitely?  
> > 
> > Where would we return -EBUSY?  pci_driver.remove() returns void.
> > Without blocking, I think our only option would be to kill the user
> > process.
> >    
> 
> yes. the remove() callback of pci_driver doesn't provide a way to abort the process.
> 
> >> Add the VF under a pcie root port will avoid this. Is it encouraged to always
> >> add the VF under a pcie root port rather than directly add it as an iEP?  
> > 
> > Releasing a device via the vfio request interrupt is always a
> > cooperative process currently, the VM needs to be configured such that
> > the device is capable of being unplugged and the guest needs to respond
> > to the ejection request.  Thanks,
> >   
> 
> Does it make sense to abort the VM creation and give some warnings if user try to
> pass a vfio pci device to the Qemu and doesn't attach it to a hotpluggable
> bridge? Currently I think there isn't such a mechanism in Qemu.

You're essentially trying to define a usage policy and pick somewhere
to impose it.  I think QEMU is not the right place.  There are plenty
of valid assigned device configurations where the device is not
hotpluggable.  You therefore either need to look up in the stack if
your environment demands that VM configurations should always be able
to release devices at the request of the kernel, or down in the stack
if you believe the kernel has an obligation to take that device if the
user fails to respond to a device request.  We've shied away from the
latter because it generally involves killing the holding process,
either directly or by closing off access to the device, where in the
case of mmaps to the device, ongoing access would result in a SIGBUS to
the process anyway.  I wouldn't object to the kernel having a right to
do this, but it's not something that has reached a high priority.
Thanks,

Alex


