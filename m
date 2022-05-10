Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5CC5212F8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:59:00 +0200 (CEST)
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNZz-0004Pw-Lt
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noNYH-0003b4-Ee
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noNYF-000874-Ho
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652180230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1+szGsML5sVa7ccWgfZIPk2YyC6lX2IPRIz1GG2Zsg=;
 b=fIuIElo9LTQjRP48wgBcafLsrOm1ChqmGbKk0vUbSTFqdLueJNJtlzDZQrqcatJ1WvAvwl
 eVBLXMgvKfcEkqHL0EmnDNQ8Kj+j35qjdA89ATNSAjAzDmMnCZy9U3xHgW3JsxcbkFQT7d
 76Y9msyR/BpVq767ZAEOTiDQW4tyByE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-CpePeDouPamwH_POEnruBg-1; Tue, 10 May 2022 06:57:09 -0400
X-MC-Unique: CpePeDouPamwH_POEnruBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66CDD811E7A
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 10:57:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D420D40C1421;
 Tue, 10 May 2022 10:57:07 +0000 (UTC)
Date: Tue, 10 May 2022 11:57:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <YnpFAW5I7B0WKsGi@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <20220510090604.ovqqybzyo6cebev7@tapioca>
 <Ynotu3ivXbZldduB@redhat.com> <YnoxQXWy9dQx9via@redhat.com>
 <20220510105047.jepitwuv64ammxox@tapioca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510105047.jepitwuv64ammxox@tapioca>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

On Tue, May 10, 2022 at 12:50:47PM +0200, Victor Toso wrote:
> Hi,
> 
> On Tue, May 10, 2022 at 10:32:49AM +0100, Daniel P. Berrangé wrote:
> > On Tue, May 10, 2022 at 10:18:15AM +0100, Daniel P. Berrangé wrote:
> > > On Tue, May 10, 2022 at 11:06:39AM +0200, Victor Toso wrote:
> > > > > > > generated code needs to be compatible with other Golang projects,
> > > > > > > such as the ones mentioned above. My intention is to keep a Go
> > > > > > > module with a MIT license.
> > > > > >
> > > > > > Meh.  Can't be helped, I guess.
> > > > > 
> > > > > This does make me wonder though whether the license of the QAPI
> > > > > input files has a bearing on the Go (or other $LANGUAGE) ouput
> > > > > files. eg is the Go code to be considered a derived work of the
> > > > > QAPI JSON files.
> > > > 
> > > > GPL does not enforce that the generated code to be GPL [0] unless
> > > > the generator copies GPL code to the output. My only concern has
> > > > been the fact that I am copying the documentation of QAPI
> > > > specification to the Go package in order to have data structures,
> > > > commands, etc. with the information provided by the
> > > > specification.
> > > > 
> > > > [0] https://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html#GPLOutput
> > > >
> > > > > I'm not finding a clearly articulated POV on this question so
> > > > > far.
> > > > 
> > > > I don't find it trivial either but I've accepted that the Go data
> > > > structures are fine based on [0] and the documentation can be
> > > > split from the Go module (sadly!) if someone finds it to be a
> > > > legal issue.
> > > 
> > > Ah well that link above is actually reasonably clear:
> > > 
> > >   "More generally, when a program translates its input into 
> > >    some other form, the copyright status of the output inherits
> > >    that of the input it was generated from. "
> > > 
> > > In our case the input is the QAPI JSON, and we're translating that
> > > into  Golang. That could be read as meaning our Golang code has to
> > > be GPLv2+ licensed just as with the QAPI, not merely the docs.
> > 
> > Oh but I'm forgetting that QAPI JSON can be said to be our
> > public API interface, and so while the docs text would be
> > GPLv2+, we can claim fair use for the interface definition in
> > the generator and pick an arbitrary output license.
> 
> Still, it explicit says in the section "In what cases is the
> output of a GPL program covered by the GPL too?" is " Only when
> the program copies part of itself into the output".
> 
>     https://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html#WhatCaseIsOutputGPL
> 
> So, to my understating, even if we are consuming a GPLv2+ spec
> with a GPLv2+ generator, the output does not need to be GPLv2+
> too, unless we are *copying* parts of the input/generator into
> the output - which is the case for the documentation only.
> 
> I'll raise this again with the my company's legal team to be
> sure.
> 
> > We could likely deal with the docs problem by not copying the
> > docs directly into the generated code, instead link to the
> > published docs on qemu.org. This would require us to improve
> > our current docs generated anchor generation. ie currently docs
> > link for say the struct 'NumaNodeOptions' potentially changes
> > every time we generate it
> > 
> > https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html#qapidoc-2416
> > 
> > we would need to that be something stable, ie
> > 
> > https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html#struct-NumaNodeOptions
> > 
> > Then the generated Go can just do
> > 
> >    // See QAPI docs at https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html#struct-NumaNodeOptions
> > 
> > thus avoiding any copyright complication
> 
> Yes, but it would be quite sad solution. Documentation in Go is
> bounded to the module source code and we would be making people
> jump thorough links here.
> 
> I mean, if that's what we need to do, okay.

It isn't the end of the world IMHO, as people are typically browsing
docs from the online docs site, so full details are only a click away.

This is what I did in libvirt Go APIs for example

  https://pkg.go.dev/libvirt.org/go/libvirt#Domain.SnapshotLookupByName

I feel the biggest impact for developers is actually the quality of
the docs that exist. Time invested in better QAPI docs will have more
impact on developers, than trying to eliminate the need to follow one
extra hyperlink.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


