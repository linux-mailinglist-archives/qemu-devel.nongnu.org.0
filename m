Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D256B8E5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:52:27 +0200 (CEST)
Received: from localhost ([::1]:58566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9mX4-0008BE-I3
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9mVD-0007De-B4
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:50:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9mV7-0001FX-9Q
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657281023;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5AjARv5fCXEa+NGhAzHgDPeK0UNIuSKT2ar6SwIXEQ=;
 b=I0P286XYGKDmeMM1rzApwvo90DQZTVAWMaLSHDm+94gi9GD4YaZS4eSUbExcBw+Kl5yxvF
 sZQpRIAVptRKajKHCnoD6oHSrGrVGtd7kbuxqnSFxXahXZhtnTKQ6cTGSVyVRgaPKBs2ib
 3egI3Rx6MoVhAfyWzv0dz4zwllnXmZg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-yZIBQKDmOF6KZ1dd5YwLwg-1; Fri, 08 Jul 2022 07:50:22 -0400
X-MC-Unique: yZIBQKDmOF6KZ1dd5YwLwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB8001C01B47;
 Fri,  8 Jul 2022 11:50:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7991415117;
 Fri,  8 Jul 2022 11:50:18 +0000 (UTC)
Date: Fri, 8 Jul 2022 12:50:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@gmail.com>
Subject: Re: The case for array properties (was: [PULL 14/15] qdev: Base
 object creation on QDict rather than QemuOpts)
Message-ID: <YsgZ+MbzoNxnYAmb@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
 <20211015144640.198044-15-kwolf@redhat.com>
 <CAFEAcA9jnySMWRD56FF9D7rXhwARiyvqJx+4Ys+smYa2ghdLBg@mail.gmail.com>
 <87wnctzdl9.fsf@pond.sub.org>
 <CAFEAcA_cYpt_FU5mD+X+BSmQq9e6u1n+nm8EVfdrPeVN0o3Spw@mail.gmail.com>
 <87y1x37ryc.fsf_-_@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1x37ryc.fsf_-_@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jul 08, 2022 at 01:40:43PM +0200, Markus Armbruster wrote:
> Cc'ing QOM maintainers.
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Mon, 4 Jul 2022 at 05:50, Markus Armbruster <armbru@redhat.com> wrote:
> >> My initial (knee-jerk) reaction to breaking array properties: Faster,
> >> Pussycat! Kill! Kill!
> >
> > In an ideal world, what would you replace them with?
> 
> Let's first recapitulate their intended purpose.
> 
> commit 339659041f87a76f8b71ad3d12cadfc5f89b4bb3q
> Author: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> Date:   Tue Aug 19 23:55:52 2014 -0700
> 
>     qom: Add automatic arrayification to object_property_add()
>     
>     If "[*]" is given as the last part of a QOM property name, treat that
>     as an array property. The added property is given the first available
>     name, replacing the * with a decimal number counting from 0.
>     
>     First add with name "foo[*]" will be "foo[0]". Second "foo[1]" and so
>     on.
>     
>     Callers may inspect the ObjectProperty * return value to see what
>     number the added property was given.
>     
>     Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>     Signed-off-by: Andreas Färber <afaerber@suse.de>
> 
> This describes how they work, but sadly not why we want them.  For such
> arcane lore, we need to consult a guru.  Possibly via the mailing list
> archive.

Also doesn't describe why we need to explicitly set the array length
upfront, rather than inferring it from the set of elements that are
specified, auto-extending the array bounds as we set each property.

> Digression: when you add a feature, please, please, *please* explain why
> you need it right in the commit message.  Such rationale is useful
> information, tends to age well, and can be quite laborious to
> reconstruct later.
> 
> Even though I'm sure we discussed the intended purpose(s) of array
> properties before, a quick grep of my list archive comes up mostly
> empty, so I'm falling back to (foggy) memory.  Please correct mistakes
> and fill in omissions.
> 
> We occasionally have a need for an array of properties where the length
> of the array is not fixed at compile time.  Say in code common to
> several related devices, where some have two frobs, some four, and a
> future one may have some other number.
> 
> We could define properties frob0, frob1, ... frobN for some fixed N.
> Users have to set them like frob0=...,frob1=... and so forth.  We need
> code to reject frobI=... for I exeeding the actual limit.
> 
> Array properties spare developers picking a fixed N, and users adding an
> index to the property name.  Whether the latter is a good idea is
> unclear.  We need code to reject usage exceeding the actual limit.

If we consider that our canonical representation is aiming to be QAPI,
and QAPI has unbounded arrays, then by implication if we want a mapping
to a flat CLI syntax, then we need some mechanism for unbounded arrays.

It would be valid to argue that we shouldn'be be trying to map the full
expressiveness of QAPI into a flat CLI syntax though, and should just
strive for full JSON everywhere.

Indeed every time we have these discussions, I wish we were already at
the "full JSON everywhere" point, so we can stop consuming our time
debating how to flatten JSON structure into CLI options. But since
these array props already exist, we need to find a way out of the
problem...

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


