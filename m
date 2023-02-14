Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B436965B9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvuq-0000UX-7a; Tue, 14 Feb 2023 09:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRvuo-0000UG-CX
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:04:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRvuj-0001LJ-AM
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676383448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5DcgFQtIe5Ps9AG2rZctNYPyorxVPJqjM29AtsAJmU=;
 b=cXUTO66kSr+461Bi3YVfx08IBxjvspp8nrmNHexbfvOdva3+ztoof0aIbVz/DpmuX1WKik
 RM1OwK5jpfP2TjYjWD3V8xZgKGV7b7LwHYgN+gZHkvfLyVkIDcgl6r9CGHaYnl0yaSh68e
 28o6n1iTfQf8EEld/JZ7Dtn/8UZzMq8=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-iDOeXt9xMDCEAu8yOI3oHw-1; Tue, 14 Feb 2023 09:04:07 -0500
X-MC-Unique: iDOeXt9xMDCEAu8yOI3oHw-1
Received: by mail-ua1-f71.google.com with SMTP id
 e15-20020ab02b0f000000b0066119a9d3bbso5508690uar.21
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 06:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5DcgFQtIe5Ps9AG2rZctNYPyorxVPJqjM29AtsAJmU=;
 b=R5bquWsbqiWPyRbS1r3gsycdOyXdMo+b8QQjKmbXRcm5NhBiXpEOyUxxF8ocJCnPRS
 EtkKfg/jhr9uSDGbDPWwSWsWet7tWNVGoHCwD12brFIUK1J9kPyJZSZ55n8qXuq+k/Eg
 ZsR9uMzjW/jPD49DPVmAQAN64jN3OVyDr7rqjNEHCafnFwCCnsjGsoD2YDwQL1hkMNIC
 2w7x7z1FuWUkmcaDCN27QEJaWPF72QqdRcaw6t4sVY7Y53b2cgBz8xYArjUEjtEkcObt
 zxopTlx9/cY7nx+fPcr3x9ejH52keNrO0PkTcUCNMl+9lZ1+YUyehRjzo9W3L5Y/CN8c
 SxlQ==
X-Gm-Message-State: AO0yUKUg4ngnvmui7SD9DG5zjcKWqwq/jPIIBKe6HwvhEDiGAHvipEiG
 iqBKngUwmG+f5ylOTNHMqwXcgHhB1jd/xkcEcMkV31K27botI3Sh5PlYxLwu36p9KDpLAfgvUsg
 /NjRl9E/cFTm+22S0YnTY2UUJFjUIXJo=
X-Received: by 2002:a1f:9895:0:b0:3e5:c4d5:fa3f with SMTP id
 a143-20020a1f9895000000b003e5c4d5fa3fmr404550vke.41.1676383446702; 
 Tue, 14 Feb 2023 06:04:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+SAnUPh7kjp8pc5vksgk9u0V5Plmc0qA4TUkaAvboPHNY8UVcubD0tPA9fpr3NjCxrGs0YFYb0dIlohNsSkqM=
X-Received: by 2002:a1f:9895:0:b0:3e5:c4d5:fa3f with SMTP id
 a143-20020a1f9895000000b003e5c4d5fa3fmr404532vke.41.1676383446229; Tue, 14
 Feb 2023 06:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+t1J72iMsLWXHne@redhat.com>
In-Reply-To: <Y+t1J72iMsLWXHne@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 14 Feb 2023 15:03:54 +0100
Message-ID: <CABgObfb-_upmc=36_bnxLMCB+0KqWoZNK62rnD5KpBKhW4N+hw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On Tue, Feb 14, 2023 at 12:49 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> [quote]
> The motivation for this series is that Python 3.6 was EOL at the end of
> 2021; upstream tools are beginning to drop support for it, including
> setuptools, pylint, mypy, etc. As time goes by, it becomes more
> difficult to support and test against the full range of Python versions
> that QEMU supports. The closer we get to Python 3.12, the harder it will
> be to cover that full spread of versions.
> [/quote]
>
> this is all about new/eol versions of software upstream, and I don't
> think that's a justification. QEMU explicitly aims to use distro provided
> versions and upstream EOL status is not relevant in that context. Even
> if using "pip" to install it is possible to limit yourself to upstream
> releases which still support 3.6.
>
> There is the separate issue of Meson dropping python 3.6 which motivates
> Paolo's series. Again though, we don't have to increase our minimum meson
> version, because meson is working today. It is our choice to to increase
> it to use latest available meson features. At some point we can decide
> what we have is good enough and we don't have to keep chasing the latest
> features. Maybe we're not there yet, but we should think about when that
> would be.

In the case of Meson, the main advantage is moving _all_ of the
emulator configury out of the configure script.  This requires
add_global_dependencies which was added in 0.63.  So in that case it
is indeed mostly about shiny new features and it's not absolutely
necessary.

In the case of Python the issue is not the interpreter per se, though
there are a couple new feature in Python 3.7 that are quite nice (for
example improved data classes[1] or context variables[2]). The main
problem as far as I understood (and have seen in my experience) is
linting tools. New versions fix bugs that caused false positives, but
also become more strict at the same time. The newer versions at the
same time are very quick at dropping support for old versions of
Python; while older versions sometimes throw deprecation warnings on
new versions of Python. This makes it very hard to support a single
version of, say, mypy that works on all versions from RHEL8 and SLE15
to Fedora 38 and Ubuntu 23.04.

[1] https://peps.python.org/pep-0557/
[2] https://peps.python.org/pep-0567/

In fact this issue is the reason why RHEL9 does not package any of
these tools and does not run them as part of building RPMs even though
in principle it would be a good idea; it's too much of a pain to have
a single version that works across all the packages in the
distribution.

Regarding your other suggestion:

> * For non-native library/applications dependancies we aim
>   to support only the most recent distro version. Users
>   of older distros may need to dynamically fetch newer
>   deps.

I think this is a good idea, but one issue with "only supporting the
most recent distro version" is SUSE. While the most recent version of
SLE is about 5 years old, there is no next version in sight---SUSE
instead is working on their "Adaptable Linux Platform", but it's still
in the prototype stage[3]. So alternatively we could put a 4 or 5 year
cutoff after which you need to fetch newer deps. Considering the
delays between freeze and release of distros like RHEL or SLE, in
practice we would probably keep Python versions supported for 6-7
years.

A 4 year cutoff in practice means that we would be able to drop Python
3.6 support for QEMU 7.1 (RHEL8 becomes 4 year old next May, while SLE
is already over the threshold). In practice this means waiting until
next April for John/Markus/myself, which I think is fair.

Note that at least for now Meson need not to follow this rule; it is
distributed with QEMU because configure must execute it before Make
sets up the Python venv. This may change in the future of course,
depending on the direction that the configure script takes with
respect to setting up the venv, but I wouldn't hold my breath.
However, the minimum required version of Meson of course must respect
the oldest supported version of Python.

Paolo

[3] https://www.suse.com/c/the-first-prototype-of-adaptable-linux-platform-=
is-live/


