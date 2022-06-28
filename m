Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6187455E54B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:21:27 +0200 (CEST)
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6C5m-0001V7-87
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6C3x-0007zd-C4
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6C3u-0003tk-Tq
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656425970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPZTgFPJ2H/nmdW+70JgPtdl4Jdz/o/Fi40gVUlSi/k=;
 b=d6cNUYRgd0rL797rq6tniZzZsYxu9UfoXGPolMn4Y7uKk7fH8/6dcIiwQsDf4SRpd7He6f
 p9CsGPcoWh63P5karIVyrujAs8lRd8WxbDX1phn6DQiWC8c67K+rl+0XPhiloL6iyIk9I3
 Fr8v6xNSlLDEW4ZKPexQlFiDVW+t1Rg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-KPiNdIw0PJyNmE4o8q0aCw-1; Tue, 28 Jun 2022 10:19:26 -0400
X-MC-Unique: KPiNdIw0PJyNmE4o8q0aCw-1
Received: by mail-wr1-f71.google.com with SMTP id
 l9-20020adfa389000000b0021b8b489336so1840482wrb.13
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPZTgFPJ2H/nmdW+70JgPtdl4Jdz/o/Fi40gVUlSi/k=;
 b=mSOBY787KqHQKuT8A2Rt8Kpu2VeaqeJ/azd/51adVzjtfFj6B90WOE7oKOPeZC9fzY
 HaUYanbHglx7dcC+5OEXXlfifS49hS3mGf83KrRlIE1e1XCR3TZbvaJg4mnsgNIag9Q1
 2ZrYHNa3cVKrBkZ4/W4Xv2a2jjh6ZWVyHObp21KXJ1lZhzsKumCslccsggPqC09y8ZhG
 O/a4Dm0OHi78GUHensY+hSjxV3/R/Kodr+Qig+I7slCLEfnBX78opfxL8Dr0TFyx4YBa
 GLCjXCLCrDUy8C1OqeoYijNSBbkrvKykcIG75Fyodtd9KRqjXADBxdx2l8j2zW7uUVQi
 lhUA==
X-Gm-Message-State: AJIora+jN+kJRWPjjgpPApRQEwXYAaLVgREAa4p6xh/crsx8pRYj9yw8
 QNX1zgaT39fC53jsLo4gRrm36pq+G2IeEOg19diXULVLXJin2n+KmCZD/Oudjfu6Hzp02u5Wmrl
 1FU+02HWP1vbeK38=
X-Received: by 2002:a5d:6d49:0:b0:21b:a3ba:30b5 with SMTP id
 k9-20020a5d6d49000000b0021ba3ba30b5mr18295339wri.513.1656425965774; 
 Tue, 28 Jun 2022 07:19:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vlUv7us29fsRiZK1CFFCMYC9zPNGEPxnBjwWjDanKB1xiwwkAluNMP9DmG5RsoApwW4j1yvA==
X-Received: by 2002:a5d:6d49:0:b0:21b:a3ba:30b5 with SMTP id
 k9-20020a5d6d49000000b0021ba3ba30b5mr18295321wri.513.1656425965516; 
 Tue, 28 Jun 2022 07:19:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c214e00b0039c96b97359sm10895278wml.37.2022.06.28.07.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:19:25 -0700 (PDT)
Date: Tue, 28 Jun 2022 16:19:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 1/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220628161923.5804ec2a@redhat.com>
In-Reply-To: <7d0c6957-a781-58dc-552b-41afeb8b9c7e@inria.fr>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
 <7d0c6957-a781-58dc-552b-41afeb8b9c7e@inria.fr>
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

