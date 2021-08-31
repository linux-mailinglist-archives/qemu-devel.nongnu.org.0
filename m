Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8083FCF78
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 00:09:50 +0200 (CEST)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLBwu-0002bt-El
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 18:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLBvj-0001uf-Dm
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 18:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLBvg-0007Kb-7i
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 18:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630447706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVU4ooT5htvCbDj54G0IUTDjSeUORr2jJreIC0nT5Z0=;
 b=Qq25j5Z6XDGe7rDzAcDSGDGd2B4mtBcJw6Y7LHeqsxwQIL3GfsSFLUTwhN+eeSJuRYhtvX
 m7xaBy+/KJiVMlYeF9mP92Rhz5XV053ggrvUa0djH48UDNucKV6GeagseD0kt4Oy2Bf+55
 ahfSspb7D4tpDkY0uiUsPx14dLhARPc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-V0gaStriMUC1-WMmQDqTqw-1; Tue, 31 Aug 2021 18:08:24 -0400
X-MC-Unique: V0gaStriMUC1-WMmQDqTqw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so305891wrl.0
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 15:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TVU4ooT5htvCbDj54G0IUTDjSeUORr2jJreIC0nT5Z0=;
 b=csIYh3kku8UNnZrW7keIZsnafoxXlXNND1+33imGpnufoajrBuBPpTKfQBP0QeDv2V
 l6njalAEvdWSOJgmUWDeFze49N1VVKTa1YljyndbQUMImYlqKRu4mErTbgOHemAyDWmB
 gmYr1erZcc6icxspPPa3f0yC+vVP9TycwCX8s/QjZTW2HWjXy/oVs0Xve7OMahtjnhiS
 0vqVfS+wJv8ZcyAK97VfRJ8ViOPdz94DcEE3SsGSr81rYgjR6f8WFVofSAFBbjd4EH4B
 ddnv/Ti2IIdz0NfRxAlFtw9ggOt1/iRCK/ZpryEpBVH7hCJeDrlJ7yKVvyePsu3mWCI0
 ICRQ==
X-Gm-Message-State: AOAM532Pf/8k9Nc9pkDxuCCVX9PyGA5w5JoWMZ9kFbh47/grt/T/3IaW
 5iwekuXHfCb+j6dHrIvlqEN3iL8HpW1B99WkSzzJD7SJZzoJIZnb2IaCGHRchjn4xF66e4pAG0j
 7giJPTzVgjfvEQNg=
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr6470556wmk.37.1630447703821; 
 Tue, 31 Aug 2021 15:08:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp6Insc9Uzt8e7jqpAAdHkyrcJ5ALYU78KICC9tcyjvLNWFXLcWxWyqdz5kaqtxy6LXwIDUQ==
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr6470531wmk.37.1630447703537; 
 Tue, 31 Aug 2021 15:08:23 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e2sm21881232wrq.56.2021.08.31.15.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 15:08:22 -0700 (PDT)
Subject: Re: [PATCH v3] memory: Have 'info mtree' remove duplicated Address
 Space information
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210823085429.597873-1-philmd@redhat.com>
 <CAFEAcA_tPGNWYmXDAnUqmBY1fzwQQ+ccCZ_icF67eoKE-eTPXA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <83812f78-d0e5-9d89-599f-f860b05fce8a@redhat.com>
