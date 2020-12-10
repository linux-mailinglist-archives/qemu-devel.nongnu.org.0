Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299692D5C69
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:54:36 +0100 (CET)
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMOx-00008b-6k
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knMDp-00054a-Lf
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:43:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knMDm-0000U6-7M
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607607778;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ur48yTfe+fDJU50icGHF0BIQhn3ZcLf8taUKWdszR0=;
 b=LC70TC1UPS2Tizjd2gQVOKcNiA4oGw2soSUMNgAcddOMyOz9bXwoJ25YUStsH3xIlIQOq5
 V1y9bluALtLXst3zKjhWvieTA+1E52P6o48Kyv+I9oFWkqvy4c+OpAYg7e+QBb9mla5NSi
 rjvHU/HXH9J2BryPXb8heZ7D8y7QcWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585--PpAU5MYNoyhIUMELbJ4zw-1; Thu, 10 Dec 2020 08:42:53 -0500
X-MC-Unique: -PpAU5MYNoyhIUMELbJ4zw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D84CFC28C;
 Thu, 10 Dec 2020 13:42:51 +0000 (UTC)
Received: from redhat.com (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 371CD5C559;
 Thu, 10 Dec 2020 13:42:50 +0000 (UTC)
Date: Thu, 10 Dec 2020 13:42:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 02/13] qemu/atomic: Drop special case for unsupported
 compiler
Message-ID: <20201210134247.GH24855@redhat.com>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-3-marcandre.lureau@redhat.com>
 <CAFEAcA8QY_rt_JXy+O-3nOJUvbeAz7QMfXU3uDm78JigNvogiA@mail.gmail.com>
 <20201126120624.GE1122957@redhat.com>
 <CAFEAcA-uE7-NjWQLHz2QWznjOhRExuTKWH-J9vz6=kQ4fvwdKA@mail.gmail.com>
 <CAJ+F1CLKyi6aDuf6w7kQRuyPa_xEXnRBM_gX8dCRzfvmrVjbDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLKyi6aDuf6w7kQRuyPa_xEXnRBM_gX8dCRzfvmrVjbDA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 05:17:05PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Nov 26, 2020 at 4:23 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> 
> > On Thu, 26 Nov 2020 at 12:06, Daniel P. Berrangé <berrange@redhat.com>
> > wrote:
> > >
> > > On Thu, Nov 26, 2020 at 11:49:28AM +0000, Peter Maydell wrote:
> > > > On Thu, 26 Nov 2020 at 11:29, <marcandre.lureau@redhat.com> wrote:
> > > > >
> > > > > From: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > > >
> > > > > Since commit efc6c070aca ("configure: Add a test for the
> > > > > minimum compiler version") the minimum compiler version
> > > > > required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.
> > > > >
> > > > > We can safely remove the special case introduced in commit
> > > > > a281ebc11a6 ("virtio: add missing mb() on notification").
> > > > >
> > > > > With clang 3.8 (xenial amd64) __ATOMIC_RELAXED is defined, so the
> > chunk
> > > > > to remove (which is x86-specific), isn't reached.
> > > >
> > > > The minimum clang version enforced by configure is 3.4, not 3.8.
> > > > (Or Apple XCode clang 5.1 -- they use a different versioning scheme!)
> > >
> > > We picked clang 3.4 based on fact that is what ships in EPEL7, and
> > > Debian Jessie 3.5.  We then picked the XCode version to match.
> > >
> > > Based on our platform support matrix we no longer support Debian
> > > Jessie, and IMHO we also don't really need to consider 3rd party
> > > add-on repos shipping non-default toolschains. So IMHO we could
> > > entirely ignore clang in EPEL7 when picking min versions.
> > >
> > > IOW, we are likely justified in picking a new clang version if
> > > someone wants to research what is a suitable min version across
> > > our intended supported distros.
> >
> > Sure, but if we do that then the series should start with the
> > "bump the minimum clang version" patch with accompanying
> > justification.
> >
> 
> 
> With clang-3.4.2-9.el7.x86_64 (epel7), __ATOMIC_RELAXED is defined. I'll
> update the commit message.
> 
> Some research on google suggests that it might be true also with XCode
> clang 5.1, I could use some help to verify that:
> clang -dM -E - < /dev/null | grep __ATOMIC_RELAXED

The oldest xcode that travis has support for is 7.3. I'd really just
suggest bumping min clang to something more modern, than trying to
find xcode 5.1
 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


