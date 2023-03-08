Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4605B6B0E52
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 17:15:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZwQl-0002b7-Fw; Wed, 08 Mar 2023 11:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pZwQj-0002ak-FT
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:14:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pZwQg-0007Vn-G2
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678292052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aulWnFr8271ZhUnI56aJxAepikWHYfH2ryUxrp380IQ=;
 b=HjUbZkZWshs9WIwqbc3JfXTEHbmNW8Q8EfgJQrc0j9FVsK/1OQh9h5SJ4B+il8v1Wmsab4
 hAejxb+tAlgHEmctETCaFOBD1DQztnvKw6n4qY+C/pqnqeuksWd7jBsczEy15d9tu9y018
 Qi1LGjZK7Mu2MIFtXGfhRvkHc0QgOfk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-kpnl2DHSNJy73VhWNkIjZQ-1; Wed, 08 Mar 2023 11:14:11 -0500
X-MC-Unique: kpnl2DHSNJy73VhWNkIjZQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 z3-20020ad44143000000b005771ea56ab6so9554971qvp.1
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 08:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678292051;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aulWnFr8271ZhUnI56aJxAepikWHYfH2ryUxrp380IQ=;
 b=Q1sjwcx7kYBM0TwJ6QdAxqYzPUsHuSgej/hQhwntpyX7ZzxpVVPpfyKZiaK9KFV3XH
 W1yG4jF6dxsczPqp4xHncJt3iYedNNTD3YIRuCEfp0QXbpxji9Sz6q+j4CiZIUWBqqkk
 wZdpTLuG7abXuNv3wIoS/10OJn/366qVO+OmXO9+O4fnEcw9OI/1aAwmN1yOsm8HFUSd
 lF45lPGNsvKiwrffNNiW3FhTs5uw6IbrZNAh+kNhWMV/4gxrienX/f27E1BG08TbcHwv
 PvthLgOiUT4MQtPEwHG+PgMqza2YApTyFPtjlpz6tn0wCTPOTW5KwPF17HfAUBilpTWB
 q8fQ==
X-Gm-Message-State: AO0yUKXMrT3bQydir3J+LtNIjaKhrBnxKRAiuUk8Ca03MzPBWBSm3BVY
 A8YTKANLNsouu5DfL5pyURAc+Hv2kophSQhm0bl6VZSGS48B1Wi8kiPXP20eAIJF43j01citCKY
 G7w2RWFw22dl1h8F2LAXVWH+GfY//w5s=
X-Received: by 2002:ac8:4904:0:b0:3bd:17d6:f98d with SMTP id
 e4-20020ac84904000000b003bd17d6f98dmr5519508qtq.10.1678292050981; 
 Wed, 08 Mar 2023 08:14:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/Z6GlB39HtMs2hbQ5sfsZ+RFOmjVj8F87HQz3WR1NIAa+rxvHlVS5nSxt9q4DH6wdjvrVK2bnYBs9bY3L7Sv8=
X-Received: by 2002:ac8:4904:0:b0:3bd:17d6:f98d with SMTP id
 e4-20020ac84904000000b003bd17d6f98dmr5519501qtq.10.1678292050655; Wed, 08 Mar
 2023 08:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20230227215943.114466-1-dbassey@redhat.com>
 <CAJ+F1CKRPVF5ciDQwbaacdozNx27hmo514OONOk3p_LLtB+OBg@mail.gmail.com>
 <CACzuRyxMSnJ9ANgQT+Vt1SK3ETt=TtvtKsA2GNzEpe=AQ6iApQ@mail.gmail.com>
 <CAJ+F1CJRXdiv=Denf-q7cQ=X39MQL8X=_4Zf7aB5ozPCGJDY9A@mail.gmail.com>
In-Reply-To: <CAJ+F1CJRXdiv=Denf-q7cQ=X39MQL8X=_4Zf7aB5ozPCGJDY9A@mail.gmail.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Wed, 8 Mar 2023 17:13:59 +0100
Message-ID: <CACzuRyx+pNHmdZnocCHwYB__jNLZJMHp1uwkN-3eRMPtTPaC5Q@mail.gmail.com>
Subject: Re: [PATCH v5] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, armbru@redhat.com, 
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com
Content-Type: multipart/alternative; boundary="000000000000824f6805f665d113"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dbassey@redhat.com;
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

