Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB8695AE3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:48:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRq2v-0001lN-Mj; Tue, 14 Feb 2023 02:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pRq2t-0001kv-1z
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:48:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pRq2q-0007jX-V2
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676360887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BBvbB3kf1wbrPT/7RX1ecYlGcbsis4flDryYjUMnngg=;
 b=amBdWuK/naeg5yWUq52BBc0mQxx32BRtDW5g0VQHfTqk2nfYKV4p//i8bEeevWh+ocslk1
 s5M+0JaZWjvVdBvM3P1EZZXqz4ZXGduuej3B665VUn6QWRDm0Pfp7DpTFWpCSze1ucClUE
 9zZXzqSKjbN6eoY0p7IHgEhn2XmX+gY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-7RBCUis8NGOqV9YewiTNFw-1; Tue, 14 Feb 2023 02:48:02 -0500
X-MC-Unique: 7RBCUis8NGOqV9YewiTNFw-1
Received: by mail-ed1-f71.google.com with SMTP id
 g14-20020a056402090e00b0046790cd9082so9414050edz.21
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 23:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BBvbB3kf1wbrPT/7RX1ecYlGcbsis4flDryYjUMnngg=;
 b=aFbdVX5tjgPbFK0uV3W0G3NwI7q4YQn2PT8FISSD/nzDExUqxmyMtcsU6A1mwjFlmg
 FPkb6C3rgw9bxFUDIlASKfX/82N6Dag9aQfwatzGizPxdTumFuNPEaZfLxMoQPi5Bgu2
 KNRJDsNM3ueCevVYR14OIudSas9AZozT5exLGznFC8yIotOAN2dcLaVXoLeZcj5anUD9
 mgf+RMiOqzZde+nGKG+KelaPna2zzvB/DoK0BGd9FuyxlZbYI8KMdX9xmC7MPalhAJ76
 v6lDUFPxgGComH6o53Y/+hxRFLqbeXVDkdoR44KcN9y381G+uq6aXaHv5QInyh+8fZuv
 v4UQ==
X-Gm-Message-State: AO0yUKURwsiIu7W9hv+wgGPj/0aOjfmpk4pH9nw7nI08jMjgKDPjIxbU
 viVY/J/UEqousqlny2p27P/42rx3cbEUt77naPnDt1GENWGwRKKoTMpjDW2aVnw3Scd4fLqd3yy
 kDRWtwcUp/QhE4Guk4gj06qgFibk5FoU=
X-Received: by 2002:a17:906:28cc:b0:8b0:7c88:e869 with SMTP id
 p12-20020a17090628cc00b008b07c88e869mr857716ejd.2.1676360881384; 
 Mon, 13 Feb 2023 23:48:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8lLJuXWxRzATgWG4x8unwLHd+SHin5Jm1QQVfZZQ/oc4nw9UEQ9zSJIApREQu/LODe6eF5587GnDRs9hnqYYI=
X-Received: by 2002:a17:906:28cc:b0:8b0:7c88:e869 with SMTP id
 p12-20020a17090628cc00b008b07c88e869mr857709ejd.2.1676360881191; Mon, 13 Feb
 2023 23:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20230214021430.3638579-1-yajunw@nvidia.com>
In-Reply-To: <20230214021430.3638579-1-yajunw@nvidia.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 14 Feb 2023 11:47:49 +0400
Message-ID: <CAMxuvaxWMUEhDrVvnXD+17ANGpw+98sB_KrqrZmG6QtGMH5M0A@mail.gmail.com>
Subject: Re: [PATCH] chardev/char-socket: set s->listener = NULL in
 char_socket_finalize
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mst@redhat.com, 
 parav@nvidia.com, Jiri Pirko <jiri@nvidia.com>
Content-Type: multipart/alternative; boundary="000000000000d6cc5705f4a42ebd"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

--000000000000d6cc5705f4a42ebd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 14, 2023 at 6:15 AM Yajun Wu <yajunw@nvidia.com> wrote:

