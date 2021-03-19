Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781F33423B9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 18:54:05 +0100 (CET)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJK0-0000sv-9m
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 13:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNJIy-0000QT-4L
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNJIv-0008RV-IB
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616176376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9nQxIRGGfJtXG6JcIdCAR30qr1vG75wlX1zJo93u3Zk=;
 b=O6Oq9tNM01ict6v+eGC1WobVd6TcFDS7QuRC1Nct/qEOET99irZVMFjDagzT3J5jFKmN4F
 iXNFDiOOtTcZu+8rHkJXV78DVt9NicfCs0/FO2Bifl7f1xsLtQnoziB16DMZznh12LC2oI
 HIqaI1wp8kyybvnz8H8X2NYg7M0KmSU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-0szIgXP3OhKUvrbr_ntkBg-1; Fri, 19 Mar 2021 13:52:53 -0400
X-MC-Unique: 0szIgXP3OhKUvrbr_ntkBg-1
Received: by mail-pf1-f198.google.com with SMTP id t16so5954470pfg.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 10:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9nQxIRGGfJtXG6JcIdCAR30qr1vG75wlX1zJo93u3Zk=;
 b=P3wj1WlyS28auWg28I2YP8ftxpnHgrbWtXZkAZmOMLK20wh6jEkoTpY/0F/RE1OW8e
 gKEUKRnrcQEgGGJ2brfYLsXT9hPWeMmQ62FfpweoA468oVXAia9ADhOt4mtJUrEJ0wCu
 fAVZPDf8esXqrlNbWuO/ClnI1f+lNXIfF396fWYUGUDf1mYMOaGnnqzYoc24M+TAnnkQ
 LpAQa+pTYd8uLp82jUHGOTavpebm8kuggh01meF9MX9AM7/8Re+L+m+J8oSkUDVDEt33
 TIDXhjlGNpe2Yz3/LNaFPIohqYFym6tJzpPfQBK/8M+BLefIG05IBxIERzClLBP+avLV
 TL8g==
X-Gm-Message-State: AOAM532zH+giOodAqdvK8j/K4TSqDx/OEgJlK7nBPQKJrPcFI5lcYwBb
 MRBLjTv1jdrMmc5AKW2Mc1osq7Q/yq/xUq1+13Iar76DejLs6EbOaHesh1/uIxHLWFuZxlN61Q5
 zcXdvYYq9+JtsEWLOlISCU87XuKsP7Cw=
X-Received: by 2002:a05:6a00:78c:b029:1f5:d587:1701 with SMTP id
 g12-20020a056a00078cb02901f5d5871701mr10207612pfu.59.1616176372630; 
 Fri, 19 Mar 2021 10:52:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypDKcCWNl0X+3d9fUWVVVAFYi07KbdD+Agh8xKXuQO0IKYM9CJUew1AyH7Gqk6WmMU4ryQtffqtf4XKUJ+gcg=
X-Received: by 2002:a05:6a00:78c:b029:1f5:d587:1701 with SMTP id
 g12-20020a056a00078cb02901f5d5871701mr10207593pfu.59.1616176372362; Fri, 19
 Mar 2021 10:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
 <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
 <20210319173524.rnrxslpmdjck6uxv@steredhat>
In-Reply-To: <20210319173524.rnrxslpmdjck6uxv@steredhat>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 19 Mar 2021 18:52:39 +0100
Message-ID: <CABgObfZHP1aSMpbdWh6TwCN_D5gy5TS5+Q7-La8d7E5czvn7Rg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000091d0d505bde762ea"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000091d0d505bde762ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's likely that the compiler will online it. But indeed it's better to add
-minline-all-stringops to the compiler command line.

Paolo

Il ven 19 mar 2021, 18:35 Stefano Garzarella <sgarzare@redhat.com> ha
scritto:

