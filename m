Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F456A0BAA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:16:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVCOH-00022S-20; Thu, 23 Feb 2023 09:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pVCOE-00021K-9R
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:16:06 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pVCO9-0002SV-Q3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:16:05 -0500
Received: by mail-ed1-x52c.google.com with SMTP id d30so1371710eda.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 06:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cYpOEKlOTi57RDzpmH/9j0f9Gk6yzLH8G2W/0dl9fV4=;
 b=0eGny9F3U0FqI/TymAhgHfgy22/iz5Xzryn3rg8emYfA8Ww6mz1wOaWINHRjx9c7Q+
 /ZPXgVDAtWzV58Gkpy53+gSm8Vqx+AfrfN5JuQ0tdNWHmP9SblU5KcOjISJzV+Dhg+Wz
 1cGxq14YbOXPFwyAUCdZl4wquiGTuoVSkPKVbRkTMM8IXQpp7n0JwkuVQdDwiLXv7pSZ
 A8Ezk/Ue38IOuUdxJT/bfOiCKLqvpICKdYoR76r3Hapu2KN7+N+m1D8cc0+YksMcAN/A
 CDbfLE55R2lnF5ZDtJ6G8Jp8/IKhWhV4syQZ+eq9h9Ub03RZbRgnLilSb6lVWU36+oDn
 5eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cYpOEKlOTi57RDzpmH/9j0f9Gk6yzLH8G2W/0dl9fV4=;
 b=Ri/Hz5eU9jkd1020kTXw56JDZq0tE10YUiKalIm+eJXqhmK8rwNNEcK4nKB3fwmfI6
 Tszm0WUUUwL8yG87sCiJCAF7X5aMEfa9DAH2RgItxxcwpYHGUnHS8XsFsssCD5e9p4aV
 GPhN04PfLjhNNdkgs25aDXwrGCnMpaVlqSAIqmRYpal1LV2wyd+aa4gjfNa8ZNAajf17
 IrpnqJ1Bdxo2MV7wRoFxtSSqbg4onPOuvKjVKt4wXMGDjM/MRh62+GlG9cczD8HBykAb
 dVJsiqmC/6gWUFngeHpb6eXtUKY7+7sVNPFE8Imec9KP6ow8VQaDVGHN/BdAec21iaoJ
 hQLQ==
X-Gm-Message-State: AO0yUKV1YPQRKFS87SYbkqAccuilIc2d1HoelpCFU9CK3X1aC4QBhZ5U
 NLjihCTfZMCHjCwjlq9pCuVKBCk/XeIEn/C7NcLPjQ==
X-Google-Smtp-Source: AK7set8AXDG9wXxDcIMO8u1muqzw08fXGOtJ+5xje+qRQvKY3WSRq4EiB0xfWC+drDnLkArN5NXUuwtLaKtZONMCG34=
X-Received: by 2002:a50:aa9e:0:b0:4ac:bb4e:c38c with SMTP id
 q30-20020a50aa9e000000b004acbb4ec38cmr5660231edc.0.1677161759253; Thu, 23 Feb
 2023 06:15:59 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <3e1f9f5f-c4ec-d13d-7f88-df741a63f747@redhat.com>
In-Reply-To: <3e1f9f5f-c4ec-d13d-7f88-df741a63f747@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 23 Feb 2023 07:15:47 -0700
Message-ID: <CANCZdfr8Cm4d-Z64tqO92-ThZzq4YyLhhfbqC4tn5qkGc5sA7w@mail.gmail.com>
Subject: Re: out of CI pipeline minutes again
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e4394105f55ea648"
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--000000000000e4394105f55ea648
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 23, 2023, 6:48 AM Thomas Huth <thuth@redhat.com> wrote:

> On 23/02/2023 13.56, Peter Maydell wrote:
> > Hi; the project is out of gitlab CI pipeline minutes again.
> > In the absence of any other proposals, no more pull request
> > merges will happen til 1st March...
>
> I'd like to propose again to send a link along with the pull request that
> shows that the shared runners are all green in the fork of the requester.
> You'd only need to check the custom runners in that case, which hopefully
> still work fine without CI minutes?
>
> It's definitely more cumbersome, but maybe better than queuing dozens of
> pull requests right in front of the soft freeze?
>

Yea. I'm just getting done with my pull request and it's really
demotivating to be done early and miss the boat...

I'm happy to do this because it's what I do anyway before sending a pull...

Warner

  Thomas
>
>
>

--000000000000e4394105f55ea648
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 23, 2023, 6:48 AM Thomas Huth &lt;<a href=
=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On 23/02/2023 13.56, Peter Maydell wrote:<br>
&gt; Hi; the project is out of gitlab CI pipeline minutes again.<br>
&gt; In the absence of any other proposals, no more pull request<br>
&gt; merges will happen til 1st March...<br>
<br>
I&#39;d like to propose again to send a link along with the pull request th=
at <br>
shows that the shared runners are all green in the fork of the requester. <=
br>
You&#39;d only need to check the custom runners in that case, which hopeful=
ly <br>
still work fine without CI minutes?<br>
<br>
It&#39;s definitely more cumbersome, but maybe better than queuing dozens o=
f <br>
pull requests right in front of the soft freeze?<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Yea. I&#39;m just getting d=
one with my pull request and it&#39;s really demotivating to be done early =
and miss the boat...</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#=
39;m happy to do this because it&#39;s what I do anyway before sending a pu=
ll...</div><div dir=3D"auto"><br></div><div dir=3D"auto">Warner</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
=C2=A0 Thomas<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000e4394105f55ea648--

