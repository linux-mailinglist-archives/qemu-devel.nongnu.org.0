Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F6B389209
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:53:59 +0200 (CEST)
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNaA-0000yj-Dm
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ljNVn-0005cw-GK
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ljNVf-0003UJ-Ff
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621435758;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ngzjbfa4dnJ7VCGPENzaTXIurcbEomB7ubIW8xiuOsE=;
 b=DgQeKnp6oBCq8FaunBkGfTI3nAfyt/jYyx6HwwyxGyM0QdTclomhAnbWjfdaYr7oD6Rc+w
 uCVvsfGXD2rvq4MsDAYbL8rwEapd+zjMGlFn8TfH6y/j4/aKNp/g8ulLX93L0oiuuNZE9o
 zDg1ZwCM6a+YsEHXtA41nJhTWETmlmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-15BjGbEbOHmBI-J-vsJSoQ-1; Wed, 19 May 2021 10:49:13 -0400
X-MC-Unique: 15BjGbEbOHmBI-J-vsJSoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE35A107ACC7
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 14:49:12 +0000 (UTC)
Received: from redhat.com (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43F9B19023;
 Wed, 19 May 2021 14:49:08 +0000 (UTC)
Date: Wed, 19 May 2021 15:49:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Automatic module loading (was: [PATCH] qemu-config: load modules
 when instantiating option groups)
Message-ID: <YKUlYciVgkD6QPt2@redhat.com>
References: <20210518131542.2941207-1-pbonzini@redhat.com>
 <87h7iyoofl.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h7iyoofl.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 03:14:54PM +0200, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > Right now the SPICE module is special cased to be loaded when processing
> > of the -spice command line option.  However, the spice option group
> > can also be brought in via -readconfig, in which case the module is
> > not loaded.
> >
> > Add a generic hook to load modules that provide a QemuOpts group,
> > and use it for the "spice" and "iscsi" groups.
> >
> > Fixes: #194
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1910696
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> What follows is not an objection to this patch.
> 
> I think we have this kind of bugs because we're kind of wobbly on when
> to load modules.
> 
> On the one hand, we're trying to load modules only when needed.  This is
> obviously useful to conserve resources, and to keep the attack surface
> small.  Some background in
> 
>     Message-ID: <20210409064642.ah2tz5vjz2ngfiyo@sirius.home.kraxel.org>
>     https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01393.html

I'm not convinced by the runtime attack surface argument, because even
if QEMU doesn't auto-load, if the attacker has gained enough control
over QEMU that they can jump into code that is not otherwise enabled
by QEMU config, then they can likely scribble into RAM in a way that
triggers dlopen() of any .so on the filesystem, whether a QEMU module
or not.

IMHO the main benefit of modules is that you can avoid installing
everything on disk, and thus avoid pulling in a long chain of deps,
and thus get smaller containers, and avoid having to worry about
software updates for CVEs in things you're not using.

> On the other hand, we're trying to make modules transparent to
> management applications, i.e. QEMU looks the same whether something was
> compiled as a loadable module or linked into QEMU itself.  See
> 
>     Message-ID: <YHAhQWdX15V54U8G@redhat.com>
>     https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01450.html
> 
> I'm afraid we sort of fail at both.
>
> Transparency to management applications requires us to load modules on
> QOM introspection already.

Yes, and bugs in the latter have already caused mis-behavior in
libvirt.


> Example: to answer "show me all QOM types", we need to load all modules
> that could possibly register QOM types.  As long as module code can do
> whatever it wants, that means loading all of them.
> 
> Example: to answer "show me QOM type FOO", where FOO is currently
> unknown, we need to load all modules that could possible register QOM
> type FOO.  Again, that means loading all of them.
> 
> We don't actually do this.  Instead, we hardcode a map from type name to
> module name[*], so we don't have to load them all, and we actually load
> the module specified by this map only sometimes, namely when we call
> module_object_class_by_name() instead of object_class_by_name().  I
> can't discern rules when to call which one.  Wobbly.
> 
> Things other than QOM might be affected, too.
> 
> QAPI introspection is not: the value of query-qmp-schema is fixed at
> compile-time, and *how* something is compiled (loadable module
> vs. linked into QEMU itself) does not affect it.
> 
> I'd like us to develop a clearer understanding when exactly modules are
> to be loaded.

Agreed, we need much better defined behaviour here.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