> After live migration with virtio block device, qemu crash at:
>
>         #0  0x000055914f46f795 in object_dynamic_cast_assert
> (obj=3D0x559151b7b090, typename=3D0x55914f80fbc4 "qio-channel",
> file=3D0x55914f80fb90 "/images/testvfe/sw/qemu.gerrit/include/io/channel.=
h",
> line=3D30, func=3D0x55914f80fcb8 <__func__.17257> "QIO_CHANNEL") at
> ../qom/object.c:872
>         #1  0x000055914f480d68 in QIO_CHANNEL (obj=3D0x559151b7b090) at
> /images/testvfe/sw/qemu.gerrit/include/io/channel.h:29
>         #2  0x000055914f4812f8 in qio_net_listener_set_client_func_full
> (listener=3D0x559151b7a720, func=3D0x55914f580b97 <tcp_chr_accept>,
> data=3D0x5591519f4ea0, notify=3D0x0, context=3D0x0) at ../io/net-listener=
.c:166
>         #3  0x000055914f580059 in tcp_chr_update_read_handler
> (chr=3D0x5591519f4ea0) at ../chardev/char-socket.c:637
>         #4  0x000055914f583dca in qemu_chr_be_update_read_handlers
> (s=3D0x5591519f4ea0, context=3D0x0) at ../chardev/char.c:226
>         #5  0x000055914f57b7c9 in qemu_chr_fe_set_handlers_full
> (b=3D0x559152bf23a0, fd_can_read=3D0x0, fd_read=3D0x0, fd_event=3D0x0,
> be_change=3D0x0, opaque=3D0x0, context=3D0x0, set_open=3Dfalse, sync_stat=
e=3Dtrue) at
> ../chardev/char-fe.c:279
>         #6  0x000055914f57b86d in qemu_chr_fe_set_handlers
> (b=3D0x559152bf23a0, fd_can_read=3D0x0, fd_read=3D0x0, fd_event=3D0x0,
> be_change=3D0x0, opaque=3D0x0, context=3D0x0, set_open=3Dfalse) at
> ../chardev/char-fe.c:304
>         #7  0x000055914f378caf in vhost_user_async_close
> (d=3D0x559152bf21a0, chardev=3D0x559152bf23a0, vhost=3D0x559152bf2420,
> cb=3D0x55914f2fb8c1 <vhost_user_blk_disconnect>) at
> ../hw/virtio/vhost-user.c:2725
>         #8  0x000055914f2fba40 in vhost_user_blk_event
> (opaque=3D0x559152bf21a0, event=3DCHR_EVENT_CLOSED) at
> ../hw/block/vhost-user-blk.c:395
>         #9  0x000055914f58388c in chr_be_event (s=3D0x5591519f4ea0,
> event=3DCHR_EVENT_CLOSED) at ../chardev/char.c:61
>         #10 0x000055914f583905 in qemu_chr_be_event (s=3D0x5591519f4ea0,
> event=3DCHR_EVENT_CLOSED) at ../chardev/char.c:81
>         #11 0x000055914f581275 in char_socket_finalize
> (obj=3D0x5591519f4ea0) at ../chardev/char-socket.c:1083
>         #12 0x000055914f46f073 in object_deinit (obj=3D0x5591519f4ea0,
> type=3D0x5591519055c0) at ../qom/object.c:680
>         #13 0x000055914f46f0e5 in object_finalize (data=3D0x5591519f4ea0)=
 at
> ../qom/object.c:694
>         #14 0x000055914f46ff06 in object_unref (objptr=3D0x5591519f4ea0) =
at
> ../qom/object.c:1202
>         #15 0x000055914f4715a4 in object_finalize_child_property
> (obj=3D0x559151b76c50, name=3D0x559151b7b250 "char3", opaque=3D0x5591519f=
4ea0) at
> ../qom/object.c:1747
>         #16 0x000055914f46ee86 in object_property_del_all
> (obj=3D0x559151b76c50) at ../qom/object.c:632
>         #17 0x000055914f46f0d2 in object_finalize (data=3D0x559151b76c50)=
 at
