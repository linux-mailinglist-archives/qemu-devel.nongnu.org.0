Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47D4369BE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 19:49:45 +0200 (CEST)
Received: from localhost ([::1]:38010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdcCF-0006pD-Tx
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 13:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mdc13-0002ZG-BF
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:38:10 -0400
Received: from holomatrix.labath.sk ([92.48.125.149]:45398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mdc0z-0007h0-Ub
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:38:08 -0400
Received: from [172.29.152.10] (unknown [172.29.152.10])
 by holomatrix.labath.sk (Postfix) with ESMTP id C9A877760BD6;
 Thu, 21 Oct 2021 17:36:59 +0000 (GMT)
Subject: Re: [PATCH v2] gdbstub: Switch to the thread receiving a signal
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210930095111.23205-1-pavel@labath.sk>
 <20211019174953.36560-1-pavel@labath.sk> <87fsswvsfy.fsf@linaro.org>
 <4a9b5f62-3189-7afd-217f-1386f44e0e7c@labath.sk> <878rynvap3.fsf@linaro.org>
From: Pavel Labath <pavel@labath.sk>
Message-ID: <525a7948-0e36-9121-960c-579fa25c89df@labath.sk>
Date: Thu, 21 Oct 2021 19:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <878rynvap3.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=92.48.125.149; envelope-from=pavel@labath.sk;
 helo=holomatrix.labath.sk
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.867,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org, stanshebs@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 19:57, Alex Bennée wrote:
> 
> Pavel Labath <pavel@labath.sk> writes:
> 
>> On 20/10/2021 10:35, Alex Bennée wrote:
>>> Maybe this is related to the weird output I was seeing above?
>>>
>>
>> Yes, that's definitely related. What's happening is that the qemu does
>> not stop other thread when one of them hits a breakpoint (or stops for
>> any other reason) -- as far as I can tell it does not have any code
>> which would even attempt to do that. This is why you're seeing the
>> output even after the process is purportedly stopped.
>>
>> Things get even more interesting when you have two threads hitting a
>> breakpoint simultaneously. At that point both of them will enter their
>> gdb stubs and attempt to talk to gdb at the same time. As you can
>> imagine, this cannot end well, and eventually the connection will
>> become so messed up that one side just gives up and terminates the
>> link.
>>
>> I am aware of this issue, and I (well, Stan (cc'ed) is, for the most
>> part) looking for a way to fix it. If you have any ideas, we'd very
>> much like to hear them. The way I see it, we need to implement some
>> kind of a "stop the world" mechanism, to stop/interrupt all threads
>> whenever the gdb stub becomes active (and make sure it can handle
>> simultaneous debug events).
> 
> vm_stop(RUN_STATE_PAUSED) should do the trick. We do it elsewhere in
> the gdbstub.
Unfortunately, it seems that vm_stop is only available in softmmu 
targets. Is there a user-mode equivalent by any chance?

> 
>> However, I am don't know enough about qemu
>> internals to tell how to actually go about doing that.
>>
>> My plan was to "get my feet wet" with a simple patch that improves the
>> situation for the case when there are no simultaneous debug events,
>> and eventually hopefully figure out a way how to address the bigger
>> problem.
> 
> Great. Once you've made the changes I think the patch is ready to go in
> and the larger questions can be dealt with later.

Cool. I've sent out v3 of the patch. Let me know if there's anything 
else I need to do.

regards,
Pavel

