Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2C6CA5CB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:28:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmsT-00032l-SB; Mon, 27 Mar 2023 09:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pgmsK-00031q-PQ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pgmsI-0001hz-T5
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679923622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIV5AmjSgvW36JeCgOM80cPe8HGqbh3Z/tQwUTluUJ8=;
 b=gc+kZDXziCrCr60xHmsml/RbFTu5Yr/giUHKH1xzIdp8IjfWXurvphvhB0if3MBt/ayY1N
 OQh/hioElWNSL63iDEyZXFvxeLHZffV4DM/QdaJjWfwPbmtfpfEZq/SvO5ofig1DCceRlo
 kdeyAa8Q7V56crn7xUFh4jZg6fQbCjA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-AnaF0ZRQNTSihsQqQ77tsw-1; Mon, 27 Mar 2023 09:26:58 -0400
X-MC-Unique: AnaF0ZRQNTSihsQqQ77tsw-1
Received: by mail-qt1-f197.google.com with SMTP id
 n10-20020a05622a11ca00b003e4e30c6c98so3255405qtk.19
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 06:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679923618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tIV5AmjSgvW36JeCgOM80cPe8HGqbh3Z/tQwUTluUJ8=;
 b=uBIBv/57CcY1c44LBX/5erpz9jbc+tMcxuShBCoFL+f+tvNMgHLiUpGkYxN96J5vS1
 T5cMxJ32mfqykFZYaSkElayiBARlMD41zLEA56tTy0kj9kHvBKP/txpRia6kk74hLt2y
 HsLvNrd8Xz4kfiDQcYGtSxZysEsCd3qHIk5NTQZwELqTps1TPe7p8KXZymWM4D9VrRWU
 Y2WipZR+GH99d7iBOkqDRCJaJHJs63dexcdjU7yOElnqXyCzawZ2UDdDzWCz89SyInXc
 yXwOLZ61ljSZvaJUI3OH8Sq4XqIrDMs3TqRsy7v8SuRib8NqKlpMzmVnh/8afwqXqiTe
 WUoQ==
X-Gm-Message-State: AO0yUKWtAnMdk6nlPfK8v+wMOsFu1J2Ptbl1piK+Q0dWvMtbs4NudI3E
 80GfyxRGYtxtszaLZVFHG1FNT57NOVjfihx3OZrmMg4VNS6LZxy5DY3xQD558bCuIGwQnor0ZYQ
 Dewv1/GXhnfNuCRU=
X-Received: by 2002:a05:622a:14c8:b0:3de:4296:2bcc with SMTP id
 u8-20020a05622a14c800b003de42962bccmr21908051qtx.49.1679923618028; 
 Mon, 27 Mar 2023 06:26:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set+8+ORxLEVVU7jrN8pdNDDiZVbAc+8g+9M52ISmAls35Bjn5x9HWrGkCGiGkK9rHQbnzxQ5Gg==
X-Received: by 2002:a05:622a:14c8:b0:3de:4296:2bcc with SMTP id
 u8-20020a05622a14c800b003de42962bccmr21907998qtx.49.1679923617633; 
 Mon, 27 Mar 2023 06:26:57 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 t126-20020ae9df84000000b0073b4a55a2d1sm16704086qkf.124.2023.03.27.06.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 06:26:56 -0700 (PDT)
Date: Mon, 27 Mar 2023 15:26:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v4 0/3] NUMA: Apply cluster-NUMA-node boundary for
 aarch64 and riscv machines
Message-ID: <20230327152651.41f22ac0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230317062542.61061-1-gshan@redhat.com>
References: <20230317062542.61061-1-gshan@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 17 Mar 2023 14:25:39 +0800
Gavin Shan <gshan@redhat.com> wrote:

> For arm64 and riscv architecture, the driver (/base/arch_topology.c) is
> used to populate the CPU topology in the Linux guest. It's required that
> the CPUs in one cluster can't span mutiple NUMA nodes. Otherwise, the Linux
> scheduling domain can't be sorted out, as the following warning message
> indicates. To avoid the unexpected confusion, this series attempts to
> warn about such kind of irregular configurations.
> 
>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
>    ------------[ cut here ]------------
>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>    Modules linked in:
>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    pc : build_sched_domains+0x284/0x910
>    lr : build_sched_domains+0x184/0x910
>    sp : ffff80000804bd50
>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>    Call trace:
>     build_sched_domains+0x284/0x910
>     sched_init_domains+0xac/0xe0
>     sched_init_smp+0x48/0xc8
>     kernel_init_freeable+0x140/0x1ac
>     kernel_init+0x28/0x140
>     ret_from_fork+0x10/0x20
> 
> PATCH[1] Warn about the irregular configuration if required
> PATCH[2] Enable the validation for aarch64 machines
> PATCH[3] Enable the validation for riscv machines
> 
> v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01226.html
> v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01080.html
> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00886.html
> 
> Changelog
> =========
> v4:
>   * Pick r-b and ack-b from Daniel/Philippe                   (Gavin)
>   * Replace local variable @len with possible_cpus->len in
>     validate_cpu_cluster_to_numa_boundary()                   (Philippe)
> v3:
>   * Validate cluster-to-NUMA instead of socket-to-NUMA
>     boundary                                                  (Gavin)
>   * Move the switch from MachineState to MachineClass         (Philippe)
>   * Warning instead of rejecting the irregular configuration  (Daniel)
>   * Comments to mention cluster-to-NUMA is platform instead
>     of architectural choice                                   (Drew)
>   * Drop PATCH[v2 1/4] related to qtests/numa-test            (Gavin)
> v2:
>   * Fix socket-NUMA-node boundary issues in qtests/numa-test  (Gavin)
>   * Add helper set_numa_socket_boundary() and validate the
>     boundary in the generic path                              (Philippe)
> 
> Gavin Shan (3):
>   numa: Validate cluster and NUMA node boundary if required
>   hw/arm: Validate cluster and NUMA node boundary
>   hw/riscv: Validate cluster and NUMA node boundary
> 
>  hw/arm/sbsa-ref.c   |  2 ++
>  hw/arm/virt.c       |  2 ++
>  hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>  hw/riscv/spike.c    |  2 ++
>  hw/riscv/virt.c     |  2 ++
>  include/hw/boards.h |  1 +
>  6 files changed, 51 insertions(+)
> 

Acked-by: Igor Mammedov <imammedo@redhat.com>


