Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D3690E88
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:41:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9z4-0004Ga-12; Thu, 09 Feb 2023 11:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQ9yz-0004Ek-QO
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:41:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQ9yy-0008Hj-3q
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:41:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675960871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTfDSVOmeXkkYcX6uSgbXcKk5+sdOrjlBYguoQQ+I5A=;
 b=dL1b4ab8D1rbqh75rFlAt5Z48Kka7hg/vWKMWFG5+rooLYhZdVMayl4TVaZejJdzJ/5FEZ
 lxg1SyiJiUwa0gwVbwY6yKcM/wQ0wH3VBMpV+S/F6WMaKr+ipORZbKoy+GNDLPDtMR9AvY
 WjmDs/RM6xa5t7I8KsAPutxulY/BgfE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-mOd7-czjOqaiJnx1bLosbA-1; Thu, 09 Feb 2023 11:41:10 -0500
X-MC-Unique: mOd7-czjOqaiJnx1bLosbA-1
Received: by mail-pj1-f69.google.com with SMTP id
 s24-20020a17090aa11800b00230ffd3f340so1201684pjp.9
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 08:41:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oTfDSVOmeXkkYcX6uSgbXcKk5+sdOrjlBYguoQQ+I5A=;
 b=CTjiF0D/G0dJF1e8PYfO4f+h/a+tvXkpgnjGHLNPPN3ilU3pmyt/TQDHe8GGWYAt0U
 PZJ5EL3UdLFv8CSJ0Q9jhv3/gWX+SMF2gJVSP0uyVRrGaquVXG3I0p66Yi8KYBBPoGtM
 Yr0TJdsvW7Pdsc81gE5WRbUTI7tBYdJkiMtUH3bz5MOscR3Pst9OfOd/5hh+cEltreMA
 wewLnTty9TGlgdjqfiyi40bmUjnR9SSzZLUVY8wuQEFekaWA1g9hlezWTjoqHpXUx+mB
 oEq9L5PPfj6sYLeteAARmn/AeJsS3o2iL5gSipBPD/iXbIGRF0yG1d8yZOEei1tPaeO2
 nfXA==
X-Gm-Message-State: AO0yUKXWBYUCLKdo7Fdn7n67KisuM+FCwuwWWsJKkMY77S/1h0LZYzXy
 nTIHX7jHdKDLdQLDp7RBRjC41vgAOQsufl8Zu13BRRsK6DE2VVsiodtPapLbaycb9Tj4iooc8An
 eXy66NjHNWTmKgSAtCVKPW96iWX3dx84=
X-Received: by 2002:a17:902:9890:b0:199:3483:e920 with SMTP id
 s16-20020a170902989000b001993483e920mr2656450plp.33.1675960868980; 
 Thu, 09 Feb 2023 08:41:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/kKWHrzG5NtmGWFhYPL9uk2VAz8bZ+BpzPsI5FnFVosKoNSFDNQf8NoplynW0WFnJI6scLrXmfoMPYniP23N0=
X-Received: by 2002:a17:902:9890:b0:199:3483:e920 with SMTP id
 s16-20020a170902989000b001993483e920mr2656444plp.33.1675960868575; Thu, 09
 Feb 2023 08:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-8-jsnow@redhat.com>
 <Y+Ue2/Xn+ZbOc+B+@redhat.com>
In-Reply-To: <Y+Ue2/Xn+ZbOc+B+@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 9 Feb 2023 11:40:57 -0500
Message-ID: <CAFn=p-aEOO4QDfPuYB2LpnwkP-bWyFdOKrQEmcH0iD-f3dJ-mg@mail.gmail.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Feb 9, 2023 at 11:27 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Feb 09, 2023 at 10:40:34AM -0500, John Snow wrote:
> > Python 3.6 was EOL 2021-12-31. Newer versions of upstream libraries hav=
e
> > begun dropping support for this version and it is becoming more
> > cumbersome to support. Avocado-framework and qemu.qmp each have their
> > own reasons for wanting to drop Python 3.6.
> >
> > Since it is safe to under our supported platform policy, do so.
>
> Upstream EOL dates are essentially irrelevant from our platform
> support policy for deciding min versions
>

It's relevant because as other Python packages drop support, the
burden of support is pushed onto Cleber and I, as explained in the
cover letter. It is not a justification in and of itself, but it
summarizes the ecosystem conditions that prompt the desire for the
change.

> QEMU aims to target released OS distributions, and their vendors
> may choose to support software for arbitrarily longer periods of
> time than upstream. This extended support is one of the key
> value adds of OS distributions.
>
> To justify dropping python 3.6, the commit message needs to
> illustrate that all our targetted distros are capable of
> supporting the new proposed new min version.

That is the point of this series: illustrating that it is indeed safe
to drop Python 3.6. I am not clear on what you are actually requesting
as a change.

> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/conf.py             |  4 ++--
> >  configure                |  8 ++++----
> >  python/Makefile          | 10 +++++-----
> >  python/setup.cfg         |  7 +++----
> >  python/tests/minreqs.txt |  2 +-
> >  scripts/qapi/mypy.ini    |  2 +-
> >  6 files changed, 16 insertions(+), 17 deletions(-)
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


