Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCBB3E4C64
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 20:51:52 +0200 (CEST)
Received: from localhost ([::1]:48922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDANL-0001su-Pi
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 14:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDALn-0008Fz-LX; Mon, 09 Aug 2021 14:50:15 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDALl-0005VK-Tt; Mon, 09 Aug 2021 14:50:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso360856pjb.2; 
 Mon, 09 Aug 2021 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KUXshyFwJa7KxOlSqqruBz1wZO9jDA9whxeCMlGeJ1I=;
 b=KmoOSEpX7qA0ofuHSXH8YY1aY9ano3w1P/UgfHK9gzGwQ7yoWnDnbjGMymPTSoqo95
 3xpbFx2MBqHW1MYIqHd3G077M/0VDj2zuLsrOkVCIfv+dCP81EyP55NOi7A4I1ROb6XO
 qw5SgZUzrK20A7b/m3+5JjCI5NkX/jf+EnV9IVwa/4uzMQsBlDzM+ONgzvMSIpS1Fsfy
 p+B1JEptC6A0ZH3SC3s0lple6/hDZab+feM7VxboA3aPYHIwHcrhfSNRSeYEnwSOgEKn
 VKNyRpoYlsBzWNyugSClZedoNj/fO2iCvcXKdxdNYglm50TSIFr39CdmBPIX6+rN4A1q
 Yq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KUXshyFwJa7KxOlSqqruBz1wZO9jDA9whxeCMlGeJ1I=;
 b=hiOJsgqq90WaFhRw9MteAN14pj1TcCwbajxRcCVugKJD7kKzyynAWphxbs/Z/fKBNe
 gq7RaYM7ZZ9aS1u+T4TAbK/+QCZvPfGhwt7VE3iIAGK8D1Y0Ap796G/20k9iI+w0ieK5
 UUTW4V2df0TqtUaBsZ9rf/KsFDyKdWwBYbdpYVzVN+lJPhc+PtbrctE0N4UhUem/J9Xt
 s0vG6NkywVfi7O8y17o8pCfWxsy4siOunbD/pJwwQMdBDRQhJNczHXme2nDNrY49DWiT
 daB9MrAhEn+24N0jsCFZI67sPAQMgxd5VPrHKt+QbzvTb5ixn9fs0rlHKY6oN1RCRwXk
 xpJA==
X-Gm-Message-State: AOAM530/1vPsz3CHR20nA5CXc7/zBG9R/mVHmYQnDqsu2KsNy+xd+g/D
 ZA6FcmNiK4Svv87Y/PqKhp0=
X-Google-Smtp-Source: ABdhPJyHRwpfmzy9KlC8jfoCvRSRC0W+bvjw4R6+x7RHCCukMmjJhgiiUyM91rIX2gd11bk10JIWTw==
X-Received: by 2002:a17:903:4091:b029:12d:3161:11f8 with SMTP id
 z17-20020a1709034091b029012d316111f8mr3576015plc.39.1628535012244; 
 Mon, 09 Aug 2021 11:50:12 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id y13sm229586pjn.34.2021.08.09.11.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 11:50:11 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v6 1/7] hw/acpi/memory_hotplug.c: avoid sending
 MEM_UNPLUG_ERROR if dev->id is NULL
To: Markus Armbruster <armbru@redhat.com>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-2-danielhb413@gmail.com>
 <87h7g1cr3u.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <af62b763-f9d9-8796-00fd-4f35caa53610@gmail.com>
Date: Mon, 9 Aug 2021 15:50:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87h7g1cr3u.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/7/21 10:38 AM, Markus Armbruster wrote:
> I apologize for the not reviewing this promptly.
> 
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> qapi_event_send_mem_unplug_error() deals with @device being NULL by
>> replacing it with an empty string ("") when emitting the event. Aside
>> from the fact that this is a side effect that can be patched someday,
> 
> I guess by "side effect" you allude to the output visitor's misfeature
> to map null pointer to "".
> 
>> there's also the lack of utility that the event brings to listeners,
>> e.g.  "a memory unplug error happened somewhere".
> 
> True.
> 
>> We're better of not emitting the event if dev->id is NULL.
> 
> On a green field, yes.  But is it worth an incompatible change now?  I
> doubt it.
> 
>>                                                             Next patches
>> will introduce a new device unplug error event that is better suited to
>> deal with dev->id NULL scenarios. MEM_UNPLUG_ERROR will continue to be
>> emitted to avoid breaking existing APIs, but it'll be deprecated and
>> removed in the future.
>>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/acpi/memory_hotplug.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
>> index af37889423..e37acb0367 100644
>> --- a/hw/acpi/memory_hotplug.c
>> +++ b/hw/acpi/memory_hotplug.c
>> @@ -177,9 +177,14 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>>               /* call pc-dimm unplug cb */
>>               hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>>               if (local_err) {
>> +                const char *error_pretty = error_get_pretty(local_err);
>> +
>>                   trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
>> -                qapi_event_send_mem_unplug_error(dev->id,
>> -                                                 error_get_pretty(local_err));
>> +
>> +                if (dev->id) {
>> +                    qapi_event_send_mem_unplug_error(dev->id, error_pretty);
>> +                }
>> +
>>                   error_free(local_err);
>>                   break;
>>               }
> 
> Three options:
> 
> 1. Make the incompatible change.  Keep this patch.  Needs a release
>     note.
> 
> 2. Continue to rely on the output visitor's misfeature.  Drop this
>     patch.
> 
>     Relying on the misfeature is best avoided, at least in new code.
> 
> 3. Make the mapping explicit here, and avoid relying on the misfeature.
>     Something like the appended patch.

I like (3) more. If no one opposes I'll respin patches 1 and 2 with this
approach.


Daniel

> 
> I don't like 1.  I think the choice between 2. and 3. depends on how it
> fits with the remainder of this series.
> 
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index af37889423..89c411dd5c 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -178,7 +178,7 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>               hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>               if (local_err) {
>                   trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> -                qapi_event_send_mem_unplug_error(dev->id,
> +                qapi_event_send_mem_unplug_error(dev->id ?: "",
>                                                    error_get_pretty(local_err));
>                   error_free(local_err);
>                   break;
> 

