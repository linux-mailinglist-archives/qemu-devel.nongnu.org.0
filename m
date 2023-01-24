Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9C96795CC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 11:53:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKGuo-0006am-2Y; Tue, 24 Jan 2023 05:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1pKGul-0006a1-0F
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1pKGui-0006mi-Vl
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674557547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Abe37cA5shEvwbPtidUv038jJQM0wM6mEjB/yoKMtzw=;
 b=JxpAOV/AiaV1U66qxFh4pFnVn8bnS5G76YtaRBwKgAv1G1zbsnuki6MD7plKTNid0sqHpl
 ml4MXYbguqkoJ4rb9ePnFniTihxqyk32zWpBLi87laNPNaPn1JV2BSt25cN+oNy+QJMQS6
 J/jgle2CvnrYKW5ye2sUkMtuNIfofXA=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-9L6t97f7PvSU7YgTq_t8Fw-1; Tue, 24 Jan 2023 05:51:15 -0500
X-MC-Unique: 9L6t97f7PvSU7YgTq_t8Fw-1
Received: by mail-vk1-f199.google.com with SMTP id
 u2-20020a1f6002000000b003e2481d7a4aso402716vkb.10
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 02:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Abe37cA5shEvwbPtidUv038jJQM0wM6mEjB/yoKMtzw=;
 b=F0cjMXB4rFbf9d9TMpg3MygaBu1XmP2Udy8r+eXHnvr56kfl8Sol4xFoL3zMSsAKy7
 9AseVind4vvafjslSvvDHQRBASVelzOj0FK6MLxs5vdPZEVurHiXanZQ/SW6uRvc5Z5f
 /yK7Q6VjpvavYXb9YVhV0nQ4n5ugIhts7iWUKiVlsXU3FrciP5AzyiLAa2CQP4L/i7Mq
 JlVOV8LxVgrrMuIFR7BBAvBDb1sZgOeC2mtVz7eNN42zOao4AFQWNfNj6o/6KZ7nT5gq
 OIpWHqYlZhJrFVO9MWTtldHPcPO/s6OsXdUmrpA/vf+BvwM4sFMl4O06EgddVihK1w6w
 yQ4g==
X-Gm-Message-State: AFqh2koxvIHfW8DG4khP3HuAFk9xZV4EwSQTtxjfNYg6VWRTWim0b9n3
 3er49JnFO9vhQFBw08LUI+NHFvXBvvPQ1tsZXW1xPyzesFrjeBWFRm5N1JiUXZMq7jrg9dsaisi
 cLcTuMLfPQ3j9zZrokR6wMarcxaw4yE8=
X-Received: by 2002:a67:d097:0:b0:3d0:cb3d:ad47 with SMTP id
 s23-20020a67d097000000b003d0cb3dad47mr4391298vsi.76.1674557474883; 
 Tue, 24 Jan 2023 02:51:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvc8hgmoZArslCfQ5IGH4QEd1/POJDAylEmfnr3oC8dn/TRjLdVUxTNeK/ZmzitKlu6ZSr5h1ZX7k+kIWRmTks=
X-Received: by 2002:a67:d097:0:b0:3d0:cb3d:ad47 with SMTP id
 s23-20020a67d097000000b003d0cb3dad47mr4391293vsi.76.1674557474632; Tue, 24
 Jan 2023 02:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20221130000320.287976-1-viktor@daynix.com>
 <a7ad8724-af5c-5a38-49a4-a534d8454203@phystech.edu>
In-Reply-To: <a7ad8724-af5c-5a38-49a4-a534d8454203@phystech.edu>
From: Yan Vugenfirer <yvugenfi@redhat.com>
Date: Tue, 24 Jan 2023 12:51:03 +0200
Message-ID: <CAGoVJZwtbGLUHynoPCksDooJdL92X42xLcm3NwVTGXK=-0F+uA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] contrib/elf2dmp: Windows Server 2022 support
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: pbonzini@redhat.com, Viktor Prutyanov <viktor@daynix.com>,
 yuri.benditovich@daynix.com, yan@daynix.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006e8e4005f3004b1d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=yvugenfi@redhat.com;
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

--0000000000006e8e4005f3004b1d
Content-Type: text/plain; charset="UTF-8"

Ping.



On Tue, Jan 10, 2023 at 6:10 PM Viktor Prutyanov <
viktor.prutyanov@phystech.edu> wrote:

> On 11/30/22 3:03 AM, Viktor Prutyanov wrote:
> > Hi,
> >
> > For now, elf2dmp is unable to convert ELF-dump to DMP-dump made of
> > Windows Server 2022 guest. This patch series fixes it.
> >
> > v1: improve code-style fix
> >
> > Viktor Prutyanov (3):
> >    contrib/elf2dmp: fix code style
> >    contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry
> >    contrib/elf2dmp: add PE name check and Windows Server 2022 support
> >
> >   contrib/elf2dmp/addrspace.c |   1 +
> >   contrib/elf2dmp/main.c      | 103 +++++++++++++++++++++-----------
> >   contrib/elf2dmp/pe.h        | 115 ++++++++++++++++++++----------------
> >   3 files changed, 135 insertions(+), 84 deletions(-)
> >
>
> Hi Paolo,
>
> Could you please add the series to your branch?
> I've sent it from my other email. I can add
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
>
> Thanks,
> Viktor Prutyanov
>
>

--0000000000006e8e4005f3004b1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping.<div><br></div><div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 10, 2023 at=
 6:10 PM Viktor Prutyanov &lt;<a href=3D"mailto:viktor.prutyanov@phystech.e=
du">viktor.prutyanov@phystech.edu</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
On 11/30/22 3:03 AM, Viktor Prutyanov wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; For now, elf2dmp is unable to convert ELF-dump to DMP-dump made of<br>
&gt; Windows Server 2022 guest. This patch series fixes it.<br>
&gt; <br>
&gt; v1: improve code-style fix<br>
&gt; <br>
&gt; Viktor Prutyanov (3):<br>
&gt;=C2=A0 =C2=A0 contrib/elf2dmp: fix code style<br>
&gt;=C2=A0 =C2=A0 contrib/elf2dmp: move PE dir search to pe_get_data_dir_en=
try<br>
&gt;=C2=A0 =C2=A0 contrib/elf2dmp: add PE name check and Windows Server 202=
2 support<br>
&gt; <br>
&gt;=C2=A0 =C2=A0contrib/elf2dmp/addrspace.c |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0contrib/elf2dmp/main.c=C2=A0 =C2=A0 =C2=A0 | 103 +++++++++=
++++++++++++-----------<br>
&gt;=C2=A0 =C2=A0contrib/elf2dmp/pe.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 115 ++++=
++++++++++++++++----------------<br>
&gt;=C2=A0 =C2=A03 files changed, 135 insertions(+), 84 deletions(-)<br>
&gt; <br>
<br>
Hi Paolo,<br>
<br>
Could you please add the series to your branch?<br>
I&#39;ve sent it from my other email. I can add<br>
Signed-off-by: Viktor Prutyanov &lt;<a href=3D"mailto:viktor.prutyanov@phys=
tech.edu" target=3D"_blank">viktor.prutyanov@phystech.edu</a>&gt;<br>
<br>
Thanks,<br>
Viktor Prutyanov<br>
<br>
</blockquote></div>

--0000000000006e8e4005f3004b1d--


