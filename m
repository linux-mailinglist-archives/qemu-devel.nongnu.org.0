Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D69165DF20
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 22:39:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBSg-0007De-CW; Wed, 04 Jan 2023 16:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pDBSZ-0007DE-Tp
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 16:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pDBSI-0004rG-T6
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 16:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672868269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wons4RCbjWEG22bGkUNjld4w2j8dFCWYTiGF3tCJ2oQ=;
 b=eeIIieUPT1KKN/hSlpm5kMC6D16CgLsEMGmgLiQ1IKRatjKvT3twm97LFiPg3ATK5NbDNE
 lxayviFNGADQi4uveY972BBlpDTjSQrdz3V+89lmvQOyHqxnBNphw4cdTT3XITg8862F0e
 gNf9Pcn6BaYzenGiyzCSVYpW5G6lq/I=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-RGYuVfkoNjWmxsvvrtpwJQ-1; Wed, 04 Jan 2023 16:37:45 -0500
X-MC-Unique: RGYuVfkoNjWmxsvvrtpwJQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 u187-20020a1fabc4000000b003ca3e899f8fso9549819vke.22
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 13:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wons4RCbjWEG22bGkUNjld4w2j8dFCWYTiGF3tCJ2oQ=;
 b=usMUdpyel3hyr6r9bybGkB1oz+lYuRCvbdizFc3804CxKg/+jXOjAb5msJqXbyeTHi
 /5ICfCv50a3AfKRqTq0onwS0JbNqHw2clyu4Sxif5KZRPhU33/1NP+8Plfw/GqdWc7o7
 pv4KK4ZGHvMCvoybElW+WZqx8Zym5rTXdNKSyUUObFpfcTucTNWvN+LwqVJQjUlkuF0K
 FDoJg5VXrBnMt4C3cf2HhXjaCEO+GDWnG08T+ZMipGso90Qw5v0dsiTWd+5MWU1D36y9
 d84rGShW1Ns1H4R7PncmWEgMIge5DqgrpXA4K5wDmLGr3DfDKK80+5Rk/9xe01yRVqMa
 tnUw==
X-Gm-Message-State: AFqh2kp/Kr4nDd7XjMLES9MQZap1jMBUubLvo2G9oIo1wDRgtpHFuCc7
 mg2aKEBRE2X/Gq94eKkS9fYg+BBrqK1fF0gdhyb++0s+u1FeRfiFv+B//Xigt0CO9Rh3CYwk+0E
 7RLrPrVM7lIdWgHt6SIIcrnw8U8vFbkk=
X-Received: by 2002:a67:2204:0:b0:3b5:2762:568b with SMTP id
 i4-20020a672204000000b003b52762568bmr5929075vsi.62.1672868265180; 
 Wed, 04 Jan 2023 13:37:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3dZw8GN6A4S3NmimD5t+UaV6zxZm80RbxcMQrtqtk90huwtyzQ7inqBEHndBrrIjt/83jLHzfc24q006NuF4=
X-Received: by 2002:a67:2204:0:b0:3b5:2762:568b with SMTP id
 i4-20020a672204000000b003b52762568bmr5929072vsi.62.1672868264847; Wed, 04 Jan
 2023 13:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20230104195633.86143-1-stefanha@redhat.com>
In-Reply-To: <20230104195633.86143-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 4 Jan 2023 22:37:34 +0100
Message-ID: <CABgObfZmc7YNCRQWqhuJSDxi-Pz7B1HJCEDmLZDaj_MPPm+83A@mail.gmail.com>
Subject: Re: [PATCH] block-backend: fix virtio-scsi assertion failure with
 blk_drain_noref()
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Qing Wang <qinwang@redhat.com>, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000aec5de05f176fea0"
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

--000000000000aec5de05f176fea0
Content-Type: text/plain; charset="UTF-8"

blk_root_drained_end is not thread-safe too. I started looking at that with
https://www.mail-archive.com/qemu-devel@nongnu.org/msg925670.html; that's
certainly a prerequisite for this patch to be a full fix, but I have not
checked if it's enough because I don't have the QEMU sources at hand right
now.

Paolo

Il mer 4 gen 2023, 20:56 Stefan Hajnoczi <stefanha@redhat.com> ha scritto:

