Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DA64CDB47
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:49:54 +0100 (CET)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQC3t-0007ex-Iz
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:49:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nQBBh-0007Qm-Ra
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:53:53 -0500
Received: from [2a00:1450:4864:20::634] (port=41798
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nQBBg-0004oO-23
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:53:53 -0500
Received: by mail-ej1-x634.google.com with SMTP id a8so18698308ejc.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 08:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=frn2s++pqbsNc1p3ynkpjC0cMg3a4QFMZkbsWENgot0=;
 b=FYBjKbFmI9TL0qeOHYtHs1ESTpF4WUZSceK9U+eXBG9e5PyWwoYA7uMF74FNII10sc
 vJSgt39voBEOccP+wvmBkFKviuL2ByZBh/5eOnbpjiGShzy8iqdDa77yUHqPOpYjRf57
 CCm65LqBoRO6lxcU2y3z67hBZ0vSKDgrSYywaE67dQljlNNDFTKklP01DuPRei9vrVWy
 U6DfyZAYJkaIfPkqir/JPy+z/+OdQSpxEppNt87fQF5NvhnpbuIdJptStXzyO76YmyNY
 DBUfDQWOcmJVQiBBxPTLFI1ue7A+l8quPtJc1F+vHYN8zzUXtCVwu8Xnuvl7AVij17/Q
 yqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=frn2s++pqbsNc1p3ynkpjC0cMg3a4QFMZkbsWENgot0=;
 b=t5C6EzQK8iDo2WQGrInoM9F3Is/tMAbOI7qEjBe1QYHXQmi9pGsLDLLNAcH4pAW/A7
 82fuCPnYuFZtMzylbVzwBuD4yAthX0yEUE5WIxswYNZCqbMUP812Omp1yL8y+I46AHaz
 9vEgO+TqhXMnmslpdupcJ8dygQJUg/eu57HJoWUaXHJKbZx9JI7jJE66u3zIfrYe30tL
 adiGNQ3oWVqG8cCF2JF92efpz21RDFhkJ8Y7Q99AO3MrdJcUX12Grn/0oPoLXJxSfWxp
 VkxooGhy9+MZuI/xeRN9iElugTK/97XDJTYKRR2kUOV9drc+wNgpV651VVcic+2rJDey
 VF1A==
X-Gm-Message-State: AOAM530tvQFVz1iO6C6tx4n4RCXwNuSCVW3Nibylh4ud37FTAIx8ytXN
 oKfOCwRRrvfeNqPU8GQABtnu7A==
X-Google-Smtp-Source: ABdhPJwLnTKEMQczlrK3GAwCkCYShCtKCSm/9B44T3uK0z/qHkfl2nP8IsgHNI0Cbu/vummrmbCDrw==
X-Received: by 2002:a17:906:1613:b0:6cf:1161:eab6 with SMTP id
 m19-20020a170906161300b006cf1161eab6mr31138352ejd.315.1646412829008; 
 Fri, 04 Mar 2022 08:53:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b006dac5f336f8sm524027ejc.124.2022.03.04.08.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:53:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 440EA1FFB7;
 Fri,  4 Mar 2022 16:53:47 +0000 (GMT)
References: <87ee3q3mos.fsf@linaro.org> <87a6ee3l5e.fsf@linaro.org>
 <YhzWMMLTZY1e24Uh@stefanha-x1.localdomain> <87mtiblzsc.fsf@linaro.org>
 <Yh0FV+0SfdPugRRX@stefanha-x1.localdomain>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: What is the correct way to handle the VirtIO config space in
 vhost-user?
Date: Fri, 04 Mar 2022 16:49:30 +0000
In-reply-to: <Yh0FV+0SfdPugRRX@stefanha-x1.localdomain>
Message-ID: <87tucdhd5w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
> On Mon, Feb 28, 2022 at 04:16:43PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>>=20
>> > [[PGP Signed Part:Undecided]]
>> > On Fri, Feb 25, 2022 at 05:32:43PM +0000, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> [Apologies to CC list for repost due to fat fingering the mailing lis=
t address]
>> >>=20
>> <snip>
>> >>=20
>> >> (aside: this continues my QOM confusion about when things should be i=
n a
>> >> class or instance init, up until this point I hadn't needed it in my
>> >> stub).
>> >
>> > Class init is a one-time per-class initializer function. It is mostly
>> > used for setting up callbacks/overridden methods from the base class.
>> >
>> > Instance init is like an object constructor in object-oriented
>> > programming.
>>=20
>> I phrased my statement poorly. What I meant to say is I sometimes find
>> QEMUs approach to using class over instance initialisation inconsistent.
>> I think I understand the "policy" as use class init until there is a
>> case where you can't (e.g. having individual control of each instance of
>> a device).
>>=20
>> > This is not a .get_config() method, it's a VIRTIO configuration change
>> > notification handler. The vhost-user-blk device server ("slave") sends
>> > this notification to notify the driver that configuration space conten=
ts
>> > have been updated (e.g. the disk was resized).
>>=20
>> So this should come in the initial vhost-user set of handshake messages
>> if the VHOST_USER_PROTOCOL_F_CONFIG is negotiated between the master and
>> slave? I guess without this protocol feature vhost-user can't support
>> writeable config spaces?
>
> The VHOST_USER_PROTOCOL_F_CONFIG vhost-user protocol feature bit
> enables:
> 1. VHOST_USER_GET_CONFIG - reading configuration space
> 2. VHOST_USER_SET_CONFIG - writing configuration space
> 3. VHOST_USER_SLAVE_CONFIG_CHANGE_MSG - change notifications
>
> If the vhost-user server is supposed to participate in configuration
> space accesses/notifications, then it needs to implement
> VHOST_USER_PROTOCOL_F_CONFIG.
>
> QEMU's vhost-user-blk assumes the vhost-user server supports
> VHOST_USER_PROTOCOL_F_CONFIG. It's an optional vhost-user protocol
> feature but the virtio-blk device relies on configuration space
> (otherwise QEMU's --device vhost-user-blk wouldn't know the capacity of
> the disk). vhost_user_blk_realize_connect() sends VHOST_USER_GET_CONFIG
> to fetch the configuration space contents when the device is
> instantiated.
>
> Some vhost-user device types don't need VHOST_USER_PROTOCOL_F_CONFIG. In
> that case QEMU's --device vhost-user-FOO implements .get/set_config()
> itself. virtio-net is an example where this is the case.

