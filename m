Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F656045B3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 14:47:54 +0200 (CEST)
Received: from localhost ([::1]:38722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8UD-0003Px-8S
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 08:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ol8NV-0007Ag-56
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ol8NS-0008TM-1d
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666183253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3SgYN8O9+OZDxqyxQNWhPZHj076i1Qx+UPFIDfEty0=;
 b=gxRHTDBprXUuxt94stt4RiR33YhwiFsC+Vx8ZXihmN8AvSFRxhYobULSPrwGUu44YZ7vCt
 LUkB08QAnrHYOYIp7u5pEEBfbzHRTxsv2/cHq1FoMa52QxEhREuzVO5npdi5Zgdp7q8vHW
 SFJ+45t2DzPBCNCG6Grche4uGvT4jBc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-dpEw9DHtNTCbuiOTAH1gVg-1; Wed, 19 Oct 2022 08:40:51 -0400
X-MC-Unique: dpEw9DHtNTCbuiOTAH1gVg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h17-20020adfaa91000000b0022e9f2245c8so5544985wrc.19
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 05:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s3SgYN8O9+OZDxqyxQNWhPZHj076i1Qx+UPFIDfEty0=;
 b=VQA52lO2gYph8A5WDWmnC5kXXGUuWNhfaPQIydCTVIRcTBdZnbsYSy11LKWFgL2L7x
 QubYolvI67xEt1bJBYGVu40O3Dg1euhnlGakeLCUuqx+pQQ3cTI8sOo4Cj9fH2a29MWL
 HL4LhVZYl9N69Pt4wGAwVtZ0Jk8bCiCnaq1Ao8vFvgX65b10eR/SwemGY0OtHSqpN7Cn
 MLnLxJl/cOlTpHV2jjiFAod9ozN2Mrguj642e/U4I5sslrfL6a3ORA+6RIGKo56X1blL
 CsoSqjBd0jylDlE976yCl5lNUptcvUTPrWPF67EfZsfZ5fQ84KduPbnFbzr7fnCWcS5V
 W4Bw==
X-Gm-Message-State: ACrzQf3noNH7U6E6QPc5vwyw36mjflNoJaDEIYZQQXIZPdXHoIFckKNZ
 4Jw6ThlVvzVAWiZW8Yf2Ha22DONQAVbGrQaO3UdOESlk0vO4rfm8eaFgW938mMKp8/MolW7R10O
 5aANwKe8W6SYJlww=
X-Received: by 2002:a05:600c:6008:b0:3c6:c3fa:c173 with SMTP id
 az8-20020a05600c600800b003c6c3fac173mr5858005wmb.190.1666183250671; 
 Wed, 19 Oct 2022 05:40:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Y6BqXQwUBwu3yjP8PEKmnnydbqx1gRNifDb/SaN34i238jnd6k8c0BjgDb+Lbfv3tqmewYw==
X-Received: by 2002:a05:600c:6008:b0:3c6:c3fa:c173 with SMTP id
 az8-20020a05600c600800b003c6c3fac173mr5857984wmb.190.1666183250345; 
 Wed, 19 Oct 2022 05:40:50 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:2c00:d4ac:d2c:4aee:dac1?
 (p200300cbc7072c00d4ac0d2c4aeedac1.dip0.t-ipconnect.de.
 [2003:cb:c707:2c00:d4ac:d2c:4aee:dac1])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a05600c2ed300b003b3365b38f9sm15675870wmn.10.2022.10.19.05.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 05:40:49 -0700 (PDT)
Message-ID: <3e9fc018-ee20-2f03-2371-e357cf400556@redhat.com>
Date: Wed, 19 Oct 2022 14:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RESEND PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221018152524.137598-1-jusual@redhat.com>
 <4c2ee3bc-18e0-bdd1-79e0-ee9a2c818d10@linaro.org>
 <20221018124847-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221018124847-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.10.22 18:49, Michael S. Tsirkin wrote:
> On Tue, Oct 18, 2022 at 06:17:55PM +0200, Philippe Mathieu-Daudé wrote:
>> On 18/10/22 17:25, Julia Suvorova wrote:
>>> In the ACPI specification [1], the 'unarmed' bit is set when a device
>>> cannot accept a persistent write. This means that when a memdev is
>>> read-only, the 'unarmed' flag must be turned on. The logic is correct,
>>> just changing the error message.
>>>
>>> [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
>>>
>>
>> Fixes: dbd730e859 ("nvdimm: check -object memory-backend-file, readonly=on
>> option")
>>
>> The documentation in 'docs/nvdimm.txt' is correct :)
>>
>>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>    hw/mem/nvdimm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
>>> index 7c7d777781..bfb76818c1 100644
>>> --- a/hw/mem/nvdimm.c
>>> +++ b/hw/mem/nvdimm.c
>>> @@ -149,7 +149,7 @@ static void nvdimm_prepare_memory_region(NVDIMMDevice *nvdimm, Error **errp)
>>>        if (!nvdimm->unarmed && memory_region_is_rom(mr)) {
>>>            HostMemoryBackend *hostmem = dimm->hostmem;
>>> -        error_setg(errp, "'unarmed' property must be off since memdev %s "
>>> +        error_setg(errp, "'unarmed' property must be on since memdev %s "
>>
>> If you ever respin please quote 'on' for readability.
> 
> 
> Yes make sense. Julia could you change this pls?

Acked-by: David Hildenbrand <david@redhat.com>

I can pick this up once resent. I'll most probably send a merge request 
by the end of next week.

-- 
Thanks,

David / dhildenb


