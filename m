Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2106F4650
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:47:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrH4-0005hN-5w; Tue, 02 May 2023 10:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ptrH1-0005gm-87; Tue, 02 May 2023 10:46:35 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ptrGz-0002ht-Nc; Tue, 02 May 2023 10:46:35 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4D3621E4B;
 Tue,  2 May 2023 14:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683038791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jpUI0UuBX6RKiAG/eehicu4BO7uQOcgXZAaG0E6DTnI=;
 b=TVrMi58whwxE0KtaYHLL6RjF6hp6GjloaodmogJVBCSQw7+UBfPZHB40l+PnD5gFiFhEXp
 P6jJ00Mgl4PugkS5jEvBBfe/QsOPghrF+Z4kEWfyDkEafvBQ3oBJNh3M5eZVE959fJzMjk
 rrrOAYzWKju0T66Gkzyhec7Ukp6kTnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683038791;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jpUI0UuBX6RKiAG/eehicu4BO7uQOcgXZAaG0E6DTnI=;
 b=zRMFn8JxTFmpIgnVTN9ES4TbOh9b1HDk7jUqxm+Tna93cto6gIJ38f8xHZvIVn86MRtHv0
 /lcBN/W3Q5D0fcBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D280139C3;
 Tue,  2 May 2023 14:46:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e2rdAUciUWTrCgAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 02 May 2023 14:46:31 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora
 <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
Subject: Re: [PATCH v2 1/4] ppc: spapr: cleanup cr get/store in
 [h_enter|spapr_exit]_nested with helpers.
In-Reply-To: <CSBVBHXUFNTB.V3R66Q201OGP@wheely>
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-2-harshpb@linux.ibm.com>
 <CSBII1VGPEQB.3Q8OP9FELWTC3@wheely>
 <f4810103-78ce-eb5b-4d43-b9268b9aa745@linux.ibm.com>
 <CSBVBHXUFNTB.V3R66Q201OGP@wheely>
Date: Tue, 02 May 2023 11:46:28 -0300
Message-ID: <87sfceiyez.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

"Nicholas Piggin" <npiggin@gmail.com> writes:

> On Tue May 2, 2023 at 3:00 PM AEST, Harsh Prateek Bora wrote:
>>
>>
>> On 5/2/23 10:07, Nicholas Piggin wrote:
>> > On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
>> >> The bits in cr reg are grouped into eight 4-bit fields represented
>> >> by env->crf[8] and the related calculations should be abstracted to
>> >> keep the calling routines simpler to read. This is a step towards
>> >> cleaning up the [h_enter|spapr_exit]_nested calls for better readability.
>> >>
>> >> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
>> >> Reviewed-by: Fabiano Rosas <farosas@suse.de>
>> >> ---
>> >>   hw/ppc/spapr_hcall.c | 18 ++----------------
>> > 
>> > Could you either convert all callers, or do implementation and
>> > conversion as separate patches. Preference for former if you can
>> > be bothered.
>> > 
>> > save_user_regs(), restore_user_regs(), gdb read/write register * 2,
>> > kvm_arch_get/put_registers, monitor_get_ccr, at a quick glance.
>>
>> Sure, I can include other consumers as well in the patches.
>> I usually prefer separate patches for implementation/conversion but 
>> since the implementation is a small change, I hope either approach is fine.
>
> Yeah one patch would be fine.
>
>>
>> > 
>> >>   target/ppc/cpu.c     | 17 +++++++++++++++++
>> >>   target/ppc/cpu.h     |  2 ++
>> >>   3 files changed, 21 insertions(+), 16 deletions(-)
>> >>
>> >> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> >> index ec4def62f8..124cee5e53 100644
>> >> --- a/hw/ppc/spapr_hcall.c
>> >> +++ b/hw/ppc/spapr_hcall.c
>> > 
>> > [snip]
>> > 
>> >> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
>> >> index 1a97b41c6b..3b444e58b5 100644
>> >> --- a/target/ppc/cpu.c
>> >> +++ b/target/ppc/cpu.c
>> >> @@ -67,6 +67,23 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
>> >>       return env->vscr | (sat << VSCR_SAT);
>> >>   }
>> >>   
>> >> +void ppc_store_cr(CPUPPCState *env, uint64_t cr)
>> > 
>> > Set is normal counterpart to get. Or load and store, but
>> > I think set and get is probably better.
>> > 
>> Sure, make sense.
>
> I did say that before realising the other functions there use as
> much varied and inconsistent terminology as possible, sigh.
>
> I *think* ppc_get|set_reg() is the best naming. store is used a lot but
> it means something else too, so set is better. But if you have strong
> feelings another way I don't mind.
>

+1 for get/set

Best to save load/store for the code emulating the actual guest ld/st
instructions.


