Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035AA6521CC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:54:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3t-0004SZ-4d; Tue, 20 Dec 2022 08:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7d3o-0004Ok-Uo; Tue, 20 Dec 2022 08:53:36 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7d3m-000155-DI; Tue, 20 Dec 2022 08:53:36 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4084775D46;
 Tue, 20 Dec 2022 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671544411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JBrNBXZpNP0MtNMBZjL0Pz74VpfOLSP3jC8S7wwLa6A=;
 b=lL9wpiMAztT9pdiiUfGuS+wLIKDPwwbHBQCp4oU/Pu3N/guf9HqwXpx51TKbQ8O0h/wtXS
 ofO0hE8/dJPv9dCN5IVtFbSMjrQd5Al5jCZH+/V8T8wdXhhSXNX3Af5CGSm0mx61jC2LSZ
 wVXewMDR9q2VUza0m9ItOBPoNF3jnfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671544411;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JBrNBXZpNP0MtNMBZjL0Pz74VpfOLSP3jC8S7wwLa6A=;
 b=LmaD1PlHrRSItJQzcmQyoW2A+nfbpnzwofmMIEr/DGC4GKmqJB92Zut6Ilgzt/KHvFyx1r
 pyJJL6m1izroNrBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6B721390E;
 Tue, 20 Dec 2022 13:53:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4XhOHlq+oWOaHgAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 13:53:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alexander Graf <agraf@csgraf.de>, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
In-Reply-To: <92da4de4-b00b-096a-8dd9-f4f2f9696598@csgraf.de>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
 <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
 <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
 <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de> <87r0wv8vsa.fsf@suse.de>
 <92da4de4-b00b-096a-8dd9-f4f2f9696598@csgraf.de>
Date: Tue, 20 Dec 2022 10:53:28 -0300
Message-ID: <875ye6rxk7.fsf@suse.de>
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

Alexander Graf <agraf@csgraf.de> writes:

> Hey Fabiano,
>
> On 19.12.22 12:42, Fabiano Rosas wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> Ciao Alex,
>>>
>>> On 12/19/22 11:47, Alexander Graf wrote:
>>>> Hey Claudio,
>>>>
>>>> On 19.12.22 09:37, Claudio Fontana wrote:
>>>>> On 12/16/22 22:59, Alexander Graf wrote:
>>>>>> Hi Claudio,
>>>>>>
>>>>>> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific>
>>>>>> Alex
>>>>> Hi Alex, Fabiano, Peter and all,
>>>>>
>>>>> that was the plan but at the time of:
>>>>>
>>>>> https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/
>>>>>
>>>>> Peter mentioned that HVF AArch64 might use that code too:
>>>>>
>>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html
>>>>>
>>>>> so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".
>>>>>
>>>>> I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?
>>>> I originally reused the PSCI code in earlier versions of my hvf patch
>>>> set, but then we realized that some functions like remote CPU reset are
>>>> wired in a TCG specific view of the world with full target CPU register
>>>> ownership. So if we want to actually share it, we'll need to abstract it
>>>> up a level.
>>>>
>>>> Hence I'd suggest to move it to a TCG directory for now and then later
>>>> move it back into a generic helper if we want / need to. The code just
>>>> simply isn't generic yet.
>>>>
>>>> Or alternatively, you create a patch (set) to actually merge the 2
>>>> implementations into a generic one again which then can live at a
>>>> generic place :)
>>>>
>>>>
>>>> Alex
>>> Thanks for the clarification, I'll leave the choice up to Fabiano now, since he is working on the series currently :-)
>>>
>>> Ciao,
>>>
>>> Claudio
>> Hello, thank you all for the comments.
>>
>> I like the idea of merging the two implementations. However, I won't get
>> to it anytime soon. There's still ~70 patches in the original series
>> that I need to understand, rebase and test, including the introduction
>> of the tcg directory.
>
>
> Sure, I am definitely fine with leaving them separate for now as well :).
>
>
>> I'd say we merge this as is now, since this patch has no
>> dependencies. Later when I introduce the tcg directory I can move the
>> code there along with the other tcg-only files. I'll take note to come
>> back to the PSCI code as well.
>
> I'm confused about the patch ordering :). Why is it easier to move the 
> psci.c compilation target from generic to an if(CONFIG_TCG) only to 
> later move it into a tcg/ directory?

It's a simple patch, so the overhead didn't cross my mind. But you are
right, this could go directly into tcg/ without having to put it under
CONFIG_TCG first.

> Wouldn't it be easier to create a 
> tcg/ directory from the start and just put it there?

I don't know about "from the start". At this point we cannot have a
single commit moving everything into the tcg/ directory because some
files still contain tcg + non-tcg code. We would end up with several
commits moving files into tcg/ along the history, which I think results
in a poor experience when inspecting the log later on (git blame and so
on). So my idea was to split as much as I can upfront and only later
move everything into the directory.

I'm also rebasing this series [1] from 2021, which means I'd rather have
small chunks of code moved under CONFIG_TCG that I can build-test with
--disable-tcg (even though the build doesn't finish, I can see the
number of errors going down), than to move non-tcg code into tcg/ and
then pull it out later like in the original series.

1- https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

But hey, that's just my reasoning, no strong feelings about it.

