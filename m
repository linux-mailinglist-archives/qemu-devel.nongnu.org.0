Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C862D57E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:51:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovabt-0007Re-QU; Thu, 17 Nov 2022 03:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ovabo-0007Na-RI
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:50:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ovabm-000717-V9
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668675054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uGAqkRbFTm5xDxvIpk7B+EXXyQgoarzNy7MU2Bb6Yfw=;
 b=A/ALU3hzjbcpG4+wtGIse2YUHIXpxFdOaFdHF9kfQZCRVp+bNj6+bzvL/UQc8IZjODham2
 vZxaaUJVVtnJLa13HE7OnsGI1H+O5fyNwV5D+bHr7pscIFDN0cX29kvpwuO7urYoCN3mNS
 Vs5a1X6oIZcrEHui2CTYKbRIkO75Qmw=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-I7c13IR3MnGzujwP3pwTSg-1; Thu, 17 Nov 2022 03:50:52 -0500
X-MC-Unique: I7c13IR3MnGzujwP3pwTSg-1
Received: by mail-il1-f198.google.com with SMTP id
 13-20020a056e0216cd00b003023e8b7d03so850338ilx.7
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 00:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uGAqkRbFTm5xDxvIpk7B+EXXyQgoarzNy7MU2Bb6Yfw=;
 b=xNnstueScSkwdlcWn34XDl+3A0OXqRAzlptwO+bsVHoKkwMMzsAOxT/nZXQFTdlrFl
 Xfk2IGRVmoXE6GTB9C9b4fjwndw5bsi/YIHPe42B5CvOT5oXM1SmpqIXDtF79pauJL/Y
 wpP2s6gxiwfAgCqQoOecosXTchxhiV3jDvHtFsNDPkDnSEvGcihC/gorZhKmekCH59wR
 /0OXiWu5UV08ihDWQJ9tiV/89vFqdxp84GOf8kWaZzlYZIs3qJ77oSMfAsmJVCjXfU8x
 6gcxLtEASCaYWSQSPXpa59sx82zcdGQuxg8m/qhzC1fj3u4pMFOj2NnoViYtS2G43VGj
 z49w==
X-Gm-Message-State: ANoB5pmFnV/hETh123xsfYHI6/fopBg7ax2rhISb/LwUylKdoFltM7ak
 trm5ZUaemHWMbu8duQizoL6uGd08bARhuLct44SXNJZfX7MtPNrrH06WXSCO8mUzpU6q4X16uvM
 ILxjGXVEb/h+HoJw899rwrOI/WUU7aPY=
X-Received: by 2002:a02:3b2b:0:b0:375:9edc:532d with SMTP id
 c43-20020a023b2b000000b003759edc532dmr617276jaa.13.1668675051719; 
 Thu, 17 Nov 2022 00:50:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JlmtzgZCRjYfj4sRY5pO7gGFALdTeYNt5vtQfAE7Dt6WBKTaALlyZ5WwCwpbLD+ayIGbLBmRQM+Les7c3EJ0=
X-Received: by 2002:a02:3b2b:0:b0:375:9edc:532d with SMTP id
 c43-20020a023b2b000000b003759edc532dmr617269jaa.13.1668675051447; Thu, 17 Nov
 2022 00:50:51 -0800 (PST)
MIME-Version: 1.0
References: <Y2+GO5jyd9E2uCT9@humpty.home.comstyle.com>
 <56ef5603-523f-f180-55e4-12c9a0b4d02a@linaro.org>
In-Reply-To: <56ef5603-523f-f180-55e4-12c9a0b4d02a@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 17 Nov 2022 10:50:40 +0200
Message-ID: <CAPMcbCoB_k0Qp2haWqU8j4fmmCnE+_b4T6hoK3+NpaOcHZO0Gg@mail.gmail.com>
Subject: Re: [PATCH] qga: Add initial OpenBSD and NetBSD support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Brad Smith <brad@comstyle.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000affe2e05eda6af0c"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000affe2e05eda6af0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Sun, Nov 13, 2022 at 9:32 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> On 12/11/22 12:40, Brad Smith wrote:
> > qga: Add initial OpenBSD and NetBSD support
> >
> > Signed-off-by: Brad Smith <brad@comstyle.com>
> > ---
> >   meson.build          | 2 +-
> >   qga/commands-bsd.c   | 5 +++++
> >   qga/commands-posix.c | 9 +++++++--
> >   qga/main.c           | 6 +++---
> >   4 files changed, 16 insertions(+), 6 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>

--000000000000affe2e05eda6af0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 1=
3, 2022 at 9:32 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd=
@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On 12/11/22 12:40, Brad Smith wrote:<br>
&gt; qga: Add initial OpenBSD and NetBSD support<br>
&gt; <br>
&gt; Signed-off-by: Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com" tar=
get=3D"_blank">brad@comstyle.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0qga/commands-bsd.c=C2=A0 =C2=A0| 5 +++++<br>
&gt;=C2=A0 =C2=A0qga/commands-posix.c | 9 +++++++--<br>
&gt;=C2=A0 =C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++=
---<br>
&gt;=C2=A0 =C2=A04 files changed, 16 insertions(+), 6 deletions(-)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
<br>
</blockquote></div>

--000000000000affe2e05eda6af0c--


