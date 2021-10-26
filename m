Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3704943B91B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:11:37 +0200 (CEST)
Received: from localhost ([::1]:59164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQv9-0002lp-98
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQkF-00011l-1i
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQkB-0005Gf-8T
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635271214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mdZj4CkkaujKMloveiasqep6z+xiSpe6UTkQSrfhDK0=;
 b=T8qRbRGdslSRzfdPaSOlMG9BJ2HxrQqwa7emTn01Xyg574D76mXl4TvNTsOnRjncj4IEvX
 ZFNIeSo1madc0rttV/7NAusTJlZ0dOfLsPwy3BrgN61PNqprV3W+c8mra3clBrbVRGYOAn
 KX/xeocNXdmEZ/yUK0mRUjlaxbk3OcE=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-6L1WDtW5Mqugi-Su6qulPw-1; Tue, 26 Oct 2021 14:00:13 -0400
X-MC-Unique: 6L1WDtW5Mqugi-Su6qulPw-1
Received: by mail-ua1-f71.google.com with SMTP id
 63-20020a9f2345000000b002cbbc79fb71so22682uae.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdZj4CkkaujKMloveiasqep6z+xiSpe6UTkQSrfhDK0=;
 b=6FNoFdB0KwVJZzV7oEG+zIbbr3lYZ39ajjCNVlhTTrX35KrBcsuGDT2utNQPFYDLCs
 R0WyfWzKKEP3bnV7C8OcgBiRng52ATQ8XnnmNSOOMK2Fd5xIX1H+nxyno1H8WctL6WUY
 SdHKyUCf962V4RGTvkrLM4i/OWUkyd9WPpqDs4n2/rkZrvPKVusWY4NjUloxehEL1jmP
 7anj/HnNy5zzZWkXnsTPTGTYhPJckc8dRuhUsk076qPJMMiKBeOdc0uhAzyBYFYvHiYn
 KT7m4/aZ0K0VUPMLyXxChJlwGtULPl0Hy2WruFFL2QCraZeGUC+a5i1IbPx608PG4FTT
 4+JA==
X-Gm-Message-State: AOAM5315tK1zjplcRTgv32JMSFvGJ54h4ADQTZ+oUMNiekRYJEcHrrTg
 cptpPLi01oKNvchgKkJMmgN6nx4WDvk9CtD702o1zS/Izh8ra+UJigeCRRHYOCgeUL2hU23iE7i
 DB7Gi5uPEKOOF8PMSTnapEifQrnvpaqk=
X-Received: by 2002:a05:6122:2020:: with SMTP id
 l32mr1017042vkd.10.1635271209615; 
 Tue, 26 Oct 2021 11:00:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxuWSyZHkpqMaXY6udVDVd3zQuvyrKKzgeACsMwl3QLQCblMo7nI6mqhHGWJmpKS/viuZiZRLhwaloRbX8evQ=
X-Received: by 2002:a05:6122:2020:: with SMTP id
 l32mr1016896vkd.10.1635271208687; 
 Tue, 26 Oct 2021 11:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-9-jsnow@redhat.com>
 <6944915c-4bd8-9201-3cbd-7c670036383d@redhat.com>
In-Reply-To: <6944915c-4bd8-9201-3cbd-7c670036383d@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 13:59:58 -0400
Message-ID: <CAFn=p-YPObqmsf75iXCrr=UOoqUWdgzg_2CD+taY80E+x=-CAw@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] iotests/297: Change run_linter() to raise an
 exception on failure
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000081848705cf453fec"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000081848705cf453fec
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 6:10 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 19.10.21 16:49, John Snow wrote:
> > Instead of using a process return code as the python function return
> > value (or just not returning anything at all), allow run_linter() to
> > raise an exception instead.
> >
> > The responsibility for printing output on error shifts from the function
> > itself to the caller, who will know best how to present/format that
> > information. (Also, "suppress_output" is now a lot more accurate of a
> > parameter name.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/297 | 24 ++++++++++++++----------
> >   1 file changed, 14 insertions(+), 10 deletions(-)
>
> Thanks! :)
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
No problem. Thanks for taking the time to review it!

--js

--00000000000081848705cf453fec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 6:10 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 19.10.2=
1 16:49, John Snow wrote:<br>
&gt; Instead of using a process return code as the python function return<b=
r>
&gt; value (or just not returning anything at all), allow run_linter() to<b=
r>
&gt; raise an exception instead.<br>
&gt;<br>
&gt; The responsibility for printing output on error shifts from the functi=
on<br>
&gt; itself to the caller, who will know best how to present/format that<br=
>
&gt; information. (Also, &quot;suppress_output&quot; is now a lot more accu=
rate of a<br>
&gt; parameter name.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 24 ++++++++++++++----------<br>
&gt;=C2=A0 =C2=A01 file changed, 14 insertions(+), 10 deletions(-)<br>
<br>
Thanks! :)<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>No problem. Thanks for taking the time=
 to review it!</div><div><br></div><div>--js<br></div></div></div>

--00000000000081848705cf453fec--


