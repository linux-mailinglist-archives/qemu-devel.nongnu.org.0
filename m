Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B8C60C1B2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:27:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on9eb-000661-5y; Mon, 24 Oct 2022 22:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1on9eZ-0005rc-55
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:26:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1on9eX-0005Vz-M7
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666664812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xucOabqKy/VTtQwkPKL7XuDbJ/R9Yz4jrG5/0Trf3fA=;
 b=XH/yK7JtSTgdAsiHVwTkXYtXV/d/3lfI+gsQqIvE3guMN2MMoh8E3+OadpSvI44vif7iD4
 K6X7LUFFxFT3fmb/L2XZuJWEmOYkFuqEiRWWuR5I/06upZVFHRoOhVvBdJzclcomAEuHdA
 Fvngtwbe2MDXxzuRKfoIDImPZEC3TXA=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-296-ICdtuKMcOHusCvkDBgC3iQ-1; Mon, 24 Oct 2022 22:26:48 -0400
X-MC-Unique: ICdtuKMcOHusCvkDBgC3iQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-13b7af40a31so3301575fac.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 19:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xucOabqKy/VTtQwkPKL7XuDbJ/R9Yz4jrG5/0Trf3fA=;
 b=COgmKQd+V27XIxgUZ+ebIFXSUQiohsHJ66/CigdFrZmv2XXB8zJ+1yXn2BlCnP8YmE
 D+xB0pdzVeTxmhlW3OGbERtFCrGAeByL3Ci0qSW/FuuklhXrMbwMzzfaCz4alsAKkqhd
 ekWiJf8b5dhXu3F19SJ318KoTMg7xkqQGkI6pOzdGUuXSpsgGweGD2IJYfSXJ7WRxJZQ
 2wv6m1LA05Wm/zHydwFq4AWvjEFwaUbZjfmcFQ/jPzKR03eJCCgrRaoBUBIPx5a/U8Ev
 A4bKJYLuDElSvfcmZ7lk7Kc2zcisIiBnh3DCl1WKuQIx7ftZnJh6JJWAc+9LE9GBX/IF
 fxYw==
X-Gm-Message-State: ACrzQf31cGTTMlLN9NUnrURxiebLd/ba+UoecWuLU3M74JSO+RMEym7v
 zPDIfct7bi3K67V4vdO9aDHvupyFluzOHfvjii6v2GN9Xl9zdV80OzDj9DfWfb/xLmAheCAkF4u
 uJ+Jtjy2iDJmKFwtluPlvdyEDB7TY2q4=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr22347412oab.280.1666664807922; 
 Mon, 24 Oct 2022 19:26:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7GUNNL3SgnnDNXq+mHglZxdkg4A5BO194/CfP2GlSscqdxVRDyTnoN3WjFXfT4uIxxz/fB/ZWVozzsIUeZDeQ=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr22347397oab.280.1666664807759; Mon, 24
 Oct 2022 19:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
 <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
 <20221021041453-mutt-send-email-mst@kernel.org>
 <CACGkMEvNoxKcFBpawaWgtq=YgCh4CXMDD9Y5DUgoZ1Qn-zOwpA@mail.gmail.com>
 <CAJaqyWfVEb8cp4c0m_LEjy-aMCmHMuMUao6zaCOFW3EzyuLF6Q@mail.gmail.com>
 <20221024100442-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221024100442-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 25 Oct 2022 10:26:35 +0800
Message-ID: <CACGkMEtB=WimY3c7ErROrh7SiU6L9Y6AeEr7NmNqMNOsYnw54A@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost: toggle device callbacks using used event idx
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, qemu-devel@nongnu.org, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Mon, Oct 24, 2022 at 10:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 24, 2022 at 04:00:37PM +0200, Eugenio Perez Martin wrote:
> > > > It's generally a waste that we don't use endian-ness annotations
> > > > the way linux does.
> > >
> > > Yes, it's worth doing something similar sometime.
> > >
> >
> > Maybe we could wrap them in some struct like virtio_le16 or virtio_16,
> > avoiding at least integer direct assignment? Wrappers like
> > cpu_to_virtio16 could return these structs and I think all compilers
> > should emit the same code as direct assignment.
> >
> > Thanks!
> >
>
> This will break bitwise operations such as | and &.
> Generally Linux has solved the problem and I don't think
> we should go look for another solution.

Yes, but it should not block this series (we can do that in the future
if we had bandwidth).

Thanks

>
>
> >
> >
> > > Thanks
> > >
> > > >
> > > >
> > > > > > Thanks
> > > > > >
> > > > > > > +    } else {
> > > > > > > +        svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    /* Make sure the event is enabled before the read of used_idx */
> > > > > > >      smp_mb();
> > > > > > >      return !vhost_svq_more_used(svq);
> > > > > > >  }
> > > > > > >
> > > > > > >  static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
> > > > > > >  {
> > > > > > > -    svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > +    /*
> > > > > > > +     * No need to disable notification in the event idx case, since used event
> > > > > > > +     * index is already an index too far away.
> > > > > > > +     */
> > > > > > > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > > > > > +        svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > +    }
> > > > > > >  }
> > > > > > >
> > > > > > >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
> > > > > > > --
> > > > > > > 2.31.1
> > > > > > >
> > > > > >
> > > >
> > >
>


