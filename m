Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA72F2EF2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:23:50 +0100 (CET)
Received: from localhost ([::1]:36138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIiD-0005fl-F3
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzIcC-0001zU-GL
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:17:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzIcB-0001RM-1o
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610453854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAUyZBsa04A6Am3+mCJMywqqLqXJ6wZLHseqHSSXZ3E=;
 b=drvioeNaBZn5U2YH/egnLm3YbNQ+PnBaDCW2UD2gLZ/PpX4pj53DBQ1h2m8zA3vYyGOO7M
 qsaVnckZlz3k+umnyZk6Y29hEPZSSS9fD2Nb2XZ7xlbidIMNSAJXUJ558svHgtgZ0wQjUL
 WmOlUaGxtj05YLmNr3THn/PyFNxIGVU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-wbcQR8cdOemWsFLDLFN4uA-1; Tue, 12 Jan 2021 07:17:30 -0500
X-MC-Unique: wbcQR8cdOemWsFLDLFN4uA-1
Received: by mail-wm1-f71.google.com with SMTP id s185so406073wme.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:17:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uAUyZBsa04A6Am3+mCJMywqqLqXJ6wZLHseqHSSXZ3E=;
 b=nTOLIA0UZt69E5jb3Ps3M84xje2KA2IJjjKkYqkN9RZ+gtP1pj2qd2NE96mWvEEbEt
 CiFf5kDwDRX+8Xc55Kn0Ol82guXm+IEVBZD2zj0Z6NSts89MoBwgn8reChg/INqlwC+U
 usMaz9m4oTJakbOiN5tthUTKS/oy853gVBwakKFSWKdMExE97FR+eduJppd+4td047Ks
 1zkxa6qCiOddvTfhXBHxlcfGKhu/yiunPqESmdrPD1cUhJaxJ2qsEw0QZHFmrLBbxhmp
 oB/drtEc3yXdfXQkWVzdztVvkOXjnJbbxn31DG73D2xTbOaKeMrxxLArxbAybzMKjMqn
 8Ktg==
X-Gm-Message-State: AOAM533y2e+OrC9s26TmAb23uZ0vzw2qTysn5MteZQtJv2PgywIc+i+M
 3ZT3K1Ec2XlrJsydNQj38Z6M+YgPQApSv12d5AlmyrdI4rnk07SqPJtWgF3j2tVN7TOaswMH5t+
 ngoBWssNKrLleWts=
X-Received: by 2002:a1c:5406:: with SMTP id i6mr3280974wmb.137.1610453849352; 
 Tue, 12 Jan 2021 04:17:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg7Q3nJIWPHm0tCAvuS7ietSfBuyDkJG3bdb54ee8Xc1Hjb6No8JsoJTLzj+aotnYPadyAyA==
X-Received: by 2002:a1c:5406:: with SMTP id i6mr3280945wmb.137.1610453849089; 
 Tue, 12 Jan 2021 04:17:29 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id y68sm4185801wmc.0.2021.01.12.04.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 04:17:28 -0800 (PST)
Subject: Re: [PATCH v3 2/2] misc/mos6522: Use timer_free() in the finalize
 function to avoid memleak
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, david@gibson.dropbear.id.au
References: <20210112112705.380534-1-ganqixin@huawei.com>
 <20210112112705.380534-3-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b1e528e4-fb5b-2348-4d4a-d420413e9e56@redhat.com>
Date: Tue, 12 Jan 2021 13:17:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112112705.380534-3-ganqixin@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 kuhn.chenqun@huawei.com, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 12:27 PM, Gan Qixin wrote:
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

As the change from v2 -> v3 is a rebase suggested by
Peter, you can keep David's tag IMO:

Acked-by: David Gibson <david@gibson.dropbear.id.au>

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


