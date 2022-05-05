Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C6751C101
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:41:40 +0200 (CEST)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmbjf-0005Gh-EF
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmbhO-0003VS-00
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:39:18 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:32354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmbhI-00055N-UM
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651757951;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1GeH8Z8gSmNDAVgVR6KvZW+ch8Z9oLifAFRS7cUCWCc=;
 b=alPrmhB5fyEzO9Ddr/1JujcDEaZUDPjrXfJgf/VHkgUIZLACobpUlYu08NmZXTzY5RDMHP
 5MRQ2eeN9dpnlJF6Pdir5NHcRLTeU1T/e14/OnJe9hsEcicpci0+VOAq8NBKQE52h/jlq2
 Km5PBy3YB9+TGXWlXBynNWNTiFb+sUA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-_fQQo-ngOhCYFFA84RZNVw-1; Thu, 05 May 2022 09:39:08 -0400
X-MC-Unique: _fQQo-ngOhCYFFA84RZNVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E270F1014A61;
 Thu,  5 May 2022 13:39:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04A7040CF900;
 Thu,  5 May 2022 13:39:06 +0000 (UTC)
Date: Thu, 5 May 2022 14:39:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 mark.kanda@oracle.com, dgilbert@redhat.com
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
Message-ID: <YnPTeO8PvfpH4jMQ@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com>
 <87sfpp3018.fsf@pond.sub.org>
 <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
 <87v8ukt8g8.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87v8ukt8g8.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 05, 2022 at 03:28:23PM +0200, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > Il 4 maggio 2022 15:22:27 CEST, Markus Armbruster <armbru@redhat.com> ha scritto:
> >>Can you point to existing uses of KVM binary stats introspection data?
> >
> > There's none, but Google is using it in house. The same data was available before in debugfs and available via the kvm_stat script, so you could also refer to Christian Borntraeger's KVM Forum 2019 talk. The problems with debugfs are basically that it's only available to root and is disabled by secure boot (both issues are not fixable on general because they are Linux policy).
> 
> I keep bothering you about use cases, because I'm habitually opposed to
> adding features without credible use cases.
> 
> For small features, a bit of plausible hand-waving can suffice, but this
> one isn't small enough for that.
> 
> Plausible hand-waving can sometimes suffice for *experimental* features.
> Say when the use case can't really materialize without the feature.
> 
> Double-checking (pardon my ignorance): we're basically exposing the host
> kernel's KVM stats via QMP, with the option of extending it to other
> sources of stats in the future.  Correct?
> 
> I think the argument for accepting the interface is basically "if it's
> good enough for the kernel, it's good enough for us".  Valid point.
> 
> This means we'll acquire yet another introspection system, unrelated to
> the introspection systems we already have in QEMU.

The second introspection system was the bit I disliked the most.

The inherant tension we have in that respect is that traditionally
with QMP we explicitly /want/ the developer to have todo design+coding
work to expose every new piece of data. Similarly on the client side
we are expecting work to consume any new piece of data.

With this command we explicitly do NOT want the developer to do
any new design+coding work, but instead allow almost arbitrary
passthrough of whatever data the kernel decides to expose, and
consumption of arbitrary data without writing new code.

There is some appeal in why we want todo that, but it is certainly
a divergance from our historical approach to QMP, so we shouldn't
make this decision lightly.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


