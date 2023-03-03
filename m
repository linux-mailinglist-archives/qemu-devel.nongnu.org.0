Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AD6A945F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:45:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1yP-0002U9-VP; Fri, 03 Mar 2023 04:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pY1yO-0002TV-4Q
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pY1yM-0006u6-4o
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677836705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1eKjVSNiFx2qeutxVvCzawxNumM9nF8oPNxW/wzG6Q=;
 b=gl4o59SL2ccQ/lS1EDnJlPqEuJfftFSy36hj7WELwVMdPEsg11XGnQZnMA8ULobEDkjW2t
 od+4et/2zZCAOwglRV4rvsG6mnPD9N+NE0gwDP91SZhygqR3uB1YjZkxktVHnR4UyPeo4A
 xii58ynvHT1GkMqZhrjNFgWzF8QHVvg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-U4khsaCuNqOQA3GDLJvsiQ-1; Fri, 03 Mar 2023 04:45:03 -0500
X-MC-Unique: U4khsaCuNqOQA3GDLJvsiQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so750604wms.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677836702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M1eKjVSNiFx2qeutxVvCzawxNumM9nF8oPNxW/wzG6Q=;
 b=phfAbFiC9K8ei78ToEereuENIEnwMjTU0COeaw0nmMHAips0recqObAvrc/sB9zDDo
 72ITy3qqtQHqadb3HlmqBgBe44JpODZCFx8D5Ar3rUpIAtO83e5ijRgD+GiVDIhhR+Ax
 l4q5ysO4GcF9m3NnI4nbqxAc2Gt6nkcZ5ARNOKiA5rPpBwzj/bYGY6nNlTYTnp9fYa8P
 4L9b/ntk6C2oqODR6MNtOM798WKTCUROtPaBjaiU6R9tm6/YQoEMbOMb6eb87aKxqwNv
 lBhdk5aLK44+eedl9hefooRMQqXNfkQyNeozO+pk5VMR0y7M5VWIB+TsaWUvFDcwm16L
 F5hg==
X-Gm-Message-State: AO0yUKWPzbM89PFcF5orq513CxjCUkuv+1e0yC/SxUvsKkSuXlfCawTe
 j8cMRt6q1P0/xNvRG7WVg73DKFN9QVjuCvKjUvTikKg9WemDCsggUO8rRc06aRv8mWrhIjmP3e4
 J9u5i067T2uOcR5pPmMiO
X-Received: by 2002:a05:600c:3c9c:b0:3ea:bc08:b63e with SMTP id
 bg28-20020a05600c3c9c00b003eabc08b63emr1209310wmb.2.1677836702628; 
 Fri, 03 Mar 2023 01:45:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+FMODkAJaY5AWNXn3eVv6J8EP7ROje2DGRsA4VbgYzW00QFuvL7STuZ7N3nDP7Qd7mnn4Dbg==
X-Received: by 2002:a05:600c:3c9c:b0:3ea:bc08:b63e with SMTP id
 bg28-20020a05600c3c9c00b003eabc08b63emr1209303wmb.2.1677836702342; 
 Fri, 03 Mar 2023 01:45:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a1c4c1a000000b003eb395a8280sm5456689wmf.37.2023.03.03.01.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:45:01 -0800 (PST)
Message-ID: <f4f9fe64-0e79-08e7-7833-fd5c897424a8@redhat.com>
Date: Fri, 3 Mar 2023 10:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] vfio: Fix vfio_get_dev_region() trace event
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>
References: <20230303074330.2609377-1-clg@kaod.org>
 <93a2b734-d3b1-27e8-32f4-d46342dc6b00@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <93a2b734-d3b1-27e8-32f4-d46342dc6b00@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/3/23 10:34, Philippe Mathieu-Daudé wrote:
> On 3/3/23 08:43, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@redhat.com>
>>
>> Simply revert 'x8' to fix the typo and remove the ending '8'
>>
>> Fixes: e61a424f05 ("vfio: Create device specific region info helper")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1526
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/vfio/trace-events | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 669d9fe07c..28e82541a2 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -117,7 +117,7 @@ vfio_region_mmaps_set_enabled(const char *name, bool enabled) "Region %s mmaps e
>>   vfio_region_unmap(const char *name, unsigned long offset, unsigned long end) "Region %s unmap [0x%lx - 0x%lx]"
>>   vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Device %s region %d: %d sparse mmap entries"
>>   vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
>> -vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
>> +vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%08x"
> 
> 8 digits might be over-engineered, but at least is future-proof :)

well, yes, but it also depends on other possible outputs from the OS or,
more important, from gdb when dumping memory. It it better if they match.

Since it is an hex number, may be I should add a '0x' prefix also ? That's
a lot of versions for a 2 bytes patch ! :)

Thanks,

C.



> 
> $ git grep -E 'VFIO_REGION_(SUB)?TYPE_' linux-headers/
> linux-headers/linux/vfio.h:322:#define VFIO_REGION_TYPE_PCI_VENDOR_TYPE (1 << 31)
> linux-headers/linux/vfio.h:323:#define VFIO_REGION_TYPE_PCI_VENDOR_MASK (0xffff)
> linux-headers/linux/vfio.h:324:#define VFIO_REGION_TYPE_GFX       (1)
> linux-headers/linux/vfio.h:325:#define VFIO_REGION_TYPE_CCW        (2)
> linux-headers/linux/vfio.h:326:#define VFIO_REGION_TYPE_MIGRATION_DEPRECATED   (3)
> linux-headers/linux/vfio.h:328:/* sub-types for VFIO_REGION_TYPE_PCI_* */
> linux-headers/linux/vfio.h:331:#define VFIO_REGION_SUBTYPE_INTEL_IGD_OPREGION   (1)
> linux-headers/linux/vfio.h:332:#define VFIO_REGION_SUBTYPE_INTEL_IGD_HOST_CFG   (2)
> linux-headers/linux/vfio.h:333:#define VFIO_REGION_SUBTYPE_INTEL_IGD_LPC_CFG    (3)
> linux-headers/linux/vfio.h:341:#define VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM   (1)
> linux-headers/linux/vfio.h:350:#define VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD     (1)
> linux-headers/linux/vfio.h:352:/* sub-types for VFIO_REGION_TYPE_GFX */
> linux-headers/linux/vfio.h:353:#define VFIO_REGION_SUBTYPE_GFX_EDID       (1)
> linux-headers/linux/vfio.h:402:/* sub-types for VFIO_REGION_TYPE_CCW */
> linux-headers/linux/vfio.h:403:#define VFIO_REGION_SUBTYPE_CCW_ASYNC_CMD        (1)
> linux-headers/linux/vfio.h:404:#define VFIO_REGION_SUBTYPE_CCW_SCHIB        (2)
> linux-headers/linux/vfio.h:405:#define VFIO_REGION_SUBTYPE_CCW_CRW        (3)
> linux-headers/linux/vfio.h:407:/* sub-types for VFIO_REGION_TYPE_MIGRATION */
> linux-headers/linux/vfio.h:408:#define VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED (1)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 


