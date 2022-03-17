Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361554DCBC2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:51:51 +0100 (CET)
Received: from localhost ([::1]:54820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtLq-0002Ux-AD
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:51:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUtIX-00089P-NE
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUtIV-0007bp-4T
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647535702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfAp+fveBcx12mdqvPIa2pNMBUVtc9lvOmqDqn1SD9Y=;
 b=isvS93x3WWTx/NNcp8TIjHtiBGM4N3xYsyl11kkfhcLxvvwujyAoqDSNiIgV1WSd7HmPDi
 8oesgWgNwZ7J1kYMmf3C3NgHmdcZdwQubN/3n/F0UOffsj0T2oGLW+teI89HIKoS+rgwIY
 VGdKNrvv7FIYT/NU91hnPRiQ+sv0yWI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-PmL_QJEGNQmTWshlDejEYg-1; Thu, 17 Mar 2022 12:48:21 -0400
X-MC-Unique: PmL_QJEGNQmTWshlDejEYg-1
Received: by mail-vs1-f69.google.com with SMTP id
 s125-20020a675e83000000b00320c64c3205so496464vsb.2
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GfAp+fveBcx12mdqvPIa2pNMBUVtc9lvOmqDqn1SD9Y=;
 b=QrIFxw0rpRmaFdpItoiMDO85SLuwIHoIdqEzogKUs0TmVmg9v4fluPp1vaO4ydeZrA
 sMEzt0rw34X/DHJjVoUjngIC/PueA3qxM1Il1gIIdAsWTnTPCrTNk5zJ8B4d/ZM7JXQ6
 RTJTW7nK/VUwrwNPF882SWD3ItWM5M9W4ixL4xmd10QZzpfObSFltZNv0KC5varVHtFY
 Bx4qWEaGOD1yhnhw/M/bCtrp+S6NVjw2aPWMJYl9ZZHQ/SLdcVj8kIL/UbstjHg4W4kJ
 d3GgBzG7ZkRSNtMXLNmuRO10ipjl4KZzh7J2McMGNGkpZIcO74bQUYnAkxj/H88vRii4
 /wAg==
X-Gm-Message-State: AOAM532VRJTwSvP35hC5W6FFFPtDE0Lk6G2GHB6wklCOjJVvxxycf26r
 28yljdXL6Anc1f9ki6QsjMXmfeiK3+k5xEwR6Q9m8fpV9N5e0DpQfzSkkJ98acQa2oVXh1JlG7J
 hO0bfGlea4KsSDKmE+yrVnJbZYE/4le4=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr2378420vsa.38.1647535700754; 
 Thu, 17 Mar 2022 09:48:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwjTta/YtT+ZFx2knemjwMSP/3Mu+Pq5NgG7zuKd4ywVd7WShcUkD47KizuDMN2P1Yxj3BAWb7f3XHuqO6P/k=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr2378397vsa.38.1647535700431; Thu, 17 Mar
 2022 09:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-3-jsnow@redhat.com>
 <1cf78366-7daa-79bb-60ad-8b7d0b03197e@redhat.com>
 <CAFn=p-bthHVLnqJvQb04=B-WvbOnmS9bW-0zWUrCi_yJEq2JWg@mail.gmail.com>
 <6f9cb4cc-4509-2139-61a2-7ef2f6e2d501@redhat.com>
 <CAFn=p-Ye0ubr=PagQ777_Law2vRFS2iwSD04=k5zxjaRVYmFSA@mail.gmail.com>
 <1a1dc3e8-bad2-1854-da0d-6677cbbaae01@redhat.com>
In-Reply-To: <1a1dc3e8-bad2-1854-da0d-6677cbbaae01@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 12:48:09 -0400
Message-ID: <CAFn=p-YQQE+7eF6=3-tT7RRKvSf0LLraeS29WJ3UNgUYw0sOfA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] python/utils: add VerboseProcessError
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 12:34 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 17.03.22 17:31, John Snow wrote:
> > On Thu, Mar 17, 2022 at 11:56 AM Hanna Reitz <hreitz@redhat.com> wrote:
> >> On 17.03.22 16:13, John Snow wrote:
> >>> On Thu, Mar 17, 2022 at 5:23 AM Hanna Reitz <hreitz@redhat.com> wrote=
:
> >>>> On 08.03.22 02:57, John Snow wrote:
> >>>>> This adds an Exception that extends the Python stdlib
> >>>>> subprocess.CalledProcessError.
> >>>>>
> >>>>> The difference is that the str() method of this exception also adds=
 the
