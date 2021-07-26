Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D13D6510
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 19:01:00 +0200 (CEST)
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83yN-0002xr-GU
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 13:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m83w7-000080-9A
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:58:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m83w4-00057S-CC
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627318715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGjaKRNZ3S9GgLMz9rV0IEKk+VnFPDYVufmk2NhxfqI=;
 b=WgLfxTiR347RcGlvG0zrCgsuECUQvWjiwk8lRwa7vckaRCfGCTLB2RV497+IjWHLFJcARL
 sb0lK9mj9Jm0d3gK8kxOasM3iTWVy3f/sVyTxpQ/rbsa0y4KAMse2+z6cjD9ZAjI94YO80
 HLNiHplGadawt8Ut5WtRIfqbcyQ+KaA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-ZYJv0sY7O8qAa-kZAbza2Q-1; Mon, 26 Jul 2021 12:58:34 -0400
X-MC-Unique: ZYJv0sY7O8qAa-kZAbza2Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 n1-20020a5d59810000b029013cd60e9baaso4966560wri.7
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CGjaKRNZ3S9GgLMz9rV0IEKk+VnFPDYVufmk2NhxfqI=;
 b=i0wXWnphHMnJkukMdZJYzlkEcX5qBa7ocPbZILCcEVdrrKapvZjr83CPK3xCyrQKVP
 KKCWUz6x5W9c00juO/w2bAbqZ2eG0VmUKknwdMmPWq3dU0idpvr/ymPl30NMS0tHlfuY
 JK6T31CQp1RSOlQgjXVeG4aPLzO/ODJXsaz+wq3B7aBjDyIowkjMaROHQrM6ypsnmOVQ
 WwIRf4QaolcWGcGONCB2zlYcEMr3/Jg+VYbTBsCGtQDX3XG9HYZfMxry4Tl9JkhaC2i9
 wEaaGqYtATS2CPjij5XF9PX5MDydYn/tl5+GPPCP6Nc5Ijb2ZOrJpRDAs+v1+qLWn8Wb
 zO2Q==
X-Gm-Message-State: AOAM531QhImgb1FhwJp+CSWWPRO/WHT02V1UUQ8wmvOytI39RwsOMNO9
 zitrFea26J78l5qK3p8znmRjtzSb/WAWueozRBX5DG5ojLYEbgsYjCIYEG1B0j9fwAIRbzzYPk1
 VCCoydGowRNVY76g=
X-Received: by 2002:adf:dc82:: with SMTP id r2mr21029494wrj.33.1627318713365; 
 Mon, 26 Jul 2021 09:58:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO9sNX7hbxpgPcrptIyZuwtcCIeDs/PDxohl39KU6xSTusQk+F/k26u/R417VdYkJRPix8zw==
X-Received: by 2002:adf:dc82:: with SMTP id r2mr21029465wrj.33.1627318713183; 
 Mon, 26 Jul 2021 09:58:33 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23b33.dip0.t-ipconnect.de. [79.242.59.51])
 by smtp.gmail.com with ESMTPSA id
 140sm307834wmb.43.2021.07.26.09.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 09:58:32 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] tpm: mark correct memory region range dirty when
 clearing RAM
To: Peter Xu <peterx@redhat.com>
References: <20210726160346.109915-1-david@redhat.com>
 <20210726160346.109915-2-david@redhat.com> <YP7ph0a9kI9p4zhs@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d88d74e3-aac3-0a04-abeb-407eee2d3c15@redhat.com>
Date: Mon, 26 Jul 2021 18:58:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP7ph0a9kI9p4zhs@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.07.21 18:57, Peter Xu wrote:
> On Mon, Jul 26, 2021 at 06:03:43PM +0200, David Hildenbrand wrote:
>> We might not start at the beginning of the memory region. Let's
>> calculate the offset into the memory region via the difference in the
>> host addresses.
>>
>> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
>> Fixes: ffab1be70692 ("tpm: clear RAM when "memory overwrite" requested")
>> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> Cc: Alex Williamson <alex.williamson@redhat.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Claudio Fontana <cfontana@suse.de>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: "Alex Bennée" <alex.bennee@linaro.org>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Laurent Vivier <lvivier@redhat.com>
>> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   hw/tpm/tpm_ppi.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
>> index 362edcc5c9..f243d9d0f6 100644
>> --- a/hw/tpm/tpm_ppi.c
>> +++ b/hw/tpm/tpm_ppi.c
>> @@ -30,11 +30,14 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
>>           guest_phys_blocks_init(&guest_phys_blocks);
>>           guest_phys_blocks_append(&guest_phys_blocks);
>>           QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
>> +            hwaddr mr_offs = (uint8_t *)memory_region_get_ram_ptr(block->mr) -
>> +                             block->host_addr;
> 
> Didn't look closely previous - should it be reversed instead?
> 
>    block->host_addr - memory_region_get_ram_ptr(block->mr)

Of course it should :(

Thanks! :)

-- 
Thanks,

David / dhildenb


