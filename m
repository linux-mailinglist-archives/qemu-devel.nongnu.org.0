Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE9A60C359
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 07:37:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onCb6-0002X1-Hf; Tue, 25 Oct 2022 01:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onCb2-0002Mj-Bw
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onCb0-0001s4-6s
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666676124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bWXrrJrybyTbfzEhdAX36sW9s4SydrM65AhQEAfMPMI=;
 b=QuRA6MkfhcJB9u8mey2F7fd1gp4ccK4bvgvQhjcLFgvUREtRiP+R2xaRCm7jWOQeWxneZ9
 PjYg6CcdK0oHnJsdW/8CuNA4ayEm1O4KUI4iuZEvWNuwwqZQ9JrC4LOLxuJ1PawB4melgp
 r+D5saPGnSRZeCbP0qvvA5/6A2QVnxk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-hM6zmLtpO8i3w3jH08Bgsw-1; Tue, 25 Oct 2022 01:34:43 -0400
X-MC-Unique: hM6zmLtpO8i3w3jH08Bgsw-1
Received: by mail-wm1-f69.google.com with SMTP id
 az35-20020a05600c602300b003c5273b79fdso8509312wmb.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 22:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWXrrJrybyTbfzEhdAX36sW9s4SydrM65AhQEAfMPMI=;
 b=x0754z2K2r6W+OV8k/AeImZIhXv9bPyY2lOtbdhzDOY9Rz1EDu57/oL4deQSpDI6+G
 E2nL6qg4tsmS11rp2JVNblHXWtE17kE7jhTx0Eb9vBlKdjX4NUNQMTH6wvZl2+c69wU1
 /UvXFeSukV8oWsynrjXNZgz1nMdfLUayhRiZGkn6HIr6rugCJj8TiO0hGvbVg1F6JmSr
 ctIkP0wPyeAaXi0n6i6ZF/SEGkrhhoj6SrbmLctIv7JXQd1xFzhLh1PX1MBIcP1A8xxm
 dOvwThXs+o+wZMumANTW9IQzuzWesbFBtKm7F/stHWX9fEdhiRTT1J7cC+/8Yk1Ss6sp
 rPEQ==
X-Gm-Message-State: ACrzQf3xd4HtN/poBlloIQUt6XeuK6e8qkgBO67TwGnAod2n47bL6d8k
 vc5UgQRcZOhdaRGic1b+Mcz6ia1yIx1Pi0U70D7KMIRkY65q5GhIWjLwwonmm8GrjAZ3J0rnEpB
 npOP0fI4WMsUXSME=
X-Received: by 2002:adf:f392:0:b0:236:2c41:d3f5 with SMTP id
 m18-20020adff392000000b002362c41d3f5mr17519382wro.596.1666676081952; 
 Mon, 24 Oct 2022 22:34:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pF3UkUL8PA+fsPaKqcPD9LdZTH1OS3IyZ1gYvl55OaM7ufJKhlzVkAZQ3rQLiycfGhjCjmw==
X-Received: by 2002:adf:f392:0:b0:236:2c41:d3f5 with SMTP id
 m18-20020adff392000000b002362c41d3f5mr17519369wro.596.1666676081739; 
 Mon, 24 Oct 2022 22:34:41 -0700 (PDT)
Received: from redhat.com ([2.52.24.36]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c314800b003c6cd82596esm10354168wmo.43.2022.10.24.22.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 22:34:40 -0700 (PDT)
Date: Tue, 25 Oct 2022 01:34:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>
Subject: Re: [PATCH 2/4] vhost: toggle device callbacks using used event idx
Message-ID: <20221025013159-mutt-send-email-mst@kernel.org>
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
 <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
 <20221021041453-mutt-send-email-mst@kernel.org>
 <CACGkMEvNoxKcFBpawaWgtq=YgCh4CXMDD9Y5DUgoZ1Qn-zOwpA@mail.gmail.com>
 <CAJaqyWfVEb8cp4c0m_LEjy-aMCmHMuMUao6zaCOFW3EzyuLF6Q@mail.gmail.com>
 <20221024100442-mutt-send-email-mst@kernel.org>
 <CACGkMEtB=WimY3c7ErROrh7SiU6L9Y6AeEr7NmNqMNOsYnw54A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEtB=WimY3c7ErROrh7SiU6L9Y6AeEr7NmNqMNOsYnw54A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 10:26:35AM +0800, Jason Wang wrote:
> On Mon, Oct 24, 2022 at 10:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Oct 24, 2022 at 04:00:37PM +0200, Eugenio Perez Martin wrote:
> > > > > It's generally a waste that we don't use endian-ness annotations
> > > > > the way linux does.
> > > >
> > > > Yes, it's worth doing something similar sometime.
> > > >
> > >
> > > Maybe we could wrap them in some struct like virtio_le16 or virtio_16,
> > > avoiding at least integer direct assignment? Wrappers like
> > > cpu_to_virtio16 could return these structs and I think all compilers
> > > should emit the same code as direct assignment.
> > >
> > > Thanks!
> > >
> >
> > This will break bitwise operations such as | and &.
> > Generally Linux has solved the problem and I don't think
> > we should go look for another solution.
> 
> Yes, but it should not block this series (we can do that in the future
> if we had bandwidth).
> 
> Thanks

Sorry I don't get what you are saying. Which series?
Making LE tags structs is not going to fly, this is why sparse
implements the __bitwise__ tag and in fact this is where the name comes
from - bitwise operations need to work.



> >
> >
> > >
> > >
> > > > Thanks
> > > >
> > > > >
> > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > > > > +    } else {
> > > > > > > > +        svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > > +    }
> > > > > > > > +
> > > > > > > > +    /* Make sure the event is enabled before the read of used_idx */
> > > > > > > >      smp_mb();
> > > > > > > >      return !vhost_svq_more_used(svq);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
> > > > > > > >  {
> > > > > > > > -    svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > > +    /*
> > > > > > > > +     * No need to disable notification in the event idx case, since used event
> > > > > > > > +     * index is already an index too far away.
> > > > > > > > +     */
> > > > > > > > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > > > > > > +        svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > > +    }
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
> > > > > > > > --
> > > > > > > > 2.31.1
> > > > > > > >
> > > > > > >
> > > > >
> > > >
> >


