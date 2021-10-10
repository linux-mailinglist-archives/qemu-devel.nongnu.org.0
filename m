Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A17428353
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 21:26:57 +0200 (CEST)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZeTH-0007Vb-PK
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 15:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mZeSC-0006j0-Ue
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 15:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mZeS9-0005Zy-20
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 15:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633893943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oYnvM5MoqSwWGcAo0emAXmtl8tYwfm1WB3v32Uo28B4=;
 b=ai8XS0rNYHeOk0RCtHQ6wV5mithXzfRHxXOcH27g5BmVwC3hMx5tnHMTSIlchIKcrvE0zg
 VfL6kn3dN3A7YMu0jj8ZSMQztvvRRAbT2cfYHRgh/AVxkoq6VAZnKVjpsld4zomid95wQQ
 czRYRQ1EKOh+yEiINoR+duhGtaGzNJE=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-lm2rPRiJPUqoA8pRKYkVuA-1; Sun, 10 Oct 2021 15:25:30 -0400
X-MC-Unique: lm2rPRiJPUqoA8pRKYkVuA-1
Received: by mail-pg1-f198.google.com with SMTP id
 s19-20020a63e813000000b00287d976d152so5783428pgh.3
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 12:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oYnvM5MoqSwWGcAo0emAXmtl8tYwfm1WB3v32Uo28B4=;
 b=jV8zgla/HlPUxYbL3dCGTqa0hrhUfCemUA1eImNkgfV0fYbrR1bYmlvcVtnKjsUbNR
 1rTYnzWlmh2+cQf09dcP6CXipnQEln0N4B2ZTP/kOtefKHy4jIZ/OckTJDiHKbcTOy+c
 eG6yXhDXqZAegBy52FIQDAAldRWctg8R3JEO9K9nyE0tMpZwffldEJgAwIZMEiXPuOrj
 xSyt5ZdAelSMOhEcwFJmvVMytSAkEfmBfHqj4JZUojwkmywvzyE5vLMYFJ2OnwGtlCaO
 e3J2Gi3JGn+TNS1sRt+jpKFKQw/wr55lIRc3zdDcYvoXPVEfrfci97xH4pBk7MWjbn5U
 wjbQ==
X-Gm-Message-State: AOAM532Dgn2ajL4vGQwuF7e4T1brTUSBb93b7s8Wu7oUzKWEU+iRdicT
 ojFQU+D17x477JDiXovb3sKT/zhVrqVyVcbk8oNt/hOfAWdRPjcnEieduyRWdn8/5ASefyqT2nO
 O+bK2BIU7IK0BYJlg8Eiv6k8WXwdmGwE=
X-Received: by 2002:a62:6d07:0:b0:446:c141:7d2d with SMTP id
 i7-20020a626d07000000b00446c1417d2dmr21339465pfc.28.1633893929102; 
 Sun, 10 Oct 2021 12:25:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb+7M7wHHohhe/6m1j6vKYEkCUZ25lmY8zAccHplSmQdEejoKdqBS3ZgIHtDtqBfHvVV/i9bHRO27p83AgZZ0=
X-Received: by 2002:a62:6d07:0:b0:446:c141:7d2d with SMTP id
 i7-20020a626d07000000b00446c1417d2dmr21339445pfc.28.1633893928632; Sun, 10
 Oct 2021 12:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <ada1704c-b1c7-ec48-bc58-2de8d3ed466c@redhat.com>
 <E9594914-E417-4F3B-8352-91D0A40E7E70@gmail.com>
In-Reply-To: <E9594914-E417-4F3B-8352-91D0A40E7E70@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 10 Oct 2021 21:25:16 +0200
Message-ID: <CABgObfZvicuKLqkDqK3a4zn92LRiC_g--_oT-7sPgTO3O1PrAQ@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
To: =?UTF-8?Q?Pedro_T=C3=B4rres?= <t0rr3sp3dr0@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000037a22105ce049341"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, rene@exactcode.de, "Kiszka,
 Jan" <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>, "Graf,
 Alexander" <agraf@suse.de>, "Gabriel L. Somlo" <gsomlo@gmail.com>,
 suse@csgraf.de, afaerber <afaerber@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000037a22105ce049341
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you instead provide documentation in English (pseudocode, tables of the
structs, etc.)? That's the safest bet.

Paolo

El s=C3=A1b., 9 oct. 2021 7:32, Pedro T=C3=B4rres <t0rr3sp3dr0@gmail.com> e=
scribi=C3=B3:

