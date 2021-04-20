Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2A3652D8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 09:06:13 +0200 (CEST)
Received: from localhost ([::1]:56058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkSa-0002sS-Ou
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 03:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1lYkQN-0001uX-Ng
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:03:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1lYkQI-0001eE-JY
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:03:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id g9so20388953wrx.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z0qlnC9FQLAYaUfbzjwveKndRqxMBnneIPTllI02ItA=;
 b=hCCPYMXGdUsCAS6vyVjzwk4D/dBhqlKrvFqivZmP6ldu0r5XUM9lfCzwo+R0aqTra4
 Fp1SbxXbpiYGidu1zBLZJ3uo1eKKsUylIVVz1mVX4OVkQcKWMN2W7SVmtElqLgEWRa5h
 FDgBoPKwIwp5++UNE2GKjQcuLTzlrVry+ptJFl4GBOtwZnHf3T9d+l8dB+lsDoIwBsop
 9D0uj8TGXhOf6ytsyqHgh4neU6YJFJFctT2ZFU/VKYv6mrpiZrPEY4KdOqloO1JgikiM
 o2zsjFMKpm+xWR/h9bcVgQXfik1OwsCjxNYjqwgotz1fON1m2qKLwEf7BhTtu26Odae8
 li7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:subject:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=z0qlnC9FQLAYaUfbzjwveKndRqxMBnneIPTllI02ItA=;
 b=uY+KZ87TdZ6wg1xZ8mC3zVIMbSt5rO5KBBcGuR5YygC6PLFxo0m4UW/LFjF4QEaAie
 oDiBqktVIfkkEWLmoTXQGhMEBSbEPzYh9xV/tbkq07kahO4P1QR4/ebyMt9a66Dk2o57
 drCilO+0q9bHgBglmOXScFBZQHt6YzVuvI8oDeP/HALe1SEgaGp+7xmQxoEG23PUw7Bq
 jQJ6Soxhfs1dolevZSF8t1w1/SfWDOjxqgoJu5llHAO7kT6TxhpSQXva/QH9WeMJWl31
 IDCPf9S4zH8r4BR74RFsD5fXacV5+TbPp8Ei4G9qvNW76uC33U3vhgYkqCdws9skFs1F
 pKAA==
X-Gm-Message-State: AOAM531ZCi3ZAQ65IEFnwcqm/VYIgGExC+5ZPubBZxIwa1SHvtpDQ+a8
 vRtIiFAodDsRIDBKSJyp6Hg=
X-Google-Smtp-Source: ABdhPJwZlSRYmjIazA6Om37onLUUl6ivvSf7z8zRum+4Pjxaj9lJNZiWZW4i5AzFsakd4iL8sDqYag==
X-Received: by 2002:adf:e483:: with SMTP id i3mr19436550wrm.286.1618902225921; 
 Tue, 20 Apr 2021 00:03:45 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id n9sm25761566wrq.86.2021.04.20.00.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 00:03:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
To: Igor Druzhinin <igor.druzhinin@citrix.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
References: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
Message-ID: <37547f5e-5b75-d31a-f973-f8ccedbe4167@xen.org>
Date: Tue, 20 Apr 2021 08:03:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Cc: sstabellini@kernel.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, anthony.perard@citrix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2021 04:35, Igor Druzhinin wrote:
> When we're replacing the existing mapping there is possibility of a race
> on memory map with other threads doing mmap operations - the address being
> unmapped/re-mapped could be occupied by another thread in between.
> 
> Linux mmap man page recommends keeping the existing mappings in place to
> reserve the place and instead utilize the fact that the next mmap operation
> with MAP_FIXED flag passed will implicitly destroy the existing mappings
> behind the chosen address. This behavior is guaranteed by POSIX / BSD and
> therefore is portable.
> 
> Note that it wouldn't make the replacement atomic for parallel accesses to
> the replaced region - those might still fail with SIGBUS due to
> xenforeignmemory_map not being atomic. So we're still not expecting those.
> 
> Tested-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>   hw/i386/xen/xen-mapcache.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index 5b120ed..e82b7dc 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -171,7 +171,20 @@ static void xen_remap_bucket(MapCacheEntry *entry,
>           if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
>               ram_block_notify_remove(entry->vaddr_base, entry->size);
>           }
> -        if (munmap(entry->vaddr_base, entry->size) != 0) {
> +
> +        /*
> +         * If an entry is being replaced by another mapping and we're using
> +         * MAP_FIXED flag for it - there is possibility of a race for vaddr
> +         * address with another thread doing an mmap call itself
> +         * (see man 2 mmap). To avoid that we skip explicit unmapping here
> +         * and allow the kernel to destroy the previous mappings by replacing
> +         * them in mmap call later.
> +         *
> +         * Non-identical replacements are not allowed therefore.
> +         */
> +        assert(!vaddr || (entry->vaddr_base == vaddr && entry->size == size));
> +
> +        if (!vaddr && munmap(entry->vaddr_base, entry->size) != 0) {
>               perror("unmap fails");
>               exit(-1);
>           }
> 


