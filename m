Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D95320053
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 22:33:10 +0100 (CET)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDOf-0001cL-7M
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 16:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lDDNS-0000zS-1g; Fri, 19 Feb 2021 16:31:54 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:34703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lDDNP-00011a-Ve; Fri, 19 Feb 2021 16:31:53 -0500
Received: by mail-qt1-x831.google.com with SMTP id c1so5039305qtc.1;
 Fri, 19 Feb 2021 13:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LfmGvOZWbzJbfpPnBOiuqjkrl9ZnCrg+ORba6NQIfhE=;
 b=RZXOKzUiMOxu8hN0Anb/5A1+Y0qsMyT5cYW+q/vYj5S0m9SwahWAp3w1jBFFlj835a
 UI6PAac0XC8ty8DuGpxOb1LkxRcUqiKtaoxXVHIEaWcG4ZWAqRK+eWKhMoqcUQSvS7Zj
 hV195KLlWy5KHKqLmmgKEwlXZWGRp9D+1eO+EuBZzLwbEMIekj6rJ2i4TXtr38HXnw/U
 GDC1AxBQiYdrjH7oagCHtNBKyS3LYqM6LM+qsuWNzpFJppiHB+aGImoHUsOJYs5vw3tO
 6QU3oxLQRVCPZteqbgsATE6PmrFYJUhpZTtSpHzGn5o4Ocsjdi0bDbbQSQnBX81J0S+m
 ES9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LfmGvOZWbzJbfpPnBOiuqjkrl9ZnCrg+ORba6NQIfhE=;
 b=d07gPGgtAYk99Pws6Sm4jSyVxO4Xa+8QJKMPtV0iNOXTwJBfrt1eVOeYNw9AsutI5s
 V2vFpnl+xkS5gzPMj2lLQZQb9O0ym97ZDzcYLAvggrACk6aSYoFQfVb9NBMiNRJ5RmvI
 EjR7pEi27UxuvblhwtuGWKamAVnpp6nqt5FX2kmkkJ78hisz5ypZZnfa+Thj7YIrcbQD
 uCf4Vi9AYIgYDKr+OTT8SkknqJhlvwbQPjCuPiAzbXv/BJ772BmI2RqVHqw8+rmR36rG
 8BnE15fiyVvBwZ4SCIg831wuI61Me0oma+e/8y2znVdjyVEu0csVddnneuSS6azf+drv
 dAuw==
X-Gm-Message-State: AOAM533VITrfHMHiOlfh2+OV+vekEXvLywXUaW2D8EcuPgBk242MWcAl
 K4/keksdE2f7dkvy/FL39gk=
X-Google-Smtp-Source: ABdhPJxH0BUSrqC6NdigALM9dmpzLA7QTr6szNUsgGvol44jkJoYoi1wHPlbMuKtC+ydWoHXxpTnSw==
X-Received: by 2002:a05:622a:2c4:: with SMTP id
 a4mr10993541qtx.201.1613770310312; 
 Fri, 19 Feb 2021 13:31:50 -0800 (PST)
Received: from [192.168.15.40] (201-26-97-119.dsl.telesp.net.br.
 [201.26.97.119])
 by smtp.gmail.com with ESMTPSA id 16sm6022369qtz.17.2021.02.19.13.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 13:31:50 -0800 (PST)
Subject: Re: [PATCH v3 7/7] spapr_drc.c: use DRC reconfiguration to cleanup
 DIMM unplug state
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-8-danielhb413@gmail.com>
 <YCyAAe4dJzpsgQ0x@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <5026c1ed-ebbc-99fc-ac7e-146fe6c9d32b@gmail.com>
Date: Fri, 19 Feb 2021 18:31:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCyAAe4dJzpsgQ0x@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x831.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/16/21 11:31 PM, David Gibson wrote:
> On Thu, Feb 11, 2021 at 07:52:46PM -0300, Daniel Henrique Barboza wrote:
>> Handling errors in memory hotunplug in the pSeries machine is more complex
>> than any other device type, because there are all the complications that other
>> devices has, and more.

