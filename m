Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB83A0518
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:22:00 +0200 (CEST)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiEZ-0005H8-E4
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqiDo-0004cR-W3
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:21:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqiDi-0007Xh-VO
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623183665;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uP1kam469ioHjrBfowFB0csLPpIc0a+/IpTo2tngiUk=;
 b=ZG5CcLs+fadYCF3mzO/Jv3uCwB1Z5r8ahA7tmKjB6b0T6iau4oO5yB5e/NkmlWJsXsBREh
 OZDkS5uqtsughS6asVntH7bq60uCVuScuFexKwhpzanyVQ+RDDer6rcCxOZy5vkCBA1ywG
 T137H9P/f4dbcOautebVJ6HjlUuD40Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-7DDwuWG6MuqNzUlOqWlL4g-1; Tue, 08 Jun 2021 16:21:01 -0400
X-MC-Unique: 7DDwuWG6MuqNzUlOqWlL4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B077D8186E6;
 Tue,  8 Jun 2021 20:21:00 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EFC95D9DC;
 Tue,  8 Jun 2021 20:20:58 +0000 (UTC)
Date: Tue, 8 Jun 2021 21:20:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 05/26] configure, meson: convert pam detection to meson
Message-ID: <YL/RJUcRTCzlLq2y@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-6-pbonzini@redhat.com>
 <08135c0f-ce6b-53ad-be57-eba428fbfbf5@linaro.org>
MIME-Version: 1.0
In-Reply-To: <08135c0f-ce6b-53ad-be57-eba428fbfbf5@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 12:45:51PM -0700, Richard Henderson wrote:
> On 6/8/21 4:22 AM, Paolo Bonzini wrote:
> > +pam = not_found
> > +if not get_option('auth_pam').auto() or have_system
> > +  pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
> 
> The condition doesn't look right.
> Why are we looking for pam if --disable-pam-auth?
> 
> Surely
> 
>   if not get_option('auth_pam').disabled() and have_system

This isn't entirely obvious at first glance, but the line after
the one you quote with the 'required' param makes it "do the
right thing (tm)".

The 'auth_pam' option is a tri-state taking 'enabled', 'disabled'
and 'auto', with 'auto' being the default state. When a tri-state
value is passed as the value of the 'required' parameter, then

   required==enabled   is interpreted as 'required=true'
   required==auto      is interpreted as 'required=false'
   required==disabled  means the entire call is a no-op

So this logic:

 if not get_option('auth_pam').auto() or have_system
    pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
                          required: get_option('auth_pam'),
			  ...)

Means

  => If 'auto' is set, then only look for the library if we're
     building system emulators. In this case 'required:' will
     evaluate to 'false', and so we'll gracefully degrade
     if the library is missing.


  => If 'enabled' is set, then we'll look for the library
     and if it is missing then it is a fatal error as
     'required' will evaluate to 'true'.

  => If 'disabled' is set, then the 'find_library' call
     will not look for anything, immediately return a
     'not found' result and let the caller carry on.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


