Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9034A60C3F2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 08:44:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onDdD-0003mx-VN; Tue, 25 Oct 2022 02:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onCww-0003rt-16
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onCwu-00050W-0e
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666677482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PsDysnJ7CKbQe7D8O91FYzr8kAjTqXG9/q4D+0Mqv6o=;
 b=MpuuKBwo2uAxOQvGjEga3IourRVYjcpVLK0lIWSB/0wT4ZSnTYDQJtnF/tuKkpBOtAxICR
 Da8x6kFW43MWxYETYmZB8qZw+1ybk6s/nbIyNFi9BkqR51G/PP8qxoAkDEHV6DGAjoYFJq
 2+CJTywGxSc+7MDP6kKMwqoYk0Rhb38=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-snSrnpBZMP6UJazq4_YTnQ-1; Tue, 25 Oct 2022 01:57:58 -0400
X-MC-Unique: snSrnpBZMP6UJazq4_YTnQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h131-20020a1c2189000000b003c56437e529so8535742wmh.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 22:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PsDysnJ7CKbQe7D8O91FYzr8kAjTqXG9/q4D+0Mqv6o=;
 b=lKqa/G2ofgcvDYSzUm3kq+E2rbvBPLNlmhIkPTVnsLgwC6HvY+gHh6H8iqItuzWWkm
 GHOmoiIutzRg5aUXfIsoJIosqkZnLvOw2OMnWiEy/UBE2kcGTHjgyU822EZOxof+VPM6
 n+GqPqTYF4lII/Yr4Q9l9+N+2L5kfZg9tlK98gY8UWGlXnclreIHXO7mOMFl/trOVNo7
 C84E938AnA6ZnaKDA7yc0Jnr54VCt+7WKblsVCXKbW39FGiXePqaTcDtsGUnHvMr+fZP
 tNEA+c9Fbdo0SBF/rdTX+bHpQsyo4NbldFmJC8UMnDp80bdPi5/XDkHFPjZFzYAC+6OX
 jVQg==
X-Gm-Message-State: ACrzQf1jKq4YuXlfZaObzR58703hZHFIuQJZltlrYPFKU5GkP5BUuqXV
 7j173wKolILthdjQa/lwY6PdQfOkECCo9yIo4FV/hI3D1u14W5r8Lw5BFPh2ameSZnqnzhCh//C
 n/BlxPxdtJkwzbZg=
X-Received: by 2002:a05:6000:1052:b0:236:6e8e:8403 with SMTP id
 c18-20020a056000105200b002366e8e8403mr6921178wrx.178.1666677477494; 
 Mon, 24 Oct 2022 22:57:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gKxonz5Cu38GLDsMZnsww3RX0kpjBnjSBVmT2UFq8PBSj/9Dcm2+4aC3ui9d+CAUdsifMDg==
X-Received: by 2002:a05:6000:1052:b0:236:6e8e:8403 with SMTP id
 c18-20020a056000105200b002366e8e8403mr6921154wrx.178.1666677477273; 
 Mon, 24 Oct 2022 22:57:57 -0700 (PDT)
Received: from redhat.com ([2.52.24.36]) by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b003a83ca67f73sm1585635wmi.3.2022.10.24.22.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 22:57:56 -0700 (PDT)
Date: Tue, 25 Oct 2022 01:57:52 -0400
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
Message-ID: <20221025015657-mutt-send-email-mst@kernel.org>
References: <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
 <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
 <20221021041453-mutt-send-email-mst@kernel.org>
 <CACGkMEvNoxKcFBpawaWgtq=YgCh4CXMDD9Y5DUgoZ1Qn-zOwpA@mail.gmail.com>
 <CAJaqyWfVEb8cp4c0m_LEjy-aMCmHMuMUao6zaCOFW3EzyuLF6Q@mail.gmail.com>
 <20221024100442-mutt-send-email-mst@kernel.org>
 <CACGkMEtB=WimY3c7ErROrh7SiU6L9Y6AeEr7NmNqMNOsYnw54A@mail.gmail.com>
 <20221025013159-mutt-send-email-mst@kernel.org>
 <CACGkMEur2qO5ZO27HWNCpLBp639P0=CTgU2UA87mYz6_VpiZOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEur2qO5ZO27HWNCpLBp639P0=CTgU2UA87mYz6_VpiZOA@mail.gmail.com>
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

On Tue, Oct 25, 2022 at 01:46:43PM +0800, Jason Wang wrote:
> On Tue, Oct 25, 2022 at 1:36 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Oct 25, 2022 at 10:26:35AM +0800, Jason Wang wrote:
> > > On Mon, Oct 24, 2022 at 10:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Oct 24, 2022 at 04:00:37PM +0200, Eugenio Perez Martin wrote:
> > > > > > > It's generally a waste that we don't use endian-ness annotations
> > > > > > > the way linux does.
> > > > > >
> > > > > > Yes, it's worth doing something similar sometime.
> > > > > >
> > > > >
> > > > > Maybe we could wrap them in some struct like virtio_le16 or virtio_16,
> > > > > avoiding at least integer direct assignment? Wrappers like
> > > > > cpu_to_virtio16 could return these structs and I think all compilers
> > > > > should emit the same code as direct assignment.
> > > > >
> > > > > Thanks!
> > > > >
> > > >
> > > > This will break bitwise operations such as | and &.
> > > > Generally Linux has solved the problem and I don't think
> > > > we should go look for another solution.
> > >
> > > Yes, but it should not block this series (we can do that in the future
> > > if we had bandwidth).
> > >
> > > Thanks
> >
> > Sorry I don't get what you are saying. Which series?
> 
> I meant this series.
> 
> > Making LE tags structs is not going to fly, this is why sparse
> > implements the __bitwise__ tag and in fact this is where the name comes
> > from - bitwise operations need to work.
> 
> Yes but do we want to add sparse checks in this series only for shadow
> virtqueue code?
> 
> Thanks

No, I think a concerted effort to add endian-ness tagging is more
appropriate. Has nothing to do with shadow vq.


> >
> >
> >
> > > >
> > > >
> > > > >
> > > > >
> > > > > > Thanks
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > > Thanks
> > > > > > > > >
> > > > > > > > > > +    } else {
> > > > > > > > > > +        svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > > > > +    }
> > > > > > > > > > +
> > > > > > > > > > +    /* Make sure the event is enabled before the read of used_idx */
> > > > > > > > > >      smp_mb();
> > > > > > > > > >      return !vhost_svq_more_used(svq);
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > >  static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
> > > > > > > > > >  {
> > > > > > > > > > -    svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > > > > +    /*
> > > > > > > > > > +     * No need to disable notification in the event idx case, since used event
> > > > > > > > > > +     * index is already an index too far away.
> > > > > > > > > > +     */
> > > > > > > > > > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > > > > > > > > +        svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > > > > +    }
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
> > > > > > > > > > --
> > > > > > > > > > 2.31.1
> > > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > > >
> > > >
> >


