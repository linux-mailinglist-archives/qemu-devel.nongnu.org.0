Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A863696E10
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:43:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS1DJ-0003pG-Di; Tue, 14 Feb 2023 14:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS1D3-0003am-JJ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:43:27 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS1D1-0004aY-P7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:43:25 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 52D0C6106C;
 Tue, 14 Feb 2023 22:43:19 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:7] (unknown
 [2a02:6b8:b081:6407::1:7])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FhpWk20RZW21-l5KHBZCB; Tue, 14 Feb 2023 22:43:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676403798; bh=YqFV0yg862S+pAI8H0ly5k06Mtmh+HEeDzdI6G7JCmc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=1IbK7fMIQf8ymqNI3Hn2FROWx9GCq9ozqaVAzAGJoGEOEOirIw+i08xKKuyk3bT36
 9AectGnb05b2aV2N5wDuoy5RaQqvT1PyRa1eMFAq9AA0mmwi7idDtHrBfl+PCCQOgq
 UeXRhqaOLPoQ0U1WqDm0uzpQMq/xUIqiQ6zee8Ss=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <dcc35ff7-c435-6ba6-7071-fe6dfb0a0731@yandex-team.ru>
Date: Tue, 14 Feb 2023 21:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 13/16] pci: introduce pci_find_the_only_child()
Content-Language: en-US, ru-RU
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, den-plotnikov@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-14-vsementsov@yandex-team.ru>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230213140103.1518173-14-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/02/2023 16:01, Vladimir Sementsov-Ogievskiy wrote:
> To be used in further patch to identify the device hot-plugged into
> pcie-root-port.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>   include/hw/pci/pci.h |  1 +
>   hw/pci/pci.c         | 33 +++++++++++++++++++++++++++++++++
>   2 files changed, 34 insertions(+)
>
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d5a40cd058..b6c9c44527 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -341,6 +341,7 @@ void pci_for_each_device_under_bus_reverse(PCIBus *bus,
>   void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>                                     pci_bus_fn end, void *parent_state);
>   PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
> +PCIDevice *pci_find_the_only_child(PCIBus *bus, int bus_num, Error **errp);
>   
>   /* Use this wrapper when specific scan order is not required. */
>   static inline
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 208c16f450..34fd1fb5b8 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1771,6 +1771,39 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
>       }
>   }
>   
> +typedef struct TheOnlyChild {
> +    PCIDevice *dev;
> +    int count;
> +} TheOnlyChild;
> +
> +static void the_only_child_fn(PCIBus *bus, PCIDevice *dev, void *opaque)
> +{
> +    TheOnlyChild *s = opaque;
> +
> +    s->dev = dev;
> +    s->count++;
> +}
> +
> +PCIDevice *pci_find_the_only_child(PCIBus *bus, int bus_num, Error **errp)
> +{
> +    TheOnlyChild res = {0};
> +
> +    pci_for_each_device(bus, bus_num, the_only_child_fn, &res);
> +
> +    if (!res.dev) {
> +        assert(res.count == 0);
> +        error_setg(errp, "No child devices found");
> +        return NULL;
> +    }
> +
> +    if (res.count > 1) {
> +        error_setg(errp, "Several child devices found");
> +        return NULL;
> +    }
> +
> +    return res.dev;
> +}
> +
>   const pci_class_desc *get_class_desc(int class)
>   {
>       const pci_class_desc *desc;

