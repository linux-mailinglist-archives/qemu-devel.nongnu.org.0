Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D292D4B08F6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 09:56:49 +0100 (CET)
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI5Fw-0008Ex-UI
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 03:56:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nI4rD-0004sP-R6
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:31:15 -0500
Received: from [2a00:1450:4864:20::32d] (port=55984
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nI4rB-0007wm-Dx
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:31:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i19so1549616wmq.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 00:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=n/R7ZF0tBS7/9sAfWpN7KVWaDhjixKByg8AKymqJ+wQ=;
 b=OA6MLzhrrO/klQTor3MkNbjapd7IKZ+ZLfmTD2LK/qquxJ4nQ3LId25D3NlA4MG7wJ
 lX4Tq/mD2R9XBJMN2YDZO4BTOCR8PaAuD/9e3u1ZtnSAdYVZ30zT+bZOV7RRXggFweMS
 xYkV1GYhJjLFx4dU29BcBO3GZDzbS0FYAxdnv2fuRFcLta/PwxZWkoT1lKQfOtZMNVsv
 2aQXkzeOoEHqvwGDTwi6GGdyCwStJ+peqkHnTD/RS6261tXihY6XsLP7xoE/XevTALtQ
 N2XkOeul+ITvsCR/mrxtjrmOKQlaH7cdUjR9mkfSQphlI77g1PQ4VDPaURmkPOZ6s57j
 q1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=n/R7ZF0tBS7/9sAfWpN7KVWaDhjixKByg8AKymqJ+wQ=;
 b=UmoKYon2yS12UjhmB+pKe1f8wNIFIOJSKr7PVxaU+L03bqqwSvwwMEAGNh2/9t3WG4
 cz035KatyaJGxHbSryPVrk2XWLoVF1WGRoSbJhUFmUSx/ao5avPzttXr/IjMJJUTOQXL
 vk1HiEvVQSAeNKr1EKDj+E/x22CG+9cwYvhkVgcAmSRnwxgcoeUPy+dpaLM67FlroiyV
 yQ1AzSRBFGgr43DF8laC6S1qh+Irz5F9vbUReRzv1SL1nx+HsaOH7v8tfwO/VadWMYc6
 18wC9Dpaqz/lqUCRgTVHTxeOLh5K7IEFGAOpSBf0qQJ3kI7YqOGBPszAK+AIw07zf/Dz
 vjYA==
X-Gm-Message-State: AOAM533EGrJRiIE5txjk49GoLYQyOQonUybcuSBR5OVfTcMPkDkHyrqk
 FuQc4GBa1K1hk5/u1Lu6gDLtGw==
X-Google-Smtp-Source: ABdhPJyZsrMuTHPgdExkx1mnxvBm5j5zuqBj42GFm7M5MQXx/Cv1DHqB168051YsxqCru4dpNwMsZg==
X-Received: by 2002:a05:600c:4f84:: with SMTP id
 n4mr1207169wmq.106.1644481871800; 
 Thu, 10 Feb 2022 00:31:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o7sm10681810wrp.25.2022.02.10.00.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 00:31:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A46D01FFB7;
 Thu, 10 Feb 2022 08:31:09 +0000 (GMT)
References: <4f8de2059fc963bb67920a1a2f8481f969a35eec.1641912994.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] hw/vhost-user-i2c: Add support for
 VIRTIO_I2C_F_ZERO_LENGTH_REQUEST
Date: Thu, 10 Feb 2022 08:29:19 +0000
In-reply-to: <4f8de2059fc963bb67920a1a2f8481f969a35eec.1641912994.git.viresh.kumar@linaro.org>
Message-ID: <87czjvdsxe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: stratos-dev@op-lists.linaro.org,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> VIRTIO_I2C_F_ZERO_LENGTH_REQUEST is a mandatory feature, that must be
> implemented by everyone. Add its support.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

but...

<snip>
>      BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> @@ -113,8 +117,10 @@ static void vu_i2c_set_status(VirtIODevice *vdev, ui=
nt8_t status)
>  static uint64_t vu_i2c_get_features(VirtIODevice *vdev,
>                                      uint64_t requested_features, Error *=
*errp)
>  {
> -    /* No feature bits used yet */
> -    return requested_features;
> +    VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
> +
> +    virtio_add_feature(&requested_features, VIRTIO_I2C_F_ZERO_LENGTH_REQ=
UEST);
> +    return vhost_get_features(&i2c->vhost_dev, feature_bits, requested_f=
eatures);
>  }

It's a bit weird we set it and then pass it to the vhost-user backend.
It does raise the question of why the stub actually cares about feature
bits at all when really it's a negotiation with the backend.

IOW what would happen if we just called:

    return vhost_get_features(&i2c->vhost_dev, feature_bits, -1);

>=20=20
>  static void vu_i2c_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> diff --git a/include/hw/virtio/vhost-user-i2c.h b/include/hw/virtio/vhost=
-user-i2c.h
> index deae47a76d55..d8372f3b43ea 100644
> --- a/include/hw/virtio/vhost-user-i2c.h
> +++ b/include/hw/virtio/vhost-user-i2c.h
> @@ -25,4 +25,7 @@ struct VHostUserI2C {
>      bool connected;
>  };
>=20=20
> +/* Virtio Feature bits */
> +#define VIRTIO_I2C_F_ZERO_LENGTH_REQUEST		0
> +
>  #endif /* _QEMU_VHOST_USER_I2C_H */


--=20
Alex Benn=C3=A9e