> Hey Paolo and Phil,
>
> I understand you concerns regarding the license that Apple open-source
> code is distributed.
>
> If I restart from scratch and implement this feature based only on
> VirtualBox code, that is distributed under GPLv2, would it be fine?
>
> Best regards,
> Pedro T=C3=B4rres
>
> On Oct 8, 2021, at 3:54 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> =EF=BB=BFOn 08/10/21 14:03, Phil Dennis-Jordan wrote:
>
> 1. Licensing
>
> Given that the code it's heavily based on is copyright Apple Computer
> Inc., licensed under APSL, is it safe including it in qemu as is?
>
> If the integrated code is going to be quite so "directly inspired" (down
> to the inconsistent struct definition style and mixing unrelated constant=
s
> in the same anonymous enum), perhaps at minimum place it in its own
> isolated source file with appropriate notice?
>
>
> Yeah, this should be reverted.
>
> Pedro, I understand that you stated it was "based on code from Apple" but
> you also said (by including Signed-off-by) that
>
> ---
> (a) The contribution was created in whole or in part by me and I
>    have the right to submit it under the open source license
>    indicated in the file; or
>
> (b) The contribution is based upon previous work that, to the best
>    of my knowledge, is covered under an appropriate open source
>    license and I have the right under that license to submit that
>    work with modifications, whether created in whole or in part
>    by me, under the same open source license (unless I am
>    permitted to submit under a different license), as indicated
>    in the file; or
> ---
>
> and this is not true.
>
> Thanks very much,
>
> Paolo
>
>

--00000000000037a22105ce049341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you instead provide documentation in English (pseudoc=
ode, tables of the structs, etc.)? That&#39;s the safest bet.<div dir=3D"au=
to"><br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">El s=C3=A1b., 9 oct. 2021 7:32, =
Pedro T=C3=B4rres &lt;<a href=3D"mailto:t0rr3sp3dr0@gmail.com">t0rr3sp3dr0@=
gmail.com</a>&gt; escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"auto"><div dir=3D"ltr"><div dir=3D"ltr">Hey Paolo and Phil,</div>=
<div dir=3D"ltr"><br></div><div dir=3D"ltr">I understand you concerns regar=
ding the license that Apple open-source code is distributed.</div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">If I restart from scratch and implement=
 this feature based only on VirtualBox code, that is distributed under GPLv=
2, would it be fine?<br><br><div dir=3D"ltr">Best regards,</div><div id=3D"=
m_-5353019571681975835AppleMailSignature" dir=3D"ltr">Pedro T=C3=B4rres</di=
v><div dir=3D"ltr"><br><blockquote type=3D"cite">On Oct 8, 2021, at 3:54 PM=
, Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank=
" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; wrote:<br><br></blockquote=
></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On 08/10/2=
1 14:03, Phil Dennis-Jordan wrote:</span><br><blockquote type=3D"cite"><spa=
n>1. Licensing</span><br></blockquote><blockquote type=3D"cite"><span>Given=
 that the code it&#39;s heavily based on is copyright Apple Computer Inc., =
licensed under APSL, is it safe including it in qemu as is?</span><br></blo=
ckquote><blockquote type=3D"cite"><span>If the integrated code is going to =
be quite so &quot;directly inspired&quot; (down to the inconsistent struct =
definition style and mixing unrelated constants in the same anonymous enum)=
, perhaps at minimum place it in its own isolated source file with appropri=
ate notice?</span><br></blockquote><span></span><br><span>Yeah, this should=
 be reverted.</span><br><span></span><br><span>Pedro, I understand that you=
 stated it was &quot;based on code from Apple&quot; but you also said (by i=
ncluding Signed-off-by) that</span><br><span></span><br><span>---</span><br=
><span>(a) The contribution was created in whole or in part by me and I</sp=
an><br><span> =C2=A0=C2=A0=C2=A0have the right to submit it under the open =
source license</span><br><span> =C2=A0=C2=A0=C2=A0indicated in the file; or=
</span><br><span></span><br><span>(b) The contribution is based upon previo=
us work that, to the best</span><br><span> =C2=A0=C2=A0=C2=A0of my knowledg=
e, is covered under an appropriate open source</span><br><span> =C2=A0=C2=
=A0=C2=A0license and I have the right under that license to submit that</sp=
an><br><span> =C2=A0=C2=A0=C2=A0work with modifications, whether created in=
 whole or in part</span><br><span> =C2=A0=C2=A0=C2=A0by me, under the same =
open source license (unless I am</span><br><span> =C2=A0=C2=A0=C2=A0permitt=
ed to submit under a different license), as indicated</span><br><span> =C2=
=A0=C2=A0=C2=A0in the file; or</span><br><span>---</span><br><span></span><=
br><span>and this is not true.</span><br><span></span><br><span>Thanks very=
 much,</span><br><span></span><br><span>Paolo</span><br><span></span><br></=
div></blockquote></div></div></div></blockquote></div>

--00000000000037a22105ce049341--


