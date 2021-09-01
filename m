Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20D3FE0FE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:13:33 +0200 (CEST)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTno-0006DP-L8
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLTmv-0005TV-1F
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 13:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLTmr-0005MD-PC
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 13:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630516353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMtVA2HhPK0yWBLXQr2S58XNLdxvRm8h49KcX3Rr9wM=;
 b=a5RmIoCEwrnxPeIofk/L4+aUuV7cMMkMLnQnDYfB72zqDTWUGtIC7DzhAZZlWf7SHB5ZFz
 ppAoKCLWwrlIRht7CixDZs8eAPMHk53zB+QixuHQtg+FI3Kjr+EDP9IB+fkNd7oI1mTnYw
 J4DYn89/7vVkF5dNt5OdggLVwS6+Zlk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-hdp2sRwqNcyJ2Q7gsSRsDg-1; Wed, 01 Sep 2021 13:12:29 -0400
X-MC-Unique: hdp2sRwqNcyJ2Q7gsSRsDg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so66691wmr.9
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 10:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mMtVA2HhPK0yWBLXQr2S58XNLdxvRm8h49KcX3Rr9wM=;
 b=jQLF+tWISOWgr3dwkOysGi8g5Ky67sbw8717kmzf0usikmOXGwlARBUvR2TUNsLMf0
 8pAzq6seKUC1oS5+A0fJlD9nX4Ki8UN5yRd3fkLvTFyW1GDzaESl6ft50ot8JgVeJJPO
 2oBqNLNtul+Fq6UfF/t9Ylz447zRfqRwyMiGOfrQwCGZMOpQoWajCgSXUXPZK8J3LRuo
 1ypq5V818kKhgL0XkzgsSevqHVhEXx2gUBy9jQ5rfHwoSSvz1O18OwP+hwZqd+zyQTHf
 AAE0KZfz5x5qRZ7umd19jhYI6EKhfZmMTqgJaxQNlKf0dZe03N9yoVatWigQMvgKwy3q
 pKLw==
X-Gm-Message-State: AOAM5302jodoTHwCXxnNKK7uWx4Jys0b0afPqfTqWB3Ljs2VY0ookQkO
 7R9nHSjOCKMZMEDGF4xfWU8vUlJ1mVQKbHvJTS0jtyRYLx3FB8BQ2+7K3dPfyAAT4APbV5Za0dU
 dPlkmyTphynydSBg=
X-Received: by 2002:adf:82b1:: with SMTP id 46mr491147wrc.217.1630516348711;
 Wed, 01 Sep 2021 10:12:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBGGy58bRctfsoy/Wz6RgYHjsnnlMkv6EAumP+tkH8ZaBH8ApUG/lgSjbI+hbwHqqiA/DGVw==
X-Received: by 2002:adf:82b1:: with SMTP id 46mr491124wrc.217.1630516348501;
 Wed, 01 Sep 2021 10:12:28 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
 by smtp.gmail.com with ESMTPSA id a10sm57495wrd.51.2021.09.01.10.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 10:12:27 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] memory: Have 'info mtree' remove duplicated
 Address Space information
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210901161943.4174212-1-philmd@redhat.com>
 <20210901161943.4174212-4-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6519c605-2d39-0b43-a912-85cf1e1353a5@redhat.com>
Date: Wed, 1 Sep 2021 19:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901161943.4174212-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01.09.21 18:19, Philippe Mathieu-Daudé wrote:
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
> This drastically reduces the output of 'info mtree' on some boards.
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
>    108
> 
>    (qemu) info mtree
>    address-space: I/O
>      0000000000000000-000000000000ffff (prio 0, i/o): io
> 
>    address-space shared 9 times:
>      - cpu-memory-0
>      - cpu-memory-1
>      - cpu-memory-2
>      - cpu-memory-3
>      - cpu-secure-memory-0
>      - cpu-secure-memory-1
>      - cpu-secure-memory-2
>      - cpu-secure-memory-3
>      - memory
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        0000000000000000-000000003fffffff (prio 0, ram): ram
>        000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
>          000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
>          000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
>          000000003f006000-000000003f006fff (prio 0, i/o): mphi
>          000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
>          000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
>          000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
>          000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
>          000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
>          000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
>          000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
>          000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
>          000000003f201000-000000003f201fff (prio 0, i/o): pl011
>          000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
>          000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
>          000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
>          000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
>          000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
>          000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
>          000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
>          000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
>          000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
>          000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
>          000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
>          000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
>          000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
>          000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
>          000000003f980000-000000003f990fff (prio 0, i/o): dwc2
>            000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
>            000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
>          000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
>          000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
>          000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
>        0000000040000000-00000000400000ff (prio 0, i/o): bcm2836-control
> 
>    address-space shared 4 times:
>      - bcm2835-dma-memory
>      - bcm2835-fb-memory
>      - bcm2835-property-memory
>      - dwc2
>      0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>        0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>        0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>        000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>        0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>        00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
> 
>    address-space: bcm2835-mbox-memory
>      0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>        0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>        0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property
> 
>    memory-region: ram
>      0000000000000000-000000003fffffff (prio 0, ram): ram
> 
>    memory-region: bcm2835-peripherals
>      000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
>        000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
>        000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
>        000000003f006000-000000003f006fff (prio 0, i/o): mphi
>        000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
>        000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
>        000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
>        000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
>        000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
>        000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
>        000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
>        000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
>        000000003f201000-000000003f201fff (prio 0, i/o): pl011
>        000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
>        000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
>        000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
>        000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
>        000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
>        000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
>        000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
>        000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
>        000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
>        000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
>        000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
>        000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
>        000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
>        000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
>        000000003f980000-000000003f990fff (prio 0, i/o): dwc2
>          000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
>          000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
>        000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
>        000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
>        000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
> 
>    (qemu) q
> 
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg829821.html
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Pending question from David on v3:
> 
>    We can still distinguish from a completely empty AS, because we don't have an empty line here, correct?
> 
> checkpatch warning (81 chars):
> 
>    WARNING: line over 80 characters
>    #86: FILE: softmmu/memory.c:3359:
>    +                                  address_space_compare_name);
> ---
>   softmmu/memory.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 5be7d5e7412..9be2017bc38 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -3282,6 +3282,59 @@ static void mtree_info_flatview(bool dispatch_tree, bool owner)
>       /* Free */
>       g_hash_table_foreach_remove(views, mtree_info_flatview_free, 0);
>       g_hash_table_unref(views);
> +
> +    return;

^ unnecessary

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


