Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A236562FC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 15:03:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9o4J-00071P-RD; Mon, 26 Dec 2022 09:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p9o4H-00071A-1s
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 09:03:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p9o4F-0007Tb-GO
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 09:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672063382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n1uggNHteCn2Vc3YNETJXVLrnkJpJ4LxVqZ16PH/KNo=;
 b=LRNP32FwCD0ChHZF2yjDyLDuL8QxMg5a+Wpca2bmy7FiOlMQW+nHjXzKiLJ8zNLi5miFJP
 wUrMi+QdjA3YjiNqqgQtY15FyBfzOSs35HjWcRmcMA96gzT0JIsRtl0xzTwY1Xhn3hSX4U
 h/boedJYOHbqIWT6KPAa9yvnl6MdmKE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-itOoyaKGNrW4D-ojZa5h5w-1; Mon, 26 Dec 2022 09:03:00 -0500
X-MC-Unique: itOoyaKGNrW4D-ojZa5h5w-1
Received: by mail-vs1-f69.google.com with SMTP id
 j68-20020a676e47000000b003c860388b23so664458vsc.3
 for <qemu-devel@nongnu.org>; Mon, 26 Dec 2022 06:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n1uggNHteCn2Vc3YNETJXVLrnkJpJ4LxVqZ16PH/KNo=;
 b=0HB97uniY1JbqR9Mc//msSQWyNvO6Py/v+ETt3RDHr2nsENkcs4uOcVp9WwhHSFCoE
 pKVUQkoo8PUi1E6TMBzLcBVepF/0GAq5cxA6/JdcufgnvSwXSP/jlHH+f0v6yu6r2Zvr
 v5zksiP70+WUfZUHS4B57YnEA/eNMFBZgkdFbE6qQEcm1cEOylfdn/CRgJJwd/K8NAxr
 9I4hHsUfIWwPJMnkjL4M04JhdZtup1vo/1BSESbIjNRMYlbFaqC36KPQSF1pRQVB3Ya3
 jPfvamdnp9Xi406dzNf9m7KVxvMd8oaApkoU9Bg5Zi1WrxBTQD3pwnEi9eJF6LZa3JLB
 pDzg==
X-Gm-Message-State: AFqh2kpUJeTCRTzT++BWSv0eY67dKMw5GYvG+6cdAoFZAf46iJuFeyuP
 quRRUFkRPEbSZf2k4j2lrHFTqzrF1IV4NZ7h00ivk8HkVHDh3aTgtWZg8zki5MjeLeVRjTsrFg8
 H1lV3SJdIbDQZXXlz1HW3IVpZhkbbr2o=
X-Received: by 2002:a67:fc8c:0:b0:3c6:68cd:6483 with SMTP id
 x12-20020a67fc8c000000b003c668cd6483mr694422vsp.1.1672063380191; 
 Mon, 26 Dec 2022 06:03:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsTD0S4vdNlAwN6pFrFGzh3RIYVzUOFSyRToaK0Ei+/bf3fXuDhpjVSGYoiRG6Q5JvwhgRX3xHPf2QFEYAtPeg=
X-Received: by 2002:a67:fc8c:0:b0:3c6:68cd:6483 with SMTP id
 x12-20020a67fc8c000000b003c668cd6483mr694416vsp.1.1672063380022; Mon, 26 Dec
 2022 06:03:00 -0800 (PST)
MIME-Version: 1.0
References: <Y2+GO5jyd9E2uCT9@humpty.home.comstyle.com>
 <56ef5603-523f-f180-55e4-12c9a0b4d02a@linaro.org>
 <CAPMcbCoB_k0Qp2haWqU8j4fmmCnE+_b4T6hoK3+NpaOcHZO0Gg@mail.gmail.com>
In-Reply-To: <CAPMcbCoB_k0Qp2haWqU8j4fmmCnE+_b4T6hoK3+NpaOcHZO0Gg@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 26 Dec 2022 16:02:49 +0200
Message-ID: <CAPMcbCoC5Jrq3BGyZGo3uLSEj86QrACjmhQxY_HaWaWoq3sEeQ@mail.gmail.com>
Subject: Re: [PATCH] qga: Add initial OpenBSD and NetBSD support
To: Brad Smith <brad@comstyle.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000cefa1705f0bb978a"
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

--000000000000cefa1705f0bb978a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

the series was merged

Best Regards,
Konstantin Kostiuk.


On Thu, Nov 17, 2022 at 10:50 AM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>
> On Sun, Nov 13, 2022 at 9:32 PM Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org>
> wrote:
>
>> On 12/11/22 12:40, Brad Smith wrote:
>> > qga: Add initial OpenBSD and NetBSD support
>> >
>> > Signed-off-by: Brad Smith <brad@comstyle.com>
>> > ---
>> >   meson.build          | 2 +-
>> >   qga/commands-bsd.c   | 5 +++++
>> >   qga/commands-posix.c | 9 +++++++--
>> >   qga/main.c           | 6 +++---
>> >   4 files changed, 16 insertions(+), 6 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>
>>

--000000000000cefa1705f0bb978a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>the series was merged</div><div><br></div><div><div d=
ir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div><=
/div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 17, 2022 at 10:50 AM Konstantin Kostiuk &lt;<a =
href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Rev=
iewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com" tar=
get=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 13, 2022 at 9:32 PM P=
hilippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" target=
=3D"_blank">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On 12/11/22 12:40, Brad Smith wrote:<br>
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
</blockquote></div>

--000000000000cefa1705f0bb978a--


