Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F4545382C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:59:32 +0100 (CET)
Received: from localhost ([::1]:49224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1nv-0007wa-Bd
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mn1mk-0006pQ-BP
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mn1mi-0000fv-KH
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637081895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hd7T/jg4QlM/dTl0BZIXMVWjWWVvd+3iW1T4KK1VXw=;
 b=Lvn/eOC/n05D+2tuW4r60agirvG0Cs+cr04c8L3RAruSYZ19/zA7uqjmgjyl3K4Vdzfx0m
 jrUvFiQck1K3TBsoLj2eFaPXXvOBIbWtVUOFF+lZfgd71oYUeOOufmwcXBZx9oBbL3t6rj
 9pVs/k8HtYPx62sUwq30WznZJvjpiys=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-iheKRhm1PGuqIYR4ijsaeg-1; Tue, 16 Nov 2021 11:58:13 -0500
X-MC-Unique: iheKRhm1PGuqIYR4ijsaeg-1
Received: by mail-qv1-f72.google.com with SMTP id
 jn10-20020ad45dea000000b003bd74c93df4so19707326qvb.15
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/hd7T/jg4QlM/dTl0BZIXMVWjWWVvd+3iW1T4KK1VXw=;
 b=HtAhKwNmHcX4Nd/76CT+iSqejXDa+icNMP9ucchy9VmIkKIBfLOh5Arwv1tOQu5vEu
 1vMJNa6oXZixXAzH+W5gf4wcVCCuHk3BXqNLGWKtnlmY3+GbIiUYuApk0DSjvFGpHh+Z
 nr2f8WQdWBF5E/Wfe86UoMMERXIqUDGJelueP/WAFYdFHKDIoz3wQBRTfE+iaIkEtGNk
 ZPtE6D1jb9dFVhMakzfFZo9Ap0QIWXBBrbBvB1URVxxuRZxeRSdIhsRmI1wwqdY7Odhz
 jJ2Og7XoV/kD1lSMRPJjY/7hPzIQMb6xs3WoKe3AaQ84Pcy9oTXbjYbK9Zn/0GSAYsTE
 aslA==
X-Gm-Message-State: AOAM530b+FjIKV4Y1BKB4GGev6/uIHoZ2hXjPfOGMFf3JGhjjz2vZJ8y
 EbDa3W7EPduqb9pJhdDOKOmKrGlff4WNOrDEx50n4XNpvqvOsAqtl7m9X3b1gQzt+HDGegq6+qd
 Mt2f1le1DDFdNRd8=
X-Received: by 2002:a0c:fb47:: with SMTP id b7mr46465238qvq.12.1637081893409; 
 Tue, 16 Nov 2021 08:58:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzueEXYTzxPyrkueqraDyRt6Tx3Us13LhsaiiPNJ+PDqKYtXEqpzduI5iGP/XakbjNymNsUyg==
X-Received: by 2002:a0c:fb47:: with SMTP id b7mr46465208qvq.12.1637081893200; 
 Tue, 16 Nov 2021 08:58:13 -0800 (PST)
Received: from [192.168.1.234] (pool-71-175-3-221.phlapa.fios.verizon.net.
 [71.175.3.221])
 by smtp.gmail.com with ESMTPSA id t11sm8645198qkm.96.2021.11.16.08.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 08:58:13 -0800 (PST)
Message-ID: <02e72302-8cb3-9268-32bd-57e9423f1590@redhat.com>
Date: Tue, 16 Nov 2021 11:58:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] sev: allow capabilities to check for SEV-ES support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211115193804.294529-1-tfanelli@redhat.com>
 <YZN3OECfHBXd55M5@redhat.com>
 <26204690-493f-67a8-1791-c9c9d38c0240@redhat.com>
 <YZPT3ojgzdmH3lkq@redhat.com>
