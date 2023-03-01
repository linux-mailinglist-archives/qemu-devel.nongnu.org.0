Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230386A68FB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 09:38:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXHxI-0008HA-6V; Wed, 01 Mar 2023 03:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXHx8-0008Gc-MS
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXHwz-0006xd-Pg
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677659793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmQ7Yzy/pUXwK4MlFlFCHs0ahg4BlZbD6c0J0eWnFLg=;
 b=NSoAE1PJjkU0dKk56oUKw4ISDGVvsTfqxxkBzLlSC54YUluM3sT1i33NM6NVDIuPdN0cNr
 iTFycGSq+AzxJmBRMitBhfuDZAmF/my54cS+S6wAaf6bxAM3p9b9h+KRMuIleW0tJW72wK
 /dxu9hKMkAaa0ktojy78J0R/lDaQOHo=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-DA6e38OOP0uzpoKpD_tfTA-1; Wed, 01 Mar 2023 03:36:32 -0500
X-MC-Unique: DA6e38OOP0uzpoKpD_tfTA-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1722c3691cfso6884172fac.8
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 00:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EmQ7Yzy/pUXwK4MlFlFCHs0ahg4BlZbD6c0J0eWnFLg=;
 b=ZWhJnF6jxdMjcAGKXOAqAwy9fklImOx/aCWFfdIsmEXEZDbH/qYiUFfqEkNCd5Hcja
 FpaLVjzCjZhw0UV2vPNDTOBgTQbBudspHgQ+VjmYQ69c7fUQChk9ZnA3AvTteDZmWOm7
 8mVhHPIC09DbVPjEOOiWz+hkQu8Tzh+ps26vIWyf3xIhF5xTDgbQZ+cRVlnlDwxz6lsU
 7LnStaI/4/T103nSUQqCa52lQ2upS/lctdfrHWT3n3KNc32QV51TP136evOasNbJZwJJ
 tdgNtltzyoKqsx/Ei4TrbQ80J5K3hcd+n3KoTG68l1BG1OlC9O+UcHQstrt9elmwAOIh
 8Cvw==
X-Gm-Message-State: AO0yUKUwmNsX6ykV0GhXgIAuXeCa9YAqW6Op53rwS6I3jngCU7fOHeyW
 52Bjt+J0CoRO/HL3KIVOyrGMH9824istL+x2tTtNuavB3ytUx+BqdwE97APgnXZR4wAmb3IXNxF
 OJML6iE2WJ0eky2VjiJL4cCozrjS6LMg=
X-Received: by 2002:a9d:334:0:b0:688:cf52:71c4 with SMTP id
 49-20020a9d0334000000b00688cf5271c4mr1957692otv.4.1677659791842; 
 Wed, 01 Mar 2023 00:36:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9SQMYn+g3fk0utx2B2iTe1UJgbSJdKj9QUuo+0AAp8+3XJALxdM6Hox7+p1X6aO0TT47xxmsbG0brqZr2nnVw=
X-Received: by 2002:a9d:334:0:b0:688:cf52:71c4 with SMTP id
 49-20020a9d0334000000b00688cf5271c4mr1957682otv.4.1677659791616; Wed, 01 Mar
 2023 00:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20230228142514.2582-1-longpeng2@huawei.com>
In-Reply-To: <20230228142514.2582-1-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 1 Mar 2023 16:36:20 +0800
Message-ID: <CACGkMEtvGwCVzSa1UpXK971bynNqybPAVa3QQ9e9Hw04j-ivHQ@mail.gmail.com>
Subject: Re: [PATCH] memory: avoid unnecessary iteration when updating
 ioeventfds
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: pbonzini@redhat.com, peterx@redhat.com, david@redhat.com, 
 philmd@linaro.org, mst@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com, 
 arei.gonglei@huawei.com, yechuan@huawei.com
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