> On Fri, Mar 19, 2021 at 06:03:59PM +0100, Paolo Bonzini wrote:
> >On 19/03/21 15:06, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>+
> >>>+/* Search RSDP signature. */
> >>>+static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
> >>>+{
> >>>+    uint64_t *rsdp_p;
> >>>+
> >>>+    /* RSDP signature is always on a 16 byte boundary */
> >>>+    for (rsdp_p =3D (uint64_t *)start_addr; rsdp_p < (uint64_t
> *)end_addr;
> >>>+         rsdp_p +=3D 2) {
> >>>+        if (*rsdp_p =3D=3D RSDP_SIGNATURE) {
> >>>+            return (uintptr_t)rsdp_p;
> >>>+        }
> >>>+    }
> >>>+
> >>>+    return 0;
> >>>+}
> >>gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:
> >>
> >>pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
> >>pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
> >>due to limited range of data type [-Wtype-limits]
> >>    61 |         if (*rsdp_p =3D=3D RSDP_SIGNATURE) {
> >>       |                     ^~
> >
> >This is probably a different bug, but I'll also add that uint64_t is
> >supposed to be aligned to 64 bits, so you need either
> >__attribute__((packed)), or use char* and memcmp.  If you go for the
> >latter, it would fix the issue that Philippe is reporting.
>
> Yes, memcmp maybe is also more readable, but being baremetal, I have to
> implement it right?
>
> Thanks,
> Stefano
>
>

--00000000000091d0d505bde762ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It&#39;s likely that the compiler will online it. But ind=
eed it&#39;s better to add -minline-all-stringops to the compiler command l=
ine.<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il ven 19 mar =
2021, 18:35 Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com">s=
garzare@redhat.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On Fri, Mar 19, 2021 at 06:03:59PM +0100, Paolo Bonzini wrote:<br>
&gt;On 19/03/21 15:06, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt;&gt;+<br>
&gt;&gt;&gt;+/* Search RSDP signature. */<br>
&gt;&gt;&gt;+static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end=
_addr)<br>
&gt;&gt;&gt;+{<br>
&gt;&gt;&gt;+=C2=A0 =C2=A0 uint64_t *rsdp_p;<br>
&gt;&gt;&gt;+<br>
&gt;&gt;&gt;+=C2=A0 =C2=A0 /* RSDP signature is always on a 16 byte boundar=
y */<br>
&gt;&gt;&gt;+=C2=A0 =C2=A0 for (rsdp_p =3D (uint64_t *)start_addr; rsdp_p &=
lt; (uint64_t *)end_addr;<br>
&gt;&gt;&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rsdp_p +=3D 2) {<br>
&gt;&gt;&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*rsdp_p =3D=3D RSDP_SIGNATURE)=
 {<br>
&gt;&gt;&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (uintptr_t)rs=
dp_p;<br>
&gt;&gt;&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;+=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;+<br>
&gt;&gt;&gt;+=C2=A0 =C2=A0 return 0;<br>
&gt;&gt;&gt;+}<br>
&gt;&gt;gcc 10.2.1 &quot;cc (Alpine 10.2.1_pre2) 10.2.1 20210313&quot; repo=
rts:<br>
&gt;&gt;<br>
&gt;&gt;pc-bios/optionrom/pvh_main.c: In function &#39;search_rsdp&#39;:<br=
>
&gt;&gt;pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always f=
alse<br>
&gt;&gt;due to limited range of data type [-Wtype-limits]<br>
&gt;&gt;=C2=A0 =C2=A0 61 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*rsdp_p =3D=
=3D RSDP_SIGNATURE) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>
&gt;<br>
&gt;This is probably a different bug, but I&#39;ll also add that uint64_t i=
s <br>
&gt;supposed to be aligned to 64 bits, so you need either <br>
&gt;__attribute__((packed)), or use char* and memcmp.=C2=A0 If you go for t=
he <br>
&gt;latter, it would fix the issue that Philippe is reporting.<br>
<br>
Yes, memcmp maybe is also more readable, but being baremetal, I have to <br=
>
implement it right?<br>
<br>
Thanks,<br>
Stefano<br>
<br>
</blockquote></div>

--00000000000091d0d505bde762ea--


