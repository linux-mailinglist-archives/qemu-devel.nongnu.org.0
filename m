Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64696A18BD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:28:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUM8-0000YV-Qu; Fri, 24 Feb 2023 04:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVULx-0000XG-EU
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:27:03 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVULv-0003wL-OD
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:26:57 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1722c48a773so15733014fac.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 01:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C0G4BCoPKh/ASK1qNKBGmxnNKbQEwENvpR+6RXwZBsk=;
 b=VGWJEgLFRLX4N+RHj9zCm4i9Xg1G9Patuq+0wiVvttieviJ/tfaNSHFCHvQm7tyJ+6
 XIAjJoLjPYG37tECpQHecEwqEkRV+7X/jNhVaS+060GBkoSDECzqX1HdcilU+k2nEJJ3
 jwReUaiYixa7bLKv3eCU7bLR1VQKZvNT2YeAJ/0mlGL69/jiy/tYXYY6wpTtATeOWtVJ
 w7z0QOybzwtCQH7/JfulTQuQEdvD8p6pgI/wVCWl+qtOZDdwu5JGnNadIX/BakxIExcO
 l89Yj1eDCA7lSqs5WjU9ZLsIqvMD1MfiuuHaYT0BHbCLoeiDla/NeiEsu9JFcSIvpYN9
 3R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C0G4BCoPKh/ASK1qNKBGmxnNKbQEwENvpR+6RXwZBsk=;
 b=nanY2k6Xn4yA3nO6aupI5oyw6hFlaVxR+elNr/ZERiH34WPoqnqQvvdXVJ1LvDEmFZ
 CUGlx+ZYRUxA2by2OHWv4aNCl6p/7o7LVUcAv+ttSHzKoGydUSltLW7+Pm0N9OI6FXFJ
 ebmimYB7FZjxG91Of2Md6+hn3mq5spDGzv7tq4mDlIGBcyJfv/Cfgj92SsxlnSfmAtlJ
 8V4xKwRfj9REQjAeAMLyTi/rXBBHuv3pjF5HsApvW/f/BssEOshR0zwEtUYXCWOh7q/j
 t5suyK5JLZssM2VRkj4HlIlTv6QR2hpuYr7hmSkAbPEDBCq0iGo3vvnsWI4SURx+TUGG
 ZBsQ==
X-Gm-Message-State: AO0yUKWkSaiZn0LX2zoWjlY4KtwLN5C6XbgmsY0yxGSlfAMt35GlYSq5
 yCLvDe5kCr/PvRnlYa3x4eDXEA==
X-Google-Smtp-Source: AK7set/ClVWO3aIhaA1H2zKvj6x/Ya7z8CShTLyoHDaqFneKGqZRD0FJNIy0orLFjvhGCzznqScQBQ==
X-Received: by 2002:a05:6870:2389:b0:16d:c23a:a11b with SMTP id
 e9-20020a056870238900b0016dc23aa11bmr11943377oap.3.1677230814388; 
 Fri, 24 Feb 2023 01:26:54 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 dv23-20020a056870d89700b0016dbf59175bsm2313832oab.47.2023.02.24.01.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 01:26:53 -0800 (PST)
Message-ID: <11e958b1-4763-f710-fe02-832cfd559e7b@ventanamicro.com>
Date: Fri, 24 Feb 2023 06:26:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
 <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
 <fc0d2c66-5600-c33a-62d7-c72f1d16518b@redhat.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <fc0d2c66-5600-c33a-62d7-c72f1d16518b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 2/24/23 04:09, Gavin Shan wrote:
> On 2/24/23 12:18 AM, Daniel Henrique Barboza wrote:
>> On 2/23/23 05:13, Gavin Shan wrote:
>>> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
>>> used to populate the CPU topology in the Linux guest. It's required that
>>> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
>>> scheduling domain can't be sorted out, as the following warning message
>>> indicates. To avoid the unexpected confusion, this series attempts to
>>> rejects such kind of insane configurations.
>>>
>>>     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>>     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>>     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>>     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>
>>
>> And why is this a QEMU problem? This doesn't hurt ACPI.
>>
>> Also, this restriction impacts breaks ARM guests in the wild that are running
>> non-Linux OSes. I don't see why we should impact use cases that has nothing to
>> do with Linux Kernel feelings about sockets - NUMA nodes exclusivity.
>>
> 
> With above configuration, CPU-0/1/2 are put into socket-0-cluster-0 while CPU-3/4/5
> are put into socket-1-cluster-0, meaning CPU-2/3 belong to different socket and
> cluster. However, CPU-2/3 are associated with NUMA node-1. In summary, multiple
> CPUs in different clusters and sockets have been associated with one NUMA node.
> 
> If I'm correct, the configuration isn't sensible in a baremetal environment and
> same Linux kernel is supposed to work well for baremetal and virtualized machine.
> So I think QEMU needs to emulate the topology as much as we can to match with the
> baremetal environment. It's the reason why I think it's a QEMU problem even it
> doesn't hurt ACPI. As I said in the reply to Daniel P. Berrangé <berrange@redhat.com>
> in another thread, we may need to gurantee that the CPUs in one cluster can't be
> split to multiple NUMA nodes, which matches with the baremetal environment, as I
> can understand.
> 
> Right, the restriction to have socket-NUMA-node or cluster-NUMA-node boundary will
> definitely break the configurations running in the wild.


What about a warning? If the user attempts to use an exotic NUMA configuration
like the one you mentioned we can print something like:

"Warning: NUMA topologies where a socket belongs to multiple NUMA nodes can cause OSes like Linux to misbehave"

This would inform the user what might be going wrong in case Linux is crashing/error
out on them and then the user is free to fix their topology (or the kernel). And
at the same time we wouldn't break existing stuff that happens to be working.


Thanks,


Daniel


> 
> Thanks,
> Gavin
> 
> [...]
> 

