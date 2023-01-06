Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82C366068D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:44:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDrhd-0004GE-0D; Fri, 06 Jan 2023 13:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDrhb-0004E3-1L
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:44:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDrhY-0002ME-Sz
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673030663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTZs2hhgoUKd8hoyl3FgrLfhWEEwCepMTO1BJgGwmzY=;
 b=AVvU2UMHt97jr3KwqPmYqJ67wnfuTwqZdI84CqUJ/QpLlGgfKqXwHbQZrlk6tufr0IpCql
 xlnIN711Jil+8PHMJXgBWg0oaEUhc2koje4IStSR99QYWRqylOKhVhKBKHOjB7UMHr1yHX
 36E/uKUSF2FX4avAOV2Cn+3po1LEWEo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-rinsJ9bgPjyTbGXYSMiWBQ-1; Fri, 06 Jan 2023 13:44:22 -0500
X-MC-Unique: rinsJ9bgPjyTbGXYSMiWBQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 l15-20020a056512110f00b004b6fe4513b7so806493lfg.23
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 10:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTZs2hhgoUKd8hoyl3FgrLfhWEEwCepMTO1BJgGwmzY=;
 b=7aBKzbCxeZb/AMN36wB5vWvq6oqF2FHONZHCKHeqmOVcGoAZ/GyWhfJnkcQQ2yVnes
 grzKjMWPQyET/Q5ZJ8ATrkesNgCKCZOesVoh9dnZN/7LQ/Gb0UQ6llzKGy/iuwCxUN8p
 cKFYhLwdyEeZ6+d4FzjTYCLItOEWA3z8IukUZBb0dX1IRHLgZHE/8koUIn2uSFY/WQy9
 oZg+o8VJIpKvm1qRHN3phYonh3azPzq//+4UDj5vcOV7R4z4Zb9R5slPap1nLuNzu7Qe
 AGytDTtwtDhVFiQVTdU+pYP4WV8m5l++zTtS423JwHF7PlQasgqfzD+xmcKUufbWBvK4
 13IQ==
X-Gm-Message-State: AFqh2kpJ5komOMB/bcJkJ0/yKgu0jM7wnC0Q76Y2KWt61QR32XAmVnxI
 H/2CCAhzS5GoKEiRQxABmvX85Ds2m8SksLg/dpF8Yj+1VNyj8937hKu2khn+gLiLaRWOsKMLsnc
 6a3poEr4/2qJMIf+mnwTgNqj1cXmQHKk=
X-Received: by 2002:ac2:46f8:0:b0:4b5:7fa8:e96a with SMTP id
 q24-20020ac246f8000000b004b57fa8e96amr5551923lfo.478.1673030660872; 
 Fri, 06 Jan 2023 10:44:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXumr1KGgqMbXsSALzWFTsuVWBdp+7IgZ7U3aj/MbaoFvSL3iDHjBS/48b4dmt/y7tUZ2soPGiC+v9/lZRv3PDc=
X-Received: by 2002:ac2:46f8:0:b0:4b5:7fa8:e96a with SMTP id
 q24-20020ac246f8000000b004b57fa8e96amr5551920lfo.478.1673030660661; Fri, 06
 Jan 2023 10:44:20 -0800 (PST)
MIME-Version: 1.0
References: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
 <1ceb5a68.dd0e.18518f40d8f.Coremail.zhangdongdong@eswincomputing.com>
 <CAFn=p-bnm5WgBO-eXTyuV+mPiCYaLM-rFaUVXY+kmU39GvwpZw@mail.gmail.com>
 <2a334c7d.1060e.18584c5f906.Coremail.zhangdongdong@eswincomputing.com>
In-Reply-To: <2a334c7d.1060e.18584c5f906.Coremail.zhangdongdong@eswincomputing.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 6 Jan 2023 13:44:09 -0500
Message-ID: <CAFn=p-aPUsi-CXJupay8jrTsSZJ41b98zToZk7Wqdt0XpvyfCQ@mail.gmail.com>
Subject: Re: Re: [PING PATCH 0/1] Fix some typos
To: Dongdong Zhang <zhangdongdong@eswincomputing.com>
Cc: qemu-devel@nongnu.org, crosa@redhat.com, bleal@redhat.com
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

On Thu, Jan 5, 2023 at 8:50 PM Dongdong Zhang
<zhangdongdong@eswincomputing.com> wrote:
>
> Hi John,
>
> Could you help me relay these fixes?
> If I submit a pull request, I will go through company's internal review p=
rocess again.

No problem at all. My apologies for the delay.

Staged for QEMU, with additional fix spotted by Max:
https://gitlab.com/jsnow/qemu/-/commit/4cd8db9f367e12ccd7d3980f2573fe65f994=
9562
Staged for qemu.qmp, preserving credit:
https://gitlab.com/jsnow/python-qemu-qmp/-/commit/cd190a79bcee975d00b033400=
3e6dcbaf8ec9630

>
> Thanks a lot!
>

Thank *you* :)

--js

> Dongdong
>
>
> > -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----=E5=8F=91=E4=BB=B6=E4=BA=
=BA:"John Snow" <jsnow@redhat.com>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:2023=
-01-06 07:25:43 (=E6=98=9F=E6=9C=9F=E4=BA=94)=E6=94=B6=E4=BB=B6=E4=BA=BA:"D=
ongdong Zhang" <zhangdongdong@eswincomputing.com>=E6=8A=84=E9=80=81:qemu-de=
vel@nongnu.org, crosa@redhat.com, bleal@redhat.com=E4=B8=BB=E9=A2=98:Re: [P=
ING PATCH 0/1] Fix some typos
> >
> > On Thu, Dec 15, 2022 at 10:22 PM Dongdong Zhang
> > <zhangdongdong@eswincomputing.com> wrote:
> > >
> > > Hi all,
> > >
> > > I would like to ping a patch
> > >
> > > https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg04568.htm=
l
> > > https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg04570.htm=
l
> > >
> > >
> > > > -----Original Messages-----From:"Dongdong Zhang" <zhangdongdong@esw=
incomputing.com>Sent Time:2022-11-30 09:53:57 (Wednesday)To:qemu-devel@nong=
nu.orgCc:jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, "Dongdong Zh=
ang" <zhangdongdong@eswincomputing.com>Subject:[PATCH 0/1]  Fix some typos
> > > >
> > > > This patch mainly fixes some typos in the 'python' directory.
> > > >
> > > > Dongdong Zhang (1):
> > > >   Fix some typos
> > > >
> > > >  python/qemu/machine/console_socket.py | 2 +-
> > > >  python/qemu/machine/qtest.py          | 2 +-
> > > >  python/qemu/qmp/protocol.py           | 2 +-
> > > >  python/qemu/qmp/qmp_tui.py            | 6 +++---
> > > >  4 files changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > --
> > > > 2.17.1
> >
> > ACK to this patch.
> >
> > For fixes under python/qemu/qmp/, I need to relay these fixes over to
> > https://gitlab.com/qemu-project/python-qemu-qmp -- you can do it
> > yourself and send a small merge request, or I can do it for you, if
> > you'd like. Please let me know what you'd prefer, and then I will
> > stage this patch.
> >
> > (Apologies that the code is duplicated in two repositories right
> > now.... I'm working on fixing that.)
> >
> > --js


