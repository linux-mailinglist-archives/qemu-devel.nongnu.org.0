Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1078D532B68
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 15:39:28 +0200 (CEST)
Received: from localhost ([::1]:55810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntUkw-00066q-PG
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 09:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntUjq-0005M5-PW
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:38:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntUjo-0007vF-26
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653399495;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjyQ/0UPWSzNPSVHXKbPIzhuLBFKiLBgqCYI6CEtTI0=;
 b=RV07F5e3RaVYCxQE7rRrr8zpgyb5WVLIq+JRlxGcoNu0J147CaiSIh1HsWvQXoKFTHNbwM
 /kPCkv1Si98Jr1kVorZXR18WSkzOYtLHLy0BBwwqp8Do0nzM7srGO0uuXJ6hv9DzmyCKez
 +rlal0YgdXxQooDEfoHnzPJML/A2kBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-bGzmwMyaMdW0as4fqbAoaQ-1; Tue, 24 May 2022 09:38:12 -0400
X-MC-Unique: bGzmwMyaMdW0as4fqbAoaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9872B858EEE;
 Tue, 24 May 2022 13:38:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65DBF1410F36;
 Tue, 24 May 2022 13:38:10 +0000 (UTC)
Date: Tue, 24 May 2022 14:38:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
Message-ID: <Yozfv2k3dnPy4hEJ@redhat.com>
References: <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
 <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
 <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
 <f4f5afc8-0b01-e134-bb83-b3d0ded0439a@redhat.com>
 <CAPMcbCr8_zgYcMQ9Q0GSQL-TgvOGY-q16sMoVNxBpvwG4JDEng@mail.gmail.com>
 <449f117b-32c9-e066-55dd-1208313bce3f@redhat.com>
 <CAPMcbCpgyNnggdMTY9K3=nv_BBF8Fbsp_MoAQ6ubeUEA5-aL=A@mail.gmail.com>
 <59b8bdee-ef2f-83b4-fbc7-4283cb964c33@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59b8bdee-ef2f-83b4-fbc7-4283cb964c33@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

On Tue, May 24, 2022 at 03:28:37PM +0200, Thomas Huth wrote:
> On 24/05/2022 15.17, Konstantin Kostiuk wrote:
> > 
> > 
> > On Tue, May 24, 2022 at 4:13 PM Thomas Huth <thuth@redhat.com
> > <mailto:thuth@redhat.com>> wrote:
> > 
> >     On 24/05/2022 15.00, Konstantin Kostiuk wrote:
> >      >
> >      >
> >      >
> >      >
> >      > On Tue, May 24, 2022 at 1:24 PM Thomas Huth <thuth@redhat.com
> >     <mailto:thuth@redhat.com>
> >      > <mailto:thuth@redhat.com <mailto:thuth@redhat.com>>> wrote:
> >      >
> >      >     On 24/05/2022 12.14, Marc-André Lureau wrote:
> >      >      > Hi
> >      >      >
> >      >      > On Tue, May 24, 2022 at 12:02 PM Konstantin Kostiuk
> >      >     <kkostiuk@redhat.com <mailto:kkostiuk@redhat.com>
> >     <mailto:kkostiuk@redhat.com <mailto:kkostiuk@redhat.com>>> wrote:
> >      >      >>
> >      >      >> Hi Richard and Marc-André
> >      >      >>
> >      >      >> I looked into the compilation problem and have 2 solutions:
> >      >      >> 1. We can add some conditions to the win2qemu definition and
> >      >      >> skip NVME support when old mingw-headers are used.
> >      >      >> 2. We can bump the version of the Fedora docker image to 36 or 37
> >      >      >> that is used for cross-compilation tests.
> >      >      >>
> >      >      >> I think the second option is more valuable because we remove
> >      >      >> pregenerated qga-vss.tlb file and now we can check VSS build only
> >      >      >> at Fedora 37.
> >      >      >>
> >      >      >> What do you think?
> >      >      >
> >      >      > I'd try to do both: fix compilation with older headers, and
> >     bump our
> >      >      > CI to f36. I don't know if our windows build environment has
> >     strict
> >      >      > requirements like the unix/distro (build on old-stable for 2y).
> >      >
> >      >     See
> >     https://www.qemu.org/docs/master/about/build-platforms.html#windows
> >     <https://www.qemu.org/docs/master/about/build-platforms.html#windows>
> >      >
> >  <https://www.qemu.org/docs/master/about/build-platforms.html#windows
> >     <https://www.qemu.org/docs/master/about/build-platforms.html#windows>> :
> >      >
> >      >     "The project supports building QEMU with current versions of the
> >     MinGW
> >      >     toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on
> >     Windows."
> >      >
> >      >     Since Fedora 35 is still a supported build host, I think you
> >     should make
> >      >     sure that it works with the MinGW toolchain from that distro, too.
> >      >
> >      >
> >      > Currently, CI uses Fedora 33 which is already EOL. Fedora 35 has updated
> >      > mingw-headers and the current version of code compiles without any
> >     errors.
> >      > So if we want to support only Fedora 35+, we can just bump the CI
> >     docker image.
> > 
> >     Ah, right, I was looking at the wrong file. So yes, in that case, please
> >     simply update the docker image.
> > 
> >     What about Debian (since this is mentioned on the support page, too)? I
> >     think we don't have to worry about Debian 10 anymore, since Debian 10 will
> >     already be EOL once we release QEMU 7.1 ... but what about Debian 11? Do
> >     the
> >     MinGW packages there contain the updated headers, too?
> > 
> > 
> > As I know we do not test cross-compilation at Debian. Debian does not have
> > even mingw-glib2. Debian only has the mingw-gcc toolkit.
> 
> Oh, interesting! Then I wonder why Debian is mentioned there ... seems like
> it has been added here:
> 
>  https://git.qemu.org/?p=qemu.git;a=commitdiff;h=e6e80fcfd6c47823
> 
> Daniel, do you remember whether we supported Debian for MinGW
> cross-compilation in the past?

At one time we used to have Debian with the 3rd party 'mxe' builds
of mingw added. It broke periodically and we deleted it in the
end. It wasn't adding value over what Fedora mingw could provide
as both more or less tracked the same versions of software in
their mingw packages.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


