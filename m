Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D126043B93F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:15:54 +0200 (CEST)
Received: from localhost ([::1]:39772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQzI-0000JM-0R
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQmG-0002mk-Kg
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQmD-0005eq-W5
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635271339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RM2yRONY7GuPgPxTeaHdfNlqDcImWnb/nLUyNeRD77A=;
 b=DZXlPDIT4hbHjUgrBFOUNouXs9mMvK33sImFjTiCPGu5ELvEvFKVWzTPzbinT7Vo/lw86S
 hUkBYzZH0lrTEZngHPXIuZxBdX6tuwbDJxx7CpohZTBFrgLlvk78C6Oq5mz92vaAnQzDXj
 S0TWLFvv81NLzY3mmEbv2IRjJc8UtPs=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-wq6poSPyNVWucB9cBDNIig-1; Tue, 26 Oct 2021 14:02:15 -0400
X-MC-Unique: wq6poSPyNVWucB9cBDNIig-1
Received: by mail-ua1-f72.google.com with SMTP id
 e5-20020ab04985000000b002cad81164cbso8675632uad.10
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RM2yRONY7GuPgPxTeaHdfNlqDcImWnb/nLUyNeRD77A=;
 b=LoqnXwwznI0YhTrW0gZaC4yZKfsOZpk/mYBfQrLHl+LvxheAMp71OP1ejzzahI7E9y
 l5lR3h1ktcD9XsU9LQ05VgLkMgzvYt3jWkCHAsRLuhchEovMt+UhLbpzeqYxwwc7K/rn
 SNGz/ZQ3jjTD2TPbm23sI8DURqzCNuJfpN7I/7sR2HjYiBhqLDvTjrd+tzJop6co7StV
 YbW/aGn+1Cu8rx9inFt2m0XU4mDQgjzoJLA1aM3bA4nSJFbAtj/kFYDFYAL3AAJHNy+c
 82W3V8LK3iuk/dkKEbHlvPJa8r0EHLqQ9EKlDieCeA9RGE9di7Hq6HEzw8WLULo5E/BT
 RPwA==
X-Gm-Message-State: AOAM530samq3lEK9wVwQjvJPqsyP9yZ7UlHND6t3zS745ZjGxWbvE1Ez
 wGPcUo8IWVcWa4HwM4A5luvOxX5JFK479YO3UYRNmX48wErB0RBwEzYTrMbEfz8H3xP82cflFVR
 +jN5ndAIItMSjlnnk9V/xT0qnjDy5rOM=
X-Received: by 2002:ab0:759a:: with SMTP id q26mr2984188uap.128.1635271334938; 
 Tue, 26 Oct 2021 11:02:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDdeMajR9yFElJ2CvJkglKKaeCMsJfkjE30xXVinfvoM80qD143iNzJdIzIdJvgJQLeSfUaErtTinQHAQd35w=
X-Received: by 2002:ab0:759a:: with SMTP id q26mr2984160uap.128.1635271334658; 
 Tue, 26 Oct 2021 11:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-11-jsnow@redhat.com>
 <6ab178e6-2fde-e681-cff2-834f132562a6@redhat.com>
In-Reply-To: <6ab178e6-2fde-e681-cff2-834f132562a6@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 14:02:04 -0400
Message-ID: <CAFn=p-aFoHTh+qN0vJ4KoSTTBDLFry3oQSynrvX=kmJna+U_cw@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] iotests/297: split test into sub-cases
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000003976d05cf4547db"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--00000000000003976d05cf4547db
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 6:29 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 19.10.21 16:49, John Snow wrote:
> > Take iotest 297's main() test function and split it into two sub-cases
> > that can be skipped individually. We can also drop custom environment
> > setup from the pylint test as it isn't needed.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/297 | 63 ++++++++++++++++++++++++++----------------
> >   1 file changed, 39 insertions(+), 24 deletions(-)
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
> (while heavily scratching myself to ease the itch to turn this into a
> unit test now)
>
>
(I strongly considered it, but didn't want to add yet-more-rewrites into
this series. If the ultimate fate is to sunset this particular iotest, I
didn't see a big benefit to doing it.)

--00000000000003976d05cf4547db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 6:29 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 19.10.2=
1 16:49, John Snow wrote:<br>
&gt; Take iotest 297&#39;s main() test function and split it into two sub-c=
ases<br>
&gt; that can be skipped individually. We can also drop custom environment<=
br>
&gt; setup from the pylint test as it isn&#39;t needed.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 63 ++++++++++++++++++++++++++----=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 39 insertions(+), 24 deletions(-)<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br>
(while heavily scratching myself to ease the itch to turn this into a <br>
unit test now)<br>
<br></blockquote><div><br></div><div>(I strongly considered it, but didn&#3=
9;t want to add yet-more-rewrites into this series. If the ultimate fate is=
 to sunset this particular iotest, I didn&#39;t see a big benefit to doing =
it.)<br></div></div></div>

--00000000000003976d05cf4547db--


