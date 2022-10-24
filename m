Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D3760AE38
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:52:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy5l-0007Hw-LT; Mon, 24 Oct 2022 10:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omy5c-0007DH-68
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omy5Z-0002hK-8b
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666620359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=muWwd2YArURnF0+pCHYBTB2ividZSrhyqVfgv0KZHKo=;
 b=GbMuR1cWsOk0W6ZdYjR0wIShWQuOAgmCKA0j62MvH0iWzVmnWBBXT1g+QzVEGrtagQAhCO
 +ATsRASjsdib8uFrOUtDuU5zUTafwmf9WCmNWYpKLC12encAdT9xXEwkW/C1cEtGO7PwmV
 xDk7n7a7k0dEGn9unLOV6SQ8offwXrU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-5vHr8mmGO2WpKRCO5_kU_A-1; Mon, 24 Oct 2022 10:05:54 -0400
X-MC-Unique: 5vHr8mmGO2WpKRCO5_kU_A-1
Received: by mail-wr1-f69.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so3463402wrg.21
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=muWwd2YArURnF0+pCHYBTB2ividZSrhyqVfgv0KZHKo=;
 b=TIJOBqnHZa2ysHuVIc3nrfsgYuWpGvDCJdSoLUM863NU34uXo1rG7D/4/OAWi3xP3N
 WPJ5E8HySHHvvJWq4nmMxJ8C1LJacdxDtFjVzuHPjxrSIliQUW5gXtTYtzEV6atRtD52
 8VChe4mKUSL83Pdc70Mnpr20hS+K4n+lNSV5RQ+8lgU4AwScQNC96QkHmURmnjdfj8pW
 iTGC3IJSC3LIMy4JiA3ptO4gZCN9G7chcQQX5akcr52soRsZdDtj7cFaX+y+dZ9sxzxD
 qr+W6YZ6rAJ2fFG14tB/1ozZzTSI4+vu0G7g6nhnco4yjzPAHHJt3MLZjQUhObzSCBIK
 mz3A==
X-Gm-Message-State: ACrzQf2RsNX13aeruP7NO1q8KbJBt5GZ8ekryqOYfYQdD9g40L7RyoKS
 mE9HYM797j1GHld/U5Zm0927p5POIdTs4LY8eb5rbFTe/zalBaJ+Jk3CwCocQfHzynRGXv0SeVS
 va3Xz7+7FgUmDecU=
X-Received: by 2002:a5d:5c11:0:b0:236:547e:a38b with SMTP id
 cc17-20020a5d5c11000000b00236547ea38bmr11189186wrb.221.1666620353476; 
 Mon, 24 Oct 2022 07:05:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM79ubGKUPbmc9xZdFQpqp3CLJj+Re7ZyUzg6e2Tic0c3aBsum64Zsk/U8gG3kmgvWujzAlNUg==
X-Received: by 2002:a5d:5c11:0:b0:236:547e:a38b with SMTP id
 cc17-20020a5d5c11000000b00236547ea38bmr11189159wrb.221.1666620353253; 
 Mon, 24 Oct 2022 07:05:53 -0700 (PDT)
Received: from redhat.com ([2.54.160.13]) by smtp.gmail.com with ESMTPSA id
 q10-20020adff94a000000b00225307f43fbsm26799526wrr.44.2022.10.24.07.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 07:05:52 -0700 (PDT)
Date: Mon, 24 Oct 2022 10:05:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>
Subject: Re: [PATCH 2/4] vhost: toggle device callbacks using used event idx
Message-ID: <20221024100442-mutt-send-email-mst@kernel.org>
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
 <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
 <20221021041453-mutt-send-email-mst@kernel.org>
 <CACGkMEvNoxKcFBpawaWgtq=YgCh4CXMDD9Y5DUgoZ1Qn-zOwpA@mail.gmail.com>
 <CAJaqyWfVEb8cp4c0m_LEjy-aMCmHMuMUao6zaCOFW3EzyuLF6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJaqyWfVEb8cp4c0m_LEjy-aMCmHMuMUao6zaCOFW3EzyuLF6Q@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Oct 24, 2022 at 04:00:37PM +0200, Eugenio Perez Martin wrote:
> > > It's generally a waste that we don't use endian-ness annotations
> > > the way linux does.
> >
> > Yes, it's worth doing something similar sometime.
> >
> 
> Maybe we could wrap them in some struct like virtio_le16 or virtio_16,
> avoiding at least integer direct assignment? Wrappers like
> cpu_to_virtio16 could return these structs and I think all compilers
> should emit the same code as direct assignment.
> 
> Thanks!
> 

This will break bitwise operations such as | and &.
Generally Linux has solved the problem and I don't think
we should go look for another solution.


> 
> 
> > Thanks
> >
> > >
> > >
> > > > > Thanks
> > > > >
> > > > > > +    } else {
> > > > > > +        svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Make sure the event is enabled before the read of used_idx */
> > > > > >      smp_mb();
> > > > > >      return !vhost_svq_more_used(svq);
> > > > > >  }
> > > > > >
> > > > > >  static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
> > > > > >  {
> > > > > > -    svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > +    /*
> > > > > > +     * No need to disable notification in the event idx case, since used event
> > > > > > +     * index is already an index too far away.
> > > > > > +     */
> > > > > > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > > > > +        svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > +    }
> > > > > >  }
> > > > > >
> > > > > >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
> > > > > > --
> > > > > > 2.31.1
> > > > > >
> > > > >
> > >
> >


