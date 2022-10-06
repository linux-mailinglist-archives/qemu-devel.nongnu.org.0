Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E4B5F6D7A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:27:18 +0200 (CEST)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVaX-0005CQ-68
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ogV8q-0001rc-J2
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:58:40 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ogV8o-0005yB-Pg
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:58:40 -0400
Received: by mail-ua1-x92b.google.com with SMTP id i16so905800uak.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 10:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a6ks7FKghLJ/QYC3Tjj12iBjlkjw4UZPqDT9HiqIpVQ=;
 b=q9/mrE8ThEhUsgYRvfRpwEmGqQ20ekC+HR7S6w8iI/sZlVd34BCcqnxPoPo8WNpEkD
 6vCTdSi81t8JdTlVZZKGvWKfspdzGbnjA0Sh4dmkHx1AxVfm/XTAywsHSKkzTbHFnPrD
 shZ2JIOw5Xux4bgSkYeaA46sjy30ZOFO7Vnwyi7izKmOQcogiERwZ8PNIJptHr9tVacz
 7eDEhq9n04VZpv0smJL0iFiSUwtJK4nd7/Izm04RqSyiYRaOutA06Nr2LC4z/wmGIU/V
 gn6foPMTVtjvyXZ/LhyMDisQkh8JvkiqOEEvftN/glWn+D5d1fwqeeQus2v0MVDurHsD
 RQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6ks7FKghLJ/QYC3Tjj12iBjlkjw4UZPqDT9HiqIpVQ=;
 b=rqKCCq5IhHdL23C/JUjrQEWeefifFq+6JbO8U3DH04vdNgXhpuux+zffiSuX+fHSlU
 1cZyFGf1VcbHj3hPBrdzmnwk1myPw6iEbbQkueBMPmQQlIMd0WLWprHqeVFdbP2GoeUS
 VAUkD1Cw8oZPoA1xcJhwlITJ0pWuwfXdcLVVWbv8SOhzBm3bQRv09K5rMZQFCsffVUrI
 OWwmBph+wvXydf6j378ayI9wqAdt5QWtjIs7cZIaqu6m05gb5opXH5MM+Gd08s3WdUDO
 fVC8Slndv1BQb0YXnRG8OYTAZc2jLndW1NwqLEC0W7WDmxuaY95iMC5yogVrmse0tyuz
 l+KQ==
X-Gm-Message-State: ACrzQf0z1v4JtienOwFq7XLuTMISow12kX1jU1oEAB4ZbRlXdmkR3OhF
 XfTL16ki53Y1NA5UFwqGbOf0giUHN5DNCz+upUCv/Q==
X-Google-Smtp-Source: AMsMyM5wvAuifSCYX1Tg4cmS4FOgG7PtIAiDD6KsOuFRMtgCWugdr5QHD7JPC/d7voCI/bDewJyv/nPbo8qOVUcZKQc=
X-Received: by 2002:ab0:7509:0:b0:3d6:9dcb:b3db with SMTP id
 m9-20020ab07509000000b003d69dcbb3dbmr851767uap.9.1665079116839; Thu, 06 Oct
 2022 10:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163138.2831353-1-venture@google.com>
 <98b23697-00ec-2952-31c1-258419bd5440@redhat.com>
 <CAO=notzNRHaJvqnBx34qN0ovvwiwXNPRt73VnWqxyYhvnZMXnA@mail.gmail.com>
 <eccfd9bd-2900-f437-778c-74a8052fc045@redhat.com>
In-Reply-To: <eccfd9bd-2900-f437-778c-74a8052fc045@redhat.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 6 Oct 2022 10:58:26 -0700
Message-ID: <CAO=notzEJer6rfBxqGrHdzw9S+bHCQ1jcW0WYBdP3G1nuHJ8nQ@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: npcm7xx-emc-test: Skip checking MAC
To: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="00000000000048a79205ea617118"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=venture@google.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000048a79205ea617118
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 20, 2022 at 12:00 AM Thomas Huth <thuth@redhat.com> wrote:

