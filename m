Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D6D69D465
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:58:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUCHo-00027z-PH; Mon, 20 Feb 2023 14:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUCHl-00027a-8o
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:57:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUCHi-0001si-KK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676923033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=atMZAYD055baYrznEHNdSNjqtuaaafO2Rip1N1qgStY=;
 b=LeKiPv3hRLLcSsOQqFMhKgWbO1r4zwf9SEZbuuAX2V0qH7Np1bTQs0437ebo9y3ya47l5Z
 Zl7WQgU2Us+FCzduLyhBZ4ZKv9TtzZjABWJZk2iK5AQKhbG3NKShQO04psxqcQXfWUsXey
 nrgHVBTCLUb73vvTAHXK4A9RgasCM3s=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-tFKSvDTFNLyJxO4sgyPRGw-1; Mon, 20 Feb 2023 14:57:12 -0500
X-MC-Unique: tFKSvDTFNLyJxO4sgyPRGw-1
Received: by mail-pf1-f197.google.com with SMTP id
 k24-20020aa790d8000000b005a8ad1228d4so903807pfk.10
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676923031;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=atMZAYD055baYrznEHNdSNjqtuaaafO2Rip1N1qgStY=;
 b=jM2PHH4A9rTuCn2b9qNvUsEwLBYlyIsHvm9tUc7rzJaBOWYM7csVCh7FKlRGDue49N
 6nFhN9/qJYvaGpCSiXHzKegYVGA2Up2FmfZW/XFN40BmGerIkS3emj2Jvkf6poiwRi/9
 0Hf3/CbRlVRrRp3no2DTdJ1K0NY3hmj2+zl7hFBEy6flG9ZC2OE1MpO/AQkmR1BA14kr
 ntqQ87WeASoaNtQksbTIyWSmMIQex6NZb61KEUvbThwkzlk0KMlRE3Smumg8hgVZXqPt
 +em5aRxdP+KtPRDO7oT81W1KJHzveb6XpwhhSOud/Kh88V4EPlomYAtOro5moiBGnYEx
 6oOg==
X-Gm-Message-State: AO0yUKVEyw7hqTpLjQs7E8SK2k4POTqeV4Y45JddlC/3SYXjzau+DTMl
 4tyqJLWz3KIZRQ6Y9LeEZGPU9rcb1i+quDFvCVAVBnBy7XVe506fZ099viZTy1FSDOWRNsnJqYk
 CvJVPIebhzfngasZS7YccVG9X7JSWgXI=
X-Received: by 2002:a62:ceca:0:b0:592:503a:8f06 with SMTP id
 y193-20020a62ceca000000b00592503a8f06mr193188pfg.52.1676923031157; 
 Mon, 20 Feb 2023 11:57:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+Rv/N+GcurMhqOUKUAlbhvOhzufxrqfy4CkXMuDxDqCSqAc30+IyJuBdKhnmulvXEJnwMjaaikaAajiAvJl4c=
X-Received: by 2002:a62:ceca:0:b0:592:503a:8f06 with SMTP id
 y193-20020a62ceca000000b00592503a8f06mr193174pfg.52.1676923030786; Mon, 20
 Feb 2023 11:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
 <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
 <CAFn=p-YnR-hFAg=yxCi7oNKHXirMqv2vJSYmaY8VBPq+Q2UVbA@mail.gmail.com>
 <ee04b184-75e3-7c4a-856f-4543f51f8412@redhat.com>
