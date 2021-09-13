Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DA9409951
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:33:49 +0200 (CEST)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPotw-0001Mr-20
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPoow-0003AX-NA
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPoot-0002cZ-9N
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631550513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ds0Z2P4e8RHgyoM/MnoufqARYnoJig4iojR3MbftSi4=;
 b=aiNefuQ20vpMaBuBkhJfA6EFuSWISey/rrvqksVJSumF7AUPI4C/R+6HfakJb85zZMI4em
 O4zLZjJjFfi9zQck9LCqxPC0RP5rQT/UYz8hSpK3N4sAuIUJj6E7nkRU/+yFAbB0UOD+ar
 jEMjexAXc6JtfXa8+PDryty6yzdVfnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-EavYwZzGP9a0nCfSxH7FDQ-1; Mon, 13 Sep 2021 12:28:30 -0400
X-MC-Unique: EavYwZzGP9a0nCfSxH7FDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 145251006AA1;
 Mon, 13 Sep 2021 16:28:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8A73781E8;
 Mon, 13 Sep 2021 16:28:28 +0000 (UTC)
Date: Mon, 13 Sep 2021 17:28:27 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON
Message-ID: <20210913162827.GH26415@redhat.com>
References: <20210912174925.200132-1-richard.henderson@linaro.org>
 <20210913110727.GF26415@redhat.com>
 <f6e7ab0f-aebe-c9c5-d479-fa30e69fcd1c@linaro.org>
MIME-Version: 1.0
In-Reply-To: <f6e7ab0f-aebe-c9c5-d479-fa30e69fcd1c@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 09:19:22AM -0700, Richard Henderson wrote:
> On 9/13/21 4:07 AM, Richard W.M. Jones wrote:
> >>[    0.000000] Linux version 5.14.0-60.fc36.armv7hl (mockbuild@buildvm-a32-12.iad2.fedoraproject.org) (gcc (GCC) 11.2.1 20210728 (Red Hat 11.2.1-1), GNU ld version 2.37-9.fc36) #1 SMP Mon Aug 30 14:08:34 UTC 2021
> >>
> >>I thought about parameterizing this patch further, but I can't think of
> >>another ISA that would be affected.  (i686 clumsily changed its abi 20
> >>years ago to avoid faulting on vector spills; other isas so far have
> >>allowed vectors to be unaligned.)
> >
> >Is it possible this change could have caused a more serious
> >regression?
> 
> I don't think so...
> 
> >Now when I try to boot the Fedora kernel using TCG on
> >armv7hl I can't even get to the point where it detects virtio-scsi
> >devices.
> >
> >Full log is here (go down to the bottom and work backwards):
> >
> >   https://kojipkgs.fedoraproject.org//work/tasks/7337/75597337/build.log
> 
> I downloaded the 5.14.0-60 kernel from above, and I can reproduce
> the original error, and I see that it's fixed afterward.

Thanks for checking that.  I did spend much of today attempting to get
an armv7 guest installed on my RPi so I could reproduce this more
reliably, but eventually gave up because of a variety of other
problems (one apparently in qemu: https://bugzilla.redhat.com/1633328)

> I'll have a look at this new build log in a moment...
> 
> 
> r~

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


