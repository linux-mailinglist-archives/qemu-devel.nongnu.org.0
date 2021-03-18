Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6BB340EC5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:04:30 +0100 (CET)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMysf-00068M-8t
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMyrY-0005fA-Oi
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:03:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMyrW-0007HV-9w
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616097796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qzr3cTfwhA9CZ97pc3d4PrUJFsM4aZ1Ay+mKIHtq9PQ=;
 b=I/rFL7X2P4faHbbznAgsQJACbyNZ85SJ1k8sxnzEWH2P10b53ruoCsUGlj5FCJw0Wllfgc
 tvc3Q1v7z6ADhoLo1WaA8nZy898vvbO1gtNvvXfq86jqJfNNGrZf5b5PzMjISrskqg7O4D
 kxJHD1qNs7Knafl6Gn0HhIFFort9Gr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-Tu3DNMOON3yC3pL0QRx9og-1; Thu, 18 Mar 2021 16:03:14 -0400
X-MC-Unique: Tu3DNMOON3yC3pL0QRx9og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9866107ACCD;
 Thu, 18 Mar 2021 20:03:12 +0000 (UTC)
Received: from work-vm (ovpn-115-13.ams2.redhat.com [10.36.115.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6745747;
 Thu, 18 Mar 2021 20:03:11 +0000 (UTC)
Date: Thu, 18 Mar 2021 20:03:08 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Rolnik <mrolnik@gmail.com>
Subject: Re: of AVR target page size
Message-ID: <YFOx/OcdGCLzIZHl@work-vm>
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
 <YFMpCPtMJzXUeeIk@work-vm>
 <CAFEAcA_+Yvn5S8P3zwPcsO9HF=0rXCJrfUZKs6RAQWhdyG_-fQ@mail.gmail.com>
 <YFMqmDmwDZwRQviM@work-vm>
 <CAFEAcA825k8uttjmJuwNM=rDa-m7nOWJZEAQzP9Zz3e7yyS9Aw@mail.gmail.com>
 <YFMvO/79vcSFOEix@work-vm>
 <CAK4993jx4zcuUTW--Qq-YLwqv-y3YxNZ0QU=KT0HVr09TpPLNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK4993jx4zcuUTW--Qq-YLwqv-y3YxNZ0QU=KT0HVr09TpPLNg@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael Rolnik (mrolnik@gmail.com) wrote:
> how do I test my fix? Is there a procedure?

As long as your TARGET_PAGE_SIZE is now 512 or bigger you should be OK
as long as your AVR stuff still works.  If you want you can try and do a
live migrate between two copies of qemu, but that does assume you'vre
wired up the vmstate info for all your devices.

Dave

> Thanks,
> Michael Rolnik
> 
> On Thu, Mar 18, 2021 at 12:45 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
> wrote:
> 
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Thu, 18 Mar 2021 at 10:25, Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > > Oh yes, just:
> > > >
> > > > diff --git a/migration/ram.c b/migration/ram.c
> > > > index 52537f14ac..a7269955b5 100644
> > > > --- a/migration/ram.c
> > > > +++ b/migration/ram.c
> > > > @@ -81,6 +81,8 @@
> > > >  /* 0x80 is reserved in migration.h start with 0x100 next */
> > > >  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> > > >
> > > > +#define RAM_SAVE_FLAG__MAX RAM_SAVE_FLAG_COMPRESS_PAGE
> > > > +
> > > >  static inline bool is_zero_range(uint8_t *p, uint64_t size)
> > > >  {
> > > >      return buffer_is_zero(p, size);
> > > > @@ -4090,5 +4092,6 @@ static SaveVMHandlers savevm_ram_handlers = {
> > > >  void ram_mig_init(void)
> > > >  {
> > > >      qemu_mutex_init(&XBZRLE.lock);
> > > > +    QEMU_BUILD_BUG_ON(RAM_SAVE_FLAG__MAX >= (1 <<
> > TARGET_PAGE_BITS_MIN));
> > > >      register_savevm_live("ram", 0, 4, &savevm_ram_handlers,
> > &ram_state);
> > > >  }
> > > >
> > > >
> > > > works; lets keep that in mind somewhere after Michael fixes AVR.
> > >
> > > You don't have a great deal of headroom even after getting AVR
> > > to change, by the way -- TARGET_PAGE_BITS_MIN for Arm is 10.
> > > So you might want to think about ways to eg reclaim usage of
> > > that "obsolete, not used" RAM_SAVE_FLAG_FULL bit.
> >
> > Yep, I've been warning anyone who adds one for ages
> >
> > > Also, what does the
> > >  /* 0x80 is reserved in migration.h start with 0x100 next */
> > > comment refer to? migration.h has no instances of "RAM_SAVE"
> > > or 0x80 or 1 << 7...
> >
> > It looks like it got moved to qemu-file.h a few years ago
> > as RAM_SAVE_FLAG_HOOK.
> >
> > Dave
> >
> > > thanks
> > > -- PMM
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> >
> 
> -- 
> Best Regards,
> Michael Rolnik
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


