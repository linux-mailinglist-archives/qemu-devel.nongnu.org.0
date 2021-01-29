Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79054308967
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 14:57:53 +0100 (CET)
Received: from localhost ([::1]:42346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5UHY-0007Be-1d
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 08:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5UGU-0006bM-N1
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 08:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5UGR-00055L-BE
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 08:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611928602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1v68tzH18nDGkInlSsbX16ZpL+9VlZ5FJxEVLnyXmfI=;
 b=DhJNT75phMzleDbmpitJjqIZUPVMUmOoXdEljWx+7szVE8E/ZwMbD+wTO2hL431+pslh7u
 RAXbED59tOLoubkkMnJmDqYZWWxxjx6ZmqMEIC3H5ooZuyhS2u3Z9ITJeFJVoAXRV1/mHJ
 1o406duZ4EpIWj0ZAT5R+bDJeQDuOeE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-83wdrD2mPw2rIsTEJmM2MA-1; Fri, 29 Jan 2021 08:56:39 -0500
X-MC-Unique: 83wdrD2mPw2rIsTEJmM2MA-1
Received: by mail-wr1-f70.google.com with SMTP id c1so5159680wrx.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 05:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1v68tzH18nDGkInlSsbX16ZpL+9VlZ5FJxEVLnyXmfI=;
 b=l+BVgwQiu8x5zOXbu3KqtzBiCD7Ylo1incRybSwfw8vPqh3/Lhd6nQSHiXv1EAaNEy
 EVHAqJ5chD04BknOQ+Qup2bAyrFtrMobnG0eiaV21A7yUPk1XraXO1cz+oqU57mAGRw5
 oMkKU0iX67eiY77KILtL4zSVbYBjuu6AijgsOypVtf5YfPSLh1/gUacOHZM4Kf6c9D+r
 4dxD6h16Fpvhl9Bs+ZxQtwQ8C9OcbgaP/KsEEIy7DRRlbKT5KI+rxC+9abM48NV9FGXW
 ZyUNcLL3nZHQjrTWOX4kvv3whAQcIpQsGTNADDK3J4qYaUBrtntN30aEchlH9MPqqG5a
 WD0w==
X-Gm-Message-State: AOAM533uMzkJM/LnqSOHHoiVjsjCUnlUaCf/HL9bIWbHy2j2I0rCMy3z
 hzxUL6B5BW9hUkkZxrsYM/eHg86AUiki0tReJfgjRoXi9ybSjxJkP6a5DHQHV+uTzm4hfLBtI4s
 yWxUz0oimpc+H+t8=
X-Received: by 2002:adf:8295:: with SMTP id 21mr4690114wrc.32.1611928598744;
 Fri, 29 Jan 2021 05:56:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAFXbHU6np8E1VUHl7S6JcwsWE3LAqUw7/dbnr4BIIJeejmj1Dth3yYXK4HhxGuyXkZj94mw==
X-Received: by 2002:adf:8295:: with SMTP id 21mr4690097wrc.32.1611928598559;
 Fri, 29 Jan 2021 05:56:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id t18sm8497699wrr.56.2021.01.29.05.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 05:56:37 -0800 (PST)
Subject: Re: [PATCH v2] ppc/pnv: Set default RAM size to 1 GB
To: Greg Kurz <groug@kaod.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210129111719.790692-1-clg@kaod.org>
 <20210129124115.750432da@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <89d55b07-da2a-332b-5b9b-3f938fed5aa6@redhat.com>
Date: Fri, 29 Jan 2021 14:56:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129124115.750432da@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 12:41 PM, Greg Kurz wrote:
> On Fri, 29 Jan 2021 12:17:19 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> The memory layout of the PowerNV machine is defined as :
>>
>>   #define KERNEL_LOAD_BASE	((void *)0x20000000)
>>   #define KERNEL_LOAD_SIZE	0x08000000
>>
>>   #define INITRAMFS_LOAD_BASE	KERNEL_LOAD_BASE + KERNEL_LOAD_SIZE
>>   #define INITRAMFS_LOAD_SIZE	0x08000000
>>
>>   #define SKIBOOT_BASE		0x30000000
>>   #define SKIBOOT_SIZE		0x01c10000
>>
>>   #define CPU_STACKS_BASE	(SKIBOOT_BASE + SKIBOOT_SIZE)
>>   #define STACK_SHIFT		15
>>   #define STACK_SIZE		(1 << STACK_SHIFT)
>>
>> The overall size of the CPU stacks is (max PIR + 1) * 32K and the
>> machine easily reaches 800MB of minimum required RAM.
>>
>> Any value below will result in a skiboot crash :
>>
>>     [    0.034949905,3] MEM: Partial overlap detected between regions:
>>     [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000] (new)
>>     [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0x38400000]
>>     [    0.034980367,3] Out of memory adding skiboot reserved areas
>>     [    0.035074945,3] ***********************************************
>>     [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
>>     [    0.035104247,3]     .
>>     [    0.035108025,3]      .
>>     [    0.035111651,3]       .
>>     [    0.035115231,3]         OO__)
>>     [    0.035119198,3]        <"__/
>>     [    0.035122980,3]         ^ ^
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/ppc/pnv.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
...
>>      /* allocate RAM */
>> -    if (machine->ram_size < (1 * GiB)) {
>> -        warn_report("skiboot may not work with < 1GB of RAM");
>> +    if (machine->ram_size < mc->default_ram_size) {
>> +        char *sz = size_to_str(mc->default_ram_size);
>> +        error_report("Invalid RAM size, should be bigger than %s", sz);
>> +        g_free(sz);
> 
> FWIW you could even not call g_free() at all since this is an
> exit path and this code is unlikely to be reused differently,

Well, some tests check for invalid configs, and when run with
--enable-sanitizer they'd complain for memory leak, so better
free IMHO.

> or stay clean and tag 'sz' with g_autofree as recommended in
> CODING_STYLE.

Preferably using g_autofree:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Anyway, this is definitely an improvement so:
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>


