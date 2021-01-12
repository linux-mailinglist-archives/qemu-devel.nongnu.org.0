Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94392F3B57
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 21:03:03 +0100 (CET)
Received: from localhost ([::1]:39478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzPsc-0008CE-Nq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 15:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPqF-00074B-0n; Tue, 12 Jan 2021 15:00:35 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:58465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPqB-0002Nt-6s; Tue, 12 Jan 2021 15:00:34 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MnaTt-1kFrkm43uf-00jaYy; Tue, 12 Jan 2021 21:00:22 +0100
Subject: Re: [PATCH v3 2/2] misc/mos6522: Use timer_free() in the finalize
 function to avoid memleak
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210112112705.380534-1-ganqixin@huawei.com>
 <20210112112705.380534-3-ganqixin@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a9adb770-064f-b3fd-e728-4f0c9fb8a795@vivier.eu>
Date: Tue, 12 Jan 2021 21:00:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112112705.380534-3-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dN2bowF4V/aG+mfpOXQvwYno00tUsXS9rXnJHrZ76B2drsCOeya
 IYDqvtaIEd+QJSFrt+wCnpcz49BByLeYn3lDW6a8rP/BK6zBvdqEQBe3Pt4B03inJZY4uXA
 Eiz6QymXiMOL3KlQ4UsaZnNOtVXBwd7P76aUTd+Rk0dr4e6KHTxiQfQdVge+pPXdZKTsku3
 eBHlv5KejOnzuNeVMkr0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UMaM0vYLM44=:8nx0QsCUb8ADpRjA3k9SgS
 MtpL3ULDJN4N+PyUQk9Ugw+68Vvw0azU+lIBUKh2+Lcjcz1i9i4Wr1hwZUU3c/7ICu23DLyiP
 3b+e0mMf1nZ0tCYM/sWlbgQkmY5iLPDearCqvBpCT0hwOGnoYaOIKORmNIq1Xch8kgpfCk+PX
 nmNvD7/D6hFgLPdb71X4vIpNTv/FHEOuocuGyga3YU8Gbx2NUwblcaIFNU3lnArOYwogJ/+oz
 ivfi1NT7Hs9Y8wRNz5VZsVM+d7n9qTJReuL5mCKN/6F7DaGBEqKNxUnCRY+U4MUpSNGdg+4pY
 QM26faKsGSalWfyqGHYBZNPTrUJwAvvgjIlKgyapx88cNYXkC5+KJUUZ2ORnqrN8ApSZ1UqIh
 wbF08GPNl65gjO0q7DuRSaG1o6zut4noQZzJP5omal+gV5EAVtvRE4TqcVxix2l93MbjTExwc
 +3lBFvmHSQ==
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/01/2021 à 12:27, Gan Qixin a écrit :
> When running device-introspect-test, a memory leak occurred in the mos6522_init
> function, this patch use timer_free() in the finalize function to fix it.
> 
> ASAN shows memory leak stack:
> 
> Direct leak of 96 byte(s) in 2 object(s) allocated from:
>     #0 0xfffd5fe9e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
>     #1 0xfffd5f7b6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaae50303d0c in timer_new_full qemu/include/qemu/timer.h:523
>     #3 0xaaae50303d0c in timer_new qemu/include/qemu/timer.h:544
>     #4 0xaaae50303d0c in timer_new_ns qemu/include/qemu/timer.h:562
>     #5 0xaaae50303d0c in mos6522_init qemu/hw/misc/mos6522.c:490
>     #6 0xaaae50b77d70 in object_init_with_type qemu/qom/object.c:371
>     #7 0xaaae50b7ae84 in object_initialize_with_type qemu/qom/object.c:515
>     #8 0xaaae50b7b0f8 in object_new_with_type qemu/qom/object.c:729
>     #9 0xaaae50bb6d58 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
>     #10 0xaaae50d7e1dc in qmp_marshal_device_list_properties qemu/qapi/qapi-commands-qdev.c:59
>     #11 0xaaae50dc87a0 in do_qmp_dispatch_bh qemu/qapi/qmp-dispatch.c:110
>     #12 0xaaae50d931a0 in aio_bh_call qemu/util/async.c:136
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/misc/mos6522.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index ac4cd1d58e..1c57332b40 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -490,6 +490,14 @@ static void mos6522_init(Object *obj)
>      s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
>  }
>  
> +static void mos6522_finalize(Object *obj)
> +{
> +    MOS6522State *s = MOS6522(obj);
> +
> +    timer_free(s->timers[0].timer);
> +    timer_free(s->timers[1].timer);
> +}
> +
>  static Property mos6522_properties[] = {
>      DEFINE_PROP_UINT64("frequency", MOS6522State, frequency, 0),
>      DEFINE_PROP_END_OF_LIST()
> @@ -519,6 +527,7 @@ static const TypeInfo mos6522_type_info = {
>      .parent = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(MOS6522State),
>      .instance_init = mos6522_init,
> +    .instance_finalize = mos6522_finalize,
>      .abstract = true,
>      .class_size = sizeof(MOS6522DeviceClass),
>      .class_init = mos6522_class_init,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