> scsi_device_purge_requests() is called from I/O code by virtio-scsi TMF
> emulation code. It must not call Global State APIs like blk_drain()
> because that results in an assertion failure.
>
> blk_drain() is a Global State API because it uses bdrv_unref(). Actually
> ref/unref is unnecessary in device emulation code because the drive=
> qdev property holds the reference.
>
> Introduce blk_drain_noref(), a variant of blk_drain() that is
> IO_OR_GS_CODE() and doesn't take a reference to the BlockBackend.
>
> This fixes the following virtio-scsi IOThread assertion failure when
> hot-plugging scsi-hd devices:
>
>   qemu-kvm: ../block/block-backend.c:1780: void blk_drain(BlockBackend *):
> Assertion `qemu_in_main_thread()' failed.
>
>   #0  0x00007f4b6a0a154c __pthread_kill_implementation (libc.so.6>
>   #1  0x00007f4b6a054d46 raise (libc.so.6 + 0x54d46)
>   #2  0x00007f4b6a0287f3 abort (libc.so.6 + 0x287f3)
>   #3  0x00007f4b6a02871b __assert_fail_base.cold (libc.so.6 + 0x2>
>   #4  0x00007f4b6a04dce6 __assert_fail (libc.so.6 + 0x4dce6)
>   #5  0x000055c811253ac0 blk_drain (qemu-kvm + 0x808ac0)
>   #6  0x000055c810ecb951 scsi_device_purge_requests (qemu-kvm + 0>
>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^
>   #7  0x000055c810ed6ab8 scsi_disk_reset (qemu-kvm + 0x48bab8)
>   #8  0x000055c8111dc908 resettable_phase_hold (qemu-kvm + 0x7919>
>   #9  0x000055c8111db7f0 device_cold_reset (qemu-kvm + 0x7907f0)
>   #10 0x000055c8110bb1a6 virtio_scsi_handle_ctrl (qemu-kvm + 0x67>
>   #11 0x000055c8110d458f virtio_queue_host_notifier_read (qemu-kv>
>   #12 0x000055c811404a73 aio_dispatch_handler (qemu-kvm + 0x9b9a7>
>   #13 0x000055c811405743 aio_poll (qemu-kvm + 0x9ba743)
>   #14 0x000055c81121d532 iothread_run (qemu-kvm + 0x7d2532)
>   #15 0x000055c81140926a qemu_thread_start (qemu-kvm + 0x9be26a)
>   #16 0x00007f4b6a09f802 start_thread (libc.so.6 + 0x9f802)
>   #17 0x00007f4b6a03f450 __clone3 (libc.so.6 + 0x3f450)
>
> Reported-by: Qing Wang <qinwang@redhat.com>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2155748
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/sysemu/block-backend-io.h |  1 +
>  block/block-backend.c             | 23 +++++++++++++++++++++++
>  hw/scsi/scsi-bus.c                |  2 +-
>  3 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/include/sysemu/block-backend-io.h
> b/include/sysemu/block-backend-io.h
> index 7ec6d978d4..f73db1f77c 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -73,6 +73,7 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);
>  int blk_get_max_iov(BlockBackend *blk);
>  int blk_get_max_hw_iov(BlockBackend *blk);
>
> +void blk_drain_noref(BlockBackend *blk);
>  void blk_io_plug(BlockBackend *blk);
>  void blk_io_unplug(BlockBackend *blk);
>  AioContext *blk_get_aio_context(BlockBackend *blk);
> diff --git a/block/block-backend.c b/block/block-backend.c
> index ba7bf1d6bc..20914bae7b 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1815,6 +1815,29 @@ void blk_drain(BlockBackend *blk)
>      }
>  }
>
> +/*
> + * Same as blk_drain() but the caller must hold a reference to blk. May be
> + * called from Global State or I/O API code. Device emulation can call
> this
> + * because the qdev drive= property holds the reference.
> + */
> +void blk_drain_noref(BlockBackend *blk)
> +{
> +    BlockDriverState *bs = blk_bs(blk);
> +    IO_OR_GS_CODE();
> +
> +    if (bs) {
> +        bdrv_drained_begin(bs);
> +    }
> +
> +    /* We may have -ENOMEDIUM completions in flight */
> +    AIO_WAIT_WHILE(blk_get_aio_context(blk),
> +                   qatomic_mb_read(&blk->in_flight) > 0);
> +
> +    if (bs) {
> +        bdrv_drained_end(bs);
> +    }
> +}
> +
>  void blk_drain_all(void)
>  {
>      BlockBackend *blk = NULL;
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index ceceafb2cd..110fd85106 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -1663,7 +1663,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev,
> SCSISense sense)
>          req = QTAILQ_FIRST(&sdev->requests);
>          scsi_req_cancel_async(req, NULL);
>      }
> -    blk_drain(sdev->conf.blk);
> +    blk_drain_noref(sdev->conf.blk);
>      aio_context_release(blk_get_aio_context(sdev->conf.blk));
>      scsi_device_set_ua(sdev, sense);
>  }
> --
> 2.39.0
>
>

--000000000000aec5de05f176fea0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>blk_root_drained_end is not thread-safe too. I start=
ed looking at that with=C2=A0<a href=3D"https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg925670.html">https://www.mail-archive.com/qemu-devel@non=
gnu.org/msg925670.html</a>; that&#39;s certainly a prerequisite for this pa=
tch to be a full fix, but I have not checked if it&#39;s enough because I d=
on&#39;t have the QEMU sources at hand right now.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Paolo<br><br><div class=3D"gmail_quote" dir=3D"au=
to"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 4 gen 2023, 20:56 Stefan H=
ajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=3D"_blank" rel=3D=
"noreferrer">stefanha@redhat.com</a>&gt; ha scritto:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">scsi_device_purge_requests() is called from I/O code by v=
irtio-scsi TMF<br>
emulation code. It must not call Global State APIs like blk_drain()<br>
because that results in an assertion failure.<br>
<br>
blk_drain() is a Global State API because it uses bdrv_unref(). Actually<br=
>
ref/unref is unnecessary in device emulation code because the drive=3D<br>
qdev property holds the reference.<br>
<br>
Introduce blk_drain_noref(), a variant of blk_drain() that is<br>
IO_OR_GS_CODE() and doesn&#39;t take a reference to the BlockBackend.<br>
<br>
This fixes the following virtio-scsi IOThread assertion failure when<br>
hot-plugging scsi-hd devices:<br>
<br>
=C2=A0 qemu-kvm: ../block/block-backend.c:1780: void blk_drain(BlockBackend=
 *): Assertion `qemu_in_main_thread()&#39; failed.<br>
