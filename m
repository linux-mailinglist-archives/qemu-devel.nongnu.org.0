Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C9A4021B3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:55:00 +0200 (CEST)
Received: from localhost ([::1]:37016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPO7-0001cf-S3
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPK0-00058D-4n; Mon, 06 Sep 2021 20:50:44 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:41682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPJx-0005Lz-1j; Mon, 06 Sep 2021 20:50:42 -0400
Received: by mail-qk1-x72f.google.com with SMTP id bk29so8450253qkb.8;
 Mon, 06 Sep 2021 17:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Iwfg+X/ENwiYrsJH+ILsTGvpgwkxfOoqmlBWtrBy2lQ=;
 b=HoB8oOe35UurDPRaON3LThEFykBj8hPycOSQP3cYgMP0CWPlnwFkNCFa89WbxGf1QN
 1/dQ9eQqLv3Mqbz73wTiuDKTlVxbccZcC0t9KQ7HkQlFCxF8JqqgfQ1CO3X6Gi5JwFQh
 xjh2hkCVlT8ZW36UZ5MKf8dS/rsNzf8Aj6dHdc8WMifbpIAOBNPbm9Cv1MENin1p4Z3B
 PGUFyf3gmospxMMufdUu3CK7NP0aQoQv2yZDae76Eqn5acTzb16MZ05VtczYqPuASC5N
 jGmcXllRmhcnOtgKEAIZIOHLIuy5eKFbfND27jX4FpD/yL5XRp6nGq8ZogHf1tTxEVh/
 bRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Iwfg+X/ENwiYrsJH+ILsTGvpgwkxfOoqmlBWtrBy2lQ=;
 b=dSYp0qW4jxqJsTsT3k/siIfWZWleD/7EoGv7sIAzeKMrHs0MMMiEMRl3KFvY6d84IT
 0XgzgnzBelacQ0mGNTiUlC71tK6C7q+5I+BOjFZHVMoXK8f13GgkQidY7fzddVrHj81U
 zTb9vFih8P3LvMmtBXwpYaa9h+zD2GDRr1dzUTx+3wmI30ttkhrMgd2DIQ55Tu1d5/FE
 TXdxNm146QH6C3CAK2/FP+0c6sZWfsJUWZAFJ2yyzb1dTGcVRK/K3AC9hSAmKEpEvz6S
 GFTnL6t7JFgKII63Cxc3n8+3k/qIHpWY4NxC5MOuFlbX4rlqtUIdruS1GAvgRD+UVm4E
 GJaA==
X-Gm-Message-State: AOAM531/igQPeS2PgrxRxft1eKZX40srUXENe4cLQowoKLfXfNJ2r+sa
 HiJGRcoRcHio34TJcIvZLaM=
X-Google-Smtp-Source: ABdhPJyp14mxFnkqB4rP9GRXGSM9KXfQUK9X3D3x1ebdbhiNu7/ZEJrH/sT1Bife+8ubbhVHAKADxw==
X-Received: by 2002:a37:2d04:: with SMTP id t4mr13347633qkh.160.1630975839288; 
 Mon, 06 Sep 2021 17:50:39 -0700 (PDT)
Received: from [192.168.10.222] ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id r140sm7763625qke.15.2021.09.06.17.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 17:50:39 -0700 (PDT)
Subject: Re: [PATCH v4 2/5] spapr_numa.c: split FORM1 code into helpers
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210827092455.125411-1-danielhb413@gmail.com>
 <20210827092455.125411-3-danielhb413@gmail.com> <YTaykCjgeonaGS2x@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <e7436956-6bf6-a15d-b137-bdc1b09361a8@gmail.com>
Date: Mon, 6 Sep 2021 21:50:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTaykCjgeonaGS2x@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.332,
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



On 9/6/21 9:30 PM, David Gibson wrote:
> On Fri, Aug 27, 2021 at 06:24:52AM -0300, Daniel Henrique Barboza wrote:
>> The upcoming FORM2 NUMA affinity will support asymmetric NUMA topologies
>> and doesn't need be concerned with all the legacy support for older
>> pseries FORM1 guests.
>>
>> We're also not going to calculate associativity domains based on numa
>> distance (via spapr_numa_define_associativity_domains) since the
>> distances will be written directly into new DT properties.
>>
>> Let's split FORM1 code into its own functions to allow for easier
>> insertion of FORM2 logic later on.
>>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr_numa.c | 61 +++++++++++++++++++++++++++++----------------
>>   1 file changed, 39 insertions(+), 22 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>> index 779f18b994..04a86f9b5b 100644
>> --- a/hw/ppc/spapr_numa.c
>> +++ b/hw/ppc/spapr_numa.c
>> @@ -155,6 +155,32 @@ static void spapr_numa_define_associativity_domains(SpaprMachineState *spapr)
>>   
>>   }
>>   
>> +/*
>> + * Set NUMA machine state data based on FORM1 affinity semantics.
>> + */
>> +static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
>> +                                           MachineState *machine)
>> +{
>> +    bool using_legacy_numa = spapr_machine_using_legacy_numa(spapr);
>> +
>> +    /*
>> +     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
>> +     * 1 NUMA node) will not benefit from anything we're going to do
>> +     * after this point.
>> +     */
>> +    if (using_legacy_numa) {
>> +        return;
>> +    }
> 
> My only concern with this patch is that handling the
> "using_legacy_numa" case might logically belong outside the FORM1
> code.  I mean, I'm pretty sure using_legacy_numa implies FORM1 in
> practice, but conceptually it seems like a more fundamental question
> than the DT encoding of the NUMA information.

I'll carry on this suggestion for the next spin, v6, given that the v5 I sent
a few minutes ago is also verifying legacy numa in FORM1 code.


Thanks,


Daniel

> 
>> +
>> +    if (!spapr_numa_is_symmetrical(machine)) {
>> +        error_report("Asymmetrical NUMA topologies aren't supported "
>> +                     "in the pSeries machine");
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +    spapr_numa_define_associativity_domains(spapr);
>> +}
>> +
>>   void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>                                      MachineState *machine)
>>   {
>> @@ -210,22 +236,7 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>           spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>>       }
>>   
>> -    /*
>> -     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
>> -     * 1 NUMA node) will not benefit from anything we're going to do
>> -     * after this point.
>> -     */
>> -    if (using_legacy_numa) {
>> -        return;
>> -    }
>> -
>> -    if (!spapr_numa_is_symmetrical(machine)) {
>> -        error_report("Asymmetrical NUMA topologies aren't supported "
>> -                     "in the pSeries machine");
>> -        exit(EXIT_FAILURE);
>> -    }
>> -
>> -    spapr_numa_define_associativity_domains(spapr);
>> +    spapr_numa_FORM1_affinity_init(spapr, machine);
>>   }
>>   
>>   void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
>> @@ -302,12 +313,8 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
>>       return ret;
>>   }
>>   
>> -/*
>> - * Helper that writes ibm,associativity-reference-points and
>> - * max-associativity-domains in the RTAS pointed by @rtas
>> - * in the DT @fdt.
>> - */
>> -void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
>> +static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
>> +                                           void *fdt, int rtas)
>>   {
>>       MachineState *ms = MACHINE(spapr);
>>       SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
>> @@ -365,6 +372,16 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
>>                        maxdomains, sizeof(maxdomains)));
>>   }
>>   
>> +/*
>> + * Helper that writes ibm,associativity-reference-points and
>> + * max-associativity-domains in the RTAS pointed by @rtas
>> + * in the DT @fdt.
>> + */
>> +void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
>> +{
>> +    spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
>> +}
>> +
>>   static target_ulong h_home_node_associativity(PowerPCCPU *cpu,
>>                                                 SpaprMachineState *spapr,
>>                                                 target_ulong opcode,
> 

