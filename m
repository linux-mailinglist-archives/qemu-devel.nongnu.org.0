Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82215610BF3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 10:12:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooKSb-00058K-C4; Fri, 28 Oct 2022 04:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ooKSD-0004oU-Qv
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:11:07 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ooKS9-0003OD-CM
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:10:59 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC31D21A59;
 Fri, 28 Oct 2022 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666944655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pqzn2sU9MHTp5DUQKz8+E2SIdHmN203AtXzk1vOrAo=;
 b=wJFoC6xst/Cd+Bf+bimrqYLhvkJhUEDTuyDZg/Y+SU+7dO19Skl5ZH6VZ7Slc6fgb/KuHo
 s2Cz2X4nQouRYm8cRHh+WrA4/OxH5dNw6pkq6BurYZMHHUOiElAV76uai2tnztx5es+i5P
 4CUzPb6XyiaXRGQ7/qQ+LMV8EQpXF1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666944655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pqzn2sU9MHTp5DUQKz8+E2SIdHmN203AtXzk1vOrAo=;
 b=YK6Xi2gjUP4zrGL6u58k+fXZRicesMjgeW0rKUGGZsc+ghzdMv27NtZNJZNyg9hTdnFJ1t
 FnYgJwHsR0AU2EBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C10CF13A6E;
 Fri, 28 Oct 2022 08:10:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZqkvLY+OW2MvcgAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 28 Oct 2022 08:10:55 +0000
Message-ID: <dbe1f618-6176-46fd-a7cb-22f714dc25e5@suse.de>
Date: Fri, 28 Oct 2022 10:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/6] target/i386: Use cpu_unwind_state_data for tpr
 access
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221027100254.215253-1-richard.henderson@linaro.org>
 <20221027100254.215253-3-richard.henderson@linaro.org>
 <9705b542-d81b-5299-9aba-098dc335d5ef@suse.de>
 <dd3250c2-b6c3-cb7b-142e-ee4a69c0b1e4@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <dd3250c2-b6c3-cb7b-142e-ee4a69c0b1e4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/27/22 22:13, Richard Henderson wrote:
> On 10/27/22 22:22, Claudio Fontana wrote:
>> On 10/27/22 12:02, Richard Henderson wrote:
>>> +    /* Per x86_restore_state_to_opc. */
>>> +    if (TARGET_TB_PCREL) {
>>> +        return (env->eip & TARGET_PAGE_MASK) | data[0];
>>> +    } else {
>>> +        return data[0] - env->segs[R_CS].base;
>>
>> here we switch from taking cs_base from the TranslationBlock to taking it from env-> .
>>
>> I traced the tb->cs_base use back to
>>
>> cpu_exec() and cpu_exec_step_atomic()
>>
>> and from there it seems ok, as the sequence is
>>
>> cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags), which gets it from env,
>>
>> followed by
>>
>> tb_gen_code(...cs_base) which sets the TranslationBlock cs_base, and tb->cs_base does
>> not seem to change again.
> Correct.  I wondered if I'd made a mistake by not returning the TB located during the 
> search, but it doesn't seem to have mattered for the two users.
> 
>> I mention this in the case there can be some weird situation in which env and tb can
>> end up not being consistent, does a TranslationBlock that is initialized with a certain
>> cs_base from the env that contains user code to load / change the CS segment base
>> potentially constitute a problem?
> The only way to load/change a CS segment base is a branch instruction, which will of 
> course end the TB.  There should be no way to change CS that continues the TB.
> 
> 
> r~

Reviewed-by: Claudio Fontana <cfontana@suse.de>

