Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D16302260
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 08:18:41 +0100 (CET)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3w92-00023J-LW
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 02:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3w3y-0000eA-SQ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:13:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3w3w-0000sG-A7
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611558800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A8c/zykeaw2glHa21Y0Iop/3PYKUPUoj+P4SzCfqEW4=;
 b=T7MaiFbdznRaT4KRQU9o0DUkSQoiVEm3z7eIV2RXXnI0ZtZsJL3231eaGvgGlyiIPPOS6i
 MeFdWVN1Par3Jy3VeEvsb/xSytNtkHtQBDq9bbwr/gQi7tBDSSX3ltZbHJeCknY1nCPz7p
 PXwn8TEcbPZNrTr89LRbhdWZ3iu153o=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-xil9MfLuOBSQEpDp3LjcZA-1; Mon, 25 Jan 2021 02:13:17 -0500
X-MC-Unique: xil9MfLuOBSQEpDp3LjcZA-1
Received: by mail-pf1-f198.google.com with SMTP id 15so5789884pfu.6
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 23:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A8c/zykeaw2glHa21Y0Iop/3PYKUPUoj+P4SzCfqEW4=;
 b=Ue+8JNfNlwxa64rxYS2Kxy9RCXdISgBCZAU+sMngJ2rEWmwnkbA7OlfJZccxF/OsSt
 3G46IPJN62YgroZbaPv/06EX3PKOjrIR9Sj3FcvIuIp4yV35CpofIgINcIX6vhrjOfuD
 FFQzsXGfa3eIv/k/FV+/qRUQ1YW5OqqHRF+h53qwx794HHo0ESZd1xybmzGCK/KVsoQ8
 swBGfLdGJQayjWPxaTWmuIItf1zxPokYmOdrpxAw/2oQT13Mw5tLO639ebxT922sZ8b5
 aWLNEkt0hO31BOEIC6UiUisZOXlAytaFa1LL7zapdM1FjXtk3ab6BD+YehxCROK2Bxiv
 wc3w==
X-Gm-Message-State: AOAM533CnEu376h26gX4t4vQk1u6NpJ1LqT7Y7Zd4z326qm4iaAimWX7
 /NmSfyCBWwE/LKpGm1hwbQcwZFPg2wzJHjdnzvKazhah/5ii1/HhUc0Oyc/OK4QnMkJWC95FwNE
 lgGe9GcixiUd0I76nznQcWtoJmkywL4E=
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aecf with SMTP id
 g3-20020a1709026b43b02900dffb48aecfmr1324903plt.67.1611558796533; 
 Sun, 24 Jan 2021 23:13:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLOI20vz9eRc5OvZ9zOu0Yq7Q3BnGUBmb8HtIdl7eeEf7kAOwuJX4Kbk4S/zVDCiN2i4WVSacFnJkqRHsx3i8=
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aecf with SMTP id
 g3-20020a1709026b43b02900dffb48aecfmr1324890plt.67.1611558796331; Sun, 24 Jan
 2021 23:13:16 -0800 (PST)
MIME-Version: 1.0
References: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
 <288b2af5-94d5-36c8-9eb2-de31ff1de066@redhat.com>
 <d9f8e9d4-8aef-29b6-765d-014c782e4764@ispras.ru>
In-Reply-To: <d9f8e9d4-8aef-29b6-765d-014c782e4764@ispras.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Jan 2021 08:13:04 +0100
Message-ID: <CABgObfaFnKztrjc7mpgTxEi9R7jXD-Qed5vVcPBSGcE_nexONg@mail.gmail.com>
Subject: Re: [PATCH] replay: fix replay of the interrupts
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000971ddb05b9b445c4"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000971ddb05b9b445c4
Content-Type: text/plain; charset="UTF-8"

In general I agree, but != means that rr disabled returns true. In general
it seems to me that rr disabled should work more or less the same as record
mode, because there is no replay log to provide the checkpoints.

Paolo

Il lun 25 gen 2021, 06:38 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> ha
scritto:

