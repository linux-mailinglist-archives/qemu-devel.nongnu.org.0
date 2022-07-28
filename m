Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFB5583951
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 09:14:30 +0200 (CEST)
Received: from localhost ([::1]:50978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxj2-0006XX-60
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 03:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGxJc-0001nY-2J
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGxJX-0003nT-2R
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658990885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wmpo3PbPPabv9CIdNU/BXkbr/pucVbSsZrbT/IOI5xc=;
 b=DeY3qTD+JzJKqoKSvYSIiwt18biTT94ip5RKkgJrgKvp6tWeWREBe/6hBmSvPr4N83F/UX
 ysc3jATtCawl6na7di6kc4VN6WwNskNRhSWlsrswN0AcMDovgwEEo/wEYWgihYO/6Xnwo8
 qapvzMVW+VVpZNhByvf1wslw9VqjXxA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-KJAIqxirPrCgJznjPD7Cgg-1; Thu, 28 Jul 2022 02:48:04 -0400
X-MC-Unique: KJAIqxirPrCgJznjPD7Cgg-1
Received: by mail-ed1-f70.google.com with SMTP id
 y5-20020a056402358500b0043c0593d4f6so556936edc.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=wmpo3PbPPabv9CIdNU/BXkbr/pucVbSsZrbT/IOI5xc=;
 b=xqlvpGKYL6MKQiYOuV7KHhitUDGLofVITiABvMJRXnVnLe3QTB1kRxCEuSxJICbJno
 i+87ujQv8JcM43cnG8EavWOMmW+AD5xqRF0/NJ0dJHbNOSQabcKwqmgD0HW4pVU0X4o4
 X3Sc2aqwPRohu2/B6K2nUwT3C1XZPIn44r94RGrCe9SComehcu2sXvoCUAyjNXkmtL1M
 zyMrS7PhNf1FblayHLMjG6Ljp//rr+T25AsDDZPjuYWbRFOWhidfZzuMvpsoGxckMu1q
 RIclVISEJcW1ds5tOD6DfYwATspWvKWfyTDnNvjIg4Ek2BjE1xxg0odgzGxI9VvMRBuT
 U0Tg==
X-Gm-Message-State: AJIora9PsQUQHgjFjhIAYtvZI+InOVC7x/v5BnYJ0i75vZr0I/comFVV
 c8rWo5BQ2ezvwI5DdearJa9fEyfxgsyHIG6E3Ie9kZJc3jrt4vJcH+v1tZQ7q4hE/hJcDiOamFT
 L5kxexOdY4TIzwTw=
X-Received: by 2002:a05:6402:16:b0:43a:f435:5d07 with SMTP id
 d22-20020a056402001600b0043af4355d07mr26409666edu.420.1658990882920; 
 Wed, 27 Jul 2022 23:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s73AS/pDk0TIQ05tJcT+Txzqc8SnVF5s78SD/DtP/kY6hfGpBqTj85UFkKL3BDrKm2LnlXvw==
X-Received: by 2002:a05:6402:16:b0:43a:f435:5d07 with SMTP id
 d22-20020a056402001600b0043af4355d07mr26409646edu.420.1658990882566; 
 Wed, 27 Jul 2022 23:48:02 -0700 (PDT)
Received: from redhat.com ([2.54.183.236]) by smtp.gmail.com with ESMTPSA id
 j21-20020a170906431500b0072af56103casm39000ejm.220.2022.07.27.23.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 23:48:02 -0700 (PDT)
Date: Thu, 28 Jul 2022 02:47:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eli Cohen <elic@nvidia.com>, Eugenio Perez Martin <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
Message-ID: <20220728024712-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB5400AB08EE51E6BF05EEBDE2AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CACGkMEtDu9D2ovmWkKEuxqg5POqvMgYNK1_MHWCGMYOG7_t7Qg@mail.gmail.com>
 <DM8PR12MB5400DBF0BFFF104940BB4A45AB969@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CACGkMEv6AfPsgSBr6P4NqhG=EoXdHhXmAVAZpzWtSkdcJ-Bbxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEv6AfPsgSBr6P4NqhG=EoXdHhXmAVAZpzWtSkdcJ-Bbxw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 28, 2022 at 01:51:37PM +0800, Jason Wang wrote:
> On Thu, Jul 28, 2022 at 1:39 PM Eli Cohen <elic@nvidia.com> wrote:
> >
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Thursday, July 28, 2022 5:09 AM
> > > To: Eli Cohen <elic@nvidia.com>
> > > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; Michael S. Tsirkin <mst@redhat.com>;
> > > virtualization@lists.linux-foundation.org
> > > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > >
> > > On Wed, Jul 27, 2022 at 2:52 PM Eli Cohen <elic@nvidia.com> wrote:
> > > >
> > > > I found out that the reason why I could not enforce the mtu stems from the fact that I did not configure max mtu for the net device
> > > (e.g. through libvirt <mtu size="9000"/>).
> > > > Libvirt does not allow this configuration for vdpa devices and probably for a reason. The vdpa backend driver has the freedom to do
> > > it using its copy of virtio_net_config.
> > > >
> > > > The code in qemu that is responsible to allow to consider the device MTU restriction is here:
> > > >
> > > > static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > > > {
> > > >     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > > >     VirtIONet *n = VIRTIO_NET(dev);
> > > >     NetClientState *nc;
> > > >     int i;
> > > >
> > > >     if (n->net_conf.mtu) {
> > > >         n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
> > > >     }
> > > >
> > > > The above code can be interpreted as follows:
> > > > if the command line arguments of qemu indicates that mtu should be limited, then we would read this mtu limitation from the
> > > device (that actual value is ignored).
> > > >
> > > > I worked around this limitation by unconditionally setting VIRTIO_NET_F_MTU in the host features. As said, it only indicates that
> > > we should read the actual limitation for the device.
> > > >
> > > > If this makes sense I can send a patch to fix this.
> > >
> > > I wonder whether it's worth to bother:
> > >
> > > 1) mgmt (above libvirt) should have the knowledge to prepare the correct XML
> > > 2) it's not specific to MTU, we had other features work like, for
> > > example, the multiqueue?
> > >
> >
> >
> > Currently libvirt does not recognize setting the mtu through XML for vdpa device. So you mean the fix should go to libvirt?
> 
> Probably.
> 
> > Furthermore, even if libvirt supports MTU configuration for a vdpa device, the actual value provided will be ignored and the limitation will be taken from what the vdpa device published in its virtio_net_config structure. That makes the XML configuration binary.
> 
> Yes, we suffer from a similar issue for "queues=". I think we should
> fix qemu by failing the initialization if the value provided by cli
> doesn't match what is read from config space.
> 
> E.g when mtu=9000 was set by cli but the actual mtu is 1500.
> 
> Thanks


Jason most features are passthrough now, no?
Why do you want to make this one special?



> >
> > > Thanks
> >


