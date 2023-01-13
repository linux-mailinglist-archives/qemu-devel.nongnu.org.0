Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31629669191
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:48:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFhz-0002Hv-WD; Fri, 13 Jan 2023 03:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGFhw-0002Ge-R5
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:46:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGFhu-0005Z0-Sq
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673599598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KugbWgSChDbCvGXr35/IA9L+AFPKn43gND6cpT9OhCA=;
 b=DcfTpR6S3bztNsE9LrdiMrQiJRVztYl8wAletTDOo8tR3SjfSzWh1nsRwC1V6lniLGd2+i
 VR/EkKnPv7tIjFDH1oNxohRz6Ru06Rr7PIrlJnt1dfQML6YoZBLm415smKVN50bbCa6/z5
 RQMJPE4IK608PpTpBhfPOo2tdTohtKM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-3L_7pLToPJefAqcTvYL9xA-1; Fri, 13 Jan 2023 03:46:36 -0500
X-MC-Unique: 3L_7pLToPJefAqcTvYL9xA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-4597b0ff5e9so222533617b3.10
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KugbWgSChDbCvGXr35/IA9L+AFPKn43gND6cpT9OhCA=;
 b=1IWcyrUzGvKyBHVvIr/e8v9VAHlrJhgx4jyAlQn12es5Jq0qvEaEmt/0rry5caAR9J
 1qnL51kcBqmyPyNBtb5xRLi8A3ydylfzpxsJFKdPWO4LadgqpNl+eXMsxlgRVQMG9CGy
 mAOr+/yP3KbA11PHVFAZbGWBVr2noGG/06+iRupifyYqA3k12I4Jp+eLCmeyEk4qkiN7
 t+7eioOEk7AY09WuXgBEg65//ZmhE4rPtMnFgjsnxEtoottanaFOzSahweGS/TBYd4dt
 VujRRIMkEwFIlU5Vl628J46C6rvhWU+DlVPc3stwP8Wf8c+XsiOlf/0GYVZbGbIvIEUj
 LqJw==
X-Gm-Message-State: AFqh2kpNN1KyI5dMNed4URKo35ty6Taa9RxORwbBjAMMFSAaE+OXSPlH
 rxRn+r0+7g9dctZT6WIJtObRXl7Co9xvsjUTFRymI5NhUeyj2pQmd4dRVWHkOk+gNRYB2/mgQ0V
 ng020Vdl8L3h+3fbcMFuTonTh8fHARDI=
X-Received: by 2002:a25:af0a:0:b0:6fb:5983:d192 with SMTP id
 a10-20020a25af0a000000b006fb5983d192mr8770920ybh.163.1673599595928; 
 Fri, 13 Jan 2023 00:46:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsuj72E+VPnk0livZ0vNQZxssfxSa319q4XlltYPe6lGMyzaF9VI95BE35Sl+ydmQ9/dNswuRXNdGU8cuj8VoA=
X-Received: by 2002:a25:af0a:0:b0:6fb:5983:d192 with SMTP id
 a10-20020a25af0a000000b006fb5983d192mr8770904ybh.163.1673599595662; Fri, 13
 Jan 2023 00:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-9-eperezma@redhat.com>
 <CACGkMEuAbJq=uTgeZAPhiJVwbR5UuF9k+5pbFU9OwtiD+Om33w@mail.gmail.com>
In-Reply-To: <CACGkMEuAbJq=uTgeZAPhiJVwbR5UuF9k+5pbFU9OwtiD+Om33w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 13 Jan 2023 09:45:59 +0100
Message-ID: <CAJaqyWe7+4GtXjjdvYF1BWKXXR5A1HWueH9k2unOpmTuv7xSiQ@mail.gmail.com>
Subject: Re: [RFC v2 08/13] vdpa: Negotiate _F_SUSPEND feature
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Jan 13, 2023 at 5:39 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > This is needed for qemu to know it can suspend the device to retrieve
> > its status and enable SVQ with it, so all the process is transparent to
> > the guest.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
> We probably need to add the resume in the future to have a quick
> recovery from migration failures.
>

The capability of a resume can be useful here but only in a small
window. During the most time of the migration SVQ is enabled, so in
the event of a migration failure we may need to reset the whole device
to enable passthrough again.

But maybe is it worth giving a quick review and adding some TODOs
where it can be useful in this series?

Thanks!

> Thanks
>
> > ---
> >  hw/virtio/vhost-vdpa.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 4296427a69..a61a6b2a74 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -659,7 +659,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_=
dev *dev)
> >      uint64_t features;
> >      uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> >          0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> > -        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
> > +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
> > +        0x1ULL << VHOST_BACKEND_F_SUSPEND;
> >      int r;
> >
> >      if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
> > --
> > 2.31.1
> >
>


