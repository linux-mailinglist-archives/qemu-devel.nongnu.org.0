Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6814D8C05
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:03:17 +0100 (CET)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpyO-00068P-0N
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:03:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTpwc-0005Ll-2v
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTpwa-0004WD-5I
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647284482;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5btzAa4+VFr81OO+gvbpBXPnzdfv2idYQv/Im6A5dtU=;
 b=glVvQpwvVqurPsIJ4l1muppb5fXuqEXP4jOQx2BnxygS7dSHBzIzBSdaFszBLWC2B050rN
 GmbfEaLAYnZBjmZoxZwD4qEhIcZrPyw3M6ulXzva6DPdnIgmL9zGlMKwZWUcrAqrqECzyI
 CvMTrXupLIhf4TxD9fsZZOJQh6Q8/Wo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-Z03PoIzANbyhlrYgQ3SZGA-1; Mon, 14 Mar 2022 15:01:11 -0400
X-MC-Unique: Z03PoIzANbyhlrYgQ3SZGA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56EEE3803915;
 Mon, 14 Mar 2022 19:01:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F7E64B8D4F;
 Mon, 14 Mar 2022 19:01:09 +0000 (UTC)
Date: Mon, 14 Mar 2022 19:01:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Deason <adeason@sinenomine.net>
Subject: Re: [PATCH 1/2] util/osdep: Avoid madvise proto on modern Solaris
Message-ID: <Yi+Q8oBqowBP1Ldw@redhat.com>
References: <20220314154557.306-1-adeason@sinenomine.net>
 <20220314154557.306-2-adeason@sinenomine.net>
 <CAFEAcA8DZby3k7rZ3F4m037b_qjANzEk-ekVQYxAm5tN1_v84w@mail.gmail.com>
 <20220314131800.89dbb505371e68c7ad382795@sinenomine.net>
MIME-Version: 1.0
In-Reply-To: <20220314131800.89dbb505371e68c7ad382795@sinenomine.net>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 01:18:00PM -0500, Andrew Deason wrote:
> On Mon, 14 Mar 2022 16:36:00 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > On Mon, 14 Mar 2022 at 16:12, Andrew Deason <adeason@sinenomine.net> wrote:
> > >  #ifdef CONFIG_SOLARIS
> > >  #include <sys/statvfs.h>
> > > +#ifndef HAVE_MADVISE_PROTO
> > >  /* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
> > >     discussion about Solaris header problems */
> > >  extern int madvise(char *, size_t, int);
> > >  #endif
> > > +#endif
> > 
> > Rather than keeping this inside a CONFIG_SOLARIS and only doing
> > the meson.build test if targetos == sunos, I would prefer it if we
> > unconditionally determined two things in meson.build:
> >  (1) do we have madvise in the usual way? (this is what we would
> >      want CONFIG_MADVISE to be, and might even be what it actually is)
> >  (2) do we have madvise but only if we provide a prototype for it
> >      ourselves? (maybe CONFIG_MADVISE_NO_PROTO)
> 
> CONFIG_MADVISE is set if we can cc.links() something that calls
> madvise(). If we're missing the prototype, that will fail with -Werror,
> but I expect succeeds otherwise. If cc.links() just uses the cflags for
> the build, then it seems like it might succeed or fail depending on
> --enable-werror. I see some other tests give -Werror as an explicit
> extra argument (HAVE_BROKEN_SIZE_MAX, and something for fuzzing); should
> this be doing the same to make sure it fails for a missing prototype?
> 
> Also just to mention, if we don't care about older Solaris, the
> prototype can just be unconditionally removed. It's pretty annoying to
> even try to build qemu from git on Solaris 11.4 and earlier, because
> many of the build requirements need to be installed/compiled manually
> (notably python 3.6+, but iirc also ninja, meson, etc). So I haven't
> really tried; there may be many other build issues there.

If we had a tiered support status, Solaris  would be tier 3
right now, as we have no testing of it at all. If it compiles
at any given point in time it is luck.

We have a general purpose platform support policy

  https://www.qemu.org/docs/master/about/build-platforms.html

where the common rule ends up being "the current major release,
and the previous major release for 2 years overlap".

The question is what counts as a major release from a Solaris
POV ? In terms of long life distros, our policy gives about
4-5 years of supportable life in the best case. I wouldn't
want to go beyond that ballpark for Solaris.  Can we come up
with an interpration of our policy to map to Solaris that
doesn't tie our hands for longer than 4-5 years worst case.


IOW, we certainly do NOT need to support arbitrarily old
Solaris. If madvise has done what we need for 4-5 years,
then we can likely not need to test for it, and just assume
its existance. This just requires someone to specify how
we interpret our build platform policy to exclude older
Solaris.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


