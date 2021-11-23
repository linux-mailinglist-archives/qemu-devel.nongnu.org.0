Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F789459C9D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 08:11:14 +0100 (CET)
Received: from localhost ([::1]:58814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpPxQ-0003Ma-QB
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 02:11:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mpPv9-0001Uk-MS
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 02:08:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mpPv5-0006RI-9Z
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 02:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637651325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u1obDHE4/ODi700OU9GicOLNgYNstdNen7URvt3CL4A=;
 b=O5MTqQgUB3hnPUWWUOUDElz5ykfdSxuwuSzQGXrM+O4M3m80T8WWs+AK0CWIZ2SS+9cBIY
 JdEm9lSj0gU/sSITMcP/8lTZTt+vBRXgBlsj3MdAsyvixkPvHWOGpxhVSIXhQPLCHthp8+
 wu4gYVqnD2fBTbFcG70JgWhCxfaXNd8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-gzY9UpnGOJC39skrbHDE_Q-1; Tue, 23 Nov 2021 02:08:41 -0500
X-MC-Unique: gzY9UpnGOJC39skrbHDE_Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 q5-20020a05620a0d8500b0045edb4779dbso16854417qkl.2
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 23:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u1obDHE4/ODi700OU9GicOLNgYNstdNen7URvt3CL4A=;
 b=yf4WbIo6SlAtlLdLTaLjLhyV1i+8H5Ws9h24H44+LirEuIL69FMcGgizp25te7nh1U
 vBXbzFBZBlKyPhkvtqDVWwVj9VnkX9FzSvBM+hViwbcgkwxMmy+tIH46fp7LOCvjzeyO
 Jzdq9pQOL0KPE/wFazawxD2EqG046Grl7v2STG/+WgliiPMakxxTJIzs2gPdYU44h/BN
 Q3SPi8R88LuygsekJH7RCeAs3MWkc2HhqzG/E8fo01UlFuiC+ULegpFh64u3fBf5KcHp
 OQ5kX4omMocyzykCoKGqG9alHHoKWOtRFgdsdzJRM2WyRSgx2gXzCU4pWFPhzOvu4H6G
 tx2w==
X-Gm-Message-State: AOAM533WD81WQk0/7dvKB++M+iuGcf8YQNJ4/ffuYzBiAUEhQfvGNdTa
 FRyBykjqQajCsOoy4H9nGq5g73DcWIs/DJSVrSLR84GqXoQVvZ8BXd2Rso7CuHpt9vcauJE4Whj
 215+T6PIvmUId4M0fpzAd3acFuFcJV24=
X-Received: by 2002:a05:620a:708:: with SMTP id
 8mr2794223qkc.316.1637651321469; 
 Mon, 22 Nov 2021 23:08:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0qdv1mL+JN6u+aj06ce4F8ky2HtnG6vMqYAaLgDnOJfAadcfRpvr4GUDfjaU3rjp6PCq390Rxhlu1COK/3Vs=
X-Received: by 2002:a05:620a:708:: with SMTP id
 8mr2794196qkc.316.1637651321261; 
 Mon, 22 Nov 2021 23:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-24-eperezma@redhat.com>
 <YZyQtF0SIPcVZI+v@xz-m1.local>
In-Reply-To: <YZyQtF0SIPcVZI+v@xz-m1.local>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 23 Nov 2021 08:08:05 +0100
Message-ID: <CAJaqyWchrZc8Z7cRmzef3PhB6xDEte+Wd=b50GK9zx8YxkJz0g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 23/26] util: Add iova_tree_alloc
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 7:57 AM Peter Xu <peterx@redhat.com> wrote:
>
> Hi, Eugenio,
>
> Sorry for the super late response.
>

No problem!

> On Fri, Oct 29, 2021 at 08:35:22PM +0200, Eugenio P=C3=A9rez wrote:
>
> [...]
>
> > +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> > +                    hwaddr iova_last)
> > +{
> > +    struct IOVATreeAllocArgs args =3D {
> > +        .new_size =3D map->size,
> > +        .iova_begin =3D iova_begin,
> > +        .iova_last =3D iova_last,
> > +    };
> > +
> > +    if (iova_begin =3D=3D 0) {
> > +        /* Some devices does not like addr 0 */
> > +        iova_begin +=3D qemu_real_host_page_size;
> > +    }
>
> Any explanation of why zero is not welcomed?
>

I didn't investigate too much, but neither vhost-net or qemu device
accepted a ring with address 0. Probably it's because some test like:

if (!vq->desc) { return; }

That assumes 0 =3D=3D not initialized. Even if we fix that issue in the
devices, the vdpa device backend could be an old version, and since
the iova range should be big anyway I think we should skip 0 anyway.

> It would be great if we can move this out of iova-tree.c, because that do=
esn't
> look like a good place to, e.g. reference qemu_real_host_page_size, anywa=
ys.
> The caller can simply pass in qemu_real_host_page_size as iova_begin when
> needed (and I highly doubt it'll be a must for all iova-tree users..)
>

I think yes, it can be included in iova_begin. I'll rework that part.

> > +
> > +    assert(iova_begin < iova_last);
> > +
> > +    /*
> > +     * Find a valid hole for the mapping
> > +     *
> > +     * Assuming low iova_begin, so no need to do a binary search to
> > +     * locate the first node.
> > +     *
> > +     * TODO: We can improve the search speed if we save the beginning =
and the
> > +     * end of holes, so we don't iterate over the previous saved ones.
> > +     *
> > +     * TODO: Replace all this with g_tree_node_first/next/last when av=
ailable
> > +     * (from glib since 2.68). To do it with g_tree_foreach complicate=
s the
> > +     * code a lot.
> > +     *
> > +     */
> > +    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
> > +    if (!iova_tree_alloc_map_in_hole(&args)) {
> > +        /*
> > +         * 2nd try: Last iteration left args->right as the last DMAMap=
. But
> > +         * (right, end) hole needs to be checked too
> > +         */
> > +        iova_tree_alloc_args_iterate(&args, NULL);
> > +        if (!iova_tree_alloc_map_in_hole(&args)) {
> > +            return IOVA_ERR_NOMEM;
> > +        }
> > +    }
> > +
> > +    map->iova =3D MAX(iova_begin,
> > +                    args.hole_left ?
> > +                    args.hole_left->iova + args.hole_left->size + 1 : =
0);
> > +    return iova_tree_insert(tree, map);
> > +}
>
> Re the algorithm - I totally agree Jason's version is much better.
>

I'll try to accommodate it, but (if I understood it correctly) it
needs to deal with deallocation and a few other things. But it should
be doable.

Thanks!

> Thanks,
>
> --
> Peter Xu
>