On Tue, Feb 28, 2023 at 10:25=E2=80=AFPM Longpeng(Mike) <longpeng2@huawei.c=
om> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> When updating ioeventfds, we need to iterate all address spaces and
> iterate all flat ranges of each address space. There is so much
> redundant process that a FlatView would be iterated for so many times
> during one commit (memory_region_transaction_commit).
>
> We can mark a FlatView as UPDATED and then skip it in the next iteration
> and clear the UPDATED flag at the end of the commit. The overhead can
> be significantly reduced.
>
> For example, a VM with 16 vdpa net devices and each one has 65 vectors,
> can reduce the time spent on memory_region_transaction_commit by 95%.
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  include/exec/memory.h |  2 ++
>  softmmu/memory.c      | 28 +++++++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 2e602a2fad..974eabf765 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1093,6 +1093,8 @@ struct FlatView {
>      unsigned nr_allocated;
>      struct AddressSpaceDispatch *dispatch;
>      MemoryRegion *root;
> +#define FLATVIEW_FLAG_IOEVENTFD_UPDATED (1 << 0)
> +    unsigned flags;
>  };
>
>  static inline FlatView *address_space_to_flatview(AddressSpace *as)
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 9d64efca26..71ff996712 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -815,6 +815,15 @@ FlatView *address_space_get_flatview(AddressSpace *a=
s)
>      return view;
>  }
>
> +static void address_space_reset_view_flags(AddressSpace *as, unsigned ma=
sk)
> +{
> +    FlatView *view =3D address_space_get_flatview(as);
> +
> +    if (view->flags & mask) {
> +        view->flags &=3D ~mask;
> +    }
> +}
> +
>  static void address_space_update_ioeventfds(AddressSpace *as)
>  {
>      FlatView *view;
> @@ -825,6 +834,12 @@ static void address_space_update_ioeventfds(AddressS=
pace *as)
>      AddrRange tmp;
>      unsigned i;
>
> +    view =3D address_space_get_flatview(as);
> +    if (view->flags & FLATVIEW_FLAG_IOEVENTFD_UPDATED) {
> +        return;
> +    }
> +    view->flags |=3D FLATVIEW_FLAG_IOEVENTFD_UPDATED;
> +

Won't we lose the listener calls if multiple address spaces have the
same flatview?

Thanks

>      /*
>       * It is likely that the number of ioeventfds hasn't changed much, s=
o use
>       * the previous size as the starting value, with some headroom to av=
oid
> @@ -833,7 +848,6 @@ static void address_space_update_ioeventfds(AddressSp=
ace *as)
>      ioeventfd_max =3D QEMU_ALIGN_UP(as->ioeventfd_nb, 4);
>      ioeventfds =3D g_new(MemoryRegionIoeventfd, ioeventfd_max);
>
> -    view =3D address_space_get_flatview(as);
>      FOR_EACH_FLAT_RANGE(fr, view) {
>          for (i =3D 0; i < fr->mr->ioeventfd_nb; ++i) {
>              tmp =3D addrrange_shift(fr->mr->ioeventfds[i].addr,
> @@ -1086,6 +1100,15 @@ void memory_region_transaction_begin(void)
>      ++memory_region_transaction_depth;
>  }
>
> +static inline void address_space_update_ioeventfds_finish(void)
> +{
> +    AddressSpace *as;
> +
> +    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> +        address_space_reset_view_flags(as, FLATVIEW_FLAG_IOEVENTFD_UPDAT=
ED);
> +    }
> +}
> +
>  void memory_region_transaction_commit(void)
>  {
>      AddressSpace *as;
> @@ -1106,12 +1129,14 @@ void memory_region_transaction_commit(void)
>              }
>              memory_region_update_pending =3D false;
>              ioeventfd_update_pending =3D false;
> +            address_space_update_ioeventfds_finish();
>              MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
>          } else if (ioeventfd_update_pending) {
>              QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>                  address_space_update_ioeventfds(as);
>              }
>              ioeventfd_update_pending =3D false;
> +            address_space_update_ioeventfds_finish();
>          }
>     }
>  }
> @@ -3076,6 +3101,7 @@ void address_space_init(AddressSpace *as, MemoryReg=
ion *root, const char *name)
>      as->name =3D g_strdup(name ? name : "anonymous");
>      address_space_update_topology(as);
>      address_space_update_ioeventfds(as);
> +    address_space_reset_view_flags(as, FLATVIEW_FLAG_IOEVENTFD_UPDATED);
>  }
>
>  static void do_address_space_destroy(AddressSpace *as)
> --
> 2.23.0
>


