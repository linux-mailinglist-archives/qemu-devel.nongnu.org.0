Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54AE3171CC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 21:57:53 +0100 (CET)
Received: from localhost ([::1]:35514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wYa-0004wG-UL
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 15:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9wWe-0003zX-OF
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 15:55:52 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9wWY-00068w-OF
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 15:55:50 -0500
Received: by mail-lj1-x22c.google.com with SMTP id e18so4665645lja.12
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 12:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s1lGjsNfUq9Ohq2/mS4GFN1kqv3VrP0aJyYgwP7pWSk=;
 b=HiUqUQI3451kc+mpETpUuESRGvp2Qe+106bk1NN0X2w44+y3t+a2z4bI88orjoA2hV
 BhqZ7n20kyl2jFtjAMjHUGMgVjOWdzHZeI50kTvf/zAUP4JUkBIvrrG2UwElfE0Md6i/
 YxdAu3vDxppeuRy7lkugNYaN+6nOtXXRO9v/yl7uH3LSgvzgYvT/MEOqKLa8wOVAh23+
 jgno2w6EOFXC5NDAOdoRyAsbPdA7BLbz5uGAJPV6wCzNH78oI1+RP1KckN1tpX9BtfDu
 B/8Q6xlwy/fe3XVcibHN1c90WGccRXJcHZku9d23/WdOkIcgx1cO1PGb/5VLvzOBCtCO
 lTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s1lGjsNfUq9Ohq2/mS4GFN1kqv3VrP0aJyYgwP7pWSk=;
 b=nAsj5mT4QOzmgNeqZaM2qRIRADeUEXQizaOSqQprPy08i5w+Dn0Prih8yOPunnVElf
 zLbgY8amKTQ5+0vZqbwhY9Mpc7IorQvXvCzfQyOeCNPG9sv18OPxtzgpaJO9Vknr11U0
 7PM5iPzCNxf+JjG3yIGU17P/6lSFA8N6f2TKI11+UsibqMr4I4YG1Idgg4hrQuqeFy5e
 5x/SVSOLtK4h7isNHfzKasYpDnNqMh2YBs4IOzGoYI3/eqJ3L0cm5IwmqBYnlLUsNHqj
 EsmidyCMlhjotdYabX3e/DUHvb1r5/9GE5xJAuVsgJ7SZIdHxQDlgS9mRVEsv58yWfbn
 9JjQ==
X-Gm-Message-State: AOAM533PoDPrzGh65HpPqcgPTHiGQzOxv7kl6u9Rb3S2HP+mmM6qP3Dj
 W6OZ+kR1/T3or1z9Xmt3UzvH15+YUQ8yVTabL84q6A==
X-Google-Smtp-Source: ABdhPJwDtLl2urDuPAXsZ4h0M76dxTARjXRyi+h0xMGIr0xfAzFMf0yEVl1di5fOP7KVrrv6Ufk9e/BQgm4PyjPrfbk=
X-Received: by 2002:a2e:b605:: with SMTP id r5mr2890285ljn.367.1612990544755; 
 Wed, 10 Feb 2021 12:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-3-peter.maydell@linaro.org>
In-Reply-To: <20210209132040.5091-3-peter.maydell@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 10 Feb 2021 12:55:32 -0800
Message-ID: <CAGcCb11DCYZHsWCubfr6iRD85h-h4bZJvN3h4tFgUOa1S66MVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clock: Add ClockPreUpdate callback event type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: multipart/alternative; boundary="000000000000727b1a05bb01a0db"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x22c.google.com
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

--000000000000727b1a05bb01a0db
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 5:21 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Add a new callback event type ClockPreUpdate, which is called on
> period changes before the period is updated.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  docs/devel/clocks.rst | 9 ++++++++-
>  include/hw/clock.h    | 1 +
>  hw/core/clock.c       | 3 +++
>  3 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index cd344e3fe5d..f0391e76b4f 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -181,7 +181,14 @@ events.
>
>  The events currently supported are:
>
> - * ``ClockUpdate`` : called after the input clock's period has changed
> + * ``ClockPreUpdate`` : called when the input clock's period is about to
> +   update. This is useful if the device needs to do some action for
> +   which it needs to know the old value of the clock period. During
> +   this callback, Clock API functions like ``clock_get()`` or
> +   ``clock_ticks_to_ns()`` will use the old period.
> + * ``ClockUpdate`` : called after the input clock's period has changed.
> +   During this callback, Clock API functions like ``clock_ticks_to_ns()``
> +   will use the new period.
>
>  Note that a clock only has one callback: it is not possible to register
>  different functions for different events. You must register a single
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index 5c73b4e7ae9..d7a6673c29e 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -30,6 +30,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
>   */
>  typedef enum ClockEvent {
>      ClockUpdate = 1, /* Clock period has just updated */
> +    ClockPreUpdate = 2, /* Clock period is about to update */
>  } ClockEvent;
>
>  typedef void ClockCallback(void *opaque, ClockEvent event);
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index 71dc1f4de65..2c86091d8a3 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -80,6 +80,9 @@ static void clock_propagate_period(Clock *clk, bool
> call_callbacks)
>
>      QLIST_FOREACH(child, &clk->children, sibling) {
>          if (child->period != clk->period) {
> +            if (call_callbacks) {
> +                clock_call_callback(child, ClockPreUpdate);
> +            }
>              child->period = clk->period;
>              trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
>                                 CLOCK_PERIOD_TO_HZ(clk->period),
> --
> 2.20.1
>
>
>

--000000000000727b1a05bb01a0db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 9, 2021 at 5:21 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Add a new callback event type ClockPreUpdate, which is called on<br>
period changes before the period is updated.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div>R=
eviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@goog=
le.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
---<br>
=C2=A0docs/devel/clocks.rst | 9 ++++++++-<br>
=C2=A0include/hw/clock.h=C2=A0 =C2=A0 | 1 +<br>
=C2=A0hw/core/clock.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
=C2=A03 files changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst<br>
index cd344e3fe5d..f0391e76b4f 100644<br>
--- a/docs/devel/clocks.rst<br>
+++ b/docs/devel/clocks.rst<br>
@@ -181,7 +181,14 @@ events.<br>
<br>
=C2=A0The events currently supported are:<br>
<br>
- * ``ClockUpdate`` : called after the input clock&#39;s period has changed=
<br>
+ * ``ClockPreUpdate`` : called when the input clock&#39;s period is about =
to<br>
+=C2=A0 =C2=A0update. This is useful if the device needs to do some action =
for<br>
+=C2=A0 =C2=A0which it needs to know the old value of the clock period. Dur=
ing<br>
+=C2=A0 =C2=A0this callback, Clock API functions like ``clock_get()`` or<br=
>
+=C2=A0 =C2=A0``clock_ticks_to_ns()`` will use the old period.<br>
+ * ``ClockUpdate`` : called after the input clock&#39;s period has changed=
.<br>
+=C2=A0 =C2=A0During this callback, Clock API functions like ``clock_ticks_=
to_ns()``<br>
+=C2=A0 =C2=A0will use the new period.<br>
<br>
=C2=A0Note that a clock only has one callback: it is not possible to regist=
er<br>
=C2=A0different functions for different events. You must register a single<=
br>
diff --git a/include/hw/clock.h b/include/hw/clock.h<br>
index 5c73b4e7ae9..d7a6673c29e 100644<br>
--- a/include/hw/clock.h<br>
+++ b/include/hw/clock.h<br>
@@ -30,6 +30,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)<br>
=C2=A0 */<br>
=C2=A0typedef enum ClockEvent {<br>
=C2=A0 =C2=A0 =C2=A0ClockUpdate =3D 1, /* Clock period has just updated */<=
br>
+=C2=A0 =C2=A0 ClockPreUpdate =3D 2, /* Clock period is about to update */<=
br>
=C2=A0} ClockEvent;<br>
<br>
=C2=A0typedef void ClockCallback(void *opaque, ClockEvent event);<br>
diff --git a/hw/core/clock.c b/hw/core/clock.c<br>
index 71dc1f4de65..2c86091d8a3 100644<br>
--- a/hw/core/clock.c<br>
+++ b/hw/core/clock.c<br>
@@ -80,6 +80,9 @@ static void clock_propagate_period(Clock *clk, bool call_=
callbacks)<br>
<br>
=C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(child, &amp;clk-&gt;children, sibling) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (child-&gt;period !=3D clk-&gt;period)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (call_callbacks) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock_call_callbac=
k(child, ClockPreUpdate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0child-&gt;period =3D clk-&g=
t;period;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_clock_update(CLOCK_PA=
TH(child), CLOCK_PATH(clk),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CLOCK_PERIOD_TO_HZ(clk-&gt;period),<=
br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000727b1a05bb01a0db--

