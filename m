Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC77D4B159C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:55:44 +0100 (CET)
Received: from localhost ([::1]:39814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEbX-00066c-7g
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:55:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nIDEl-0002rz-Nf
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:28:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nIDEX-0004Ms-Ue
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:28:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644514072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXtMQwuWHdgA5eRHqTSMnJqOBbk0sfcMTpbEFv6a/XY=;
 b=EwyiLVHdQONx/vIonyLvhSRZt8GdHVXTfqeDl6DyNS2c9L9OpDHzqE342+qOnIAA2pDj1a
 WbC7O79zDBfMH333yKaZ7te5uNvvPEvo5AWuBmGyG3sooNT1uMSzRGdN4rpcyJkG32Vir4
 dJROq1Hsl52jKwPQ6SNGs7RdxIyZHxI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-KrH8W0bGPcKa8hYwhbIPKA-1; Thu, 10 Feb 2022 12:27:41 -0500
X-MC-Unique: KrH8W0bGPcKa8hYwhbIPKA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r8-20020a7bc088000000b0037bbf779d26so1753874wmh.7
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 09:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=AXtMQwuWHdgA5eRHqTSMnJqOBbk0sfcMTpbEFv6a/XY=;
 b=vk5eqmBoICqeHtlRd5Q3kuczYf9CEjJwXJZXDFR+74t0dDeucWeyIOGaDgdPHBg0y5
 tt5aKA30HreN5bEeHQtwlK4/qYNZvnV+/iUE6E8lfsSJn/vyeZRv/5S2UlTtziHsIrq2
 CEOHvj44aA/oBvWhicxCbC2NnJVSDkkiE74vXnQ6gMA3uVIKZU72OmiVQurql1x5WSwV
 QIBi57uMKY4NBjVnFe8pO/xZS+SvjtNB1xnfif/mhRUsANkR+srKIQmqhjQbi9bz8RdY
 aKlsoAxkjMY3keWM7Cp7qv/1uGQJLGccqqqFmevpxrD9Et9Yg4uzcOj10twOan53JMna
 P8tQ==
X-Gm-Message-State: AOAM531wSW7Ob3VIzzjkQjjmnxvnFXBcvROILPoaba4FQOpuUpIQ7alk
 d3+/dgmHQNitK21X1eNU1WteIPCWjFOK1zXKCGnuavn+pV4EyEEGgIIPaVsYAOSVY7xn/lqbMcS
 El3vISb1YrLEzAYs=
X-Received: by 2002:adf:eb05:: with SMTP id s5mr7217028wrn.298.1644514060163; 
 Thu, 10 Feb 2022 09:27:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXMJ6O6SUDeo6lGtWyHhpYQeYQD9jyx6IDexBFCbCNpoy2DOa0ZnM2q8X5s8VWFNu6bPBHUg==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr7217010wrn.298.1644514059929; 
 Thu, 10 Feb 2022 09:27:39 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id v18sm15677871wrm.105.2022.02.10.09.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 09:27:39 -0800 (PST)
Date: Thu, 10 Feb 2022 17:27:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] Deprecate C virtiofsd
Message-ID: <YgVLCUE9y69iilGa@work-vm>
References: <20220209165040.56062-1-dgilbert@redhat.com>
 <YgTTbAWj1CGlmv/R@redhat.com> <YgVHr2zgTrPHVhez@work-vm>
 <YgVIxdu3/oyp3cU8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YgVIxdu3/oyp3cU8@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: virtio-fs@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Feb 10, 2022 at 05:13:19PM +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Wed, Feb 09, 2022 at 04:50:40PM +0000, Dr. David Alan Gilbert (git) wrote:
> > > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > > 
> > > > There's a nice new Rust implementation out there; recommend people
> > > > do new work on that.
> > > > 
> > > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > > ---
> > > >  docs/about/deprecated.rst | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > > 
> > > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > > index 47a594a3b6..3a0e15f8f5 100644
> > > > --- a/docs/about/deprecated.rst
> > > > +++ b/docs/about/deprecated.rst
> > > > @@ -454,3 +454,17 @@ nanoMIPS ISA
> > > >  
> > > >  The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
> > > >  As it is hard to generate binaries for it, declare it deprecated.
> > > > +
> > > > +Tools
> > > > +-----
> > > > +
> > > > +virtiofsd
> > > > +'''''''''
> > > > +
> > > > +There is a new Rust implementation of ``virtiofs`` at
> > > > +``https://gitlab.com/virtio-fs/virtiofsd``;
> > > > +since this is now marked stable, new development should be done on that
> > > > +rather than the existing C version in the QEMU tree.
> > > > +The C version will still accept fixes and patches that
> > > > +are already in development for the moment.
> > > 
> > > Just to be clear, 'deprecation' is usually expected to turn into
> > > 'deletion' a minimum of 2 releases later.  We are targetting the
> > > C virtiofsd to be deleted, right ?  The last sentance here gives
> > > vibes that we're expecting it to stick around despite deprecation.
> > 
> > I am targeting it to be deleted, but I'm expecting to give it a bit
> > more time than 2 releases; how do I do that?
> 
> You can forget to remove it after 2 releases, which is what
> happens with many deprecations :-)  '2' is really just the
> minimum bar in practice.

OK, I can remember to forget.

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


