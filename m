Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D869F46B7DC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:46:36 +0100 (CET)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muX3T-0006ll-WD
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:46:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muX1R-00049S-JU; Tue, 07 Dec 2021 04:44:29 -0500
Received: from [2607:f8b0:4864:20::933] (port=42775
 helo=mail-ua1-x933.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muX1Q-0003m6-6K; Tue, 07 Dec 2021 04:44:29 -0500
Received: by mail-ua1-x933.google.com with SMTP id t13so25261856uad.9;
 Tue, 07 Dec 2021 01:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8y1QR8lSQU68tvs+aiOmil1o0xXXjvGXYembOR4Nduk=;
 b=gWXoWIE9NbCSlbYPJWUBm0EWtTAgAIgNl6IdtHY/5YvalZV6D0tiLZpqcv999xBCrW
 HVqi7AGxQMKcFMPXXysXwiS9gOUFFfzoJzBkRK3uN+jgNxnxJJr4cHOQ7oVzKKXylOxD
 NvMlMl3M6NgaL7zRm+OCG9AUyWSsWP01DX4IzWl6ir/cLrAHxtE23TjkcN0RIJtlC0AZ
 nI4rmpXMlPk/ANIIicw1WaL/OJyQplbhsxwoUynmvYisfO5/BiG9boKWVctdbLqiMDtG
 Xv6fyiBXg/j/KwflHh0Iz/he8Ea7QKOxkSaV3FTMwikDMzhmC97C1oXX+bGhgHfo9br7
 Vrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8y1QR8lSQU68tvs+aiOmil1o0xXXjvGXYembOR4Nduk=;
 b=vBn840nbT3QnIAgVmQEF6ZeAVju5FLkvMpvh6THkfNDCHOFUo+gLtHmRYBpqz/GHcZ
 NXOiU2teQahcqd0DHLi3zrkNw/MpIbe3DggoxeNXR/Py86A3lzQyefQeNjLJUj3mdhxG
 ndFPzF3N94zYSrk/Kh+MZC56fuYvg3mep0siWEnEq0ykYBPJ45bFkshOaw2iFOtjzlIa
 Mm4+3hL1cxW+PD114mhyep2hUAtfxSFjKMNBYuisHbjzzqiFRr4hKdgFH319iiXQJtlT
 4epsMhOxbg6/uAQIimSjUsFAc3MTG8D/bLCqxAnaAOApvJe9qd/F866IOGUMI+Ky+n7z
 pMwg==
X-Gm-Message-State: AOAM530jHb18H5vOMIWmiucu7jFnr83WIJAowN44Y3wv02uhP0Gx3i7r
 XUbX7iSF8K0jPrt38LpLB+9dIpy5MAk=
X-Google-Smtp-Source: ABdhPJzxz6XIKJ9HAMIXQYqo7sQ+fHc6fOU6kiUtCaHC44TjYcWe6y4Efh0ELMQbw0X7K8skL3azXA==
X-Received: by 2002:ab0:66cd:: with SMTP id d13mr48640244uaq.140.1638870266973; 
 Tue, 07 Dec 2021 01:44:26 -0800 (PST)
Received: from [192.168.10.222] ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id s27sm5813772vkl.24.2021.12.07.01.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 01:44:26 -0800 (PST)
Message-ID: <43ea68a2-27d4-5084-6cb0-b6a7a4cba784@gmail.com>
Date: Tue, 7 Dec 2021 06:44:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] ppc/pnv.c: fix "system-id" FDT when -uuid is set
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20211206130253.630655-1-danielhb413@gmail.com>
 <Ya6mHauaGPv7HwYf@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Ya6mHauaGPv7HwYf@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::933
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.44,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/6/21 21:09, David Gibson wrote:
> On Mon, Dec 06, 2021 at 10:02:53AM -0300, Daniel Henrique Barboza wrote:
>> Setting -uuid in the pnv machine does not work:
>>
>> ./qemu-system-ppc64 -machine powernv8,accel=tcg  -uuid 7ff61ca1-a4a0-4bc1-944c-abd114a35e80
>> qemu-system-ppc64: error creating device tree: (fdt_property_string(fdt, "system-id", buf)): FDT_ERR_BADSTATE
>>
>> This happens because we're using "fdt_property_string" to retrieve a
>> "system-id" attribute that does not exist, instead of using
>> fdt_setprop_string() to create a "system-id" attribute with the uuid
>> provided via command line.
> 
> Fix is correct but this description isn't really accurate.
> fdt_property_string() is a "sequential write" function, only used when
> you're building a new DT up from scratch, which is an entirely
> different mode from read/write access to an existing tree.  Using when
> the tree is in read-write state will cause an immediate BADSTATE
> error; whether the property exists already or not is irrelevant.
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Thanks for the explanation. I'll send a v3 fixing the commit msg.


Daniel

> 
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>
>> changes from v1:
>> - fixed typo in commit title
>>
>>
>>   hw/ppc/pnv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 32ab8071a4..9e532caa9f 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -552,7 +552,7 @@ static void *pnv_dt_create(MachineState *machine)
>>       buf =  qemu_uuid_unparse_strdup(&qemu_uuid);
>>       _FDT((fdt_setprop_string(fdt, 0, "vm,uuid", buf)));
>>       if (qemu_uuid_set) {
>> -        _FDT((fdt_property_string(fdt, "system-id", buf)));
>> +        _FDT((fdt_setprop_string(fdt, 0, "system-id", buf)));
>>       }
>>       g_free(buf);
>>   
> 