--000000000000824f6805f665d113
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Unfortunately, you are not calling pw_thread_loop_wait yourself, so
> that doesn't help me what this is supposed to do. When signaling
> things and expecting a certain state and side-effect from a different
> thread or context, it's nice to document it.
>
> I guess this will break the thread loop? What happens next?
>

In this case When the on_core_done event is received for an object with id
`PW_ID_CORE` this function would call the thread_loop_signal(loop, FALSE)
to stop and exit the thread loop. I would add a comment for this, to be
clear.

Thanks,
Dorinda.

On Tue, Mar 7, 2023 at 2:49=E2=80=AFPM Marc-Andr=C3=A9 Lureau <marcandre.lu=
reau@gmail.com>
wrote:

> Hi
>
> On Fri, Mar 3, 2023 at 8:06 PM Dorinda Bassey
> >> What are those thread_loop_signal() for? Maybe leave a comment?
> >
> > the explanation of the function is in the reference header file.
> >
>
> Yes, I read the reference documentation before asking: "Signal all
> threads waiting with pw_thread_loop_wait."
> (
> https://docs.pipewire.org/group__pw__thread__loop.html#gaf9bc8dd348d05b09=
5139f5a55ac5a4b0
> )
>
> Unfortunately, you are not calling pw_thread_loop_wait yourself, so
> that doesn't help me what this is supposed to do. When signaling
> things and expecting a certain state and side-effect from a different
> thread or context, it's nice to document it.
>
> I guess this will break the thread loop? What happens next?
>
> thanks
>
> --
> Marc-Andr=C3=A9 Lureau
>
>

--000000000000824f6805f665d113
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div>Unfortunately, you are not calling pw_thread_loop_=
wait yourself, so<br>
that doesn&#39;t help me what this is supposed to do. When signaling<br>
things and expecting a certain state and side-effect from a different<br>
thread or context, it&#39;s nice to document it.<br>
<br>
I guess this will break the thread loop? What happens next?<br>
</div></blockquote><div><br></div><div>In this case When the on_core_done e=
vent is received for an object with id `PW_ID_CORE` this function would cal=
l the thread_loop_signal(loop, FALSE) to stop and exit the thread loop. I w=
ould add a comment for this, to be clear.</div><div><br></div><div>Thanks,<=
/div><div>Dorinda.<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Mar 7, 2023 at 2:49=E2=80=AFPM Marc-A=
ndr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcandr=
e.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi<br>
<br>
On Fri, Mar 3, 2023 at 8:06 PM Dorinda Bassey<br>
&gt;&gt; What are those thread_loop_signal() for? Maybe leave a comment?<br=
>
&gt;<br>
&gt; the explanation of the function is in the reference header file.<br>
&gt;<br>
<br>
Yes, I read the reference documentation before asking: &quot;Signal all<br>
threads waiting with pw_thread_loop_wait.&quot;<br>
(<a href=3D"https://docs.pipewire.org/group__pw__thread__loop.html#gaf9bc8d=
d348d05b095139f5a55ac5a4b0" rel=3D"noreferrer" target=3D"_blank">https://do=
cs.pipewire.org/group__pw__thread__loop.html#gaf9bc8dd348d05b095139f5a55ac5=
a4b0</a>)<br>
<br>
Unfortunately, you are not calling pw_thread_loop_wait yourself, so<br>
that doesn&#39;t help me what this is supposed to do. When signaling<br>
things and expecting a certain state and side-effect from a different<br>
thread or context, it&#39;s nice to document it.<br>
<br>
I guess this will break the thread loop? What happens next?<br>
<br>
thanks<br>
<br>
-- <br>
Marc-Andr=C3=A9 Lureau<br>
<br>
</blockquote></div>

--000000000000824f6805f665d113--


