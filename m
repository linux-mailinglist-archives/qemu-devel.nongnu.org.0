Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F605651BB8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 08:32:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7X6Y-0001D6-Mw; Tue, 20 Dec 2022 02:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7X6Q-00018B-91; Tue, 20 Dec 2022 02:31:56 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7X6O-0007XU-2o; Tue, 20 Dec 2022 02:31:54 -0500
Received: from [192.168.106.118]
 (dynamic-095-114-015-034.95.114.pool.telefonica.de [95.114.15.34])
 by csgraf.de (Postfix) with ESMTPSA id 816C06080366;
 Tue, 20 Dec 2022 08:31:49 +0100 (CET)
Message-ID: <92da4de4-b00b-096a-8dd9-f4f2f9696598@csgraf.de>
Date: Tue, 20 Dec 2022 08:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
 <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
 <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
 <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de> <87r0wv8vsa.fsf@suse.de>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <87r0wv8vsa.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hey Fabiano,

On 19.12.22 12:42, Fabiano Rosas wrote:
> Claudio Fontana <cfontana@suse.de> writes:
>
>> Ciao Alex,
>>
>> On 12/19/22 11:47, Alexander Graf wrote:
>>> Hey Claudio,
>>>
>>> On 19.12.22 09:37, Claudio Fontana wrote:
>>>> On 12/16/22 22:59, Alexander Graf wrote:
>>>>> Hi Claudio,
>>>>>
>>>>> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific>
>>>>> Alex
>>>> Hi Alex, Fabiano, Peter and all,
>>>>
>>>> that was the plan but at the time of:
>>>>
>>>> https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/
>>>>
>>>> Peter mentioned that HVF AArch64 might use that code too:
>>>>
>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html
>>>>
>>>> so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".
>>>>
>>>> I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?
>>> I originally reused the PSCI code in earlier versions of my hvf patch
>>> set, but then we realized that some functions like remote CPU reset are
>>> wired in a TCG specific view of the world with full target CPU register
>>> ownership. So if we want to actually share it, we'll need to abstract it
>>> up a level.
>>>
>>> Hence I'd suggest to move it to a TCG directory for now and then later
>>> move it back into a generic helper if we want / need to. The code just
>>> simply isn't generic yet.
>>>
>>> Or alternatively, you create a patch (set) to actually merge the 2
>>> implementations into a generic one again which then can live at a
>>> generic place :)
>>>
>>>
>>> Alex
>> Thanks for the clarification, I'll leave the choice up to Fabiano now, since he is working on the series currently :-)
>>
>> Ciao,
>>
>> Claudio
> Hello, thank you all for the comments.
>
> I like the idea of merging the two implementations. However, I won't get
> to it anytime soon. There's still ~70 patches in the original series
> that I need to understand, rebase and test, including the introduction
> of the tcg directory.


Sure, I am definitely fine with leaving them separate for now as well :).


> I'd say we merge this as is now, since this patch has no
> dependencies. Later when I introduce the tcg directory I can move the
> code there along with the other tcg-only files. I'll take note to come
> back to the PSCI code as well.

I'm confused about the patch ordering :). Why is it easier to move the 
psci.c compilation target from generic to an if(CONFIG_TCG) only to 
later move it into a tcg/ directory? Wouldn't it be easier to create a 
tcg/ directory from the start and just put it there?

The current approach just looks like duplicate effort to me.


Alex


