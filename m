Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA4264844
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 16:50:08 +0200 (CEST)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGNtn-00086j-V3
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 10:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kGNsw-0007Tt-QF; Thu, 10 Sep 2020 10:49:14 -0400
Received: from relay68.bu.edu ([128.197.228.73]:60302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kGNsr-00023D-UX; Thu, 10 Sep 2020 10:49:12 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 08AEleaM002547
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 10 Sep 2020 10:47:43 -0400
Date: Thu, 10 Sep 2020 10:47:40 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/4] hw/sd/sdhci: Strengthen multiple DMA transfers
Message-ID: <20200910144740.nw3t2wckxjro6b4l@mozz.bu.edu>
References: <20200903172806.489710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200903172806.489710-1-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 10:49:07
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.768, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Ruhr-University <bugs-syssec@rub.de>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I fuzzed the SDHCI with this applied. There are still bugs in SDHCI, but
this fixes the ones triggered by my initial bug-reproducers, and doesn't
appear to create any new bugs.

In the interest of incrementally fixing the issues, for this series:

Tested-by: Alexander Bulekov <alxndr@bu.edu>

On 200903 1928, Philippe Mathieu-Daudé wrote:
> Still trying to fix the bugs reported by Aleksander...
> 
> - Do not send 0 block count
> - Reduce DMA to MMIO re-entrancy by yielding when pending IRQ
> 
> Based-on: <20200901140411.112150-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (4):
>   hw/sd/sdhci: Stop multiple transfers when block count is cleared
>   hw/sd/sdhci: Resume pending DMA transfers on MMIO accesses
>   hw/sd/sdhci: Let sdhci_update_irq() return if IRQ was delivered
>   hw/sd/sdhci: Yield if interrupt delivered during multiple transfer
> 
>  hw/sd/sdhci.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> -- 
> 2.26.2
> 