I wonder when the last time this was tested was because since 1c3e5a2617
(vhost-user: back SET/GET_CONFIG requests with a protocol feature) the
check in vhost_user_backend_init is:

   if (!dev->config_ops || !dev->config_ops->vhost_dev_config_notifier) {
       /* Don't acknowledge CONFIG feature if device doesn't support it */
       dev->protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
   } else if (!(protocol_features &
               (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
       error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONFIG "
                  "but backend does not support it.");
       return -EINVAL;
   }

which means I don't think it ever asks the vhost-user backend.

>
>> > QEMU fetches the new
>> > config space contents from the device and then forwards the notificati=
on
>> > to the guest.
>> >
>> > The .get_config() method for vhost-user-blk.c is:
>> >
>> >   static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t=
 *config)
>> >   {
>> >       VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
>> >=20=20=20
>> >       /* Our num_queues overrides the device backend */
>> >       virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
>> >=20=20=20
>> >       memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
>> >   }
>> >
>> > vhost_user_blk_update_config() is simple, it copies out s->blkcfg.
>> >
>> >> Although this seems to miss the ability to "set" a config - although
>> >> that seems confusing anyway, surely the guest only ever reads the con=
fig
>> >> space?
>> >
>> > VIRTIO allows the driver to write to the config space. This is used to
>> > toggle the disk write cache on the virtio-blk device, for example.
>> >
>> >> So my question is which approach is the correct one? Is one a legacy
>> >> approach or is it "depends on what you are doing"?
>> >
>> > Yes, it depends on whether the device sends configuration space change
>> > notifications or not. If not, a traditional .get_config() like
>> > vhost-user-gpu can be used. If yes, then caching the configuration spa=
ce
>> > contents like vhost-user-blk is convenient.
>>=20
>> Is there any feature flag for this in the VirtIO spec? I had a look and
>> couldn't see an obvious common one. Does it basically come down to the
>> verbiage in the Device configure layout section for any given device?
>
> The contents of the configuration space are device-specific, so there is
> no generic feature flag. Many devices don't update the configuration
> space and therefore don't send change notifications. The details are
> documented for each device type (e.g. "if the driver negotiated the
> VIRTIO_CONSOLE_F_SIZE feature, a configuration change notification
> indicates that the updated size can be read from the configuration
> fields").
>
> I just noticed that VIRTIO does not specify that the virtio-blk capacity
> field can change. The spec is incomplete and I will send a patch for
> that.
>
> Stefan
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

