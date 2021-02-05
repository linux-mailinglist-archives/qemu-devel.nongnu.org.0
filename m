Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C095310C90
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:28:37 +0100 (CET)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8267-00086W-Vx
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l824P-0007UK-71
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:26:49 -0500
Received: from mail-co1nam11on2136.outbound.protection.outlook.com
 ([40.107.220.136]:40833 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l824N-0002xl-6H
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:26:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c52KoA2AtYA1DUkIdrMi2krpiZn2KCObjXhHuNtcPMy2x2DCX3auYA7GKHUwdHPah0uts+NJqnaRO43ORiT0S8Tz5zh7JvznrjbQ4M9p1/wE6TisuzMFo1fRE2LcHt5u8LqdGkVG03bj0jm0eHicP9riK56crL3Nc0T7NBRW/IyLB7t9179MNbg/y0733+Vy8fis+NqHG5T/Etm0XbIVEjpdMJcDHzg3de1IlV0ewODQ/PEjRXDSPys/lOut4dZMz1exdEdQ5FVM5baoP6uM3F05IaXoJDm4BqEFyNhhYu2mFcwcaF1c1Xh7ftqCb6VtlLeEGOpMWrKhP7ZU4omSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCqTq9Lnk4vb1JFYhOYAKuPpB9gy26gbCc1gKkjqYvE=;
 b=hOJy3AmWyTyr7RNlHhoEqX3HNW2+oBSmPbxb1aCTM0dYXfY5ZPFj0I1qocPhr8X1YhiQSixR0BbaSKPFPAXiKhaHjS5gBxP3mp9kdeQlmJGq6jGnqyObc6AprfF6kLl4m8FeC9FZiyMx6NNH63teRqOik7CT7kjD/M1vAiUHxYmihAqzUkZDh0DvLQLmoJJL7qv+zAwFHoCDl3YHoOqMFmr/AmYzfdh369EmhqOMVRfcu91G9TVtuv+NewyV6NbQRT3nF0rUcH4Gf1QIdPQCUPunB9VhXEFivCtV6SL2E//fVGm3tKGjhZjUOmjcCiqgP8c1mCJW6WDncf11KeJwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCqTq9Lnk4vb1JFYhOYAKuPpB9gy26gbCc1gKkjqYvE=;
 b=prCAenzE2+7yA+iij7jlxKGOsqTq61DY9uOSG27N1oSXdXPOZaHYJnci2g7bfsX+9U7lQ6NqDuu4cStTgmZv4nEGEYT3+mN7Bnl/m8wuP3WbCzUkMib9T+nJ4cN4/F+d5PkzYQbpv22kXGzrdJ2IA6w8wluQQQ87re/JevmpZuQ=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4592.prod.exchangelabs.com (2603:10b6:805:ef::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.19; Fri, 5 Feb 2021 14:26:42 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3825.025; Fri, 5 Feb 2021
 14:26:41 +0000
Date: Fri, 5 Feb 2021 09:26:30 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Detecting Faulting Instructions From Plugins
Message-ID: <YB1VljlPQPRRZUvc@strawberry.localdomain>
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
 <YBxnlZFkp7YA9PXL@strawberry.localdomain>
 <871rdupw3h.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871rdupw3h.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::21) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0226.namprd13.prod.outlook.com (2603:10b6:208:2bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend
 Transport; Fri, 5 Feb 2021 14:26:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6e9a0b2-d4ab-4311-14c3-08d8c9e20e7d
X-MS-TrafficTypeDiagnostic: SN6PR01MB4592:
X-Microsoft-Antispam-PRVS: <SN6PR01MB4592F7434AEA850B724AE79D8AB29@SN6PR01MB4592.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LdSAZKU0uhX83YgMLss0OPha3l44GF3ESw3P5xrPSqwXICVIc9vfMODr0RkFFwx01sYYCpKJnfoif8U/gSFWd7EUZOQCLaRlkFRuFE710C8DM7faT7mPHA5ym9v7mVJ75/J6g0ra8tk/zWrL0gYlHPnhtFcGr1ZMZWWu7oRD8NvixPfUJBH7yak7F6Eg4uSEKOOSxaJC8wAqF5wMjRMBfqZcr8OfEg7E8HkgC3fw1gYNbj8tr8mWqIT3YnXS3QGQk1B7thiN6I/3UiDiirwWhe8v4h4+D2cAoVEn2+q0xs866GtopkiPZ3k+OoRO5IywaTOh1lojs3xO9js30WyEbNCGDhw2gfLwxY38FylUJfw5u15GvuTYyKsjr6P0DgWsLbLBx9tmrp8CdowVSRuNQ5zCTbBYaIAS+WlrokwOoWkgBJfd5iWbRxSPNNga7CV7WIavsykCSkFcRabuM+L6w+6roQIYjDk4vdxqWLgV0x5y3+PI/85F2iLtilXTgX8KNA2Y5Ty+9uCtWqMe9sIZ0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(16526019)(9686003)(52116002)(66946007)(6506007)(66556008)(55016002)(478600001)(316002)(7696005)(66476007)(26005)(66574015)(86362001)(8936002)(8676002)(4326008)(2906002)(5660300002)(186003)(6916009)(6666004)(956004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?qlJOsnFNrM4fHkP5TlU476A4hOMDRvtSjoUgPEsHT/m+3yK1lMAz+9jBHR?=
 =?iso-8859-1?Q?fpd0vUT74cFXVtpzNzGmje/7hx0ijvynD8+jutjJ4ODEiU3CDyFlqIzxO6?=
 =?iso-8859-1?Q?in4xMTPgwB9ESOZgvOv33bYo/uWTLpxhCSbWUJ7S7jKCY5BR7gJG04xDr1?=
 =?iso-8859-1?Q?QblBgNHnm6dW0xnIpoIKZe3zFzZ3u81n4YSlm4U2FRsmlrJvGeEhmOMYSR?=
 =?iso-8859-1?Q?vSw20EBPf1Si8szArKis9oQKj2mIqx1nEc6PqmB5E99IxJ7wx7aY1d5wsl?=
 =?iso-8859-1?Q?2qg0vSFOk4bui7DFprNchaFAvjm7qMCZaDEc0N5+A9bgQOqi8f0FReJThq?=
 =?iso-8859-1?Q?MOtvPKiBw3fL+F+ReutTs43qqgCKuitzD2ZmtOG9VWtCiCvVOqJLv/dHTP?=
 =?iso-8859-1?Q?EwecIs2Wh7BiwC/8j/D3WdfXNPwIhYkbVHks+UoZmhByuaiQw1ASor2kRN?=
 =?iso-8859-1?Q?7mwzJlLLF1TIUZoWzFHG5njiBddiaFAZ2WkOjL12EwOY9gvh1V4UO9tAPN?=
 =?iso-8859-1?Q?Q91THvJflACxJUzYXkp3cYDwnEx+IJyHuor7UYkxWktSH0sGvH/Snq+F26?=
 =?iso-8859-1?Q?dyahQ5Vrps3fbeSQdqe5AugXcbq7Xh06T9yq7WvaB7YL0djCs5rjPDzUcb?=
 =?iso-8859-1?Q?i28ywtOE0keiJ8AtkYjlSs8j2uOLZ1Iqt4cMRMi3vU/EYQlfocR/5a/jqu?=
 =?iso-8859-1?Q?l2wbF3uesTvnNIQ/769vJeCtcLoYI5W/oP0DCBaczVpyWjZh2tQTFGmd1P?=
 =?iso-8859-1?Q?DKJHA1dElvP8j6c5nSlvn6aEtedrt7CKTF5v9FLGfN7b9CI1ZZYZgDxUyx?=
 =?iso-8859-1?Q?X1gb6ThukWV8fexJVGvI5NIPT0suYJ+d25O1JxmSlGTsLa8LgJTGuTts3I?=
 =?iso-8859-1?Q?vSgcrosk8YcrpUadz9VjWX8loNm1/nIYSOXA/2p94r4LvTLi3nNKn72Kmf?=
 =?iso-8859-1?Q?Z/Zb8EZomn/o5MS7QRLwWrQZvR8LtM2ZckirTmdXxDDPXTg5r3mUny/U7n?=
 =?iso-8859-1?Q?BIxAE71g3Z0NpsglgpXaNrWicBYlH/TpgK5nyK/BMqXz8QXD1rz+8bEmWX?=
 =?iso-8859-1?Q?j6nE2DCIMV4IdTzIvskp2trsDGSdqvh8gJZ1B0gupY04sPqv6bPo8uecqJ?=
 =?iso-8859-1?Q?JVTuznJg9oLuSBQ9ZMIQXgRy0wdkoPGgwlhnefewdPM0vkGcIgbnP+/UG5?=
 =?iso-8859-1?Q?GuSqKL2T0ZzjzoqnSuZMp2wU6QFepbY6lYxn9CM3yAQiAtRgAWedTKySKg?=
 =?iso-8859-1?Q?n2uTdEkk4F/DTnBNhTYf4Bz6h/lCMinf3GcGaLiCMIhx0sgLn+tzj7YBIf?=
 =?iso-8859-1?Q?myyZ4T0QDTTnCwJpWzOzQtfB0BmjbTCg/wT8cwBa9HWBJztBNe+TTi9odt?=
 =?iso-8859-1?Q?FC9UvFpldc?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e9a0b2-d4ab-4311-14c3-08d8c9e20e7d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:26:41.8383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2M6qEZRRyfpagr/6tEvgJVg0amGocx52CZzf/66vepVkBdgVqaoGxcyIzzWlypxulH1ITveVQbWPt94VuiueBYckHao/IEdPw4LSXv04ObM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4592
Received-SPF: pass client-ip=40.107.220.136;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Feb 05 11:19, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > For the below output, I've got a plugin which registers a callback via
> > `qemu_plugin_register_vcpu_insn_exec_cb` for each instruction executed.
> > I've enabled `-d in_asm` and added prints in my instruction execution
> > callback when it sees the opcode for the `ldr` instruction in question.
> > I'm running a local source build of the v5.2.0 release.
> >
> > Note in the output below the instruction at 0xffffdd2f1d4102c0 is
> > getting re-translated for some reason, and that two callbacks are made
> > to my function registered with qemu_plugin_register_vcpu_insn_exec_cb
> > (the "*** saw encoding"... output) for what should be one instruction
> > execution.
> 
> I wonder is that load accessing a HW location? I suspect what is
> happening is we detect a io_readx/io_writex when ->can_do_io is not
> true. As HW access can only happen at the end of a block (because it may
> change system state) we trigger a recompile of that instruction and try again.

I just added additional instrumentation, and
`qemu_plugin_hwaddr_is_io(hwaddr)` returns true in the mem_cb for this
access.

> > Do you have any tips for debugging this further or ideas for ensuring the
> > callback is called only once for this instruction?
> 
> If you also plant a memory callback you should only see one load
> happening for that instruction. Could you verify that?

Yes, I've verified there is only one load happening for the instruction,
and that the ordering of callbacks for this instruction is 1) first
insn_exec_cb, 2) second insn_exec_cb, 3) mem_cb.

