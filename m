Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A701B33B51F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:54:01 +0100 (CET)
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnfU-0001wR-Nt
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLneQ-0001PR-DU
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:52:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:50966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLneO-0002RI-No
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:52:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29152AE15;
 Mon, 15 Mar 2021 13:52:51 +0000 (UTC)
Subject: Re: [PATCH 3/6] accel/tcg: Restrict tb_gen_code() from other
 accelerators
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-4-f4bug@amsat.org>
 <7359d7bd-ed7d-71ad-3610-b839c9c99fd5@suse.de>
 <d9e691d9-9e87-6a47-c06d-ce2376f370f8@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0baee669-a6c1-2e25-5272-c654689fe6b7@suse.de>
Date: Mon, 15 Mar 2021 14:52:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d9e691d9-9e87-6a47-c06d-ce2376f370f8@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Huacai Chen <chenhuacai@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 7:06 AM, Richard Henderson wrote:
> On 1/17/21 11:12 PM, Claudio Fontana wrote:
>> On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
>>> tb_gen_code() is only called within TCG accelerator,
>>> declare it locally.
>>
>> Is this used only in accel/tcg/cpu-exec.c ? Should it be a static function there?
> 
> Possibly, but there's a *lot* of code that would have to be moved.  For now,
> queuing a slightly modified version of the patch.
> 
>>> --- a/accel/tcg/user-exec.c
>>> +++ b/accel/tcg/user-exec.c
>>> @@ -28,6 +28,7 @@
>>>  #include "qemu/atomic128.h"
>>>  #include "trace/trace-root.h"
>>>  #include "trace/mem.h"
>>> +#include "internal.h"
> 
> Not needed by this patch.
> 
> 
> r~
> 

Hello,

resurrecting this, and in reference to its commit: "c03f041f128301c6a6c32242846be08719cd4fc3",

the name "internal.h" ends up polluting the include paths,
so that when working for example on s390x, including "internal.h" ends up including this instead of the file in target/s390x/.

I am not sure what exactly the right solution is, for this specific problem,
and if we should look at the include paths settings in detail,

but in my view calling files just "internal.h" or "internals.h" in general is not a good idea.

I can see two issues with this naming:

1) it describes nothing about the actual intended contents, other that they should be "internal".
Rather it would be better to know what the file is intended to contain, or we end up (as we end up) with very large files containing completely unrelated content.

2) we end up with clashes in our include paths if we are not super careful.

Probably in this case, the target/s390x/internal.h could be given another name (s390x-internal.h) and then split up in the future (there is a whole bunch of unrelated suff).

For accel/tcg/internal.h, maybe renaming it, or removing it altogether could both be good options?

Thanks,

Claudio


