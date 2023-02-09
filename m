Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516A16902C3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:03:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ2pH-0004EV-Hz; Thu, 09 Feb 2023 04:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ2pB-00047W-8e
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:02:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ2p9-0001hA-G8
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675933354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vWUCBTo1lMvvLcyS4H8yQ6avzslaXH9oPrjPRQxPTh8=;
 b=iGv1YwAL82yk07af9KcSvG2JWZHQG2ZsSp39uqumhcaHeqzbkRKKY+rtjpj6Y0n1NegdCg
 sofgctMa9iQ6rgsu82eMnuSL8nhn0J1+ulOm2Yy4wLsLS3HeRqMI70FaiV460x7b0JQGFV
 QqPxAorWInyBQHO2MXNna4/CZCeRtYo=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-Kh5L_l3CNSqvp-kCDHW-IA-1; Thu, 09 Feb 2023 04:02:31 -0500
X-MC-Unique: Kh5L_l3CNSqvp-kCDHW-IA-1
Received: by mail-vk1-f200.google.com with SMTP id
 o28-20020a056122179c00b00400dddd79c5so569689vkf.11
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 01:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vWUCBTo1lMvvLcyS4H8yQ6avzslaXH9oPrjPRQxPTh8=;
 b=7R1lPhusvd6YoLQCqIJhUy+i+YPk3JWJqSQzwHlJ1SRAIywt7OTdC+fBWPUWteybyj
 3vzPikP+5JTjHbRQ63+MFtliVhFBYg9O65QeMOZzmRJu7x925WleoSWwuSSEW3QYui8/
 RBzjMXTWks2gQR6Jpv6M/ES7psFXn5BrJvf6B4oMpc2Mrb4qqJ/Xhjp0KfYUTg+Cc9P/
 5aytRsKq7iLj+xjDpVCG2XreJFu/ZxXe3K1P2UIteuviyAJ+rJVWwtdGMmTBK91yohqA
 Y3JNUS4UyA1j38xvz/F4MF6ChwjK7R5uDTX2Uij7Jk08t1EKAZQhPZ0eOjORmsus6KI+
 qhww==
X-Gm-Message-State: AO0yUKWVxFh3Pik6Ib/Qqk7wikPke4OLJXFfF8xpKnm1313MSzHWCOKx
 W1jcqWRQ3eo+1nkq660YS1GlaUB3nGpgnBJ+t10c/NCbjx66z6YmA4L8iLhVAXd1WZkge+m1n9C
 vM/et2kxGHXJX6d9s+ADo9DvkQZsoi8U=
X-Received: by 2002:a1f:a101:0:b0:3ea:342a:dc34 with SMTP id
 k1-20020a1fa101000000b003ea342adc34mr2189482vke.19.1675933351144; 
 Thu, 09 Feb 2023 01:02:31 -0800 (PST)
X-Google-Smtp-Source: AK7set+O8WdVK4QKd/BHEhpNbLdzGfh4IEC8Y9cxS1mq7qyPhPUYnEfDXTZaMlhGWRN2yNwoO4OzEbD4Z3gIQwbqew8=
X-Received: by 2002:a1f:a101:0:b0:3ea:342a:dc34 with SMTP id
 k1-20020a1fa101000000b003ea342adc34mr2189480vke.19.1675933350831; Thu, 09 Feb
 2023 01:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20230208171922.95048-1-pbonzini@redhat.com>
 <95cab180-a34b-858d-e360-5083a7d7ecf8@redhat.com>
 <d6c35d9e-9a6c-4715-6532-4241e3d86a65@linaro.org>
In-Reply-To: <d6c35d9e-9a6c-4715-6532-4241e3d86a65@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Feb 2023 10:02:19 +0100
Message-ID: <CABgObfYf3+EHgi=P71+xJ-oeSgZtO61jH3wuD9xALSeGa73tNA@mail.gmail.com>
Subject: Re: [PULL 00/11] Misc patches for 2022-02-08
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000b441205f440a49f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

--0000000000000b441205f440a49f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah it's the same but it should use errp. Sorry to both of you!

Paolo

Il gio 9 feb 2023, 08:09 Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> ha
scritto:

