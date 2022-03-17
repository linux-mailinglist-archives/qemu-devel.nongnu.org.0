Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D1D4DCB87
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:35:50 +0100 (CET)
Received: from localhost ([::1]:40286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUt6L-0000Rp-3E
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:35:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUt2l-0004w8-In
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUt2j-00056e-Qt
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647534725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2ZB5n9TT9t9rNGwI98o3EhM1R139sP/RBWsXi+5VHY=;
 b=MzJr9WFtu62SJFpG6cJqhaQbi3RDhT5Mly/bb4xYBX6LsCiS14zI3z2g7m15aflH5RHfhd
 O0YDoFPU+3O0q6vdOHcmpJUb5qfVUxx0ECnegqf8TtcM5LWfu3i7i/v1FBuT82n6alT3yu
 1orCeNNXg+F5oHq1dndXc7aEufDhj0Q=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-JW8RUkrrNueKLFIX0A9r8w-1; Thu, 17 Mar 2022 12:32:04 -0400
X-MC-Unique: JW8RUkrrNueKLFIX0A9r8w-1
Received: by mail-ua1-f71.google.com with SMTP id
 v25-20020a9f2d99000000b00346c0bb4153so2633888uaj.12
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M2ZB5n9TT9t9rNGwI98o3EhM1R139sP/RBWsXi+5VHY=;
 b=MjBN+QdfIfsRhDAUQfIeHmgnPKQDQcEbPHBX1MtTljji6q4rpnQNjBRqeMucz95HQ/
 pAqMutiqqvmoBUJNgJSt1/0D/gEy1g5MIxKd4uDG1QlTztarAD5gb3ILRxxho8gPjdXD
 8UszvZVyMwVDqVDpsg+IPcbN4nDE+TTl35527PmeKzoHB3BDK+nOX97T4yn9UzIBJurc
 LyNu7N5A8VxF47rkiy/dZXTc0BIB56fO8sk32XRWs4/FPzg5aQa89MgkEDZqlg1yjcc3
 qK5aZrm6d5I7aEed1E7taNTuHjWfZ1W0eLpmpPDFXgtXmcGW0x2x7v8C8i4v2PVHV6p2
 2efA==
X-Gm-Message-State: AOAM531IO8W08PJ20S8wjDL66WkTAn439vJJpDV0O5B2TpUZtmXikkVf
 E566/vqmmltOUiIaS0vAYQCWGjw9pGVlJOLAknwGcJnJfLQXOhcIxG1npqE9G6CVoWHftHJiUqq
 0/iCeXyw22ApEVHXm1WzlekkHxm7qyRo=
X-Received: by 2002:ab0:5bc7:0:b0:351:aa7c:95d5 with SMTP id
 z7-20020ab05bc7000000b00351aa7c95d5mr1979949uae.42.1647534723365; 
 Thu, 17 Mar 2022 09:32:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygOLMtHpC2U2yK6CSF88moWV2PwB+pxxc7GQ+VhYNLt03dkgNLcCjSDEH3R5+CGC1osXavZf8d+Clfqjkgi3k=
X-Received: by 2002:ab0:5bc7:0:b0:351:aa7c:95d5 with SMTP id
 z7-20020ab05bc7000000b00351aa7c95d5mr1979936uae.42.1647534723053; Thu, 17 Mar
 2022 09:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-3-jsnow@redhat.com>
 <1cf78366-7daa-79bb-60ad-8b7d0b03197e@redhat.com>
 <CAFn=p-bthHVLnqJvQb04=B-WvbOnmS9bW-0zWUrCi_yJEq2JWg@mail.gmail.com>
 <6f9cb4cc-4509-2139-61a2-7ef2f6e2d501@redhat.com>
In-Reply-To: <6f9cb4cc-4509-2139-61a2-7ef2f6e2d501@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 12:31:52 -0400
Message-ID: <CAFn=p-Ye0ubr=PagQ777_Law2vRFS2iwSD04=k5zxjaRVYmFSA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] python/utils: add VerboseProcessError
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 11:56 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 17.03.22 16:13, John Snow wrote:
> > On Thu, Mar 17, 2022 at 5:23 AM Hanna Reitz <hreitz@redhat.com> wrote:
> >> On 08.03.22 02:57, John Snow wrote:
> >>> This adds an Exception that extends the Python stdlib
> >>> subprocess.CalledProcessError.
> >>>
> >>> The difference is that the str() method of this exception also adds t=
he
> >>> stdout/stderr logs. In effect, if this exception goes unhandled, Pyth=
on
> >>> will print the output in a visually distinct wrapper to the terminal =
so
> >>> that it's easy to spot in a sea of traceback information.
> >>>
> >>> Signed-off-by: John Snow <jsnow@redhat.com>
> >>> Reviewed-by: Eric Blake <eblake@redhat.com>
> >>> ---
> >>>    python/qemu/utils/__init__.py | 36 +++++++++++++++++++++++++++++++=
++++
> >>>    1 file changed, 36 insertions(+)
> >>>
> >>> diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init=
__.py
> >>> index 5babf40df2..355ac550bc 100644
> >>> --- a/python/qemu/utils/__init__.py
> >>> +++ b/python/qemu/utils/__init__.py
> >>> @@ -18,6 +18,7 @@
> >>>    import os
> >>>    import re
> >>>    import shutil
> >>> +from subprocess import CalledProcessError
> >>>    import textwrap
> >>>    from typing import Optional
> >>>
> >>> @@ -26,6 +27,7 @@
> >>>
> >>>
> >>>    __all__ =3D (
> >>> +    'VerboseProcessError',
> >>>        'add_visual_margin',
> >>>        'get_info_usernet_hostfwd_port',
> >>>        'kvm_available',
> >>> @@ -121,3 +123,37 @@ def _wrap(line: str) -> str:
> >>>            os.linesep.join(_wrap(line) for line in content.splitlines=
()),
> >>>            _bar(None, top=3DFalse),
> >>>        ))
> >>> +
> >>> +
> >>> +class VerboseProcessError(CalledProcessError):
> >>> +    """
> >>> +    The same as CalledProcessError, but more verbose.
> >>> +
> >>> +    This is useful for debugging failed calls during test executions=
.
> >>> +    The return code, signal (if any), and terminal output will be di=
splayed
> >>> +    on unhandled exceptions.
> >>> +    """
> >>> +    def summary(self) -> str:
> >>> +        """Return the normal CalledProcessError str() output."""
> >>> +        return super().__str__()
> >>> +
> >>> +    def __str__(self) -> str:
> >>> +        lmargin =3D '  '
> >>> +        width =3D -len(lmargin)
> >>> +        sections =3D []
> >>> +
> >>> +        name =3D 'output' if self.stderr is None else 'stdout'
> >>> +        if self.stdout:
> >>> +            sections.append(add_visual_margin(self.stdout, width, na=
me))
> >>> +        else:
> >>> +            sections.append(f"{name}: N/A")
> >>> +
> >>> +        if self.stderr:
> >>> +            sections.append(add_visual_margin(self.stderr, width, 's=
tderr'))
> >>> +        elif self.stderr is not None:
> >> What exactly is this condition for?  I would=E2=80=99ve understood if =
it was
> >> `self.stdout` (because the stdout section then is called just =E2=80=
=9Coutput=E2=80=9D,
> >> so it would make sense to omit the stderr block), but this way it look=
s
> >> like we=E2=80=99ll only go here if `self.stderr` is an empty string (w=
hich
> >> doesn=E2=80=99t make much sense to me, and I don=E2=80=99t understand =
why we wouldn=E2=80=99t
> >> have the same in the `self.stdout` part above).
> >>
> >> (tl;dr: should this be `self.stdout`?)
> >>
> >> Hanna
> >>
> > if self.stderr is None, it means that the IO streams were combined. If
> > it is merely empty, it means there wasn't any stderr output.
>
> Might warrant a comment? :)

How 'bout:

has_combined_output =3D self.stderr is None

>
> > so:
> >
> > if self.stderr: There's content here, so put it in a lil' box
> > else: could be either None or the empty string. If it's None, we
> > didn't *have* a stderr, so don't print anything at all, let the
> > "output" section above handle it. If we did have stderr and it just
> > happened to be empty, write N/A.
> >
> > I wanted that "N/A" to provide active feedback to show the human
> > operator that we're not just failing to show them what the stderr
> > output was: there genuinely wasn't any.
>
> Thanks, that makes sense.
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>


