Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5623607B75
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:50:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oluGf-0005d4-V7; Fri, 21 Oct 2022 11:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1oluGG-0005aj-Ed; Fri, 21 Oct 2022 11:48:40 -0400
Received: from mail-mw2nam04on2096.outbound.protection.outlook.com
 ([40.107.101.96] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1oluGE-00038i-9B; Fri, 21 Oct 2022 11:48:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDr3AK3zocUVS1U+WwuoYrpnJ/x7cmt7eP2eqMQ4Ya8Qhy1JNC8EsBvMkd3RI4lTMn+iI/QmAhUjSYVpcAnpyF2pBf6OD5BXoAOZDbv/xVxH5B2v9HLATnyMY3CLsjuxXJQjTorQsr7vm9bda/eYBsFm9HmFFcDlBmd4aE0u+pYaEKRvMq42zylewM92W1JI9ne/OpmjZXUb0+sY4J4W6hcfh095J8+goS7vcBvecrK+W6I8eNfDeLYnGIFfBR5WS0Jr0sJ3bGyTLBW8W581PXWWawoBAK07yRWbNji2njtkO9kPIllCp6JaWl04WzPhD0Y2Yh8OiwC2rZxiuX1j0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTklF+HGSgpkBA8qwjR0PzFjJ+IdyTXn6GghsvqN2/8=;
 b=YExFUdQwOrGTvNFvREYFBh9L0BGtE28fg5cThMnLYao4ltHPXv75e31uWOL7lO41QI+/Gw5lor0oxs7G5A7zSwxGA07uSmwgPVObGRCQ/qSTpzoU8LTLI+XTBbjmg1XyMdHS3Q9epmNyN3uGi4se7bVIJ3KWBBDSDaVGRc2GtxoSZWfx3zUMlplrZPEPV47VkpV2Cpafv6jCTNy08eC3Uxj40eGzWke0zshjCGNllAYkdzfAcCZ4IWxwY6Qq6J3g1uEnbQuXH6zXI5y/nmM1Z+szB1MZaAm9NyR784IclKcRMGUYPkPSzOMxHDh91Hz4CgMqodac3Hu361hXJxD76Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTklF+HGSgpkBA8qwjR0PzFjJ+IdyTXn6GghsvqN2/8=;
 b=umEt6vX842Ftkz+zx4v9gZrn1uvdSIHGE0huwjKED+VMHnn+OspVH4uJASMjgUVwZ0P8OpeVV4mAMvbF9alN9KhZZVMKS0qqJRkfH4IC/RqEcpg2O64iEnwyP+JOF2NbYH4ke4RfPtTN+znl15k/Zn/sXHL/Caa3jVrUljdG5g8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 MW4PR01MB6403.prod.exchangelabs.com (2603:10b6:303:70::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Fri, 21 Oct 2022 15:48:30 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::aa43:6c60:26f0:d9c8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::aa43:6c60:26f0:d9c8%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 15:48:30 +0000
Date: Fri, 21 Oct 2022 11:48:10 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [BUG] AArch64 boot hang with -icount and -smp >1 (iothread locking
 issue?)
Message-ID: <Y1K/Oo/dagg6D46m@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: CH0PR03CA0394.namprd03.prod.outlook.com
 (2603:10b6:610:11b::28) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|MW4PR01MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: cb650359-b2f3-4f0f-f4e6-08dab37bb390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CFuVKuCTujXMmhIEx/z3BtnZcniT4tKNIFSg4EKD/iMTcRcE11+a4PuZVFgzZlhVGD8DL08zCrZceolQ9s5zDXXoNnYj/7K4AmEen5ixL6bTOUYbmFiLDxMe3anFsy736tcGZwhYVfIb4bZOJUakscnELscFyX85Trs21UAcM8LAwADmkyVJ94Vwad1NdShXp7CyjA2TYwwQ3Wfp4ZSGZJcp15bwipVmsEopxqel/fAX/rcHprPAflL3thCTM2UCOEb7iv34JFM5izhCmcmOVxoAuPKKHwl2BjVMdAwPvGan1OtXTl7pYgBsChpucsNs5JUcGB+RHta4eut6cOPNIWPrvlQpdD3qACzs63TGuvtPXcVZ5+kJ2XVW4vdtGL8O1T+VYjSv0M307pp96dvIhYJMo+DCaLsmH1SopBi+7jeMATMIwUDck+ZsJ3T7pCbRQvfUYdMMCJwfNK19i5iS+H7BYlrco3tGld5aMHdzxRAFA+cXfTnEgG8OPFAmNR1MHZwrCwK2ljonh//nmE7G3tJNmvlRiJ6G+4sCsRASKU3NRxDxx1R5jXWjFBBatqurhNzbAD6Jb2XcviRfLPgD+CkngwBQAYjfbaJbvPuyBIO0bJMbAdV0+EVGL6ZfEafbA5k/qz3dGTk2gdKUWYlTOmznq4ESj+T5GjSumivLF0Xw6Xq2xmwDyp2aWxx8KUo2TNAWyShHZmeX55jKpBf5LKQfoQUwE9yPSAyKbP0sAZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(451199015)(966005)(38100700002)(478600001)(66899015)(6486002)(316002)(8936002)(110136005)(6506007)(86362001)(83380400001)(6666004)(66946007)(66556008)(66476007)(41300700001)(186003)(2906002)(8676002)(6512007)(26005)(9686003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EtJ7CFP65JSJYSso32rbrQMoLYRyXZXxJ9eDgFEQsI7ud8b5jFvDwYLh/PH/?=
 =?us-ascii?Q?oN585o3k90jrx1ITDiau1XWRAR/zIeyKy46oeL5QrgodIxJq5bcThiGhjlNd?=
 =?us-ascii?Q?ZfYMSlbggsn26gdqMWzOp3NJyXoErQn3z7h4yKKspKlJt2vEixLLxeRnyaKU?=
 =?us-ascii?Q?Gpt/kcgf6vzlYAvQXoCr5kmbarCuSCzDb9KFQ/dRxtFPzf6PrNhxMhD6ZLIt?=
 =?us-ascii?Q?lPJaIBODvaX90/w4V71d6E6+giXfMiHD5bsuWMXTcPh1TVPnrPAYHXUQhUsd?=
 =?us-ascii?Q?wZ0j0CkVEfKgVOcliODMiIHs7bXlIieSUBgQ4uV0OkeC4Y4FpZ9VDK6haTU2?=
 =?us-ascii?Q?LjRuB0eXemDNeJEUcivHsLoNvszY3ZEaKk7kB2XKpnGn0uz7CLkM/F8GKOlu?=
 =?us-ascii?Q?ai1VsQWLB2ol2Yu5ycVmx+ZmgNATTKjaeIatZEhEzdW4O2lG+sxTw5dBXN8A?=
 =?us-ascii?Q?pgnX/iV902TvQ+hD++TH1RSec0guSr5RqMVjL53dhQ4UFo47HNbst3TZVyRr?=
 =?us-ascii?Q?x74c1ZI4qMntTGbs418pv3mNdSb/VXXc3A8DXT1vZRISCFSVRJuzQVD5QR6k?=
 =?us-ascii?Q?xJQDbOt/rFRL4DS3m84ufICrGlOTsF/M8lnutX6TDzYxrprIDAZ4naUHcHIk?=
 =?us-ascii?Q?jkrxCWP3PJe4FWrQIBVwzPXlD6hR2IC/DisAzPuYlgMZ0ZNQUmtw+lfNDais?=
 =?us-ascii?Q?oyhWtmAMpKC49pcjGxLfEWc27SCnCpXLMrDEjA1CUwfkfbvOl3tjRcp8zgCM?=
 =?us-ascii?Q?4Z4s4JaC5tM+kyMepwv+ouuHJSpC43+jBcpIPZbKU3Lmut1QukRjXN7n1V5p?=
 =?us-ascii?Q?hb5JS83Mdewv6x3KZhg7sYZfHvf52jpUpapARtouoFDWAMNdF3GGuoMgZz3f?=
 =?us-ascii?Q?mXV4kQXeByiUYmKr14oXlzCJllExv75i73JQEVpF31rvOFTq9xOEN7gdCL/0?=
 =?us-ascii?Q?Rb8HOv0LqBHtse6OUdb8PJ1jJCfKiCrFtiEcgApcZQJaeZgDJGSG772PknBu?=
 =?us-ascii?Q?2tDz7nkljM7H9Y8kJQUpzQ8vXHsvOy8hOAY4QPxU/Li23Y5dqevmTDxGPcdQ?=
 =?us-ascii?Q?wnHTLcpTkZBDtvje9b/2jR3NCaERhzI5hYGJ8+xfs1W42c82iXHUH2EP1Kb2?=
 =?us-ascii?Q?eyVngl//fBirc2ykv2xzcFbXobQu2wzKZFkpmQo/wIrbXzBEGRsEgxv2r833?=
 =?us-ascii?Q?Uy4Z52syOU+DVjzqkahd6CmkZtveDw1FlPIMmfs3VKdxojlEz7rxUknhvDPp?=
 =?us-ascii?Q?AcmpIiaGcb1hsPLVxTHM41hJpHWNmHM5sB83kP4bMGYbPhQyy91u7KQUTv+f?=
 =?us-ascii?Q?a/4Jytk0F1ThMyMyToAg0dqOFRdRn21STm4aX7Pa1B2911WX3m17dqJ2MNUc?=
 =?us-ascii?Q?mHwDwSarSYgPZBtg9hPC2PON8kLOc/KzcsVsMOBjKoGk8uwS8rQLP8qdURCk?=
 =?us-ascii?Q?XaDWVJyQuTTEMhBP/JNuMg2+SNxx/kXnwxpz2f8wGC7dMaVtT3pmQ1DFqXBU?=
 =?us-ascii?Q?Qu+v3dQqIA52h5tA0z5RI4sBCD06mawEq5+h+vBm0kgbQqvQEiOz+aRPrLvh?=
 =?us-ascii?Q?a47FjmgbJHMQ2mKmYbVp410+pY+xPbRBkRrmBskxGA61PrmBXS+scuE+2Z9t?=
 =?us-ascii?Q?FljT426TSM7Ubk2ZEczPYyk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb650359-b2f3-4f0f-f4e6-08dab37bb390
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:48:30.3348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkTBxoBAgjKaA/sB9YMoERkNmV5oi9T30/kEBia/DoPv0eLUs9eSNKOd6+At0aI3nUWKjYet2WCsBnSyasipjEfOcHXvi/BSoFahfuJ0JJSubNPvwION3JP9GOJSh+ec
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6403
Received-SPF: pass client-ip=40.107.101.96;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

I am encountering one or more bugs when using -icount and -smp >1 that I am
attempting to sort out. My current theory is that it is an iothread locking
issue.

I am using a command-line like the following where $kernel is a recent upstream
AArch64 Linux kernel Image (I can provide a binary if that would be helpful -
let me know how is best to post):

	qemu-system-aarch64 \
		-M virt -cpu cortex-a57 -m 1G \
		-nographic \
		-smp 2 \
		-icount 0 \
		-kernel $kernel

For any/all of the symptoms described below, they seem to disappear when I
either remove `-icount 0` or change smp to `-smp 1`. In other words, it is the
combination of `-smp >1` and `-icount` which triggers what I'm seeing.

I am seeing two different (but seemingly related) behaviors. The first (and
what I originally started debugging) shows up as a boot hang. When booting
using the above command after Peter's "icount: Take iothread lock when running
QEMU timers" patch [1], The kernel boots for a while and then hangs after:

> ...snip...
> [    0.010764] Serial: AMBA PL011 UART driver
> [    0.016334] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq = 13, base_baud = 0) is a PL011 rev1
> [    0.016907] printk: console [ttyAMA0] enabled
> [    0.017624] KASLR enabled
> [    0.031986] HugeTLB: registered 16.0 GiB page size, pre-allocated 0 pages
> [    0.031986] HugeTLB: 16320 KiB vmemmap can be freed for a 16.0 GiB page
> [    0.031986] HugeTLB: registered 512 MiB page size, pre-allocated 0 pages
> [    0.031986] HugeTLB: 448 KiB vmemmap can be freed for a 512 MiB page
> [    0.031986] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.031986] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page

