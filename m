Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD5449D180
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:12:50 +0100 (CET)
Received: from localhost ([::1]:40650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmmn-0006QU-Ef
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:12:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCmWf-00062i-C1; Wed, 26 Jan 2022 12:56:10 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:52843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCmWb-0000DT-II; Wed, 26 Jan 2022 12:56:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C25E3746369;
 Wed, 26 Jan 2022 18:55:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 80B8874634B; Wed, 26 Jan 2022 18:55:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7F6807456E3;
 Wed, 26 Jan 2022 18:55:39 +0100 (CET)
Date: Wed, 26 Jan 2022 18:55:39 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
In-Reply-To: <20220126164200.1048677-1-farosas@linux.ibm.com>
Message-ID: <d98af016-0a9-49d0-74b4-c59f26a4af6@eik.bme.hu>
References: <20220126164200.1048677-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 26 Jan 2022, Fabiano Rosas wrote:
> This handles the exception code for the 74xx family, i.e. 7400, 7410,
> 7440, 7445, 7450, 7455, 7457.
>
> This is another family that is quite well known, so it should be
> straight-forward as well.

I guess this is what may break VOF on pegasos2. Was Philippe's test case 
for this machine ever merged? (Although that may use the firmware ROM that 
was preferred as it tests more of the machine and may predate VOF so not 
sure it also tests with VOF.) The way to test it is this:

Get morphos demo ISO from https://www.morphos-team.net/morphos-3.15.iso
Extract boot.img from the root directory of the CD
Run QEMU as shown at http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos

(For debugging maybe enabling vof traces would give more info but it was 
a while so I don't remember the details any more.)

> Based on legoater/ppc-7.0

I could test when it's merged or when it applies on master but I don't 
usually test on branches. Did you verify it still works with pegasos2 or 
could you please make sure it won't break that use case?

Regards,
BALATON Zoltan

> Fabiano Rosas (8):
>  target/ppc: Introduce powerpc_excp_74xx
>  target/ppc: Simplify powerpc_excp_74xx
>  target/ppc: 74xx: Machine Check exception cleanup
>  target/ppc: 74xx: External interrupt cleanup
>  target/ppc: 74xx: Program exception cleanup
>  target/ppc: 74xx: System Call exception cleanup
>  target/ppc: 74xx: System Reset interrupt cleanup
>  target/ppc: 74xx: Set SRRs directly in exception code
>
> target/ppc/excp_helper.c | 175 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 175 insertions(+)
>
>

