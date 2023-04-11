Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD36DD2CE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 08:30:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm7VR-0003uu-8t; Tue, 11 Apr 2023 02:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pm7VM-0003uf-JH
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 02:29:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pm7VK-00088F-Sa
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 02:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681194560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVFvqF3Nyil1925rVoJWfW6VkPy21O4afAIPDKWijzE=;
 b=AEbP4n68/CPt3nQ+ykK45Ft3py6U1woqrWiOta7dcFWsioJHeYIOJQy8JOG3KXFmUtxc0G
 h0yrNzUXEZQ9F5/R92ZEVqAWIaOwq3J/wWJpVYTsUGIjD98/EOvGEaeOH57CyG8w1KNifO
 /YPZlVw/V33zoqxKw9eM5pNpFjGzUcY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-vkEXux1GOSGN5oFze936fw-1; Tue, 11 Apr 2023 02:29:11 -0400
X-MC-Unique: vkEXux1GOSGN5oFze936fw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-54c119a5c44so133194297b3.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 23:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681194551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVFvqF3Nyil1925rVoJWfW6VkPy21O4afAIPDKWijzE=;
 b=j2is4AZGyNLO+SK9BXQ0F9x5yZFJUs9ndQZDUUn8ENMRCVkHVruoUmUQq+/pYlmclT
 DDnbM2QQB79ob9Svp8QSRYnITSUWF8LMvWTuCYTj3xG1JLGLKi52l2EzZQuB+ycImofP
 17oblDCnwbs6anUwwi/J6ufj745A7vCMJyO2OoX9R9fPLv0qzd/df/nvVLivCZ6NQUhw
 52QnOLw+DA8C9nxctz0iheQXvBP+5gwY2TnIWmaIInXh20UPtIiC5mDj2doJ1T7Wf+ZJ
 C9YcmMHN3xWsDoKuOW5jaCZ2Z65679lMjhL1/+vy63ClNoLAZlPUnnQ0PF3TaSd6pHod
 vEPw==
X-Gm-Message-State: AAQBX9e6Wulp4Lj21WuCOI+xK/e1jyg40mpKwZ3iOEx9zO3kKelJXuuH
 JpsdedfAjPapLAYIJ/6XFBOtaLZOQtQBhsgwnWPG1pnPvAlk0yv3I1lwfX87guZyDjojozQqsBG
 ZXLgb/Sz+Z8Bb3jW0ky+z4IF5qTxbUPk=
X-Received: by 2002:a81:4420:0:b0:54c:bd4:bc95 with SMTP id
 r32-20020a814420000000b0054c0bd4bc95mr7287851ywa.3.1681194550749; 
 Mon, 10 Apr 2023 23:29:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zyoi1YjAKyqdp+xXPrRAC3pRNDgqLoNbI4wEs8MdAXB+wsG0+Lo1+7VexuwwowvzkVPi7oIVNBCjgWOevBcO8=
X-Received: by 2002:a81:4420:0:b0:54c:bd4:bc95 with SMTP id
 r32-20020a814420000000b0054c0bd4bc95mr7287839ywa.3.1681194550515; Mon, 10 Apr
 2023 23:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
 <CACGkMEuPo_hyQayJDN=VjaV_BAX3B9hBcxFquVSXPu8nBP21Aw@mail.gmail.com>
 <16c48190-bc4d-3001-3460-d7dfa6041919@huawei.com>
 <CACGkMEsRqsOEVsLeiMxTXBJeN2f+92ZEhTvn6yq+b-V4P_CnSA@mail.gmail.com>
 <CAJaqyWdB-1+ZLe1S1jqzhtz0S+urvJXp2F-pQpH-iq0=GN9SGQ@mail.gmail.com>
 <CACGkMEsP_CTz9Mapps9bkUSfU2yMuBQd6jFxpRbLVcvfDh_awA@mail.gmail.com>
In-Reply-To: <CACGkMEsP_CTz9Mapps9bkUSfU2yMuBQd6jFxpRbLVcvfDh_awA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 11 Apr 2023 08:28:34 +0200
Message-ID: <CAJaqyWcF6NMBB+MmgmMnnpKovMDYLoUaDAmVharW33FPmebaMQ@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: Jason Wang <jasowang@redhat.com>
Cc: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>,
 qemu-level <qemu-devel@nongnu.org>, 
 Michael Tsirkin <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Apr 11, 2023 at 4:26=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Mon, Apr 10, 2023 at 5:05=E2=80=AFPM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Mon, Apr 10, 2023 at 5:22=E2=80=AFAM Jason Wang <jasowang@redhat.com=
> wrote:
> > >
> > > On Mon, Apr 10, 2023 at 11:17=E2=80=AFAM Longpeng (Mike, Cloud Infras=
tructure
> > > Service Product Dept.) <longpeng2@huawei.com> wrote:
> > > >
> > > >
> > > >
> > > > =E5=9C=A8 2023/4/10 10:14, Jason Wang =E5=86=99=E9=81=93:
> > > > > On Wed, Apr 5, 2023 at 7:38=E2=80=AFPM Eugenio Perez Martin <eper=
ezma@redhat.com> wrote:
> > > > >>
> > > > >> Hi!
> > > > >>
> > > > >> As mentioned in the last upstream virtio-networking meeting, one=
 of
> > > > >> the factors that adds more downtime to migration is the handling=
 of
> > > > >> the guest memory (pin, map, etc). At this moment this handling i=
s
> > > > >> bound to the virtio life cycle (DRIVER_OK, RESET). In that sense=
, the
> > > > >> destination device waits until all the guest memory / state is
> > > > >> migrated to start pinning all the memory.
> > > > >>
> > > > >> The proposal is to bind it to the char device life cycle (open v=
s
> > > > >> close), so all the guest memory can be pinned for all the guest =
/ qemu
> > > > >> lifecycle.
> > > > >>
> > > > >> This has two main problems:
> > > > >> * At this moment the reset semantics forces the vdpa device to u=
nmap
> > > > >> all the memory. So this change needs a vhost vdpa feature flag.
> > > > >
> > > > > Is this true? I didn't find any codes to unmap the memory in
> > > > > vhost_vdpa_set_status().
> > > > >
> > > >
> > > > It could depend on the vendor driver, for example, the vdpasim woul=
d do
> > > > something like that.
> > > >
> > > > vhost_vdpa_set_status->vdpa_reset->vdpasim_reset->vdpasim_do_reset-=
>vhost_iotlb_reset
> > >
> > > This looks like a bug. Or I wonder if any user space depends on this
> > > behaviour, if yes, we really need a new flag then.
> > >
> >
> > My understanding was that we depend on this for cases like qemu
> > crashes. We don't do an unmap(-1ULL) or anything like that to make
> > sure the device is clean when we bind a second qemu to the same
> > device. That's why I think that close() should clean them.
>
> In vhost_vdpa_release() we do:
>
> vhost_vdpa_release()
>     vhost_vdpa_cleanup()
>         for_each_as()
>             vhost_vdpa_remove_as()
>                 vhost_vdpa_iotlb_unmap(0ULL, 0ULL - 1)
>         vhost_vdpa_free_domain()
>
> Anything wrong here?
>

No, I think we just trusted in different pre-existing cleanup points
"semantics".

> Conceptually, the address mapping is not a part of the abstraction for
> a virtio device now. So resetting the memory mapping during virtio
> device reset seems wrong.
>

I agree. So then no change in the kernel should be needed but to
revert this cleanup on device reset. I guess we should document it
ops->reset just in case?

Thanks!