From: Tyler Fanelli <tfanelli@redhat.com>
In-Reply-To: <YZPT3ojgzdmH3lkq@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=tfanelli@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kvm@vger.kernel.org, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 10:53 AM, Daniel P. Berrangé wrote:
> On Tue, Nov 16, 2021 at 10:29:35AM -0500, Tyler Fanelli wrote:
>> On 11/16/21 4:17 AM, Daniel P. Berrangé wrote:
>>> On Mon, Nov 15, 2021 at 02:38:04PM -0500, Tyler Fanelli wrote:
>>>> Probe for SEV-ES and SEV-SNP capabilities to distinguish between Rome,
>>>> Naples, and Milan processors. Use the CPUID function to probe if a
>>>> processor is capable of running SEV-ES or SEV-SNP, rather than if it
>>>> actually is running SEV-ES or SEV-SNP.
>>>>
>>>> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
>>>> ---
>>>>    qapi/misc-target.json | 11 +++++++++--
>>>>    target/i386/sev.c     |  6 ++++--
>>>>    2 files changed, 13 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>>>> index 5aa2b95b7d..c3e9bce12b 100644
>>>> --- a/qapi/misc-target.json
>>>> +++ b/qapi/misc-target.json
>>>> @@ -182,13 +182,19 @@
>>>>    # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
>>>>    #                     enabled
>>>>    #
>>>> +# @es: SEV-ES capability of the machine.
>>>> +#
>>>> +# @snp: SEV-SNP capability of the machine.
>>>> +#
>>>>    # Since: 2.12
>>>>    ##
>>>>    { 'struct': 'SevCapability',
>>>>      'data': { 'pdh': 'str',
>>>>                'cert-chain': 'str',
>>>>                'cbitpos': 'int',
>>>> -            'reduced-phys-bits': 'int'},
>>>> +            'reduced-phys-bits': 'int',
>>>> +            'es': 'bool',
>>>> +            'snp': 'bool'},
>>>>      'if': 'TARGET_I386' }
>>>>    ##
>>>> @@ -205,7 +211,8 @@
>>>>    #
>>>>    # -> { "execute": "query-sev-capabilities" }
>>>>    # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
>>>> -#                  "cbitpos": 47, "reduced-phys-bits": 5}}
>>>> +#                  "cbitpos": 47, "reduced-phys-bits": 5
>>>> +#                  "es": false, "snp": false}}
>>> We've previously had patches posted to support SNP in QEMU
>>>
>>>     https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04761.html
>>>
>>> and this included an update to query-sev for reporting info
>>> about the VM instance.
>>>
>>> Your patch is updating query-sev-capabilities, which is a
>>> counterpart for detecting host capabilities separate from
>>> a guest instance.
>> Yes, that's because with this patch, I'm more interested in determining
>> which AMD processor is running on a host, and less if ES or SNP is actually
>> running on a guest instance or not.
>>> None the less I wonder if the same design questions from
>>> query-sev apply. ie do we need to have the ability to
>>> report any SNP specific information fields, if so we need
>>> to use a discriminated union of structs, not just bool
>>> flags.
>>>
>>> More generally I'm some what wary of adding this to
>>> query-sev-capabilities at all, unless it is part of the
>>> main SEV-SNP series.
>>>
>>> Also what's the intended usage for the mgmt app from just
>>> having these boolean fields ? Are they other more explicit
>>> feature flags we should be reporting, instead of what are
>>> essentially SEV generation codenames.
>> If by "mgmt app" you're referring to sevctl, in order to determine which
>> certificate chain to use (Naples vs Rome vs Milan ARK/ASK) we must query
>> which processor we are running on. Although sevctl has a feature which can
>> do this already, we cannot guarantee that sevctl is running on the same host
>> that a VM is running on, so we must query this capability from QEMU. My
>> logic was determining the processor would have been the following:
> I'm not really talking about a specific, rather any tool which wants
> to deal with SEV and QEMU, whether libvirt or an app using libvirt,
> or something else using QEMU directly.

Ah, my mistake.

> Where does the actual cert chain payload come from ? Is that something
> the app has to acquire out of band, or can the full cert chain be
> acquired from the hardware itself ?

The cert chain (or the ARK/ASK specifically) comes from AMD's KDS, yet 
sevctl is able to cache the values, and has them on-hand when needed. 
This patch would tell sevctl *which* of the cert chains to use (Naples 
vs Rome vs Milan chain). If need be, I could just focus on Naples and 
Rome processors for now and bring support for SNP (Milan processors) 
later on when it is more mature.

>> !es && !snp --> Naples
>>
>> es && !snp --> Rome
>>
>> es && snp --> Milan
> This approach isn't future proof if subsequent generations introduce
> new certs. It feels like we should be explicitly reporting something
> about the certs rather than relying on every app to re-implement tihs
> logic.

Alright, like an encoding of which processor generation the host is 
running on?

>
> Regards,
> Daniel

Tyler.

-- 
Tyler Fanelli (tfanelli)


