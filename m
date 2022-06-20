Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1802B551ABF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 15:29:46 +0200 (CEST)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3HTM-00085N-Ow
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 09:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o3HRm-000729-NA
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o3HRj-000854-9M
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655731682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPkh54vlbU6ZRio1svO+2YpIiafY2KriAEEdyuaczpE=;
 b=TA1CFlzf3UfGcnEDIFoEOCb4ygqii4GUOCZzUu1BjBSnXrv1j1s3z/5G1tmP/bWb+s7pXT
 rD9Q1AN1E7+fzKCBoMcL5y6i4/6/4B9IF6KL6r6zhGVkR03SmADrcjea/EmZuAN6yaybSx
 x2T0+wZO6FX8lEmQWhZQ7977GOHbCFA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-CuPOGKlxMKmzr5MimOfQpw-1; Mon, 20 Jun 2022 09:28:00 -0400
X-MC-Unique: CuPOGKlxMKmzr5MimOfQpw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so5045609wmj.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 06:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPkh54vlbU6ZRio1svO+2YpIiafY2KriAEEdyuaczpE=;
 b=R+0BnioR4VekPYLbHyE8GtoUtrAElz00TgT43VWui6EtzIaPQkD1iX5m9PvgZozfXc
 5pu0nAf0zEybVog5+KSKn5g1o21J/2xsceRIcA1lMsoutEdwQgq9Q4h1e0u8j9i7+09/
 eF6lUV7GNLKe3DaR0IR4ROg+BY4tw/Ml2ox8fmr5eotxQnX2y9XxZJC47SNVvXSedYRp
 MCc0NzInvvWoXFiuSTvST4+c3L6UZqbOdycYbLcdjmP/Mvpt9G3OeGyaIM7J3S4zXDvd
 Pr3nchzNqH/cpyFF4AN9FZIN5Hei0Z8EY2xVbtG71RqadWWpaB8DxLM6rfuOXMe/KeCq
 7O2Q==
X-Gm-Message-State: AOAM53102YVElmrxRUg4oSQQ+lBilOOjIlhqkVMW2M4N6AnvW7yy9j+A
 Fz5peXkPDKLHSbuKPlPDNCpFQOgNqNdoa9PhVmBurmTNQ/eQLHmSi5Y6SHTVHaUOmT8ZFZ35pdM
 jdj+++imhFOBnOTk=
X-Received: by 2002:a05:600c:1d12:b0:39c:4307:8b10 with SMTP id
 l18-20020a05600c1d1200b0039c43078b10mr35266530wms.103.1655731679806; 
 Mon, 20 Jun 2022 06:27:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDQ074JtmIptCVLUJhz/C0EM584sfExq0zsiaAie1iq82WI19UHebFiyZl2HtxgRWz0+4eAQ==
X-Received: by 2002:a05:600c:1d12:b0:39c:4307:8b10 with SMTP id
 l18-20020a05600c1d1200b0039c43078b10mr35266430wms.103.1655731679008; 
 Mon, 20 Jun 2022 06:27:59 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 v6-20020adfa1c6000000b0021b8905e797sm6543310wrv.69.2022.06.20.06.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 06:27:58 -0700 (PDT)
Date: Mon, 20 Jun 2022 15:27:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, Liu Jingqi
 <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
Message-ID: <20220620152757.5dd721b9@redhat.com>
In-Reply-To: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 6 Apr 2022 14:29:56 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> From: Brice Goglin <Brice.Goglin@inria.fr>
> 
> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
> has a "Processor Proximity Domain Valid" flag that is currently
> always set because Qemu -numa requires initiator=X when hmat=on.
>
> Unsetting this flag allows to create more complex memory topologies
> by having multiple best initiators for a single memory target.
> 
> This patch allows -numa with initiator=X when hmat=on by keeping
> the default value MAX_NODES in numa_state->nodes[i].initiator.
> All places reading numa_state->nodes[i].initiator already check
> whether it's different from MAX_NODES before using it. And
> hmat_build_table_structs() already unset the Valid flag when needed.
> 
> Tested with
> qemu-system-x86_64 -accel kvm \
>   -machine pc,hmat=on \
>   -drive if=pflash,format=raw,file=./OVMF.fd \
>   -drive media=disk,format=qcow2,file=efi.qcow2 \
>   -smp 4 \
>   -m 3G \
>   -object memory-backend-ram,size=1G,id=ram0 \
>   -object memory-backend-ram,size=1G,id=ram1 \
>   -object memory-backend-ram,size=1G,id=ram2 \
>   -numa node,nodeid=0,memdev=ram0,cpus=0-1 \
>   -numa node,nodeid=1,memdev=ram1,cpus=2-3 \
>   -numa node,nodeid=2,memdev=ram2 \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>   -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
>   -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>   -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>   -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
>   -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
>   -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>   -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>   -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
> 

> This exposes NUMA node2 at same distance from both node0 and node1 as seen in lstopo:
> 
> Machine (2966MB total) + Package P#0
>    NUMANode P#2 (979MB)
>    Group0
>      NUMANode P#0 (980MB)
>      Core P#0 + PU P#0
>      Core P#1 + PU P#1
>    Group0
>      NUMANode P#1 (1007MB)
>      Core P#2 + PU P#2
>      Core P#3 + PU P#3

here should be a dis-assembled dump of generated HMAT table
+ a test case, see tests/qtest/bios-tables-test.c
for the process (at tho top) and test examples

> 
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
> ---
>   hw/core/machine.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4..9884ef7ac6 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1012,9 +1012,7 @@ static void numa_validate_initiator(NumaState *numa_state)
>   
>       for (i = 0; i < numa_state->num_nodes; i++) {
>           if (numa_info[i].initiator == MAX_NODES) {
> -            error_report("The initiator of NUMA node %d is missing, use "
> -                         "'-numa node,initiator' option to declare it", i);
> -            exit(1);
> +            continue;
>           }
>   
>           if (!numa_info[numa_info[i].initiator].present) {


