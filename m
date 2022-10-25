Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B830D60C379
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 07:50:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onCnG-0005qU-4O; Tue, 25 Oct 2022 01:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onCmE-0004zd-I3
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:47:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onCmA-0003eU-V5
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666676818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BNm6xR/BngLGijM4avg3LLV9qvMuoO6C/GDpGebfmSY=;
 b=VMWq4c/Z4fIUTybIrphS/rsfemx0jQ/Ahm4HeZAi5n01Hn9hpA+UdZQdY8a20kSNaj5VVD
 h08lOT0+aUTpRWLe/IgjcFEw6MLwYv1BCB/cOUMrWtNxtSH4KpLoPWkaB1k69k/5EygWTg
 kkjw5lMyXtYbLMvoXkVsi4eurR67Apk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-3Bz4Mqm-OMqA4apLHUR6DA-1; Tue, 25 Oct 2022 01:46:56 -0400
X-MC-Unique: 3Bz4Mqm-OMqA4apLHUR6DA-1
Received: by mail-oi1-f198.google.com with SMTP id
 j186-20020aca3cc3000000b003542949670eso2546261oia.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 22:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BNm6xR/BngLGijM4avg3LLV9qvMuoO6C/GDpGebfmSY=;
 b=xWovx496I31/VpbNiQNdbljV2QUKbOgyHVueNV1vil3Shs+ZwTRTkKN50rhjGoKyzF
 JEUbeEZ51O/sqOD82Gckrz9WDuaX+cb3cIMD4NV0+KF3BtaCC8tDv+VB/UumFjqEizfS
 18zwoLViTRR0e+4jQmTYvHCblB5f1TC782KKCR8W6au9ybbEoMoQ3xqLZ3XTa35NjstE
 TG1IStSq3nEjGYNls4CQUWWx/6N1VcK77ZqxBLI9jWv6JzRH1H4ZrNvCt/oj1oWuBYRY
 AS9GsG40o6ooOEJf0MPSSPV9j2Aqpd+Fh8fgPSwfXr2f6GywwJFtwC7txIIs8LAp59OU
 0qwA==
X-Gm-Message-State: ACrzQf3ZaekHFFpibe24xK+xzLsONTprg7HNvVOxCFyX9ZZzFE6rJGns
 T5BUtwW/3IU0ENuibTU15nI163uvKTf2oxa2bpEtmnxvdieamWwnVUKJtRPVGIH3Pw5F64Ho91X
 5Wetp1pK7rETfwgZQAcTCQ+fKJqArAaY=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr31622052oiw.35.1666676815776; 
 Mon, 24 Oct 2022 22:46:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM70Ccs+FJk14W+aVWL6mWRFjWPlYI73Hnz4t+E0mmnQO8b8ptF7izqrAmwetjPP0+U63NlOMa6YUJZOx7E9DN0=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr31622043oiw.35.1666676815569; Mon, 24
 Oct 2022 22:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
 <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
 <20221021041453-mutt-send-email-mst@kernel.org>
 <CACGkMEvNoxKcFBpawaWgtq=YgCh4CXMDD9Y5DUgoZ1Qn-zOwpA@mail.gmail.com>
 <CAJaqyWfVEb8cp4c0m_LEjy-aMCmHMuMUao6zaCOFW3EzyuLF6Q@mail.gmail.com>
 <20221024100442-mutt-send-email-mst@kernel.org>
 <CACGkMEtB=WimY3c7ErROrh7SiU6L9Y6AeEr7NmNqMNOsYnw54A@mail.gmail.com>
 <20221025013159-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221025013159-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 25 Oct 2022 13:46:43 +0800
Message-ID: <CACGkMEur2qO5ZO27HWNCpLBp639P0=CTgU2UA87mYz6_VpiZOA@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Oct 25, 2022 at 1:36 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Oct 25, 2022 at 10:26:35AM +0800, Jason Wang wrote:
> > On Mon, Oct 24, 2022 at 10:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Oct 24, 2022 at 04:00:37PM +0200, Eugenio Perez Martin wrote:
> > > > > > It's generally a waste that we don't use endian-ness annotations
> > > > > > the way linux does.
> > > > >
> > > > > Yes, it's worth doing something similar sometime.
> > > > >
> > > >
> > > > Maybe we could wrap them in some struct like virtio_le16 or virtio_16,
> > > > avoiding at least integer direct assignment? Wrappers like
> > > > cpu_to_virtio16 could return these structs and I think all compilers
> > > > should emit the same code as direct assignment.
> > > >
> > > > Thanks!
> > > >
> > >
> > > This will break bitwise operations such as | and &.
> > > Generally Linux has solved the problem and I don't think
> > > we should go look for another solution.
> >
> > Yes, but it should not block this series (we can do that in the future
> > if we had bandwidth).
> >
> > Thanks
>
> Sorry I don't get what you are saying. Which series?

I meant this series.

> Making LE tags structs is not going to fly, this is why sparse
> implements the __bitwise__ tag and in fact this is where the name comes
> from - bitwise operations need to work.

Yes but do we want to add sparse checks in this series only for shadow
virtqueue code?

Thanks

>
>
>
> > >
> > >
> > > >
> > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > > > +    } else {
> > > > > > > > > +        svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    /* Make sure the event is enabled before the read of used_idx */
> > > > > > > > >      smp_mb();
> > > > > > > > >      return !vhost_svq_more_used(svq);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
> > > > > > > > >  {
> > > > > > > > > -    svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > > > +    /*
> > > > > > > > > +     * No need to disable notification in the event idx case, since used event
> > > > > > > > > +     * index is already an index too far away.
> > > > > > > > > +     */
> > > > > > > > > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > > > > > > > > +        svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > > > > > > > > +    }
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
> > > > > > > > > --
> > > > > > > > > 2.31.1
> > > > > > > > >
> > > > > > > >
> > > > > >
> > > > >
> > >
>


