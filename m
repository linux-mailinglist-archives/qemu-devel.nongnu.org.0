Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB965266A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:44:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7g8T-0000Gu-Le; Tue, 20 Dec 2022 12:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7g8R-0000Gf-1E; Tue, 20 Dec 2022 12:10:35 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7g3a-0001VO-Qt; Tue, 20 Dec 2022 12:10:34 -0500
Received: from [192.168.106.127]
 (dynamic-095-114-015-034.95.114.pool.telefonica.de [95.114.15.34])
 by csgraf.de (Postfix) with ESMTPSA id DA0256080220;
 Tue, 20 Dec 2022 18:04:24 +0100 (CET)
Message-ID: <601ba0ac-cbcd-50d4-c295-5cde4a4d6e97@csgraf.de>
Date: Tue, 20 Dec 2022 18:04:24 +0100
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
 <92da4de4-b00b-096a-8dd9-f4f2f9696598@csgraf.de> <875ye6rxk7.fsf@suse.de>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <875ye6rxk7.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
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


On 20.12.22 14:53, Fabiano Rosas wrote:
> Alexander Graf <agraf@csgraf.de> writes:
>
>> Hey Fabiano,
>>
>> On 19.12.22 12:42, Fabiano Rosas wrote:
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> Ciao Alex,
>>>>
>>>> On 12/19/22 11:47, Alexander Graf wrote:
>>>>> Hey Claudio,
>>>>>
>>>>> On 19.12.22 09:37, Claudio Fontana wrote:
>>>>>> On 12/16/22 22:59, Alexander Graf wrote:
>>>>>>> Hi Claudio,
>>>>>>>
>>>>>>> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific>
>>>>>>> Alex
>>>>>> Hi Alex, Fabiano, Peter and all,
>>>>>>
>>>>>> that was the plan but at the time of:
>>>>>>
>>>>>> https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/
>>>>>>
>>>>>> Peter mentioned that HVF AArch64 might use that code too:
>>>>>>
>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html
>>>>>>
>>>>>> so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".
>>>>>>
>>>>>> I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?
>>>>> I originally reused the PSCI code in earlier versions of my hvf patch
>>>>> set, but then we realized that some functions like remote CPU reset are
>>>>> wired in a TCG specific view of the world with full target CPU register
>>>>> ownership. So if we want to actually share it, we'll need to abstract it
>>>>> up a level.
>>>>>
>>>>> Hence I'd suggest to move it to a TCG directory for now and then later
>>>>> move it back into a generic helper if we want / need to. The code just
>>>>> simply isn't generic yet.
>>>>>
>>>>> Or alternatively, you create a patch (set) to actually merge the 2
>>>>> implementations into a generic one again which then can live at a
>>>>> generic place :)
>>>>>
>>>>>
>>>>> Alex
>>>> Thanks for the clarification, I'll leave the choice up to Fabiano now, since he is working on the series currently :-)
>>>>
>>>> Ciao,
>>>>
>>>> Claudio
>>> Hello, thank you all for the comments.
>>>
>>> I like the idea of merging the two implementations. However, I won't get
>>> to it anytime soon. There's still ~70 patches in the original series
>>> that I need to understand, rebase and test, including the introduction
>>> of the tcg directory.
>>
>> Sure, I am definitely fine with leaving them separate for now as well :).
>>
>>
>>> I'd say we merge this as is now, since this patch has no
>>> dependencies. Later when I introduce the tcg directory I can move the
>>> code there along with the other tcg-only files. I'll take note to come
>>> back to the PSCI code as well.
>> I'm confused about the patch ordering :). Why is it easier to move the
>> psci.c compilation target from generic to an if(CONFIG_TCG) only to
>> later move it into a tcg/ directory?
> It's a simple patch, so the overhead didn't cross my mind. But you are
> right, this could go directly into tcg/ without having to put it under
> CONFIG_TCG first.


I'm sure more like this will follow, and it will be a lot easier on 
everyone if the pattern is going to be "move tcg specific code to tcg/ 
and leave generic code in the main directory".


>
>> Wouldn't it be easier to create a
>> tcg/ directory from the start and just put it there?
> I don't know about "from the start". At this point we cannot have a
> single commit moving everything into the tcg/ directory because some
> files still contain tcg + non-tcg code.


Yes, the only thing the initial commit at the start would do is create 
the directory and ninja config, pretty much nothing else. All follow-on 
commits then split the currently entangled code into tcg/ once code is 
clearly separate :).


I believe this was also the approach Claudio took in his patch set last 
year, and I find it very reasonable. It allows you to stop at any point 
mid-way.


> We would end up with several
> commits moving files into tcg/ along the history, which I think results
> in a poor experience when inspecting the log later on (git blame and so
> on). So my idea was to split as much as I can upfront and only later
> move everything into the directory.


Quite the opposite: Please make sure to move everything slowly at a 
digestible pace. There is no way you will get 100 patches in at once. 
Make sure you can cut off at any point in between.

What you basically want is to move from "target/arm is tcg+generic code" 
to "target/arm is generic, target/arm/tcg is tcg code". You will be in a 
transitional phase along the way whatever you do, so just make it 
"target/arm is tcg+generic code, target/arm/tcg is tcg code" while 
things are in flight and have a final commit that indicates the 
conversion is done.


> I'm also rebasing this series [1] from 2021, which means I'd rather have
> small chunks of code moved under CONFIG_TCG that I can build-test with
> --disable-tcg (even though the build doesn't finish, I can see the
> number of errors going down), than to move non-tcg code into tcg/ and
> then pull it out later like in the original series.


I think we're saying the same thing. Please don't move non-tcg code into 
tcg/. Just move files that are absolutely clearly TCG into tcg/ right 
from the start. The psci.c is a good example for that. translate*.c and 
op-helper.c would be another.


Alex


> 1- https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de
>
> But hey, that's just my reasoning, no strong feelings about it.

