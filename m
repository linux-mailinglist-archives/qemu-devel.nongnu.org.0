Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9138695990
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:03:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRpL2-0003NC-JV; Tue, 14 Feb 2023 02:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRpL0-0003N3-Ni
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:02:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRpKy-0004WU-Uj
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676358167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eX3MZZywYjtG+YNGNvQ5nyC7yR9dRiEGdZQ7MZhjx7Q=;
 b=KmvsWMhsvm/OgQ8yaFE6UBYUipjXHJXpRk7Mp4VyEGqRnG8UZwzuth3YZR5FdbdJcIJPk4
 JJd+p8N/9FGc3LhyLkNpZXsHo5K8CTjYeqM//gtPw/3jP5nq4qGkCuU+JkI/mlwuOHliv0
 6HJMGjKl3wLo04MPeJzfQgiimeVQ+TQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-EfKFlpJWM5eD52WNpIWFjw-1; Tue, 14 Feb 2023 02:02:46 -0500
X-MC-Unique: EfKFlpJWM5eD52WNpIWFjw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-5005ef73cf3so150249477b3.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 23:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eX3MZZywYjtG+YNGNvQ5nyC7yR9dRiEGdZQ7MZhjx7Q=;
 b=fPU+qiijykJjV6c5g2C3RSVFWD0t/feLZN3EonFMbhxCPomlkwECxdZ1x5KlMLCjSe
 VQ5KpmvkFJqnAVf+fz4zPz5YFVTfuA4a6pm90LFYe0ZdJNVBNv3nc4t43DKplLFxIJQ0
 Ze+rvbZJWfW03UIrAZIP01ovL80+TA6qbykI3+UEffW8vfbXjChFqLn9PD8/k23w3pUY
 Mggh/wz1X9iQmpVNTi4N+4J9PcArRveeXmXLAlR0m/hJxQjwGbeDsH5kEccb2OZKqkxi
 qSCX3W8Jvyd5E5Kw5IIs1VNpPTJqKUJLZirgIFKp1m+r1K2Unrg8BBesPd3AkFy9YEvW
 owAQ==
X-Gm-Message-State: AO0yUKVCOX8/qPOOH3b6HMXlTZm68Mk/Tvhp3ELFV7YGG8YrPLKZJWJV
 fCTg1QXwHHeAq/W8HeS3H09nYATj6rfcSvj0qOWAAoCFnf+CJ/F0Ipv947cHVMdV0B4aQDwjXjB
 5Aa/nh0Ep69DRW1hOtw6XVVlLt4JcsBc=
X-Received: by 2002:a81:740b:0:b0:52f:99f:e578 with SMTP id
 p11-20020a81740b000000b0052f099fe578mr114839ywc.557.1676358165152; 
 Mon, 13 Feb 2023 23:02:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/uLmdBEskXzIRkVVYt3xqI5sF2SQLH/7h7prYZSWrYce82kEug3n1WF0m/9ECSQeLjYg6x9TU4Vy6uiXpdA7M=
X-Received: by 2002:a81:740b:0:b0:52f:99f:e578 with SMTP id
 p11-20020a81740b000000b0052f099fe578mr114832ywc.557.1676358164936; Mon, 13
 Feb 2023 23:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20230213191929.1547497-1-eperezma@redhat.com>
 <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
In-Reply-To: <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 14 Feb 2023 08:02:08 +0100
Message-ID: <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, Gautam Dawar <gdawar@xilinx.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, 
 longpeng2@huawei.com, Eli Cohen <eli@mellanox.com>, alvaro.karsz@solid-run.com,
 Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
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

On Tue, Feb 14, 2023 at 7:31 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Feb 14, 2023 at 3:19 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > VIRTIO_F_ORDER_PLATFORM indicates that memory accesses by the driver an=
d
> > the device are ordered in a way described by the platform.  Since vDPA
> > devices may be backed by a hardware devices, let's allow
> > VIRTIO_F_ORDER_PLATFORM.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-shadow-virtqueue.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 4307296358..6bb1998f12 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -34,6 +34,7 @@ bool vhost_svq_valid_features(uint64_t features, Erro=
r **errp)
> >          switch (b) {
> >          case VIRTIO_F_ANY_LAYOUT:
> >          case VIRTIO_RING_F_EVENT_IDX:
> > +        case VIRTIO_F_ORDER_PLATFORM:
>
> Do we need to add this bit to vdpa_feature_bits[] as well?
>

If we want to pass it to the guest, yes we should. I'll send another
patch for it.

But I think that should be done on top / in parallel actually.

Open question: Should all vdpa hardware devices offer it? Or this is
only needed on specific archs?

Thanks!