In-Reply-To: <ee04b184-75e3-7c4a-856f-4543f51f8412@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 20 Feb 2023 14:56:59 -0500
Message-ID: <CAFn=p-ZW6ZDhrHAdu-TOarwsea2FNwK7tmN-REaWx23u-nBTZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Feb 20, 2023 at 1:16 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 17/02/2023 21.46, John Snow wrote:
> > On Thu, Feb 16, 2023 at 5:58 AM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 15/02/2023 20.05, Markus Armbruster wrote:
> >>> The discussion under PATCH 6 makes me think there's a bit of confusion
> >>> about the actual impact of dropping support for Python 3.6.  Possibly
> >>> because it's spelled out in the commit message of PATCH 7.  Let me
> >>> summarize it in one sentence:
> >>>
> >>>       *** All supported host systems continue to work ***
> >>>
> >>> Evidence: CI remains green.
> >>
> >> The CI remains green since one of the patches disabled the building of the
> >> docs on CentOS 8. That's not how I'd describe "continue to work", at least
> >> not in the same extend as before.
> >>
> >>> On some supported host systems, different packages need to be installed.
> >>> On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
> >>> instead of 3.6.8.  Let me stress again: same repository, different
> >>> package.  No downsides I can see.
> >>>
> >>> The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
> >>> version of Sphinx that works with Python 3.7 or newer.  This series
> >>> proposes to simply stop building the docs there, unless the user
> >>> provides a suitable version of Sphinx (which is easy enough with pip).
> >>
> >> I think we've all understood that. The thing that you obviously did not
> >> understood: This breaks our support statement.
> >> I'm pretty sure that you could also build the whole QEMU suite successfully
> >> on an ancient CentOS 7 or Ubuntu 18.04 system if you manually install a
> >> newer version of GCC and some of the required libraries first. But that's
> >> not how we understand our support statement.
> >>
> >> Sure, you can argue that you can use "pip install" to get a newer version of
> >> Sphinx on RHEL 8 / CentOS 8 to continue building the docs there - but is
> >> that really that much different from installing a newer version of GCC and
> >> libraries on an ancient distro that we do not officially support anymore?
> >> I'd say no. You also have to consider that not every build host has access
> >> to the internet, maybe some companies only have an internal mirror of the
> >> distro packages in their intranet (I remember some discussion about such a
> >> case in the past) - so while you were perfectly fine to build the whole of
> >> QEMU on a CentOS 8 there before this change, you could now not build parts
> >> of QEMU anymore there due to the missing possibility to run "pip install"
> >> without full internet connection.
> >
> > There are good points elsewhere in this thread and I am taking notes,
> > but this critique caught my eye as something I was not specifically
> > planning around, so I wanted to get an elaboration here if I may.
> >
> > Do we have a support statement for this? I find this critique somewhat
> > surprising -- If we don't have internet, how did we get the other 20
> > to 30 dependencies needed to build QEMU? To what extent are we
> > *required* to preserve a build that works without internet access?
>
> It's not written in stone, but I saw it this way: If I have a complete
> mirror of a distro repository in my intrAnet, I can use that mirror to set
> up a QEMU build host system that has no access to the internet. Or maybe
> think of a DVD image(s) with all distro packages that you use to install a
> host without network access (and you copy the QEMU tarball there via USB
> stick). I think it's not that uncommon to have such scenarios out there.
>
> For example, do you remember that SDL 1.2 discussion a some years ago? See:
>
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg631628.html
>
> It was not exactly the same situation, since those folks were even unable to
> install a SDL2-devel package on their pre-installed hosts, though it was
> theoretically available as an update in their distro, but I think it gives
> an impression of what people are using and expecting out there... (and no,
> I'm not happy with this, I'd also rather love if we could move faster in the
> QEMU project sometimes).
>
>   Thomas

Well, in this case I believe our support policy generally is written
to require a fully up-to-date version of the LTS distros, e.g. we
don't really test against "release day" 16.04, in the same way we
don't offer support for RHEL 8.0, just the latest point release. I
don't want to march things forward and break things for people for no
reason, but at a certain point, I have to ask: Why do people expect
software written three to four years after the release of their
operating system to not only run, but compile on that system -- with
no updates or internet? I think it's (unfortunately) reasonable to
expect that if you want to run a stable OS with no changes for years
that at a certain point, brand new releases may start requiring a few
hoops for you to jump through.

Or, in other words: If you can get code from 2019 onto a machine from
2016 to attempt to compile, you can also get the dependencies from the
future, too.

Still; with regards to the "offline building" thing specifically, it's
my intent to preserve the ability to build QEMU offline *provided* you
have the necessary dependencies in place already. For the Python case
under consideration, it would just be that you have your distro's
python38/python39 package installed. I consider this fundamentally no
different to other dependencies. For docs building it's a bit hairier;
you would indeed need a pip version installed prior to going offline.
The loss of docs doesn't fail the build, though; they aren't
*technically* required.

I think really all we need is the ability to know a priori what we
need to build QEMU before going offline without any last second
surprises during configure, make, or make check. Right? Or do we
really want to say "Any preparation that might be needed from outside
your system's repository *at all* is entirely prohibited"?