Date: Wed, 1 Sep 2021 00:08:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_tPGNWYmXDAnUqmBY1fzwQQ+ccCZ_icF67eoKE-eTPXA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 10:27 PM, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 09:54, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Per Peter Maydell [*]:
>>
>>   'info mtree' monitor command was designed on the assumption that
>>   there's really only one or two interesting address spaces, and
>>   with more recent developments that's just not the case any more.
>>
>> Similarly about how the FlatView are sorted using a GHashTable,
>> sort the AddressSpace objects to remove the duplications (AS
>> using the same root MemoryRegion).
>>
> 
> 
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index bfedaf9c4df..459d6246672 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -3246,11 +3246,55 @@ static gboolean mtree_info_flatview_free(gpointer key, gpointer value,
>>      return true;
>>  }
>>
>> +struct AddressSpaceInfo {
>> +    MemoryRegionListHead *ml_head;
>> +    bool owner;
>> +    bool disabled;
>> +};
>> +
>> +/* Returns negative value if a < b; zero if a = b; positive value if a > b. */
>> +static gint address_space_compare_name(gconstpointer a, gconstpointer b)
>> +{
>> +    const AddressSpace *as_a = a;
>> +    const AddressSpace *as_b = b;
>> +
>> +    return g_strcmp0(as_a->name, as_b->name);
>> +}
>> +static void mtree_print_as_name(gpointer data, gpointer user_data)
>> +{
>> +    AddressSpace *as = data;
>> +
>> +    qemu_printf("address-space: %s\n", as->name);
>> +}
>> +
>> +static void mtree_print_as(gpointer key, gpointer value, gpointer user_data)
>> +{
>> +    MemoryRegion *mr = key;
>> +    GSList *as_same_root_mr_list = value;
>> +    struct AddressSpaceInfo *asi = user_data;
>> +
>> +    g_slist_foreach(as_same_root_mr_list, mtree_print_as_name, NULL);
>> +    mtree_print_mr(mr, 1, 0, asi->ml_head, asi->owner, asi->disabled);
>> +    qemu_printf("\n");
>> +}
>> +
>> +static gboolean mtree_info_as_free(gpointer key, gpointer value,
>> +                                   gpointer user_data)
>> +{
>> +    GSList *as_same_root_mr_list = value;
>> +
>> +    g_slist_free(as_same_root_mr_list);
>> +
>> +    return true;
>> +}
>> +
>>  void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>>  {
>>      MemoryRegionListHead ml_head;
>>      MemoryRegionList *ml, *ml2;
>>      AddressSpace *as;
>> +    GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
>> +    GSList *as_same_root_mr_list;
>>
>>      if (flatview) {
>>          FlatView *view;
>> @@ -3260,7 +3304,6 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>>              .owner = owner,
>>          };
>>          GArray *fv_address_spaces;
>> -        GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
>>          AccelClass *ac = ACCEL_GET_CLASS(current_accel());
>>
>>          if (ac->has_memory) {
>> @@ -3293,11 +3336,24 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>>      QTAILQ_INIT(&ml_head);
>>
>>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>> -        qemu_printf("address-space: %s\n", as->name);
>> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
>> -        qemu_printf("\n");
>> +        /* Create hashtable, key=AS root MR, value = list of AS */
>> +        as_same_root_mr_list = g_hash_table_lookup(views, as->root);
>> +        as_same_root_mr_list = g_slist_insert_sorted(as_same_root_mr_list, as,
>> +                                                     address_space_compare_name);
>> +        g_hash_table_insert(views, as->root, as_same_root_mr_list);
>>      }
>>
>> +    struct AddressSpaceInfo asi = {
>> +        .ml_head = &ml_head,
>> +        .owner = owner,
>> +        .disabled = disabled,
>> +    };
> 
> Strictly speaking this is against our coding-style "no variable
> declarations in the middle of a block".

Right.

>> +
>> +    /* print address spaces */
>> +    g_hash_table_foreach(views, mtree_print_as, &asi);
>> +    g_hash_table_foreach_remove(views, mtree_info_as_free, 0);
>> +    g_hash_table_unref(views);
>> +
>>      /* print aliased regions */
>>      QTAILQ_FOREACH(ml, &ml_head, mrqueue) {
>>          qemu_printf("memory-region: %s\n", memory_region_name(ml->mr));
>> --
>> 2.31.1
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Side note: I wonder if it would be worth splitting mtree_info()
> into a function for ASes and a function for flatviews? The two
> cases share basically no code, and there's only one callsite.

I noticed that too but wanted to get the dedup reviewed first.
I'll respin including the split (which should remove the mid-block
declaration).

Thanks for the review,

Phil.


