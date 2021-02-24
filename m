Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8847323A77
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:24:55 +0100 (CET)
Received: from localhost ([::1]:57780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErLi-00075K-RE
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lErJj-00064J-SK
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lErJi-0004eq-8p
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614162169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b5dhz8KcuQRAPV1SPkTt3bQj4y7qWgDlhFNlPlkDGK4=;
 b=H9jvgMSUCOZDW7ax9vYMSKRXJTHS5iyjuO+XTnUETt/DBlc42XNG3tgs+LBNuJ8d57VZhC
 uFqavgVrLMIRWkMLJyWzAFfBzEXUOauiq9MQNPfJ4jeaEZL52+Vt/zalIMm0V54Sg18quY
 gDKrmwB7A4r0hK2CYvwp8GU9S0pRHFY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-Eq1yvQEmOhyJJAEHwsz09A-1; Wed, 24 Feb 2021 05:22:43 -0500
X-MC-Unique: Eq1yvQEmOhyJJAEHwsz09A-1
Received: by mail-io1-f70.google.com with SMTP id q10so1093645ion.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 02:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5dhz8KcuQRAPV1SPkTt3bQj4y7qWgDlhFNlPlkDGK4=;
 b=Tie8pUtwmrI63Qxp7MCJb/L8mAGBlHlXVmqIG+z8M8phrmS1PULa73hBdrl/g3mlQ0
 VWjhklPqvyhQwU49GTKjCfpuPD39EK11wv3IPajyoe/YvyxU+UPuYkNbKKINaLsxcHe6
 x9q5QDPbNXo3Imu8x/uhFTyEw1paoSfG4k4hflE1PFHd2sfnqIt4RUO+HT1dMNFGniPL
 h6QqYaN9itDL78d9Rf/kRk2MjEwYfvv729NUrcfCiz0SC/1pEqqldBOrfXf45LK9zHTT
 u8w8wj9JvH3RLNVK6czz3KD1CRk8F2ovlBeThGUQk5mdbGTVMh04aicOrcE9D0kDXXXf
 8NMg==
X-Gm-Message-State: AOAM531XDgmSfB9nBwB7paEVhcl0EJqZXJe2+Q9H34qzSv8mnwCwMFjd
 CpOLAAmvI63oV0UnS4fUrb+xlutJwk5x1m8ZvCHcMXGjsj2LUI3PmEhJ9ceYUE6k3u68iM4pTIR
 fKonyGy6PaJXKSyGofaP6hQR3AIoDE3g=
X-Received: by 2002:a05:6e02:214d:: with SMTP id
 d13mr23543597ilv.82.1614162163205; 
 Wed, 24 Feb 2021 02:22:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQXvilP1PZ+EUC/PwkMY3i/G8p9+6uZv7Wwl+hJ8lvspfGGZJp4/zCiSKUh12Mxcu3D+9ltC6jmJ8hJAwd6aI=
X-Received: by 2002:a05:6e02:214d:: with SMTP id
 d13mr23543585ilv.82.1614162162991; 
 Wed, 24 Feb 2021 02:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20210222161017.570837-1-stefanha@redhat.com>
 <20210222161017.570837-2-stefanha@redhat.com>
In-Reply-To: <20210222161017.570837-2-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 24 Feb 2021 14:22:31 +0400
Message-ID: <CAMxuvazaCQ+WN6-rkhydEHmV7o4MrUzU7YBV4i1ZYodedV4aLw@mail.gmail.com>
Subject: Re: [PATCH 1/3] tests/qtest/vhost-user-test: use share=on with memfd
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000055def605bc126ab8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
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
Cc: "Wolf, Kevin" <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000055def605bc126ab8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Feb 22, 2021 at 8:11 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:

> For some reason memfd never used share=3Don. vhost-user relies on
> mmap(MAP_SHARED) so this seems like a problem, but the tests still run
> without it.
>
>
Simply because it's on by default with memory-backend-memfd (it wouldn't
make much sense to use memfd in the first place without share)

Add share=3Don for consistency and to prevent future bugs in the test.
>

But it doesn't hurt to be explicit though.


> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  tests/qtest/vhost-user-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.=
c
> index 1a5f5313ff..2db98c4920 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -40,7 +40,7 @@
>  #define QEMU_CMD_MEM    " -m %d -object
> memory-backend-file,id=3Dmem,size=3D%dM," \
>                          "mem-path=3D%s,share=3Don -numa node,memdev=3Dme=
m"
>  #define QEMU_CMD_MEMFD  " -m %d -object
> memory-backend-memfd,id=3Dmem,size=3D%dM," \
> -                        " -numa node,memdev=3Dmem"
> +                        "share=3Don -numa node,memdev=3Dmem"
>  #define QEMU_CMD_CHR    " -chardev socket,id=3D%s,path=3D%s%s"
>  #define QEMU_CMD_NETDEV " -netdev vhost-user,id=3Dhs0,chardev=3D%s,vhost=
force"
>
> --
> 2.29.2
>
>

--00000000000055def605bc126ab8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 22, 2021 at 8:11 PM Ste=
fan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
For some reason memfd never used share=3Don. vhost-user relies on<br>
mmap(MAP_SHARED) so this seems like a problem, but the tests still run<br>
without it.<br>
<br></blockquote><div><br></div><div>Simply because it&#39;s on by default =
with memory-backend-memfd (it wouldn&#39;t make much sense to use memfd in =
the first place without share)<br></div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Add share=3Don for consistency and to prevent future bugs in the test.<br><=
/blockquote><div><br></div><div>But it doesn&#39;t hurt to be explicit thou=
gh.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" t=
arget=3D"_blank">stefanha@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/qtest/vhost-user-test.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c<=
br>
index 1a5f5313ff..2db98c4920 100644<br>
--- a/tests/qtest/vhost-user-test.c<br>
+++ b/tests/qtest/vhost-user-test.c<br>
@@ -40,7 +40,7 @@<br>
=C2=A0#define QEMU_CMD_MEM=C2=A0 =C2=A0 &quot; -m %d -object memory-backend=
-file,id=3Dmem,size=3D%dM,&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;mem-path=3D%s,share=3Don -numa node,memdev=3Dmem&quo=
t;<br>
=C2=A0#define QEMU_CMD_MEMFD=C2=A0 &quot; -m %d -object memory-backend-memf=
d,id=3Dmem,size=3D%dM,&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot; -numa node,memdev=3Dmem&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;share=3Don -numa node,memdev=3Dmem&quot;<br>
=C2=A0#define QEMU_CMD_CHR=C2=A0 =C2=A0 &quot; -chardev socket,id=3D%s,path=
=3D%s%s&quot;<br>
=C2=A0#define QEMU_CMD_NETDEV &quot; -netdev vhost-user,id=3Dhs0,chardev=3D=
%s,vhostforce&quot;<br>
<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div></div>

--00000000000055def605bc126ab8--


