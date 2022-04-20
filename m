Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410FC508B26
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:50:39 +0200 (CEST)
Received: from localhost ([::1]:36512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBfC-0007A2-A8
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBQU-0002Sp-4B
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:35:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhBQS-0007YA-L0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650465323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYyY9Xf7oPjxrBDpfMyUfsTp1VAkXLVuugmq0PoF8D8=;
 b=B/xPdv1mIsvLho1R8qMHSHhx4CjVKzq5z6HH30SwXjTBD4IIRsCNGqCMKgh891vacpuu3V
 HHnk/VLrCePmO8LlWz3TOWJ4EtiW4kEPoiWhTA1qbLa3Vn0qnv8KULNkS4I16wxPNQ6+Ih
 9zh1h6LRHxAGeW6Ea3A0K2siYzBnsa8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-9u_C8inmMleFlz216W1EMw-1; Wed, 20 Apr 2022 10:35:22 -0400
X-MC-Unique: 9u_C8inmMleFlz216W1EMw-1
Received: by mail-yb1-f199.google.com with SMTP id
 f14-20020a5b0c0e000000b00641d371d9c8so1661660ybq.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eYyY9Xf7oPjxrBDpfMyUfsTp1VAkXLVuugmq0PoF8D8=;
 b=THXy0PcDVfFd4eQPG7m1HZZ/xXZzWHXYMZgSh3wdKg5kB2nRCQFTB5b6xJdetMhO36
 zWx4GUEyQvM9tyW8W0R0OgDMY2iBklQNxrcFJUMCFm0mD2MFFi7GnssL4B//I1YACSSn
 4yqfov3FnaVru5/9AfUafTBwgEmuCjrRRLEMX2/vrOIp5Eq3Tyyw5Om0ZWtZ2psixdmD
 dpkxMi/QjiAosR2Pa6ImJc/LvkL9VUVZ+UVe9WyFkPt0KLwALLnsuOEhp2xIxw0AonPz
 HZ+oe2gDGixTx1JdCAMqSn29ArTIET8yKg3Dj0/o6IPFpQ6qzIQIegL7T4hIbFxfk4mF
 GSyw==
X-Gm-Message-State: AOAM531AltyrhYyPwOXS1MzhYh2/O2UlhynIbh2NmOBBq5ap3ci4d0YC
 lkmwdmC2JQbriE569kTemFiS8dky5FccRIOg5QDnUVu2Y0JQ2Cl5XJ244IFcOITktcD2qpR3ObP
 RiUNeu12I+zuzm8fG5kUq9QvjsvZTV/g=
X-Received: by 2002:a0d:d9cf:0:b0:2ef:5421:430f with SMTP id
 b198-20020a0dd9cf000000b002ef5421430fmr20679476ywe.312.1650465322035; 
 Wed, 20 Apr 2022 07:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxECqrsauiImK2enPApjQ0dWDeLI3xFJ4X9O20g2LJ8ekVBi140IubT+CBrfGowbeClYtqVo+8Z3gxh+6LhUQk=
X-Received: by 2002:a0d:d9cf:0:b0:2ef:5421:430f with SMTP id
 b198-20020a0dd9cf000000b002ef5421430fmr20679457ywe.312.1650465321892; Wed, 20
 Apr 2022 07:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-29-marcandre.lureau@redhat.com>
 <edddb101-6feb-8b83-f828-75fb356bf2a0@redhat.com>
In-Reply-To: <edddb101-6feb-8b83-f828-75fb356bf2a0@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Apr 2022 18:35:11 +0400
Message-ID: <CAMxuvayqH4+MWoZgT7+DRKUqodWnjy25btsUx-QYpmx4kb9mYw@mail.gmail.com>
Subject: Re: [PATCH 28/41] Use QEMU_SANITIZE_ADDRESS
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "open list:Floppy" <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 6:20 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/04/2022 15.26, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   tests/qtest/fdc-test.c    | 2 +-
> >   util/coroutine-ucontext.c | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> > index 4aa72f36431f..0b3c2c0d523f 100644
> > --- a/tests/qtest/fdc-test.c
> > +++ b/tests/qtest/fdc-test.c
> > @@ -550,7 +550,7 @@ static void fuzz_registers(void)
> >
> >   static bool qtest_check_clang_sanitizer(void)
> >   {
> > -#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
> > +#ifdef QEMU_SANITIZE_ADDRESS
> >       return true;
> >   #else
> >       g_test_skip("QEMU not configured using --enable-sanitizers");
> > diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
> > index 904b375192ca..52725f5344fb 100644
> > --- a/util/coroutine-ucontext.c
> > +++ b/util/coroutine-ucontext.c
> > @@ -30,7 +30,7 @@
> >   #include <valgrind/valgrind.h>
> >   #endif
> >
> > -#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
> > +#ifdef QEMU_SANITIZE_THREAD
>
> Shouldn't that be QEMU_SANITIZE_ADDRESS instead?
>

oops, thanks


