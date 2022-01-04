Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554CD484233
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:18:06 +0100 (CET)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jhV-0005Xi-F3
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:18:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4jed-0003UC-1M
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:15:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4jeZ-0000rZ-QL
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641302102;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WurceZt3abB3kUEU4c0g3k2AVS23+HIux5IdJIvVNds=;
 b=A7+mUo6FB1WkU2diQpCcwpOohDrqxbaWEI/G7SvCF0bYj9a9lqtZf22YANM9EvnF1n3E5N
 ov+9yOsmjCsg1zxCiQsNG6un2wFJ2UahqilKVkUaTlCZzK5WoLUeHO4X3IDAceTOfrwYWO
 V9F9w9bw9/4o4gg0Q/NOoFkBzw0pNKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-XDZK_iFEO5qmI6h5ikXZww-1; Tue, 04 Jan 2022 08:14:54 -0500
X-MC-Unique: XDZK_iFEO5qmI6h5ikXZww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5CF71006AA8;
 Tue,  4 Jan 2022 13:14:53 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC0C1079F52;
 Tue,  4 Jan 2022 13:14:35 +0000 (UTC)
Date: Tue, 4 Jan 2022 13:14:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using JSON
 syntax for -device
Message-ID: <YdRIOC4XbSOLDpMj@redhat.com>
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
 <877dbyjj0t.fsf@dusky.pond.sub.org>
 <87h7b2i07h.fsf@dusky.pond.sub.org>
 <1b8249e6-ffe1-86e4-a2e8-c85c794438e0@redhat.com>
 <871r26ge4z.fsf@dusky.pond.sub.org>
 <20211222082247.epv27gxeq622d2ts@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211222082247.epv27gxeq622d2ts@sirius.home.kraxel.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 MkfsSion <mkfssion@mkfssion.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 09:22:47AM +0100, Gerd Hoffmann wrote:
> On Tue, Dec 21, 2021 at 04:40:28PM +0100, Markus Armbruster wrote:
> > Paolo Bonzini <pbonzini@redhat.com> writes:
> > 
> > > On 12/21/21 13:58, Markus Armbruster wrote:
> > >>> Is this a regression?  I suspect commit 5dacda5167 "vl: Enable JSON
> > >>> syntax for -device" (v6.2.0).
> > >> 
> > >> Obviously not a regression: everything that used to work still works.
> > >
> > > FWIW I think -set should be deprecated.  I'm not aware of any
> > > particularly useful use of it.  There are a couple in the QEMU tests
> > > (in vhost-user-test and in qemu-iotests 068), but in both cases the
> > > code would be easier to follow without; patches can be dusted off if
> > > desired.
> > 
> > -set has its uses, but they're kind of obscure.  When you want to use
> > some canned configuration with slight modifications, then -readconfig
> > canned.cfg -set ... is nicer than editing a copy of canned.cfg.
> 
> Simliar: configure stuff not supported by libvirt:
> 
>   <qemu:commandline>
>     <qemu:arg value='-set'/>
>     <qemu:arg value='device.video0.guestdebug=1'/>
>   </qemu:commandline>
> 
> There will always be a gap between qemu and libvirt, even if most of
> them are temporary only (while developing a new feature).  I think we
> need some way to deal with this kind of tweaks when moving to QAPI-based
> machine setup.  Possibly not in qemu, maybe it's easier to add new
> '<qemu:set device=... property=... value=...>' syntax to libvirt.

Yes, I'd suggest we get

   <qemu:device alias="video0" name="guestdebug" value="1/>

and then libvirt can use it to add  'guestdebug: 1' directly to the 
JSON it generates, avoiding -set entirely.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


