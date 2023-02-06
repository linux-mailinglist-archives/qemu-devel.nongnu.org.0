Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F6468CA99
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 00:35:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPAzo-00006w-Nu; Mon, 06 Feb 2023 18:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPAzl-00006A-Qn
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:33:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPAzj-000670-RG
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675726435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OK6KxHXH4n6kkb89D1IR3ZtGmNShxyvpp4zBOTpjbEY=;
 b=UY7RUtrVpBuChNAgQ8i7yEZYYMIfyt76QEQBItM8UdZVdHW5D79jpc2u2LhaF1p1kneNO0
 KmScwMA4lPLx5i9fxTv1QObq/bZri6vTctxtXraHEn1ceTUQ9K5mdxdeqGWQ02beobmMdx
 EMuWpLeWnVcdwjundde3ces8yuMyPdk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-H67tLPvPPhuwOO4qOHujkw-1; Mon, 06 Feb 2023 18:33:54 -0500
X-MC-Unique: H67tLPvPPhuwOO4qOHujkw-1
Received: by mail-pf1-f200.google.com with SMTP id
 c75-20020a621c4e000000b00592501ac524so7109521pfc.6
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 15:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OK6KxHXH4n6kkb89D1IR3ZtGmNShxyvpp4zBOTpjbEY=;
 b=3QCf6b6dM+2lR73awfAARrOG5PyOwsLT0wQdypqaXkc7MiNffJ5vBuHwAwFV5KSrBm
 H62ZcOk0TUAjQrbI2JJwbSu0RNk668SPG5jN5dy8IkcOQbxz6Q1HOhVjLBQR596OTEuv
 AeSpApHfCDfdYNFCVjLaSiR0OrGFdiR0s2uxx5wBWJb4SAKBvhZvem/UaKY0JQ9XHGNJ
 03HXhutQgYy1rhf97yuxwEZinuji5Kf3GgjKoxApNKs0W8dYYGViJZ+gNzZ62Wv+U0KU
 DvbhgDaoPlqnT9QqJGse/lhhBCD8rD9fwwVH+mqqusN0Pk7hAuxuPXQ+aMduxzcbkA1/
 eicA==
X-Gm-Message-State: AO0yUKUwYVzV9TXA6y+RYe2dZXZyXTrZGYFTWypXypH+RL5Zkn8PVk0z
 6h+7QfqkPfHdRUSQr/qfNQteRkeGkU/9+YBqZTxanj2AjvZDXrkE3t5Av/FMtXdN7ksgNjFNeU6
 /G+uscMMLWX0eaffTUsgYZqJTPKUbMC0=
X-Received: by 2002:a17:90a:7288:b0:230:93f9:bc89 with SMTP id
 e8-20020a17090a728800b0023093f9bc89mr365040pjg.59.1675726430352; 
 Mon, 06 Feb 2023 15:33:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/0IsNVzPdFNfITatlAlLFuYkJm41Ma+mBp8aLRnFoR9LXyKgoCohvMPE/5Bo1KtpsJ5Ffsb6L303k4bmhtt9s=
X-Received: by 2002:a17:90a:7288:b0:230:93f9:bc89 with SMTP id
 e8-20020a17090a728800b0023093f9bc89mr365027pjg.59.1675726429995; Mon, 06 Feb
 2023 15:33:49 -0800 (PST)
MIME-Version: 1.0
References: <20230202160640.2300-1-quintela@redhat.com>
 <CAFEAcA-dvzgGWxoXYkD-1Vv8k4oajPQVU+nypX5pKSN=iS+BqQ@mail.gmail.com>
 <Y+F6AT6l5yVAYmTy@x1n>
