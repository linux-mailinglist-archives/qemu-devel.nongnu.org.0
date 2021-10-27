Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C738243C6AC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 11:42:57 +0200 (CEST)
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mffSS-0007tx-O1
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 05:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mffQK-0006w4-9f
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:40:44 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mffQG-0001fK-93
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:40:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5148F756036;
 Wed, 27 Oct 2021 11:40:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 322B575603A; Wed, 27 Oct 2021 11:40:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 302B3748F58;
 Wed, 27 Oct 2021 11:40:37 +0200 (CEST)
Date: Wed, 27 Oct 2021 11:40:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/6] hw/sh4: Change debug printfs to traces
In-Reply-To: <f595e837-4245-1492-8abd-16dabdb06571@linaro.org>
Message-ID: <a942fa0-5cb6-b8ae-6dbe-47fc94db417@eik.bme.hu>
References: <cover.1635298341.git.balaton@eik.bme.hu>
 <031a5111bb1ef1e66fd8f05fbe4a5ecbbcb25396.1635298341.git.balaton@eik.bme.hu>
 <f595e837-4245-1492-8abd-16dabdb06571@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Oct 2021, Richard Henderson wrote:
> On 10/26/21 6:32 PM, BALATON Zoltan wrote:
>> +    trace_sh_serial("write", size, offs, val);
>>       switch (offs) {
>>       case 0x00: /* SMR */
>>           s->smr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0x7b : 0xff);
>> @@ -302,10 +298,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr 
>> offs,
>>               break;
>>           }
>>       }
>> -#ifdef DEBUG_SERIAL
>> -    printf("sh_serial: read offs=0x%02x val=0x%x\n",
>> -           offs, ret);
>> -#endif
>> +    trace_sh_serial("read ", size, offs, ret);
>
> I suggest two separate sh_serial_{read,write} tracepoints.

Thought about that but it's unlikely one would only want to trace one 
direction, more likely to want all access to the device. But if it's a 
requirement I can split this into separate _read and _write.

Regards,
BALATON Zoltan

