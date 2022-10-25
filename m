Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E960C780
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:07:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFhU-0008OT-Tm; Tue, 25 Oct 2022 04:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onFVG-0007MW-5p
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:41:42 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onFVE-00068w-6K
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:41:41 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F42022062;
 Tue, 25 Oct 2022 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666687298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBA+UUNDI8z40mbtcgsHJYDh86QoDjYSNZssAbkyRqs=;
 b=R4LUTibpGSnzyr9FAO57Fp9DChIVlBfdO7R6Lza0QjDegahh9EdY9bsYSDeJspXArSF2jI
 9rjbK/UWLDIaEIpkcQv0o6xlYyVkXDa81OCikCn4u8uCpFI7k7SxEgslRiX0iPkdoANfLI
 5dXZ1S/U8YfWUqpLsV0TWDO2wAe/ibE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666687298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBA+UUNDI8z40mbtcgsHJYDh86QoDjYSNZssAbkyRqs=;
 b=HiQUvI8gI92ERXmqNWleQUSEYgG4JKHBTaoQ5R6CwBmsAq+Kui44h31rq5+we6QIiTs8Oo
 XWC3XXF9cuKV+yAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14286134CA;
 Tue, 25 Oct 2022 08:41:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vHROA0KhV2NWJgAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 25 Oct 2022 08:41:38 +0000
Message-ID: <9ed736ee-c9ca-0fb8-642a-1876e89b722a@suse.de>
Date: Tue, 25 Oct 2022 10:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 01/29] accel/tcg: Add restore_state_to_opc to TCGCPUOps
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-2-richard.henderson@linaro.org>
 <e1eb87ed-c43c-6dae-4beb-9d0a9907bce9@suse.de>
 <ab0e8b0f-be77-7947-244c-e542473206a7@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <ab0e8b0f-be77-7947-244c-e542473206a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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

On 10/24/22 17:15, Richard Henderson wrote:
> On 10/25/22 01:05, Claudio Fontana wrote:
>> On 10/24/22 15:24, Richard Henderson wrote:
>>> Add a tcg_ops hook to replace the restore_state_to_opc
>>> function call.  Because these generic hooks cannot depend
>>> on target-specific types, temporarily, copy the current
>>> target_ulong data[] into uint64_t d64[].
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   include/exec/exec-all.h       |  2 +-
>>>   include/hw/core/tcg-cpu-ops.h | 11 +++++++++++
>>>   accel/tcg/translate-all.c     | 24 ++++++++++++++++++++++--
>>>   3 files changed, 34 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> index e5f8b224a5..a772e8cbdc 100644
>>> --- a/include/exec/exec-all.h
>>> +++ b/include/exec/exec-all.h
>>> @@ -40,7 +40,7 @@ typedef ram_addr_t tb_page_addr_t;
>>>   #endif
>>>   
>>>   void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
>>> -                          target_ulong *data);
>>> +                          target_ulong *data) __attribute__((weak));
>>
>> Hi Richard, doesn't matter much since this is removed later on, but I wonder why the need for attribute weak here?
>> I don't see you overloading this function in later patches..
> 
> So that it can be undefined.  Otherwise I can't remove the existing symbol from each target.
> 
> 
> r~
> 
> 

Right - there is still the call to restore_state_to_opc in the else branch in the general code.

I wonder if checking for NULL would make sense in theory, I think that with both GCC and Clang the external declaration with attribute weak would make the function address evaluate to NULL,
so that could be a possible thing to exploit, but no matter.

Reviewed-by: Claudio Fontana <cfontana@suse.de>












