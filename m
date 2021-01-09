Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206DE2EFC08
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 01:13:24 +0100 (CET)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky1sg-0004fs-My
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 19:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ky1rK-00047J-PJ; Fri, 08 Jan 2021 19:11:58 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:41757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ky1rI-0005Gh-SH; Fri, 08 Jan 2021 19:11:58 -0500
Received: by mail-il1-x12b.google.com with SMTP id w17so12040370ilj.8;
 Fri, 08 Jan 2021 16:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uLXhjsR5BI1TnfvPTYdnNPxu+nbAbAiM0JrazhpBWkU=;
 b=hU71YRiV0aEgvJ4Ca+lGQvob1LNVFQk9bEBszFbt51wClWLjTUR7lNDkjzwY5uK4As
 MFGohNo0srPctXXNdQo5XmwIZ6trt0uQR18YcJ0t+wOB+UeykGmjWOtPT1JgUg6cB86k
 77J4vJFXfg56+TJdFmbAaERk4VtbX8REEzbE6znnnbAUgrfrdrBNZ68kg3GAyiFbRNTB
 0Bht5AL8AZlfl4I6+QVlCCBRPSh5kobqzoXpk236g24M53M2GBR5AOSB3PO78Tu1B5/0
 h3tiCkAJyWcrsJLANicAX0p6NtavpGB9LuYwtAuzIh8u30Z9QK6hMIk672v/ufCk5AWH
 0PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uLXhjsR5BI1TnfvPTYdnNPxu+nbAbAiM0JrazhpBWkU=;
 b=IljO/x5gN08p7TizB9vDWX1pnkpnJ0TsPfhlI7beKPj855k9L8D2NNu1ZGe7sU3IQS
 el7VMA4qpB6/So4FxXlxRI2cHu8PNmJwjkuQzb41KzPeU3Orjc28NE8IgTxYlxd5qgor
 qk6cTgTtymfpjXRF5Vmp/je/3eiKnuU8cE8cRS4gRF6cImidrQh/WqWMsuuKeL8aDrFg
 DxgaZubawnYbbqirpmGhRk7lL7pInGBmncbOBOS3pv6/kPDyseIZtws5JJ2EtWEhrfBi
 qenTHkDLRZkk3fhAIi7tCQMx2qYhjz42B1+/5QijpiIZ0LPkXX17MM3W/H5cA6Cr6VId
 mrDQ==
X-Gm-Message-State: AOAM5326BYq4k8m8EncqSZtkp2yN3r8o6i0BDCvG+bufTQnGSd592Zey
 b/tIpMdJn9LMaj4niSGztrNUhm9Vk7I=
X-Google-Smtp-Source: ABdhPJwimPj3vi0zodcXUgOc0gUw1xXgi1BwBV24B8bXCWuF8vcrmIRm+fCRg6DqaZ0IBbMN79YJWQ==
X-Received: by 2002:a05:6e02:13b3:: with SMTP id
 h19mr3909087ilo.187.1610151114544; 
 Fri, 08 Jan 2021 16:11:54 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:e12e:158d:880c:57b0:bfdd?
 ([2804:431:c7c7:e12e:158d:880c:57b0:bfdd])
 by smtp.gmail.com with ESMTPSA id b12sm8229201ilc.21.2021.01.08.16.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 16:11:53 -0800 (PST)
Subject: Re: [PATCH] spapr: Improve handling of memory unplug with old guests
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <161012708715.801107.11418801796987916516.stgit@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <cafbb53c-e21e-229b-6fbd-a8c0dd8455cf@gmail.com>
Date: Fri, 8 Jan 2021 21:11:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161012708715.801107.11418801796987916516.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=danielhb413@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.241,
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/8/21 2:31 PM, Greg Kurz wrote:
> Since commit 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
> trying to unplug memory from a guest that doesn't support it (eg. rhel6)
> no longer generates an error like it used to. Instead, it leaves the
> memory around : only a subsequent reboot or manual use of drmgr within
> the guest can complete the hot-unplug sequence. A flag was added to
> SpaprMachineClass so that this new behavior only applies to the default
> machine type.
> 
> We can do better. CAS processes all pending hot-unplug requests. This
> means that we don't really care about what the guest supports if
> the hot-unplug request happens before CAS.
> 
> All guests that we care for, even old ones, set enough bits in OV5
> that lead to a non-empty bitmap in spapr->ov5_cas. Use that as a
> heuristic to decide if CAS has already occured or not.
> 
> Always accept unplug requests that happen before CAS since CAS will
> process them. Restore the previous behavior of rejecting them after
> CAS when we know that the guest doesn't support memory hot-unplug.
> 
> This behavior is suitable for all machine types : this allows to
> drop the pre_6_0_memory_unplug flag.
> 
> Fixes: 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr.c              |   24 +++++++++++++-----------
>   hw/ppc/spapr_events.c       |    3 +--
>   hw/ppc/spapr_ovec.c         |    7 +++++++
>   include/hw/ppc/spapr.h      |    2 +-
>   include/hw/ppc/spapr_ovec.h |    1 +
>   5 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 2c403b574e37..6c47466fc2f1 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4048,6 +4048,18 @@ static void spapr_machine_device_unplug(HotplugHandler *hotplug_dev,
>       }
>   }
>   
> +bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr)
> +{
> +    return spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT) ||
> +        /*
> +         * CAS will process all pending unplug requests.
> +         *
> +         * HACK: a guest could theoretically have cleared all bits in OV5,
> +         * but none of the guests we care for do.
> +         */
> +        spapr_ovec_empty(spapr->ov5_cas);
> +}
> +
>   static void spapr_machine_device_unplug_request(HotplugHandler *hotplug_dev,
>                                                   DeviceState *dev, Error **errp)
>   {
> @@ -4056,16 +4068,9 @@ static void spapr_machine_device_unplug_request(HotplugHandler *hotplug_dev,
>       SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
>   
>       if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> -        if (!smc->pre_6_0_memory_unplug ||
> -            spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
> +        if (spapr_memory_hot_unplug_supported(sms)) {
>               spapr_memory_unplug_request(hotplug_dev, dev, errp);
>           } else {
> -            /* NOTE: this means there is a window after guest reset, prior to
> -             * CAS negotiation, where unplug requests will fail due to the
> -             * capability not being detected yet. This is a bit different than
> -             * the case with PCI unplug, where the events will be queued and
> -             * eventually handled by the guest after boot
> -             */
>               error_setg(errp, "Memory hot unplug not supported for this guest");
>           }
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
> @@ -4543,11 +4548,8 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
>    */
>   static void spapr_machine_5_2_class_options(MachineClass *mc)
>   {
> -    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
> -
>       spapr_machine_6_0_class_options(mc);
>       compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> -    smc->pre_6_0_memory_unplug = true;
>   }
>   
>   DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index 6aedd988b3d0..d51daedfa6e0 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -658,8 +658,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
>           /* we should not be using count_indexed value unless the guest
>            * supports dedicated hotplug event source
>            */
> -        g_assert(!SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_memory_unplug ||
> -                 spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
> +        g_assert(spapr_memory_hot_unplug_supported(spapr));
>           hp->drc_id.count_indexed.count =
>               cpu_to_be32(drc_id->count_indexed.count);
>           hp->drc_id.count_indexed.index =
> diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
> index dd003f1763fd..b2567caa5cf4 100644
> --- a/hw/ppc/spapr_ovec.c
> +++ b/hw/ppc/spapr_ovec.c
> @@ -125,6 +125,13 @@ bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr)
>       return test_bit(bitnr, ov->bitmap) ? true : false;
>   }
>   
> +bool spapr_ovec_empty(SpaprOptionVector *ov)
> +{
> +    g_assert(ov);
> +
> +    return bitmap_empty(ov->bitmap, OV_MAXBITS);
> +}
> +
>   static void guest_byte_to_bitmap(uint8_t entry, unsigned long *bitmap,
>                                    long bitmap_offset)
>   {
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 1cc19575f548..3ad2ff713279 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -142,7 +142,6 @@ struct SpaprMachineClass {
>       hwaddr rma_limit;          /* clamp the RMA to this size */
>       bool pre_5_1_assoc_refpoints;
>       bool pre_5_2_numa_associativity;
> -    bool pre_6_0_memory_unplug;
>   
>       bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                             uint64_t *buid, hwaddr *pio,
> @@ -950,4 +949,5 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
>   
>   void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>   hwaddr spapr_get_rtas_addr(void);
> +bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
>   #endif /* HW_SPAPR_H */
> diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
> index d4dee9e06a01..48b716a060c2 100644
> --- a/include/hw/ppc/spapr_ovec.h
> +++ b/include/hw/ppc/spapr_ovec.h
> @@ -71,6 +71,7 @@ void spapr_ovec_cleanup(SpaprOptionVector *ov);
>   void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
>   void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
>   bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
> +bool spapr_ovec_empty(SpaprOptionVector *ov);
>   SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector);
>   int spapr_dt_ovec(void *fdt, int fdt_offset,
>                     SpaprOptionVector *ov, const char *name);
> 
> 
> 