[...]

>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index ecce8abf14..4bcded4a1a 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -3575,6 +3575,36 @@ static SpaprDimmState *spapr_recover_pending_dimm_state(SpaprMachineState *ms,
>>       return spapr_pending_dimm_unplugs_add(ms, avail_lmbs, dimm);
>>   }
>>   
>> +void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
>> +                                           PCDIMMDevice *dimm)
>> +{
>> +    SpaprDimmState *ds = spapr_pending_dimm_unplugs_find(spapr, dimm);
>> +    SpaprDrc *drc;
>> +    uint32_t nr_lmbs;
>> +    uint64_t size, addr_start, addr;
>> +    int i;
>> +
>> +    if (ds) {
>> +        spapr_pending_dimm_unplugs_remove(spapr, ds);
>> +    }
> 
> Hrm... how would !ds arise?  Could this just be an assert?

!ds would appear if we do not assert g_assert(drc->dev) down there, where you
suggested down below that a malicious/buggy code would trigger it, for example.
With that assert in place then this less likely to occcur.

I guess what I can do here is:

- remove the g_assert(drc->dev) from down below, since it's more related to the
logic of this function;

- here, check if drc->dev is NULL. Return doing nothing if that's the case (all the
function relies on drc->dev being valid);

- if drc->dev is not NULL, then we can g_assert(ds) and proceed with the rest of
the function

This way we become a little more tolerant on drc->dev being NULL, but if drc->dev
is valid we will expect a unplug dimm state to always exist and assert it.


Thanks,


DHB

> 
>> +
>> +    size = memory_device_get_region_size(MEMORY_DEVICE(dimm), &error_abort);
>> +    nr_lmbs = size / SPAPR_MEMORY_BLOCK_SIZE;
>> +
>> +    addr_start = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
>> +                                          &error_abort);
>> +
>> +    addr = addr_start;
>> +    for (i = 0; i < nr_lmbs; i++) {
>> +        drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
>> +                              addr / SPAPR_MEMORY_BLOCK_SIZE);
>> +        g_assert(drc);
>> +
>> +        drc->unplug_requested = false;
>> +        addr += SPAPR_MEMORY_BLOCK_SIZE;
>> +    }
>> +}
>> +
>>   /* Callback to be called during DRC release. */
>>   void spapr_lmb_release(DeviceState *dev)
>>   {
>> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
>> index c143bfb6d3..eae941233a 100644
>> --- a/hw/ppc/spapr_drc.c
>> +++ b/hw/ppc/spapr_drc.c
>> @@ -1230,6 +1230,20 @@ static void rtas_ibm_configure_connector(PowerPCCPU *cpu,
>>   
>>       drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
>>   
>> +    /*
>> +     * This indicates that the kernel is reconfiguring a LMB due to
>> +     * a failed hotunplug. Clear the pending unplug state for the whole
>> +     * DIMM.
>> +     */
>> +    if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB &&
>> +        drc->unplug_requested) {
>> +
>> +        /* This really shouldn't happen in this point, but ... */
>> +        g_assert(drc->dev);
> 
> I'm a little worried that a buggy or malicious guest could trigger
> this assert.
> 
>> +
>> +        spapr_clear_pending_dimm_unplug_state(spapr, PC_DIMM(drc->dev));
>> +    }
>> +
>>       if (!drc->fdt) {
>>           void *fdt;
>>           int fdt_size;
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index ccbeeca1de..5bcc8f3bb8 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -847,6 +847,8 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
>>   int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **errp);
>>   void spapr_clear_pending_events(SpaprMachineState *spapr);
>>   void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
>> +void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
>> +                                           PCDIMMDevice *dimm);
>>   int spapr_max_server_number(SpaprMachineState *spapr);
>>   void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>>                         uint64_t pte0, uint64_t pte1);
> 