Is there anything else you'd like me to check to validate your theory?

> > ----------------
> > IN:
> > 0xffffdd2f1d410250:  aa1e03e9  mov      x9, x30
> > 0xffffdd2f1d410254:  d503201f  nop
> > 0xffffdd2f1d410258:  a9bc7bfd  stp      x29, x30, [sp, #-0x40]!
> > 0xffffdd2f1d41025c:  910003fd  mov      x29, sp
> > 0xffffdd2f1d410260:  a90153f3  stp      x19, x20, [sp, #0x10]
> > 0xffffdd2f1d410264:  b000f2d3  adrp     x19, #0xffffdd2f1f269000
> > 0xffffdd2f1d410268:  911c4273  add      x19, x19, #0x710
> > 0xffffdd2f1d41026c:  a9025bf5  stp      x21, x22, [sp, #0x20]
> > 0xffffdd2f1d410270:  f000cad6  adrp     x22, #0xffffdd2f1ed6b000
> > 0xffffdd2f1d410274:  aa0003f5  mov      x21, x0
> > 0xffffdd2f1d410278:  f9409674  ldr      x20, [x19, #0x128]
> > 0xffffdd2f1d41027c:  913d42d6  add      x22, x22, #0xf50
> > 0xffffdd2f1d410280:  f9001bf7  str      x23, [sp, #0x30]
> > 0xffffdd2f1d410284:  91003297  add      x23, x20, #0xc
> > 0xffffdd2f1d410288:  91004294  add      x20, x20, #0x10
> > 0xffffdd2f1d41028c:  1400000d  b        #0xffffdd2f1d4102c0
> >
> > ----------------
> > IN:
> > 0xffffdd2f1d4102c0:  b94002e2  ldr      w2, [x23]
> > 0xffffdd2f1d4102c4:  12002441  and      w1, w2, #0x3ff
> > 0xffffdd2f1d4102c8:  710fec3f  cmp      w1, #0x3fb
> > 0xffffdd2f1d4102cc:  54fffe29  b.ls     #0xffffdd2f1d410290
> >
> > *** saw encoding 0xb94002e2 (@ 504107673 instructions)
> > ----------------
> > IN:
> > 0xffffdd2f1d4102c0:  b94002e2  ldr      w2, [x23]
> >
> > *** saw encoding 0xb94002e2 (@ 504107674 instructions)
> > ----------------
> > IN:
> > 0xffffdd2f1d4102c4:  12002441  and      w1, w2, #0x3ff
> > 0xffffdd2f1d4102c8:  710fec3f  cmp      w1, #0x3fb
> > 0xffffdd2f1d4102cc:  54fffe29  b.ls     #0xffffdd2f1d410290
> 
> I think you can work around this in your callback by looking for a
> double execution but that exposes rather more of the knowledge of what
> is going on behind the scenes than we intended for the plugin interface.
> The point is you shouldn't need to know the details of the translator to
> write your instruments.

Yes, working around it in that way was initial my thought as well. I
think there may be a few (albeit unlikely) corner cases this wouldn't
work correctly for - like self-branches. I don't think that's a major
roadblock for now, but I'd love to help work towards a cleaner solution
in the long-term.

> My initial thought is that maybe when we install the callbacks we should
> place them after translation if we know there is a guest load/store
> happening. However my concern is having such heuristics might miss other
> cases - could you see a load from HW indirect jump instruction for
> example? It also has the potential to get confusing when we add the
> ability to access register values.

Assuming you're right that TCG is detecting "a io_readx/io_writex when
->can_do_io is not true", could we detect this case when it occurs and
omit the instruction callbacks for the re-translation of the single
instruction (allow the initial callback to stand instead of trying to
turn back time, in a way, to prevent it)? Maybe there would have be some
bookkeeping in the plugin infrastructure side rather than entirely
omitting the callbacks when re-translating, in case that translation got
re-used in a case which didn't hit the same behavior and shouldn't be
skipped?

I admit I don't understand all the intricacies here, so what I suggest
may not be reasonable...

-Aaron

