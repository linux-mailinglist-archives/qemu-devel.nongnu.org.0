Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FEC464F9F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 15:27:58 +0100 (CET)
Received: from localhost ([::1]:35362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msQaS-0005nF-Js
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 09:27:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@habkost.com>)
 id 1msPzt-0005xr-Vi
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:50:12 -0500
Received: from [2607:f8b0:4864:20::335] (port=36512
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ehabkost@habkost.com>)
 id 1msPzp-0001tK-W3
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:50:08 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so35190273otl.3
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 05:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=habkost-com.20210112.gappssmtp.com; s=20210112;
 h=from:mime-version:references:in-reply-to:date:message-id:subject:to
 :cc; bh=HERcxf+JQbuJMOyTDwaCDCfeNDP+LLpXnFt8RmSbGAw=;
 b=L/9Who9zZQ5FMQW31tYqTBDPwv8ueCSdbcHj/Ywasm3YgE6nytQ8rJ5bGesHeg6IsY
 oTPSy12+v07PZk53O6NZ+FYfY4C9/KPVOWu5JR+DzuxDhp7Uz5cYAhAdRexkLsDS+LEg
 3/POr4RxbA+QeaOkPDVW2zzYXLMmI8hfacKo+UbacDgKQTXEZY9T2G3eAAeMz1xKhi4z
 WM2W5iw6BpLqDlJpuzcyIyjCx7fWzAPUD1fZWE9VCEEucoxVYPPQBGQ18Wp2oWbRAvYn
 nff9/rVMgUeCz7XBMJm3u0gqwk+82Ve2ePhxnay1ungTpMgIsB5WgtqXIrvvhMYhgEZq
 gNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:references:in-reply-to:date
 :message-id:subject:to:cc;
 bh=HERcxf+JQbuJMOyTDwaCDCfeNDP+LLpXnFt8RmSbGAw=;
 b=tA5VRfLd2dsy+k9AkjYmJ9HbAiSHm39Spkuo5nYan9japFJlUKWWxjPgj8zkYU/oBs
 auGCn0MoXaCYbLshT4VGGcaljjwW6McNSmiRvnyprgc1yg2wvxa5lEG6OGhHOWpf5xwR
 wrPuoxaeFK1ZQ+BLqcMwrNZEYbiGuDgfEhRNPHH7sLP3aDvPUDabqmBdwZaYZzt8Mt8C
 aIt+bM3lRvQ4lPEqAP1tjN4mur0ey5i00LTZpk2KeDprWKYV37L5v9Lqrlcznbxc8Im5
 5E7/6Eu8nMqi4qO8len44rwH4CD/ZozIyBGFNQX6LCNO+g+qzgEWZqeJA8JtEi/VQAeV
 XVOg==
X-Gm-Message-State: AOAM530VODiRG1RQe89ohJkm2GsdDs2WhBNo3wJcckpLU+WxAM22ipdk
 l7lIFHoMBTNFECSdM74OvsiyItO5dXzZPcFb
X-Google-Smtp-Source: ABdhPJz3hfblnZiVQLEzbA97bVhFBTr8hktfaIDIF3LkDmxrm1OQnQN0yG5BPujYT4qnIQB5ailJVA==
X-Received: by 2002:a05:6830:44a4:: with SMTP id
 r36mr5627719otv.365.1638366602716; 
 Wed, 01 Dec 2021 05:50:02 -0800 (PST)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com.
 [209.85.167.170])
 by smtp.gmail.com with ESMTPSA id r23sm3274204ooj.37.2021.12.01.05.50.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 05:50:01 -0800 (PST)
From: Eduardo Habkost <ehabkost@habkost.com>
X-Google-Original-From: Eduardo Habkost <eduardo@habkost.net>
Received: by mail-oi1-f170.google.com with SMTP id o4so48609234oia.10
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 05:50:00 -0800 (PST)
X-Received: by 2002:aca:d0d:: with SMTP id 13mr5993767oin.107.1638366600137;
 Wed, 01 Dec 2021 05:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20211130204722.2732997-1-ehabkost@redhat.com>
 <03cee1da-334b-bd1e-ff38-84b40f3077d9@linaro.org>
In-Reply-To: <03cee1da-334b-bd1e-ff38-84b40f3077d9@linaro.org>
Date: Wed, 1 Dec 2021 08:49:48 -0500
X-Gmail-Original-Message-ID: <CAFszQJgdGo4QWOd-wL7UEc=UK=TAb_F5tkYdhNafCo4kBkFJmQ@mail.gmail.com>
Message-ID: <CAFszQJgdGo4QWOd-wL7UEc=UK=TAb_F5tkYdhNafCo4kBkFJmQ@mail.gmail.com>
Subject: Re: [PULL 0/1] MAINTAINERS update
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000036954705d215f346"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=ehabkost@habkost.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Dec 2021 09:25:31 -0500
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000036954705d215f346
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 1, 2021 at 01:19 Richard Henderson <richard.henderson@linaro.org>
wrote:

> On 11/30/21 9:47 PM, Eduardo Habkost wrote:
> > * MAINTAINERS: Change my email address (Eduardo Habkost)
> >
> > Eduardo Habkost (1):
> >    MAINTAINERS: Change my email address
> >
> >   MAINTAINERS | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
>
> Not a pull request.  But since it's just one patch that needs no
> regression testing, I
> have applied it directly.


Oops! I was in a hurry and used the wrong git-publish options, sorry about
that, and thanks for applying it.

--00000000000036954705d215f346
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div><div dir=3D"auto">On Wed, Dec 1, 2021 at 01:19 Richard Hende=
rson &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">=
richard.henderson@linaro.org</a>&gt; wrote:<br></div></div></div><div><div>=
<div><div class=3D"gmail_quote"></div></div></div></div><div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)">On 11/30/21 9:47 PM, Eduardo Habkost wrote:<br>
&gt; * MAINTAINERS: Change my email address (Eduardo Habkost)<br>
&gt; <br>
&gt; Eduardo Habkost (1):<br>
&gt;=C2=A0 =C2=A0 MAINTAINERS: Change my email address<br>
&gt; <br>
&gt;=C2=A0 =C2=A0MAINTAINERS | 12 ++++++------<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt; <br>
<br>
Not a pull request.=C2=A0 But since it&#39;s just one patch that needs no r=
egression testing, I <br>
have applied it directly.</blockquote><div dir=3D"auto"><br></div></div></d=
iv><div><div><div dir=3D"auto"><span style=3D"border-color:rgb(0,0,0);color=
:rgb(0,0,0)">Oops! I was in a hurry and used the wrong git-publish options,=
 sorry about that, and thanks for applying it.</span></div><div dir=3D"auto=
"><span style=3D"border-color:rgb(0,0,0);color:rgb(0,0,0)"><br></span></div=
>

</div>
</div>

--00000000000036954705d215f346--

