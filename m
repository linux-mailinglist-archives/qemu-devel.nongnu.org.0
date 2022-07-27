Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7435582116
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:30:17 +0200 (CEST)
Received: from localhost ([::1]:49810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbUm-00034Y-MX
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGbPs-0007kU-BL
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:25:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGbPo-0000gO-SD
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658906707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1uhvQJgNgBb/EtrY8/HY6JS8Vo63objp9HUag9lldKg=;
 b=Ow0KRks+sRJjiuH4lW+6VmpxnABMYuWTsbxnh1Mpu0FJjF14EgfG43E/snrh9dLVnocEqB
 dDwsofuuX5VQM4Rs/cAT9Ai722QzBoySDUWXWdxYhuM0fJDrvpKksKeQV50Hx00GwjZeQ+
 wyOhPIyz1/pC50LrKHcBZfYYbq7b/sA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-QYyTMxoWMlWAfdUYALvE_Q-1; Wed, 27 Jul 2022 03:25:06 -0400
X-MC-Unique: QYyTMxoWMlWAfdUYALvE_Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 e19-20020adfa453000000b0021eb66639cbso651408wra.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 00:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=1uhvQJgNgBb/EtrY8/HY6JS8Vo63objp9HUag9lldKg=;
 b=GGWCy4DTsLy4LPYnX82JarQQWkqZiVDAHLfniB1G6uCwuuIrwK6ZD+LFvazhbuOiO/
 d7dh97PZt5MVFsiAewlNb7thLAlnM5gHjjjvatN/cZWeZPdhdeo/FDzvI/Lc+AFSnS8C
 ofnYaov4Fyur4xhREH6SjerOJW8OyKKGimqN2CKiN2vVy+BnkpnOaggOtz4JPYF1vyzO
 HvST6Wqyyy67RTBxRMXH0w8gFj1gN6wC0ACr7YUe/hsYwYVw5KSJn51XkM8DlAkctpzY
 GI+o+clMblkYMZT4gAqw4EFekH+gRmXqIreDm8t44GHDo7ItwYzspk4o/z6+inGxkFXU
 FvQw==
X-Gm-Message-State: AJIora+aInPxSxk3a1v1qkpKz91eVyBUu0i1j9a4iNPc3R/orsMbiwzc
 AR/wmP4WodeKLs1UZMRFu6V7Sk/3GozWgqMnYM4ljL5/ytrKw2Y+WqhHAy3w5syNBY2HwELBOHe
 ANxHokDbCM+5rs3A=
X-Received: by 2002:a5d:4d41:0:b0:21e:a5e3:cb9b with SMTP id
 a1-20020a5d4d41000000b0021ea5e3cb9bmr4027751wru.523.1658906705187; 
 Wed, 27 Jul 2022 00:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vdi1dmMTF6RxBH2H+iNqBm37tUcvS9QzwF73frC4+Mb1+XJ1V8EML989kkzICu8iUiUhyqYQ==
X-Received: by 2002:a5d:4d41:0:b0:21e:a5e3:cb9b with SMTP id
 a1-20020a5d4d41000000b0021ea5e3cb9bmr4027735wru.523.1658906704925; 
 Wed, 27 Jul 2022 00:25:04 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a5d428a000000b0021eaf4138aesm3574743wrq.108.2022.07.27.00.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:25:04 -0700 (PDT)
Date: Wed, 27 Jul 2022 03:25:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
Message-ID: <20220727032334-mutt-send-email-mst@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Jul 27, 2022 at 06:51:56AM +0000, Eli Cohen wrote:
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

Well it will then either have to be for vdpa only, or have
compat machinery to avoid breaking migration.

-- 
MST


