Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A83DB6A7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 12:03:57 +0200 (CEST)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9PMy-0006p0-CN
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 06:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m9PLT-0005m8-Nv
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:02:23 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:58312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m9PLS-0004v2-2E
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:02:23 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4A1012021F;
 Fri, 30 Jul 2021 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627639339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJOBBgq/Ja64YNHffuXZgtClx9XoN1q0wtt4kyjrPxY=;
 b=h2jqPh3yPeDALpDUJYg99nQot73+ZLkNM+5GP2VYr3RRP6Q+mDKXnzTFHlUtIoI32gDS6U
 j6ga2+x00NTjis0ulnQQhPFEzsA3I1vtOwfiz3pwbS7oaflDWo5oDh8RYvtFsAzjsxmi+n
 jja/PiqlymHeoHKE9NzuIpp7LmHxHlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627639339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJOBBgq/Ja64YNHffuXZgtClx9XoN1q0wtt4kyjrPxY=;
 b=8pidpSRq5PQeBAQnPtsnipSNYFCB4vEPx1mg7oma4eU+HacsSdUA9xpVCPr2QKWExUST8O
 J7SDkht82kApmHBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D29513C02;
 Fri, 30 Jul 2021 10:02:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bB8vASvOA2GTQgAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 30 Jul 2021 10:02:19 +0000
Subject: Re: modular tcg
To: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
 <80e5ceaf-a425-2343-ef2e-d33b6ff87389@redhat.com>
 <20210730090538.ypohhzrd4nzqngk6@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <9d4a9fde-2fd4-a7d3-4d8a-62a29ccc28d0@suse.de>
Date: Fri, 30 Jul 2021 12:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210730090538.ypohhzrd4nzqngk6@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
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
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 11:05 AM, Gerd Hoffmann wrote:
>   Hi,
> 
> On Thu, Jul 29, 2021 at 06:40:17PM +0200, Paolo Bonzini wrote:
>> On 29/07/21 11:14, Gerd Hoffmann wrote:
>>> The common functions could be added TCGCPUOps to allow them being called via
>>> CPUClass->tcg_ops->$name instead of a direct symbol reference.  Not sure this
>>> is a good idea though.  Experimental patch covering tcg_exec_realizefn +
>>> tcg_exec_unrealizefn below.
>>
>> A lot of these (though probably not all) are already stubbed out as "static
>> inline" in include/exec/exec-all.h.  I think they can be changed to function
>> pointers in the style of ui/spice-module.c (accel/tcg/tcg-module.c?).
> 
> Yep, was thinking about that too.  But then I noticed we already have
> TCGCPUOps and wondered whenever extending that would be the better
> option.

I'd read TCGCPUOps as TCG CPU-specific Operations in this case,
IIRC they are for the TCG Operations that have cpu target-specific behavior.

Maybe they should be called TCGCPUTargetOps to avoid confusion?

So, a TCGCPUOps will have an arm implementation, x86 implementation and so on.

In my view tcg_exec_realizefn does not fit, as this is just a set of additional
generic non-target-specific operations for the generic cpu_exec_realizefn() that needs to be called specifically and only for TCG.


> 
>>> No idea yet how to handle arch-specific bits best.  Seems there is no existing
>>> infrastructure to untangle target-specific code and tcg, so this probably needs
>>> something new.
>>
>> If they are few enough, I would just move them out of target/i386/tcg and
>> into target/i386/cpu-sysemu.c.
> 
> I'll have a look.
> 
>>> Noticed softmmu/physmem.c has lots of CONFIG_TCG #ifdefs, splitting this into
>>> softmmu/physmem-{common,tcg}.c is probably a good idea.
>>
>> I only count one, and those function should be easily moved  to
>> accel/tcg/cputlb.c (after all both physmem.c and cputlb.c used to be a
>> single file, exec.c, so this is just an oversight).
> 
> Well, I noticed one larger block covering multiple functions, didn't
> check the whole file ...
> 
> thanks & take care,
>   Gerd
> 


