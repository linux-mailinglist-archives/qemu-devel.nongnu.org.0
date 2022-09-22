Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A45E6799
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:52:47 +0200 (CEST)
Received: from localhost ([::1]:38950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOVK-00050c-Bk
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obN0d-0007xH-QL
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obN0T-0003Mw-6x
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663856200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=To7IknU2bbZ2RnHxGxDzryVgmlAqYD6wSm6BToJO0kE=;
 b=SOJe5NSQ6NdmVta7SrVK6M8TOAg7WZjo66FUjUFA2p2cibOViQtBdTb+vKTxqqJ9k3fdvE
 2OvAI9ssN9H/P424xF5kO46D4XNEuu4vBwfAV1V8bzYr81p4Ff0pVdKK3WoSIVT05TCl3n
 XD0lljC+cvtMF+1Xc47dOa2Ws3KPV4I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-1vWM0UhpMHCOKhY5fzXEFw-1; Thu, 22 Sep 2022 10:16:36 -0400
X-MC-Unique: 1vWM0UhpMHCOKhY5fzXEFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D743C0F67D;
 Thu, 22 Sep 2022 14:16:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 722F72166B31;
 Thu, 22 Sep 2022 14:16:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BD9041800084; Thu, 22 Sep 2022 16:16:33 +0200 (CEST)
Date: Thu, 22 Sep 2022 16:16:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
Message-ID: <20220922141633.t2dk2jviw2f3i26x@sirius.home.kraxel.org>
References: <20220922101454.1069462-1-kraxel@redhat.com>
 <YyxF2TNwnXaefT6u@redhat.com>
 <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
 <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 02:38:02PM +0200, Paolo Bonzini wrote:
> On Thu, Sep 22, 2022 at 2:21 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > No.  This will basically inform the guest that host-phys-bits has been
> > enabled (and pass the number of bits).  So the firmware can make use of
> > the available address space instead of trying to be as conservative as
> > possible to avoid going beyond the (unknown) limit.
> 
> Intel processors that are not extremely old have host-phys-bits equal
> to 39, 46 or 52. Older processors that had 36, in all likelihood,
> didn't have IOMMUs (so no big 64-bit BARs).

Well, I happen to have a intel box with 36 physbits + iommu.

> 1) set host-phys-bits to true on new machine types when not using TCG
> (i.e. KVM / HVF / WHPX)

That is probably a good idea, but an independent problem.

Has live migration problems (when hosts have different phys bits),
which is IIRC the reason this hasn't happen yet.  Maybe that is solved
meanwhile the one way or another, I've seen some phys-bits changes in
libvirt recently ...

> 2) in the firmware treat 40 as if it were 39, to support old machine
> types?

The background of all this is that devices need more and more memory,
and the very conservative edk2 defaults are becoming increasingly
problematic.  So what I want do is scale things up with the address
space size.  Use 1/4 or 1/8 of the physical address space as 64bit
pci mmio window.  Likewise scale up the default pcie root port window
sizes, to have more room for hotplug.

For that to work the firmware obviously needs to know how much it
actually has, which is not the case.

Yes, the problematic cases are intel machines with 36 or 39.

Treating 40 as if it were 39 will explode with 36 cpus.

Treating 40 as if it were 36 will mostly work.  Will leave a big
chunk of address space unused.  Will cause regressions on guests
with > 32G of RAM.

Treating 40 as invalid and continue to use the current conservative
heuristic, otherwise treat phys-bits as valid might work.  Obvious
corner case is that it'll not catch broken manual configurations
(host-phys-bits=off,phys-bits=<larger-than-host>), only the broken
default.  Not sure how much of a problem that is in practice, maybe
it isn't.

I think I still prefer to explicitly communicate a reliable phys-bits
value to the guest somehow.

take care,
  Gerd


