Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A8C3A82E0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:31:20 +0200 (CEST)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltA63-0002Cx-CA
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lt9ze-0001d0-A1
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lt9zb-00034O-7Q
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623767078;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tj7+mzLT5YF5GqBnwgOkgjsZMe9Vwf4qGeR994dE3cg=;
 b=S+z9Ie+pe7hjSQYT85Gk/VL9OnDCWD58zvwEr9ADz6v2y3y6fmC508PUoXKw7s7SSGMrHZ
 neTAXgV8hjuWZXLSYyvU/uhZ9c4p0u3bOZ7glZ+KLpqEje7RIMTywfpQ66EYkcYqEoYa30
 Zibv4ERHen2VeoMrKzzVYl1peEhayb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-RPvzn38SOA-t5O3YbwZcuQ-1; Tue, 15 Jun 2021 10:24:35 -0400
X-MC-Unique: RPvzn38SOA-t5O3YbwZcuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EE21800D62
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 14:24:34 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FAF117BB2;
 Tue, 15 Jun 2021 14:24:33 +0000 (UTC)
Date: Tue, 15 Jun 2021 15:24:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 09/26] configure, meson: convert vte detection to meson
Message-ID: <YMi4HunPKXQF0j79@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-10-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-10-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 01:22:44PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 35 ++++-------------------------------
>  meson.build       | 22 ++++++++++++++++------
>  meson_options.txt |  2 ++
>  3 files changed, 22 insertions(+), 37 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> @@ -871,14 +872,22 @@ if not get_option('gtk').auto() or (have_system and not cocoa.found())
>                          required: false,
>                          kwargs: static_kwargs)
>      gtk = declare_dependency(dependencies: [gtk, gtkx11])
> +
> +    if not get_option('vte').auto() or have_system
> +      vte = dependency('vte-2.91', version: '>=0.32.0',
> +                       method: 'pkg-config',
> +                       required: get_option('vte'),
> +                       kwargs: static_kwargs)
> +      if not vte.found()
> +        vte = dependency('vte-2.90', version: '>=0.32.0',
> +                         method: 'pkg-config',
> +                         required: get_option('vte'),
> +                         kwargs: static_kwargs)
> +      endif

The old configure checks didn't have a version number How did you
decide on 0.32 ?  This version number doesn't make a whole lot of
sense to me in the way it is used.

vte changes from ABI 2.90 to 2.91 in release 0.37, so you'll never
get a version less than that with vte-2.91 IIUC.

Meanwhile all our supported distros ship 2.91 API now AFAICT, so we
don't need the 2.90 code at all.

I'd suggest dropping vte-2.90 in the configure script first, and then
doing a simpler meson conversion.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


