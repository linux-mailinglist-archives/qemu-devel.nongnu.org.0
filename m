Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E6508B49
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:55:49 +0200 (CEST)
Received: from localhost ([::1]:53624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBkC-0001y2-4P
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBb4-0000aO-BC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBb1-00012T-1m
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650465977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wAqSy8p4YjY+ZmOBYXfmT1xiaq8drrFofwG+yavWeBs=;
 b=YQoPI0ct14kdkADWs7gB4K+pqg7Vf/xx0yHrtESTcywvGQEbX0TNHoRJO9UYF4y0p/5R1R
 kDUx90cFgxMtykzFtegCLngToIAaiqS94qmdBHpM6eKUZC3d3BbaCUkcts/Nf2UiGub7sL
 ihhgrdOHseFlftJ3O6hhv2NFPnyxZQg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-xG2cOQuHMUySoXpKxX9ZMQ-1; Wed, 20 Apr 2022 10:46:16 -0400
X-MC-Unique: xG2cOQuHMUySoXpKxX9ZMQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 q142-20020a252a94000000b00644b8a5aa4fso1646796ybq.13
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wAqSy8p4YjY+ZmOBYXfmT1xiaq8drrFofwG+yavWeBs=;
 b=o0XV/vvdEL0bweNQyyHZpHs/DQ/5x9fLkf7s9CmbKQUphMpUelOfCkKlb/WIwSXRq4
 b3DzIdxgzJgjeeN27DvAUHyhDRV17o6n9wnPNNdPDla4ebOLpkMWD4Gk3Gpx54c2qQ2m
 B0nmHPm6rqi2BD7Ief+Vf3zbCeGruM1XT48GP28PEqsZVIYQrVpjqp4dpx89DsUzT53D
 UAA5k/sVaoZHHMHbmIG13naPYxdj10u0GxVae4FOtL+feD0kWOALXCS2C5jS/Wuw2Kzk
 m9BtKByW5hmjokU+WWfMjm6VvqfCEJU5hSQkzT+r2MpzxZlG8qUcgOFagvxQxV8hhVDp
 VHOA==
X-Gm-Message-State: AOAM532jowxc6XfTEPdRxDA4y4QZx4owPkfqK1rAkbVzyGCy7D+Nr6eZ
 hr+fUnDAb7hzvNblSt/DzS9rp8otv/92ZyVx9+3234je5lofdhRn/AlUZFxU2eql/Z/MH6En/ZB
 PufyMU+sWqEayPKYPuYNPWKi8M2rfvQg=
X-Received: by 2002:a81:7b43:0:b0:2ec:8bb:3aef with SMTP id
 w64-20020a817b43000000b002ec08bb3aefmr21392435ywc.267.1650465975973; 
 Wed, 20 Apr 2022 07:46:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypuRfSMzq4Vfn5dD4ZwYF4sJ/9Ten6KHbkS2FF8BLurWXpeKN4/RNaCmjZji7mAGDseh/osH+iV1B/70zQCig=
X-Received: by 2002:a81:7b43:0:b0:2ec:8bb:3aef with SMTP id
 w64-20020a817b43000000b002ec08bb3aefmr21392415ywc.267.1650465975820; Wed, 20
 Apr 2022 07:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
 <YmAUaMp7kTRaRCGY@redhat.com>
 <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
In-Reply-To: <840f08cb-e28c-6802-96c7-b1f82dd36427@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Apr 2022 18:46:05 +0400
Message-ID: <CAMxuvax0uPB+dWGCt2_Ma22S3VZ9=OFy+J_9LFT+4ftgqzB-7A@mail.gmail.com>
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 20, 2022 at 6:37 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/04/2022 16.10, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.com w=
rote:
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> According to our configure checks, this is the list of supported
> >> compilers.
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> >> ---
> >>   docs/about/build-platforms.rst | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platfor=
ms.rst
> >> index c29a4b8fe649..1980c5d2476f 100644
> >> --- a/docs/about/build-platforms.rst
> >> +++ b/docs/about/build-platforms.rst
> >> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
> >>   The version of the Windows API that's currently targeted is Vista / =
Server
> >>   2008.
> >>
> >> +Supported compilers
> >> +-------------------
> >> +
> >> +To compile, QEMU requires either:
> >> +
> >> +- GCC >=3D 7.4.0
> >> +- Clang >=3D 6.0
> >> +- XCode Clang >=3D 10.0
> >
> > Do we need to spell out the versions explicitly ? These versions are
> > all derived from what's available in the repos of the supported build
> > platforms, similar to any other build deps we have. I don't think we
> > want to start a precedent of duplicating versions in this doc for
> > build deps we have, and there's nothing particularly special about
> > compilers in this respect.
>
> I agree with Daniel - when I saw this patch, the first thought that I had
> was: "This will be getting out of sync quickly" ...

I don't have the impression we bump our compiler requirement regularly
or lightly.

> so I'd also recommend to rather not add this here.

Outdated documentation is still better than no documentation. YMMV.


