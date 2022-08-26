Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D205A2DC9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:44:52 +0200 (CEST)
Received: from localhost ([::1]:51034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdNz-0004Vx-55
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRdAr-0006i2-Qf
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRdAn-0003vy-Sv
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661535072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jc0q+SWfaqJezDytkZtEpYJD4fFO164wYRSueUBx7Y4=;
 b=Z8Tk7fGiyctiNN9JP+iNt0r8JNzabAkGcrNT72PdgM0fom8uQ/CWkd2LsDbaqE8E4vKhVa
 2uJAjdLip586/XJkYX3stXjBZwdwsm2vNDQ9Ul1/1CwZBiMWAp44TtSYdj+knX2DpPIKtF
 VqjKGQUOT9qsuuutrdMtPmkNxViWA5E=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-G8bLeQzlOiyXt1kVZDVYhg-1; Fri, 26 Aug 2022 13:31:08 -0400
X-MC-Unique: G8bLeQzlOiyXt1kVZDVYhg-1
Received: by mail-lj1-f199.google.com with SMTP id
 k21-20020a2e2415000000b00261e34257b2so807412ljk.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jc0q+SWfaqJezDytkZtEpYJD4fFO164wYRSueUBx7Y4=;
 b=nR1DFThF27emH595+EvNUxFe1u+mjbe8xPticHqo45MJHQFVChz5W79FWrCOwmv5aM
 Z9nAyGA5vG7542nRitZ4eh0uBkMyc0E9SimsgISQ0vuRrtL7y1A1NK9XT6xg/qAeplYf
 g6LfmWWTFmskajUbLJ6nS6kdbOktLxYdCN1mxMDRhM9pH2EXEoasTOQh0xjMrC/J8VXK
 O1fOZhUCmE+t9G4mVx6t1tio/CNBZJlxVRsNjJQGiL55Lk3YXYYqKYO8lv9Vnc+3ubrd
 g8tUSMFyi9CDLb2TYManpPZlmn29PJxn8+WvQc6YEbbEbYy3D6+XyGwa66IXYSac50I5
 5inQ==
X-Gm-Message-State: ACgBeo1CtQPoHOhua23d8w7kpff7rWQLrtbPdW9yDwJ6JPO0C3bleAWE
 VuP0sXxZX414BRIZGSosYpPkKlCVlTvNszKKuumqXcvWtI9a1KZmp2FF+ch6kS3QLGe8QIs1GIt
 shu1C4QwAW1VR4GVK+mipdO4h0kxEdVo=
X-Received: by 2002:a05:6512:da:b0:492:e48e:b4c0 with SMTP id
 c26-20020a05651200da00b00492e48eb4c0mr2879974lfp.7.1661535067419; 
 Fri, 26 Aug 2022 10:31:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4M0uTVcjNRuaWwKwQApXrt7lJmHg7EQKo6lQGdo5Rlj+uCbL88GWBgu5LEw41GN9B1eg7/NWiRb8VClt1RlLk=
X-Received: by 2002:a05:6512:da:b0:492:e48e:b4c0 with SMTP id
 c26-20020a05651200da00b00492e48eb4c0mr2879970lfp.7.1661535067163; Fri, 26 Aug
 2022 10:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <87wnavexjg.fsf@linaro.org>
In-Reply-To: <87wnavexjg.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Aug 2022 19:30:55 +0200
Message-ID: <CABgObfYbvRfDpBCzuQxvdtezJneBVFmdnrZBxev=Oa7=Qz9CFw@mail.gmail.com>
Subject: Re: New feature shout outs for KVM Forum QEMU Status Report
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000075e98305e7284716"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000075e98305e7284716
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

- almost all compilation tests moved to Meson

- this leaves configure to do compiler detection and prepare the
dependencies (submodules, in the future python venv)
   - compiler detection for tests/tcg and firmware moved to configure,
enabling cross compilation of firmware

- -audio as a replacement for -soundhw

- statistics subsystem (for now KVM statistics are available)

Paolo

Il ven 26 ago 2022, 19:15 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

> Hi Maintainers,
>
> Are there any features that got added in the last year (since KVM Forum
> 2021) that you think deserve more recognition? If so please reply to
> this thread (or privately to me if you want) and let me know what
> feature landed and why it is so cool.
>
> The reward could well be a bullet point in the talk ;-)
>
> Thanks,
>
> --
> Alex Benn=C3=A9e
>
>

--00000000000075e98305e7284716
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-size:12.8px">- almost all compilation=
 tests moved to Meson</span><br style=3D"font-size:12.8px"><br style=3D"fon=
t-size:12.8px"><span style=3D"font-size:12.8px">- this leaves configure to =
do compiler detection and prepare the</span><br style=3D"font-size:12.8px">=
<span style=3D"font-size:12.8px">dependencies (submodules, in the future py=
thon venv)</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12=
.8px">=C2=A0 =C2=A0- compiler detection for tests/tcg and firmware moved to=
 configure,</span><br style=3D"font-size:12.8px"><span style=3D"font-size:1=
2.8px">enabling cross compilation of firmware</span><br style=3D"font-size:=
12.8px"><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">- -=
audio as a replacement for -soundhw</span><br style=3D"font-size:12.8px"><b=
r style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">- statistics =
subsystem (for now KVM statistics are available)</span><div dir=3D"auto"><s=
pan style=3D"font-size:12.8px"><br></span></div><div dir=3D"auto"><span sty=
le=3D"font-size:12.8px">Paolo</span></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Il ven 26 ago 2022, 19:15 Alex Be=
nn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.=
org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Maintain=
ers,<br>
<br>
Are there any features that got added in the last year (since KVM Forum<br>
2021) that you think deserve more recognition? If so please reply to<br>
this thread (or privately to me if you want) and let me know what<br>
feature landed and why it is so cool.<br>
<br>
The reward could well be a bullet point in the talk ;-)<br>
<br>
Thanks,<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div>

--00000000000075e98305e7284716--


