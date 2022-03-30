Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288484EBFC6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 13:29:14 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZWVk-0000IK-QP
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 07:29:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZWUG-0007zq-9D
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:27:40 -0400
Received: from smtp46.i.mail.ru ([94.100.177.106]:45394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZWUD-0005gp-C9
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=yPCjOdkfOlDDZv9J+pfFCZbSbQlPghUv5Qvx5Z6bQk4=; 
 t=1648639657;x=1649245057; 
 b=riRE2GCtNEc2FAFHraOavVvZHmBmEbhbppV2pblQktVQKxjWu1BLp3rdJrjDMMwPYu4CSfHa4j4E+iknPOn7/3Kn7JBoLVurqxmPLOz42fjwnI+4QZFH5lSqAOSAiVgjJ/ehGvAiW9ibrf9+ag9yMw1KXEERophikjjPUxqY88uFSI3FEB21qzhby77/t28wLRKvCWj3SSLyi/D3d9syrWEaUTcS++eTWr7kwCVmMDHgqvJOCblinQguQIfkVPvXmHMZkEKFyiBAX22xtK6uIhXIWRbACZSGerQOz0situjWqPZGw5/by/MHwJ+DBoabbUqYaVz0Utdk64WvhEsy/w==;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZWU6-0000KY-KI; Wed, 30 Mar 2022 14:27:31 +0300
Message-ID: <4cb6d834-48cf-3b9f-77b0-38cec020a3dc@mail.ru>
Date: Wed, 30 Mar 2022 14:27:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 3/9] mem: appropriate handling getting mem region
Content-Language: en-US
To: Maxim Davydov <maxim.davydov@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 xiaoguangrong.eric@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-4-maxim.davydov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220328211539.90170-4-maxim.davydov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp46.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB610DDC424B80B0933A06ACF3B00C77020E00894C459B0CD1B980D4F297A203A73FAF5AEF09EA5393DB691DD2F401EE62A71FD068786AFD4E7C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F2393C4755A27B53EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637040380BD28C1B15C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D846CFD64712E31E143B9687139C4B6E1B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE79E43BAB7848D9B939FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE652FD71AFB96DC7D28F6BDBBAB179F4ED8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE367F1C1C3ABB44F3A03F1AB874ED89028C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637522BF2A1F12CC7CFEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5E9DB8D229008304654EA62FE8EEA99DC95A705393E3E0CB4D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D348E5EF936B2E46EBA3BA3950EDB28A36209815F73FBBF8F1D54C30101CD3EB8774DC34E1C6E0B7FE41D7E09C32AA3244C7D77102BF5598CEEA756B1E31D77421781560E2432555DBB4A5FEE14E26358B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+XeOYDICMQD4Q==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE99EFF01A6A830E5B27FFD27FB196CB16B8DC3784BF3AAB26E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.106;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp46.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

29.03.2022 00:15, Maxim Davydov wrote:
> Attempt to get memory region if the device doesn't have hostmem may not be
> an error. This can be happen immediately after initialization (getting
> value without default one).
> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>   hw/i386/sgx-epc.c | 5 ++++-
>   hw/mem/nvdimm.c   | 6 ++++++
>   hw/mem/pc-dimm.c  | 5 +++++
>   3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> index d664829d35..1a4c8acdcc 100644
> --- a/hw/i386/sgx-epc.c
> +++ b/hw/i386/sgx-epc.c
> @@ -121,9 +121,12 @@ static MemoryRegion *sgx_epc_md_get_memory_region(MemoryDeviceState *md,
>   {
>       SGXEPCDevice *epc = SGX_EPC(md);
>       HostMemoryBackend *hostmem;
> +    DeviceState *dev = DEVICE(epc);
>   
>       if (!epc->hostmem) {
> -        error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property must be set");
> +        if (dev->realized) {
> +            error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property must be set");
> +        }
>           return NULL;
>       }

I can't judge, is it really and error or not.

But the way you change the logic is not correct, as you change the semantics:

Old semantics: on error return NULL and set errp, on success return non-NULL and not set errp

New semantics: on error return NULL and set errp, on success return anything (may be NULL) and not set errp.

Callers are not prepared to this. For example, look at memory_device_unplug:
it does

   mr = mdc->get_memory_region(md, &error_abort);

assume it returns NULL, which is not an error (so we don't crash on error_abort)

and then pass mr  to memory_region_del_subregion(), which in turn access mr->container, which will crash if mr is NULL.

Most probably the situation I describe is not possible, but I just want to illustrate the idea.

Moreover, in QEMU functions which has "Error **errp" argument and return pointer are recommended to return NULL on failure and nonNULL on success. In other words, return value of function with "Error **errp" argument should report success/failure information. And having NULL as possible success return value is not recommended, as it's ambiguous and leads to bugs (see big comment at start of include/qapi/error.h).

So, if it's really needed to change the semantics in such not-recommended way, you should check that all callers are OK with it and also describe new semantics in a comment near get_memory_region declaration. But better is deal with returned error as it is.. What is an exact problem you trying to solve with this commit?

>   
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 7c7d777781..61e77e5476 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -166,9 +166,15 @@ static MemoryRegion *nvdimm_md_get_memory_region(MemoryDeviceState *md,
>                                                    Error **errp)
>   {
>       NVDIMMDevice *nvdimm = NVDIMM(md);
> +    PCDIMMDevice *dimm = PC_DIMM(nvdimm);
>       Error *local_err = NULL;
>   
>       if (!nvdimm->nvdimm_mr) {
> +        /* Not error if we try get memory region after init */
> +        if (!dimm->hostmem) {
> +            return NULL;
> +        }
> +
>           nvdimm_prepare_memory_region(nvdimm, &local_err);
>           if (local_err) {
>               error_propagate(errp, local_err);
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index f27e1a11ba..6fd74de97f 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -240,6 +240,11 @@ static void pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
>   static MemoryRegion *pc_dimm_md_get_memory_region(MemoryDeviceState *md,
>                                                     Error **errp)
>   {
> +    PCDIMMDevice *dimm = PC_DIMM(md);
> +    /* Not error if we try get memory region after init */
> +    if (!dimm->hostmem) {
> +        return NULL;
> +    }
>       return pc_dimm_get_memory_region(PC_DIMM(md), errp);
>   }
>   


-- 
Best regards,
Vladimir