> On 9/2/23 06:19, Thomas Huth wrote:
> > On 08/02/2023 18.19, Paolo Bonzini wrote:
> >> The following changes since commit
> >> ae2b5d8381a73b27f35f19c988d45c78bb4d5768:
> >>
> >>    Merge tag 'pull-include-2023-02-06-v2' of
> >> https://repo.or.cz/qemu/armbru into staging (2023-02-08 10:40:06 +0000=
)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >>
> >> for you to fetch changes up to e0de04cf9bd7cf03db16f33276679caf1724b75=
c:
> >>
> >>    target/i386: fix ADOX followed by ADCX (2023-02-08 18:16:55 +0100)
> >>
> >> ----------------------------------------------------------------
> >> * block/iscsi: fix double-free on BUSY or similar statuses
> >> * catch [accel] entry without accelerator
> >> * target/i386: various fixes for BMI and ADX instructions
> >> * make the contents of meson-buildoptions.sh stable
> >>
> >> ----------------------------------------------------------------
> >> Paolo Bonzini (8):
> >>        build: make meson-buildoptions.sh stable
> >>        remove unnecessary extern "C" blocks
> >>        block/iscsi: fix double-free on BUSY or similar statuses
> >>        vl: catch [accel] entry without accelerator
> >
> > You missed Philippe's review comment for that patch:
> >
> >
> https://lore.kernel.org/qemu-devel/8ec3abf5-f4aa-db40-cb7e-2f5733d93de3@l=
inaro.org/
>
> I interpreted "no response" as "the result is the same".
>
>

--0000000000000b441205f440a49f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Yeah it&#39;s the same but it should us=
e errp. Sorry to both of you!</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Paolo</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Il gio 9 feb 2023, 08:09 Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@linaro.org" target=3D"_blank" rel=3D"noreferrer">philmd@l=
inaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 9/=
2/23 06:19, Thomas Huth wrote:<br>
&gt; On 08/02/2023 18.19, Paolo Bonzini wrote:<br>
&gt;&gt; The following changes since commit <br>
&gt;&gt; ae2b5d8381a73b27f35f19c988d45c78bb4d5768:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 Merge tag &#39;pull-include-2023-02-06-v2&#39; of <br=
>
&gt;&gt; <a href=3D"https://repo.or.cz/qemu/armbru" rel=3D"noreferrer noref=
errer noreferrer" target=3D"_blank">https://repo.or.cz/qemu/armbru</a> into=
 staging (2023-02-08 10:40:06 +0000)<br>
&gt;&gt;<br>
&gt;&gt; are available in the Git repository at:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 <a href=3D"https://gitlab.com/bonzini/qemu.git" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://gitlab.com/=
bonzini/qemu.git</a> tags/for-upstream<br>
&gt;&gt;<br>
&gt;&gt; for you to fetch changes up to e0de04cf9bd7cf03db16f33276679caf172=
4b75c:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 target/i386: fix ADOX followed by ADCX (2023-02-08 18=
:16:55 +0100)<br>
&gt;&gt;<br>
&gt;&gt; ----------------------------------------------------------------<b=
r>
&gt;&gt; * block/iscsi: fix double-free on BUSY or similar statuses<br>
&gt;&gt; * catch [accel] entry without accelerator<br>
&gt;&gt; * target/i386: various fixes for BMI and ADX instructions<br>
&gt;&gt; * make the contents of meson-buildoptions.sh stable<br>
&gt;&gt;<br>
&gt;&gt; ----------------------------------------------------------------<b=
r>
&gt;&gt; Paolo Bonzini (8):<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build: make meson-buildoption=
s.sh stable<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remove unnecessary extern &qu=
ot;C&quot; blocks<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 block/iscsi: fix double-free =
on BUSY or similar statuses<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vl: catch [accel] entry witho=
ut accelerator<br>
&gt; <br>
&gt; You missed Philippe&#39;s review comment for that patch:<br>
&gt; <br>
&gt; <a href=3D"https://lore.kernel.org/qemu-devel/8ec3abf5-f4aa-db40-cb7e-=
2f5733d93de3@linaro.org/" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://lore.kernel.org/qemu-devel/8ec3abf5-f4aa-db40-cb7e-2f57=
33d93de3@linaro.org/</a><br>
<br>
I interpreted &quot;no response&quot; as &quot;the result is the same&quot;=
.<br>
<br>
</blockquote></div></div>

--0000000000000b441205f440a49f--


