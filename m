Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E0C3D17EF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:28:25 +0200 (CEST)
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IpM-0003Xx-Et
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6Idq-0000z9-W9
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:16:31 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6Idp-0007t2-9x
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:16:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id n1so3446366wri.10
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MZSl2VpTiNQkR4xXZUwMqwp9DiokrztNpBD6EnAYj+w=;
 b=XBmVeF02pqS9dvHGfpwa0MzSgHtk2TIDsjJyWYO/CW08grW2uqKsmjJ6P9OoGN3sKZ
 KBT0QZU9v+JvmWEpLb9JwTCC48Sp06wROExTqmG9L1Cs8h5rKhKDHCFcDcNnDIILMHU+
 v7ZtR+ppbAgwR6C+E/fxiyfzZ2Tt3sKEI2hwnuD7ETceXC1Vei7PWIY+gN74QpWKHU7Z
 FLLtpoH63VFJ9YnGvogC/Sa35jxnb9GCO+mx29iDS/aVpQnZ/wLkn3ks68INlr0qP0S3
 LKVRMHe5RTyNg/twffNnaZYhL6Zjph/VXq1eUwoIDNaiUiw3D6LG9yJMnOKW7K6IAw53
 403w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MZSl2VpTiNQkR4xXZUwMqwp9DiokrztNpBD6EnAYj+w=;
 b=jh0mMiaDYXxLVHwyyB4oFlobMOCy14uZ3XUZI5AC19Bo/Ddi2P28+uT986iuQD63P8
 bitGRH06gzmOSL/AJq8TsPN4iI09gYkXLP9elqLlsqk3L8gQp24khHoc6lyBEGqiQsqH
 4olNchQihJQ3yvlDaGGNS4PZKCJ1HTMPw/E3crBr48Uou3M9ZmigLPCLcRYJcmDbCtMW
 YekbuBvcPbEtDa/s1hflOeiEZh4fg8duXWIdYt0Yc+4J7V4HTGgQFsQzIDT8CeIv7jBA
 JjAf0iHoZGoR+106hv2jo9MqiHXssSYvQJ5PimQ8ERAlnApH0WYwlr4jtl8zT+wQLcpt
 BBNw==
X-Gm-Message-State: AOAM531WszbMEbJU7XJQrFFsq8Jimt59uRY6y2bYLf7wuI6YASfO1H6h
 uq7KFWaBiax/F0it2ucugLiPWg==
X-Google-Smtp-Source: ABdhPJw4Ev2hvj4iAWZCC8IrN9OCVHG10HXwqokHOQN5Z0ivG8p2Je6LTfPpwLrPnsSyyZ1wE+uKqA==
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr43656695wry.128.1626898587842; 
 Wed, 21 Jul 2021 13:16:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t9sm26845406wrq.92.2021.07.21.13.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:16:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 749931FF7E;
 Wed, 21 Jul 2021 21:16:26 +0100 (BST)
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
 <20210710005929.1702431-3-mathieu.poirier@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 2/4] vhost-user-rng-pci: Add vhost-user-rng-pci
 implementation
Date: Wed, 21 Jul 2021 21:15:56 +0100
In-reply-to: <20210710005929.1702431-3-mathieu.poirier@linaro.org>
Message-ID: <87czrbxw11.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mathieu Poirier <mathieu.poirier@linaro.org> writes:

> This patch provides a PCI bus interface to the vhost-user-rng backed.
> The implentation is similar to what was done for vhost-user-i2c-pci and
> vhost-user-fs-pci.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
<snip>
> +static void vhost_user_rng_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    VirtioPCIClass *k =3D VIRTIO_PCI_CLASS(klass);
> +    PCIDeviceClass *pcidev_k =3D PCI_DEVICE_CLASS(klass);
> +    k->realize =3D vhost_user_rng_pci_realize;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> +    device_class_set_props(dc, vhost_user_rng_pci_properties);
> +    pcidev_k->vendor_id =3D PCI_VENDOR_ID_REDHAT_QUMRANET;
> +    pcidev_k->device_id =3D 0; /* Set by virtio-pci based on virtio id */
> +    pcidev_k->revision =3D 0x00;
> +    pcidev_k->class_id =3D PCI_CLASS_COMMUNICATION_OTHER;

I noticed the other RNGs use:

 pcidev_k->class_id =3D PCI_CLASS_OTHERS;

--=20
Alex Benn=C3=A9e

