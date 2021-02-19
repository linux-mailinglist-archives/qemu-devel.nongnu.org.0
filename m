Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A011331FFA7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 21:06:15 +0100 (CET)
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDC2Y-0004IH-5h
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 15:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lDC0t-0003MD-C9; Fri, 19 Feb 2021 15:04:31 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lDC0r-0004A1-61; Fri, 19 Feb 2021 15:04:31 -0500
Received: by mail-qt1-x834.google.com with SMTP id z6so4287457qts.0;
 Fri, 19 Feb 2021 12:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H+dWS7PSceCVId6Gi/abmmF+hmRVDOZUoT1+oc6g2JY=;
 b=LzD0amr7WQBciFzUbIAGBQr/CIJDZyov5DMgyRAIkQ5AAVVIg8agrAvz25epO2p1RU
 0WnyMJTqb+WuHahcYCKZ9+ap3DP4MglPsVZiznNU1RIr8+wV8sLMtMtRW1UQpdH9HEJP
 QGNouquiQ85t3cd5cMAqErtgDSAhOZttlpIN3fgZLEfqIxzX/xmg+fKu6bPt45kx+9th
 FnvTaCldxSTwm34OAzHezEyZTa7mUDgcdr83PF2HqCOypyXSzUqqnijGQB5h0sr/2m0U
 oTTFoySpOH56h8OmdycoaQeWKANZIK7qIHm/Knl7ZfWH9GIB/klNofT/WXbYOemVxysB
 yf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H+dWS7PSceCVId6Gi/abmmF+hmRVDOZUoT1+oc6g2JY=;
 b=r/Bya7zqrGQdVO857rhw9aUq98DLUTcFrtyiHI0UUOhFgwRE7MmfgFrEfzUVVCOPva
 +mZ1kvjGKaiV9sWsBG147Id7Re/ds5CGQStxTiQHKlWR+vrsFAhOSqfoVViRRohl7Iq9
 z59sZNED+FcEYVBVFcrdb+K5d9qx9Np0O3FamrG7MsQqOEBcBZIchsaN6u7Mt1JlrZmX
 oD5O0h05OUOuhksq037oVzDupHLel1EygcrLvhdcAalL7dINVpthWVOi/yjV/4c47Izn
 owK8dHH+IIN+dcrf9Y29v/lBauTcmAeLDtLMJibZSeVD29CMybNmgE5CNNGYJwuB80QE
 gOdA==
X-Gm-Message-State: AOAM531TH/4utQ5Ot5RdeVmPqcXjRAQBSwUegdsWeP99xh1U7uWPWdOP
 HDqZKiT/CNUb5hkFJaWaLPJd/7jOY/c=
X-Google-Smtp-Source: ABdhPJzkIHp4TE/xvy9Pjt8JCCOazxeLC4KoMaLXJGumZ0dcY++fNKffQVJMSGB5fWy4QbnXkwu0LA==
X-Received: by 2002:ac8:44aa:: with SMTP id a10mr5905184qto.48.1613765067200; 
 Fri, 19 Feb 2021 12:04:27 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:a50d:bdb3:4a9d:cdde:b53f?
 ([2804:431:c7c6:a50d:bdb3:4a9d:cdde:b53f])
 by smtp.gmail.com with ESMTPSA id b8sm5928785qte.29.2021.02.19.12.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 12:04:26 -0800 (PST)
Subject: Re: [PATCH v3 7/7] spapr_drc.c: use DRC reconfiguration to cleanup
 DIMM unplug state
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-8-danielhb413@gmail.com>
 <YCyAAe4dJzpsgQ0x@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <4c6d20f5-4a49-dd0e-8a3a-449e2d61f542@gmail.com>
Date: Fri, 19 Feb 2021 17:04:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCyAAe4dJzpsgQ0x@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
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
>>
>> For instance, determining a timeout for a DIMM hotunplug must consider if it's a
>> Hash-MMU or a Radix-MMU guest, because Hash guests takes longer to hotunplug DIMMs.
>> The size of the DIMM is also a factor, given that longer DIMMs naturally takes
>> longer to be hotunplugged from the kernel. And there's also the guest memory usage to
>> be considered: if there's a process that is consuming memory that would be lost by
>> the DIMM unplug, the kernel will postpone the unplug process until the process
>> finishes, and then initiate the regular hotunplug process. The first two
>> considerations are manageable, but the last one is a deal breaker.
>>
>> There is no sane way for the pSeries machine to determine the memory load in the guest
>> when attempting a DIMM hotunplug - and even if there was a way, the guest can start
>> using all the RAM in the middle of the unplug process and invalidate our previous
>> assumptions - and in result we can't even begin to calculate a timeout for the
>> operation. This means that we can't implement a viable timeout mechanism for memory
>> unplug in pSeries.
>>
>> Going back to why we would consider an unplug timeout, the reason is that we can't
>> know if the kernel is giving up the unplug. Turns out that, sometimes, we can.
>> Consider a failed memory hotunplug attempt where the kernel will error out with
>> the following message:
>>
>> 'pseries-hotplug-mem: Memory indexed-count-remove failed, adding any removed LMBs'
>>
>> This happens when there is a LMB that the kernel gave up in removing, and the LMBs
>> marked for removal of the same DIMM are now being added back. This process happens
> 
> We need to be a little careful about terminology here.  From the
> guest's point of view, there's no such thing as a DIMM, only LMBs.
> What the guest is doing here is essentially rejecting a single "index
> + number" DRC unplug request, which corresponds to one DIMM on the
> qemu side.