When it hangs here, I drop into QEMU's console, attach to the gdbserver, and it
always reports that it is at address 0xffff800008dc42e8 (as shown below from an
objdump of the vmlinux). I note this is in the middle of messing with timer
system registers - which makes me suspect we're attempting to take the iothread
lock when its already held:

>   ffff800008dc42b8 <arch_timer_set_next_event_virt>:
>   ffff800008dc42b8:       d503201f        nop
>   ffff800008dc42bc:       d503201f        nop
>   ffff800008dc42c0:       d503233f        paciasp
>   ffff800008dc42c4:       d53be321        mrs     x1, cntv_ctl_el0
>   ffff800008dc42c8:       32000021        orr     w1, w1, #0x1
>   ffff800008dc42cc:       d5033fdf        isb
>   ffff800008dc42d0:       d53be042        mrs     x2, cntvct_el0
>   ffff800008dc42d4:       ca020043        eor     x3, x2, x2
>   ffff800008dc42d8:       8b2363e3        add     x3, sp, x3
>   ffff800008dc42dc:       f940007f        ldr     xzr, [x3]
>   ffff800008dc42e0:       8b020000        add     x0, x0, x2
>   ffff800008dc42e4:       d51be340        msr     cntv_cval_el0, x0
> * ffff800008dc42e8:       927ef820        and     x0, x1, #0xfffffffffffffffd
>   ffff800008dc42ec:       d51be320        msr     cntv_ctl_el0, x0
>   ffff800008dc42f0:       d5033fdf        isb
>   ffff800008dc42f4:       52800000        mov     w0, #0x0                        // #0
>   ffff800008dc42f8:       d50323bf        autiasp
>   ffff800008dc42fc:       d65f03c0        ret 

The second behavior is that prior to Peter's "icount: Take iothread lock when
running QEMU timers" patch [1], I observe the following message (same command
as above):

> ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion failed: (qemu_mutex_iothread_locked())
> Aborted (core dumped)

This is the same behavior described in Gitlab issue 1130 [0] and addressed by
[1]. I bisected the appearance of this assertion, and found it was introduced
by Pavel's "replay: rewrite async event handling" commit [2]. Commits prior to
that one boot successfully (neither assertions nor hangs) with `-icount 0 -smp
2`.

I've looked over these two commits ([1], [2]), but it is not obvious to me
how/why they might be interacting to produce the boot hangs I'm seeing and
I welcome any help investigating further.

Thanks!

-Aaron Lindsay

[0] - https://gitlab.com/qemu-project/qemu/-/issues/1130
[1] - https://gitlab.com/qemu-project/qemu/-/commit/c7f26ded6d5065e4116f630f6a490b55f6c5f58e
[2] - https://gitlab.com/qemu-project/qemu/-/commit/60618e2d77691e44bb78e23b2b0cf07b5c405e56

