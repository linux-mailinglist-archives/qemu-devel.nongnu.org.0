Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86158330D1C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:07:31 +0100 (CET)
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEfa-0001Na-JD
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJEds-0000oO-8o
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:05:44 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45170
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJEdq-0007Uq-IE
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:05:44 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJEdo-00047Y-HV; Mon, 08 Mar 2021 12:05:40 +0000
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210307202607.27745-1-mark.cave-ayland@ilande.co.uk>
 <20210307202607.27745-3-mark.cave-ayland@ilande.co.uk>
 <301be535-ae3f-4c09-3be5-8efc4c799ea1@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8ad5dc28-15e8-0759-585f-b3ec8e9abfab@ilande.co.uk>
Date: Mon, 8 Mar 2021 12:05:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <301be535-ae3f-4c09-3be5-8efc4c799ea1@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/2] target/m68k: add M68K_FEATURE_NO_DALIGN feature
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2021 01:03, Richard Henderson wrote:

> On 3/7/21 12:26 PM, Mark Cave-Ayland wrote:
>> According to the M68040UM Appendix D the requirement for data accesses to be
>> word aligned is only for the 68000, 68008 and 68010 CPUs. Later CPUs from the
>> 68020 onwards will allow unaligned data accesses but at the cost of being less
>> efficient.
>>
>> Add a new M68K_FEATURE_NO_DALIGN feature to specify that data accesses are not
>> required to be word aligned, and don't perform the alignment on the stack
>> pointer when taking an exception if this feature is not selected.
> 
> How about a positive, rather than negative name, like M68K_FEATURE_UNALIGNED_DATA?

Sure - I'll update that, and send out a v2.

> This points out that we should be raising Address Error without this feature. This 
> requires a moderate amount of cleanup in translate, manipulating MO_ALIGN{,_2} as 
> part of the MemOp parameter to tcg_gen_qemu_{ld,st}_i32.

That's probably true, although all the images I have here for testing are for 040 
CPUs only. There is another set of m68k fixes I'd like to get in before freeze which 
also affect Linux, so those are next on my priority list.

I'll send out v2 tentatively with Laurent's R-B tags added, and then leave it to 
others to decide whether detecting alignment errors can be done as a follow-up later 
(certainly with the last patch there should be no regression).


ATB,

Mark.

