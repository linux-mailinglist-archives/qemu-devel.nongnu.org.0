Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12653CEAD4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:04:46 +0200 (CEST)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5XdF-00026l-Uu
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1m5Xbr-0000yz-GX
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:03:19 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:43601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1m5Xbp-0002px-4W
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:03:19 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id i4so8825775qvq.10
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AB76IG5dFHv5HhbzUfkuNdv+dsGx/xrfKjtdZtEuMGk=;
 b=vy+h+UC7r3Hj6PUoakoT1uUM6tiPzs9Ni4uEHTnkZIdtJ99ChAZ/jXV0rz+Vhjtmmo
 i6J5jlAUii+sBnqoU7JGOkGtWHaGKJpRpafwTJ1IDLLm76etzI8cwBBYQOuE2Vq3UbpQ
 mB9znpcNUlDlE3uOMWthD5Iv/eYC6LlNUGSmpJrvk0ZZ3GYxlQvXpGmubLU2Ddhs6dVn
 r46nfFZfyHfNPNG0G3FCLzJeSODQWJIrk6zeHfG9Jhu9y+0vbsiLfw+ydt6wmZ89VO2g
 6JkFu0RBISUzpbwfBuOhkScbBnSZ774u2RGPZKmVjr/A6llvFE0XFRTxNMbLPyevpCcm
 keSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AB76IG5dFHv5HhbzUfkuNdv+dsGx/xrfKjtdZtEuMGk=;
 b=DK4mxHkDY78kNzrKcUr40aDcXJOAseakX3jL7xwcoKlLiAe21RRXIeFzvdmcFL4LST
 n+fPje3sb8wQQ4JFgR/UMrMQjsCohMVPGV+MTdYUpfLdUBzgS+hnEamrRllP0nreepG4
 U4mm+M5LQPKqjJ9FUDxkR3y8cg1fAX7K/p6RKY1YU4mmhRtLKwfkGolk4VqUWTKZyNCw
 pl7h1KB3M/LDyj1dF6uOZAEHMPPlYRdMxXJvvTsbPjxTSkFyiY8eKZne1lXyQT9gK0oW
 CHVk4luyInXQaCKeT8EuN81t0tHlirnUxETT4nKHnMqKW77O2ST9efaRp2WsDBLZZikO
 vLdw==
X-Gm-Message-State: AOAM530PItxfNbojKIH/UruHgaywqXA+wAlOcYz+AEQaDHBVjOoU6gXG
 C0pneLpKduDjuGhFg2j3fyiesFo41Ayjr97MkwEJlg==
X-Google-Smtp-Source: ABdhPJyqnE19K3d/eLFlff69V1bxvz+qDveL7BQJcBgDixJWeJTY8cEdYuDBRWgI7zisEpWl/f4jheVmbPayRxqq84k=
X-Received: by 2002:ad4:5ded:: with SMTP id jn13mr24534589qvb.24.1626717795069; 
 Mon, 19 Jul 2021 11:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210719123732.24457-1-alex.bennee@linaro.org>
 <87im16pfsq.fsf@linaro.org>