On Thu, 23 Jun 2022 16:58:28 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
> has a "Processor Proximity Domain Valid" flag that is currently
> always set because Qemu -numa requires an initiator=X value
> when hmat=on. Unsetting this flag allows to create more complex
> memory topologies by having multiple best initiators for a single
> memory target.
> 
> This patch allows -numa without initiator=X when hmat=on by keeping
> the default value MAX_NODES in numa_state->nodes[i].initiator.
> All places reading numa_state->nodes[i].initiator already check
> whether it's different from MAX_NODES before using it.
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
>   -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576
> which reports NUMA node2 at same distance from both node0 and node1 as seen in lstopo:
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
> 
> Before this patch, we had to add ",initiator=X" to "-numa node,nodeid=2,memdev=ram2".
> The lstopo output difference between initiator=1 and no initiator is:
> @@ -1,10 +1,10 @@
>   Machine (2966MB total) + Package P#0
> +  NUMANode P#2 (979MB)
>     Group0
>       NUMANode P#0 (980MB)
>       Core P#0 + PU P#0
>       Core P#1 + PU P#1
>     Group0
>       NUMANode P#1 (1007MB)
> -    NUMANode P#2 (979MB)
>       Core P#2 + PU P#2
>       Core P#3 + PU P#3
> 
> Corresponding changes in the HMAT MPDA structure:
> @@ -49,10 +49,10 @@
>   [078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
>   [07Ah 0122   2]                     Reserved : 0000
>   [07Ch 0124   4]                       Length : 00000028
> -[080h 0128   2]        Flags (decoded below) : 0001
> -            Processor Proximity Domain Valid : 1
> +[080h 0128   2]        Flags (decoded below) : 0000
> +            Processor Proximity Domain Valid : 0
>   [082h 0130   2]                    Reserved1 : 0000
> -[084h 0132   4] Attached Initiator Proximity Domain : 00000001
> +[084h 0132   4] Attached Initiator Proximity Domain : 00000080
                                                         ^^^^^^^^
where does this value come from?


>   [088h 0136   4]      Memory Proximity Domain : 00000002
>   [08Ch 0140   4]                    Reserved2 : 00000000
>   [090h 0144   8]                    Reserved3 : 0000000000000000
> 
> Final HMAT SLLB structures:
> [0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
> [0A2h 0162   2]                     Reserved : 0000
> [0A4h 0164   4]                       Length : 00000040
> [0A8h 0168   1]        Flags (decoded below) : 00
>                              Memory Hierarchy : 0
> [0A9h 0169   1]                    Data Type : 00
> [0AAh 0170   2]                    Reserved1 : 0000
> [0ACh 0172   4] Initiator Proximity Domains # : 00000002
> [0B0h 0176   4]   Target Proximity Domains # : 00000003
> [0B4h 0180   4]                    Reserved2 : 00000000
> [0B8h 0184   8]              Entry Base Unit : 0000000000002710
> [0C0h 0192   4] Initiator Proximity Domain List : 00000000
> [0C4h 0196   4] Initiator Proximity Domain List : 00000001
> [0C8h 0200   4] Target Proximity Domain List : 00000000
> [0CCh 0204   4] Target Proximity Domain List : 00000001
> [0D0h 0208   4] Target Proximity Domain List : 00000002
> [0D4h 0212   2]                        Entry : 0001
> [0D6h 0214   2]                        Entry : 0002
> [0D8h 0216   2]                        Entry : 0003
> [0DAh 0218   2]                        Entry : 0002
> [0DCh 0220   2]                        Entry : 0001
> [0DEh 0222   2]                        Entry : 0003
> 
> [0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
> [0E2h 0226   2]                     Reserved : 0000
> [0E4h 0228   4]                       Length : 00000040
> [0E8h 0232   1]        Flags (decoded below) : 00
>                              Memory Hierarchy : 0
> [0E9h 0233   1]                    Data Type : 03
> [0EAh 0234   2]                    Reserved1 : 0000
> [0ECh 0236   4] Initiator Proximity Domains # : 00000002
> [0F0h 0240   4]   Target Proximity Domains # : 00000003
> [0F4h 0244   4]                    Reserved2 : 00000000
> [0F8h 0248   8]              Entry Base Unit : 0000000000000001
> [100h 0256   4] Initiator Proximity Domain List : 00000000
> [104h 0260   4] Initiator Proximity Domain List : 00000001
> [108h 0264   4] Target Proximity Domain List : 00000000
> [10Ch 0268   4] Target Proximity Domain List : 00000001
> [110h 0272   4] Target Proximity Domain List : 00000002
> [114h 0276   2]                        Entry : 000A
> [116h 0278   2]                        Entry : 0005
> [118h 0280   2]                        Entry : 0001
> [11Ah 0282   2]                        Entry : 0005
> [11Ch 0284   2]                        Entry : 000A
> [11Eh 0286   2]                        Entry : 0001
> 
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
> ---
>   hw/core/machine.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302cce..d4d7e77401 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState *numa_state)
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


