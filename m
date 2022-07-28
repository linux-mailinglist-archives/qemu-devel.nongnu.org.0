Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF365836B8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 04:11:48 +0200 (CEST)
Received: from localhost ([::1]:55544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGt06-0001Pj-T2
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 22:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGsxv-0008MA-FF
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 22:09:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGsxr-0005Im-II
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 22:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658974165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u7jRuDrTmH3agxFY8Ekj+s9BX5EBpFkAN7QSMXI3yWE=;
 b=JJe7jzTJRfKaIbnuENNzjNA/59gEeXNPpCbAecrZpmGG5Lc3nEXKtgo8Rd93Tp/CeE/x7s
 cGJ0F3zGHUSO/BlGMBeLjdxhbuXs0JWu+2adtEBczjhZvnVUHx/15+sviJ03q851S00X0q
 pzEkdPSbf2jAIjS/BFh6lOsD/zkn1aM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-VlwAenEqNXyb31c-CGcdDA-1; Wed, 27 Jul 2022 22:09:24 -0400
X-MC-Unique: VlwAenEqNXyb31c-CGcdDA-1
Received: by mail-lf1-f71.google.com with SMTP id
 p36-20020a05651213a400b004779d806c13so201876lfa.10
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 19:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u7jRuDrTmH3agxFY8Ekj+s9BX5EBpFkAN7QSMXI3yWE=;
 b=Rsv1t0GxGWhhPHR1JiQvFLajPMQf4/eYNdXhqO9KpsmsmxsGtwOrxTdGaypBLZ1XF3
 V9nxVGLGps03pcKQDBm1HHevzNwRNM7GeNAeZWg6Qfpflfrq5wKWeDF9jpQmaidvrI3A
 6P26luuKt3HoKMafZQBXjpnWYv3YGCHC3lA6wdedUFNwfCrOyQx9n7ZyC0OfMBIATIOr
 OZEXRCpy2cKW/6xau1U8QtwgZFvV+YwiPsDP0GWN71nymXQO54O/o1V1Mp7hZW4WYC3i
 nqMm33jRAE0cnlABEPqg+zDIhyikO73Ke3fTu5dU2vWmuYtlFBYwWG/FYELp/SzVYSSY
 bg7g==
X-Gm-Message-State: AJIora9kxw783NddsynavUTabfpwAyMdURCrnDPWY7ATqbRmebchsUIy
 Fzq2IvCxcQETLKl3LND4zaX+Ot6c470HpMtMm2L8lrPzRYYwV1zALOkOd93nBnSx22SR7X7wNrv
 7M4HxZjHJXIT2D31VuNNNxwAJ1UYxHrc=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr8806846lfu.442.1658974162566; 
 Wed, 27 Jul 2022 19:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpB5y4VhaBCtJzRBm3skgldLoQB36AcdyI82c7M8u2GB49Q1Aadf2AjC4B1mXKIan3lma8uZweiHeMKDMVm8k=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr8806839lfu.442.1658974162177; Wed, 27
 Jul 2022 19:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR12MB5400869D5921E28CE2DC7263AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220719093841-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400F967A710B1151AD5132CAB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <DM8PR12MB5400AB08EE51E6BF05EEBDE2AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Jul 2022 10:09:11 +0800
Message-ID: <CACGkMEtDu9D2ovmWkKEuxqg5POqvMgYNK1_MHWCGMYOG7_t7Qg@mail.gmail.com>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
To: Eli Cohen <elic@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Jul 27, 2022 at 2:52 PM Eli Cohen <elic@nvidia.com> wrote:
>
> I found out that the reason why I could not enforce the mtu stems from the fact that I did not configure max mtu for the net device (e.g. through libvirt <mtu size="9000"/>).
> Libvirt does not allow this configuration for vdpa devices and probably for a reason. The vdpa backend driver has the freedom to do it using its copy of virtio_net_config.
>
> The code in qemu that is responsible to allow to consider the device MTU restriction is here:
>
> static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> {
>     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>     VirtIONet *n = VIRTIO_NET(dev);
>     NetClientState *nc;
>     int i;
>
>     if (n->net_conf.mtu) {
>         n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
>     }
>
> The above code can be interpreted as follows:
> if the command line arguments of qemu indicates that mtu should be limited, then we would read this mtu limitation from the device (that actual value is ignored).
>
> I worked around this limitation by unconditionally setting VIRTIO_NET_F_MTU in the host features. As said, it only indicates that we should read the actual limitation for the device.
>
> If this makes sense I can send a patch to fix this.

I wonder whether it's worth to bother:

1) mgmt (above libvirt) should have the knowledge to prepare the correct XML
2) it's not specific to MTU, we had other features work like, for
example, the multiqueue?

Thanks


