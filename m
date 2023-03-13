Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B346B6FF7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 08:17:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbcPv-0004wb-Ud; Mon, 13 Mar 2023 03:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pbcPk-0004w5-5t
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 03:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pbcPh-00057h-Sx
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 03:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678691769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cg8sQghrdYlTju6QyLNitFPjgTP5MY0vusTce4YXGjU=;
 b=goTYrf7Y+W5Kz3bhpl8I05ieKtuQuTGRIALu0GmF2dfJ8MpcEaBw2aoLS/8lbFwOx2VR/L
 S8h7ZRdC0GFZDT8XRMcOhiTMeYdNC3ozHAOHQ7eZeC69B4NCM/erwD+50AGzj0caJpCBN4
 TLHa7/7oUSw50aoX1wWaRKuRr6p4qFI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-9RplCorqM8exqj9eIg709A-1; Mon, 13 Mar 2023 03:16:05 -0400
X-MC-Unique: 9RplCorqM8exqj9eIg709A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E466F80280D;
 Mon, 13 Mar 2023 07:16:04 +0000 (UTC)
Received: from [10.72.13.125] (ovpn-13-125.pek2.redhat.com [10.72.13.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D667C2166B26;
 Mon, 13 Mar 2023 07:15:54 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] NUMA: Apply cluster-NUMA-node boundary for aarch64
 and riscv machines
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, dbarboza@ventanamicro.com, shan.gavin@gmail.com
References: <20230225063527.281479-1-gshan@redhat.com>
Message-ID: <2031a7d5-ec3a-7306-825c-e845bf56f3d9@redhat.com>
Date: Mon, 13 Mar 2023 15:15:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20230225063527.281479-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/25/23 2:35 PM, Gavin Shan wrote:
> For arm64 and riscv architecture, the driver (/base/arch_topology.c) is
> used to populate the CPU topology in the Linux guest. It's required that
> the CPUs in one cluster can't span mutiple NUMA nodes. Otherwise, the Linux
> scheduling domain can't be sorted out, as the following warning message
> indicates. To avoid the unexpected confusion, this series attempts to
> warn about such kind of irregular configurations.
> 
>     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
>     ------------[ cut here ]------------
>     WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>     Modules linked in:
>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>     pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : build_sched_domains+0x284/0x910
>     lr : build_sched_domains+0x184/0x910
>     sp : ffff80000804bd50
>     x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>     x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>     x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>     x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>     x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>     x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>     x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>     x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>     x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>     x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>     Call trace:
>      build_sched_domains+0x284/0x910
>      sched_init_domains+0xac/0xe0
>      sched_init_smp+0x48/0xc8
>      kernel_init_freeable+0x140/0x1ac
>      kernel_init+0x28/0x140
>      ret_from_fork+0x10/0x20
> 
> PATCH[1] Warn about the irregular configuration if required
> PATCH[2] Enable the validation for aarch64 machines
> PATCH[3] Enable the validation for riscv machines
> 
> v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01080.html
> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00886.html
> 
> Changelog
> =========
> v3:
>    * Validate cluster-to-NUMA instead of socket-to-NUMA
>      boundary                                                  (Gavin)
>    * Move the switch from MachineState to MachineClass         (Philippe)
>    * Warning instead of rejecting the irregular configuration  (Daniel)
>    * Comments to mention cluster-to-NUMA is platform instead
>      of architectural choice                                   (Drew)
>    * Drop PATCH[v2 1/4] related to qtests/numa-test            (Gavin)
> v2:
>    * Fix socket-NUMA-node boundary issues in qtests/numa-test  (Gavin)
>    * Add helper set_numa_socket_boundary() and validate the
>      boundary in the generic path                              (Philippe)
> 

Ping, Philippe and Igor. Please let me know if you have more
comments, thanks!

> Gavin Shan (3):
>    numa: Validate cluster and NUMA node boundary if required
>    hw/arm: Validate cluster and NUMA node boundary
>    hw/riscv: Validate cluster and NUMA node boundary
> 
>   hw/arm/sbsa-ref.c   |  2 ++
>   hw/arm/virt.c       |  2 ++
>   hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>   hw/riscv/spike.c    |  2 ++
>   hw/riscv/virt.c     |  2 ++
>   include/hw/boards.h |  1 +
>   6 files changed, 51 insertions(+)
> 