> On 23.01.2021 21:15, Paolo Bonzini wrote:
> > On 19/01/21 13:39, Pavel Dovgalyuk wrote:
> >> Sometimes interrupt event comes at the same time with
> >> the virtual timers. In this case replay tries to proceed
> >> the timers, because deadline for them is zero.
> >> This patch allows processing interrupts and exceptions
> >> by entering the vCPU execution loop, when deadline is zero,
> >> but checkpoint associated with virtual timers is not ready
> >> to be replayed.
> >>
> >> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> >> ---
> >>   accel/tcg/tcg-cpus-icount.c |    8 +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
> >> index 9f45432275..a6d2bb8a88 100644
> >> --- a/accel/tcg/tcg-cpus-icount.c
> >> +++ b/accel/tcg/tcg-cpus-icount.c
> >> @@ -81,7 +81,13 @@ void icount_handle_deadline(void)
> >>       int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
> >>
> QEMU_TIMER_ATTR_ALL);
> >> -    if (deadline == 0) {
> >> +    /*
> >> +     * Instructions, interrupts, and exceptions are processed in
> >> cpu-exec.
> >> +     * Don't interrupt cpu thread, when these events are waiting
> >> +     * (i.e., there is no checkpoint)
> >> +     */
> >> +    if (deadline == 0
> >> +        && (replay_mode == REPLAY_MODE_RECORD ||
> >> replay_has_checkpoint())) {
> >
> > Should this be replay_mode != REPLAY_MODE_PLAY ||
> replay_has_checkpoint()?
>
> It was the first idea, but I thought, that == is more straightforward
> to understand than !=.
>
> Pavel Dovgalyuk
>
>

--000000000000971ddb05b9b445c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>In general I agree, but !=3D means that rr disabled =
returns true. In general it seems to me that rr disabled should work more o=
r less the same as record mode, because there is no replay log to provide t=
he checkpoints.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo<br=
><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmai=
l_attr">Il lun 25 gen 2021, 06:38 Pavel Dovgalyuk &lt;<a href=3D"mailto:pav=
el.dovgalyuk@ispras.ru">pavel.dovgalyuk@ispras.ru</a>&gt; ha scritto:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On 23.01.2021 21:15, Paolo Bonzini wrote=
:<br>
&gt; On 19/01/21 13:39, Pavel Dovgalyuk wrote:<br>
&gt;&gt; Sometimes interrupt event comes at the same time with<br>
&gt;&gt; the virtual timers. In this case replay tries to proceed<br>
&gt;&gt; the timers, because deadline for them is zero.<br>
&gt;&gt; This patch allows processing interrupts and exceptions<br>
&gt;&gt; by entering the vCPU execution loop, when deadline is zero,<br>
&gt;&gt; but checkpoint associated with virtual timers is not ready<br>
&gt;&gt; to be replayed.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Pavel Dovgalyuk &lt;<a href=3D"mailto:Pavel.Dovgaly=
uk@ispras.ru" target=3D"_blank" rel=3D"noreferrer">Pavel.Dovgalyuk@ispras.r=
u</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 accel/tcg/tcg-cpus-icount.c |=C2=A0=C2=A0=C2=A0 8 +++++++-<=
br>
&gt;&gt; =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icou=
nt.c<br>
&gt;&gt; index 9f45432275..a6d2bb8a88 100644<br>
&gt;&gt; --- a/accel/tcg/tcg-cpus-icount.c<br>
&gt;&gt; +++ b/accel/tcg/tcg-cpus-icount.c<br>
&gt;&gt; @@ -81,7 +81,13 @@ void icount_handle_deadline(void)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int64_t deadline =3D qemu_clock_dea=
dline_ns_all(QEMU_CLOCK_VIRTUAL,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 QEMU_TIMER_ATTR_ALL);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 if (deadline =3D=3D 0) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * Instructions, interrupts, and exceptio=
ns are processed in <br>
&gt;&gt; cpu-exec.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * Don&#39;t interrupt cpu thread, when t=
hese events are waiting<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * (i.e., there is no checkpoint)<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (deadline =3D=3D 0<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;&amp; (replay_mod=
e =3D=3D REPLAY_MODE_RECORD || <br>
&gt;&gt; replay_has_checkpoint())) {<br>
&gt; <br>
&gt; Should this be replay_mode !=3D REPLAY_MODE_PLAY || replay_has_checkpo=
int()?<br>
<br>
It was the first idea, but I thought, that =3D=3D is more straightforward<b=
r>
to understand than !=3D.<br>
<br>
Pavel Dovgalyuk<br>
<br>
</blockquote></div></div></div>

--000000000000971ddb05b9b445c4--


