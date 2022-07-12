Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DB5571531
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:57:32 +0200 (CEST)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBhz-00083g-CL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBBKN-000466-H3
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:33:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBBKK-0006b7-A0
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657614783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwwGeiIBLA5JtHVjpsQdnU+tqnYHNvE5TdtW3jKtg90=;
 b=SvtcP6lXN2PUq8bSQHgGLphfUPFb8pCjybRgaaV8GQQQLw/4zLfCr53ktp+woq7xeBBooK
 X9bhc/OBmImUjdUiSeW4sSBR+ETh2XyPpMBQHfreAcWp6nieA6ZKKN32bFxxd9VLb7xO4m
 uy2IQF43i6iw94cfkc1SD+lPeohcuy8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-_9kJ-OleMmagsAu8lKw1Sw-1; Tue, 12 Jul 2022 04:33:01 -0400
X-MC-Unique: _9kJ-OleMmagsAu8lKw1Sw-1
Received: by mail-qt1-f198.google.com with SMTP id
 h25-20020ac87779000000b0031ea852ca63so6400032qtu.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 01:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hwwGeiIBLA5JtHVjpsQdnU+tqnYHNvE5TdtW3jKtg90=;
 b=wYpecS4dqs7LRmj7t6fj+PwNXAzVpG5lNXUbscolrzqYo9IDluTy0e3/fZ4G1vE863
 bjFxlW6MUCspJ9XdOs5qtiox3vEV/nE4Wb3sjvQepw5xMFx6t7hqdHdZn9qjhNUBIY8Y
 eoKY2BXwCErDd5Xcrh5IGs0UuempgTXGmmGmQHWITOU+dlMMSoD37SOLUcQEyDNoBM6x
 iwWe/1ppqAHqq1PH1Goc0sVGyWNw3BEBfLNmCSjLszI/AYXB9bJdHbUfxqioGCGwIJjx
 R1hgYXzymKFMIyZJ6AVBdDaHTAVlNlaiRN3POeofJRdbjYMq5A7Gdyqj2oys5jbrNEZN
 mXDg==
X-Gm-Message-State: AJIora8DjIunVBeExC6NSFuJ0rLuVv9A37BqYtzoq78rMFBwV6lZMGfN
 h8sa0kr3V3lXpylb0XlyFD8BCyNMecAJgpTU6kMWoyYSjS2tTtwO0NU/O98tVQwi9hmuMNaFwN9
 X8fNhm84usp8TPDOXxOlse9faCzrBoBM=
X-Received: by 2002:ac8:5b51:0:b0:317:3513:cf60 with SMTP id
 n17-20020ac85b51000000b003173513cf60mr17270435qtw.495.1657614780807; 
 Tue, 12 Jul 2022 01:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1slknWGnidIk4rHxr0dwXP54poR/R3zYmXmxgJpoe2cx+C/xgsXFHRXjA59poUPuTHw9YfEmvk1szOg3/7q9H4=
X-Received: by 2002:ac8:5b51:0:b0:317:3513:cf60 with SMTP id
 n17-20020ac85b51000000b003173513cf60mr17270420qtw.495.1657614780611; Tue, 12
 Jul 2022 01:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-13-eperezma@redhat.com>
 <ffa1e417-846a-0da8-7fa1-fe473e860215@redhat.com>
 <CAJaqyWccXPE5A4wAQb5rymPGfEDjQzNMeVCHhjCAXww2fdk7Pw@mail.gmail.com>
 <bcaee23e-6d48-e35b-856b-97e1d397d418@redhat.com>
In-Reply-To: <bcaee23e-6d48-e35b-856b-97e1d397d418@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 12 Jul 2022 10:32:24 +0200
Message-ID: <CAJaqyWdCuQgK=KR5j=ZOWVgjHfbo0SVn+NsnfWsG+Xb9iDkyrw@mail.gmail.com>
Subject: Re: [RFC PATCH v9 12/23] vhost: Add opaque member to SVQElement
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 12, 2022 at 9:53 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/11 17:56, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Mon, Jul 11, 2022 at 11:05 AM Jason Wang <jasowang@redhat.com> wrote=
:
> >>
> >> =E5=9C=A8 2022/7/7 02:39, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >>> When qemu injects buffers to the vdpa device it will be used to maint=
ain
> >>> contextual data. If SVQ has no operation, it will be used to maintain
> >>> the VirtQueueElement pointer.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-shadow-virtqueue.h |  3 ++-
> >>>    hw/virtio/vhost-shadow-virtqueue.c | 13 +++++++------
> >>>    2 files changed, 9 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-sha=
dow-virtqueue.h
> >>> index 0e434e9fd0..a811f90e01 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> >>> @@ -16,7 +16,8 @@
> >>>    #include "hw/virtio/vhost-iova-tree.h"
> >>>
> >>>    typedef struct SVQElement {
> >>> -    VirtQueueElement *elem;
> >>> +    /* Opaque data */
> >>> +    void *opaque;
> >>
> >> So I wonder if we can simply:
> >>
> >> 1) introduce a opaque to VirtQueueElement
> > (answered in other thread, pasting here for completion)
> >
> > It does not work for messages that are not generated by the guest. For
> > example, the ones used to restore the device state at live migration
> > destination.
>
>
> For the ones that requires more metadata, we can store it in elem->opaque=
?
>

But there is no VirtQueueElem there. VirtQueueElem is allocated by
virtqueue_pop, but state restoring messages are not received by this
function. If we allocate an artificial one, a lot of members do not
make sense (like in_addr / out_addr), and we should never use them
with virtqueue_push / fill / flush and similar.

>
> >
> >> 2) store pointers to ring_id_maps
> >>
> > I think you mean to keep storing VirtQueueElement at ring_id_maps?
>
>
> Yes and introduce a pointer to metadata in VirtQueueElement
>
>
> > Otherwise, looking for them will not be immediate.
> >
> >> Since
> >>
> >> 1) VirtQueueElement's member looks general
> > Not general enough :).
> >
> >> 2) help to reduce the tricky codes like vhost_svq_empty_elem() and
> >> vhost_svq_empty_elem().
> >>
> > I'm ok to change to whatever other method, but to allocate them
> > individually seems worse to me. Both performance wise and because
> > error paths are more complicated. Maybe it would be less tricky if I
> > try to move the use of them less "by value" and more "as pointers"?
>
>
> Or let's having a dedicated arrays (like desc_state/desc_extra in
> kernel) instead of trying to reuse ring_id_maps.
>

Sure, it looks to me like:
* renaming ring_id_maps to desc_state/desc_extra/something similar,
since now it's used to store more state that only the guest mapping
* Rename "opaque" to "data"
* Forget the wrapper and assume data =3D=3D NULL is an invalid head /
empty. To me they serve as a doc, but I guess it's fine to use them
directly. The kernel works that way anyway.

Does this look better? It's definitely closer to the kernel so I guess
it's an advantage.

Thanks!


