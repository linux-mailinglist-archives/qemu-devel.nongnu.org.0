Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9236694E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 12:35:55 +0200 (CEST)
Received: from localhost ([::1]:47354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZAD4-0008MF-4R
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 06:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lZABJ-0007G0-39
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:34:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56368
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lZABH-00087d-8H
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:34:04 -0400
Received: from host86-132-83-131.range86-132.btcentralplus.com
 ([86.132.83.131] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lZABW-00013I-TK; Wed, 21 Apr 2021 11:34:19 +0100
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210417140206.673885-1-f4bug@amsat.org>
 <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
 <67955dd0-dfc7-271f-009f-cf7247f3b6c2@amsat.org>
 <efea7689-15c6-44bf-77a8-3d6ee945d097@ilande.co.uk>
 <916b95b2-c128-69e0-6e68-78daa0b15722@amsat.org>
 <20210420205933.GF4440@xz-x1>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <3329a158-75ce-925e-5a23-830dd2397ca1@ilande.co.uk>
Date: Wed, 21 Apr 2021 11:33:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210420205933.GF4440@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.83.131
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] memory: Directly dispatch alias accesses on origin
 memory region
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2021 21:59, Peter Xu wrote:

>>> I agree with this sentiment: it has taken me a while to figure out what
>>> was happening, and that was only because I spotted accesses being
>>> rejected with -d guest_errors.
>>>
>>>  From my perspective the names memory_region_dispatch_read() and
>>> memory_region_dispatch_write() were the misleading part, although I
>>> remember thinking it odd whilst trying to use them that I had to start
>>> delving into sections etc. just to recurse a memory access.

> I think it should always be a valid request to trigger memory access via the MR
> layer, say, what if the caller has no address space context at all?

For these cases you can just use the global default address_space_memory which is the 
solution I used in the second version of my patch e.g.

     val = address_space_ldl_be(&address_space_memory, addr, attrs, &r);

> From the
> name of memory_region_dispatch_write|read I don't see either on why we should
> not take care of alias mrs.  That's also the reason I'd even prefer this patch
> rather than an assert.

The problem I see here is that this patch is breaking the abstraction between 
generating the flatview from the memory topology and dispatching a request to it.

If you look at the existing code then aliased memory regions are de-referenced at 
flatview construction time, so you end up with a flatview where each range points to 
a target (leaf or terminating) memory region plus offset. You can see this if you 
compare the output of "info mtree" with "info mtree -f" in the monitor.

This patch adds a "live" memory region alias de-reference at dispatch time when this 
should already have occurred as the flatview was constructed. I haven't had a chance 
to look at this patch in detail yet but requiring this special case just for 
de-referencing the alias at dispatch time seems wrong.

Given that the related patch "memory: Initialize MemoryRegionOps for RAM memory 
regions" is also changing the default mr->ops for ram devices in a commit originally 
from 2013 then this is another hint that the dispatch API is being used in a way in 
which it wasn't intended.


ATB,

Mark.

