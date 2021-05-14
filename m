Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D04380FD8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 20:35:48 +0200 (CEST)
Received: from localhost ([::1]:41536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhcf4-0007mJ-SW
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 14:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhccE-0004nL-89
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhcc9-0004D7-En
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621017164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5EcjNFRyCRzTO9haFGaaz/JwjD0xYxlrSQS/Pc3/Bas=;
 b=U16qkY2LYK9SY23e2oT5znkVoVYVwMFDCjdTwqMgA0IFY1v6Wo68Ris5JXod7TVNgSwiTp
 Hl6p0o/HtrxauOWqhqOc1ldoYuTuLlPl2c25DxN9QoaakyLQsYwEImSWvIDfvWhGeREqGG
 k/4fPnbC3QwlrpPIo64O1LwXSFDhmFQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-me7GUhpqMKWb0X3hoX-dfQ-1; Fri, 14 May 2021 14:32:37 -0400
X-MC-Unique: me7GUhpqMKWb0X3hoX-dfQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 l15-20020a17090ac58fb029015718e39aa2so327818pjt.6
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 11:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5EcjNFRyCRzTO9haFGaaz/JwjD0xYxlrSQS/Pc3/Bas=;
 b=fkDglRPSIAujbXva0Ho8Prdp2mPiIBo51A8DwOtv/shBdEhyXKMMofL0S6B1fmAcrd
 BAkzonOZbKRzZLRVeBVeSGhsjM6sVQkM6EXAxyN75M8EENmfqbF0q6rii64gaYZvKR5L
 Z03v8D5bBWiBvQdTT/9wEnmGO0iRJrXEBiAwiwSL9ndhjqLwJLTEuTCNS4ha8W3S/yyh
 Pvp4a7pzXNLO7AAxm5Qb37C0Alu9QP9aK2FaOy4Bzlr90fRE1pFAfY7HQIe+M4W4Dfd/
 1AC8jslFbUfBd8eoSE7mDYWg2y3aFK/JPW5ZsmgO0V53+WDmNRQTzpasaZlraZhxGeP3
 Mkkw==
X-Gm-Message-State: AOAM533WnA+SGnQn5RxdfvFNNflMuhNONj08A1GaE93lPxSbhsPteAD9
 icDfmQdbl3+nluawj4iYlykZzhi16D7gI+xiVs0kp57SHLa+i0yf2vRIHyxZ0NJRqqLf+Gf0BSf
 jBK5Pa1MnljKq7g041MtiwgWfxvz6Zt8=
X-Received: by 2002:a05:6a00:14cb:b029:2be:1466:5a28 with SMTP id
 w11-20020a056a0014cbb02902be14665a28mr27757334pfu.55.1621017155904; 
 Fri, 14 May 2021 11:32:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKysFxsBx9QgxuciGcZHp03D20QwrOUrKNNa6kVbAwJ6GW+XpjvB366EVguB/gnsNI+U/znkW47zdH5FRIWBg=
X-Received: by 2002:a05:6a00:14cb:b029:2be:1466:5a28 with SMTP id
 w11-20020a056a0014cbb02902be14665a28mr27757303pfu.55.1621017155613; Fri, 14
 May 2021 11:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
 <5210646b-c661-882d-6c8d-0fd1772342d2@greensocs.com>
 <61071d36-b700-8546-c19b-09c4e582bdfe@redhat.com>
 <YJ6jSeu3Uz4g6cCK@redhat.com>
In-Reply-To: <YJ6jSeu3Uz4g6cCK@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 14 May 2021 20:32:22 +0200
Message-ID: <CABgObfZxq1RDP12d3aCmV8drU3qFbhcUbxe4+9K_gNhXcFT-ug@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bc501105c24e7747"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, HTML_OBFUSCATE_05_10=0.26, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bc501105c24e7747
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il ven 14 mag 2021, 18:20 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> My gut feeling though is accel-set would be more logical being done
> first, as that also influences the set of features available in other
> areas of QEMU configuration. Was there a reason you listed it after
> machine-set ?
>

That was also my initial gut feeling, but actually right now the machine
influences the accelerator more than the other way round. For example the
initialization of the accelerator takes a machine so that for example on
x86 the per-architecture KVM knows whether to set up SMM. Also different
machines could use different modes for KVM (HV vs PR for ppc), and some
machines may not be virtualizable at all so they require TCG.

The host CPU these days is really a virtualization-only synonym for -cpu
max, which works for TCG as well. But you're right that x86 CPU flags are
dictated by the accelerator rather than the machine, so specifying it in
machine-set would be clumsy. On the other hand on ARM it's a bit of both:
for KVM it's basically always -cpu host so the accelerator is important;
but some machines may have an M profile CPU and some may have an A.

I don't have the sources at hand to check in which phase CPUs are created,
but it's definitely after ACCEL_CREATED. Adding a third command
cpu-model-set is probably the easiest way to proceed.

Paolo


> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000bc501105c24e7747
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 14 mag 2021, 18:20 Daniel P. Berrang=C3=A9 &lt;=
<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">My gut feeling though is accel-=
set would be more logical being done<br>
first, as that also influences the set of features available in other<br>
areas of QEMU configuration. Was there a reason you listed it after<br>
machine-set ?<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">That was also my initial gut feeling, but actually right now t=
he machine influences the accelerator more than the other way round. For ex=
ample t<span style=3D"font-family:sans-serif">he initialization of the acce=
lerator takes a machine so that for example on x86 the per-architecture KVM=
 knows whether to set up SMM</span>. Also different machines could use diff=
erent modes for KVM (HV vs PR for ppc), and some machines may not be virtua=
lizable at all so they require TCG.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">The host CPU these days is really a virtualization-only synonym=
 for -cpu max, which works for TCG as well. But you&#39;re right that x86 C=
PU flags are dictated by the accelerator rather than the machine, so specif=
ying it in machine-set would be clumsy. On the other hand on ARM it&#39;s a=
 bit of both: for KVM it&#39;s basically always -cpu host so the accelerato=
r is important; but some machines may have an M profile CPU and some may ha=
ve an A.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t hav=
e the sources at hand to check in which phase CPUs are created, but it&#39;=
s definitely after ACCEL_CREATED. Adding a third command cpu-model-set is p=
robably the easiest way to proceed.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--000000000000bc501105c24e7747--


