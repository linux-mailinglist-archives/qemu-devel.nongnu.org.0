Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ADE3A2762
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:47:34 +0200 (CEST)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGLc-0000s3-LK
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lrGJp-0008Kb-2K; Thu, 10 Jun 2021 04:45:41 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:42458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lrGJn-0000Z9-9P; Thu, 10 Jun 2021 04:45:40 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8EC9C1FD60;
 Thu, 10 Jun 2021 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623314737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpsiTI52aiOKU/L8m5fxuw/FXDNR0B1dQwtJon8UWwo=;
 b=SsrNhZnJXkEcLCwzZSKIGk/bnMvOmzNKGBXm//n5R5MbXejxl6qRT384bML5s860+b+lHa
 ndYv5cpPNq1CSD107jtQ4SS4zYaal5v4HmyVYBSlAnOdrbQXlZUhVNk7ozlToEwFbIGqMa
 kYPdcVJuiiCnSPhhY7gATLsiQxuO2+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623314737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpsiTI52aiOKU/L8m5fxuw/FXDNR0B1dQwtJon8UWwo=;
 b=LFWlMQkQ4kKJ3gIww5FvtBR6bDo+PCwoYPxGkcbeTZ0Jrvg2LTTTAfSzQ7CdSSRa8zzJjR
 91AScBel19Vak/Dg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 593BF11A98;
 Thu, 10 Jun 2021 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623314737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpsiTI52aiOKU/L8m5fxuw/FXDNR0B1dQwtJon8UWwo=;
 b=SsrNhZnJXkEcLCwzZSKIGk/bnMvOmzNKGBXm//n5R5MbXejxl6qRT384bML5s860+b+lHa
 ndYv5cpPNq1CSD107jtQ4SS4zYaal5v4HmyVYBSlAnOdrbQXlZUhVNk7ozlToEwFbIGqMa
 kYPdcVJuiiCnSPhhY7gATLsiQxuO2+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623314737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpsiTI52aiOKU/L8m5fxuw/FXDNR0B1dQwtJon8UWwo=;
 b=LFWlMQkQ4kKJ3gIww5FvtBR6bDo+PCwoYPxGkcbeTZ0Jrvg2LTTTAfSzQ7CdSSRa8zzJjR
 91AScBel19Vak/Dg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id XbBUFDHRwWALIgAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 10 Jun 2021 08:45:37 +0000
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions,
 cpu-exceptions-aa64: new modules
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org>
 <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d62d06c3-5b14-56bc-c5a5-d5e960a9d7d7@suse.de>
Date: Thu, 10 Jun 2021 10:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/5/21 10:50 PM, Richard Henderson wrote:
> On 6/4/21 8:52 AM, Alex Bennée wrote:
>> diff --git a/target/arm/cpu-exceptions-aa64.h b/target/arm/cpu-exceptions-aa64.h
>> new file mode 100644
>> index 0000000000..64f800a15d
>> --- /dev/null
>> +++ b/target/arm/cpu-exceptions-aa64.h
>> @@ -0,0 +1,28 @@
>> +/*
>> + * QEMU AArch64 CPU Exceptions Sysemu code
>> + *
>> + * Copyright (c) 2012 SUSE LINUX Products GmbH
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version 2
>> + * of the License, or (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see
>> + *<http://www.gnu.org/licenses/gpl-2.0.html>
>> + */
>> +
>> +#ifndef CPU_EXCEPTIONS_AA64_H
>> +#define CPU_EXCEPTIONS_AA64_H
>> +
>> +#include "cpu.h"
>> +
>> +void arm_cpu_do_interrupt_aarch64(CPUState *cs);
>> +
>> +#endif /* CPU_EXCEPTIONS_AA64_H */
> 
> I don't see the point in the excessive replication of header files, for exactly 
> one declaration.  This is not the first example.
> 
> What's wrong with internal.h? 

Doesn't mean anything and leads to a mess of unrelated code.
I think we should be better at creating meaningful modules, instead of collections of unrelated functions.

Not defending this particular change, just answering your specific question.

Thanks,

C


> Or some other header that collects sysemu 
> specific declarations?
> 
> Also, "cpu.h" is not required by this declaration, as I've pointed out before.
> 
> 
> r~
> 


