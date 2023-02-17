Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAC69B42C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 21:47:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT7d2-0003WC-0x; Fri, 17 Feb 2023 15:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pT7cz-0003Vu-GO
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 15:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pT7cx-00043P-Ke
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 15:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676666802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eyaKjefJoZeTbmPkX6Z3OHZqmzL4eOhZaLSB5yKQYrE=;
 b=YO2lRubX//zAdAr+a1XLV6E6BnHwAlLsjw4zWrKQI2R1uUAkLC0CzkpEW/EHD46XToxbTy
 z+ruXy5Wu4mCauN03PGiaZYAkj/GgirnvCxnVVOf44u8HG4geIvKbhK4QB+Mu8H5axdW4A
 EUApFpLHFomI+Y/4O0I/7DY1P0EdA6E=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-aOKwEPcSPd6DNFm44OoN0w-1; Fri, 17 Feb 2023 15:46:40 -0500
X-MC-Unique: aOKwEPcSPd6DNFm44OoN0w-1
Received: by mail-pf1-f200.google.com with SMTP id
 z16-20020aa785d0000000b005a9d0e66a7aso212795pfn.5
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 12:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676666799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eyaKjefJoZeTbmPkX6Z3OHZqmzL4eOhZaLSB5yKQYrE=;
 b=KEmGwojoUXAaEcXS6m07d/WadGBm+pq0mOWhwbA1X9pwWlZb2RRLriOsNyKU9rCEqB
 GvfwaPgJNl1T/h74iYuQUROkVEOFkEIaG4kBxlSR0kutadRffz5rM99HfWjtJGvjlSu3
 gcG1SOQeVyRHS5hN2hbSGj6iw/nh+FE4fs5y0kMA+kf9t6ZkHPOZ+ZObZdtVl61U9zFg
 mwQEXYG1nCTaiK3VMYt1DvieEc/YkSyNZnDqp+lxMGll/qMqQnud6+AIOuiF+NHuSuJX
 Cb2fGgfIGay6l2iOCjZJGhJzWUwJO+KWQgVfERmfic7JDeQWMIHFMWfvjjSsW+coaVVU
 HJ5Q==
X-Gm-Message-State: AO0yUKVDie/18s/b2lXP7roJinl3FJ/6aKk/wARP7B+oaE6FF9iuHDVb
 CMLVsAojFZfjF5rlvHQVUzO93mxPtgh8zXNGUrakIoaW9+RSl83PRfCP8IeAxzy03vyl/vyRJRo
 K/+fCQOvTpQjUkMcqVCQudL64bBVhEwA=
X-Received: by 2002:a62:87cf:0:b0:5a9:c4fc:e3d7 with SMTP id
 i198-20020a6287cf000000b005a9c4fce3d7mr701375pfe.17.1676666799740; 
 Fri, 17 Feb 2023 12:46:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+v/PzsKpDyDQiPQovvR4m1zLVeLJX+lMWEjxIBK9TI7uWr1Ov2sS0LniTkTrTJ3o4EFR0ZbQ7vMjOITJpmX34=
X-Received: by 2002:a62:87cf:0:b0:5a9:c4fc:e3d7 with SMTP id
 i198-20020a6287cf000000b005a9c4fce3d7mr701354pfe.17.1676666799372; Fri, 17
 Feb 2023 12:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
 <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
In-Reply-To: <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Feb 2023 15:46:27 -0500
Message-ID: <CAFn=p-YnR-hFAg=yxCi7oNKHXirMqv2vJSYmaY8VBPq+Q2UVbA@mail.gmail.com>
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

On Thu, Feb 16, 2023 at 5:58 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 15/02/2023 20.05, Markus Armbruster wrote:
> > The discussion under PATCH 6 makes me think there's a bit of confusion
> > about the actual impact of dropping support for Python 3.6.  Possibly
> > because it's spelled out in the commit message of PATCH 7.  Let me
> > summarize it in one sentence:
> >
> >      *** All supported host systems continue to work ***
> >
> > Evidence: CI remains green.
>
> The CI remains green since one of the patches disabled the building of the
> docs on CentOS 8. That's not how I'd describe "continue to work", at least
> not in the same extend as before.
>
> > On some supported host systems, different packages need to be installed.
> > On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
> > instead of 3.6.8.  Let me stress again: same repository, different
> > package.  No downsides I can see.
> >
> > The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
> > version of Sphinx that works with Python 3.7 or newer.  This series
> > proposes to simply stop building the docs there, unless the user
> > provides a suitable version of Sphinx (which is easy enough with pip).
>
> I think we've all understood that. The thing that you obviously did not
> understood: This breaks our support statement.
> I'm pretty sure that you could also build the whole QEMU suite successfully
> on an ancient CentOS 7 or Ubuntu 18.04 system if you manually install a
> newer version of GCC and some of the required libraries first. But that's
> not how we understand our support statement.
>
> Sure, you can argue that you can use "pip install" to get a newer version of
> Sphinx on RHEL 8 / CentOS 8 to continue building the docs there - but is
> that really that much different from installing a newer version of GCC and
> libraries on an ancient distro that we do not officially support anymore?
> I'd say no. You also have to consider that not every build host has access
> to the internet, maybe some companies only have an internal mirror of the
> distro packages in their intranet (I remember some discussion about such a
> case in the past) - so while you were perfectly fine to build the whole of
> QEMU on a CentOS 8 there before this change, you could now not build parts
> of QEMU anymore there due to the missing possibility to run "pip install"
> without full internet connection.

There are good points elsewhere in this thread and I am taking notes,
but this critique caught my eye as something I was not specifically
planning around, so I wanted to get an elaboration here if I may.

Do we have a support statement for this? I find this critique somewhat
surprising -- If we don't have internet, how did we get the other 20
to 30 dependencies needed to build QEMU? To what extent are we
*required* to preserve a build that works without internet access?

you generally need internet to run "dnf install", as you would to "pip
install", so how does this distinction exclude one but not the other?

If you mean to say: "The build cannot rely on using internet-connected
pip to configure an environment just-in-time during a build because
internet may not be present" -- I completely agree, as this is a
necessity for e.g. RHEL packaging downstream. That requirement won't
be violated by me.

--js


