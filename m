Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A422A1ED38F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 17:39:42 +0200 (CEST)
Received: from localhost ([::1]:54526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgVUT-0006Tv-L9
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 11:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jgVTS-0005rt-RA
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 11:38:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jgVTQ-0003gG-Iz
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 11:38:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id ECE9674594E;
 Wed,  3 Jun 2020 17:38:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D0B20745712; Wed,  3 Jun 2020 17:38:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CEF0E7456F8;
 Wed,  3 Jun 2020 17:38:31 +0200 (CEST)
Date: Wed, 3 Jun 2020 17:38:31 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH] ati-vga: increment mm_index in ati_mm_read/write
In-Reply-To: <nycvar.YSQ.7.77.849.2006031952260.62159@xnncv>
Message-ID: <alpine.BSF.2.22.395.2006031727180.57649@zero.eik.bme.hu>
References: <20200603124732.1137892-1-ppandit@redhat.com>
 <20200603134404.xdb2koul7fatv4ez@sirius.home.kraxel.org>
 <nycvar.YSQ.7.77.849.2006031952260.62159@xnncv>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Ren Ding <rding@gatech.edu>, Yi Ren <c4tren@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanqing Zhao <hanqing@gatech.edu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Jun 2020, P J P wrote:
> +-- On Wed, 3 Jun 2020, Gerd Hoffmann wrote --+
> | Hmm, why modify mm_index?  Shouldn't we just check it is non-zero
> | before calling ati_mm_read/ati_mm_write?
>
>  if (s->regs.mm_index & BIT(31)) {
>     ...
>  } else {
>     ati_mm_write(s, s->regs.mm_index + addr - MM_DATA, data, size);
>  }
>
> Exit condition for recursion is to set (mm_index & BIT(31)), so recursion
> would continue even with non-zero values I think.

MM_INDEX and MM_DATA allows access to registers (or memory if BIT(31) is 
set) via only these two registers. This is called indexed access in docs. 
So it does not really make sense to allow access to these registers as 
well thus we can avoid infinite recursion. It's not meant to recurse until 
BIT(31) is set. I think you can do:

   if (s->regs.mm_index & BIT(31)) {
      ...
-  } else {
+  } else if (s->regs.mm_index >= BIOS_0_SCRATCH) {
      ati_mm_write(s, s->regs.mm_index + addr - MM_DATA, data, size);
   }

and do the same in ati_mm_read() as well.

Regards,
BALATON Zoltan