In-Reply-To: <Y+F6AT6l5yVAYmTy@x1n>
From: Juan Quintela <quintela@redhat.com>
Date: Tue, 7 Feb 2023 00:33:39 +0100
Message-ID: <CAGiv1-UAFKzCUFC1PCO3wjeK8gKrto+LZNU=oP8nzJyRC6Da+Q@mail.gmail.com>
Subject: Re: [PULL 00/26] Next patches
To: Peter Xu <peterx@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>, 
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>, 
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000099dc8605f4107668"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--00000000000099dc8605f4107668
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 6, 2023, 23:07 Peter Xu <peterx@redhat.com> wrote:

> On Sat, Feb 04, 2023 at 10:19:34AM +0000, Peter Maydell wrote:
> > On Thu, 2 Feb 2023 at 16:07, Juan Quintela <quintela@redhat.com> wrote:
> > >
> > > The following changes since commit
> deabea6e88f7c4c3c12a36ee30051c6209561165:
> > >
> > >   Merge tag 'for_upstream' of
> https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2023-02-02
> 10:10:07 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/juan.quintela/qemu.git tags/next-pull-request
> > >
> > > for you to fetch changes up to
> 5ee6d3d1eeccd85aa2a835e82b8d9e1b4f7441e1:
> > >
> > >   migration: check magic value for deciding the mapping of channels
> (2023-02-02 17:04:16 +0100)
> > >
> > > ----------------------------------------------------------------
> > > Migration PULL request, new try
> >
> > Fails to build on anything that isn't Linux:
> >
> > In file included from ../migration/postcopy-ram.c:40:
> >
> /private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/include/qemu/userfaultfd.h:18:10:
> > fatal error: 'linux/userfaultfd.h' file not found
>
> Oops, my fault.
>
> Juan, please feel free to drop patch "util/userfaultfd: Add uffd_open()".
> I'll respin with the whole set.
>


Fixed it already

> --
> Peter Xu
>
>

--00000000000099dc8605f4107668
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Feb 6, 2023, 23:07 Peter Xu &lt;<a href=3D"mai=
lto:peterx@redhat.com">peterx@redhat.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On Sat, Feb 04, 2023 at 10:19:34AM +0000, Peter Maydel=
l wrote:<br>
&gt; On Thu, 2 Feb 2023 at 16:07, Juan Quintela &lt;<a href=3D"mailto:quint=
ela@redhat.com" target=3D"_blank" rel=3D"noreferrer">quintela@redhat.com</a=
>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The following changes since commit deabea6e88f7c4c3c12a36ee30051c=
6209561165:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Merge tag &#39;for_upstream&#39; of <a href=3D"https:=
//git.kernel.org/pub/scm/virt/kvm/mst/qemu" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://git.kernel.org/pub/scm/virt/kvm/mst/qemu</a> into =
staging (2023-02-02 10:10:07 +0000)<br>
&gt; &gt;<br>
&gt; &gt; are available in the Git repository at:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/juan.quintela/qemu.git"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/juan.qu=
intela/qemu.git</a> tags/next-pull-request<br>
&gt; &gt;<br>
&gt; &gt; for you to fetch changes up to 5ee6d3d1eeccd85aa2a835e82b8d9e1b4f=
7441e1:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0migration: check magic value for deciding the mapping=
 of channels (2023-02-02 17:04:16 +0100)<br>
&gt; &gt;<br>
&gt; &gt; ----------------------------------------------------------------<=
br>
&gt; &gt; Migration PULL request, new try<br>
&gt; <br>
&gt; Fails to build on anything that isn&#39;t Linux:<br>
&gt; <br>
&gt; In file included from ../migration/postcopy-ram.c:40:<br>
&gt; /private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-bui=
ld/include/qemu/userfaultfd.h:18:10:<br>
&gt; fatal error: &#39;linux/userfaultfd.h&#39; file not found<br>
<br>
Oops, my fault.<br>
<br>
Juan, please feel free to drop patch &quot;util/userfaultfd: Add uffd_open(=
)&quot;.<br>
I&#39;ll respin with the whole set.<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Fixed it alr=
eady</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
-- <br>
Peter Xu<br>
<br>
</blockquote></div></div></div>

--00000000000099dc8605f4107668--


