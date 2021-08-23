Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5EA3F4751
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:23:00 +0200 (CEST)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6AV-00069H-CN
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI67w-0003OO-Um
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI67t-0008KM-8C
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629710415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzMbqKSBFrpe0yxsoI0GicyOQX528Qksw9Z+BvcL5hI=;
 b=VQnRasGnMhzRYCeyvFfZ8lhsYeUcGOVoja/lINk6M2KyjsTW/7eeUor+C33g/7lzF7UCWf
 1sILYNiHKvEErKiHE21O1p8SCo1EgFm/epqHdRXuoi7xXyfr7bhxNHrj21ibe2BvL6haTA
 W0rUrSlKNe7PylajgPLT510MMn+jqpc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-siqzM2w6ONqo7BhEXzXl6g-1; Mon, 23 Aug 2021 05:20:14 -0400
X-MC-Unique: siqzM2w6ONqo7BhEXzXl6g-1
Received: by mail-wm1-f71.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so2771554wmc.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SzMbqKSBFrpe0yxsoI0GicyOQX528Qksw9Z+BvcL5hI=;
 b=nRR7M9i4i9mMlUVV8tYxNRG6WwYaCOpIsohGn5Lxmz4KYSIJEzwxiI8dbgXLfsF2FT
 6YNPHz8mx1lyQ/n0tlrYWovVW4c41K1Nk68Xa3dtuUPjZk86DxXQz2A9Io1EfE4pgQ1D
 DrTKjeQTP+Bp+4k8eYVyvXGohHcfMro8TVygoSNhnqNYUa/jryrRxl4IbLOPRyx4kpLu
 pPRJmqHl6fKe72rWd1uZULHmh7pFmfExKjT0K4CqSLeW1xZdujamQE/CyVCV2rYjnuCA
 6lqlbY1YkAoFCCP1866n/PAWZGWdYs/qh4FLFq2SLBFt8eCdIzHuIDjlCGHdjrEeV38l
 f89A==
X-Gm-Message-State: AOAM532txzJwq/qUJvETDb5zCTxTaOIAQ0U7oSmFnDyVUr0EELIWt3uV
 yYNCCdkaQJom6EobuFUwRYX0Mw70t6tim1tmStv/GgqqUhKHHl2/4LgibL+hjv/bouBw2kQp9Qz
 M8Bhb5/V8Y3eONi4=
X-Received: by 2002:a5d:674b:: with SMTP id l11mr12353249wrw.357.1629710413258; 
 Mon, 23 Aug 2021 02:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFiLO2j9JGv9D2nVD3jeCg2XdK+7pRDYC1SG+Zrg2eruHPrwrAGWSIums6VribFpCuOgNWsg==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr12353224wrw.357.1629710412979; 
 Mon, 23 Aug 2021 02:20:12 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id o10sm14484109wrq.51.2021.08.23.02.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 02:20:12 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210823085429.597873-1-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3] memory: Have 'info mtree' remove duplicated Address
 Space information
Message-ID: <8743192d-225d-c091-ab53-c747daa86f46@redhat.com>
Date: Mon, 23 Aug 2021 11:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823085429.597873-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.21 10:54, Philippe Mathieu-Daudé wrote:
> Per Peter Maydell [*]:
> 
>    'info mtree' monitor command was designed on the assumption that
>    there's really only one or two interesting address spaces, and
>    with more recent developments that's just not the case any more.
> 
> Similarly about how the FlatView are sorted using a GHashTable,
> sort the AddressSpace objects to remove the duplications (AS
> using the same root MemoryRegion).
> 
> This drastically reduce 'info mtree' on some boards.

s/reduce/reduces the output of/

> 
> Before:
> 
>    $ (echo info mtree; echo q) \
>      | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>      | wc -l
>    423
> 
> After:
> 
>    $ (echo info mtree; echo q) \
>      | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>      | wc -l
>    106
> 
>    (qemu) info mtree
>    address-space: I/O
>      0000000000000000-000000000000ffff (prio 0, i/o): io
> 
>    address-space: cpu-memory-0
>    address-space: cpu-memory-1
>    address-space: cpu-memory-2
>    address-space: cpu-memory-3
>    address-space: cpu-secure-memory-0
>    address-space: cpu-secure-memory-1
>    address-space: cpu-secure-memory-2
>    address-space: cpu-secure-memory-3

