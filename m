Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146954A52DE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:06:09 +0100 (CET)
Received: from localhost ([::1]:41320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEfkN-0004P4-Nz
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:06:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nEfia-0003ab-Mg
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nEfiX-0004de-Ro
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643670246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blfVih4drdtMe+1WH9CQcQgeVmPQJFTHv/2q+8yPlEw=;
 b=OD4qbxzUrMMK9t86cZsqj+v5KPZfsnaTb/eLTB+Tdu6BOuQT4N+I0DjQeIP4tNeWdbDoXO
 mLSrHGzZWIb9Va4d58nxvWh9iptp/ReIaJ3q4bt6Z0yFYAP0E7NAdqRBla/KGlLJzwvh3s
 axfnxGvXmALYvSOFDcUwVZYSS3zDzHs=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-O0TvipFUMgaZupOLtaKTbg-1; Mon, 31 Jan 2022 18:04:03 -0500
X-MC-Unique: O0TvipFUMgaZupOLtaKTbg-1
Received: by mail-vk1-f200.google.com with SMTP id
 i26-20020ac5cbfa000000b0031f8edd1ad7so2182067vkn.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 15:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=blfVih4drdtMe+1WH9CQcQgeVmPQJFTHv/2q+8yPlEw=;
 b=CuuEsa4IVTdn8vUpfTVdz5qvHOvp38luSE+mb61KzE4tOm2wuankwXiKfxwemTOL2Y
 XHNnTzMafggo5Z3yMXXqmbDngsWRfAAMlTNRWhlSJozzyYvVGKe+KisoDgYlaxytABw0
 oThRYXimGC8Rl3DbtaTsbAkvByZLbxH/+KEC2MLlfAU24mTcIVxrEfPP+dIELdYoxTh9
 58pvC0Ff09Psxz+2uN7OTaQDlvl+V22zrK4kHlC50ncYlKT+akGrecRhn02EiqXYs8+F
 d5eHTQ0FPbhG7JxkI60fKfUtv5I8bJxpu35vGEOcADT0+2ZgNU8qAavqwIiSmsitH0I4
 62jg==
X-Gm-Message-State: AOAM533Oje68ENCKGWyIWt/f6+ZcTqOu6E+Iw/bX+sUDKn4pX/2aYCpL
 t888Ckck4+3KtMInvHGij/gWqWab/Yw6is4RemjJups8Ah03YlPJKyVOpNCiy98/XYVjNt4FRxG
 esweaEvx55flLXNxCu3mCG7Psm4pYuCE=
X-Received: by 2002:a67:a449:: with SMTP id p9mr8285265vsh.61.1643670242394;
 Mon, 31 Jan 2022 15:04:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw72MXbcmzLz3tQen3dtmUIssfof2d9lfDx9UB6ksV3vQgz3dt3jkEtDrNkeXDuUZ3wUlWNqjCf9ifWH1aLW8k=
X-Received: by 2002:a67:a449:: with SMTP id p9mr8285258vsh.61.1643670242138;
 Mon, 31 Jan 2022 15:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20220124180626.627718-1-jsnow@redhat.com>
 <20220124180626.627718-3-jsnow@redhat.com>
 <852c6011-eb3c-2753-2814-364dd3188278@redhat.com>
In-Reply-To: <852c6011-eb3c-2753-2814-364dd3188278@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 31 Jan 2022 18:03:51 -0500
Message-ID: <CAFn=p-bS+f4zRjCn9HquySgBvy_p-7qAAP4z=xjkpMJGX03p3A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] python/machine: raise VMLaunchFailure exception
 from launch()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 9:22 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 24.01.22 19:06, John Snow wrote:
> > This allows us to pack in some extra information about the failure,
> > which guarantees that if the caller did not *intentionally* cause a
> > failure (by capturing this Exception), some pretty good clues will be
> > printed at the bottom of the traceback information.
>
> OK, I presume in contrast to unconditionally logging this on debug
> level, which is less than ideal because on that level it=E2=80=99s most l=
ikely
> hidden, but that was exactly the point, because we don=E2=80=99t know whe=
ther
> the caller will catch the exception, so we mustn=E2=80=99t log it on a mo=
re
> urgent level.
>

Exactly. More urgent logging interferes with tests where we
intentionally give a bad configuration. device-crash-test is another
example.

> But by creating a new exception class, we get a reasonable log output
> exactly when the caller won=E2=80=99t catch it.
>

That's the intent. By stuffing this info into the Exception, we'll
always see it printed if the error went unhandled. It seemed like the
best way to make sure the error messages were more apparent more often
without requiring the use of debug mode -- so that errors in e.g.
GitLab CI would print good diagnostic info by default.

> > This will help make failures in the event of a non-negative return code
> > more obvious when they go unhandled; the current behavior is to print a
> > warning message only in the event of signal-based terminations (for
> > negative return codes).
>
> I assume you mean the one in _post_shutdown()...?
>

Yes.

> Confused me a bit, because for a while I interpreted this to mean =E2=80=
=9CWe
> don=E2=80=99t output anything in case of a positive return code=E2=80=9D,=
 but it means
> =E2=80=9CWe don=E2=80=99t print any details in that case, because the exc=
eption we
> re-raise in launch() doesn=E2=80=99t contain valuable information=E2=80=
=9D.  Makes sense.
>

Sorry, I'll improve the commit message.

> > (Note: In Python, catching BaseException instead of Exception is like
> > installing a signal handler that will run as long as Python itself
> > doesn't crash.
>
> This really confused me, because I can=E2=80=99t really understand this a=
t all.
>
> But I guess what I took from googling was that every exception object
> must be derived from BaseException eventually, and so we continue to
> catch all exceptions here, we just give them a name. (And then we create
> a VMLaunchFailure only for Exception exceptions, because the others
> don=E2=80=99t have much to do with launching the VM.)
>

Apologies for not being more clear. ("It made sense to me at the time
...") What I mean to say here is: there are several ways to catch all
exceptions.

"except:" will catch everything.
"except BaseException" catches everything, too. This is equivalent to the a=
bove.
"except Exception" won't catch anything that inherits directly from
BaseException, only Exception and children.

What I wanted to convey here is that:

(1) If the exception is a BaseException, it's probably something like
KeyboardInterrupt (SIGINT) or SystemExit, we don't want to wrap the
exception and instead we want to re-raise it as-is. We are functioning
more or less like a signal handler here, performing some cleanup and
then yielding back control.
(2) If the exception is merely an Exception, it's OK to wrap it with
the custom exception and re-raise.

Wrapping a BaseException would be a problem because it would
'downgrade' the severity of the exception (so to speak) and may cause
issues.
I'll try to improve the commit message.

> > KeyboardInterrupt and several other "strong" events in
> > Python are a BaseException. These events should generally not be
> > suppressed, but occasionally we want to perform some cleanup in respons=
e
> > to one.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/machine/machine.py            | 45 ++++++++++++++++++++--=
-
> >   tests/qemu-iotests/tests/mirror-top-perms |  3 +-
> >   2 files changed, 40 insertions(+), 8 deletions(-)
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
> (Looked at `except` and `ConnectError` usage outside of
> mirror-top-perms, but couldn=E2=80=99t find anything else that looked lik=
e it
> caught VM launch exceptions.)
>

Thanks!


