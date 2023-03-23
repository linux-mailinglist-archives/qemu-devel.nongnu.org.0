Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE84C6C5E59
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:03:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfD6T-0003gf-9p; Thu, 23 Mar 2023 01:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pfD6G-0003cR-Vo
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pfD6F-0000hf-B8
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679547774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bCnSM4SNFMVPoAPASAcF9rjrOA+ylf56w8lXX6SHi7g=;
 b=SYtgv/E8maZu1oZwwg6Q022/1D08k0NmfiMV9l3K9kihRZAAKJlsupnuSJb3dhT+bE8KGf
 zv1tZlTbkD1LqhECaxizXuAd0mPd7IsaWqoA/VGIlhEo0Yx+T0DWF3xDcw5UpvIRm7GZB6
 V5cRl+gaW7XdRp7PP5u5exrSrgbRQv4=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-1P_JyOC6OoO-uQSBzi_bmg-1; Thu, 23 Mar 2023 01:02:48 -0400
X-MC-Unique: 1P_JyOC6OoO-uQSBzi_bmg-1
Received: by mail-vs1-f70.google.com with SMTP id
 dg24-20020a056102571800b00423e0883134so5579070vsb.16
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 22:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679547768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bCnSM4SNFMVPoAPASAcF9rjrOA+ylf56w8lXX6SHi7g=;
 b=ndGMyPL1laMnJXo6md3xO3FonZWl+ymaXs9m7ra2qwgnRj+Nr+3vsEVKnJ2AoJaPRi
 FBQ6rXejtXKb5LwhPMh9CIsMmRhPavqhx4cHqcTfj/p05zqB+qUFyCSO6EbfAmrb6lwu
 6/FqfjHHSciHgM2dt8Z/VUN1EGquGcYNd0v1KSf4mqjzyIljSrYFjAs96rKyT1waAaGP
 UJputXrnwzEI1FfqeYgTKuukuj4e7i82wyhDcBPTYh0tBDPy9WPafgktCIp9ge1ibcKp
 hU4J5FXOkXuSa56acwnpI3P8KcYMoR0gSEwdPjHCFsyrXGheT0szK+lW4l2hrEoxDYff
 WHaw==
X-Gm-Message-State: AO0yUKVMQ8iTyi8tBJToxOkpsbjJFEpcSOIetDEulDcNTkVaMZvaNuPJ
 6DBgH4decHh2uSeDyQ7kw/g5TcfFcLaEOjIGMsLIbAlLORi6I6w4KsKDGVhSGL7vMKf/ekIoIqV
 uK5kvB8HUS2Bl0QIGIi2jOcZ3loQPCm0=
X-Received: by 2002:a67:d496:0:b0:416:2ad3:35ba with SMTP id
 g22-20020a67d496000000b004162ad335bamr1038705vsj.1.1679547767999; 
 Wed, 22 Mar 2023 22:02:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set+sNh9Lw97HByRkHHzbCir5ZZvZNZ7h+REbe3s9BuCP6JyRiTNenrvS5L93V+rAr0NXt7nZX5DijyXZ1YrQGNk=
X-Received: by 2002:a67:d496:0:b0:416:2ad3:35ba with SMTP id
 g22-20020a67d496000000b004162ad335bamr1038699vsj.1.1679547767732; Wed, 22 Mar
 2023 22:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230322145521.1294954-1-stefanha@redhat.com>
In-Reply-To: <20230322145521.1294954-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 23 Mar 2023 06:02:36 +0100
Message-ID: <CABgObfbxqDNjH_RWu8L4dU+f9VchZi-c-=nNpt5vCGfK7Asndg@mail.gmail.com>
Subject: Re: [PATCH for-8.0] aio-posix: fix race between epoll upgrade and
 aio_set_fd_handler()
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Fam Zheng <fam@euphon.net>, 
 qemu-stable <qemu-stable@nongnu.org>, Qing Wang <qinwang@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000014531b05f78a3032"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

--00000000000014531b05f78a3032
Content-Type: text/plain; charset="UTF-8"

Il mer 22 mar 2023, 15:55 Stefan Hajnoczi <stefanha@redhat.com> ha scritto:

> +    /* The list must not change while we add fds to epoll */
> +    if (!qemu_lockcnt_dec_if_lock(&ctx->list_lock)) {
> +        return false;
> +    }
> +
> +    ok = fdmon_epoll_try_enable(ctx);
> +
> +    qemu_lockcnt_unlock(&ctx->list_lock);
>

Shouldn't this be inc_and_unlock to balance the change made by dec_if_lock?

Paolo

+
> +    if (!ok) {
> +        fdmon_epoll_disable(ctx);
> +    }
> +    return ok;
>  }
>
>  void fdmon_epoll_setup(AioContext *ctx)
> --
> 2.39.2
>
>

--00000000000014531b05f78a3032
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 22 mar 2023, 15:55 Stefan Hajnoczi &lt;<a href=
=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&gt; ha scritto:</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 /* The list must not change while we add fds to epoll */<br>
+=C2=A0 =C2=A0 if (!qemu_lockcnt_dec_if_lock(&amp;ctx-&gt;list_lock)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ok =3D fdmon_epoll_try_enable(ctx);<br>
+<br>
+=C2=A0 =C2=A0 qemu_lockcnt_unlock(&amp;ctx-&gt;list_lock);<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Shouldn&#39;t th=
is be inc_and_unlock to balance the change made by dec_if_lock?</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
+<br>
+=C2=A0 =C2=A0 if (!ok) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fdmon_epoll_disable(ctx);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return ok;<br>
=C2=A0}<br>
<br>
=C2=A0void fdmon_epoll_setup(AioContext *ctx)<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div></div>

--00000000000014531b05f78a3032--


