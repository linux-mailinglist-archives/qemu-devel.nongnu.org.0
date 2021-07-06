Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DFA3BC86E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:20:24 +0200 (CEST)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hFf-0003gH-Df
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1m0hEa-00031L-M5; Tue, 06 Jul 2021 05:19:16 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:60318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1m0hEY-0006Pb-TB; Tue, 06 Jul 2021 05:19:16 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4005F1FF37;
 Tue,  6 Jul 2021 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625563151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9GfnC8ZVhqplPHXhloMFLqPJ10pK8ChB9vsvh6VfDc=;
 b=n0Wmg3imoR/7b8pA7piak4/EXod0haCGq3rUF7T2gZXMqeytWP6BniGt7Q84WoPIg5bGTX
 CUp3xDYmwTpVefoyf0jMN8qBqo3tuHypT6Gg0e/SyPZ9UhVeXvxRVWQhHsG+6u6wYLUbn2
 QeaQKi603IQWBqZDEv5k1SW+D5HGc1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625563151;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9GfnC8ZVhqplPHXhloMFLqPJ10pK8ChB9vsvh6VfDc=;
 b=oORf+p5pzOUhOYyYdNo94SccsRLG6iOCvUo9QY+xAjd/4CILJOI2SsqwymfQsQHVLAZNxq
 WJ60V01sKymIrLAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0041A1367E;
 Tue,  6 Jul 2021 09:19:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id sFtgOQ4g5GDgTgAAGKfGzw
 (envelope-from <cfontana@suse.de>); Tue, 06 Jul 2021 09:19:10 +0000
Subject: Re: [RFC v6 08/13] target/s390x: split cpu-dump from helper.c
To: Thomas Huth <thuth@redhat.com>, Al Cho <ACho@suse.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-9-acho@suse.com>
 <f4848e38-ecce-c6b1-254b-e93fe45711ca@redhat.com>
 <1fc14922aa88d7cd6cbfe3e5e76e10aa8150fe4a.camel@suse.com>
 <101135a9-2b08-ab8b-dd48-8fc1d8f00358@suse.de>
 <27d64c9b946b8d7183b6f7d5154aa36fad9dec23.camel@suse.com>
 <7083a732-53ff-39a7-bffc-f47946949fec@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <08b9c847-55f2-31b6-9db9-456fa43ab37a@suse.de>
Date: Tue, 6 Jul 2021 11:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7083a732-53ff-39a7-bffc-f47946949fec@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Claudio Fontana <Claudio.Fontana@suse.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 11:06 AM, Thomas Huth wrote:
> On 06/07/2021 10.47, Al Cho wrote:
>> On Mon, 2021-07-05 at 08:25 +0200, Claudio Fontana wrote:
>>> On 7/2/21 9:25 AM, Al Cho wrote:
>>>> On Thu, 2021-07-01 at 14:35 +0200, Thomas Huth wrote:
>>>>> On 29/06/2021 16.19, Cho, Yu-Chen wrote:
>>>>>> Splitting this functionality also allows us to make helper.c
>>>>>> sysemu-
>>>>>> only.
>>>>>>
>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>>> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
>>>>>> Acked-by: Cornelia Huck <cohuck@redhat.com>
>>>>>> ---
>>>>>>    target/s390x/cpu-dump.c  | 176
>>>>>> +++++++++++++++++++++++++++++++++++++++
>>>>>
>>>>> Apart from the dump() function, the other functions here are are
>>>>> used
>>>>> in
>>>>> other contexts, too, so maybe the name is not very appropriate
>>>>> here...
>>>>> What
>>>>> about naming it "cpu-state.c" instead? Or include the functions
>>>>> in
>>>>> cpu.c
>>>>> directly?
>>>>>
>>>>
>>>> ok, I think naming it "cpu-state.c" would make more sense.
>>>>
>>>> Thanks,
>>>>              AL
>>>>
>>>
>>> For context, cpu-dump.c mimics how this is done on x86,
>>>
>>> so rather than coming up with creative new names for each
>>> architecture,
>>
>> I think Claudio is right, I didn't recognize it before. sorry.
>>
>>> I'd rather either put the code into cpu.c, or just keep the existing
>>> "cpu-dump.c" as in the initially proposed patch, which looks like the
>>> best option to me.
>>>
>>
>> For me just keep the existing "cpu-dump.c" as in the initially proposed
>> patch would be the better one option.
>> But it's also good to me if we keep the dump() function in cpu-dump.c
>> and put other functions into cpu.c.
> 
> FWIW, if you don't like cpu-state.c, I'd vote for putting the dump() 
> function into cpu-dump.c and put the other functions into cpu.c instead.
> 
>   Thomas
> 

Ah I see the issue now, the patch currently includes functions in cpu-dump.c that are not really cpu dump functions,
and should go back into cpu.c .

Agreed, this seems to be the next step.

Thanks,

Claudio

