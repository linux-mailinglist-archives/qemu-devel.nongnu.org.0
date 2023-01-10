Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E697663CDB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:30:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFANw-0005KL-SM; Tue, 10 Jan 2023 03:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFANo-0005Id-Kl; Tue, 10 Jan 2023 03:53:26 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFANl-000428-UU; Tue, 10 Jan 2023 03:53:24 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 0B1CF604E0;
 Tue, 10 Jan 2023 11:53:10 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b685::1:3c] (unknown
 [2a02:6b8:b081:b685::1:3c])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 8rY1oR2RPGk1-5UoiAYsj; Tue, 10 Jan 2023 11:53:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1673340789; bh=4q7PZXXHDuK6wQ4lAKyd5kY+RUDOLRgjEfRD4wW5c18=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=aLfodXnPZ/JDtMjBHs1Tf07mIWJyWOwEnRQn+8DD45agMTLkFq8+Piq+nCAxkhepQ
 p1t7Itk0GZQ2FWw9xEt+QgD3ZZ2gawN+Els7x+uYX51L5OTIjyJOK2pj19tavS4kt4
 wkkXHKqYzEoixgHh382fATLrF2Wz0C1syZr6Ptk8=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <9b5a291e-d8a2-e789-0a87-b923240a3e3a@yandex-team.ru>
Date: Tue, 10 Jan 2023 11:53:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] python: QEMUMachine: enable qmp accept timeout by default
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20220624195252.175249-1-vsementsov@yandex-team.ru>
 <CAFn=p-bzPUmF4YZ-461Tzr9MO_ReotL+wuot2egKW7jQgvaHOw@mail.gmail.com>
 <CAFn=p-bwAXCJnWPj7JwSmN2N52hv7R0p1Fn2GxPpHPpDaDaDHQ@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <CAFn=p-bwAXCJnWPj7JwSmN2N52hv7R0p1Fn2GxPpHPpDaDaDHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/12/22 00:21, John Snow wrote:
> On Mon, Jul 11, 2022 at 5:16 PM John Snow <jsnow@redhat.com> wrote:
>>
>> On Fri, Jun 24, 2022 at 3:53 PM Vladimir Sementsov-Ogievskiy
>> <vsementsov@yandex-team.ru> wrote:
>>>
>>> I've spent much time trying to debug hanging pipeline in gitlab. I
>>> started from and idea that I have problem in code in my series (which
>>> has some timeouts). Finally I found that the problem is that I've used
>>> QEMUMachine class directly to avoid qtest, and didn't add necessary
>>> arguments. Qemu fails and we wait for qmp accept endlessly. In gitlab
>>> it's just stopped by timeout (one hour) with no sign of what's going
>>> wrong.
>>>
>>> With timeout enabled, gitlab don't wait for an hour and prints all
>>> needed information.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> ---
>>>
>>> Hi all!
>>>
>>> Just compare this
>>>    https://gitlab.com/vsementsov/qemu/-/pipelines/572232557
>>> and this
>>>    https://gitlab.com/vsementsov/qemu/-/pipelines/572526252
>>>
>>> and you'll see that the latter is much better.
>>>
>>>   python/qemu/machine/machine.py | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
>>> index 37191f433b..01a12f6f73 100644
>>> --- a/python/qemu/machine/machine.py
>>> +++ b/python/qemu/machine/machine.py
>>> @@ -131,7 +131,7 @@ def __init__(self,
>>>                    drain_console: bool = False,
>>>                    console_log: Optional[str] = None,
>>>                    log_dir: Optional[str] = None,
>>> -                 qmp_timer: Optional[float] = None):
>>> +                 qmp_timer: float = 30):
>>>           '''
>>>           Initialize a QEMUMachine
>>>
>>> --
>>> 2.25.1
>>>
>>
>> Oh, this is because machine.py uses the qmp_timer for *all* timeouts,
>> and not just the QMP commands themselves, and this relates to the work
>> Marc Andre is doing with regards to changing the launch mechanism to
>> handle the race condition when the QEMU launch fails, but the QMP
>> connection just sits waiting.
>>
>> I'm quite of the mind that it's really time to rewrite machine.py to
>> use the native asyncio interfaces I've been writing to help manage
>> this, but in the meantime I think this is probably a reasonable
>> concession and a more useful default.
>>
>> ...I think. Willing to take it for now and re-investigate when the
>> other fixes make it to the tree.
>>
>> Reviewed-by: John Snow <jsnow@redhat.com>
> 
> Oh, keep the type as Optional[float], though, so the timeout can be
> disabled again, and keeps the type consistent with the qtest
> derivative class. I've staged your patch with that change made, let me
> know if that's not OK. Modified patch is on my python branch:
> 
> Thanks, merged.
> 

Hmm, seems that's lost.. I don't see it neither in master nor in your python branch..

-- 
Best regards,
Vladimir


