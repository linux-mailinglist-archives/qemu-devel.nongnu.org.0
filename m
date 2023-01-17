Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B366E2DA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoHu-00083H-6a; Tue, 17 Jan 2023 10:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHoHs-00082u-6R; Tue, 17 Jan 2023 10:54:12 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHoHq-0000cz-JE; Tue, 17 Jan 2023 10:54:11 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 69BED20DFE9A;
 Tue, 17 Jan 2023 07:54:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 69BED20DFE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673970847;
 bh=iaogCjz4EChNGQHxe3+dtvz+b1SP29C1BnnwBTehryg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CVz2oFzkaL5NaVPOSuF2ktsTucl0PjDSQNcfibOXf1haE2SNd1wIc5JygtaS0V5hK
 dI67YciXx0h13hPPzKPQTpe1+tWVAdMPIAk1z/e2lqDN1kZL2GtvC4hZgujP4jM4Qk
 I8c2YRg9joSptXWa6QoKo04NswKqVREunhm7Pktc=
Message-ID: <f5af2eee-e04e-fadd-8bad-b9ec4a2a1998@linux.microsoft.com>
Date: Tue, 17 Jan 2023 16:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] hw/char/pl011: better handling of FIFO flags on LCR
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 pbonzini@redhat.com
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
 <20230106172851.2430-2-eiakovlev@linux.microsoft.com>
 <CAFEAcA-VkWjSO84dCmoeKaO0PEFydi7Bj2gXhBYDatGpuCuc_w@mail.gmail.com>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <CAFEAcA-VkWjSO84dCmoeKaO0PEFydi7Bj2gXhBYDatGpuCuc_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 1/17/2023 16:24, Peter Maydell wrote:
> On Fri, 6 Jan 2023 at 17:28, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
>> Current FIFO handling code does not reset RXFE/RXFF flags when guest
>> resets FIFO by writing to UARTLCR register, although internal FIFO state
>> is reset to 0 read count. Actual flag update will happen only on next
>> read or write to UART. As a result of that any guest that expects RXFE
>> flag to be set (and RXFF to be cleared) after resetting FIFO will just
>> hang.
>>
>> Correctly reset FIFO flags on FIFO reset. Also, clean up some FIFO
>> depth handling code based on current FIFO mode.
> This patch is doing multiple things at once ("also" in a
> commit message is often a sign of that) and I think it
> would be helpful to split it. There are three things here:
>   * refactorings which aren't making any real code change
>     (eg calling pl011_get_fifo_depth() instead of doing the
>     "if LCR bit set then 16 else 1" inline)


Yeah, tbh i also though i should do it..


>   * the fix to the actual bug
>   * changes to the handling of the FIFO which should in theory
>     not be visible to the guest (I think it now when the FIFO
>     is disabled always puts the incoming character in read_fifo[0],
>     whereas previously it would allow read_pos to increment all
>     the way around the FIFO even though we only keep one character
>     at a time).


That last part i don't understand. If by changes to the FIFO you are 
referring to the flags handling, then it will be visible to the guest by 
design, since that's what I'm fixing. Could you maybe explain that one 
again? :)


>
> Type 3 in particular is tricky and could use a commit message
> explaining what it's doing.
>
> I think the actual code changes are OK, but the FIFO handling
> change is a bit complicated and at first I thought it had
> introduced a bug.
>
> thanks
> -- PMM