We can still distinguish from a completely empty AS, because we don't 
have an empty line here, correct?

[...]

> ---
>   softmmu/memory.c | 64 +++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4df..459d6246672 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -3246,11 +3246,55 @@ static gboolean mtree_info_flatview_free(gpointer key, gpointer value,
>       return true;
>   }
>   
> +struct AddressSpaceInfo {
> +    MemoryRegionListHead *ml_head;
> +    bool owner;
> +    bool disabled;
> +};
> +
> +/* Returns negative value if a < b; zero if a = b; positive value if a > b. */
> +static gint address_space_compare_name(gconstpointer a, gconstpointer b)
> +{
> +    const AddressSpace *as_a = a;
> +    const AddressSpace *as_b = b;
> +
> +    return g_strcmp0(as_a->name, as_b->name);
> +}
> +static void mtree_print_as_name(gpointer data, gpointer user_data)
> +{
> +    AddressSpace *as = data;
> +
> +    qemu_printf("address-space: %s\n", as->name);
> +}
> +
> +static void mtree_print_as(gpointer key, gpointer value, gpointer user_data)
> +{
> +    MemoryRegion *mr = key;
> +    GSList *as_same_root_mr_list = value;
> +    struct AddressSpaceInfo *asi = user_data;

Reverse Christmas tree?

> +
> +    g_slist_foreach(as_same_root_mr_list, mtree_print_as_name, NULL);
> +    mtree_print_mr(mr, 1, 0, asi->ml_head, asi->owner, asi->disabled);
> +    qemu_printf("\n");
> +}
> +
> +static gboolean mtree_info_as_free(gpointer key, gpointer value,
> +                                   gpointer user_data)
> +{
> +    GSList *as_same_root_mr_list = value;
> +
> +    g_slist_free(as_same_root_mr_list);
> +
> +    return true;
> +}
> +
>   void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>   {
>       MemoryRegionListHead ml_head;
>       MemoryRegionList *ml, *ml2;
>       AddressSpace *as;
> +    GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
> +    GSList *as_same_root_mr_list;

Reverse Christmas tree ?

>   
>       if (flatview) {
>           FlatView *view;
> @@ -3260,7 +3304,6 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>               .owner = owner,
>           };
>           GArray *fv_address_spaces;
> -        GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
>           AccelClass *ac = ACCEL_GET_CLASS(current_accel());
>   
>           if (ac->has_memory) {
> @@ -3293,11 +3336,24 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>       QTAILQ_INIT(&ml_head);
>   
>       QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> -        qemu_printf("address-space: %s\n", as->name);
> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
> -        qemu_printf("\n");
> +        /* Create hashtable, key=AS root MR, value = list of AS */
> +        as_same_root_mr_list = g_hash_table_lookup(views, as->root);
> +        as_same_root_mr_list = g_slist_insert_sorted(as_same_root_mr_list, as,
> +                                                     address_space_compare_name);
> +        g_hash_table_insert(views, as->root, as_same_root_mr_list);
>       }
>   
> +    struct AddressSpaceInfo asi = {
> +        .ml_head = &ml_head,
> +        .owner = owner,
> +        .disabled = disabled,
> +    };
> +
> +    /* print address spaces */
> +    g_hash_table_foreach(views, mtree_print_as, &asi);
> +    g_hash_table_foreach_remove(views, mtree_info_as_free, 0);
> +    g_hash_table_unref(views);
> +
>       /* print aliased regions */
>       QTAILQ_FOREACH(ml, &ml_head, mrqueue) {
>           qemu_printf("memory-region: %s\n", memory_region_name(ml->mr));
> 

LGTM

-- 
Thanks,

David / dhildenb


