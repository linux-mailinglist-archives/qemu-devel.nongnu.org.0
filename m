Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAC43ABD8B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 22:36:41 +0200 (CEST)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltykh-0008Aj-UK
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 16:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ltyjN-0006p1-C6; Thu, 17 Jun 2021 16:35:17 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:44606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ltyjI-0005vY-QU; Thu, 17 Jun 2021 16:35:17 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C2961FDDE;
 Thu, 17 Jun 2021 20:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623962110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gALxrBprrngFa9FVDsVZgfzgcaS8rM1zYV9nTR88YhE=;
 b=Yfas6YPw0StSh/mxqVdISMvg39L3DTKZvOqXjduTYgll5dHz12eJ2eWuo6zrd3VTGprM6U
 u9LuNKGTdO3jhV2dPpi9EF+LwUqbT2WV3zkYESVh2y/lNkuHiWaC+oCjJgxNzLyd0uOjdE
 WWlvFfAcoHEnC09tx/JpRgNHenooNqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623962110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gALxrBprrngFa9FVDsVZgfzgcaS8rM1zYV9nTR88YhE=;
 b=4kzixqtb7B8NpL2zF1jG4JNWzt8fb9bOFlZkZwuob1RXg4s7pc+48OXtAgILSsxORU5vNT
 gnnewgfUmGuptwDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C5E95118DD;
 Thu, 17 Jun 2021 20:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623962110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gALxrBprrngFa9FVDsVZgfzgcaS8rM1zYV9nTR88YhE=;
 b=Yfas6YPw0StSh/mxqVdISMvg39L3DTKZvOqXjduTYgll5dHz12eJ2eWuo6zrd3VTGprM6U
 u9LuNKGTdO3jhV2dPpi9EF+LwUqbT2WV3zkYESVh2y/lNkuHiWaC+oCjJgxNzLyd0uOjdE
 WWlvFfAcoHEnC09tx/JpRgNHenooNqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623962110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gALxrBprrngFa9FVDsVZgfzgcaS8rM1zYV9nTR88YhE=;
 b=4kzixqtb7B8NpL2zF1jG4JNWzt8fb9bOFlZkZwuob1RXg4s7pc+48OXtAgILSsxORU5vNT
 gnnewgfUmGuptwDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id VDqlLv2xy2CcDwAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 17 Jun 2021 20:35:09 +0000
Subject: Re: [PATCH v16 43/99] target/arm: move a15 cpu model away from the
 TCG-only models
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-44-alex.bennee@linaro.org>
 <51fbcf63-a205-8848-95f7-b2c7e74754a9@linaro.org> <87v96ce5e0.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5710327c-79c4-2feb-2876-3f31ec045e0d@suse.de>
Date: Thu, 17 Jun 2021 22:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87v96ce5e0.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.254,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 8:01 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/4/21 8:52 AM, Alex Bennée wrote:
>>> From: Claudio Fontana<cfontana@suse.de>
>>> Cortex-A15 is the only ARM cpu class we need in KVM too.
>>> We will be able to move it to tcg/ once the board code and
>>> configurations
>>> are fixed.
>>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>>> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
>>> ---
>>>   target/arm/cpu32.h   |  4 +++
>>>   target/arm/cpu32.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++
>>>   target/arm/cpu_tcg.c | 67 ----------------------------------------
>>>   3 files changed, 77 insertions(+), 67 deletions(-)
>>
>> I don't follow this one.  Why would kvm, which is 64-bit only, require
>> a 32-bit only cpu?
>>
>> I guess I can accept that our board configurations are old and
>> fragile, and I realize there are already 99 bottles of beer on^W^W^W^W
>> patches here, but what needs to happen to fix this properly?
> 
> I'll drop this and fix whatever we need to. 32 bit ARM KVM is listed in
> removed-features so I think we are good.

Problem is, if I recall correctly, that the virt board currently requires an a15 to exist.

> 
>>
>> I guess I can give it an
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> if it helps us move forward.
>>
>>
>> r~
> 
> 


