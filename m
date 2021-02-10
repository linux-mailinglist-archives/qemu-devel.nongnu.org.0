Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B73171E0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:04:31 +0100 (CET)
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wf0-0000rM-9p
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9wcX-0007qe-4G
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:01:57 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9wcU-0000Bt-85
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:01:56 -0500
Received: by mail-lf1-x12b.google.com with SMTP id v5so4912151lft.13
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=amtVS7l7NbwZ9IjdImObmKALHgxhHcQORNOomhwQFRk=;
 b=dDLcZyCHKxu6bJ7p4IPTYAD6EF2h/8p6cd4t52q34qb8ZpmAgCMjA8c9YfW2kcot+N
 Iq2m+tWtV1E9iW2cRm8PBmb2agF3f7oDuvxrJCsBAORE2LVsm0EMQWZEWh8m364EacoR
 XK9177VQIClBGLdR3M6vCEfdwN0wgeIKZz+kyqFVYq6n+Xqno6lfLzT5dHfqjzNw2Ht+
 XIM4eDmsDiH25RCHmA26EduwO/KPPJ3ceapXhwGtxajQs1Z9l9aLskFcHXYMsK0z86Gn
 LaQrBG968p7AHAu/We2I1YdmXrARBJA1OgomGN34bMXQ15+0+7cqSnrnTDc7g6jSDBMt
 Q0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=amtVS7l7NbwZ9IjdImObmKALHgxhHcQORNOomhwQFRk=;
 b=VqF3pRxfFxykWozuFQWpnf7p9g1CfAxuuA7XSr1at08PzaILIykvW56laEZri7gvhr
 IAri6+bWB6Eqg5Hvwb6kz065nzDRy0XJvoiCL98JMfqXeyWfBpr8n9vs9ven3GgRKlpl
 sPIZrEmSFEal6Gwtygr10iMkWnZXBheLxyG58/7n/0kTjuEahvEYM0w+cIdLk1JQA9hl
 6x93Wk+6ylIJQ/ZabLGBcsRdxLPg2XWt/p91xM8KlIyP9XqE62nWGdqC0xa+4IbfsJ7d
 MdiTv5qq+Rb1ZrnQftMI1q8iwWCBtHhwy1YQT9slG147j5pyi4oELo2kclelS2myedER
 TTHQ==
X-Gm-Message-State: AOAM530oGCJPvTXgO5/Dq9mEgtbTj9w2obH7baZTuxh/vIWMJNHlh1Ek
 LaenYpkjB7NZGOeqxLB72dhbO8N4kF1XUksJuwjTiQ==
X-Google-Smtp-Source: ABdhPJyDUDkNZSXvzrlEG3+VCJbv0DQMg9r4zX0xElIHYhOgcMgg/2+xwHMaW84pMqQXY0mGideQY/O+BxZC4XC8NvU=
X-Received: by 2002:ac2:434d:: with SMTP id o13mr2617865lfl.410.1612990912379; 
 Wed, 10 Feb 2021 13:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-5-peter.maydell@linaro.org>
In-Reply-To: <20210209132040.5091-5-peter.maydell@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 10 Feb 2021 13:01:39 -0800
Message-ID: <CAGcCb10GVgiY+cNAvbmuZTbP5W00gGm1F0cJ3oTFcPOiYRS+3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: multipart/alternative; boundary="0000000000005c05fa05bb01b67e"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12b.google.com
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

--0000000000005c05fa05bb01b67e
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 5:21 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Use the new clock_ns_to_ticks() function in npcm7xx_timer where
> appropriate.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

Thanks!

> ---
>  hw/timer/npcm7xx_timer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
> index 4efdf135b82..32f5e021f85 100644
> --- a/hw/timer/npcm7xx_timer.c
> +++ b/hw/timer/npcm7xx_timer.c
> @@ -138,8 +138,8 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer
> *t, uint32_t count)
>  /* Convert a time interval in nanoseconds to a timer cycle count. */
>  static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
>  {
> -    return ns / clock_ticks_to_ns(t->ctrl->clock,
> -                                  npcm7xx_tcsr_prescaler(t->tcsr));
> +    return clock_ns_to_ticks(t->ctrl->clock, ns) /
> +        npcm7xx_tcsr_prescaler(t->tcsr);
>  }
>
>  static uint32_t npcm7xx_watchdog_timer_prescaler(const
> NPCM7xxWatchdogTimer *t)
> --
> 2.20.1
>
>
>

--0000000000005c05fa05bb01b67e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 9, 2021 at 5:21 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Use the new clock_ns_to_ticks() function in npcm7xx_timer where<br>
appropriate.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div>R=
eviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@goog=
le.com</a>&gt;</div><div><br></div><div>Thanks!=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/timer/npcm7xx_timer.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c<br>
index 4efdf135b82..32f5e021f85 100644<br>
--- a/hw/timer/npcm7xx_timer.c<br>
+++ b/hw/timer/npcm7xx_timer.c<br>
@@ -138,8 +138,8 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *=
t, uint32_t count)<br>
=C2=A0/* Convert a time interval in nanoseconds to a timer cycle count. */<=
br>
=C2=A0static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns=
)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return ns / clock_ticks_to_ns(t-&gt;ctrl-&gt;clock,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_tcsr_prescaler(t-&gt;=
tcsr));<br>
+=C2=A0 =C2=A0 return clock_ns_to_ticks(t-&gt;ctrl-&gt;clock, ns) /<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_tcsr_prescaler(t-&gt;tcsr);<br>
=C2=A0}<br>
<br>
=C2=A0static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdo=
gTimer *t)<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000005c05fa05bb01b67e--

