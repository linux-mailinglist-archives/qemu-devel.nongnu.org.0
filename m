Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8C23DA592
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 16:03:21 +0200 (CEST)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m96d6-0004Zu-FG
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 10:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m96bY-0003Pd-4u
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:01:44 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:48628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m96bW-00009e-GS
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:01:43 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D2EC22236C;
 Thu, 29 Jul 2021 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627567300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KuO8Ephm1bdE9jGWDqO3wwB/O4B1tnEZ38cO9joOTi0=;
 b=uEZ1TBVRagon5EoYrH6lHXjX+fv1y0AOD5kT7jkpiIaEzMIA+9vtafmU9632xiHM4BAciY
 gseLbs3v6KOhPT0t5xlM+nLvKb/GzwMFufp1CebrB7jUESR8zqf/j1CxiMgaanvBGyfyvB
 pAlO5rIcJnGwOqaKLwP8Cwc5Lm1cFgM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627567300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KuO8Ephm1bdE9jGWDqO3wwB/O4B1tnEZ38cO9joOTi0=;
 b=CLkcvUvGsonwIbeVoevQRdKdcguS8gRh5rSFxIRG/ByO/r+YIsJTE+avmI7sRMZGg9fwfI
 quKJ8vTYJYPm/6Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD02813ADD;
 Thu, 29 Jul 2021 14:01:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BiONKMS0AmEsEAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 29 Jul 2021 14:01:40 +0000
Subject: Re: [PATCH for-6.2 00/43] Unaligned accesses for user-only
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <128e21b5-da71-b1d2-c146-6d1038417786@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2cc67b80-5416-232a-e412-c78b3636e68e@suse.de>
Date: Thu, 29 Jul 2021 16:01:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <128e21b5-da71-b1d2-c146-6d1038417786@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/29/21 8:14 AM, Philippe Mathieu-Daudé wrote:
> On 7/29/21 2:46 AM, Richard Henderson wrote:
>> This began with Peter wanting a cpu_ldst.h interface that can handle
>> alignment info for Arm M-profile system mode, which will also compile
>> for user-only without ifdefs.  This is patch 32.
>>
>> Once I had that interface, I thought I might as well enforce the
>> requested alignment in user-only.  There are plenty of cases where
>> we ought to have been doing that for quite a while.  This took rather
>> more work than I imagined to start.
>>
>> So far only x86 host has been fully converted to handle unaligned
>> operations in user-only mode.  I'll get to the others later.  But
>> the added testcase is fairly broad, and caught lots of bugs and/or
>> missing code between target/ and linux-user/.
>>
>> Notes:
>>   * For target/i386 we have no way to signal SIGBUS from user-only.
>>     In theory we could go through do_unaligned_access in system mode,
>>     via #AC.  But we don't even implement that control in tcg, probably
>>     because no one ever sets it.  The cmpxchg16b insn requires alignment,
>>     but raises #GP, which maps to SIGSEGV.
>>
>>   * For target/s390x we have no way to signal SIGBUS from user-only.
>>     The atomic operations raise PGM_SPECIFICATION, which the linux
>>     kernel maps to SIGILL.
>>
>>   * I think target/hexagon should be setting TARGET_ALIGNED_ONLY=y.
>>     In the meantime, all memory accesses are allowed to be unaligned.
> 
> Now I better understand what you tried to explain me last with
> TCGCPUOps. Since Claudio was also involved, Cc'ing him (not asking
> for a review, just in case he wants to follow up).
> 

Thanks, what I understand from glancing through the thread is that
at the time we made handling of unaligned access a sysmmu-only TCGCPUOps,
while this series corrects that and implements unaligned accesses for user-only,

so seems good to me.

Ciao,

Claudio

