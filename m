Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D527AA16
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 10:59:55 +0200 (CEST)
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMp0k-0003oR-5D
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 04:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kMozd-0002vU-5x
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 04:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kMozb-0000Jj-6u
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 04:58:44 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601283522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uK9nWEPcgcaVXFfy6LxWjUZZJnFHk8TEDuqrml6eBpo=;
 b=W5CSEIRTcDrP3bRi+iMD2mlU6rnOyYGHpBebrtuj8stUAgRxvLCQ25xCKRI91O/Zx6hJ3M
 x9sWk6cKS2+W3tT5WkAHZ4gBn79htIZAICcBNwtd/JgPkGmyXeZlub4V+Mxw8zZTTmwhn4
 FiaN++hW54KparyQWM8iLwlUejhUVwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-Ec16rZ1FOY6TSzxYx4vcTw-1; Mon, 28 Sep 2020 04:58:40 -0400
X-MC-Unique: Ec16rZ1FOY6TSzxYx4vcTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51FA78030A5;
 Mon, 28 Sep 2020 08:58:39 +0000 (UTC)
Received: from [10.36.114.255] (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66FE01A913;
 Mon, 28 Sep 2020 08:58:33 +0000 (UTC)
Subject: Re: [PATCH v1 1/5] virtio-mem: Probe THP size to determine default
 block size
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
References: <20200923113900.72718-1-david@redhat.com>
 <20200923113900.72718-2-david@redhat.com>
 <CAM9Jb+gJkzW3_d-JxG+o6eYttSXHPGxCGDhzLgpyb_okOG+xXA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <21b7facd-0801-f90e-8806-ccfa3d1730fa@redhat.com>
Date: Mon, 28 Sep 2020 10:58:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAM9Jb+gJkzW3_d-JxG+o6eYttSXHPGxCGDhzLgpyb_okOG+xXA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.011, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.09.20 15:46, Pankaj Gupta wrote:
>> Let's allow a minimum block size of 1 MiB in all configurations. Use
>> a default block size based on the THP size, and warn if something
>> smaller is configured by the user.
>>
>> VIRTIO_MEM only supports Linux (depends on LINUX), so we can probe the
>> THP size unconditionally.
>>
>> For now we only support virtio-mem on x86-64 - there isn't a user-visiable
>> change (x86-64 only supports 2 MiB THP on the PMD level) - the default
>> was, and will be 2 MiB.
>>
>> If we ever have THP on the PUD level (e.g., 1 GiB THP on x86-64), we
>> expect to have a trigger to explicitly opt-in for the new THP granularity.
>>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Wei Yang <richardw.yang@linux.intel.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  hw/virtio/virtio-mem.c | 82 +++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 78 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
>> index 8fbec77ccc..58098686ee 100644
>> --- a/hw/virtio/virtio-mem.c
>> +++ b/hw/virtio/virtio-mem.c
>> @@ -33,10 +33,70 @@
>>  #include "trace.h"
>>
>>  /*
>> - * Use QEMU_VMALLOC_ALIGN, so no THP will have to be split when unplugging
>> - * memory (e.g., 2MB on x86_64).
>> + * Let's not allow blocks smaller than 1 MiB, for example, to keep the tracking
>> + * bitmap small.
>>   */
>> -#define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)QEMU_VMALLOC_ALIGN)
>> +#define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)(1 * MiB))
>> +
>> +/*
>> + * We want to have a reasonable default block size such that
>> + * 1. We avoid splitting THPs when unplugging memory, which degrades
>> + *    performance.
>> + * 2. We avoid placing THPs for plugged blocks that also cover unplugged
>> + *    blocks.
>> + *
>> + * The actual THP size might differ between Linux kernels, so we try to probe
>> + * it. In the future (if we ever run into issues regarding 2.), we might want
>> + * to disable THP in case we fail to properly probe the THP size, or if the
>> + * block size is configured smaller than the THP size.
>> + */
>> +static uint32_t default_block_size;
>> +
>> +#define HPAGE_PMD_SIZE_PATH "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size"
>> +static uint32_t virtio_mem_default_block_size(void)
>> +{
>> +    gchar *content = NULL;
>> +    const char *endptr;
>> +    uint64_t tmp;
>> +
>> +    if (default_block_size) {
>> +        return default_block_size;
>> +    }
>> +
>> +    /*
>> +     * Try to probe the actual THP size, fallback to (sane but eventually
>> +     * incorrect) default sizes.
>> +     */
>> +    if (g_file_get_contents(HPAGE_PMD_SIZE_PATH, &content, NULL, NULL) &&
>> +        !qemu_strtou64(content, &endptr, 0, &tmp) &&
>> +        (!endptr || *endptr == '\n')) {
>> +        /*
>> +         * Sanity-check the value, if it's too big (e.g., aarch64 with 64k base
>> +         * pages) or weird, fallback to something smaller.
>> +         */
>> +        if (!tmp || !is_power_of_2(tmp) || tmp > 16 * MiB) {
>> +            warn_report("Detected a THP size of %" PRIx64
>> +                        " MiB, falling back to 1 MiB.", tmp / MiB);
>> +            default_block_size = 1 * MiB;
> 
> Probably use macro "VIRTIO_MEM_MIN_BLOCK_SIZE"

Indeed.

>> +        } else {
>> +            default_block_size = tmp;
>> +        }
>> +    } else {
>> +#if defined(__x86_64__) || defined(__arm__) || defined(__aarch64__) || \
>> +    defined(__powerpc64__)
>> +        default_block_size = 2 * MiB;
>> +#else
>> +        /* fallback to 1 MiB (e.g., the THP size on s390x) */
>> +        default_block_size = 1 * MiB;
>> +#endif
> 
> Maybe we can declare this macro near to "VIRTIO_MEM_MIN_BLOCK_SIZE
> ((uint32_t)(1 * MiB))"
> or club into one, just a thought.

I decided to not use VIRTIO_MEM_MIN_BLOCK_SIZE here to not accidentally
mess up the s390x THP size when ever wanting to decrease
VIRTIO_MEM_MIN_BLOCK_SIZE. But as we have a comment here, people should
know whats happening when ever changing VIRTIO_MEM_MIN_BLOCK_SIZE.

Thanks!

-- 
Thanks,

David / dhildenb


