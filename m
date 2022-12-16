Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0EF64E852
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 09:54:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p66Sp-0001dZ-Oy; Fri, 16 Dec 2022 03:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p66Sn-0001dK-BH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 03:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p66Sl-00059W-Nn
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 03:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671180782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mdC19y2g2LvrJNky2RkCxj2uFieSTzL5/Du6JhaZsg=;
 b=IO+lKSV+Xamyv2Y7nBaqWmr2+0cpMsE3D+h1ndLSQiHv8YxuJHz9zPV7qsQ6blmZaE+ufV
 WkD0wqZkANgo6QigH41WoFkbFVWX4FltavE/m0qdy+TlRuYD2+Ixo43ZgQRLT2UADp3qgU
 X+pqQ7nPNTcSFSlp0jx/TslmW6m8Zb0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-uGHFVJYsMZ2vE-5J_ppn-Q-1; Fri, 16 Dec 2022 03:53:00 -0500
X-MC-Unique: uGHFVJYsMZ2vE-5J_ppn-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso1309620wms.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 00:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :content-language:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5mdC19y2g2LvrJNky2RkCxj2uFieSTzL5/Du6JhaZsg=;
 b=bz/SqhXW5FjPWF7ddgtji39FUyL0c5/0eLhg5b+hmd5gf7fRcXZxOC1sMbqW6ARsHY
 423+psw7t66awimwAda9wcpcl80qmClFoFIvxB5smuOVhMvPuN37daDN/kqahRrb8N7J
 HR8MIZYCkQWxSUhRivTrBciFzwQpsRv+jt/I69yQmxdAa2JiPAFKxLo+P21Z/J36h3jK
 4rEvTw4SpYwurNKxCuDPHWEvcGa5KPwzQoas18TdzckCM3/1WY7aZRXXgc4iP5tio/pQ
 VSf1CQQddLTC/zCyOTYyruTyNYVsYy4LBHmPmRRVJlS2tDyepDKUaEU2aqTm3CEoWGpE
 jMTQ==
X-Gm-Message-State: ANoB5pk7zTE1r9WWChbCoQRiKVmtCBWnNgYOEIRheT+PRUlzfHDJQ8PM
 MjnPVeDlli+yLJ6VHm5MWxi2KOoZJLlu+6itPFacWgccsBFed3Luyz8cNVVRii4EmtcYo23Vaa9
 SZ50c906JJ6FQ+bI=
X-Received: by 2002:a5d:61cd:0:b0:241:fc02:f8fd with SMTP id
 q13-20020a5d61cd000000b00241fc02f8fdmr20219973wrv.71.1671180779061; 
 Fri, 16 Dec 2022 00:52:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf56YDtCC4GEQURTH4P48IenjrUQh4bm18ygKBQeI/sBSstx6cKNm47tPu03Hoj+Lo60aWAfAw==
X-Received: by 2002:a5d:61cd:0:b0:241:fc02:f8fd with SMTP id
 q13-20020a5d61cd000000b00241fc02f8fdmr20219961wrv.71.1671180778722; 
 Fri, 16 Dec 2022 00:52:58 -0800 (PST)
Received: from ?IPV6:2003:cb:c71c:3900:7211:d436:8d8b:531c?
 (p200300cbc71c39007211d4368d8b531c.dip0.t-ipconnect.de.
 [2003:cb:c71c:3900:7211:d436:8d8b:531c])
 by smtp.gmail.com with ESMTPSA id
 y6-20020adfe6c6000000b00241e8d00b79sm1929680wrm.54.2022.12.16.00.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 00:52:58 -0800 (PST)
Message-ID: <b661461d-fb24-c974-2d8e-d3e760e00033@redhat.com>
Date: Fri, 16 Dec 2022 09:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20221216062231.11181-1-chenyi.qiang@intel.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] virtio-mem: Fix the bitmap index of the section offset
In-Reply-To: <20221216062231.11181-1-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16.12.22 07:22, Chenyi Qiang wrote:
> vmem->bitmap indexes the memory region of the virtio-mem backend at a
> granularity of block_size. To calculate the index of target section offset,
> the block_size should be divided instead of the bitmap_size.

I'm curious, what's the user-visible effect and how did you identify 
this issue?

IIUC, we could end up our search for a plugged/unplugged block "too 
late", such that we miss to process blocks.

That would be the case if the bitmap_size < block_size, which should 
effectively always happen ...


unplug_all and migration would be affected, which is why a simple test 
case without a guest reboot/migration wouldn't run into it.

> 
> Fixes: 2044969f0b ("virtio-mem: Implement RamDiscardManager interface")
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> ---
>   hw/virtio/virtio-mem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index ed170def48..e19ee817fe 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -235,7 +235,7 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
>       uint64_t offset, size;
>       int ret = 0;
>   
> -    first_bit = s->offset_within_region / vmem->bitmap_size;
> +    first_bit = s->offset_within_region / vmem->block_size;
>       first_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
>       while (first_bit < vmem->bitmap_size) {
>           MemoryRegionSection tmp = *s;
> @@ -267,7 +267,7 @@ static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
>       uint64_t offset, size;
>       int ret = 0;
>   
> -    first_bit = s->offset_within_region / vmem->bitmap_size;
> +    first_bit = s->offset_within_region / vmem->block_size;
>       first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
>       while (first_bit < vmem->bitmap_size) {
>           MemoryRegionSection tmp = *s;

Looks correct to me

Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb


