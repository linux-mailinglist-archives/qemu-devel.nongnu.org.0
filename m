Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C705497D9F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 12:11:08 +0100 (CET)
Received: from localhost ([::1]:33330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBxFa-0004mT-WA
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 06:11:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nBxCg-0003XD-Ni
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 06:08:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nBxCd-0006ge-4f
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 06:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643022481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OfjbybQhhjg38hxkb3LOYjXJwz/mjLMPdefaFIE4qY=;
 b=RTq3pvyToNkkFEpPoVLvGSrdxnbd7XjIe0osSdDBOy2p8MuTxYy3loOoNyLGp0idbsW2Qr
 KKhQ3b57Sa0fGLp/wtv60EqMsdo4FCoBjBvYWklso5AVIGvbOhH69aODhHy8812ZkmIutv
 FZM5OrzF4SmXX496j/Jq4CYKrvKMm1g=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-hjQtgJw5PbSXEAoNCzggag-1; Mon, 24 Jan 2022 06:08:00 -0500
X-MC-Unique: hjQtgJw5PbSXEAoNCzggag-1
Received: by mail-pj1-f72.google.com with SMTP id
 x1-20020a17090ab00100b001b380b8ed35so11765318pjq.7
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 03:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3OfjbybQhhjg38hxkb3LOYjXJwz/mjLMPdefaFIE4qY=;
 b=aitSt+RuZkH/gmgtFAFag15VWP6At6eW7kmHGU1KSCVHkxV9YBdvS5Injj9dkmBNBn
 EHrsYEwVmn1CcZwWz64y3Hzlukv1G/lKmvTfleWfIdcDkkppIwa/c5J4+/q9K2WpQ0al
 Rz7KVDRmp8tMdnWmgKMrBePk6etWPffdQGfCJS2D8WaAr4Fk31cwndX7A5bCp+HcyNVw
 uTPXk0Bid06eVStWypBSDGbtHFQbt9DtiAcIn8bfbSKtrudxEr9hUQvzsOER0CbKG9VV
 zJW+t+m3zJwknh1qHVP67Y7znGTAcxN/n8gZZD+Nw/Bg76WEr1MCOMZ9bcUyS/GMXwlf
 E5aQ==
X-Gm-Message-State: AOAM530ddXicxefK1EUIVYMhv0msAXl/ullcO3z95TKxq2uxevTR7+en
 wretc+S4kNzNba4Py74eA+1Av8UGcNJilTScbnMpRdQJXt7gG677YbL1zPEACAZYhkRke2u5LWV
 gGctGbJXIASswtUE=
X-Received: by 2002:a17:902:dac9:b0:14a:52d1:a266 with SMTP id
 q9-20020a170902dac900b0014a52d1a266mr13446892plx.161.1643022479190; 
 Mon, 24 Jan 2022 03:07:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9+7YNHi/g2m7Mhl9qkD+p0twt4AoQ/T+tqXBDwszEC6eVuSyIg54W0jPFZ/lBNL4HefQQZg==
X-Received: by 2002:a17:902:dac9:b0:14a:52d1:a266 with SMTP id
 q9-20020a170902dac900b0014a52d1a266mr13446851plx.161.1643022478883; 
 Mon, 24 Jan 2022 03:07:58 -0800 (PST)
Received: from xz-m1.local ([94.177.118.73])
 by smtp.gmail.com with ESMTPSA id x25sm15388443pfu.91.2022.01.24.03.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 03:07:58 -0800 (PST)
Date: Mon, 24 Jan 2022 19:07:48 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
Message-ID: <Ye6IhLCe6NDKO6+E@xz-m1.local>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com>
 <Ye4r7tKFhP9VaT5/@xz-m1.local>
 <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 10:20:55AM +0100, Eugenio Perez Martin wrote:
> On Mon, Jan 24, 2022 at 5:33 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Fri, Jan 21, 2022 at 09:27:23PM +0100, Eugenio Pérez wrote:
> > > +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> 
> I forgot to s/iova_tree_alloc/iova_tree_alloc_map/ here.
> 
> > > +                    hwaddr iova_last)
> > > +{
> > > +    const DMAMapInternal *last, *i;
> > > +
> > > +    assert(iova_begin < iova_last);
> > > +
> > > +    /*
> > > +     * Find a valid hole for the mapping
> > > +     *
> > > +     * TODO: Replace all this with g_tree_node_first/next/last when available
> > > +     * (from glib since 2.68). Using a sepparated QTAILQ complicates code.
> > > +     *
> > > +     * Try to allocate first at the end of the list.
> > > +     */
> > > +    last = QTAILQ_LAST(&tree->list);
> > > +    if (iova_tree_alloc_map_in_hole(last, NULL, iova_begin, iova_last,
> > > +                                    map->size)) {
> > > +        goto alloc;
> > > +    }
> > > +
> > > +    /* Look for inner hole */
> > > +    last = NULL;
> > > +    for (i = QTAILQ_FIRST(&tree->list); i;
> > > +         last = i, i = QTAILQ_NEXT(i, entry)) {
> > > +        if (iova_tree_alloc_map_in_hole(last, i, iova_begin, iova_last,
> > > +                                        map->size)) {
> > > +            goto alloc;
> > > +        }
> > > +    }
> > > +
> > > +    return IOVA_ERR_NOMEM;
> > > +
> > > +alloc:
> > > +    map->iova = last ? last->map.iova + last->map.size + 1 : iova_begin;
> > > +    return iova_tree_insert(tree, map);
> > > +}
> >
> > Hi, Eugenio,
> >
> > Have you tried with what Jason suggested previously?
> >
> >   https://lore.kernel.org/qemu-devel/CACGkMEtZAPd9xQTP_R4w296N_Qz7VuV1FLnb544fEVoYO0of+g@mail.gmail.com/
> >
> > That solution still sounds very sensible to me even without the newly
> > introduced list in previous two patches.
> >
> > IMHO we could move "DMAMap *previous, *this" into the IOVATreeAllocArgs*
> > stucture that was passed into the traverse func though, so it'll naturally work
> > with threading.
> >
> > Or is there any blocker for it?
> >
> 
> Hi Peter,
> 
> I can try that solution again, but the main problem was the special
> cases of the beginning and ending.
> 
> For the function to locate a hole, DMAMap first = {.iova = 0, .size =
> 0} means that it cannot account 0 for the hole.
> 
> In other words, with that algorithm, if the only valid hole is [0, N)
> and we try to allocate a block of size N, it would fail.
> 
> Same happens with iova_end, although in practice it seems that IOMMU
> hardware iova upper limit is never UINT64_MAX.
> 
> Maybe we could treat .size = 0 as a special case? I see cleaner either
> to build the list (but insert needs to take the list into account) or
> to explicitly tell that prev == NULL means to use iova_first.

Sounds good to me.  I didn't mean to copy-paste Jason's code, but IMHO what
Jason wanted to show is the general concept - IOW, the fundamental idea (to me)
is that the tree will be traversed in order, hence maintaining another list
structure is redundant.

> 
> Another solution that comes to my mind: to add both exceptions outside
> of transverse function, and skip the first iteration with something
> like:
> 
> if (prev == NULL) {
>   prev = this;
>   return false /* continue */
> }
> 
> So the transverse callback has way less code paths. Would it work for
> you if I send a separate RFC from SVQ only to validate this?

Sure. :-)

If you want, imho you can also attach the patch when reply, then the discussion
context won't be lost too.

-- 
Peter Xu


