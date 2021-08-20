Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2013F2A6E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:59:03 +0200 (CEST)
Received: from localhost ([::1]:44856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH2Eo-0005Q1-Lm
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH2E0-0004lg-Dk
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:58:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH2Dy-0004IM-4Q
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629457089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MikEtNffzIcOlzhB85OFGQGgkWpvn/QYTeVPGFOQrXg=;
 b=YL4jxiX/WFjFwS2J+kpd5njmGeRd3xmUDFUsm81m/FJvdB7CGwg1rkt2NiigHKDpEaAgRJ
 ZWRVkRA++YGFgo63SzlkVG0v+rOrMCwqiSvWA5yzul2UqiZBm+rjb/bK4vo9GX/O9yYkwP
 cYtoiysbhDKR8cDMKUkG91o80DpwToI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-GB4kYQtyOP-9nkqyQ5eqAg-1; Fri, 20 Aug 2021 06:58:08 -0400
X-MC-Unique: GB4kYQtyOP-9nkqyQ5eqAg-1
Received: by mail-wr1-f69.google.com with SMTP id
 z10-20020a5d440a0000b0290154e0f00348so2732108wrq.4
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 03:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MikEtNffzIcOlzhB85OFGQGgkWpvn/QYTeVPGFOQrXg=;
 b=VDvJE0rQbaVYwVmSJnZVS+RX469fpx9bLdd0BSn9DUdIBffwyN7YmA9uloSEqjMTL/
 iaWA36FWMLW2WxpKMXkAfj/mYe+pRBN0C3e2BC/MczZY51G/LsMLqZtKwtPFDLs2hw1T
 k0pouFtK85ZRsFuLa8GvsXbhKnNwfB70D7DD42Wo7ufjMqTdyWL8xxYJ59lygXMXWpbV
 INtXMmMjIgDBRyumx4ixaoKYTVwqwQ3k/IbLucuB/XTukbWGWaUlESzsa13PV50Two6G
 Sqqgd74S+ZHeGuFgfxwfcXX3uqJROcRlgxuq9CTdoe+pweF3AhnMclcFLLgJUGkOSI3p
 zA8g==
X-Gm-Message-State: AOAM533qA6fBc6DcmfSAgn1rKUKT/Ze4TaD0qn1DHyO+r6mOY/aiPStZ
 1Ltf7LH8AqpJP3AizMSGUI07aj55HVfwSs4oC327PZn/knW7BjvgrPghD5Ie5YbAKEFW+aSQMGu
 mH7Q5wZw0vkwUSOY=
X-Received: by 2002:a5d:65c2:: with SMTP id e2mr9307676wrw.191.1629457086885; 
 Fri, 20 Aug 2021 03:58:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1HlZySImw8INJ+PuqxP/TCogK9sgagb2n8KqRleucpLUJGCq1SbfznrIfeGEQMFsnaYV+Mg==
X-Received: by 2002:a5d:65c2:: with SMTP id e2mr9307646wrw.191.1629457086688; 
 Fri, 20 Aug 2021 03:58:06 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t7sm1080161wrq.90.2021.08.20.03.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 03:58:06 -0700 (PDT)
Subject: Re: [PATCH] memory: Have 'info mtree' remove duplicated Address Space
 information
To: qemu-devel@nongnu.org
References: <20210820105435.3034561-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <73fa7b2f-fba2-6af0-5cf4-2066d7f625e5@redhat.com>
Date: Fri, 20 Aug 2021 12:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820105435.3034561-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 12:54 PM, Philippe Mathieu-Daudé wrote:
> Per Peter Maydell [*]:
> 
>   'info mtree' monitor command was designed on the assumption that
>   there's really only one or two interesting address spaces, and
>   with more recent developments that's just not the case any more.
> 
> Similarly about how the FlatView are sorted using a GHashTable,
> sort the AddressSpace objects to remove the duplications (AS
> using the same root MemoryRegion).
> 
> This drastically reduce 'info mtree' on some boards.
> 
> Before:
> 
>   $ (echo info mtree; echo q) \
>     | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>     | wc -l
>   423
> 
> After:
> 
>   $ (echo info mtree; echo q) \
>     | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>     | wc -l
>   108
> 
>   (qemu) info mtree
>   address-space: I/O
>     0000000000000000-000000000000ffff (prio 0, i/o): io
> 
>   address-space shared 9 times:
>     - cpu-memory-0
>     - cpu-memory-1
>     - cpu-memory-2
>     - cpu-memory-3
>     - cpu-secure-memory-0
>     - cpu-secure-memory-1
>     - cpu-secure-memory-2
>     - cpu-secure-memory-3
>     - memory
>     0000000000000000-ffffffffffffffff (prio 0, i/o): system
>       0000000000000000-000000003fffffff (prio 0, ram): ram
>       000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
>         000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
>         000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
>         000000003f006000-000000003f006fff (prio 0, i/o): mphi
>         000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
>         000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
>         000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
>         000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
>         000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
>         000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
>         000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
>         000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
>         000000003f201000-000000003f201fff (prio 0, i/o): pl011
>         000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
>         000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
>         000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
>         000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
>         000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
>         000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
>         000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
>         000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
>         000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
>         000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
>         000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
>         000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
>         000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
>         000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
>         000000003f980000-000000003f990fff (prio 0, i/o): dwc2
>           000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
>           000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
>         000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
>         000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
>         000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
>       0000000040000000-00000000400000ff (prio 0, i/o): bcm2836-control
> 
>   address-space shared 4 times:
>     - bcm2835-dma-memory
>     - bcm2835-fb-memory
>     - bcm2835-property-memory
>     - dwc2
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
> 
>   address-space: bcm2835-mbox-memory
>     0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>       0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>       0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property
> 
>   memory-region: ram
>     0000000000000000-000000003fffffff (prio 0, ram): ram
> 
>   memory-region: bcm2835-peripherals
>     000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
>       000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
>       000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
>       000000003f006000-000000003f006fff (prio 0, i/o): mphi
>       000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
>       000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
>       000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
>       000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
>       000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
>       000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
>       000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
>       000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
>       000000003f201000-000000003f201fff (prio 0, i/o): pl011
>       000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
>       000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
>       000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
>       000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
>       000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
>       000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
>       000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
>       000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
>       000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
>       000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
>       000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
>       000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
>       000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
>       000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
>       000000003f980000-000000003f990fff (prio 0, i/o): dwc2
>         000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
>         000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
>       000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
>       000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
>       000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
> 
>   (qemu) q
> 
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg829821.html
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  softmmu/memory.c | 73 +++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 69 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4df..0653b06b7cf 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -3246,11 +3246,64 @@ static gboolean mtree_info_flatview_free(gpointer key, gpointer value,
>      return true;
>  }
>  
> +struct AddressSpaceInfo {
> +    MemoryRegionListHead *ml_head;
> +    int counter;

Doh this field is unused :/

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
> +    qemu_printf("  - %s\n", as->name);
> +}
> +
> +static void mtree_print_as(gpointer key, gpointer value, gpointer user_data)
> +{
> +    MemoryRegion *mr = key;
> +    GSList *as_same_root_mr_list = value;
> +    struct AddressSpaceInfo *asi = user_data;
> +    guint same_root_len = g_slist_length(as_same_root_mr_list);
> +
> +    if (same_root_len == 1) {
> +        AddressSpace *as = g_slist_nth_data(as_same_root_mr_list, 0);
> +
> +        qemu_printf("address-space: %s\n", as->name);
> +    } else {
> +        qemu_printf("address-space shared %u times:\n", same_root_len);
> +        g_slist_foreach(as_same_root_mr_list, mtree_print_as_name, NULL);
> +    }
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
>  void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>  {
>      MemoryRegionListHead ml_head;
>      MemoryRegionList *ml, *ml2;
>      AddressSpace *as;
> +    GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
> +    GSList *as_same_root_mr_list;
>  
>      if (flatview) {
>          FlatView *view;
> @@ -3260,7 +3313,6 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>              .owner = owner,
>          };
>          GArray *fv_address_spaces;
> -        GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
>          AccelClass *ac = ACCEL_GET_CLASS(current_accel());
>  
>          if (ac->has_memory) {
> @@ -3293,11 +3345,24 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>      QTAILQ_INIT(&ml_head);
>  
>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> -        qemu_printf("address-space: %s\n", as->name);
> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
> -        qemu_printf("\n");
> +        /* Create hashtable, key=AS root MR, value = list of AS */
> +        as_same_root_mr_list = g_hash_table_lookup(views, as->root);
> +        as_same_root_mr_list = g_slist_insert_sorted(as_same_root_mr_list, as,
> +                                                     address_space_compare_name);
> +        g_hash_table_insert(views, as->root, as_same_root_mr_list);
>      }
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
>      /* print aliased regions */
>      QTAILQ_FOREACH(ml, &ml_head, mrqueue) {
>          qemu_printf("memory-region: %s\n", memory_region_name(ml->mr));
> 


