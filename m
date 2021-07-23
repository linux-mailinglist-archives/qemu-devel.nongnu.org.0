Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B003D395A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:21:49 +0200 (CEST)
Received: from localhost ([::1]:35762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6tFU-0007o8-P9
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6tEb-00075t-MM
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:20:53 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6tEZ-0003Md-VI
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:20:53 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DB2F1FF91;
 Fri, 23 Jul 2021 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627039250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PlivnqMbsAq6j1vxiHNv+Td28TjnSv5M8xiI53MWfo=;
 b=Hvk7eqSvVC/5S0LtpEPCVe/aP/lABEDrkLZE8C3IZHkzLBPs9sL+752nh3lukmDdFGfSAL
 Qfg51WXE1pa8PkKHsy0xAUq3I9VpgBbmJaNRxNPVk7Wjhs+Ws5vz4vCbgtRc52fV5VDwFP
 WQfjk/ZMwZnm2axGbEIjhs3dfa634w0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627039250;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PlivnqMbsAq6j1vxiHNv+Td28TjnSv5M8xiI53MWfo=;
 b=pJQcQ9ZPFFpwIM9FkplcgX4otGNA4wgII5+TRVnhicIW5AIXviV/MsU6PJx47PISF5BkiG
 OuRzwcFAgesUDDCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F267E13E02;
 Fri, 23 Jul 2021 11:20:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IQAmORGm+mCTGgAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Jul 2021 11:20:49 +0000
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
Date: Fri, 23 Jul 2021 13:20:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 11:52 AM, Gerd Hoffmann wrote:
>>> -    g_assert(ops != NULL);
>>> +    if (ops == NULL) {
>>> +        exit(1);
>>> +    }
>>> +
>>
>>
>> Ah, again, why?
>> This change looks wrong to me, 
>>
>> the ops code should be present when ops interfaces are initialized:
>> it should be a code level assertion, as it has to do with the proper order of initializations in QEMU,
>>
>> why would we want to do anything else but to assert here?
>>
>> Am I blind to something obvious?
> 
> Building tcg accel ops modular moves that from coding error to possible
> user error (user wants use tcg but has qemu-accel-tcg-$arch.rpm not
> installed).

Sorry but without more background I don't buy it.

If ops is null at the time accel_init_interfaces is called,
it means that we are trying to initialize the board (for softmmu)
with an accelerator already selected, and without an accelerator actually available.

The problem has happened already a long time before we get here.

When we check for viable accelerators, in configure_accelerators,
we should check that the code is actually there, before choosing it as a viable accelerator.

If we march on and start initializing the machine with an accelerator that is not available,
of course things will start failing left and right.

If things like:

bool have_tcg = accel_find("tcg");

return true when the code is actually not there, there seems to be a larger issue to solve.

I think we need to think more broadly about this.

Thanks,

Claudio


> 
> The second part of the patch makes qemu print a message on the failed
> module load, so the user would have a chance to figure where the assert
> comes from, but replacing the assert with a more friendly message still
> makes sense to me.
> 
> take care,
>   Gerd
> 


