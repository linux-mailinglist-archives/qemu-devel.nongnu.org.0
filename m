Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEDC2F3B56
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 21:01:05 +0100 (CET)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzPqi-0006p9-Ax
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 15:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPp7-00064a-0k; Tue, 12 Jan 2021 14:59:25 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:33121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPp4-0001wr-II; Tue, 12 Jan 2021 14:59:24 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDeAZ-1kpkW81wwx-00AosQ; Tue, 12 Jan 2021 20:59:11 +0100
Subject: Re: [PATCH v3 1/2] pl031: Use timer_free() in the finalize function
 to avoid memleaks
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210112112705.380534-1-ganqixin@huawei.com>
 <20210112112705.380534-2-ganqixin@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ea972728-2e12-d7b9-a42f-a30ffd272fb0@vivier.eu>
Date: Tue, 12 Jan 2021 20:59:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112112705.380534-2-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LQI4y0UL+OvhBVJi3dW2k3DFi4sdJrY/lPqAeFcnbv3cfelpaGN
 jDZVevGJEPwZKGPphyHYGpBKH8xAXRxplRIwo1VLMUdOuKXXVlrxtkfBarAS0zM850OiEyj
 q4lYfsjRb1XU+42D8W40fN4h6XIEjdAn8t/RdnxODn27lxMTIdbtLZm3nmf131BWE95D7mS
 zF85aV66XGg1tmnuoZBog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4IFJaqSDITA=:MQ35FQ0jRi2UTtl79Dwlbd
 6ZuWRbvEGxZ/sCLrr5+WQPfw6cGLeK2LXcLQFxg617JH9NK7VFcqByRBt2qHQrN5rwCsTMoSG
 cwMfRXRDOgUGDxYmndlHU+pAIx8kh/CQDtWdJQfme+d4vEJlE3AJRhaCd9W6hf4mvv8bvjKxo
 hLP4il/5b3AzllHACq3s4hKTO5UA4WziYwUpQg/Xe9MBEmxglf+v6uc0mPBz1qCAgHZSdO8tu
 9AGx6oXWo3zpHeDNt1vfZ9o8jMNcupAUzLpXyORFfvS9JAF8b/E6vLAs8G3dY+OkNn6sBmHml
 kUyyBlMuJevqhOGP5KcRK2wL09PrBme6pc65o9z0NbFIEhnv28m4VjeLzHLATBlNNFoNbPBBJ
 CxqSYbC62MoXTjzIhQOqdEiE3iibfYPhkO2Ak7aiZPv0fAarQyHJI6DslsWvw4n+BWelfb+Zl
 YvOi5I3Twg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, david@gibson.dropbear.id.au,
 zhang.zhanghailiang@huawei.com, kuhn.chenqun@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/01/2021 à 12:27, Gan Qixin a écrit :
> When running device-introspect-test, a memory leak occurred in the pl031_init
> function, this patch use timer_free() in the finalize function to fix it.
> 
> ASAN shows memory leak stack:
> 
> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>     #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
>     #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaabf5621cfc in timer_new_full qemu/include/qemu/timer.h:523
>     #3 0xaaabf5621cfc in timer_new qemu/include/qemu/timer.h:544
>     #4 0xaaabf5621cfc in timer_new_ns qemu/include/qemu/timer.h:562
>     #5 0xaaabf5621cfc in pl031_init qemu/hw/rtc/pl031.c:194
>     #6 0xaaabf6339f6c in object_initialize_with_type qemu/qom/object.c:515
>     #7 0xaaabf633a1e0 in object_new_with_type qemu/qom/object.c:729
>     #8 0xaaabf6375e40 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
>     #9 0xaaabf5a95540 in qdev_device_help qemu/softmmu/qdev-monitor.c:283
>     #10 0xaaabf5a96940 in qmp_device_add qemu/softmmu/qdev-monitor.c:801
>     #11 0xaaabf5a96e70 in hmp_device_add qemu/softmmu/qdev-monitor.c:916
>     #12 0xaaabf5ac0a2c in handle_hmp_command qemu/monitor/hmp.c:1100
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/rtc/pl031.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
> index ae47f09635..2bbb2062ac 100644
> --- a/hw/rtc/pl031.c
> +++ b/hw/rtc/pl031.c
> @@ -194,6 +194,13 @@ static void pl031_init(Object *obj)
>      s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
>  }
>  
> +static void pl031_finalize(Object *obj)
> +{
> +    PL031State *s = PL031(obj);
> +
> +    timer_free(s->timer);
> +}
> +
>  static int pl031_pre_save(void *opaque)
>  {
>      PL031State *s = opaque;
> @@ -329,6 +336,7 @@ static const TypeInfo pl031_info = {
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(PL031State),
>      .instance_init = pl031_init,
> +    .instance_finalize = pl031_finalize,
>      .class_init    = pl031_class_init,
>  };
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


