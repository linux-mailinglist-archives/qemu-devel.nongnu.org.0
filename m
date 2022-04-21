Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBBC50AB25
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 00:02:44 +0200 (CEST)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhest-0001AC-DQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 18:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nherL-0007xS-Id; Thu, 21 Apr 2022 18:01:07 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:61048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nherI-0001oV-MP; Thu, 21 Apr 2022 18:01:06 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 97CE274637A;
 Fri, 22 Apr 2022 00:00:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7B806746353; Fri, 22 Apr 2022 00:00:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 788B374632B;
 Fri, 22 Apr 2022 00:00:59 +0200 (CEST)
Date: Fri, 22 Apr 2022 00:00:59 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/6] scsi-disk: add MODE_PAGE_APPLE quirk for Macintosh
In-Reply-To: <1f26c28f-dd80-cadb-d308-56c9a91bea2f@linaro.org>
Message-ID: <d98967a-4521-591f-f7b-d6c12eed353a@eik.bme.hu>
References: <20220421065155.31276-1-mark.cave-ayland@ilande.co.uk>
 <20220421065155.31276-4-mark.cave-ayland@ilande.co.uk>
 <20220421132746.GA1500162@fam-dell>
 <e6d29d64-fe3b-8d4b-3985-146c11bfd537@ilande.co.uk>
 <1f26c28f-dd80-cadb-d308-56c9a91bea2f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022, Richard Henderson wrote:
> On 4/21/22 08:29, Mark Cave-Ayland wrote:
>>> You need (1 << SCSI_DISK_QUIRK_MODE_PAGE_APPLE) instead.
>> 
>> Doh, you're absolutely right. I believe the current recommendation is to 
>> use the BIT() macro in these cases.

I think it's not a recommendation (as in code style) but it often makes 
things simpler by reducing the number of parenthesis so using it is 
probably a good idea for readability. But if you never need the bit number 
only the value then you could define the quirks constants as that in the 
first place. (Otherwise if you want bit numbers maybe make it an enum.)

> We probably need to fix BIT() to use 1ULL.
>
> At present it's using 1UL, to match the other (unfortunate) uses of unsigned 
> long within bitops.h.  The use of BIT() for things unrelated to bitops.h just 
> bit a recent risc-v pull request, in that it failed to build on all 32-bit 
> hosts.

There's already a BIT_ULL(nr) when ULL is needed but in this case quirks 
was declared uint32_t so probably OK with UL as well. (Was this bitops.h 
taken from Linux? Keeping it compatible then may be a good idea to avoid 
confusion.)

Regards,
BALATON Zoltan