> ../qom/object.c:693
>         #18 0x000055914f46ff06 in object_unref (objptr=3D0x559151b76c50) =
at
> ../qom/object.c:1202
>         #19 0x000055914f4715a4 in object_finalize_child_property
> (obj=3D0x559151b6b560, name=3D0x559151b76630 "chardevs", opaque=3D0x55915=
1b76c50)
> at ../qom/object.c:1747
>         #20 0x000055914f46ef67 in object_property_del_child
> (obj=3D0x559151b6b560, child=3D0x559151b76c50) at ../qom/object.c:654
>         #21 0x000055914f46f042 in object_unparent (obj=3D0x559151b76c50) =
at
> ../qom/object.c:673
>         #22 0x000055914f58632a in qemu_chr_cleanup () at
> ../chardev/char.c:1189
>         #23 0x000055914f16c66c in qemu_cleanup () at
> ../softmmu/runstate.c:830
>         #24 0x000055914eee7b9e in qemu_default_main () at
> ../softmmu/main.c:38
>         #25 0x000055914eee7bcc in main (argc=3D86, argv=3D0x7ffc97cb8d88)=
 at
> ../softmmu/main.c:48
>
> In char_socket_finalize after s->listener freed, event callback function
> vhost_user_blk_event will be called to handle CHR_EVENT_CLOSED.
> vhost_user_blk_event is calling qio_net_listener_set_client_func_full whi=
ch
> is still using s->listener.
>
> Setting s->listener =3D NULL after object_unref(OBJECT(s->listener)) can
> solve this issue.
>
> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
> Acked-by: Jiri Pirko <jiri@nvidia.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



>
> ---
>  chardev/char-socket.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index c2265436ac..8c58532171 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -1065,6 +1065,7 @@ static void char_socket_finalize(Object *obj)
>          qio_net_listener_set_client_func_full(s->listener, NULL, NULL,
>                                                NULL, chr->gcontext);
>          object_unref(OBJECT(s->listener));
> +        s->listener =3D NULL;
>      }
>      if (s->tls_creds) {
>          object_unref(OBJECT(s->tls_creds));
> --
> 2.27.0
>
>

--000000000000d6cc5705f4a42ebd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 6:15 AM Yaj=
un Wu &lt;<a href=3D"mailto:yajunw@nvidia.com">yajunw@nvidia.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">After live =
migration with virtio block device, qemu crash at:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #0=C2=A0 0x000055914f46f795 in object_dynamic_c=
ast_assert (obj=3D0x559151b7b090, typename=3D0x55914f80fbc4 &quot;qio-chann=
el&quot;, file=3D0x55914f80fb90 &quot;/images/testvfe/sw/qemu.gerrit/includ=
e/io/channel.h&quot;, line=3D30, func=3D0x55914f80fcb8 &lt;__func__.17257&g=
t; &quot;QIO_CHANNEL&quot;) at ../qom/object.c:872<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #1=C2=A0 0x000055914f480d68 in QIO_CHANNEL (obj=
=3D0x559151b7b090) at /images/testvfe/sw/qemu.gerrit/include/io/channel.h:2=
9<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #2=C2=A0 0x000055914f4812f8 in qio_net_listener=
_set_client_func_full (listener=3D0x559151b7a720, func=3D0x55914f580b97 &lt=
;tcp_chr_accept&gt;, data=3D0x5591519f4ea0, notify=3D0x0, context=3D0x0) at=
 ../io/net-listener.c:166<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #3=C2=A0 0x000055914f580059 in tcp_chr_update_r=
