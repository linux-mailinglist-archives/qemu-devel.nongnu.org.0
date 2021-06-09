Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FFC3A1A89
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:08:10 +0200 (CEST)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0kT-0002Rw-Mi
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lr0a8-0006xB-QX
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lr0a6-0007Wq-V9
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623254246;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvW7duW2k0nKDXCzDSinRyfUS+AB28M4QxQdIb2s160=;
 b=NWyzX0XeVoYoEQM7FGxp1dLk8VOU+b2qwBPh34y2I84j6uZoppskqtXFGKF7rjrea2FAxB
 R4RcmIzuKC58ea8CDIdKyjaLi1uv3CZ4syzlcksWKi9DkrC11pz8u3S8AhHrORfBscOulJ
 1aGel4c27fZbbn8hF8/LrXV7RZdgNBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-CutZiuaXOVSEBzqW19W5IA-1; Wed, 09 Jun 2021 11:57:21 -0400
X-MC-Unique: CutZiuaXOVSEBzqW19W5IA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C899100C664;
 Wed,  9 Jun 2021 15:57:21 +0000 (UTC)
Received: from redhat.com (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA14E608BA;
 Wed,  9 Jun 2021 15:57:19 +0000 (UTC)
Date: Wed, 9 Jun 2021 16:57:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 05/26] configure, meson: convert pam detection to meson
Message-ID: <YMDkOv/bkV5cWLp2@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-6-pbonzini@redhat.com>
 <08135c0f-ce6b-53ad-be57-eba428fbfbf5@linaro.org>
 <YL/RJUcRTCzlLq2y@redhat.com>
 <c5386a2c-a3b4-0354-5cde-dcbecc587ca9@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c5386a2c-a3b4-0354-5cde-dcbecc587ca9@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 08:46:22AM -0700, Richard Henderson wrote:
> On 6/8/21 1:20 PM, Daniel P. Berrangé wrote:
> > On Tue, Jun 08, 2021 at 12:45:51PM -0700, Richard Henderson wrote:
> > > On 6/8/21 4:22 AM, Paolo Bonzini wrote:
> > > > +pam = not_found
> > > > +if not get_option('auth_pam').auto() or have_system
> > > > +  pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
> > > 
> > > The condition doesn't look right.
> > > Why are we looking for pam if --disable-pam-auth?
> > > 
> > > Surely
> > > 
> > >    if not get_option('auth_pam').disabled() and have_system
> > 
> > This isn't entirely obvious at first glance, but the line after
> > the one you quote with the 'required' param makes it "do the
> > right thing (tm)".
> > 
> > The 'auth_pam' option is a tri-state taking 'enabled', 'disabled'
> > and 'auto', with 'auto' being the default state. When a tri-state
> > value is passed as the value of the 'required' parameter, then
> > 
> >     required==enabled   is interpreted as 'required=true'
> >     required==auto      is interpreted as 'required=false'
> >     required==disabled  means the entire call is a no-op
> > 
> > So this logic:
> > 
> >   if not get_option('auth_pam').auto() or have_system
> >      pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
> >                            required: get_option('auth_pam'),
> > 			  ...)
> > 
> > Means
> > 
> >    => If 'auto' is set, then only look for the library if we're
> >       building system emulators. In this case 'required:' will
> >       evaluate to 'false', and so we'll gracefully degrade
> >       if the library is missing.
> 
> If not have_system, there's no point in looking for pam *at all* regardless
> of get_option().

In theory we can simplify to

   if have_system
      pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
                            required: get_option('auth_pam'),
  	   		  ...)

and this will be fine for builds with system emulators. The only
caveat is that if someone disables system emulators while also
passing  -Dpam=enabled, we won't check for pam. That is a
nonsense combination of course, so probably doesn't matter

> 
> >    => If 'disabled' is set, then the 'find_library' call
> >       will not look for anything, immediately return a
> >       'not found' result and let the caller carry on.
> 
> This is not true.  If 'required: false', find_library *will* look for the
> library, but it will allow it to be missing.

feature==disabled does not map to required: false

  https://mesonbuild.com/Build-options.html#features

[quote]
    enabled is the same as passing required : true.
    auto is the same as passing required : false.
    disabled do not look for the dependency and always return 'not-found'.
[/quote]


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


