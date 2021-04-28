Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C71D36D8EA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:54:41 +0200 (CEST)
Received: from localhost ([::1]:53462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkeG-0006LB-6O
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbkUh-0005qP-AI
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbkUf-0000lj-Fq
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619617484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ov9GGh/EY4shxFH8qmcvbCsED3eFl+X7aegLEFBweT0=;
 b=fYKtI5dYl6IP0qiego/+cwH9zZqUpCel2Fx+ewLz9uyzcWx4t8rk68LebS9CrBv4IgcXZR
 qUgFZk/ZXdtPqfqQXEALGh14TelQgQtccDoH6IGQzpsoJB0AgNSDsUHOzwnXrr/HQduHrG
 DCyyK24xKi66/hptVgQrrsgqBK/Jins=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-gM0HXhwbNaKq-HFQ-uzSbA-1; Wed, 28 Apr 2021 09:44:42 -0400
X-MC-Unique: gM0HXhwbNaKq-HFQ-uzSbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E94501E9;
 Wed, 28 Apr 2021 13:44:41 +0000 (UTC)
Received: from work-vm (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D08B519C45;
 Wed, 28 Apr 2021 13:44:35 +0000 (UTC)
Date: Wed, 28 Apr 2021 14:44:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: X on old (non-x86) Linux guests
Message-ID: <YIlmweq8zLIhN04l@work-vm>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
 <CA+rFky7OWZUHdUgn1xFDTO6b-Y72KL=JjxjVYAFDMYh7H9DwRw@mail.gmail.com>
 <CA+rFky5-FzxjFDJND8a8iQ1XYZ7PsBkYkK4CFO7X6mjAqD+sBg@mail.gmail.com>
 <b5ed0e7-86fa-3157-3b5a-506f9aff5cac@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <b5ed0e7-86fa-3157-3b5a-506f9aff5cac@eik.bme.hu>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Andrew Randrianasulu <randrianasulu@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* BALATON Zoltan (balaton@eik.bme.hu) wrote:
> On Wed, 28 Apr 2021, Andrew Randrianasulu wrote:
> > On Wednesday, April 28, 2021, Andrew Randrianasulu <randrianasulu@gmail.com>
> > wrote:
> > > On Monday, April 26, 2021, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> > > > On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:
> > > > >  Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
> > > > > under QEMU which was pretty neat.  But I failed to find a succesful
> > > > > combination to get X working; has anyone any suggestions?
> > > > > 
> > > > 
> > > > Adding Andrew who has experimented with old X framebuffer so he may
> > > > remember something more but that was on x86.
> > > 
> > > 
> > > 
> > > Sorry, I still away from my desktop (with notes/logs), not sure when
> > > return..
> > > I do not think I tried something that old.. Kernel 2.2 i guess, before any
> > > attempt at r128 drm Kernel module was written (in 2.4?) and so before ddx
> > > attempted to use that (as it tries by default in much newer distros)
> 
> Maybe it would work better with newer RedHat than 6.0? I think I've seen
> images up to at least 7.1 that supported alpha but I don't know how to boot
> them. I could get kernel and installer running with -kernel -initrd but did
> not find the CD on the defailt CMD646 controller (seems to only have driver
> for one SCSI controller) so I'm not sure how to try this. Trying to just
> boot from the CD without -kernel -initrd it just stops after displaying
> "Hello" in top left but that could be something about alpha firmware I don't
> know how to use.

I ended up using -kernel/-initrd and passed the cdrom as an image to hdb
rather than with -cdrom; as you say the cmd646 didn't like the cdrom.
(Where I'm pretty sure my real Alpha does have a CDROM connected to it's
cmd646).  And none of the SCSI controllers would work.

I'll make some notes on my command line this weekend and post them next
week; I'll try the X suggestions as well.

Dave

> Regards,
> BALATON Zoltan
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


