Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF42EC1D2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:12:11 +0100 (CET)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCLy-00017l-7v
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxCDL-0006yJ-KT
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:03:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxCDI-0005c7-Pc
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609952591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=skBr7it1EoVDW3QeqGwHIJI+a8y1yVpi79E9v2Ix7S8=;
 b=RmJsSURWyJy8UD3Fw9TNH4s5kXAeq0mIlHZmsxDjPB4j1ZgQIhnRF12yGeFdzUfSa28vpH
 t4GlSbwBTu2wgatSs+Xf/dFrO+yUt849+3o9pge+pK9Cc3q1t/pXlQWXyvyehOwN+kekzM
 wdCG89UqFoJYvBFTEA95Uvs75w3PWJk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-WEewOxHYNX--OcHlbOBD7g-1; Wed, 06 Jan 2021 12:03:09 -0500
X-MC-Unique: WEewOxHYNX--OcHlbOBD7g-1
Received: by mail-pf1-f200.google.com with SMTP id l17so2030886pff.17
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=skBr7it1EoVDW3QeqGwHIJI+a8y1yVpi79E9v2Ix7S8=;
 b=XJnmvA7bTpHTIzCERyZnP5xQTnbx/D6CJB0Ei58GuTiudxIXcyb0MAThgURsxkgoyy
 X1HUChF0t/8y68nF4+S9aFv4FnoWCV/nFhA0amsW6yWVN4S/XiOlMiB8hrz9GHvTgqSn
 uuNKtbPi/LvnzYeEQbxDd7YnDSdC/8tteumESaHnlruasX6L9AxnApXAsRo8/WUNBWL9
 baXdtW8DINuK8FXcp4Tirhm0TRVn7ORbjJB2xzGqguQydnQpQJoHIB/grsL11H2cK8dN
 XSJeMLIcVAysg29otqF95aui9nut9iFCEG+4q73MsXWE+DgrRzdsM8EsuB/C7Y+NAEkP
 4r9A==
X-Gm-Message-State: AOAM533dV/deSOBn77ryAom3s+DTUCYUqmsJ/vOsWgCe4GsCOJ1iHA3y
 oscUqUPyDL1C9wrVqYAkgo5pPIkFtnxP1H4tL9P2BaWNj9xtAlewP0KnvjOWbz1sAb7mmAkoR44
 Zabcu9xHKxmXEQA4VFEvblARGrxVxoTk=
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr4786085pfe.21.1609952588256; 
 Wed, 06 Jan 2021 09:03:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaOa+sC3ZW4695EzbCDXY/G2HjJb1b/K8m+8SDcgwbujOORSM+GXy1oBxeWLR28oycJadlfLu28JbiHtOo7nk=
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr4786056pfe.21.1609952587969; Wed, 06 Jan
 2021 09:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20210104144241.343186-1-pbonzini@redhat.com>
 <CAFEAcA_1MWezZ_X=V8JKBVjMRMO8Z4tY=_qAHV20ROzU+EEm8w@mail.gmail.com>
 <871rey2edv.fsf@linaro.org>
In-Reply-To: <871rey2edv.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 6 Jan 2021 18:02:56 +0100
Message-ID: <CABgObfZ9WCfXcnEshmRoZTw2RMTfFfcDK3-aJvYn363+P2yZSQ@mail.gmail.com>
Subject: Re: [PULL v2 00/53] Misc patches for 2020-12-21
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001c8c6105b83e4cce"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001c8c6105b83e4cce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have already sent the v3, so you may want to wait a day or two. The good
thing of conversion patches is that if they break something you can just
drop them. :)

Paolo

Il mer 6 gen 2021, 17:56 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scrit=
to:

>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 4 Jan 2021 at 14:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> The following changes since commit
> 41192db338588051f21501abc13743e62b0a5605:
> >>
> >>   Merge remote-tracking branch
> 'remotes/ehabkost-gl/tags/machine-next-pull-request' into staging
> (2021-01-01 22:57:15 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >>
> >> for you to fetch changes up to bac87e979fcca9f884e1c9190132c51d99a8698=
4:
> >>
> >>   win32: drop fd registration to the main-loop on setting non-block
> (2021-01-02 21:03:38 +0100)
> >>
> >> ----------------------------------------------------------------
> >> From Alex's pull request:
> >> * improve cross-build KVM coverage
> >> * new --without-default-features configure flag
> >> * add __repr__ for ConsoleSocket for debugging
> >> * build tcg tests with -Werror
> >> * test 32 bit builds with fedora
> >> * remove last traces of debian9
> >> * hotfix for centos8 powertools repo
>
> Given this might take awhile to get in and the fact I've got more fixes
> for regressions since Christmas I might as well include these in a only
> testing PR. I'm giving it a final run on the CI systems now before I
> send the email, tag for reference:
>
> : To github.com:stsquad/qemu.git
> :  * [new tag]               pull-testing-060121-3 -> pull-testing-060121=
-3
> : To gitlab.com:stsquad/qemu.git
> :  * [new tag]               pull-testing-060121-3 -> pull-testing-060121=
-3
> : pushed pull-testing-060121-3
>
> --
> Alex Benn=C3=A9e
>
>

--0000000000001c8c6105b83e4cce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have already sent the v3, so you may want to wait a day=
 or two. The good thing of conversion patches is that if they break somethi=
ng you can just drop them. :)<div dir=3D"auto"><br></div><div dir=3D"auto">=
Paolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Il mer 6 gen 2021, 17:56 Alex Benn=C3=A9e &lt;<a href=3D"mailto:=
alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritto:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><br>
Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bl=
ank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; On Mon, 4 Jan 2021 at 14:44, Paolo Bonzini &lt;<a href=3D"mailto:pbonz=
ini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a=
>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; The following changes since commit 41192db338588051f21501abc13743e=
62b0a5605:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/ehabkost-gl/=
tags/machine-next-pull-request&#39; into staging (2021-01-01 22:57:15 +0000=
)<br>
&gt;&gt;<br>
&gt;&gt; are available in the Git repository at:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/bonzini/qemu.git" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/bonzini/qemu.g=
it</a> tags/for-upstream<br>
&gt;&gt;<br>
&gt;&gt; for you to fetch changes up to bac87e979fcca9f884e1c9190132c51d99a=
86984:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0win32: drop fd registration to the main-loop on settin=
g non-block (2021-01-02 21:03:38 +0100)<br>
&gt;&gt;<br>
&gt;&gt; ----------------------------------------------------------------<b=
r>
&gt;&gt; From Alex&#39;s pull request:<br>
&gt;&gt; * improve cross-build KVM coverage<br>
&gt;&gt; * new --without-default-features configure flag<br>
&gt;&gt; * add __repr__ for ConsoleSocket for debugging<br>
&gt;&gt; * build tcg tests with -Werror<br>
&gt;&gt; * test 32 bit builds with fedora<br>
&gt;&gt; * remove last traces of debian9<br>
&gt;&gt; * hotfix for centos8 powertools repo<br>
<br>
Given this might take awhile to get in and the fact I&#39;ve got more fixes=
<br>
for regressions since Christmas I might as well include these in a only<br>
testing PR. I&#39;m giving it a final run on the CI systems now before I<br=
>
send the email, tag for reference:<br>
<br>
: To github.com:stsquad/qemu.git<br>
:=C2=A0 * [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p=
ull-testing-060121-3 -&gt; pull-testing-060121-3<br>
: To gitlab.com:stsquad/qemu.git<br>
:=C2=A0 * [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p=
ull-testing-060121-3 -&gt; pull-testing-060121-3<br>
: pushed pull-testing-060121-3<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div>

--0000000000001c8c6105b83e4cce--


