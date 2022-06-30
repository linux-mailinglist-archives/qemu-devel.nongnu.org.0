Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A7D56263A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 00:47:37 +0200 (CEST)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o72wi-0001s4-9m
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 18:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o72tB-00017L-8R
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 18:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o72t7-0001kX-8w
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 18:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656629032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtR5PnAPv3C28nhIPuZQpS5NUladetlBaX9nC+U6lA0=;
 b=hcFaT6q8IypAD7CMrvUf+xu1UwH1pTKJ2OccFIbUReETWwqP6Y7pW56tnnidZCTNPS6PRg
 k3DJj1RO9PwLeR41jwY1yGGrnZSqWtPzbmKTrMiL3qKv7E0JNnbwSMXFgBQBIGuX1xUFis
 3cAcZOXGge5fXygQXsSzbO1ChZx2z10=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-BK3-4xT-Miqk8HGvYGRPdw-1; Thu, 30 Jun 2022 18:43:50 -0400
X-MC-Unique: BK3-4xT-Miqk8HGvYGRPdw-1
Received: by mail-ua1-f72.google.com with SMTP id
 g1-20020ab00e01000000b00379820aee7cso157058uak.18
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 15:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HtR5PnAPv3C28nhIPuZQpS5NUladetlBaX9nC+U6lA0=;
 b=c7lIxDMTvcOVu4Kjsj8ClZ7WeUljD13AQSwYxXy9nc/w7kcE9T96noHnPo94+8tH3R
 65fjn0cTy8HxIxMbWKLfl4nmHsNZ5w5N3LT0rjdD7j9sRM1IA4KRSdOtNJQ76LzqGUgu
 xUyrZm9ECzR0jR1MKyKe/bNBVAZIBCA10c+A50Q4vqslGIKXyVsLoI1ySKm22qqvqmvU
 vwitxDOx87sLoXdutvcHji5WqcIHcz9b1auiqRb5wGVvj5mTTzlML/GiSRdk8sPm9Y0p
 C52KQ4qRNAB2zz5kgIqBkGMaTECH5N/CGhJ4bPJStknv9qHxvO/BC03NIOplEMtR3T1J
 syRg==
X-Gm-Message-State: AJIora8fzPD+M3TKyoY9EOWyEk6Jm3zDYkH+zfp+nENCz9gz2wohEHr4
 g7UzdK6GgGIjaVb8gW/5YbmnCo4zVDtM5+H3mgbi9mJSVjx83xf/2bzTXhYNmQKEHt3GIYlrtQr
 Rsm//qui7uUSF+pkVt4Iy7+81L8IGtUc=
X-Received: by 2002:a05:6102:24d:b0:356:6d6b:9e1e with SMTP id
 a13-20020a056102024d00b003566d6b9e1emr9458228vsq.11.1656629030139; 
 Thu, 30 Jun 2022 15:43:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uxlrKhmOPCi8lzDcuHkmp3RrOTf+r24JiYGMHdbrIyF2pOJ9nSyYd9ZIfHSsti5k2jdIQIj/Nbu1uGyAU9wEA=
X-Received: by 2002:a05:6102:24d:b0:356:6d6b:9e1e with SMTP id
 a13-20020a056102024d00b003566d6b9e1emr9458218vsq.11.1656629029804; Thu, 30
 Jun 2022 15:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220628134939.680174-1-marcandre.lureau@redhat.com>
 <20220628134939.680174-3-marcandre.lureau@redhat.com>
 <YrsNZAznZrxUr/zr@redhat.com>
 <CAFn=p-YCAf7VvCvwjh++KZ3GguG8MKo=ukGR3EqxRYprXgZWDg@mail.gmail.com>
 <Yr1diN83gU2dx27u@redhat.com>
In-Reply-To: <Yr1diN83gU2dx27u@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 30 Jun 2022 18:43:39 -0400
Message-ID: <CAFn=p-ZEFWwasY4-n1VCq+RC_uo5Sme-0jQceq-UYf-oHt9sFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] python/qemu/machine: accept QMP connection
 asynchronously
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 30, 2022 at 4:23 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Jun 29, 2022 at 07:54:08PM -0400, John Snow wrote:
> > On Tue, Jun 28, 2022 at 10:17 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> > >
> > > On Tue, Jun 28, 2022 at 05:49:39PM +0400, marcandre.lureau@redhat.com=
 wrote:
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > >
> > > > QMP accept is currently synchronous. If qemu dies before the connec=
tion
> > > > is established, it will wait there. Instead turn the code to do
> > > > concurrently accept() and wait(). Returns when the first task is
> > > > completed to determine whether a connection was established.
> > >
> > > If the spawned QEMU process was given -daemonize, won't this code
> > > mistakenly think the subprocess has quit ?
> >
> > Do we use daemonize with this code anywhere? Is it important that we
> > are able to?
>
> Well what's the intended breadth of use cases this code wants to
> target ?

Well, I dunno. I'm going to say that machine.py is something that will
probably stay in-tree as an ad-hoc testing utility. I have some
thoughts about growing it into something "just a little bit more than
that", but I think we can cross that bridge when we get there. I will
probably do like what I did for QMP: write a replacement, test it with
our existing test infrastructure, then do a drop-in switcheroo.

>
> If you don't daemonize QEMU, then QEMU will (likely) get killed off
> when the parent python process terminates. That can be ok for adhoc
> testing scenarios where the QEMU process is transient and throwaway,
> or for using QEMU as an embedded technology (think libguestfs). If
> you want your QEMU to run full OS workloads, then generally you won't
> want it to die when the mgmt app is restarted (eg for software upgrade),
> whereupon you want to daemonize.
>

Yeah, I think that's a case that I wasn't invested in managing.
Certainly it's an expansion of scope.

> > Many of the shutdown routines I wrote expect to work directly with a
> > launched process ... at least, that expectation exists in my head. I
> > suppose a lot of this code may actually just coincidentally work with
> > -daemonize and I wouldn't have noticed. I certainly haven't been
> > testing it explicitly. I definitely make no accommodations for it, so
> > I would expect some stale processes in various cases at a minimum.
>
> Looking at the code it probably works by accident - the shutdown()
> methods kinda assumes we're talking to a direct child, but it'll
> happen to work right now as it'll simply cleanup the defunct
> intermediate child, while QEMU stays running.
>

That's my conclusion, yes.

> > If we want to expand to accommodate this feature, can we do that
> > later? Machine needs a bit of a remodel anyway. (I want to write an
> > 'idiomatic' asyncio version to match the QMP lib. I have some
> > questions to work out WRT which portions of this appliance can be
> > upstreamed and which need to remain only in our testing tree. We can
> > talk about those pieces later, just throwing it out there that it's on
> > my list.)
>
> The machine class is probably the part that looks least ready to be
> published as an API on pypi. Its code really shows its origins as an
> adhoc testing framework, rather than a general purpose API for running
> and managing QEMU from python.

I agree.

It might still be useful in some form, eventually, to use as supported
example code of showing how you can launch QEMU and interact with it
via QMP. In the current form, though, it's definitely just ad-hoc nuts
and bolts for the test suite. I am fine with keeping it like that for
purposes of review and maintenance, etc.

--js


