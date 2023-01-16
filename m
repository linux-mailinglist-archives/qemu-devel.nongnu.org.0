Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F282966D09C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 22:00:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHWZ4-0005NJ-GU; Mon, 16 Jan 2023 15:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pHWZ2-0005MC-En
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:58:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pHWZ0-0008SX-3T
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673902720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRAJTX95otrd44vy7+Aarg6ySudMVdnngJmtA0fKapM=;
 b=T/9ZjoKJDV1ALj6oE4SZisXq8jO2+wgAwILzzjOGt7JGzAOTJHDoSNlFsmOKI5t6L1hXEu
 CcihXgmA6etjUf7/43XbtI0xKi39PD2noeErZhEWelWxipgfLoLps7AVB9SHtl4XzChbu/
 uWnQHryXeH6p820RO8fOJ0zLiqL/vEk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-zuOfmC8bPyGYZmJ2APNM8g-1; Mon, 16 Jan 2023 15:58:39 -0500
X-MC-Unique: zuOfmC8bPyGYZmJ2APNM8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso18971650wmb.6
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 12:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uRAJTX95otrd44vy7+Aarg6ySudMVdnngJmtA0fKapM=;
 b=JKh6TYp+mjDBPPicRMV44MFAGm4oocHbhREV7LmmiAWRSq//U9x8+3BrPw7vvjIiLC
 XMmzregGh0XsncA6hNN2fFBB7OQi6FDFv3dkbEwmue65B6QAzDJv2c+XfQML51+GBxpO
 CEcFz35OECCdx/VBHvb9viSLxuqwTk51t496hr30INbPLr0xMx26u8zuHtnpU+uuSZL0
 mWkViKIlaMmNjqSpCvELBZuA6C9dvV72p5/5ciGXJjBXz6FABdw2fiVjXOnkAeHv1psB
 3Cg2NXGqz/uLpBzxLK+9CARMz6koMas0TGl4JdXlrY0f1DC/DVKGEXJVw8Ni0So4LJRe
 yHgg==
X-Gm-Message-State: AFqh2kq8VixlAvCTo/Sa0eEWQnLz4/08JTLKXabWrTzbBHk4Hl1jxYz5
 XM+NCh25eTGerwAhhCtQO+hFwQZ6d6WGsmYCjfmlQ2JrAnfQ1UeNJQZPH9sB/3r8Mf9rOhB1df/
 DwNAIGYTWGxxWm0Y=
X-Received: by 2002:a5d:608d:0:b0:2bd:bdad:4cd6 with SMTP id
 w13-20020a5d608d000000b002bdbdad4cd6mr667509wrt.60.1673902718272; 
 Mon, 16 Jan 2023 12:58:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvus9IG1VL2/Nfprsl4Ps0Rzed6x/zBlghyZqiHGU4izTE8eoV2B+uvkfwdRatBt41XCRL+0Q==
X-Received: by 2002:a5d:608d:0:b0:2bd:bdad:4cd6 with SMTP id
 w13-20020a5d608d000000b002bdbdad4cd6mr667486wrt.60.1673902717958; 
 Mon, 16 Jan 2023 12:58:37 -0800 (PST)
Received: from redhat.com ([2.52.132.216]) by smtp.gmail.com with ESMTPSA id
 u5-20020adfdb85000000b002ba2646fd30sm32163673wri.36.2023.01.16.12.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 12:58:37 -0800 (PST)
Date: Mon, 16 Jan 2023 15:58:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <elic@nvidia.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
Message-ID: <20230116153557-mutt-send-email-mst@kernel.org>
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
 <PH0PR12MB5481EB05212DD70C97AC5729DCFF9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthSYTw9JEHT_CM2FdV88eDqan+Ckj7McwTBRK92ziyUg@mail.gmail.com>
 <PH0PR12MB548141C98FA3C7593E4B3C40DCFC9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvriASFy1JTXHPrnP2O99B+mjYY+NMB9x9dHbiG0J7Y3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEvriASFy1JTXHPrnP2O99B+mjYY+NMB9x9dHbiG0J7Y3w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Jan 11, 2023 at 01:51:06PM +0800, Jason Wang wrote:
> On Wed, Jan 11, 2023 at 12:40 PM Parav Pandit <parav@nvidia.com> wrote:
> >
> >
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Tuesday, January 10, 2023 11:35 PM
> > >
> > > On Tue, Jan 10, 2023 at 11:02 AM Parav Pandit <parav@nvidia.com> wrote:
> > > >
> > > > Hi Jason,
> > > >
> > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > Sent: Monday, December 5, 2022 10:25 PM
> > > >
> > > > >
> > > > > A dumb question, any reason we need bother with virtio-net? It looks
> > > > > to me it's not a must and would complicate migration compatibility.
> > > >
> > > > Virtio net vdpa device is processing the descriptors out of order.
> > > > This vdpa device doesn’t offer IN_ORDER flag.
> > > >
> > > > And when a VQ is suspended it cannot complete these descriptors as some
> > > dummy zero length completions.
> > > > The guest VM is flooded with [1].
> > >
> > > Yes, but any reason for the device to do out-of-order for RX?
> > >
> > For some devices it is more optimal to process them out of order.
> > And its not limited to RX.
> 
> TX should be fine, since the device can anyhow pretend to send all
> packets, so we won't have any in-flight descriptors.

And drop them all? You end up with multisecond delays for things like
DHCP. Yes theoretically packets can be dropped at any time, but
practically people expect this to happen on busy systems, not randomly
out of the blue.

> >
> > > >
> > > > So it is needed for the devices that doesn’t offer IN_ORDER feature.
> > > >
> > > > [1]
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
> > > > e/drivers/net/virtio_net.c?h=v6.2-rc3#n1252
> > >
> > > It is only enabled in a debug kernel which should be harmless?
> > it is KERN_DEBUG log level. Its is not debug kernel, just the debug log level.
> 
> Ok, but the production environment should not use that level anyhow.

It's just one example.  And it's enough in my eyes to prove we really
can't start sending zero length RX buffers to drivers and expect all to be
well. If we want to we need to negotiate a new feature bit.


> > And regardless, generating zero length packets for debug kernel is even more confusing.
> 
> Note that it is allowed in the virtio-spec[1] (we probably can fix
> that in the driver) and we have pr_debug() all over this drivers and
> other places. It doesn't cause any side effects except for the
> debugging purpose.
> 
> So I think having inflight tracking is useful, but I'm not sure it's
> worth bothering with virtio-net (or worth to bothering now):
> 
> - zero length is allowed
> - it only helps for debugging
> - may cause issues for migration compatibility
> - requires new infrastructure to be invented
> 
> Thanks
> 
> [1] spec said
> 
> "
> Note: len is particularly useful for drivers using untrusted buffers:
> if a driver does not know exactly how much has been written by the
> device, the driver would have to zero the buffer in advance to ensure
> no data leakage occurs.
> "

I don't think this talks about zero length at all.
Let me try to explain what this talk about in my opinion.


There are cases where device does not know exactly how much
data it wrote into buffer. Should it over-estimate
such that driver can be sure that buffer after the reported
length is unchanged? Or should it instead under-estimate
such that driver can be sure that the reported length has
been initialized by device?

What this text in the spec says is that it must always
under-estimate and not over-estimate. And it attempts to
explain why this is useful: imagine driver that trusts the
device and wants to make sure buffer is initialized.
With the definition in the spec, it only needs to initialize
data after the reported length. Initialize how? It's up to the
driver but for example it can zero this buffer.

In short, all the text says is "do not over-report length,
only set it to part of buffer you wrote".

Besides that, the text itself is from the original spec and it did not
age well:

1)- no one actually relies on this

2)- rather than untrusted "buffers" what we commonly have is untrusted
  devices so length can't be trusted either

3)- writes on PCI are posted and if your security model
  depends on buffer being initialized and you want to
  recover from errors you really can't expect device to
  give you this info. Luckily no one cares see 1) above.


-- 
MST


