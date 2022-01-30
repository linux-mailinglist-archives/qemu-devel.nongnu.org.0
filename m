Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E84A3415
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 06:09:32 +0100 (CET)
Received: from localhost ([::1]:33488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE2Sw-0002Qa-0q
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 00:09:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE2QX-0001mD-QS
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 00:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE2QV-0006Fn-BL
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 00:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643519218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yu5ck5PDQxU8W0XKcd5kpr4kTqE1JkiqoCZ6NoOdIFE=;
 b=HEv/YiC5N9ZJ0py5wnUFkCF4ReOhQUio+ix6E/DNivxUt3IriRBPlEkaK35IWdIOmK6eo6
 3CuagFv4rM0x/p6GhM0kAurI1dcCZqrTyK56GeAEbOcVKBylRdHuD56dNClrK4wmBJBd8w
 DQFb4VUQ0Dg10YvXASSiNhlPbURClfA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-VhTSSCemMNO0_1wJFAJbtw-1; Sun, 30 Jan 2022 00:06:56 -0500
X-MC-Unique: VhTSSCemMNO0_1wJFAJbtw-1
Received: by mail-pl1-f198.google.com with SMTP id
 q2-20020a170902f78200b0014b56300928so4169061pln.16
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 21:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yu5ck5PDQxU8W0XKcd5kpr4kTqE1JkiqoCZ6NoOdIFE=;
 b=2bfFGm2POcKxIGfuqOGGT/HpptaBcwvNJVRI52d+RigJ7mzwpycvXwbvpZ0GYa2lTo
 cC9z4bafiPT1JZyquSiONLRyvpek1VngYLBzJN6P+zgbbcDFwKqhKlxGAKA9VCRfI0uf
 T1Uzwq1fou/rOkf9YW1qzKvmMf/LyquaPv1xS/n0gwmfVuPDmewh/1UgG2HZdGPld6Jq
 PEXJavVq15d7EBTcs4gD8WKjRHaEG6vkj2CaQfJlFqJ7zOUD1A9X/ZUxSZjvV7Y0skTB
 IvdTClD6F6ZtK4H/0gaFsNf3YXkF2JBUmohtzTKtZIAocm65+2JfNCNT4xXWFMlfp4rV
 5aAw==
X-Gm-Message-State: AOAM5302JTITKIXAAFead8rf1Xoa9arhtZYExjgSiv2Dbg7nXN4qtJGE
 MgIs5bcPfDWaFveSco23s/PcA0Yy0PK/Vx9+G1GR9NmAvkOGmPRCoRLexdf9qm0b64V4dx+zEjn
 DQWgXXCBfT0QngmU=
X-Received: by 2002:a63:dc42:: with SMTP id f2mr12151726pgj.477.1643519215359; 
 Sat, 29 Jan 2022 21:06:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxToInrjlwfxIHjC6YNfIXQZMyFaCJGBolp1KUblezk5XHg2/nK31KFXChPTQB40dXlg8poQ==
X-Received: by 2002:a63:dc42:: with SMTP id f2mr12151703pgj.477.1643519215089; 
 Sat, 29 Jan 2022 21:06:55 -0800 (PST)
Received: from [10.72.13.18] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c6sm14281603pfl.200.2022.01.29.21.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 21:06:54 -0800 (PST)
Message-ID: <1140466a-ef7d-7b02-cc9a-fcbe6be49f3c@redhat.com>
Date: Sun, 30 Jan 2022 13:06:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
To: Eugenio Perez Martin <eperezma@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com> <Ye4r7tKFhP9VaT5/@xz-m1.local>
 <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
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


在 2022/1/24 下午5:20, Eugenio Perez Martin 写道:
> On Mon, Jan 24, 2022 at 5:33 AM Peter Xu <peterx@redhat.com> wrote:
>> On Fri, Jan 21, 2022 at 09:27:23PM +0100, Eugenio Pérez wrote:
>>> +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> I forgot to s/iova_tree_alloc/iova_tree_alloc_map/ here.
>
>>> +                    hwaddr iova_last)
>>> +{
>>> +    const DMAMapInternal *last, *i;
>>> +
>>> +    assert(iova_begin < iova_last);
>>> +
>>> +    /*
>>> +     * Find a valid hole for the mapping
>>> +     *
>>> +     * TODO: Replace all this with g_tree_node_first/next/last when available
>>> +     * (from glib since 2.68). Using a sepparated QTAILQ complicates code.
>>> +     *
>>> +     * Try to allocate first at the end of the list.
>>> +     */
>>> +    last = QTAILQ_LAST(&tree->list);
>>> +    if (iova_tree_alloc_map_in_hole(last, NULL, iova_begin, iova_last,
>>> +                                    map->size)) {
>>> +        goto alloc;
>>> +    }
>>> +
>>> +    /* Look for inner hole */
>>> +    last = NULL;
>>> +    for (i = QTAILQ_FIRST(&tree->list); i;
>>> +         last = i, i = QTAILQ_NEXT(i, entry)) {
>>> +        if (iova_tree_alloc_map_in_hole(last, i, iova_begin, iova_last,
>>> +                                        map->size)) {
>>> +            goto alloc;
>>> +        }
>>> +    }
>>> +
>>> +    return IOVA_ERR_NOMEM;
>>> +
>>> +alloc:
>>> +    map->iova = last ? last->map.iova + last->map.size + 1 : iova_begin;
>>> +    return iova_tree_insert(tree, map);
>>> +}
>> Hi, Eugenio,
>>
>> Have you tried with what Jason suggested previously?
>>
>>    https://lore.kernel.org/qemu-devel/CACGkMEtZAPd9xQTP_R4w296N_Qz7VuV1FLnb544fEVoYO0of+g@mail.gmail.com/
>>
>> That solution still sounds very sensible to me even without the newly
>> introduced list in previous two patches.
>>
>> IMHO we could move "DMAMap *previous, *this" into the IOVATreeAllocArgs*
>> stucture that was passed into the traverse func though, so it'll naturally work
>> with threading.
>>
>> Or is there any blocker for it?
>>
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
> Maybe we could treat .size = 0 as a special case?


Yes, the pseudo-code I past is just to show the idea of using 
g_tree_foreach() instead of introducing new auxiliary data structures. 
That will simplify both the codes and the reviewers.

Down the road, we may start from an iova range specified during the 
creation of the iova tree. E.g for vtd, it's the GAW, for vhost-vdpa, 
it's the one that we get from VHOST_VDPA_GET_IOVA_RANGE.

Thanks


> I see cleaner either
> to build the list (but insert needs to take the list into account) or
> to explicitly tell that prev == NULL means to use iova_first.
>
> Another solution that comes to my mind: to add both exceptions outside
> of transverse function, and skip the first iteration with something
> like:
>
> if (prev == NULL) {
>    prev = this;
>    return false /* continue */
> }
>
> So the transverse callback has way less code paths. Would it work for
> you if I send a separate RFC from SVQ only to validate this?
>
> Thanks!
>
>> Thanks,
>> --
>> Peter Xu
>>


