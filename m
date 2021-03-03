Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92F632B9B1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:08:59 +0100 (CET)
Received: from localhost ([::1]:58780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVve-0003zN-NS
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lHVuH-0002z8-AT
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:07:33 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:35272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lHVuF-0004G6-RF
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:07:32 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id t23so13081247vsk.2
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vz9VI0kJsppT8wvzSuCajbe5EcFIfMTOk4cC613GJ4Q=;
 b=RDBdGp5GL4L2jUp5LMh1ansS974qclS9Yjde1POK0hWloQofIbPnyq0NqUQIlpLCIs
 EN3ltxhARVEEbt7k3mwV5Ezm8OMo6mOOq+QxH5ho+RvRkSGQS0oU8acwJZp2bCD74naQ
 1YssCBPPX1hWwGA0YB5x26a9Pf6vdly6CFNaS/USP2cnGQ+aF0TIHlvaQxZafyJCGvi1
 L1h0iMu2pi543gh8McPc6YQxpyHoPTMiiXav7FNS0qSY2JK+07B3keVQXGPGoDV4KIo/
 wyC92ebWbYzhYfoMD3xPVLdhTczxtTTlDmsaHnyHoCz8cFtNOxuNxeywNXLRQOc6HJN1
 /hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vz9VI0kJsppT8wvzSuCajbe5EcFIfMTOk4cC613GJ4Q=;
 b=aNdWFFDRrL/cfJlyIXZho3MD/3GKaKrPIs8yjbPW2BTvwPAQPr6NgrJrGA/k00U8P9
 UxQufJgb9lL3xmdTlFAZz5h4Hakyreq55DohLJcPAcI1HB18zgeCBo3n2qxKZH8I52Df
 hm34H5K+zco1EGkrRaprfZx1Pebx1mPVBwR9KyU/eGo6DJdUXijonZHNWtGRWFxh9MSs
 fEnFUmRQdIe5+qlkX5S4347wtc4UHGMYo8jk0YyeOlGwVZx0NSVieS4E+ClDJ3w8WmKw
 yKTS1v+sHlYkB/MSrDmh+Fyfm2nhn+hkHTa1soHka2u56LTTEDUiQq3v9LneFMQM3dyx
 GYTw==
X-Gm-Message-State: AOAM532DNWfTyYRI0uqyTdqEEvYu951uBN63gLqSfo/3DMvO9NGz71OS
 uUzAq3fUBPl9JRn49k5UxfmftFRsFRNoZaH9ezGKXg==
X-Google-Smtp-Source: ABdhPJy/SOwgGvVEpFVwkXC2Z9VJX+7Gyq+8PqSfc6Oz011JAUxz0kZzHUI9Dr7WzgQvvUbfJWSBgSn+qX973XTnvOU=
X-Received: by 2002:a67:1481:: with SMTP id 123mr60455vsu.52.1614794847653;
 Wed, 03 Mar 2021 10:07:27 -0800 (PST)
MIME-Version: 1.0
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com> <20210228213957.xkc4cceh5o6rgd5n@begin>
In-Reply-To: <20210228213957.xkc4cceh5o6rgd5n@begin>
From: Doug Evans <dje@google.com>
Date: Wed, 3 Mar 2021 10:06:50 -0800
Message-ID: <CADPb22RAxehwfRRBdsRm1exU2D38FCcRv23XcS5VKdZfvDp+pQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004803c905bca5b99e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=dje@google.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004803c905bca5b99e
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault <samuel.thibault@gnu.org>
wrote:

> [...]
>
> > +  Examples:
> > +  hostfwd_add net0 tcp:127.0.0.1:10022-:22
> > +  hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22
>
> Yep, that looks good to me.
>
>

Daniel, you wanted me to use inet_parse().
Is the above syntax ok with you?
You must have had some expectation that at least some of
the various flags that inet_parse() recognizes would be needed here.
Can you elaborate?

--0000000000004803c905bca5b99e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault &lt;<a href=
=3D"mailto:samuel.thibault@gnu.org">samuel.thibault@gnu.org</a>&gt; wrote:<=
br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">[.=
..]</span><br>
<br>
&gt; +=C2=A0 Examples:<br>
&gt; +=C2=A0 hostfwd_add net0 tcp:127.0.0.1:10022-:22<br>
&gt; +=C2=A0 hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22<br>
<br>
Yep, that looks good to me.<br><br></blockquote><div><br></div><div><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Daniel, you wante=
d me to use inet_parse().</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Is the above syntax ok with you?</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">You must have had some expectation that at lea=
st some of</div><div class=3D"gmail_default" style=3D"font-size:small">the =
various flags that inet_parse() recognizes would be needed here.</div><div =
class=3D"gmail_default" style=3D"font-size:small">Can you elaborate?</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div></div></div=
>

--0000000000004803c905bca5b99e--

