Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0333331CC8B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:01:49 +0100 (CET)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1rI-00026q-0r
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC1pn-0001N2-66
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:00:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC1pl-0005rZ-69
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613487612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WMgRvSw5ki0Whn1eocltqqKqNMozX15wokr2n/aJh/I=;
 b=UgMmX2OcGaeU3ZxZd9vE0VHKma7oYajDqz8BGVtvmPUVrgWBdY/zsHJi0mr06Uf/75Q+Ip
 j5xyzolyM+TlWKsmwFVImQoATjpORzq0MGOREvDf1d/Op/qgjD5KWEF6dDXHQTLLNA7meu
 KIvyP1u/wKCoMID9p5JoRuQrhAHECNQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-zPOvSorFPsiGdYPY50rATw-1; Tue, 16 Feb 2021 09:59:08 -0500
X-MC-Unique: zPOvSorFPsiGdYPY50rATw-1
Received: by mail-pf1-f198.google.com with SMTP id t13so10115721pfg.13
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WMgRvSw5ki0Whn1eocltqqKqNMozX15wokr2n/aJh/I=;
 b=bxfYkwpT1YTjryhrrwCCocwIAndq9yvgIHOb93R8oMC9mg3ow2Ob9t/+a+g2qjYXTB
 /NDGxfpNEmjoo37wIX7B57PcH/eqX1lO+x9JjnpCx8YDWLiMeFKEczw3Be69esvLcEou
 Pym5lOvW8xbd5Wf7z0nl2cgsevK4vsCqh6tsiwSzAzkZKGAB6XER5qRTNzPLEQ8EOYl9
 1fgTba1CgymVkIYwYgDUt9NUMwRr7Rxt62qyzgvBZBa5YiKQTS66prTLi3RComg23usS
 13N7bmQNZPDCoMaP1xEAr2G51RMoQXMF7CrrpT+A69WlnOPUnGzA92t9sMn54sKQIDqs
 8tDA==
X-Gm-Message-State: AOAM533IKAnN2m/dc2oJVRr6i8zVh9m5SG6UQkXE60WugXY843g84g/n
 kLYXpclh3e1Ja42Rt5MXbv1jEbPUenZX4jZuD9hRUIR3F+85EFBZ7GXhtDo3zZ8HmuxbqbZSdxq
 /7UlmbCsQQkE0LbtaBXDhy1GNGw4aaZ4=
X-Received: by 2002:aa7:99db:0:b029:1e1:fe8a:4948 with SMTP id
 v27-20020aa799db0000b02901e1fe8a4948mr20002295pfi.59.1613487547515; 
 Tue, 16 Feb 2021 06:59:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0Rx0JL6PhVt5iJ/hc5g31C8L7G04NN/2zM8rmgA2ix0y/4RK5ePxJ5z06V3U/rNxrfXBk+85JIL6wIMenQvU=
X-Received: by 2002:aa7:99db:0:b029:1e1:fe8a:4948 with SMTP id
 v27-20020aa799db0000b02901e1fe8a4948mr20002273pfi.59.1613487547227; Tue, 16
 Feb 2021 06:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
 <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
 <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
 <CAFEAcA8VCGmqbdLFLQ0R9Uun4MzxLTnOZExmYJZ65qZ_fjDUvg@mail.gmail.com>
 <f61447bf-f556-b626-4a6c-f86e724b0f7f@redhat.com>
 <CAFEAcA9G7CQDPb1QNaajwG5wSdND-E5nkTox1yEocdsBDsfc3g@mail.gmail.com>
 <9f9999eb-66a5-3fe4-64fe-41f64edb49ff@redhat.com>
 <CAFEAcA9c01xj0bGcKai-wOeR_c67+Uvcse1Xn=tbYRE7tjwhSw@mail.gmail.com>
 <CABgObfa+0zJdDvJPbX4j2+-cSU=BxVHTd5_U+mnbfYn7ct8qJw@mail.gmail.com>
 <CAFEAcA9G2eVMG3we5E6cyeY-qYt_y5JTt6qeBj+_p9eqLQARMg@mail.gmail.com>
In-Reply-To: <CAFEAcA9G2eVMG3we5E6cyeY-qYt_y5JTt6qeBj+_p9eqLQARMg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Feb 2021 15:58:55 +0100
Message-ID: <CABgObfYgEHVCsetmemzV44GjWdMqPA19aJuQn5fXwYDCvS29EQ@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001a3fa305bb755832"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001a3fa305bb755832
Content-Type: text/plain; charset="UTF-8"

Il mar 16 feb 2021, 15:52 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> > It's just an example that the prevalence of "nowait" over "wait" is
> simply because the default of "server" is false while the default of "wait"
> is true. Any boolean option whose default is true could benefit from a
> "no"-prefixed short form. But I am pretty sure that there are users in the
> wild for noipv4 or noipv6.
>
> I think 'nowait' is special only because for so long our documentation
> has recommended 'server,nowait' (and possibly also because inetd
> uses 'nowait'?). I don't think it's inherently much better than
> "wait=off" or whatever. I just think that if we have a situation
> where exactly 1 boolean option has very widespread use of 'nofoo' then
> it's worth special casing it.
>

If the point is just the one option that needs to be special cased because
it's in the documentation, that also applies at a higher level to -chardev:
let's just not warn for that one, and that's the end of the discussion.

Paolo


> -- PMM
>
>

--0000000000001a3fa305bb755832
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 16 feb 2021, 15:52 Peter Maydell &lt;<a href=3D=
"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">&gt; It&#39;s just an example t=
hat the prevalence of &quot;nowait&quot; over &quot;wait&quot; is simply be=
cause the default of &quot;server&quot; is false while the default of &quot=
;wait&quot; is true. Any boolean option whose default is true could benefit=
 from a &quot;no&quot;-prefixed short form. But I am pretty sure that there=
 are users in the wild for noipv4 or noipv6.<br>
<br>
I think &#39;nowait&#39; is special only because for so long our documentat=
ion<br>
has recommended &#39;server,nowait&#39; (and possibly also because inetd<br=
>
uses &#39;nowait&#39;?). I don&#39;t think it&#39;s inherently much better =
than<br>
&quot;wait=3Doff&quot; or whatever. I just think that if we have a situatio=
n<br>
where exactly 1 boolean option has very widespread use of &#39;nofoo&#39; t=
hen<br>
it&#39;s worth special casing it.<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">If the point is just the one option that n=
eeds to be special cased because it&#39;s in the documentation, that also a=
pplies at a higher level to -chardev: let&#39;s just not warn for that one,=
 and that&#39;s the end of the discussion.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--0000000000001a3fa305bb755832--


