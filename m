Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFF22CD1FD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:03:35 +0100 (CET)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkkWT-0005kY-ME
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1kkkRU-0004aR-DM
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 03:58:24 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:41436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1kkkRR-0002kH-Q7
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 03:58:23 -0500
Received: from [192.168.1.83] (159.196.83.79.rev.sfr.net [79.83.196.159])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A574E21DCD;
 Thu,  3 Dec 2020 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1606985897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9KkarVROo1MlIwTyS0TMfm8Idl/fhKk3LMbYpbNXk8=;
 b=5KODJ+uzmvouzGP/yWwYVTPb1ZP5Xfdxznti9PhdluwTFH1tlbhDfCqleZskfTYmpbOfOo
 2z6alZtTqJ9d5xt9yfvmvC7CMnO0fy+aNA2dT2FLiS75iz4yPMrjk57QzlS4Td2xw671Qv
 oakKxuhb0YT1lm/hW6sK2QS0KM3t9D0=
Subject: Re: [PATCH-for 5.2?] hw/core/ressetable: fix reset count decrement
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202164055.30864-1-damien.hedde@greensocs.com>
 <6a34f2be-3467-b81a-956b-4472860e4d0b@amsat.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <24772fdf-eb83-b415-956f-52a0c056129c@greensocs.com>
Date: Thu, 3 Dec 2020 09:58:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6a34f2be-3467-b81a-956b-4472860e4d0b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, michael.peter@hensoldt-cyber.systems
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/20 6:10 PM, Philippe Mathieu-Daudé wrote:
> On 12/2/20 5:40 PM, Damien Hedde wrote:
>> The reset count was only decremented if the device was in a single
>> reset.
>>
>> Also move the decrement before calling the exit phase method to fix
>> problem of reset state evaluation during that call. Update the doc
>> accordingly.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> Fixes: 1905297 ("Zynq7000 UART clock reset initialization", 2020-11-23)
> 

> $ git show 1905297
> fatal: ambiguous argument '1905297': unknown revision or path not in the
> working tree.

I put Michael's bug number there. Should I put the incriminated commit
instead ?

> 
> Beside, typo ressetable -> resettable in subject.

Thanks,
Damien

Cc'ing michael new address too

> 
>> Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
>> --
>>
>> Hi all,
>>
>> While looking at the bug reported by Michael and his patch. I found another
>> bug. Apparently I forgot to decrement the reset count if there was several
>> reset at the same time.
>>
>> This patch fixes that.
>>
>> I also moved the place of the decrement: before calling the exit phase method.
>> it globally fixes Michael's reported bug, as I think it will avoid some boiler
>> plate code in every exit phase method we do.
>>
>> Only other place where the reset state is checked is in the
>> hw/char/cadence-uart.c so it does not have high impact.
>>
>> I'm not sure if this meets the condition for 5.2 as it changes a documented
>> feature. In that case we can just accept Michael solution and I'll fix the
>> rest later.
>>
>> Here's the pointer for the bug and michael's patch.
>> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05786.html
>> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg06105.html
>>
>> Damien

