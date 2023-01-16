Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15BC66C655
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:19:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSC5-0008EY-CQ; Mon, 16 Jan 2023 11:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHSBc-0008AF-Bn
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:18:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHSBa-0000Kw-U2
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673885893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WdHJfZsv10ZQ9bngnpdGZehxx21yFYBcawGJcNoVtI=;
 b=heVwBk/GUVVHzuP2evEQnkE0hMCa5bCsMh8wzSg1LjmeEmyo7/MzNAdpYiZQ4x8Z9DqtuW
 8PwvcvqmAxuKm+fBtNYlyJPhznnfDLrjxjA97O2KkUnqXN41yCU2d4kLzHo7DWIm8oN7up
 SBKyTkzXkD6t+v2tJvaBFiDGHna2p0Q=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-KKTPP-byNQycybaupLctmA-1; Mon, 16 Jan 2023 11:18:11 -0500
X-MC-Unique: KKTPP-byNQycybaupLctmA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-4dedc46e2d5so91489667b3.21
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5WdHJfZsv10ZQ9bngnpdGZehxx21yFYBcawGJcNoVtI=;
 b=C2mdW9935MjjNvKYrCaL0gV/LzuQAPRKyhOCQzF/BTHc/pzIwVU4cAb0uquwlfejY8
 LCtENtGefx7Ioo1t0XLw/v9i0fOE3ZzZFf+zfAPOKnV7uHvc0+KIwhTsShm1O6Ehwf3f
 3ymfdgZcS+cy3X99FG2DQ1VcrM0JlNNibawuqwPe+tUJPSJY9CQ87RHORGfMzzYayaqX
 YJyf8K3GP+qkeLXEV+LEAiBg6HchYuiwyHQkiSZKIREYUhhLeUxxBPvMvk2IvP0q5I6z
 yTwHrJ1Uyh+I4f/ssqD/7Kpz5uamhVK25EyqD5g721oKniVdZgKF+dpqZJWVEL1U7ebu
 19dA==
X-Gm-Message-State: AFqh2kqJ/bdlsJfbgJIzHkMYk+KoVOl6eRZ2CKT+uApXFvNRdYbpTqad
 2InAJ8s5rj8iKYZHr9MDYiiEAf+5OHWwl8BGkdbTujRNiUkfQ2DhdkwkoNDLmfSnwIlKsCRoRbj
 3/ed1LEXZatWtQazrgQTLQPs1U1NA3h8=
X-Received: by 2002:a5b:a8d:0:b0:707:3f66:a611 with SMTP id
 h13-20020a5b0a8d000000b007073f66a611mr44009ybq.216.1673885890939; 
 Mon, 16 Jan 2023 08:18:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtagLgBRoArDwV6AU5Ucvk98lX2imnewPlnxwsksQfApnER6lGXN6/KRa2CUuPkcPTAS4UnM0BfqTF9NXRLwAA=
X-Received: by 2002:a5b:a8d:0:b0:707:3f66:a611 with SMTP id
 h13-20020a5b0a8d000000b007073f66a611mr44003ybq.216.1673885890710; Mon, 16 Jan
 2023 08:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-9-eperezma@redhat.com>
 <CACGkMEuAbJq=uTgeZAPhiJVwbR5UuF9k+5pbFU9OwtiD+Om33w@mail.gmail.com>
 <CAJaqyWe7+4GtXjjdvYF1BWKXXR5A1HWueH9k2unOpmTuv7xSiQ@mail.gmail.com>
 <d94e8807-f828-cfa9-a63b-85365c3b1e25@redhat.com>
In-Reply-To: <d94e8807-f828-cfa9-a63b-85365c3b1e25@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 16 Jan 2023 17:17:34 +0100
Message-ID: <CAJaqyWcAA9PhiCcizwQNBRkVcHmpPVz8uwqKibare0hDRk-+oQ@mail.gmail.com>
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

On Mon, Jan 16, 2023 at 7:48 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/1/13 16:45, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Fri, Jan 13, 2023 at 5:39 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> >>> This is needed for qemu to know it can suspend the device to retrieve
> >>> its status and enable SVQ with it, so all the process is transparent =
to
> >>> the guest.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> Acked-by: Jason Wang <jasowang@redhat.com>
> >>
> >> We probably need to add the resume in the future to have a quick
> >> recovery from migration failures.
> >>
> > The capability of a resume can be useful here but only in a small
> > window. During the most time of the migration SVQ is enabled, so in
> > the event of a migration failure we may need to reset the whole device
> > to enable passthrough again.
>
>
> Yes.
>
>
> >
> > But maybe is it worth giving a quick review and adding some TODOs
> > where it can be useful in this series?
>
>
> We can start by having a TODO in this series, and leave resume in for
> the future.
>

Got it, I'll add in the next series.

Thanks!

> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>> ---
> >>>   hw/virtio/vhost-vdpa.c | 3 ++-
> >>>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 4296427a69..a61a6b2a74 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -659,7 +659,8 @@ static int vhost_vdpa_set_backend_cap(struct vhos=
t_dev *dev)
> >>>       uint64_t features;
> >>>       uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> >>>           0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> >>> -        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
> >>> +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
> >>> +        0x1ULL << VHOST_BACKEND_F_SUSPEND;
> >>>       int r;
> >>>
> >>>       if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)=
) {
> >>> --
> >>> 2.31.1
> >>>
>


