Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E6650AE0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:43:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7EXJ-0004M2-Rl; Mon, 19 Dec 2022 06:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7EXF-0004LH-CX; Mon, 19 Dec 2022 06:42:21 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7EXD-0004nH-80; Mon, 19 Dec 2022 06:42:20 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 31E64606EA;
 Mon, 19 Dec 2022 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671450136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Ch9cu30zdymbS4/mu8gbBsWUq8wgD46ogCiJ5XmHdE=;
 b=I/75ryd5gGKvQ3d+qIXOqYPQdaKXxdKMV+3oSSb5GWCd6hvKOT+Aykfl4xq8cIAiO0hVgV
 iJ24YV1ULmzMOkUSaddw+AvG0u4MzgKsM1CZWNambDOHfZIgFB2F6QDrrfhP2Ib5d5DjEm
 bLrJRa9S6D98AW2IC08r/Dz8R/SfcRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671450136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Ch9cu30zdymbS4/mu8gbBsWUq8wgD46ogCiJ5XmHdE=;
 b=ZCSGGGJquF1Io6vrmyHyZfOedD40Fsf5m32bkCJWUoCPpB40iYq7kUSsXmL7UQBQSe2GLG
 rFmUh+eq5Q4j+JDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB87913910;
 Mon, 19 Dec 2022 11:42:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GaH0GxdOoGNaYQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 19 Dec 2022 11:42:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Claudio Fontana <cfontana@suse.de>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
In-Reply-To: <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
 <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
 <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
 <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de>
Date: Mon, 19 Dec 2022 08:42:13 -0300
Message-ID: <87r0wv8vsa.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Claudio Fontana <cfontana@suse.de> writes:

> Ciao Alex,
>
> On 12/19/22 11:47, Alexander Graf wrote:
>> Hey Claudio,
>> 
>> On 19.12.22 09:37, Claudio Fontana wrote:
>>>
>>> On 12/16/22 22:59, Alexander Graf wrote:
>>>> Hi Claudio,
>>>>
>>>> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific>
>>>> Alex
>>> Hi Alex, Fabiano, Peter and all,
>>>
>>> that was the plan but at the time of:
>>>
>>> https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/
>>>
>>> Peter mentioned that HVF AArch64 might use that code too:
>>>
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html
>>>
>>> so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".
>>>
>>> I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?
>> 
>> I originally reused the PSCI code in earlier versions of my hvf patch 
>> set, but then we realized that some functions like remote CPU reset are 
>> wired in a TCG specific view of the world with full target CPU register 
>> ownership. So if we want to actually share it, we'll need to abstract it 
>> up a level.
>> 
>> Hence I'd suggest to move it to a TCG directory for now and then later 
>> move it back into a generic helper if we want / need to. The code just 
>> simply isn't generic yet.
>> 
>> Or alternatively, you create a patch (set) to actually merge the 2 
>> implementations into a generic one again which then can live at a 
>> generic place :)
>> 
>> 
>> Alex
>
> Thanks for the clarification, I'll leave the choice up to Fabiano now, since he is working on the series currently :-)
>
> Ciao,
>
> Claudio

Hello, thank you all for the comments.

I like the idea of merging the two implementations. However, I won't get
to it anytime soon. There's still ~70 patches in the original series
that I need to understand, rebase and test, including the introduction
of the tcg directory.

I'd say we merge this as is now, since this patch has no
dependencies. Later when I introduce the tcg directory I can move the
code there along with the other tcg-only files. I'll take note to come
back to the PSCI code as well.

