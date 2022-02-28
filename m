Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6EB4C71BD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:31:50 +0100 (CET)
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOiw9-0007TE-3U
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:31:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOiuf-0006Y7-0h
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:30:17 -0500
Received: from [2a00:1450:4864:20::536] (port=45597
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOiud-000383-7i
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:30:16 -0500
Received: by mail-ed1-x536.google.com with SMTP id ee12so3702084edb.12
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 08:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VZ6UD+o78+PNMfxJN5jlHaJ1JgveAVHRHGyZHTHhKDg=;
 b=nf/LeOMyQ7vugujptCGURxQi7+7l33nKMG6nY2UXQVpOHd2++fiaYoM6yfvQ0PjjMP
 uZO72V+iCodGlLa6Sf1e2CQOgUgciu3kQxsoLFXnb7vczlh4LdsbCf6JzlDcK8waKEfh
 w38/mz46XtrYTbFLnvr4paj4VDGbANeH3bdLC3HBwsfZyhjxpsbbd1vjG3HrQsl/PVtT
 gzzYWwQxw2tJ4eJQTbWTxtkG4/Ci9N1PajTc+2BAM89S/5BvbU4I6h/75KucYkr2OFVt
 voOCja9gq3artLLVssCdzIYbTsqZCjxHb8+fwE2R23ok1QMKNrlBZBmWJaIN8VwHYnPc
 0u8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VZ6UD+o78+PNMfxJN5jlHaJ1JgveAVHRHGyZHTHhKDg=;
 b=WlCdfus+gGmsOID3gpu4HnRT4zH7ukoQRcRl/6CYd/0p/aIH9IQ+42KKYvXwVppwnO
 kS4QUAKpUTwrfyVG+6uDOisMWcKt/gkRVDV2G4cYDXZXBRMYmceLLIpAcbAL9aQe9NPx
 WQ6pPXcShGgA1vxyFLuKmOHX3kIEvf4Pkem3J7w0IUbR8Q5cgI7UXfIw1QJ95zFhizzr
 7UDIA3EQuqFfFjDv4MQ4s02+iHVdyobkCEHtxwTJ67755jnw6cdjieQVcg7I/LYhpUSU
 yjiKBhdpxzZbkhiTe4TtD33/WEgkbQI7L+PDQ7HQOSbnifydsn7jicKIqJKuBuO+DHCk
 MWVg==
X-Gm-Message-State: AOAM532cy1B4bd8M/AyBvNgEjLzaDSAdTRdvWkCgCCxfRysaEf+kJ/y7
 bTBFwwiXEXjGsS2qxSnPAXcj1A==
X-Google-Smtp-Source: ABdhPJzEry5VKEV4OMCpsC4Ds6risk+zvpZT2p/oTF05GP+JhLq0cQ16S/KtVRNX4tf7P400Hb6TPA==
X-Received: by 2002:a50:fa9a:0:b0:413:4420:518a with SMTP id
 w26-20020a50fa9a000000b004134420518amr19969228edr.168.1646065813257; 
 Mon, 28 Feb 2022 08:30:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 sb31-20020a1709076d9f00b006ceb969822esm4544444ejc.76.2022.02.28.08.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 08:30:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A4451FFB7;
 Mon, 28 Feb 2022 16:30:11 +0000 (GMT)
References: <87ee3q3mos.fsf@linaro.org> <87a6ee3l5e.fsf@linaro.org>
 <YhzWMMLTZY1e24Uh@stefanha-x1.localdomain>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: What is the correct way to handle the VirtIO config space in
 vhost-user?
Date: Mon, 28 Feb 2022 16:16:43 +0000
In-reply-to: <YhzWMMLTZY1e24Uh@stefanha-x1.localdomain>
Message-ID: <87mtiblzsc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> On Fri, Feb 25, 2022 at 05:32:43PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> [Apologies to CC list for repost due to fat fingering the mailing list a=
ddress]
>>=20
<snip>
>>=20
>> (aside: this continues my QOM confusion about when things should be in a
>> class or instance init, up until this point I hadn't needed it in my
>> stub).
>
> Class init is a one-time per-class initializer function. It is mostly
> used for setting up callbacks/overridden methods from the base class.
>
> Instance init is like an object constructor in object-oriented
> programming.

I phrased my statement poorly. What I meant to say is I sometimes find
QEMUs approach to using class over instance initialisation inconsistent.
I think I understand the "policy" as use class init until there is a
case where you can't (e.g. having individual control of each instance of
a device).

> This is not a .get_config() method, it's a VIRTIO configuration change
> notification handler. The vhost-user-blk device server ("slave") sends
> this notification to notify the driver that configuration space contents
> have been updated (e.g. the disk was resized).

So this should come in the initial vhost-user set of handshake messages
if the VHOST_USER_PROTOCOL_F_CONFIG is negotiated between the master and
slave? I guess without this protocol feature vhost-user can't support
writeable config spaces?

> QEMU fetches the new
> config space contents from the device and then forwards the notification
> to the guest.
>
> The .get_config() method for vhost-user-blk.c is:
>
>   static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *c=
onfig)
>   {
>       VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
>=20=20=20
>       /* Our num_queues overrides the device backend */
>       virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
>=20=20=20
>       memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
>   }
>
> vhost_user_blk_update_config() is simple, it copies out s->blkcfg.
>
>> Although this seems to miss the ability to "set" a config - although
>> that seems confusing anyway, surely the guest only ever reads the config
>> space?
>
> VIRTIO allows the driver to write to the config space. This is used to
> toggle the disk write cache on the virtio-blk device, for example.
>
>> So my question is which approach is the correct one? Is one a legacy
>> approach or is it "depends on what you are doing"?
>
> Yes, it depends on whether the device sends configuration space change
> notifications or not. If not, a traditional .get_config() like
> vhost-user-gpu can be used. If yes, then caching the configuration space
> contents like vhost-user-blk is convenient.

Is there any feature flag for this in the VirtIO spec? I had a look and
couldn't see an obvious common one. Does it basically come down to the
verbiage in the Device configure layout section for any given device?

>
> Stefan
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

