Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D58A64BF5D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 23:33:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Dp1-0005pX-9Q; Tue, 13 Dec 2022 17:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5Doy-0005pN-UB
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 17:32:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5Dox-00018b-4k
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 17:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670970736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jpcM2jgp0Dn65Lsd/ImKXmo0GHaoOoQisMuXQ7lD09k=;
 b=JGr+SagaP3L20OmS40YnxnGmAm/CptNQvSOkxORF94k2dU6UnjezlTa+Gkh+rBMkJwPuEG
 RmRyDgF25F141zKUQ0ruRR4u9Cmu+30IDiWSPcRmsEyHRzkM6SuVYFA6GgrQNfttaKkeAw
 2DFua1Qd+b8DD48+CWADZvHEzFbOXBY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-hkEi8uzrMUWzE11CRSqF4Q-1; Tue, 13 Dec 2022 17:32:15 -0500
X-MC-Unique: hkEi8uzrMUWzE11CRSqF4Q-1
Received: by mail-ua1-f70.google.com with SMTP id
 e8-20020ab031c8000000b00419c62a04c3so7415526uan.17
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 14:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jpcM2jgp0Dn65Lsd/ImKXmo0GHaoOoQisMuXQ7lD09k=;
 b=F0FjhkelVBeAGLArbAMYj8qY4BB/aBRfhLHq5HxzJUG9ZlWsOqjtZLl19f0gA+Cf9v
 8wXUO+vptxMZauBHekzcdvRJbWWAgxvMkj/mGOu+GEStf4U/sOCyBdQVJqrH0w0g3Jcz
 rm8C+XcbbsTs2YR5cFqKk6cUtRWhOPgzx9tB/Xdqa0J9+cB9vsZ4fF0n1qSaMqaBwgny
 KFLTQ+JqfMFO04lNXsNKCK3UDhsRc3GX1tRhMxf9cMAfRV5LcZUmOqDU8wGxHzRQ4nrr
 wE6JS0iLlJMmZg6gYmA+vFtrLt0fMF8ZSFkexsZuMoZkEMKY81cyopmOxRmxW5pKiOBz
 Td8Q==
X-Gm-Message-State: ANoB5pmo9OwZ1Tkfmmkb/2O7kdgVfx5Hj9y6uCVZyVB2sQz58eBuNGO3
 2Hhzhi2aHCSIoZJwbyxVW3jumIwyDYhwpuIu6+sA/csWCgU2tKgTSidB9zPnHhwkESly7s3942H
 0Tm+0vjAwF8Xlr9PNwzon/1hwaMKmV2A=
X-Received: by 2002:a05:6102:11e5:b0:3aa:2fea:86f4 with SMTP id
 e5-20020a05610211e500b003aa2fea86f4mr45766514vsg.54.1670970734618; 
 Tue, 13 Dec 2022 14:32:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf63Lzn03SyIpq3TTMfS8pjM8tLHlw8nUNDVr/I7qP4+6GUuF7uDHZAyqSaIaIbwNVZ+y23Z64mTcEOtJyjTpSY=
X-Received: by 2002:a05:6102:11e5:b0:3aa:2fea:86f4 with SMTP id
 e5-20020a05610211e500b003aa2fea86f4mr45766509vsg.54.1670970734344; Tue, 13
 Dec 2022 14:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-3-dwmw2@infradead.org>
 <77357500-5fa0-b8c0-9367-2355db6f6bfb@redhat.com>
 <cae88f5e0390ab01b21b513da81256b1ce770fbf.camel@infradead.org>
 <CABgObfbYh6Fb4nrsmXp5uTmrzPNVy5LHwN-TfjHE2oeZbb+h2Q@mail.gmail.com>
 <650ae0885c06f97d5160069fb03e5677aa6d7aee.camel@infradead.org>
In-Reply-To: <650ae0885c06f97d5160069fb03e5677aa6d7aee.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Dec 2022 23:32:03 +0100
Message-ID: <CABgObfbrH3GRGwk=n4TC48GEH0vFmjua_8HTZWBGHbavDS2Jjg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/22] xen: add CONFIG_XENFV_MACHINE and
 CONFIG_XEN_EMU options for Xen emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paul Durrant <paul@xen.org>, 
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Claudio Fontana <cfontana@suse.de>
Content-Type: multipart/alternative; boundary="0000000000000d16f805efbd31f2"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

--0000000000000d16f805efbd31f2
Content-Type: text/plain; charset="UTF-8"

Il mar 13 dic 2022, 01:59 David Woodhouse <dwmw2@infradead.org> ha scritto:

> There was *also* a call to xen_emulated_machine_init() added to
> pc_init1() by the 'pc_piix: handle XEN_EMULATE backend init' patch.
> I've dropped that for now; once we are ready to hook up the xenbus and
> PV drivers, that seems like it can go into mc->kvm_type too. Or maybe I
> should have kept that, and initialised the overlay and evtchn devices
> from xen_emulated_machine_init() instead of mc->kvm_type() ?
>

I think that would be too early. mc->kvm_type, which really should be
called mc->accel_created, is the first place where you can look at xen_mode.

Paolo

Paolo

>

--0000000000000d16f805efbd31f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 13 dic 2022, 01:59 David Woodhouse &lt;<a href=
=3D"mailto:dwmw2@infradead.org">dwmw2@infradead.org</a>&gt; ha scritto:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">There was *also* a call to xen_emulate=
d_machine_init() added to<br>
pc_init1() by the &#39;pc_piix: handle XEN_EMULATE backend init&#39; patch.=
<br>
I&#39;ve dropped that for now; once we are ready to hook up the xenbus and<=
br>
PV drivers, that seems like it can go into mc-&gt;kvm_type too. Or maybe I<=
br>
should have kept that, and initialised the overlay and evtchn devices<br>
from xen_emulated_machine_init() instead of mc-&gt;kvm_type() ?<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I think that=
 would be too early. mc-&gt;kvm_type, which really should be called mc-&gt;=
accel_created, is the first place where you can look at xen_mode.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Paolo=C2=A0</div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000000d16f805efbd31f2--