In-Reply-To: <87im16pfsq.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 19 Jul 2021 12:03:02 -0600
Message-ID: <CANCZdfpsEdupxRPxKt42ki1B0Kckmgu=+m8pXRRFS2J+qDJrTQ@mail.gmail.com>
Subject: Re: [RFC PATCH] tcg/plugins: implement a qemu_plugin_user_exit helper
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005343cd05c77dc001"
Received-SPF: none client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=wlosh@bsdimp.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: minyihh@uci.edu, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, robhenry@microsoft.com,
 Laurent Vivier <laurent@vivier.eu>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Alexandre Iooss <erdnaxe@crans.org>, Chen Qun <kuhn.chenqun@huawei.com>,
 ma.mandourr@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005343cd05c77dc001
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021, 7:57 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
> > In user-mode emulation there is a small race between preexit_cleanup
> > and exit_group() which means we may end up calling instrumented
> > instructions before the kernel reaps child threads. To solve this we
> > implement a new helper which ensures the callbacks are flushed along
> > with any translations before we let the host do it's a thing.
> >
> > While we are at it make the documentation of
> > qemu_plugin_register_atexit_cb clearer as to what the user can expect.
> >
> <snip>
> >
> > +/*
> > + * Handle exit from linux-user. Unlike the normal atexit() mechanism
> > + * we need to handle the clean-up manually as it's possible threads
> > + * are still running. We need to remove all callbacks from code
> > + * generation, flush the current translations and then we can safely
> > + * trigger the exit callbacks.
> > + */
> > +
> > +void qemu_plugin_user_exit(void)
> > +{
> > +    enum qemu_plugin_event ev;
> > +
> > +    QEMU_LOCK_GUARD(&plugin.lock);
> > +
> > +    start_exclusive();
> > +
> > +    /* un-register all callbacks except the final AT_EXIT one */
> > +    for (ev =3D 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
> > +        if (ev !=3D QEMU_PLUGIN_EV_ATEXIT) {
> > +            struct qemu_plugin_ctx *ctx;
> > +            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
> > +                plugin_unregister_cb__locked(ctx, ev);
> > +            }
> > +        }
> > +    }
> > +
> > +    tb_flush(current_cpu);
>
> We also need to disable memory helpers during the exclusive period as
> that is another route into a callback:
> --8<---------------cut here---------------start------------->8---
> modified   plugins/core.c
> @@ -498,6 +499,7 @@ void qemu_plugin_register_atexit_cb(qemu_plugin_id_t
> id,
>  void qemu_plugin_user_exit(void)
>  {
>      enum qemu_plugin_event ev;
> +    CPUState *cpu;
>
>      QEMU_LOCK_GUARD(&plugin.lock);
>
> @@ -514,6 +516,11 @@ void qemu_plugin_user_exit(void)
>      }
>
>      tb_flush(current_cpu);
> +
> +    CPU_FOREACH(cpu) {
> +        qemu_plugin_disable_mem_helpers(cpu);
> +    }
> +
>      end_exclusive();
>
>      /* now it's safe to handle the exit case */
> --8<---------------cut here---------------end--------------->8---
>

I think both of these are find from a bsd-user point of view.

Warner


> > +    end_exclusive();
> > +
> > +    /* now it's safe to handle the exit case */
> > +    qemu_plugin_atexit_cb();
> > +}
> > +
> >  /*
> >   * Call this function after longjmp'ing to the main loop. It's possibl=
e
> that the
> >   * last instruction of a TB might have used helpers, and therefore the
>
>
> --
> Alex Benn=C3=A9e
>

--0000000000005343cd05c77dc001
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jul 19, 2021, 7:57 AM Alex Benn=C3=A9e &lt;<a =
href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_b=
lank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt; writes:<br>
<br>
&gt; In user-mode emulation there is a small race between preexit_cleanup<b=
r>
&gt; and exit_group() which means we may end up calling instrumented<br>
&gt; instructions before the kernel reaps child threads. To solve this we<b=
r>
&gt; implement a new helper which ensures the callbacks are flushed along<b=
r>
&gt; with any translations before we let the host do it&#39;s a thing.<br>
&gt;<br>
&gt; While we are at it make the documentation of<br>
&gt; qemu_plugin_register_atexit_cb clearer as to what the user can expect.=
<br>
&gt;<br>
&lt;snip&gt;<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * Handle exit from linux-user. Unlike the normal atexit() mechanism<=
br>
&gt; + * we need to handle the clean-up manually as it&#39;s possible threa=
ds<br>
&gt; + * are still running. We need to remove all callbacks from code<br>
&gt; + * generation, flush the current translations and then we can safely<=
br>
&gt; + * trigger the exit callbacks.<br>
&gt; + */<br>
&gt; +<br>
&gt; +void qemu_plugin_user_exit(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 enum qemu_plugin_event ev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;plugin.lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 start_exclusive();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* un-register all callbacks except the final AT_EXIT o=
ne */<br>
&gt; +=C2=A0 =C2=A0 for (ev =3D 0; ev &lt; QEMU_PLUGIN_EV_MAX; ev++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ev !=3D QEMU_PLUGIN_EV_ATEXIT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct qemu_plugin_ctx *ctx=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_FOREACH(ctx, &amp;pl=
ugin.ctxs, entry) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 plugin_unregi=
ster_cb__locked(ctx, ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 tb_flush(current_cpu);<br>
<br>
We also need to disable memory helpers during the exclusive period as<br>
that is another route into a callback:<br>
--8&lt;---------------cut here---------------start-------------&gt;8---<br>
modified=C2=A0 =C2=A0plugins/core.c<br>
@@ -498,6 +499,7 @@ void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id=
,<br>
=C2=A0void qemu_plugin_user_exit(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0enum qemu_plugin_event ev;<br>
+=C2=A0 =C2=A0 CPUState *cpu;<br>
<br>
=C2=A0 =C2=A0 =C2=A0QEMU_LOCK_GUARD(&amp;plugin.lock);<br>
<br>
@@ -514,6 +516,11 @@ void qemu_plugin_user_exit(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0tb_flush(current_cpu);<br>
+<br>
+=C2=A0 =C2=A0 CPU_FOREACH(cpu) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_disable_mem_helpers(cpu);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0end_exclusive();<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* now it&#39;s safe to handle the exit case */<br>
--8&lt;---------------cut here---------------end---------------&gt;8---<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I th=
ink both of these are find from a bsd-user point of view.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Warner=C2=A0</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
<br>
&gt; +=C2=A0 =C2=A0 end_exclusive();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* now it&#39;s safe to handle the exit case */<br>
&gt; +=C2=A0 =C2=A0 qemu_plugin_atexit_cb();<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Call this function after longjmp&#39;ing to the main loo=
p. It&#39;s possible that the<br>
&gt;=C2=A0 =C2=A0* last instruction of a TB might have used helpers, and th=
erefore the<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div></div>

--0000000000005343cd05c77dc001--

