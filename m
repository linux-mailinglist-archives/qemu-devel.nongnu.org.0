Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1ED2CE9F9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 09:38:43 +0100 (CET)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl6bx-000566-RY
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 03:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kl6ag-0004Y2-Gq
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 03:37:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kl6ae-00078L-5E
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 03:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607071039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gikfrlg47BA9IhG4F4I9ADKbrMx6ZT1Vh3HGgIkjTlA=;
 b=WXGa+JvwVwj5PlcKaT6CJs5tYqT4crKBKd5zjGOiENS1k6IVkidzbt7bFJ4+dgLsa+BO+X
 hzKrPdzDVWPIFF5u0c1s1yFGFosBebK9HNBt8TyUWPFSGtUKoaiH9QDnZIBvux2TLviHCj
 wdgpLD3gnjokGGuZgf431LFhWUsvfcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-Aa7uV9utPBm5su06_vlaOA-1; Fri, 04 Dec 2020 03:37:15 -0500
X-MC-Unique: Aa7uV9utPBm5su06_vlaOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2356B858182;
 Fri,  4 Dec 2020 08:37:14 +0000 (UTC)
Received: from gondolin (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A91FC60C15;
 Fri,  4 Dec 2020 08:37:07 +0000 (UTC)
Date: Fri, 4 Dec 2020 09:36:59 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Gan Qixin <ganqixin@huawei.com>
Subject: Re: [PATCH 3/3] s390x/cpu: Use timer_free() in the finalize
 function to avoid memleaks
Message-ID: <20201204093659.349314af.cohuck@redhat.com>
In-Reply-To: <20201204081209.360524-4-ganqixin@huawei.com>
References: <20201204081209.360524-1-ganqixin@huawei.com>
 <20201204081209.360524-4-ganqixin@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 kuhn.chenqun@huawei.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Dec 2020 16:12:09 +0800
Gan Qixin <ganqixin@huawei.com> wrote:

> When running device-introspect-test, a memory leak occurred in the s390_cpu_initfn
> function, this patch use timer_free() in the finalize function to fix it.
> 
> ASAN shows memory leak stack:
> 
> Direct leak of 3552 byte(s) in 74 object(s) allocated from:
>     #0 0xfffeb3d4e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
>     #1 0xfffeb36e6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaad51a8f9c4 in timer_new_full qemu/include/qemu/timer.h:523
>     #3 0xaaad51a8f9c4 in timer_new qemu/include/qemu/timer.h:544
>     #4 0xaaad51a8f9c4 in timer_new_ns qemu/include/qemu/timer.h:562
>     #5 0xaaad51a8f9c4 in s390_cpu_initfn qemu/target/s390x/cpu.c:304
>     #6 0xaaad51e00f58 in object_init_with_type qemu/qom/object.c:371
>     #7 0xaaad51e0406c in object_initialize_with_type qemu/qom/object.c:515
>     #8 0xaaad51e042e0 in object_new_with_type qemu/qom/object.c:729
>     #9 0xaaad51e3ff40 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
>     #10 0xaaad51910518 in qdev_device_help qemu/softmmu/qdev-monitor.c:283
>     #11 0xaaad51911918 in qmp_device_add qemu/softmmu/qdev-monitor.c:801
>     #12 0xaaad51911e48 in hmp_device_add qemu/softmmu/qdev-monitor.c:916
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Thomas Huth <thuth@redhat.com>

[Adding missing maintainers. How did you build the cc: list?]

> ---
>  target/s390x/cpu.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 7b66718c44..8a734c2f8c 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -313,6 +313,11 @@ static void s390_cpu_finalize(Object *obj)
>  #if !defined(CONFIG_USER_ONLY)
>      S390CPU *cpu = S390_CPU(obj);
>  
> +    timer_del(cpu->env.tod_timer);
> +    timer_free(cpu->env.tod_timer);
> +    timer_del(cpu->env.cpu_timer);
> +    timer_free(cpu->env.cpu_timer);
> +
>      qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
>      g_free(cpu->irqstate);
>  #endif

Looks sane at first glance.


