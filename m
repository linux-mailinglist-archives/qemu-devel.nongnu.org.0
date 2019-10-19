Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7725CDD8D7
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 15:48:56 +0200 (CEST)
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLp6F-0001Ix-2D
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 09:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iLp4g-0000fw-Lp
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 09:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iLp4f-0008H2-L5
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 09:47:18 -0400
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:51978)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iLp4f-0008Du-FH
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 09:47:17 -0400
Received: from player796.ha.ovh.net (unknown [10.108.57.153])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 59B341AFB9F
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 15:47:07 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id C3959B080104;
 Sat, 19 Oct 2019 13:47:01 +0000 (UTC)
Subject: Re: qemu/powernv: coreboot support?
To: "Marty E. Plummer" <hanetzer@startmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20191018172622.kz4smemh5cwesfit@proprietary-killer>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <21ba3404-dcd3-fe06-7725-d58e249f9fd2@kaod.org>
Date: Sat, 19 Oct 2019 15:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018172622.kz4smemh5cwesfit@proprietary-killer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1430455833884265427
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkedugddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.172.75
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/2019 19:28, Marty E. Plummer wrote:
> Hello,
> 
> First off, thank you for the work you've done on the ppc64 support, it
> has been very useful. I'm currently working on a coreboot port for the
> talos ii line of systems (which means more ppc64 support, support
> specifically for the power9 sforza chip, and specific mainboard support.
> My plate is very full lol) and have been using qemu to debug the
> bootblock.
> 
> It has been very useful for that, but I'm now at the point where I need
> to jump to romstage, and that's where it gets tricky. qemu parses the rom
> image and looks for a ffs header, locates skiboot on it, and jumps straight
> to that. Not exactly ideal for debugging something not produced from op-build.

yes. I suppose you are using my branch powernv-4.2 which adds PNOR support
and a way to boot directly from PNOR. In that case, QEMU parses the PNOR
file to extract the PAYLOAD partition (skiboot). skiboot also detects the
flash and extract the kernel and initramfs from the PNOR.

However, you can bypass all this internal boot process by simply passing
a -bios option and not passing a MTD device.

I haven't published the PNOR support and the boot from PNOR yet. Lack
of time and because sPAPR is the priority.

> Do you think it would be within your wheelhouse to provide a generic, non-ffs
> pnor interface for loading arbitary rom images? 

I should probably send the PNOR patchset now so that we can discuss on 
a better way to satisfy all needs.  

> It would be of great help if
> you could. (This would still hopefully have the bmc support code as
> well, as I'm still needing to support a system using one).

We have support for Aspeed machines AST2400, AST2500 and AST2600. It 
is possible to interconnect them through the BT device. Or you can use
the IPMI BT simulator of QEMU on the PowerNV machine

Thanks,

C. 