> >>>>> stdout/stderr logs. In effect, if this exception goes unhandled, Py=
thon
> >>>>> will print the output in a visually distinct wrapper to the termina=
l so
> >>>>> that it's easy to spot in a sea of traceback information.
> >>>>>
> >>>>> Signed-off-by: John Snow <jsnow@redhat.com>
> >>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
> >>>>> ---
> >>>>>     python/qemu/utils/__init__.py | 36 ++++++++++++++++++++++++++++=
+++++++
> >>>>>     1 file changed, 36 insertions(+)
> >>>>>
> >>>>> diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__in=
it__.py
> >>>>> index 5babf40df2..355ac550bc 100644
> >>>>> --- a/python/qemu/utils/__init__.py
> >>>>> +++ b/python/qemu/utils/__init__.py
> >>>>> @@ -18,6 +18,7 @@
> >>>>>     import os
> >>>>>     import re
> >>>>>     import shutil
> >>>>> +from subprocess import CalledProcessError
> >>>>>     import textwrap
> >>>>>     from typing import Optional
> >>>>>
> >>>>> @@ -26,6 +27,7 @@
> >>>>>
> >>>>>
> >>>>>     __all__ =3D (
> >>>>> +    'VerboseProcessError',
> >>>>>         'add_visual_margin',
> >>>>>         'get_info_usernet_hostfwd_port',
> >>>>>         'kvm_available',
> >>>>> @@ -121,3 +123,37 @@ def _wrap(line: str) -> str:
> >>>>>             os.linesep.join(_wrap(line) for line in content.splitli=
nes()),
> >>>>>             _bar(None, top=3DFalse),
> >>>>>         ))
> >>>>> +
> >>>>> +
> >>>>> +class VerboseProcessError(CalledProcessError):
> >>>>> +    """
> >>>>> +    The same as CalledProcessError, but more verbose.
> >>>>> +
> >>>>> +    This is useful for debugging failed calls during test executio=
ns.
> >>>>> +    The return code, signal (if any), and terminal output will be =
displayed
> >>>>> +    on unhandled exceptions.
> >>>>> +    """
> >>>>> +    def summary(self) -> str:
> >>>>> +        """Return the normal CalledProcessError str() output."""
> >>>>> +        return super().__str__()
> >>>>> +
> >>>>> +    def __str__(self) -> str:
> >>>>> +        lmargin =3D '  '
> >>>>> +        width =3D -len(lmargin)
> >>>>> +        sections =3D []
> >>>>> +
> >>>>> +        name =3D 'output' if self.stderr is None else 'stdout'
> >>>>> +        if self.stdout:
> >>>>> +            sections.append(add_visual_margin(self.stdout, width, =
name))
> >>>>> +        else:
> >>>>> +            sections.append(f"{name}: N/A")
> >>>>> +
> >>>>> +        if self.stderr:
> >>>>> +            sections.append(add_visual_margin(self.stderr, width, =
'stderr'))
> >>>>> +        elif self.stderr is not None:
> >>>> What exactly is this condition for?  I would=E2=80=99ve understood i=
f it was
> >>>> `self.stdout` (because the stdout section then is called just =E2=80=
=9Coutput=E2=80=9D,
> >>>> so it would make sense to omit the stderr block), but this way it lo=
oks
> >>>> like we=E2=80=99ll only go here if `self.stderr` is an empty string =
(which
> >>>> doesn=E2=80=99t make much sense to me, and I don=E2=80=99t understan=
d why we wouldn=E2=80=99t
> >>>> have the same in the `self.stdout` part above).
> >>>>
> >>>> (tl;dr: should this be `self.stdout`?)
> >>>>
> >>>> Hanna
> >>>>
> >>> if self.stderr is None, it means that the IO streams were combined. I=
f
> >>> it is merely empty, it means there wasn't any stderr output.
> >> Might warrant a comment? :)
> > How 'bout:
> >
> > has_combined_output =3D self.stderr is None
>
> That would be better, although I=E2=80=99m not quite sure I=E2=80=99d imm=
ediately know
> what this means.  Something like =E2=80=9CDoes self.stdout contain both s=
tdout
> and stderr?=E2=80=9D above it would clear my potential and/or assumed con=
fusion,
> I believe.

Sure thing.

(Thanks!)


