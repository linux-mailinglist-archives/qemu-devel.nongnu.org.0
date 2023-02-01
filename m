Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2AE6869BE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:15:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEpF-0005Yi-T5; Wed, 01 Feb 2023 10:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNEpC-0005XZ-Py
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:15:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNEpA-0003vo-00
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675264498;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ozcLz0H0d96wx1I3zsbreUXm6C/PzLk3JxmLnv3nbw=;
 b=fpC5t68vu20A/uolKLqO9VcCBZPQZPKcvgS8r6APfW+9RwxRSE35MTq2+UAS1vhKw6doVD
 nNLtJMSOAVZ2CDuO93Dvr9Cqd+MyVecJMfqONdMep++6mG0rZkC+eSZtzjYnQDHOsL4vxr
 f62ihTt9m78SijyWREwpCxvy1Y6JLJw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-EqxjND0NMqejvO2UU70jig-1; Wed, 01 Feb 2023 10:14:57 -0500
X-MC-Unique: EqxjND0NMqejvO2UU70jig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E3E03C10EC2;
 Wed,  1 Feb 2023 15:14:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 237A6404BEC0;
 Wed,  1 Feb 2023 15:14:55 +0000 (UTC)
Date: Wed, 1 Feb 2023 15:14:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 DOV MURIK <Dov.Murik1@il.ibm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
Message-ID: <Y9qB7SK0Wr6PONFK@redhat.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <Y9p4sARXUdUOz/6X@redhat.com>
 <bac451554357676b073d589f7668b517020d9a4e.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bac451554357676b073d589f7668b517020d9a4e.camel@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 01, 2023 at 09:56:35AM -0500, James Bottomley wrote:
> On Wed, 2023-02-01 at 14:35 +0000, Daniel P. Berrangé wrote:
> > On Wed, Feb 01, 2023 at 08:57:10AM -0500, James Bottomley wrote:
> > > The origin commit for rng seeding 67f7e426e5 ("hw/i386: pass RNG
> > > seed
> > > via setup_data entry") modifies the kernel image file to append a
> > > random seed.  Obviously this makes the hash of the kernel file
> > > non-deterministic and so breaks both measured and some signed
> > > boots.
> > 
> > I recall raising that at the time
> > 
> >   https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00710.html
> > 
> > and Jason pointed me to a followup which I tested and believe
> > fixed it for SEV:
> > 
> >   https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00601.html
> > 
> > but it doesn't look like that second patch ever merged. We went
> > through so many patches I think it probably got obsoleted by
> > something else, and no one rechecked SEV again.
> 
> The kernel file problem is a pretty huge one.  OVMF lays it down on an
> internal file system and without the second patch, it now contains
> random junk at the end.  Anything that hashes the whole file (which
> includes not only the measured direct boot but also grub signatures and
> probably other bootloader signing mechanisms) will have an issue.
> 
> > > The commit notes it's only for non-EFI (because EFI has a different
> > > RNG seeding mechanism) so, since there are no non-EFI q35 systems,
> > > this should be disabled for the whole of the q35 machine type to
> > > bring back deterministic kernel file hashes.
> > 
> > SeaBIOS is the default firmware for both q35 and i440fx. The
> > majority of systems using q35 will be non-EFI today, and that
> > is what the random seed was intended to address. I don't think
> > we can just disable this for the whole of q35.
> > 
> > When you say it breaks measured / signed boots, I presume you
> > are specifically referring to SEV kernel hashes measurements ?
> > Or is there a more general problem to solve ?
> 
> No it generally breaks measured/signed boots because it adds random
> junk to the kernel file.  The second patch will fix this if you apply
> it because setup data isn't measured or signed (yet ... however see the
> linux-coco debate about how it should be).

BTW, I can't find a reference now, but I recall being told that when
using -kernel,  OVMF won't enforce SecureBoot. ie it'll do the checks
but ignore any failure and carry on. It should still be reflected in
the vTPM measurements though.

> I also note there was a v3 of the patch and considerable discussion
> saying it couldn't work:
> 
> https://lore.kernel.org/qemu-devel/20220804230411.17720-1-Jason@zx2c4.com/
> 
> Which is likely why it never went in ... although the discussion does
> seem to resolve towards the end.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


