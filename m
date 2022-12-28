Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4465776C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAWrG-00077v-1e; Wed, 28 Dec 2022 08:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pAWrA-00077N-F1
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pAWr7-0000eN-Qd
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672235548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5Wq+Fxq9ot3xTqboGh9OTYKSt9TuvKa4JlbXMoPVsc=;
 b=PMflrKnhmZGpdsGKtJFn2wicwIIOyJURCD/up+Eo4d1ZIRsBvgPDk8Pgvlzzr4+nzUZdzs
 /FT88o8jXc9RjmOYrN8O3/BIBjqj3vu2+qHAUGVZtIipS7GvaASlBTXgoeUro2ZEPNhJNP
 k5vaQzDiQYsXlTbDNP9GjAZJ/nEfRH4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-tCqyssJfOCqAQQpMi-mC7w-1; Wed, 28 Dec 2022 08:52:26 -0500
X-MC-Unique: tCqyssJfOCqAQQpMi-mC7w-1
Received: by mail-wm1-f72.google.com with SMTP id
 n18-20020a05600c4f9200b003d993e08485so999626wmq.2
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 05:52:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5Wq+Fxq9ot3xTqboGh9OTYKSt9TuvKa4JlbXMoPVsc=;
 b=qZ2zV5w/6GjzERFMWce2yAp+h9gwsPoysJHmGkxj7MBMd5y+DCNKitIh/uZlmwo0b3
 Y0kPxma3UdnA/lwNB0vHHqjFKcnToZzts52ODUntDgohATnkWm7ao+aBg+2RBxyklcsm
 Icr06INQ3ZR6sAgLVepehfZxodM/zQCisYm8zyViEFtzBDJGlOXiXtEmNs6tQrwsp/RH
 InSGULduRMasbR8295QS2IwFwqZChZz1ab4kyQ4mjFRzCkngr62TZlzAdiMGDislPYe2
 cO51HRLXTsWVqFz+sgDS0PXokjnaX/ozbgxjSerffAb4f0t6lc/7lpNLdHVLexNHGIdp
 HrZg==
X-Gm-Message-State: AFqh2kr/KueAIFsJWzAwIkOYu2PBek5b15yc46MOrO4xboQjejKznudl
 g4pnZLipnuneh0KqYO9MO4NrP0F91nHgqyfceEPVHP3rRypqqHS/EaRjwrvYLDIcrZjx8a7WeEH
 oqThIWlyRpGL7cO4=
X-Received: by 2002:adf:c648:0:b0:275:618c:83ea with SMTP id
 u8-20020adfc648000000b00275618c83eamr12729797wrg.29.1672235545275; 
 Wed, 28 Dec 2022 05:52:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9R4iN0V/YqDxj/huSeSNN6PQ7wIC98AjtSEBSMO2LPH3LXADkxDzEyDHki1ecdnM3GSZ30g==
X-Received: by 2002:adf:c648:0:b0:275:618c:83ea with SMTP id
 u8-20020adfc648000000b00275618c83eamr12729787wrg.29.1672235544982; 
 Wed, 28 Dec 2022 05:52:24 -0800 (PST)
Received: from ?IPV6:2003:d8:2f16:1800:a9b4:1776:c5d9:1d9a?
 (p200300d82f161800a9b41776c5d91d9a.dip0.t-ipconnect.de.
 [2003:d8:2f16:1800:a9b4:1776:c5d9:1d9a])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056000008f00b00267e918d1ecsm15423473wrx.24.2022.12.28.05.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 05:52:24 -0800 (PST)
Message-ID: <2d847cbf-687b-cd44-7737-393a96460d7f@redhat.com>
Date: Wed, 28 Dec 2022 14:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] virtio-mem: Fix typo in function name
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>
References: <20221228130956.80515-1-philmd@linaro.org>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221228130956.80515-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28.12.22 14:09, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/virtio/virtio-mem.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index d96bde1fab..c252027391 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -207,7 +207,7 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
>    *
>    * Returns false if the intersection is empty, otherwise returns true.
>    */
> -static bool virito_mem_intersect_memory_section(MemoryRegionSection *s,
> +static bool virtio_mem_intersect_memory_section(MemoryRegionSection *s,
>                                                   uint64_t offset, uint64_t size)
>   {
>       uint64_t start = MAX(s->offset_within_region, offset);
> @@ -245,7 +245,7 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
>                                         first_bit + 1) - 1;
>           size = (last_bit - first_bit + 1) * vmem->block_size;
>   
> -        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>               break;
>           }
>           ret = cb(&tmp, arg);
> @@ -277,7 +277,7 @@ static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
>                                    first_bit + 1) - 1;
>           size = (last_bit - first_bit + 1) * vmem->block_size;
>   
> -        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>               break;
>           }
>           ret = cb(&tmp, arg);
> @@ -313,7 +313,7 @@ static void virtio_mem_notify_unplug(VirtIOMEM *vmem, uint64_t offset,
>       QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
>           MemoryRegionSection tmp = *rdl->section;
>   
> -        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>               continue;
>           }
>           rdl->notify_discard(rdl, &tmp);
> @@ -329,7 +329,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
>       QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
>           MemoryRegionSection tmp = *rdl->section;
>   
> -        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>               continue;
>           }
>           ret = rdl->notify_populate(rdl, &tmp);
> @@ -346,7 +346,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
>               if (rdl2 == rdl) {
>                   break;
>               }
> -            if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
> +            if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
>                   continue;
>               }
>               rdl2->notify_discard(rdl2, &tmp);

Yeah, I already included a fix in a different series that I yet have to 
follow up:

https://lkml.kernel.org/r/20211013103330.26869-12-david@redhat.com

Most probably I'll simply queue this fix here.

-- 
Thanks,

David / dhildenb


