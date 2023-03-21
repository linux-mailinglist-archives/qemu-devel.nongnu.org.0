Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87A6C2FB0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 11:59:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZgW-00084P-QA; Tue, 21 Mar 2023 06:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peZgS-00084B-32
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peZgQ-0007HW-6a
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679396255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SGaQfEfu5XebyvZfQDHvSftBcJF+kjP3M4pc8qGGyEs=;
 b=MkxliANEJnE+SCEZNKF5N9uHxq9RwAy0dfKZItda8x8wlONBRYjXDu/JmWkiKS+wxjNUXb
 ocU68o0Ilca4N+d13v1rUmU6xXsP4D9OxnD6aDgtpZWe45UpMe7x780tw89K3svOXHuEZs
 2wXzjWCl2BcFEnsr1dxc3GruNZsYn3I=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-ffYIM6XhMRGYomU_VBKILA-1; Tue, 21 Mar 2023 06:57:34 -0400
X-MC-Unique: ffYIM6XhMRGYomU_VBKILA-1
Received: by mail-vs1-f71.google.com with SMTP id
 z8-20020a67d288000000b00425d16237c4so3556834vsi.19
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 03:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679396253;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SGaQfEfu5XebyvZfQDHvSftBcJF+kjP3M4pc8qGGyEs=;
 b=6cmpVduq5Pt9L1iyW6Er0++vqPWmsW+YL5hWoLDM1j4NdwQfE0bJI31QyyrOGO3lwD
 YNKfwrz3ci73E8/mbEu/PUxLoN/1J8q4M48oJ9+xUzRV+yvQef1j9+NE6Jr718k3z428
 q1QlZOIMDqqs3mT9A9VwyDlVsqZK3iZZtlF+FR3603Z0x9gwcV5YbeseTz+st3ehmXQV
 /t2BnW5O8o0ZhWhttwfU/Rzw6S0e7zxPRukWlROYT7Xv/zcjo2Nt0BJ8/Fc5oCy/dKRu
 pRooUsS1ooJ1M/KQhXGAMqpU6sKgkwCTMdtXFvpqL2u6CT1ioKCBDynO9b00NH6r9fKf
 nRbQ==
X-Gm-Message-State: AO0yUKWQXwRpvQAbA4W0emPuFCmNgtSKvkl8VYm6nNDukyZNxtXD8Ynx
 lBMYPtYEAqun4tVOpYnN2KH09UxQsH4fhxGMHNo/Hx7MWtTsW54/2mBQNkx9dXpKEOa4d1HC5zt
 JVbLwcWEAkJQvf6idYaCjagmrExvrQus=
X-Received: by 2002:a67:d29b:0:b0:425:e623:360a with SMTP id
 z27-20020a67d29b000000b00425e623360amr1252703vsi.1.1679396253553; 
 Tue, 21 Mar 2023 03:57:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set8yxYsrL4YYrxBCj82VzP5oeCdHZLVPJhvtqetsqeAxNFl9Jnc67QEvkrWhbg/hZX/1OqD+niJjytoPorowI3o=
X-Received: by 2002:a67:d29b:0:b0:425:e623:360a with SMTP id
 z27-20020a67d29b000000b00425e623360amr1252696vsi.1.1679396253326; Tue, 21 Mar
 2023 03:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-2-clg@kaod.org>
 <895227cc-243a-1e93-26c2-da22bd8864c5@redhat.com>
 <ZBmHOBEfTCLsA0US@redhat.com>
In-Reply-To: <ZBmHOBEfTCLsA0US@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Mar 2023 11:57:22 +0100
Message-ID: <CABgObfYDQAGVt5RsY3vrLH61WcZMpfinZr+O2ZE7nL7-zBMgtw@mail.gmail.com>
Subject: Re: [PATCH for-8.0 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001def7205f766e954"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

--0000000000001def7205f766e954
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 21 mar 2023, 11:30 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> On Tue, Mar 21, 2023 at 11:22:33AM +0100, Paolo Bonzini wrote:
> > On 3/21/23 09:33, C=C3=A9dric Le Goater wrote:
> > > From: C=C3=A9dric Le Goater<clg@redhat.com>
> > >
> > > GCC13 reports an error :
> > >
> > > ../util/async.c: In function =E2=80=98aio_bh_poll=E2=80=99:
> > > include/qemu/queue.h:303:22: error: storing the address of local
> variable =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list.sqh_last=
=E2=80=99
> [-Werror=3Ddangling-pointer=3D]
> > >    303 |     (head)->sqh_last =3D &(elm)->field.sqe_next;
>           \
> > >        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> > > ../util/async.c:169:5: note: in expansion of macro
> =E2=80=98QSIMPLEQ_INSERT_TAIL=E2=80=99
> > >    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> > >        |     ^~~~~~~~~~~~~~~~~~~~
> > > ../util/async.c:161:17: note: =E2=80=98slice=E2=80=99 declared here
> > >    161 |     BHListSlice slice;
> > >        |                 ^~~~~
> > > ../util/async.c:161:17: note: =E2=80=98ctx=E2=80=99 declared here
> > >
> > > But the local variable 'slice' is removed from the global context lis=
t
> > > in following loop of the same routine. Add an intermediate helper to
> > > silent GCC. No functional change.
> >
> > Before doing this, I would like to see a case where this bug was _not_
> > caught by either Coverity (which is currently offline but I'm fixing it
> > right now) or just cursory review.
>
> IMHO coverity is not a substitute for this, because it is only available
> post merge, while the GCC warning is available to all maintainers on
> every build. As for code review, mistakes inevitably happen.
>

Okay, then I would like to see a single SIGSEGV in QEMU that was caused by
a local variable making its way to a global pointer.

As to this specific case, we could add a bool removed flag to BHListSlice
and assert it before aio_bh_poll() returns, but I think even that is
overkill.

Paolo

--0000000000001def7205f766e954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 21 mar 2023, 11:30 Daniel P. Berrang=C3=A9 &lt;=
<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Tue, Mar 21, 2023 at 11:22:3=
3AM +0100, Paolo Bonzini wrote:<br>
&gt; On 3/21/23 09:33, C=C3=A9dric Le Goater wrote:<br>
&gt; &gt; From: C=C3=A9dric Le Goater&lt;<a href=3D"mailto:clg@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">clg@redhat.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; GCC13 reports an error :<br>
&gt; &gt; <br>
&gt; &gt; ../util/async.c: In function =E2=80=98aio_bh_poll=E2=80=99:<br>
&gt; &gt; include/qemu/queue.h:303:22: error: storing the address of local =
variable =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list.sqh_last=E2=
=80=99 [-Werror=3Ddangling-pointer=3D]<br>
&gt; &gt;=C2=A0 =C2=A0 303 |=C2=A0 =C2=A0 =C2=A0(head)-&gt;sqh_last =3D &am=
p;(elm)-&gt;field.sqe_next;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~=
^~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; &gt; ../util/async.c:169:5: note: in expansion of macro =E2=80=98QSIMP=
LEQ_INSERT_TAIL=E2=80=99<br>
&gt; &gt;=C2=A0 =C2=A0 169 |=C2=A0 =C2=A0 =C2=A0QSIMPLEQ_INSERT_TAIL(&amp;c=
tx-&gt;bh_slice_list, &amp;slice, next);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~=
~~~<br>
&gt; &gt; ../util/async.c:161:17: note: =E2=80=98slice=E2=80=99 declared he=
re<br>
&gt; &gt;=C2=A0 =C2=A0 161 |=C2=A0 =C2=A0 =C2=A0BHListSlice slice;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
&gt; &gt; ../util/async.c:161:17: note: =E2=80=98ctx=E2=80=99 declared here=
<br>
&gt; &gt; <br>
&gt; &gt; But the local variable &#39;slice&#39; is removed from the global=
 context list<br>
&gt; &gt; in following loop of the same routine. Add an intermediate helper=
 to<br>
&gt; &gt; silent GCC. No functional change.<br>
&gt; <br>
&gt; Before doing this, I would like to see a case where this bug was _not_=
<br>
&gt; caught by either Coverity (which is currently offline but I&#39;m fixi=
ng it<br>
&gt; right now) or just cursory review.<br>
<br>
IMHO coverity is not a substitute for this, because it is only available<br=
>
post merge, while the GCC warning is available to all maintainers on<br>
every build. As for code review, mistakes inevitably happen.<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Okay, then I wo=
uld like to see a single SIGSEGV in QEMU that was caused by a local variabl=
e making its way to a global pointer.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">As to this specific case, we could add a bool removed flag to=
 BHListSlice and assert it before aio_bh_poll() returns, but I think even t=
hat is overkill.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</=
div></div>

--0000000000001def7205f766e954--


