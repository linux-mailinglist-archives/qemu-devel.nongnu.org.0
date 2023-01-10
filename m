Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD46639B1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:06:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF8hF-0001nr-DL; Tue, 10 Jan 2023 02:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pF8hC-0001ng-Gg
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:05:18 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pF8hA-0008Rw-Pr
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:05:18 -0500
Received: by mail-lf1-x12d.google.com with SMTP id m6so16853985lfj.11
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 23:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uJL106q343A4rEE2FHH0goBwBhJwiIEz5QIMwm/aqhY=;
 b=I5fRGMPONrzPEpzR/wCP1ZLXsqMYzK2QK5PXTM/jTcDx8mVbfYqol3HMa0O4ibuLyw
 Ls0dkDpdoRzcLtsUatfXEAR4VBbmAUxXR1xYI9GrzW62JO3am97qBY+LrxscSvZVu3EO
 esMOvjJ0wDYUxPQp1E8M/Oer7n9mdcl5PTl80SumFadP89MsbQL6v8NJvGWLza6Kkz3i
 IxVoXUx2cZjFyTxZidfgpUxzh3ErZZercD3FyluAnRXTmbdBtP29MwJdDCclpngKISZB
 DlbBiTom1mwTNX2YFdmo34RScb07BRK/JSnkqLiaE6lVn13r8xco6bTEc5TnqZf8306p
 gFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJL106q343A4rEE2FHH0goBwBhJwiIEz5QIMwm/aqhY=;
 b=appHl/mn6YY3UeYUyiehJchbwsdjmZoy6uXfLCFZLIqJQsRNFbmvt1zXgGw7D0Qpgc
 f6nOCv8f8ul0WxEJwfTbuXq64ii1AbqI7f6YZwroEs1sny8OEhbkxWOOb4d/DwEThqko
 hCNd1eqWOawfYjyK594L8aSHlKHe5aSy6GNSgj9E/TcHfguyBDQuh7Wt/Zsw3VeoNFzj
 xiB6xHDvXHiZAuLxhJd8i/0fgqsmKW92XQOSzWzKq8ZXhVmOpQEFIyfetr3vY99vCxSc
 pT4Jk8htlgGNuGkx/3JjpI01+V7XHHJV1lxipHBi5CGhuhDfMVXBxBmSkvBYMvhBLB97
 Axog==
X-Gm-Message-State: AFqh2kqNc3Du6yJ87YbcblNboFLntgM3SpPlfFEV/s99FXds7cJy+fXx
 X1pQar/LWMbJj+7kPc3S8DgJ0lLWddj0xIsU/Zw=
X-Google-Smtp-Source: AMrXdXtg+u9XZ1sDr1zSsIEq+RybSnCzbFXUvCD+oDXLfr9pHgKadoHN0h3GvXOlogqxRhmU81B2YxC1Kvx+cgRX6IU=
X-Received: by 2002:ac2:4141:0:b0:4b5:886b:d4af with SMTP id
 c1-20020ac24141000000b004b5886bd4afmr6726648lfi.276.1673334314329; Mon, 09
 Jan 2023 23:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
 <CAFn=p-Z1JqriE2iD26pYFycNBZhkxK3wqOcz6KzD-CegFP+qKQ@mail.gmail.com>
 <CAJ+F1C+NEqp-P9BAzT5ADkxVP_pZyvtZPAOVz3R_Xq0w7tCmpg@mail.gmail.com>
 <CAFn=p-b-hXVGZJruWa7zY+-pXiqMCEN17FTSpHGNHWPPKMik2A@mail.gmail.com>
In-Reply-To: <CAFn=p-b-hXVGZJruWa7zY+-pXiqMCEN17FTSpHGNHWPPKMik2A@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 10 Jan 2023 11:05:02 +0400
Message-ID: <CAJ+F1CLrTb_UWwubr38v=2dEbVkJCF4RYKKDLRax=rhGyoiU0A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] python/qemu/machine: fix potential hang in QMP
 accept
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi John

On Tue, Jan 10, 2023 at 1:06 AM John Snow <jsnow@redhat.com> wrote:
>
> On Mon, Jul 25, 2022 at 7:23 AM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Fri, Jul 1, 2022 at 2:51 AM John Snow <jsnow@redhat.com> wrote:
> >>
> >> On Thu, Jun 30, 2022 at 8:34 AM <marcandre.lureau@redhat.com> wrote:
> >> >
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > Hi,
> >> >
> >> > As reported earlier by Richard Henderson ("virgl avocado hang" threa=
d), avocado
> >> > tests may hang when QEMU exits before the QMP connection is establis=
hed.
> >> >
> >> > v2:
> >> >  - use a socketpair() for QMP (instead of async concurrent code from=
 v1) as
> >> >    suggested by Daniel Berrange.
> >> >  - should not regress (hopefully)
> >> >
> >> > Marc-Andr=C3=A9 Lureau (3):
> >> >   python/qmp/protocol: add open_with_socket()
> >> >   python/qmp/legacy: make QEMUMonitorProtocol accept a socket
> >> >   python/qemu/machine: use socketpair() for QMP by default
> >> >
> >> >  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
> >> >  python/qemu/qmp/legacy.py      | 18 +++++++++++++++---
> >> >  python/qemu/qmp/protocol.py    | 25 ++++++++++++++++++++-----
> >> >  3 files changed, 51 insertions(+), 16 deletions(-)
> >> >
> >> > --
> >> > 2.37.0.rc0
> >> >
> >>
> >> For anything that touches python/qemu/qmp/*, may I please ask that you
> >> submit them to https://gitlab.com/qemu-project/python-qemu-qmp ?
> >>
> >
> > Ok
> >
> >>
> >> (I'll review them in the meantime on-list just in the interest of
> >> moving things along.)
> >
> >
> > I was waiting for a review before updating the patches / moving to pyth=
on-qemu-qmp.
> >
>
> Fair enough - can I kindly ask you to resend, though? My apologies and
> Happy New Year!

I am confused, what's the relation between QEMU python/qemu/qmp and
https://gitlab.com/qemu-project/python-qemu-qmp ?

When / how is the code sync ?

--=20
Marc-Andr=C3=A9 Lureau

