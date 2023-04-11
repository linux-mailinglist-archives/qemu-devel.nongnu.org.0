Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FDF6DCFB2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 04:27:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm3i0-0000Sv-1u; Mon, 10 Apr 2023 22:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pm3hy-0000Sk-Nd
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 22:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pm3hw-0003c9-9l
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 22:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681179967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3FYZ+ekbQPDM7nizTT7x+nWjMakj0iekCue8sk9r34=;
 b=GoWMUlTp6myUthJBgUBxD7Wg4w5gxYwmRFJFhGWa8UogstgXJry97kQJ6y7DRpSTyGnztp
 kGS7rKObGS2DlOI3ZSJcFeAGAM5cdkGs05IrizVuHJc8fPdHwjKnSMamL7DZPX6uqLqrPx
 yx0WGnLMnjIIb+Oi57d9JcKU2G+PcHk=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-y70_DBDUMRy9on9aYk04BQ-1; Mon, 10 Apr 2023 22:26:06 -0400
X-MC-Unique: y70_DBDUMRy9on9aYk04BQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 e67-20020a4a5546000000b0053b50daeaf9so2152617oob.13
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 19:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681179965; x=1683771965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F3FYZ+ekbQPDM7nizTT7x+nWjMakj0iekCue8sk9r34=;
 b=ujnp6siTrO+P8uKVlMjVOY3JVT8aPXB/fP2HakI6wD0PmRTIbPZxTWPJDp47rVZ2s/
 Hazkr5ZhNckVoM2XIlNljhgyQCdSk+I4CiUGMm9XQaLdMpB2ZC2YmkXaAToIIxnVn/Ft
 k/UgYcveeO9m2UaLXqhnFMSVpE9phMVGlNBN1IGj27++HcNb/f7khwtPWKJTFawE/x13
 jZiDyjJxZ9EEusto4ZYbrh+zmUdhC84AAoLypnFGY7D3wUtUEhHRm0gSwg7aQAQVxRqf
 ptkevrRlhdbzvrD7Chu0aPPlQGxqe5U8QVOfKFQWAkiJyLSu76hM6Q52v5Cml8KQD8k7
 5a2w==
X-Gm-Message-State: AAQBX9cDt/NOr+C380hKhdFmh379+yJai1go8kdURCB6mhrCGFnb7i2Y
 ifOlMomP0PLIT/SaWHRcNse/VXhI8aHhOXqfBBHpi/OMF/yCus+jMFIQqKmEVeoerxHdHcpF0b8
 pKd7vWdrl1jo4Ck+/U4n7ohwNaiGR82Y=
X-Received: by 2002:a05:6870:468d:b0:184:502f:e79d with SMTP id
 a13-20020a056870468d00b00184502fe79dmr1738124oap.9.1681179965463; 
 Mon, 10 Apr 2023 19:26:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZOHvuMNR3oG0WTmZElK65yLypRqdumNDFgj00Y8gf6Eyip1HKOEyaPyq1x9rozX7jEABJcamoG39c2Qhedx+w=
X-Received: by 2002:a05:6870:468d:b0:184:502f:e79d with SMTP id
 a13-20020a056870468d00b00184502fe79dmr1738118oap.9.1681179965254; Mon, 10 Apr
 2023 19:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
 <CACGkMEuPo_hyQayJDN=VjaV_BAX3B9hBcxFquVSXPu8nBP21Aw@mail.gmail.com>
 <16c48190-bc4d-3001-3460-d7dfa6041919@huawei.com>
 <CACGkMEsRqsOEVsLeiMxTXBJeN2f+92ZEhTvn6yq+b-V4P_CnSA@mail.gmail.com>
 <CAJaqyWdB-1+ZLe1S1jqzhtz0S+urvJXp2F-pQpH-iq0=GN9SGQ@mail.gmail.com>
In-Reply-To: <CAJaqyWdB-1+ZLe1S1jqzhtz0S+urvJXp2F-pQpH-iq0=GN9SGQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Apr 2023 10:25:54 +0800
Message-ID: <CACGkMEsP_CTz9Mapps9bkUSfU2yMuBQd6jFxpRbLVcvfDh_awA@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>,
 qemu-level <qemu-devel@nongnu.org>, 
 Michael Tsirkin <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Mon, Apr 10, 2023 at 5:05=E2=80=AFPM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Mon, Apr 10, 2023 at 5:22=E2=80=AFAM Jason Wang <jasowang@redhat.com> =
wrote:
> >
> > On Mon, Apr 10, 2023 at 11:17=E2=80=AFAM Longpeng (Mike, Cloud Infrastr=
ucture
> > Service Product Dept.) <longpeng2@huawei.com> wrote:
> > >
> > >
> > >
> > > =E5=9C=A8 2023/4/10 10:14, Jason Wang =E5=86=99=E9=81=93:
> > > > On Wed, Apr 5, 2023 at 7:38=E2=80=AFPM Eugenio Perez Martin <eperez=
ma@redhat.com> wrote:
> > > >>
> > > >> Hi!
> > > >>
> > > >> As mentioned in the last upstream virtio-networking meeting, one o=
f
> > > >> the factors that adds more downtime to migration is the handling o=
f
> > > >> the guest memory (pin, map, etc). At this moment this handling is
> > > >> bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, =
the
> > > >> destination device waits until all the guest memory / state is
> > > >> migrated to start pinning all the memory.
> > > >>
> > > >> The proposal is to bind it to the char device life cycle (open vs
> > > >> close), so all the guest memory can be pinned for all the guest / =
qemu
> > > >> lifecycle.
> > > >>
> > > >> This has two main problems:
> > > >> * At this moment the reset semantics forces the vdpa device to unm=
ap
> > > >> all the memory. So this change needs a vhost vdpa feature flag.
> > > >
> > > > Is this true? I didn't find any codes to unmap the memory in
> > > > vhost_vdpa_set_status().
> > > >
> > >
> > > It could depend on the vendor driver, for example, the vdpasim would =
do
> > > something like that.
> > >
> > > vhost_vdpa_set_status->vdpa_reset->vdpasim_reset->vdpasim_do_reset->v=
host_iotlb_reset
> >
> > This looks like a bug. Or I wonder if any user space depends on this
> > behaviour, if yes, we really need a new flag then.
> >
>
> My understanding was that we depend on this for cases like qemu
> crashes. We don't do an unmap(-1ULL) or anything like that to make
> sure the device is clean when we bind a second qemu to the same
> device. That's why I think that close() should clean them.

In vhost_vdpa_release() we do:

vhost_vdpa_release()
    vhost_vdpa_cleanup()
        for_each_as()
            vhost_vdpa_remove_as()
                vhost_vdpa_iotlb_unmap(0ULL, 0ULL - 1)
        vhost_vdpa_free_domain()

Anything wrong here?

Conceptually, the address mapping is not a part of the abstraction for
a virtio device now. So resetting the memory mapping during virtio
device reset seems wrong.

Thanks

> Or maybe
> even open().
>
> The only other option I see is to remove the whole vhost-vdpa device
> every time, or am I missing something?
>
> Thanks!
>