ead_handler (chr=3D0x5591519f4ea0) at ../chardev/char-socket.c:637<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #4=C2=A0 0x000055914f583dca in qemu_chr_be_upda=
te_read_handlers (s=3D0x5591519f4ea0, context=3D0x0) at ../chardev/char.c:2=
26<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #5=C2=A0 0x000055914f57b7c9 in qemu_chr_fe_set_=
handlers_full (b=3D0x559152bf23a0, fd_can_read=3D0x0, fd_read=3D0x0, fd_eve=
nt=3D0x0, be_change=3D0x0, opaque=3D0x0, context=3D0x0, set_open=3Dfalse, s=
ync_state=3Dtrue) at ../chardev/char-fe.c:279<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #6=C2=A0 0x000055914f57b86d in qemu_chr_fe_set_=
handlers (b=3D0x559152bf23a0, fd_can_read=3D0x0, fd_read=3D0x0, fd_event=3D=
0x0, be_change=3D0x0, opaque=3D0x0, context=3D0x0, set_open=3Dfalse) at ../=
chardev/char-fe.c:304<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #7=C2=A0 0x000055914f378caf in vhost_user_async=
_close (d=3D0x559152bf21a0, chardev=3D0x559152bf23a0, vhost=3D0x559152bf242=
0, cb=3D0x55914f2fb8c1 &lt;vhost_user_blk_disconnect&gt;) at ../hw/virtio/v=
host-user.c:2725<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #8=C2=A0 0x000055914f2fba40 in vhost_user_blk_e=
vent (opaque=3D0x559152bf21a0, event=3DCHR_EVENT_CLOSED) at ../hw/block/vho=
st-user-blk.c:395<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #9=C2=A0 0x000055914f58388c in chr_be_event (s=
=3D0x5591519f4ea0, event=3DCHR_EVENT_CLOSED) at ../chardev/char.c:61<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #10 0x000055914f583905 in qemu_chr_be_event (s=
=3D0x5591519f4ea0, event=3DCHR_EVENT_CLOSED) at ../chardev/char.c:81<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #11 0x000055914f581275 in char_socket_finalize =
(obj=3D0x5591519f4ea0) at ../chardev/char-socket.c:1083<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #12 0x000055914f46f073 in object_deinit (obj=3D=
0x5591519f4ea0, type=3D0x5591519055c0) at ../qom/object.c:680<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #13 0x000055914f46f0e5 in object_finalize (data=
=3D0x5591519f4ea0) at ../qom/object.c:694<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #14 0x000055914f46ff06 in object_unref (objptr=
=3D0x5591519f4ea0) at ../qom/object.c:1202<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #15 0x000055914f4715a4 in object_finalize_child=
_property (obj=3D0x559151b76c50, name=3D0x559151b7b250 &quot;char3&quot;, o=
paque=3D0x5591519f4ea0) at ../qom/object.c:1747<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #16 0x000055914f46ee86 in object_property_del_a=
ll (obj=3D0x559151b76c50) at ../qom/object.c:632<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #17 0x000055914f46f0d2 in object_finalize (data=
=3D0x559151b76c50) at ../qom/object.c:693<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #18 0x000055914f46ff06 in object_unref (objptr=
=3D0x559151b76c50) at ../qom/object.c:1202<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #19 0x000055914f4715a4 in object_finalize_child=
_property (obj=3D0x559151b6b560, name=3D0x559151b76630 &quot;chardevs&quot;=
, opaque=3D0x559151b76c50) at ../qom/object.c:1747<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #20 0x000055914f46ef67 in object_property_del_c=
hild (obj=3D0x559151b6b560, child=3D0x559151b76c50) at ../qom/object.c:654<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #21 0x000055914f46f042 in object_unparent (obj=
=3D0x559151b76c50) at ../qom/object.c:673<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #22 0x000055914f58632a in qemu_chr_cleanup () a=
t ../chardev/char.c:1189<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #23 0x000055914f16c66c in qemu_cleanup () at ..=
/softmmu/runstate.c:830<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #24 0x000055914eee7b9e in qemu_default_main () =
at ../softmmu/main.c:38<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #25 0x000055914eee7bcc in main (argc=3D86, argv=
=3D0x7ffc97cb8d88) at ../softmmu/main.c:48<br>
<br>
In char_socket_finalize after s-&gt;listener freed, event callback function=
<br>
vhost_user_blk_event will be called to handle CHR_EVENT_CLOSED.<br>
vhost_user_blk_event is calling qio_net_listener_set_client_func_full which=
<br>
is still using s-&gt;listener.<br>
<br>
Setting s-&gt;listener =3D NULL after object_unref(OBJECT(s-&gt;listener)) =
can<br>
solve this issue.<br>
<br>
Signed-off-by: Yajun Wu &lt;<a href=3D"mailto:yajunw@nvidia.com" target=3D"=
_blank">yajunw@nvidia.com</a>&gt;<br>
Acked-by: Jiri Pirko &lt;<a href=3D"mailto:jiri@nvidia.com" target=3D"_blan=
k">jiri@nvidia.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed-by:=
 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">=
marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
---<br>
=C2=A0chardev/char-socket.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index c2265436ac..8c58532171 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -1065,6 +1065,7 @@ static void char_socket_finalize(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qio_net_listener_set_client_func_full(s-&=
gt;listener, NULL, NULL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0NULL, chr-&gt;gcontext);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(s-&gt;listener));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;listener =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;tls_creds) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(s-&gt;tls_creds));<br=
>
-- <br>
2.27.0<br>
<br>
</blockquote></div></div>

--000000000000d6cc5705f4a42ebd--


