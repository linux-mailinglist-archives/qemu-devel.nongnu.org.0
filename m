Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58AE6508A1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 09:38:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7BeF-0001vK-Jl; Mon, 19 Dec 2022 03:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1p7BeD-0001tb-4j; Mon, 19 Dec 2022 03:37:21 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1p7BeA-0006J2-FH; Mon, 19 Dec 2022 03:37:20 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 383F45FB25;
 Mon, 19 Dec 2022 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671439035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dowq7wSc/L44cg36b3WmRU6zilRnAfGjvafq1GvVXQk=;
 b=Awz2G3bcCZNxvecRFHQirr/lJtbhgmWf21VCftdyS6YTZeAtZTUYF+ak/m8cXG+rg1mZcR
 gpLbkrCdb/X5TTZARLR7gO7pUo+8+RWB0T36o5i80R/akDvkqpzPg9nMbCdVNbXzhRGXm3
 QxgTxhHevZfIOIfxqcwb060wDtHaO0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671439035;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dowq7wSc/L44cg36b3WmRU6zilRnAfGjvafq1GvVXQk=;
 b=YWp3sEQM3zQAWfPHqUAW4Vc70LTlz7lfJabKpiBtWXOtcoIKpE0di9vzE6b+i97Kx2FR5V
 rO3sTMVihAAS2FBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCCA613498;
 Mon, 19 Dec 2022 08:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P/BdNLoioGNyEwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 19 Dec 2022 08:37:14 +0000
Message-ID: <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
Date: Mon, 19 Dec 2022 09:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 12/16/22 22:59, Alexander Graf wrote:
> Hi Claudio,
> 
> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific> 
> Alex

Hi Alex, Fabiano, Peter and all,

that was the plan but at the time of:

https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/

Peter mentioned that HVF AArch64 might use that code too:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html

so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".

I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?

Ciao,

Claudio


> 
>> Am 16.12.2022 um 22:37 schrieb Fabiano Rosas <farosas@suse.de>:
>>
>> ﻿From: Claudio Fontana <cfontana@suse.de>
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Cc: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>> Originally from:
>> [RFC v14 09/80] target/arm: only build psci for TCG
>> https://lore.kernel.org/r/20210416162824.25131-10-cfontana@suse.de
>> ---
>> target/arm/meson.build | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/meson.build b/target/arm/meson.build
>> index 87e911b27f..26e425418f 100644
>> --- a/target/arm/meson.build
>> +++ b/target/arm/meson.build
>> @@ -61,10 +61,13 @@ arm_softmmu_ss.add(files(
>>   'arm-powerctl.c',
>>   'machine.c',
>>   'monitor.c',
>> -  'psci.c',
>>   'ptw.c',
>> ))
>>
>> +arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
>> +  'psci.c',
>> +))
>> +
>> subdir('hvf')
>>
>> target_arch += {'arm': arm_ss}
>> -- 
>> 2.35.3
>>


