Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4115692441
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 18:16:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWzi-0008F3-QB; Fri, 10 Feb 2023 12:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQWzg-0008EU-1b
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:15:28 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQWze-0008A0-6X
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:15:27 -0500
Received: by mail-pl1-x630.google.com with SMTP id z1so7125292plg.6
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 09:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676049324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WjAOmlIFxt0zLP31Ge2GoWKGfR8lE9ws0aMZ7t67l4w=;
 b=V6ADd98ip2PthpGQKAqxVCW7aONoeR/fC/C/l7cZrK1PO9EtlO3q8BuXLNZO/bF4JJ
 MPr1J97PGqytAOf8jtJEKL5LiCXKLDew0MMDtlCntZg9wT2X0B8IrKzKM2rmGerHC3SG
 3eNKN7txowoM4wHN5TYw9Q+l+0PrJAvPvvs9piRD0ZDqagAJA/qAfBmpOud0wq1eHZpd
 ATymiiTPXdUIKqbpAcGcXM+6AqObxap+1SwJfoIt0ld0Tf1XrzfiemP70MKLe1ehtZuB
 uy6IrOBzolLp9NsrQWC99dXU/2m0e/U7dwmGEmsL+tqvHZSAuC4mOFg1gz/DNhcoana8
 FU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676049324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WjAOmlIFxt0zLP31Ge2GoWKGfR8lE9ws0aMZ7t67l4w=;
 b=fICfASD88fFX9MgDYHX6HAixbwIf+P9RpeoU7yDzMnbVUt8AcF59Hr7k07RB1Mpnca
 yjDSfSI7r6t+chR5RFctzVtCCBmq8olIdY70dLexRZAU+All8G2DV07gr1IpE2aq6GMG
 OgilyryVnc28Ng7OnGjyY6bXLSDR7+PN24jYx90CnLK3rcczg/XBVpCOV9BXggG8m1ho
 3amFguuvwfQtNI51Q/PlXDxW7qqLg0HQlKhX1G/IH7FUN2Db3kJ2Q4X3VsLSZH2lRLxj
 AZku7WoMSJtJems4GvEkz3he0LCbR9+O/lAth+ClkY+SieJwuNB8FlM6m2Cbd3g05w/v
 9tDA==
X-Gm-Message-State: AO0yUKU+1qeqAs98OKD+eDIalaqc5NYuU7XZkusgwnlKO2XJ6M8kVJkR
 H8+c9olw6klx6xg2JUC/e9LMmeixB0K0Wrv+wkeiZQ==
X-Google-Smtp-Source: AK7set+G4c4CMqMPOmq0fXbQrFHibI68k63Y45kfZhFkZYdCiNvlvzeqB6BJiRQXq7dvnaEDriVeXHdp4L7vRv3yxiY=
X-Received: by 2002:a17:902:6b88:b0:199:1458:6c67 with SMTP id
 p8-20020a1709026b8800b0019914586c67mr4120573plk.28.1676049324603; Fri, 10 Feb
 2023 09:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com>
In-Reply-To: <Y+Z2Kcq17HGWuoTV@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 17:15:12 +0000
Message-ID: <CAFEAcA-Gi_hn7uSGMpgMhwgw-e3yjX8DjUNcqwu2MJFem4P0MQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 10 Feb 2023 at 16:52, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Fri, Feb 10, 2023 at 04:32:19PM +0000, Peter Maydell wrote:
> > On Fri, 10 Feb 2023 at 16:01, John Snow <jsnow@redhat.com> wrote:
> > > On Fri, Feb 10, 2023, 5:41 AM Peter Maydell <peter.maydell@linaro.org=
> wrote:
> > >> On Fri, 10 Feb 2023 at 00:31, John Snow <jsnow@redhat.com> wrote:
> > >> This confuses me. We work fine with Python 3.6 today.
> > >
> > >
> > > That won't last - Many tools such as mypy, pylint and flake8 which I =
use to manage our python codebase have been dropping support for 3.6 and I'=
ve had to implement an increasing number of workarounds to help keep it pos=
sible to test 3.6 via CI while also ensuring our newest platforms work as d=
ev environments.
> >
> > Something somewhere seems kind of out-of-sync here. Either:
> >  * Python is deprecating old versions too quickly and
> >    dropping support for them too fast
>
> Nope, they're fine in declaring EOL whenever they like. There's
> no requirement for upstreams to support arbitrary old versions
> for any length of time.

To be clear, yes, absolutely any other software project can
set whatever lifecycle it chooses to do, and similarly distros
can do what they wish to do. But somewhere along the line
something's gone sideways here, because all these choices
people are making seem reasonable and yet here we are :-)
I put this bit in here because one response to "upstream's
idea of how long it wants to support something is very short"
would be "this isn't a dependency that it's suitable for
QEMU as a project to have, because the mismatch is too great".
(This would obviously be super-painful in this specific case...)

> >  * CentOS is retaining old versions of Python when it needs to
> >    ship newer ones
>
> It is also totally OK for an distro to ship and support software
> versions which are EOL upstream. In fact for enterprise distros
> you can generally assume that *all* the software versions they
> ship are probably EOL or nearly so. The main value of enterprise
> distros is that they provide long term support, where upstreams
> are not willing to.

But we as a project also have the choice, if it seems to us
that Distro X is shipping absolutely ancient versions of
dependencies, to say "we don't support distro X, because its
life cycle policies are too far out of sync with ours", or to
say "you're going to need to provide the dependencies
yourself, here's a suggestion". (We effectively do that
already with macos and Windows.)

> >  * Our policy for what distros we support is overly lax
> >    and causing us to try to support ancient platforms
> >    that we shouldn't be trying to support
>
> I don't think so. Users of distros are not anywhere near
> as aggressive at updating their installations as users
> are. The number of users of RHEL-8 will dwarf that of
> RHEL-9 by a large margin for a decent amount of time
> yet.

Right. All of these things together seem to say:
 * Python is not an unreasonable thing for the project
   to depend on
 * CentOS 8 is not an unreasonable distro for us to
   want to continue to support
 * Therefore we should continue to work with the Python
   that ships with CentOS 8...

[snip]

> We don't have to drop python 3.6. It is a choice because
> of a desire to be able to use some shiny new python
> features without caring about back compat.
>
> Similarly we don't have to use the new meson which drops
> support for python 3.6, it is again a choice because we
> want to rely on some new meson features.
>
> QEMU could easily carry on supporting python 3.6 until
> the affected distros drop out ofo our support matrix, but
> we would have to opt out of using certain new features,
> or put more effort into back compat.
>
> Personally I'm still on the side of carrying on supporting
> 3.6 per our distro support policy, but if broad consensus
> is to drop 3.6 I'm not going push back anymore.

This is really where I'm at as well -- we set our distro
support policy, and we know that means that sometimes
we have to deal with continuing to support older versions
of dependencies even when it might be easier for us if we
could require newer versions. I'm reluctant to say that
Python gets a special derogation from that policy.

thanks
-- PMM

