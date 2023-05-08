Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B5C6FBB01
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 00:25:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw9H3-0005Lq-FU; Mon, 08 May 2023 18:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pw9H1-0005LJ-7N
 for qemu-devel@nongnu.org; Mon, 08 May 2023 18:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pw9Gz-00035k-GX
 for qemu-devel@nongnu.org; Mon, 08 May 2023 18:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683584640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zureYO06k8lyXk0X/C4wQv289tsk/aNMUI3ppydUuCk=;
 b=jO3uXnSwUiHLXrEQpBUx/HQYLLlEMp4X4Umln2Kj+AVYX4JYREn3oSVyWk0N8x7CPCgXww
 54eDPi3QPCVJjUa5eyATbio9mRX148+AxBZI0QCQ1+kXXjln1m7Q8xVpHSHN3DxovxetCe
 Uo+w33Op/cetnMwyG5Lbt6CkUhacOxI=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21--53kGZDYOoSiSo76LbMVbg-1; Mon, 08 May 2023 18:23:59 -0400
X-MC-Unique: -53kGZDYOoSiSo76LbMVbg-1
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-4360a33976eso671756137.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 15:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683584638; x=1686176638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zureYO06k8lyXk0X/C4wQv289tsk/aNMUI3ppydUuCk=;
 b=Ee3NIz1Za1Q8JjVt4ZM3zkFJULjbY8ye6100UgMSTFYm5+YtHtAGljMu5Rb+zYgoNQ
 wQk8p5qetG7LZhNjrSWsFFYSXeAJuRKI+nz93FNXjdHZNRydw4cAFxmBKwm3VNCRZCnI
 HnRdRa5hdmAVHofo1mDfNAY0IfZrlZ32AbDO/A0Rs2kLrdeOH7JLfQYYHIVMztSaViJD
 lIWu4T5nFSDH0hSYa2PX4xu8VXpsk8nyuZfejRLM6w+0Dv0w58X3jMTYlRzkf/W3Fjhr
 nurDrow4o0ALRTYbzlsV0Wuh23iXBC7krpvX1D8DEcYBbMxJ8v/8JJWWO8ibr+Wu2d0O
 MHZA==
X-Gm-Message-State: AC+VfDyVuu25GYM4cxWptoT6cqYX8i3rd5JRcCbBaBQmTVMFSvQbR3BS
 DgFA9DOKSBJF6kryCZHeIjVTBDQFSgl4Q0FFtU6CyuGPwXjXIwdRkinTb5y0L+eWoXYBB2PBYzQ
 rcx2x+1lXCF0gN4FsbuXcBHn3SNA6aAs=
X-Received: by 2002:a05:6102:316f:b0:42f:eb31:810 with SMTP id
 l15-20020a056102316f00b0042feb310810mr4064400vsm.17.1683584638425; 
 Mon, 08 May 2023 15:23:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Icux2OTaSxf1YSXCog1hFzVEyvy/S8QifmhcM400Wb+ZJzDAY3RRnyJbVDcG5x6WQnP3sWg6L3yi0QfcDV+4=
X-Received: by 2002:a05:6102:316f:b0:42f:eb31:810 with SMTP id
 l15-20020a056102316f00b0042feb310810mr4064383vsm.17.1683584638153; Mon, 08
 May 2023 15:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org> <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
In-Reply-To: <878re4cl1u.fsf@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 9 May 2023 00:23:47 +0200
Message-ID: <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Fabiano Rosas <farosas@suse.de>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004e8e7605fb36186f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000004e8e7605fb36186f
Content-Type: text/plain; charset="UTF-8"

Il gio 4 mag 2023, 14:56 Fabiano Rosas <farosas@suse.de> ha scritto:

>
> It's a bit hard to maintain the original intention with just
> documentation. Couldn't we require that --without-default-devices always
> be accompanied by --with-devices?


Maybe, but why would it be bad to just patch the default .mak file?

And more to the point of Peter's
> question, couldn't we just leave the defaults off unconditionally when
> --without-default-devices is passed without --with-devices?
>

No, for example RHEL adds a lot of devices and is perfectly usable without
--nodefaults, but we still use --without-default-devices because we want
any new config to be opt in, unless it's always needed.

The coupling of -nodefaults with --without-default-devices is a bit
> redundant. If we're choosing to not build some devices, then the QEMU
> binary should already know that.
>

--without-default-devices is not about choosing to not build some devices;
it is about making non-selected devices opt-in rather than opt-out.

Paolo


> Just to be clear, -nodefaults by itself still makes sense because we can
> have a simple command line for those using QEMU directly while allowing
> the management layer to fine tune the devices.
>
> In the long run, I think we need to add some configure option that gives
> us pure allnoconfig so we can have that in the CI and catch these CONFIG
> issues before merging. There's no reason to merge a new CONFIG if it
> will then be impossible to turn it off.
>
>

--0000000000004e8e7605fb36186f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 4 mag 2023, 14:56 Fabiano Rosas &lt;<a href=3D"=
mailto:farosas@suse.de">farosas@suse.de</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br>
It&#39;s a bit hard to maintain the original intention with just<br>
documentation. Couldn&#39;t we require that --without-default-devices alway=
s<br>
be accompanied by --with-devices?</blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Maybe, but why would it be bad to just patch t=
he default .mak file?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">And more to the poi=
nt of Peter&#39;s<br>
question, couldn&#39;t we just leave the defaults off unconditionally when<=
br>
--without-default-devices is passed without --with-devices?<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">No, for example =
RHEL adds a lot of devices and is perfectly usable without --nodefaults, bu=
t we still use --without-default-devices because we want any new config to =
be opt in, unless it&#39;s always needed.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>The coupling of -nodefaults with --without-default-devices is a bit<br>
redundant. If we&#39;re choosing to not build some devices, then the QEMU<b=
r>
binary should already know that.<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">--without-default-devices is not about choo=
sing to not build some devices; it is about making non-selected devices opt=
-in rather than opt-out.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
Just to be clear, -nodefaults by itself still makes sense because we can<br=
>
have a simple command line for those using QEMU directly while allowing<br>
the management layer to fine tune the devices.<br>
<br>
In the long run, I think we need to add some configure option that gives<br=
>
us pure allnoconfig so we can have that in the CI and catch these CONFIG<br=
>
issues before merging. There&#39;s no reason to merge a new CONFIG if it<br=
>
will then be impossible to turn it off.<br>
<br>
</blockquote></div></div></div>

--0000000000004e8e7605fb36186f--


