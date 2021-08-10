Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5AF3E528D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 07:08:19 +0200 (CEST)
Received: from localhost ([::1]:43232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJzu-00085f-8e
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 01:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDJyq-0007Bv-LY
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDJyp-00029M-0r
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628572030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPVf99/M4WjhdLmwrCUIEoE5fhFqa+7nahIzQSRXhw4=;
 b=edIepmycTLbkv8WrpqkQozEG+YyBcuIPqb+F6SRCsDO36awO/as5zyf1rJ9ikqkshjYG40
 YqrV8p8MMoQNbsmI5z3d+qRmJpN05vwSL5l+BjsUQRXi2ZlYQm/UMAg9TAMzHCyeF8ki9V
 WLfLXPdxj/2moMZ+EdYABR4QqQ2kuOM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-D1-e3g5QPCOy34fxedAOaQ-1; Tue, 10 Aug 2021 01:07:08 -0400
X-MC-Unique: D1-e3g5QPCOy34fxedAOaQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o26-20020a05600c511ab0290252d0248251so727301wms.1
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 22:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VPVf99/M4WjhdLmwrCUIEoE5fhFqa+7nahIzQSRXhw4=;
 b=DLLRqcK6qo012d5CsuTjH/6XKHrElkiuA7YD+jzCgLkN5J+6QswzKyo/MaAJB5O8Tz
 +igN3x0PtE63DYqQX/tXWgRjPK+ccWwv4JqmIKhBfRIPNhPozmsZoAa++H/msuM7qGy6
 SmRsMsRUZkeEVwGSEigtMoG0no0Jhdpagljw6wjkjDfTfEnXhEFWaJe+wGDYc45IyvhX
 16ShHzFlUynApVbEYSAmUtH4xjBiOgDW7ZkedCwIms7W5bIgcZZVkAlWxgZ5lglrG5h2
 Q+KcQXi2WFTzSw5M1ujJZ0d8A43H0PbRNr7JvM5Jq1GK3FGeRl4JeEqaniNBIwERE6rv
 3dTw==
X-Gm-Message-State: AOAM533hwauokBCcMWrBfAD82CduKSfWxr/nqAAcRyJvAjvg/eXhgsDD
 z1XxR36ChUeJXu/FbQmKHkiSV8OMM1CO9GFppdIH1l3tjpZ8NWcmyQBZ1jSg7ebtPG7kczsn1eh
 jpwWHU/u81XxoVUY=
X-Received: by 2002:a5d:4583:: with SMTP id p3mr21079436wrq.398.1628572027593; 
 Mon, 09 Aug 2021 22:07:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynpWdoXDWZ6AuDbdrrxXcG+SSzCKD89NzGWwGzvIprSOIcKVQbIGa4KLfCCiCEiu1anPYQAw==
X-Received: by 2002:a5d:4583:: with SMTP id p3mr21079415wrq.398.1628572027351; 
 Mon, 09 Aug 2021 22:07:07 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w18sm23377453wrg.68.2021.08.09.22.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 22:07:07 -0700 (PDT)
Subject: Re: [PULL 24/30] spapr_pci: populate ibm,loc-code
To: David Gibson <david@gibson.dropbear.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1436284182-5063-1-git-send-email-agraf@suse.de>
 <1436284182-5063-25-git-send-email-agraf@suse.de>
 <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
 <YRIAr6HIW742LSZd@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f6c3e2ac-3b9f-0f9c-6cb9-c1fc95d2eabe@redhat.com>
Date: Tue, 10 Aug 2021 07:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRIAr6HIW742LSZd@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 6:29 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 10:57:00AM +0100, Peter Maydell wrote:
>> On Tue, 7 Jul 2015 at 16:49, Alexander Graf <agraf@suse.de> wrote:
>>>
>>> From: Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
>>>
>>> Each hardware instance has a platform unique location code.  The OF
>>> device tree that describes a part of a hardware entity must include
>>> the “ibm,loc-code” property with a value that represents the location
>>> code for that hardware entity.
>>>
>>> Populate ibm,loc-code.
>>
>> Ancient patch, but Coverity has just noticed a bug in it
>> which is still present in current QEMU (CID 1460454):
>>
>>> +static char *spapr_phb_vfio_get_loc_code(sPAPRPHBState *sphb,  PCIDevice *pdev)
>>> +{
>>> +    char *path = NULL, *buf = NULL, *host = NULL;
>>> +
>>> +    /* Get the PCI VFIO host id */
>>> +    host = object_property_get_str(OBJECT(pdev), "host", NULL);
>>> +    if (!host) {
>>> +        goto err_out;
>>> +    }
>>> +
>>> +    /* Construct the path of the file that will give us the DT location */
>>> +    path = g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
>>> +    g_free(host);
>>> +    if (!path || !g_file_get_contents(path, &buf, NULL, NULL)) {
>>> +        goto err_out;
>>> +    }
>>> +    g_free(path);
>>
>> Here we create a 'path' string, use it as the argument to
>> g_file_get_contents() and then free it (either here or in the err_out path)...
>>
>>> +
>>> +    /* Construct and read from host device tree the loc-code */
>>> +    path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
>>> +    g_free(buf);
>>> +    if (!path || !g_file_get_contents(path, &buf, NULL, NULL)) {
>>> +        goto err_out;
>>> +    }
>>> +    return buf;
>>
>> ...but here we forget to free it before returning in the success case.
>>
>>> +
>>> +err_out:
>>> +    g_free(path);
>>> +    return NULL;
>>> +}
>>
>> Cleanest fix would be to declare 'path' and 'host' as
>>    g_autofree char *path = NULL;
>>    g_autofree char *host = NULL;
>> and then you can remove all the manual g_free(path) and g_free(host) calls.
> 
> Thanks for the report.  I've committed the fix (I hope) below to ppc-for-6.1:
> 
> From 70ae61b510dc571c407b28c46498cae60e60ca66 Mon Sep 17 00:00:00 2001
> From: David Gibson <david@gibson.dropbear.id.au>
> Date: Tue, 10 Aug 2021 14:28:19 +1000
> Subject: [PATCH] spapr_pci: Fix leak in spapr_phb_vfio_get_loc_code() with
>  g_autofree
> 
> This uses g_autofree to simplify logic in spapr_phb_vfio_get_loc_code(),
> in the process fixing a leak in one of the paths.  I'm told this fixes
> Coverity error CID 1460454
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 16b0ea1d852 ("spapr_pci: populate ibm,loc-code")
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/ppc/spapr_pci.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7a725855f9..13d806f390 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -782,33 +782,28 @@ static AddressSpace *spapr_pci_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>  
>  static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDevice *pdev)
>  {
> -    char *path = NULL, *buf = NULL, *host = NULL;
> +    g_autofree char *path = NULL;
> +    g_autofree char *host = NULL;
> +    char *buf = NULL;
>  
>      /* Get the PCI VFIO host id */
>      host = object_property_get_str(OBJECT(pdev), "host", NULL);
>      if (!host) {
> -        goto err_out;
> +        return NULL;
>      }
>  
>      /* Construct the path of the file that will give us the DT location */
>      path = g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
> -    g_free(host);
>      if (!g_file_get_contents(path, &buf, NULL, NULL)) {
> -        goto err_out;
> +        return NULL;
>      }
> -    g_free(path);
>  
>      /* Construct and read from host device tree the loc-code */
>      path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
> -    g_free(buf);
>      if (!g_file_get_contents(path, &buf, NULL, NULL)) {
> -        goto err_out;
> +        return NULL;
>      }
>      return buf;
> -
> -err_out:
> -    g_free(path);
> -    return NULL;
>  }
>  
>  static char *spapr_phb_get_loc_code(SpaprPhbState *sphb, PCIDevice *pdev)
> 


