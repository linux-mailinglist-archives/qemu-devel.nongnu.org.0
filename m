Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE375BF1A1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:02:13 +0200 (CEST)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanBs-0006KB-O2
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oalF9-0004sP-PA
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 17:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oalF6-0001MP-7t
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 17:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663711042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UftrdHXDFKaNR+kJvmf6idcZWHnly2d42YJRa2mWIQ4=;
 b=T2Bl7fCzcPeaYeBYtt8fKTrO1fqyb86lFCChu3Wyrs/39894NESRT0c465YlZ8LEYCFXIq
 dU+y3b4mhZT1wK8gfaUPBCWrOuD2FnyQUgqPjwy7L4sGrNf4fnktPPfbEWpsLsbNpnsgsl
 Rt1Ui5wzAs5n4uD5ivSWncPWhSFnEBg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-185-bVvp-x-2Pxq9v-H7QJP8_g-1; Tue, 20 Sep 2022 17:57:20 -0400
X-MC-Unique: bVvp-x-2Pxq9v-H7QJP8_g-1
Received: by mail-qk1-f199.google.com with SMTP id
 l15-20020a05620a28cf00b006b46997c070so3030331qkp.20
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 14:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UftrdHXDFKaNR+kJvmf6idcZWHnly2d42YJRa2mWIQ4=;
 b=TZ9ref48BgtsUQBFH5Kc0/qhRjRWqoULKbhRNldukEqGLuZ/QJ7e4MX2shDnOw4Ca9
 NedGtXFrNU/tDsVB9gw/NGWxbN+i7XTazx2J70Y1ij6YLlxpFJTDLL09UUN/EszDj9IA
 0r43IKoEXEZN1z1VMXgnoui5Nxx78k5ncO8Z5Iey4xQqRXBFHhmBgU5aTHlcp6+kev6j
 9Q7PSMDkVMyd70t8UJCmjU5UO2daiNMZA6CLRLN1UgvpFC8uLJ6q/ygl7wzFUj1QqRBp
 cjpq5pTfNAsLZdwqwIY9JnZXtaFgI1WIswi+sGj2E5GP7ZjIx/g3jpanL5Q2994vF6V2
 CzlA==
X-Gm-Message-State: ACrzQf2PCCFw9Gw9A41u6p+S3+OYT8HEHOk4SjXOHJl9MPV8X8hnaR/6
 bYqu8q6uN66pl0RK+LGAuD1Lg6e7r3yuXtrPGmCGA2oS89n6mtT+G5RHcyNBZXGsnU8LYWqBhEk
 yKzS4+1Xfu0UMvP7hLWkBx75q5NH6WJM=
X-Received: by 2002:a05:622a:1755:b0:35b:a3ad:6283 with SMTP id
 l21-20020a05622a175500b0035ba3ad6283mr20833729qtk.422.1663711040364; 
 Tue, 20 Sep 2022 14:57:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Wmpjt5J2JiZOpVn1TQ6yWgz0IEOiA/q6Ay7JvuKnv/zShRjraS8IbAXznFymqvhrNWxAwls4b0IxAByznRVw=
X-Received: by 2002:a05:622a:1755:b0:35b:a3ad:6283 with SMTP id
 l21-20020a05622a175500b0035ba3ad6283mr20833720qtk.422.1663711040106; Tue, 20
 Sep 2022 14:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220919134126.75656-1-pbonzini@redhat.com>
 <CAHmME9rkethn5PHDkB8CupEBOYWFnzfA9c_YkmB_YMt64ci3pQ@mail.gmail.com>
 <Yyooji0KGTpZxzL1@zx2c4.com>
In-Reply-To: <Yyooji0KGTpZxzL1@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 20 Sep 2022 23:57:09 +0200
Message-ID: <CABgObfZyb6t5iTMvXu+VfKx27dXDt1_RnPuL2tvK74evL0138Q@mail.gmail.com>
Subject: Re: [PATCH] qboot: update to latest submodule
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Hajnoczi, Stefan" <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008e07fd05e922e9c3"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000008e07fd05e922e9c3
Content-Type: text/plain; charset="UTF-8"

It should have been automatic, there's mirroring set up.

Paolo

Il mar 20 set 2022, 23:00 Jason A. Donenfeld <Jason@zx2c4.com> ha scritto:

> On Mon, Sep 19, 2022 at 04:35:54PM +0200, Jason A. Donenfeld wrote:
> > FYI, that commit made it to:
> >
> > https://github.com/bonzini/qboot
> >
> > But wasn't pushed to:
> >
> > https://github.com/qemu/qboot
> > https://gitlab.com/qemu-project/qboot
> > https://git.qemu.org/?p=qboot.git;a=summary
> >
> > I have no idea what's canonical, except that the submodule in the qemu
> > checkout seems to point to the gitlab instance.
> >
>
> With my prior email being ignored, this played out exactly as I
> predicted it would:
>
> Fetching submodule roms/qboot
> fatal: remote error: upload-pack: not our ref
> 8ca302e86d685fa05b16e2b208888243da319941
> Errors during submodule fetch:
>         roms/qboot
>
> Can somebody push https://github.com/bonzini/qboot to
> https://gitlab.com/qemu-project/qboot please? It will only take a
> second.
>
> Thanks,
> Jason
>
>

--0000000000008e07fd05e922e9c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It should have been automatic, there&#39;s mirroring set =
up.<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 20 set 2=
022, 23:00 Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@=
zx2c4.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mo=
n, Sep 19, 2022 at 04:35:54PM +0200, Jason A. Donenfeld wrote:<br>
&gt; FYI, that commit made it to:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/bonzini/qboot" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://github.com/bonzini/qboot</a><br>
&gt; <br>
&gt; But wasn&#39;t pushed to:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/qemu/qboot" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://github.com/qemu/qboot</a><br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qboot" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://gitlab.com/qemu-project/qboot</a><br>
&gt; <a href=3D"https://git.qemu.org/?p=3Dqboot.git;a=3Dsummary" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://git.qemu.org/?p=3Dqboot.git;a=
=3Dsummary</a><br>
&gt; <br>
&gt; I have no idea what&#39;s canonical, except that the submodule in the =
qemu<br>
&gt; checkout seems to point to the gitlab instance.<br>
&gt; <br>
<br>
With my prior email being ignored, this played out exactly as I<br>
predicted it would:<br>
<br>
Fetching submodule roms/qboot<br>
fatal: remote error: upload-pack: not our ref 8ca302e86d685fa05b16e2b208888=
243da319941<br>
Errors during submodule fetch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 roms/qboot<br>
<br>
Can somebody push <a href=3D"https://github.com/bonzini/qboot" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://github.com/bonzini/qboot</a> to=
<br>
<a href=3D"https://gitlab.com/qemu-project/qboot" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://gitlab.com/qemu-project/qboot</a> please? It=
 will only take a<br>
second.<br>
<br>
Thanks,<br>
Jason<br>
<br>
</blockquote></div>

--0000000000008e07fd05e922e9c3--