> On 20/09/2022 00.37, Patrick Venture wrote:
> >
> >
> > On Mon, Sep 19, 2022 at 5:44 AM Thomas Huth <thuth@redhat.com
> > <mailto:thuth@redhat.com>> wrote:
> >
> >     On 06/09/2022 18.31, Patrick Venture wrote:
> >      > The register tests walks all the registers to verify they are
> initially
> >      > 0 when appropriate.  However, if the MAC address is set in the
> register
> >      >    space, this should not be checked against 0.
> >      >
> >      > Reviewed-by: Hao Wu <wuhaotsh@google.com <mailto:
> wuhaotsh@google.com>>
> >      > Change-Id: I02426e39bdab33ceedd42c49d233e8680d4ec058
> >
> >     What's that change-id good for?
> >
> >
> > Oops, sorry about that.  I can send out a v2 without it, or during
> > application someone can nicely trim it? :)
>
> I can take the patch through my qtest branch - I'll drop the line there.
>
> >     Basically ack, but one question: Where should that non-zero MAC
> address
> >     come
> >     from / when did you hit a problem here? If QEMU is started without
> any mac
> >     settings at all (like it is done here), the register never contains a
> >     non-zero value, does it?
> >
> >
> > So, there's a bug in the emc device presently where that value isn't set
> > when it should be.  I have that bug fixed, but for whatever reason,
> probably
> > not enough caffeine, I didn't bundle the two patches together.
>
> OK, makes sense now, thanks for the explanation!
>

The follow-on patch was just applied to arm.next, so I wanted to check if
this was applied to your .next or if you wanted a v2.


>
>   Thomas
>
>
>

--00000000000048a79205ea617118
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 12:00 AM Thom=
as Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 20/09/20=
22 00.37, Patrick Venture wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Sep 19, 2022 at 5:44 AM Thomas Huth &lt;<a href=3D"mailto:thut=
h@redhat.com" target=3D"_blank">thuth@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 06/09/2022 18.31, Patrick Venture wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The register tests walks all the registers to=
 verify they are initially<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 0 when appropriate.=C2=A0 However, if the MAC=
 address is set in the register<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 space, this should not be checke=
d against 0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuh=
aotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a> &lt;mailto:<a h=
ref=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a=
>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Change-Id: I02426e39bdab33ceedd42c49d233e8680=
d4ec058<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What&#39;s that change-id good for?<br>
&gt; <br>
&gt; <br>
&gt; Oops, sorry about that.=C2=A0 I can send out a v2 without it, or durin=
g <br>
&gt; application someone can nicely trim it? :)<br>
<br>
I can take the patch through my qtest branch - I&#39;ll drop the line there=
.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Basically ack, but one question: Where should that =
non-zero MAC address<br>
&gt;=C2=A0 =C2=A0 =C2=A0come<br>
&gt;=C2=A0 =C2=A0 =C2=A0from / when did you hit a problem here? If QEMU is =
started without any mac<br>
&gt;=C2=A0 =C2=A0 =C2=A0settings at all (like it is done here), the registe=
r never contains a<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-zero value, does it?<br>
&gt; <br>
&gt; <br>
&gt; So, there&#39;s a bug in the emc device presently where that value isn=
&#39;t set <br>
&gt; when it should be.=C2=A0 I have that bug fixed, but for whatever reaso=
n, probably <br>
&gt; not enough caffeine, I didn&#39;t bundle the two patches together.<br>
<br>
OK, makes sense now, thanks for the explanation!<br></blockquote><div><br><=
/div><div>The follow-on patch was just applied to arm.next, so I wanted to =
check if this was applied to your .next or if you wanted a v2.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 Thomas<br>
<br>
<br>
</blockquote></div></div>

--00000000000048a79205ea617118--

