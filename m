Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F954535D2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:31:59 +0100 (CET)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0R9-0002wF-M7
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:31:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mn0P0-0001Rm-64
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:29:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mn0Ox-0004Iv-V0
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637076579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaQqHG4/jga1XO3GfECxH0/laMbbGhPQ9AIJYdWkGvk=;
 b=cIp2+l8auFY+92cEqhA3Db3xxSxmljMR9lBUjLapmoFPxKpiQfsyVodpDDV2Coc0H7tEaM
 TP2l1vGor9XKR3626WBhc4DwQuf6t6yHgOME9EFeyp/hUsxsbt/fOjB8YS1UoYwAPRJmpP
 DrrfvTD4rc7hmpTd0dqkc7HavRodTY0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-ffap91VQOC2GJAS5EYdMHg-1; Tue, 16 Nov 2021 10:29:37 -0500
X-MC-Unique: ffap91VQOC2GJAS5EYdMHg-1
Received: by mail-qk1-f198.google.com with SMTP id
 bq9-20020a05620a468900b004681cdb3483so8866912qkb.23
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VaQqHG4/jga1XO3GfECxH0/laMbbGhPQ9AIJYdWkGvk=;
 b=LuCrNtKyDPWhphImqFmsMRRDC2EDGJCub/EZQ+Id/dUdngo5mNbs3MB9351Rox6Zoc
 TmEJ/nzGlvEur25jK/vOsWRnXtFegFRAofbe+gF3Spbw6MepsC2074HUgqfYbgTBqpk5
 ibyYa37KKoF67Gf14oYfOWYdGutdNnk2QAgmmiWo9g0KvNZx+hPU2WQL/0cykJ/uQsgI
 JYa4rUPE9F8mMla3Beuhe/qWBS04XncrtoNxDWHbGDQB0Y67yRgDGBBVu7Q3fLUvqLrS
 olXnObFbTOMx4i6wBXKt8u6tZED4gWUyk/egb+a2uiR51v7kwJD4VCpq4jkWt4mPg8LA
 Y41g==
X-Gm-Message-State: AOAM532M7SkgnDWfVbImCDAhYI6tYd8iWK2mzj3ltWQF3pnjwLY6lHoW
 NO+ELOTHIhYDjwGR/AK88sqpPzrdCg2QXKU5ZhHSA7dao3cPJZPLiuFgr5YMSQZV0KUin4Im3+w
 UF4oz0PKc/0V3hj0=
X-Received: by 2002:a37:a353:: with SMTP id m80mr6964592qke.7.1637076576595;
 Tue, 16 Nov 2021 07:29:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwITglvPi2d6ptA7qlv7UsEsQHhpmbjP5wd37vrspPDXa7c4jDqjxj4mcPzI9zJn+gnj3xYZA==
X-Received: by 2002:a37:a353:: with SMTP id m80mr6964563qke.7.1637076576339;
 Tue, 16 Nov 2021 07:29:36 -0800 (PST)
Received: from [192.168.1.234] (pool-71-175-3-221.phlapa.fios.verizon.net.
 [71.175.3.221])
 by smtp.gmail.com with ESMTPSA id t15sm9279843qta.45.2021.11.16.07.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 07:29:35 -0800 (PST)
Message-ID: <26204690-493f-67a8-1791-c9c9d38c0240@redhat.com>
Date: Tue, 16 Nov 2021 10:29:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] sev: allow capabilities to check for SEV-ES support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211115193804.294529-1-tfanelli@redhat.com>
 <YZN3OECfHBXd55M5@redhat.com>
From: Tyler Fanelli <tfanelli@redhat.com>
In-Reply-To: <YZN3OECfHBXd55M5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=tfanelli@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kvm@vger.kernel.org, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 4:17 AM, Daniel P. Berrangé wrote:
> On Mon, Nov 15, 2021 at 02:38:04PM -0500, Tyler Fanelli wrote:
>> Probe for SEV-ES and SEV-SNP capabilities to distinguish between Rome,
>> Naples, and Milan processors. Use the CPUID function to probe if a
>> processor is capable of running SEV-ES or SEV-SNP, rather than if it
>> actually is running SEV-ES or SEV-SNP.
>>
>> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
>> ---
>>   qapi/misc-target.json | 11 +++++++++--
>>   target/i386/sev.c     |  6 ++++--
>>   2 files changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>> index 5aa2b95b7d..c3e9bce12b 100644
>> --- a/qapi/misc-target.json
>> +++ b/qapi/misc-target.json
>> @@ -182,13 +182,19 @@
>>   # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
>>   #                     enabled
>>   #
>> +# @es: SEV-ES capability of the machine.
>> +#
>> +# @snp: SEV-SNP capability of the machine.
>> +#
>>   # Since: 2.12
>>   ##
>>   { 'struct': 'SevCapability',
>>     'data': { 'pdh': 'str',
>>               'cert-chain': 'str',
>>               'cbitpos': 'int',
>> -            'reduced-phys-bits': 'int'},
>> +            'reduced-phys-bits': 'int',
>> +            'es': 'bool',
>> +            'snp': 'bool'},
>>     'if': 'TARGET_I386' }
>>   
>>   ##
>> @@ -205,7 +211,8 @@
>>   #
>>   # -> { "execute": "query-sev-capabilities" }
>>   # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
>> -#                  "cbitpos": 47, "reduced-phys-bits": 5}}
>> +#                  "cbitpos": 47, "reduced-phys-bits": 5
>> +#                  "es": false, "snp": false}}
> We've previously had patches posted to support SNP in QEMU
>
>    https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04761.html
>
> and this included an update to query-sev for reporting info
> about the VM instance.
>
> Your patch is updating query-sev-capabilities, which is a
> counterpart for detecting host capabilities separate from
> a guest instance.

Yes, that's because with this patch, I'm more interested in determining 
which AMD processor is running on a host, and less if ES or SNP is 
actually running on a guest instance or not.

>
> None the less I wonder if the same design questions from
> query-sev apply. ie do we need to have the ability to
> report any SNP specific information fields, if so we need
> to use a discriminated union of structs, not just bool
> flags.
>
> More generally I'm some what wary of adding this to
> query-sev-capabilities at all, unless it is part of the
> main SEV-SNP series.
>
> Also what's the intended usage for the mgmt app from just
> having these boolean fields ? Are they other more explicit
> feature flags we should be reporting, instead of what are
> essentially SEV generation codenames.

If by "mgmt app" you're referring to sevctl, in order to determine which 
certificate chain to use (Naples vs Rome vs Milan ARK/ASK) we must query 
which processor we are running on. Although sevctl has a feature which 
can do this already, we cannot guarantee that sevctl is running on the 
same host that a VM is running on, so we must query this capability from 
QEMU. My logic was determining the processor would have been the following:

!es && !snp --> Naples

es && !snp --> Rome

es && snp --> Milan

>
>
> Regards,
> Daniel

Tyler.

-- 
Tyler Fanelli (tfanelli)


