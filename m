Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6204F5689BF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 15:42:21 +0200 (CEST)
Received: from localhost ([::1]:51912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o95II-0005qY-55
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 09:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o95GL-00042e-7R
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 09:40:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o95GG-0000mM-OS
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 09:40:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id cl1so22144824wrb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=izgGgzmg903vUkunocekQCofq8bmWQZLLcXOvuup1Bc=;
 b=lS4tgC353aWIsi4PRdxhQLTSPvJ9HVa5tysyld/jQ/+cfDd3lY+XkYEobXOw5nvYHE
 SRShAvA+yjxU7ByIpteVuNvr4ybs17dkVLtZ8mKFyRDRYEb21s/hO/itBtBJHD2vTl7U
 kW0WEJ+ofllldHIdjZa74r9eMoy3MYQA36zmV+zgyKQpG8MazaUp/FFJRySynCZzxVjX
 e/l8ROPfS6K9S2dYygAS1IyNYPWWXfqMvqJwCM3fwNWQGOfY56aBgi6vItaHjXOg7KuY
 0yBGxLhURxdtc+/N5DDNWgHhsIXY/cdx8F9GrD8bhSMc5aUudfRRu2MNiSBXV3jjX9bz
 SpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=izgGgzmg903vUkunocekQCofq8bmWQZLLcXOvuup1Bc=;
 b=UZaAobw9ZJReZOkVX97iv+iyU3CrZmYqnGYLZU6pUTe6t52PGw7QxIhr3GQ69cpuZ1
 /p3BYI0FZb+VbxLXH7eClNJEq+9r5g4mbQAR0WmddE3zZG5q7C36ZwWJZ+oPtAoL6Qfo
 eeBknrjcLMb+aJVytk5nEuqk8vuJQ/gUh9oOODZcQXRX/iL7Hu2hsx/YYr2bpCmWuGjy
 aUfkoQJ6FRLqStF0G76/sf1hatvAJNqAf+Z58xvk0snl0Or34Fig3K6K9kF2ISq2Co6x
 scXl5gbgsoTHcGh9gIwctls2TPSFI88SXQk083EByIIeaD0lS1KgK4gn5Xoa6VhIpB47
 9pVQ==
X-Gm-Message-State: AJIora+VddRcRWa1bpR0GmaBw2XCSE6p+Kb4Y2rmEbsuBGMWw7xnVmYC
 2K3+scJINKohjJzYo0a/1+/V2g==
X-Google-Smtp-Source: AGRyM1vLtI5X21TGS82HpSIxmxwcDcN4PYye80mfOBnho8oz9mD9kPUt2VH73oUKRqeQY+Ya/OMgkw==
X-Received: by 2002:a05:6000:795:b0:21b:b9a0:6010 with SMTP id
 bu21-20020a056000079500b0021bb9a06010mr36949279wrb.508.1657114806540; 
 Wed, 06 Jul 2022 06:40:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600c4e0800b003974cb37a94sm23009293wmq.22.2022.07.06.06.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 06:40:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D766A1FFB7;
 Wed,  6 Jul 2022 14:40:04 +0100 (BST)
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-6-alex.bennee@linaro.org>
 <20220610083747.GA29012@axis.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH v2 05/15] hw/virtio: add boilerplate for vhost-user-gpio
 device
Date: Wed, 06 Jul 2022 14:37:07 +0100
In-reply-to: <20220610083747.GA29012@axis.com>
Message-ID: <87sfnejr63.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Vincent Whitchurch <vincent.whitchurch@axis.com> writes:

> On Tue, May 24, 2022 at 04:40:46PM +0100, Alex Benn=C3=A9e wrote:
>> +static int vu_gpio_start(VirtIODevice *vdev)
>> +{
>> +    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
>> +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
>> +    VHostUserGPIO *gpio =3D VHOST_USER_GPIO(vdev);
>> +    int ret, i;
>> +
>> +    if (!k->set_guest_notifiers) {
>> +        error_report("binding does not support guest notifiers");
>> +        return -ENOSYS;
>> +    }
>> +
>> +    ret =3D vhost_dev_enable_notifiers(&gpio->vhost_dev, vdev);
>> +    if (ret < 0) {
>> +        error_report("Error enabling host notifiers: %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret =3D k->set_guest_notifiers(qbus->parent, gpio->vhost_dev.nvqs, =
true);
>> +    if (ret < 0) {
>> +        error_report("Error binding guest notifier: %d", ret);
>> +        goto err_host_notifiers;
>> +    }
>> +
>> +    /*
>> +     * Before we start up we need to ensure we have the final feature
>> +     * set needed for the vhost configuration.
>> +     */
>> +    vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->backend_fe=
atures);
>
> This is doing the feature handling differently from the other
> vhost-user-* implementations, and it doesn't seem to work for me.
> Negotiated features (I noticed it with VIRTIO_RING_F_EVENT_IDX) never
> make it to VHOST_USER_SET_FEATURES.
>
> If I change this code to match vhost-user-i2c and the other
> implementations like in the patch below, it works.

Unfortunately the virtio-i2c backend doesn't need
VHOST_USER_F_PROTOCOL_FEATURES which gets squashed with the bellow
changes which is the cause of the eventual failure in the qos-test:

  # Start of read-guest-mem tests=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  vu_net_set_features: 0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  **=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  ERROR:../../tests/qtest/vhost-user-test.c:1031:vu_net_set_features: asser=
tion failed: (msg->payload.u64 & (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES))

which adds to my confusion about the exact route the negotiation of
vhost-user feature bits is meant to make through the code.

>
> The guest is Linux v5.18.  The backend uses libvhost-user and is the one
> posted here (with a few fixes):
>
>  https://lore.kernel.org/lkml/20220311162445.346685-3-vincent.whitchurch@=
axis.com/
>
> 8<-------
> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> index 87e3976880..1dc7af6b03 100644
> --- a/hw/virtio/vhost-user-gpio.c
> +++ b/hw/virtio/vhost-user-gpio.c
> @@ -73,7 +73,7 @@ static int vu_gpio_start(VirtIODevice *vdev)
>       * Before we start up we need to ensure we have the final feature
>       * set needed for the vhost configuration.
>       */
> -    vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->backend_fea=
tures);
> +    gpio->vhost_dev.acked_features =3D vdev->guest_features;
>=20=20
>      ret =3D vhost_dev_start(&gpio->vhost_dev, vdev);
>      if (ret < 0) {
> @@ -156,9 +156,7 @@ static uint64_t vu_gpio_get_features(VirtIODevice *vd=
ev, uint64_t features,
>      virtio_add_feature(&features, VIRTIO_GPIO_F_IRQ);
>      virtio_add_feature(&features, VIRTIO_F_VERSION_1);
>=20=20
> -    vdev->backend_features =3D vhost_get_features(&gpio->vhost_dev, feat=
ure_bits,
> -                                                features);
> -    return vdev->backend_features;
> +    return vhost_get_features(&gpio->vhost_dev, feature_bits, features);
>  }
>=20=20
>  static void vu_gpio_handle_output(VirtIODevice *vdev, VirtQueue *vq)


--=20
Alex Benn=C3=A9e

