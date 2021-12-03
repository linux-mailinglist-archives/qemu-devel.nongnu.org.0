Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC1B4670D6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 04:44:23 +0100 (CET)
Received: from localhost ([::1]:36220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mszUk-0008Cs-Ow
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 22:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mszTU-0007KD-LA
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 22:43:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mszTS-0006za-Eh
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 22:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638502981;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ONP00ggAeigG615u/TT9SggQxYDsuxq10KJbMz9Bii8=;
 b=ZKoq9t9I726yqdKW5dBWclz2/qZjcVYCA4tmPwZYN/muFzZSQ10rppp3mulJbOrYB+JMS5
 udC6HX80scZmH0w/26UaqtjzNLSmgDLq1WIF5byPCfHyg3OD/+0XJ3/bCZ7/TVqeU1DSCn
 OAGLJYFqb/h0JOEVPmC99wcF7JbsH2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-tRlP-1GeMoi3hVjeeTAxig-1; Thu, 02 Dec 2021 22:42:58 -0500
X-MC-Unique: tRlP-1GeMoi3hVjeeTAxig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F9E83DD20;
 Fri,  3 Dec 2021 03:42:56 +0000 (UTC)
Received: from [10.64.54.43] (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8BAE45D64;
 Fri,  3 Dec 2021 03:42:40 +0000 (UTC)
Subject: Re: [PATCH 1/1] hw/arm/virt: Support for virtio-mem-pci
To: David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org
References: <20211130003328.201270-1-gshan@redhat.com>
 <20211130003328.201270-2-gshan@redhat.com>
 <be174699-17d1-f033-2228-193d1c3fb631@redhat.com>
 <c44a9072-0f21-9321-1828-23aadea5fea3@redhat.com>
 <1ae3f686-aaa9-4402-433e-325f422275df@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <18aa700f-e540-50f5-423a-717ef39d52d3@redhat.com>
Date: Fri, 3 Dec 2021 14:42:38 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1ae3f686-aaa9-4402-433e-325f422275df@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.3, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Michal Privoznik <mprivozn@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 8:03 PM, David Hildenbrand wrote:
>>>>
>>>>      * It has been passing the tests with various combinations like 64KB
>>>>        and 4KB page sizes on host and guest, different memory device
>>>>        backends like normal, transparent huge page and HugeTLB, plus
>>>>        migration.
>>>
>>> Perfect. A note that hugetlbfs isn't fully supported/safe to use until
>>> we have preallocation support in QEMU (WIP).
>>>
>>
>> Yes, there is some warnings raised to enlarge 'request-size' on
>> host with 64KB page size. Note that the memory backends I used
>> in the testings always have "prealloc=on" property though.
> 
> 1. prealloc=on
> 
> "prealloc=on" on the memory backend won't get the job done, because the first
> thing virtio-mem does is discard all memory in the memory backend again when
> it initializes. So it's an expensive NOP :) See
> 
> https://lkml.kernel.org/r/20211130104136.40927-9-david@redhat.com
> 
> for the virtio-mem "prealloc=on" option that preallocates memory when
> exposing that memory to the VM.
> 
> To use huge pages in a safe way with virtio-mem, we need "reserve=off" on the
> memory backend and "prealloc=on" on the virtio-mem device. (I'm in the process
> of documenting that on virtio-mem.gitlab.io/ to make it clearer)
> 

David, I will reply in a different thread for discussion purpose only. I
need some time for the investigation :)

> 
> 2. Warning on arm64 with 64k
> 
> I assume the warning you're seeing is regarding the block-size:
> 
> "Read unsupported THP size: ..." followed by
> "Could not detect THP size, falling back to ..."
> 
> The right thing to do for now should be to remove that sanity check:
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index d5a578142b..33c32afeb1 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -78,11 +78,8 @@ static uint32_t virtio_mem_thp_size(void)
>       if (g_file_get_contents(HPAGE_PMD_SIZE_PATH, &content, NULL, NULL) &&
>           !qemu_strtou64(content, &endptr, 0, &tmp) &&
>           (!endptr || *endptr == '\n')) {
> -        /*
> -         * Sanity-check the value, if it's too big (e.g., aarch64 with 64k base
> -         * pages) or weird, fallback to something smaller.
> -         */
> -        if (!tmp || !is_power_of_2(tmp) || tmp > 16 * MiB) {
> +        /* Sanity-check the value and fallback to something reasonable.  */
> +        if (!tmp || !is_power_of_2(tmp)) {
>               warn_report("Read unsupported THP size: %" PRIx64, tmp);
>           } else {
>               thp_size = tmp;
> 
> This will not affect setups we care about ( x86-64 KVM ).
> 
> It will imply that with a arm64 64k host, we can only hot(un)plug in
> 512 MiB granularity when not using hugetlb witht he default block-size.
> However, that is already the case with arm64 64k guests as well.
> The suggestion will be to use arm64 4k with virtio-mem in the host and
> the guest for increased flexibility -- fortunately most distros
> already have performed the switch to 4k on arm64, so we don't really
> care IMHO.
> 
> To support block_size < THP size when not using hugetlb,
> we'll have to disable THP (via MADV_NOHUGEPAGE) permanently for the memory
> region, also making sure that e.g., postcopy won't re-enable it by adding
> a proper flag (RAM_NOHUGEPAGE) to the RAMBlock. Because the issue is that
> once the guest touches some memory, we might populate a THP that would cover
> plugged and unplugged memory, which is bad.
> 
> Instead of warning in virtio_mem_device_realize() when
> 	vmem->block_size < virtio_mem_default_block_size(rb)
> we'd have to disable THP.
> 
> 
> Further, we should fixup the default THP size on arm64 in case we're
> running on an older kernel where we cannot sense the THP size:
> 
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index d5a578142b..371cee380a 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -38,13 +38,21 @@
>    */
>   #define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)(1 * MiB))
>   
> +static uint32_t virtio_mem_default_thp_size(void)
> +{
> +#if defined(__aarch64__)
> +    if (qemu_real_host_page_size == 64 * KiB) {
> +        return 512 * MiB;
> +    }
> +#endif
>   #if defined(__x86_64__) || defined(__arm__) || defined(__aarch64__) || \
>       defined(__powerpc64__)
> -#define VIRTIO_MEM_DEFAULT_THP_SIZE ((uint32_t)(2 * MiB))
> +    return 2 * MiB;
>   #else
> -        /* fallback to 1 MiB (e.g., the THP size on s390x) */
> -#define VIRTIO_MEM_DEFAULT_THP_SIZE VIRTIO_MEM_MIN_BLOCK_SIZE
> +    /* fallback to 1 MiB (e.g., the THP size on s390x) */
> +    return VIRTIO_MEM_MIN_BLOCK_SIZE;
>   #endif
> +}
>   
>   /*
>    * We want to have a reasonable default block size such that
> @@ -90,7 +98,7 @@ static uint32_t virtio_mem_thp_size(void)
>       }
>   
>       if (!thp_size) {
> -        thp_size = VIRTIO_MEM_DEFAULT_THP_SIZE;
> +        thp_size = virtio_mem_default_thp_size();
>           warn_report("Could not detect THP size, falling back to %" PRIx64
>                       "  MiB.", thp_size / MiB);
>       }
> 
> 
> 
> In the context of proper arm64 support, adding the above two changes
> should be good enough. If you agree, can you include them in your v2
> series as a separate patch?
> 
> Supporting block_size < thp_size when not using hugetlb is a different
> work IMHO, if someone ever cares about that.
> 
> 

Yeah, It's exactly the warnings I observed and I agree on the changes
except the 16KB-base-page-size case is missed. I've included all the
changes into separate patch in v2, which was just posted.

Thanks,
Gavin


