Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573834EBF9D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 13:11:52 +0200 (CEST)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZWEx-00072C-FO
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 07:11:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZWBA-0005Gb-Sz
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:07:57 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:34832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZWB8-0004H4-HF
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=uefKeygn6ysRGuOH2Nj0+ME1VKRZ6iKiPtDgZeqHnHQ=; 
 t=1648638474;x=1649243874; 
 b=tVhR6hy2O5aDubJ5XMsj77ZfuNAY9T656steTmsPwNfNGfL0HHYdWWsWKy+6m/eSAZTtYMKcph2dl9aab2arevToiWki7pUJa1yWW7yxZ2mAzsFSPZ4VeS5dbU3tuSxbhlCu5MC/IQn0bKNnU3n5KWhHGZspxjbCM9s6bJeVndslPyeSDCGpmRO1UaOZIKwezeBzedLm+WDYqA5XkW55DVgoBt8w+lXOSrHPswiaCiabvx1X+P67PH4Yd8SWXlsB0t31Jb5z6Pz4r/Ll6z5F4Cac/Bb1BY7+pEEBI9Mi57N2JLSTjnSQdYblPLxC2GzCZelIeyWQTVVAP0pujjKiUA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZWB4-0003H8-CR; Wed, 30 Mar 2022 14:07:51 +0300
Message-ID: <a1941c15-b4bf-84e9-0dab-ace7027ef972@mail.ru>
Date: Wed, 30 Mar 2022 14:07:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/9] pci: add null-pointer check
Content-Language: en-US
To: Maxim Davydov <maxim.davydov@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 xiaoguangrong.eric@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-3-maxim.davydov@openvz.org>
In-Reply-To: <20220328211539.90170-3-maxim.davydov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB610DDC424B80B0933A06ACF3B00C77020E00894C459B0CD1B99727EE2EAF2724F00AA579A5C06995162323F0B855BC539269E0F5A34A076C57
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C4A7E4C0BFE8628DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637829D9538242026C38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89078C37E626D8F5223A38960C953D7E16F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE75C266B62551496319FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FCB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B47272755C61AA17BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC1CC939A714B191CC3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006373DE9EC65D651F9EBD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F06BBCC99EAFD4D72262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A523CF193A726A40F4248BF20BFBAED8B4A618F7C4F5A56443D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342833AC5E8E9ACF1CF63328C8DAF9BCB40444BA62DB0CFD0BFF70A4B596F42D378F2BAF3175AEA5951D7E09C32AA3244C675F28E6788DAD007F67E5AE8BA1BD3FA95CA90A1D8AC5654A5FEE14E26358B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+X8nDm6fQAnng==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE759B182662B2457A168916D3C04B6C14C23A332AFFEF0CABE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

29.03.2022 00:15, Maxim Davydov wrote:
> Call pci_bus_get_w64_range can fail with the segmentation fault. For
> example, this can happen during attempt to get pci-hole64-end immediately
> after initialization.

So, immediately after initialization, h->bus is NULL?

The significant bit is, is the value which we calculate without h->bus is correct or not? That should be covered by commit message.

> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>   hw/pci-host/i440fx.c | 17 +++++++++++------
>   hw/pci-host/q35.c    | 17 +++++++++++------
>   2 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index e08716142b..71a114e551 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -158,10 +158,12 @@ static uint64_t i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
>       PCIHostState *h = PCI_HOST_BRIDGE(obj);
>       I440FXState *s = I440FX_PCI_HOST_BRIDGE(obj);
>       Range w64;
> -    uint64_t value;
> +    uint64_t value = 0;
>   
> -    pci_bus_get_w64_range(h->bus, &w64);
> -    value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> +    if (h->bus) {
> +        pci_bus_get_w64_range(h->bus, &w64);
> +        value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> +    }
>       if (!value && s->pci_hole64_fix) {
>           value = pc_pci_hole64_start();
>       }
> @@ -191,10 +193,13 @@ static void i440fx_pcihost_get_pci_hole64_end(Object *obj, Visitor *v,
>       I440FXState *s = I440FX_PCI_HOST_BRIDGE(obj);
>       uint64_t hole64_start = i440fx_pcihost_get_pci_hole64_start_value(obj);
>       Range w64;
> -    uint64_t value, hole64_end;
> +    uint64_t value = 0;
> +    uint64_t hole64_end;
>   
> -    pci_bus_get_w64_range(h->bus, &w64);
> -    value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> +    if (h->bus) {
> +        pci_bus_get_w64_range(h->bus, &w64);
> +        value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> +    }
>       hole64_end = ROUND_UP(hole64_start + s->pci_hole64_size, 1ULL << 30);
>       if (s->pci_hole64_fix && value < hole64_end) {
>           value = hole64_end;
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index ab5a47aff5..d679fd85ef 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -124,10 +124,12 @@ static uint64_t q35_host_get_pci_hole64_start_value(Object *obj)
>       PCIHostState *h = PCI_HOST_BRIDGE(obj);
>       Q35PCIHost *s = Q35_HOST_DEVICE(obj);
>       Range w64;
> -    uint64_t value;
> +    uint64_t value = 0;
>   
> -    pci_bus_get_w64_range(h->bus, &w64);
> -    value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> +    if (h->bus) {
> +        pci_bus_get_w64_range(h->bus, &w64);
> +        value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> +    }
>       if (!value && s->pci_hole64_fix) {
>           value = pc_pci_hole64_start();
>       }
> @@ -157,10 +159,13 @@ static void q35_host_get_pci_hole64_end(Object *obj, Visitor *v,
>       Q35PCIHost *s = Q35_HOST_DEVICE(obj);
>       uint64_t hole64_start = q35_host_get_pci_hole64_start_value(obj);
>       Range w64;
> -    uint64_t value, hole64_end;
> +    uint64_t value = 0;
> +    uint64_t hole64_end;
>   
> -    pci_bus_get_w64_range(h->bus, &w64);
> -    value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> +    if (h->bus) {
> +        pci_bus_get_w64_range(h->bus, &w64);
> +        value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> +    }
>       hole64_end = ROUND_UP(hole64_start + s->mch.pci_hole64_size, 1ULL << 30);
>       if (s->pci_hole64_fix && value < hole64_end) {
>           value = hole64_end;


-- 
Best regards,
Vladimir