<br>
=C2=A0 #0=C2=A0 0x00007f4b6a0a154c __pthread_kill_implementation (libc.so.6=
&gt;<br>
=C2=A0 #1=C2=A0 0x00007f4b6a054d46 raise (libc.so.6 + 0x54d46)<br>
=C2=A0 #2=C2=A0 0x00007f4b6a0287f3 abort (libc.so.6 + 0x287f3)<br>
=C2=A0 #3=C2=A0 0x00007f4b6a02871b __assert_fail_base.cold (libc.so.6 + 0x2=
&gt;<br>
=C2=A0 #4=C2=A0 0x00007f4b6a04dce6 __assert_fail (libc.so.6 + 0x4dce6)<br>
=C2=A0 #5=C2=A0 0x000055c811253ac0 blk_drain (qemu-kvm + 0x808ac0)<br>
=C2=A0 #6=C2=A0 0x000055c810ecb951 scsi_device_purge_requests (qemu-kvm + 0=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
=C2=A0 #7=C2=A0 0x000055c810ed6ab8 scsi_disk_reset (qemu-kvm + 0x48bab8)<br=
>
=C2=A0 #8=C2=A0 0x000055c8111dc908 resettable_phase_hold (qemu-kvm + 0x7919=
&gt;<br>
=C2=A0 #9=C2=A0 0x000055c8111db7f0 device_cold_reset (qemu-kvm + 0x7907f0)<=
br>
=C2=A0 #10 0x000055c8110bb1a6 virtio_scsi_handle_ctrl (qemu-kvm + 0x67&gt;<=
br>
=C2=A0 #11 0x000055c8110d458f virtio_queue_host_notifier_read (qemu-kv&gt;<=
br>
=C2=A0 #12 0x000055c811404a73 aio_dispatch_handler (qemu-kvm + 0x9b9a7&gt;<=
br>
=C2=A0 #13 0x000055c811405743 aio_poll (qemu-kvm + 0x9ba743)<br>
=C2=A0 #14 0x000055c81121d532 iothread_run (qemu-kvm + 0x7d2532)<br>
=C2=A0 #15 0x000055c81140926a qemu_thread_start (qemu-kvm + 0x9be26a)<br>
=C2=A0 #16 0x00007f4b6a09f802 start_thread (libc.so.6 + 0x9f802)<br>
=C2=A0 #17 0x00007f4b6a03f450 __clone3 (libc.so.6 + 0x3f450)<br>
<br>
Reported-by: Qing Wang &lt;<a href=3D"mailto:qinwang@redhat.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">qinwang@redhat.com</a>&gt;<br>
Buglink: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2155748" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://bugzilla=
.redhat.com/show_bug.cgi?id=3D2155748</a><br>
Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" rel=3D"norefer=
rer noreferrer" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
Cc: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" rel=3D"noreferrer no=
referrer" target=3D"_blank">kwolf@redhat.com</a>&gt;<br>
Cc: Emanuele Giuseppe Esposito &lt;<a href=3D"mailto:eesposit@redhat.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">eesposit@redhat.com</a>&gt;<=
br>
Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">stefanha@redhat.com</a>&gt;<=
br>
---<br>
=C2=A0include/sysemu/block-backend-io.h |=C2=A0 1 +<br>
=C2=A0block/block-backend.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 23 +++++++++++++++++++++++<br>
=C2=A0hw/scsi/scsi-bus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A03 files changed, 25 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backe=
nd-io.h<br>
index 7ec6d978d4..f73db1f77c 100644<br>
--- a/include/sysemu/block-backend-io.h<br>
+++ b/include/sysemu/block-backend-io.h<br>
@@ -73,6 +73,7 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);<=
br>
=C2=A0int blk_get_max_iov(BlockBackend *blk);<br>
=C2=A0int blk_get_max_hw_iov(BlockBackend *blk);<br>
<br>
+void blk_drain_noref(BlockBackend *blk);<br>
=C2=A0void blk_io_plug(BlockBackend *blk);<br>
=C2=A0void blk_io_unplug(BlockBackend *blk);<br>
=C2=A0AioContext *blk_get_aio_context(BlockBackend *blk);<br>
diff --git a/block/block-backend.c b/block/block-backend.c<br>
index ba7bf1d6bc..20914bae7b 100644<br>
--- a/block/block-backend.c<br>
+++ b/block/block-backend.c<br>
@@ -1815,6 +1815,29 @@ void blk_drain(BlockBackend *blk)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+/*<br>
+ * Same as blk_drain() but the caller must hold a reference to blk. May be=
<br>
+ * called from Global State or I/O API code. Device emulation can call thi=
s<br>
+ * because the qdev drive=3D property holds the reference.<br>
+ */<br>
+void blk_drain_noref(BlockBackend *blk)<br>
+{<br>
+=C2=A0 =C2=A0 BlockDriverState *bs =3D blk_bs(blk);<br>
+=C2=A0 =C2=A0 IO_OR_GS_CODE();<br>
+<br>
+=C2=A0 =C2=A0 if (bs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bdrv_drained_begin(bs);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* We may have -ENOMEDIUM completions in flight */<br>
+=C2=A0 =C2=A0 AIO_WAIT_WHILE(blk_get_aio_context(blk),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qatom=
ic_mb_read(&amp;blk-&gt;in_flight) &gt; 0);<br>
+<br>
+=C2=A0 =C2=A0 if (bs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bdrv_drained_end(bs);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0void blk_drain_all(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0BlockBackend *blk =3D NULL;<br>
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c<br>
index ceceafb2cd..110fd85106 100644<br>
--- a/hw/scsi/scsi-bus.c<br>
+++ b/hw/scsi/scsi-bus.c<br>
@@ -1663,7 +1663,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev, SCS=
ISense sense)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req =3D QTAILQ_FIRST(&amp;sdev-&gt;reques=
ts);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scsi_req_cancel_async(req, NULL);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 blk_drain(sdev-&gt;conf.blk);<br>
+=C2=A0 =C2=A0 blk_drain_noref(sdev-&gt;conf.blk);<br>
=C2=A0 =C2=A0 =C2=A0aio_context_release(blk_get_aio_context(sdev-&gt;conf.b=
lk));<br>
=C2=A0 =C2=A0 =C2=A0scsi_device_set_ua(sdev, sense);<br>
=C2=A0}<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div>
</div></div>

--000000000000aec5de05f176fea0--


