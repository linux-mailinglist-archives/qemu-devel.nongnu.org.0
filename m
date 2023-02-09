Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A1C691287
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 22:17:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQEGT-00069U-2c; Thu, 09 Feb 2023 16:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQEGP-00068f-Mo
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:15:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQEGN-0005it-Ek
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:15:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675977326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAzbPC8Hv8K09nVXeWVIMfyPp9LqKwx7w+qo0Wc7RMw=;
 b=XgPOyrHGOQElIIMZP7xaiuU1ev/DT+0BeY/MTRA6JAFtTQmlKxNPKVq/R7V+jicZJOIU/F
 uyzxWb7vk/BhOiHKxEyCtvoegBYSMaI2vffqGJbsRATndhIFgPvr1zjU9ws5mwnUcy+2v6
 a72D1PvdYnJF8SNb1/3K+bF4diO2Mec=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-v2yeqogQOfOQO11SoPQQNw-1; Thu, 09 Feb 2023 16:15:25 -0500
X-MC-Unique: v2yeqogQOfOQO11SoPQQNw-1
Received: by mail-pg1-f197.google.com with SMTP id
 bs128-20020a632886000000b004fb3816e89eso1605794pgb.13
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 13:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HAzbPC8Hv8K09nVXeWVIMfyPp9LqKwx7w+qo0Wc7RMw=;
 b=S4hBZiSacA8hieNwriJU/K86cQlBnKcruznTbxrUHwvQvrWf4NwYHo977lh8Ke9GO5
 Kr2R73cih+hiKcCncDVoNx/ikchaTbjsNa+BszwxeNBIbR+Mr2gjhKbwHJUbgbI/D0ZY
 DV6MnyH+3zS5h/eWCaziC2ji/b1vSEuFm37swjQQO4FCGigfLlbRLqhWEoCt7egYnRtA
 5SqVa55Z7TemKqu23v9eIvIHJZAnvAQOkooUABCOAUj2zWgSMfPwXTNANjPRjHEWFo+c
 PnKeRWgCg15buWeuF1fIkQ4JjRSUMP6NWdkzyoztFUGESJ2oeFkMZb/XmsaPorQOP518
 k+Zw==
X-Gm-Message-State: AO0yUKVhgA2ijfvBW0Go8ZipBnXekD1MH3xMMw+R8omcgBsO9YYPawku
 KDgYSpCIzeZ1Ap/W4uNZAoYBLa4u8aLn01SHea7BdTwc6s2JUm6OKg3G6RyRvCyJAVigevS2Un8
 xZuYNBL/mIA3nGnN4edJ+HrdVnoRjdUA=
X-Received: by 2002:a65:6a90:0:b0:4f0:f4b8:4baf with SMTP id
 q16-20020a656a90000000b004f0f4b84bafmr2500097pgu.52.1675977323533; 
 Thu, 09 Feb 2023 13:15:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+UkE9oUFVYo2Mj5nyVlXvXJvVnOVs3MhW947BTgBG3aZV6JhvEiMEfw5Kfk5ydEwEgOSV2j9vTalkw3jOytlE=
X-Received: by 2002:a65:6a90:0:b0:4f0:f4b8:4baf with SMTP id
 q16-20020a656a90000000b004f0f4b84bafmr2500084pgu.52.1675977323132; Thu, 09
 Feb 2023 13:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-8-jsnow@redhat.com>
 <Y+Ue2/Xn+ZbOc+B+@redhat.com>
 <CAFn=p-aEOO4QDfPuYB2LpnwkP-bWyFdOKrQEmcH0iD-f3dJ-mg@mail.gmail.com>
 <Y+U1cHFfdpGOyEop@redhat.com>
In-Reply-To: <Y+U1cHFfdpGOyEop@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 9 Feb 2023 16:15:11 -0500
Message-ID: <CAFn=p-b8T+HjAXs1Bq6LFoEEoYFkwuHP0Ggm6U4gMzcLajYdPw@mail.gmail.com>
Subject: Re: [PATCH 7/7] Python: Drop support for Python 3.6
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 9, 2023 at 1:03 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Feb 09, 2023 at 11:40:57AM -0500, John Snow wrote:
> > On Thu, Feb 9, 2023 at 11:27 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Thu, Feb 09, 2023 at 10:40:34AM -0500, John Snow wrote:
> > > > Python 3.6 was EOL 2021-12-31. Newer versions of upstream libraries=
 have
> > > > begun dropping support for this version and it is becoming more
> > > > cumbersome to support. Avocado-framework and qemu.qmp each have the=
ir
> > > > own reasons for wanting to drop Python 3.6.
> > > >
> > > > Since it is safe to under our supported platform policy, do so.
> > >
> > > Upstream EOL dates are essentially irrelevant from our platform
> > > support policy for deciding min versions
> > >
> >
> > It's relevant because as other Python packages drop support, the
> > burden of support is pushed onto Cleber and I, as explained in the
> > cover letter. It is not a justification in and of itself, but it
> > summarizes the ecosystem conditions that prompt the desire for the
> > change.
> > > QEMU aims to target released OS distributions, and their vendors
> > > may choose to support software for arbitrarily longer periods of
> > > time than upstream. This extended support is one of the key
> > > value adds of OS distributions.
> > >
> > > To justify dropping python 3.6, the commit message needs to
> > > illustrate that all our targetted distros are capable of
> > > supporting the new proposed new min version.
> >
> > That is the point of this series: illustrating that it is indeed safe
> > to drop Python 3.6. I am not clear on what you are actually requesting
> > as a change.
>
> Essentially it should explain what versions are available in each
> distro. See for example commit 5890258aeeba303704ec1adca415e46067800777.

Ah, OK.

Fedora 36: 3.10.5
Ubuntu 20.04: 3.8.10
Debian 11: 3.9.2
OpenSUSE Leap 15.4 uses 3.6.15, but 3.9 and 3.10 are available with a
simple zypper invocation.
CentOS Stream 8 uses 3.6.8, but 3.8 and 3.9 are available.
CentOS Stream 9 uses 3.9.13.
Alpine: Not sure, but tests pass.
FreeBSD 12: 3.7 (tests/vm/freebsd already uses this version.)
OpenBSD: ?
NetBSD: ?

I can update the commit message, but I do have questions for you in
patch 5 concerning the docker configurations and our test matrix that
I want to work out before a respin.

>
>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