I'll reword this paragraph to avoid using "DIMM" in the context of the guest
kernel.

> 
>> in the pseries kernel in [1], dlpar_memory_remove_by_ic() into dlpar_add_lmb(), and
>> after that update_lmb_associativity_index(). In this function, the kernel is configuring
>> the LMB DRC connector again. Note that this is a valid usage in LOPAR, as stated in
>> section "ibm,configure-connector RTAS Call":
>>
>> 'A subsequent sequence of calls to ibm,configure-connector with the same entry from
>> the “ibm,drc-indexes” or “ibm,drc-info” property will restart the configuration of
>> devices which were not completely configured.'
>>
>> We can use this kernel behavior in our favor. If a DRC connector reconfiguration
>> for a LMB that we marked as unplug pending happens, this indicates that the kernel
>> changed its mind about the unplug and is reasserting that it will keep using the
>> DIMM. In this case, it's safe to assume that the whole DIMM unplug was cancelled.
>>
>> This patch hops into rtas_ibm_configure_connector() and, in the scenario described
>> above, clear the unplug state for the DIMM device. This will not solve all the
>> problems we still have with memory unplug, but it will cover this case where the
>> kernel reconfigures LMBs after a failed unplug. We are a bit more resilient,
>> without using an unreliable timeout, and we didn't make the remaining error cases
>> any worse.
> 
> I wonder if we could use this as a beginning of a hotplug failure
> reporting mechanism.  As noted, this is explicitly allowed by PAPR and
> I think in general it makes sense that a configure-connector would
> re-assert that the guest is using the resource and we can't unplug it.
> 

I think it's worth looking into it. The kernel already does that in case of hotunplug
failure of LMBs (at least in this particular case), so it's a matter of evaluating
how hard it is to do the same for e.g. CPUs.


> Could we extend guests to do an indicative configure-connector on any
> unplug it knows it can't complete?  Or if configure-connector is too
> disruptive could we use an (extra) H_SET_INDICATOR to "UNISOLATE"
> state? If I'm reading right, that should be both permitted and a no-op
> for existing PAPR implementations, so it should be a pretty safe way
> to add that indication.

A quick look in LOPAR shows that set_indicator can be used to report
hotplug failures (which is a surprise to me, I wasn't aware of it):

-----
(Table 13.7, R1-13.5.3.4-4.)

For all DR options: If this is a DR operation that involves the user insert-
ing a DR entity, then if the firmware can determine that the inserted entity
would cause a system disturbance, then the set-indicator RTAS call must
not unisolate the entity and must return an error status which is unique to the
particular error.
-----

The wording 'would cause a system disturbance' seems generic on purpose, giving
the firmware/platform the prerrogative to refuse a hotplug for any given
reason.

I also read that there is no rule against using set_indicator with "unisolate" to
an already unisolated resource. It would be a no-op.

I don't think we would find fierce opposition if we propose an addendum such as:

"For all DR options: If this is a DR operation that involves the user removing
ing a DR entity, then if the partition operational system can determine that
removing the entity would cause a system disturbance, then the set-indicator RTAS
call can be used with the 'unisolate' value to inform the platform that the entity
can not be removed at that time."

This would be enough to accomplish what we're aiming for using set_indicator and
unisolate. Then we have 2 options to signal a failed unplug - configure-connector
and unisolating the device. The guest can use whichever is easier or makes more
sense.



Thanks,


DHB


> 
>>
>> [1] arch/powerpc/platforms/pseries/hotplug-memory.c
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c         | 30 ++++++++++++++++++++++++++++++
>>   hw/ppc/spapr_drc.c     | 14 ++++++++++++++
>>   include/hw/ppc/spapr.h |  2 ++
>>   3 files changed, 46 insertions(+)
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

