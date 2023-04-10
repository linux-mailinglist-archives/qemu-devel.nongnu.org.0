Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521EF6DC2F5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 05:22:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pli6Y-0000CM-R2; Sun, 09 Apr 2023 23:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pli6W-0000CD-W5
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 23:22:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pli6V-0002kE-9J
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 23:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681096922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0absnjEmG146Kl+V6bUyXYKO/Boa50/QazdVTi0Wrq0=;
 b=RnLlm1phUmuqWcLo/Q2iryE+pmHuz162XJpkXoPVAl0WQsRPMEgXpya7BfVWOve8HP2i/Q
 j74hb4w9wFht0qEbr/rkWLCHP5Z1TXfKXpaToMbMwQLMP+UWatD+SDkGsyGwlhGOTG5A4E
 bOrmKGwuqHZDvMrEf1x1ftalkdCgrJY=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-mmfolUssOmuF_e1B7W_4DQ-1; Sun, 09 Apr 2023 23:21:58 -0400
X-MC-Unique: mmfolUssOmuF_e1B7W_4DQ-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1842c947865so2593516fac.0
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 20:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681096917; x=1683688917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0absnjEmG146Kl+V6bUyXYKO/Boa50/QazdVTi0Wrq0=;
 b=h7lpy/0JKc4mhHK5QW9X3ud092H9IUwuOzJzRoE4SxOZGZddO7YCS3Kd0gSdPlCNK0
 ngxFlhOfDhHRUXaHpfp7Du1EpyOTId49yv1vppskfglPMrgZ5RGyWWFmZHALig1+kb27
 4GuGMTiw3TOl55EZ7foNahIUmVyK31OummuWR1Ox3rqQTjWxG5yQn7Io9Bv7DD7orenB
 qV3L305bU5pyhzZ28tIqisu9o93nT6tMLuIcLeXONFqVgEGj4J6p7tSVPccpTQF3iUln
 jcModJDBO4kg2Wvncyj56lA5nWFpfaDTl9iAxiA2NvS7EZFmhFk+A8KF9P6Ogb10PNdq
 qoiA==
X-Gm-Message-State: AAQBX9eigGDdvABm9EA0NoolhXn8sjVcf/9EI8uM8F1FzUDQtuVdar42
 DlZKTeXAlkIz6Toy2EPX+/QG7u+Yu3OIk8+VTRCRKMi9WdR9kcyqPXYBHcyE1Byt7X2quQ/kUuS
 qLEvdHPgtWX9aXlgSCTdWLHsXNMqW0Lw=
X-Received: by 2002:a54:4108:0:b0:389:86c3:b1fb with SMTP id
 l8-20020a544108000000b0038986c3b1fbmr1018321oic.9.1681096917693; 
 Sun, 09 Apr 2023 20:21:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350YTTfHTwcrvQjmMtFGVJI0j4fA0DPxUWZOC+IJvqbPDxHXWMt4B/ioKd9VMUT97JijTrHaCwxEkCEmSdVbWUno=
X-Received: by 2002:a54:4108:0:b0:389:86c3:b1fb with SMTP id
 l8-20020a544108000000b0038986c3b1fbmr1018318oic.9.1681096917499; Sun, 09 Apr
 2023 20:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
 <CACGkMEuPo_hyQayJDN=VjaV_BAX3B9hBcxFquVSXPu8nBP21Aw@mail.gmail.com>
 <16c48190-bc4d-3001-3460-d7dfa6041919@huawei.com>
In-Reply-To: <16c48190-bc4d-3001-3460-d7dfa6041919@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Apr 2023 11:21:46 +0800
Message-ID: <CACGkMEsRqsOEVsLeiMxTXBJeN2f+92ZEhTvn6yq+b-V4P_CnSA@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, 
 Michael Tsirkin <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Mon, Apr 10, 2023 at 11:17=E2=80=AFAM Longpeng (Mike, Cloud Infrastructu=
re
Service Product Dept.) <longpeng2@huawei.com> wrote:
>
>
>
> =E5=9C=A8 2023/4/10 10:14, Jason Wang =E5=86=99=E9=81=93:
> > On Wed, Apr 5, 2023 at 7:38=E2=80=AFPM Eugenio Perez Martin <eperezma@r=
edhat.com> wrote:
> >>
> >> Hi!
> >>
> >> As mentioned in the last upstream virtio-networking meeting, one of
> >> the factors that adds more downtime to migration is the handling of
> >> the guest memory (pin, map, etc). At this moment this handling is
> >> bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, the
> >> destination device waits until all the guest memory / state is
> >> migrated to start pinning all the memory.
> >>
> >> The proposal is to bind it to the char device life cycle (open vs
> >> close), so all the guest memory can be pinned for all the guest / qemu
> >> lifecycle.
> >>
> >> This has two main problems:
> >> * At this moment the reset semantics forces the vdpa device to unmap
> >> all the memory. So this change needs a vhost vdpa feature flag.
> >
> > Is this true? I didn't find any codes to unmap the memory in
> > vhost_vdpa_set_status().
> >
>
> It could depend on the vendor driver, for example, the vdpasim would do
> something like that.
>
> vhost_vdpa_set_status->vdpa_reset->vdpasim_reset->vdpasim_do_reset->vhost=
_iotlb_reset

This looks like a bug. Or I wonder if any user space depends on this
behaviour, if yes, we really need a new flag then.

Thanks

>
> > Thanks
> >
> >> * This may increase the initialization time. Maybe we can delay it if
> >> qemu is not the destination of a LM. Anyway I think this should be
> >> done as an optimization on top.
> >>
> >> Any ideas or comments in this regard?
> >>
> >> Thanks!
> >>
> >
> > .
>


