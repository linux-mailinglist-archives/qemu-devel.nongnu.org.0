Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29BC4A2A9A
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:31:42 +0100 (CET)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbeX-0005kj-QM
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:31:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDbHT-0001wZ-R6; Fri, 28 Jan 2022 19:07:51 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:65323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDbHP-0006uK-9L; Fri, 28 Jan 2022 19:07:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 24217746324;
 Sat, 29 Jan 2022 01:07:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 00CAB74579D; Sat, 29 Jan 2022 01:07:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F39037456E3;
 Sat, 29 Jan 2022 01:07:42 +0100 (CET)
Date: Sat, 29 Jan 2022 01:07:42 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 00/11] target/ppc: powerpc_excp improvements [BookE] (6/n)
In-Reply-To: <20220128224018.1228062-1-farosas@linux.ibm.com>
Message-ID: <c9bb63f8-c2e8-31e5-fe24-b9923c2c1821@eik.bme.hu>
References: <20220128224018.1228062-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Jan 2022, Fabiano Rosas wrote:
> This series handles the BookE exception code.
>
> Tested the following machines/CPUs:
>
> == bamboo ==
> 440ep, 460ex, 440-xilinx-w-dfpu
>
> == sam460ex ==
> 440ep, 460ex, 440-xilinx-w-dfpu

What OS did you test with? Other than the 460ex may not make much sense 
on this board but checking it never hurts. If you only tried Linux kernel 
then something else to give more coverage could be the same MorphOS iso 
that used for pegasos2 which should also boot on sam460ex as shown here:

http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos

or the AROS iso further up that page that should also boot on sam460ex.

Regards,
BALATON Zoltan

> == mpc8544ds ==
> e500v1, e500v2
>
> == ppce500 ==
> e500mc, e5500, e6500
>
> About the remaining CPUs:
>
> - The 440x4 have been partially removed in the past. I sent a separate
>  patch removing what's left of it.
>
> - The 440x5 (440-xilinx) boots with the bamboo machine but it
>  segfaults in userspace (also in master).
>
> - The e200 is broken in master due to an assert in _spr_register (the
>  DSRR0/1 registers are being registered twice). After fixing that
>  QEMU crashes due to lack of IRQ controller (there's a TODO in the
>  init_proc_e200).
>
> Fabiano Rosas (11):
>  target/ppc: Introduce powerpc_excp_booke
>  target/ppc: Simplify powerpc_excp_booke
>  target/ppc: booke: Critical exception cleanup
>  target/ppc: booke: Machine Check cleanups
>  target/ppc: booke: Data Storage exception cleanup
>  target/ppc: booke: Instruction storage exception cleanup
>  target/ppc: booke: External interrupt cleanup
>  target/ppc: booke: Alignment interrupt cleanup
>  target/ppc: booke: System Call exception cleanup
>  target/ppc: booke: Watchdog Timer interrupt
>  target/ppc: booke: System Reset exception cleanup
>
> target/ppc/excp_helper.c | 228 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 228 insertions(+)
>
>

