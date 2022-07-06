Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983715686BE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 13:34:16 +0200 (CEST)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o93IN-0003c0-7k
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 07:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o93Eh-0001OI-QF; Wed, 06 Jul 2022 07:30:30 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:45720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o93EN-0000FC-Uv; Wed, 06 Jul 2022 07:30:12 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 1A45E2E12AA;
 Wed,  6 Jul 2022 14:29:54 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6422::1:33] (unknown
 [2a02:6b8:b081:6422::1:33])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 G3O2HarhR6-TqPCvw4H; Wed, 06 Jul 2022 14:29:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657106993; bh=XeQXZuw9bQ3W2jufuACakxR2PQqsBho3kFUyi7ta71Q=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=deeDLeRoLG+hfQ096VYDqdhJ3ItSLqCr9bvJfgzbp4LkRQC/K1yEDF8de5bAofxdX
 ZqB7gOwq8eRr9rfn9AhotRAYEhHo7ObVmp8S/vqkufFl0rHUZBTnu6XJcCFeXwfhCZ
 impuGl/uwtC9GHm8/1HSBQcaCqn4lm4w4R1Bg2tI=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <97ae617c-ab70-7ed0-7a96-17b2ee76951b@yandex-team.ru>
Date: Wed, 6 Jul 2022 14:29:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, thuth@redhat.com,
 jsnow@redhat.com, richard.henderson@linaro.org
References: <20220705153708.186418-1-vsementsov@yandex-team.ru>
 <a5b27e74-a6a3-01b0-35bf-b8c58802d99a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <a5b27e74-a6a3-01b0-35bf-b8c58802d99a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/22 13:26, Hanna Reitz wrote:
> On 05.07.22 17:37, Vladimir Sementsov-Ogievskiy wrote:
>> strerror() represents ETIMEDOUT a bit different in Linux and macOS /
>> FreeBSD. Let's support the latter too.
>>
>> Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for cbw-timeout option")
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>
>> As John and Thomas noted, the new iotests fails for FreeBSD and maxOS.
>> Here is a fix. Would be great if someone can test it.
>>
>> I tried to push it by
>>
>>    git push --force  -o ci.variable="QEMU_CI=1"
>>
>> to my block branch, I get a blocked pipeline
>>    https://gitlab.com/vsementsov/qemu/-/pipelines/580573238
>> but it doesn't have neither freebsd nor macos jobs.. How to get them?
>>
>>   tests/qemu-iotests/tests/copy-before-write | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
>> index 16efebbf8f..56937b9dff 100755
>> --- a/tests/qemu-iotests/tests/copy-before-write
>> +++ b/tests/qemu-iotests/tests/copy-before-write
>> @@ -192,6 +192,11 @@ read 1048576/1048576 bytes at offset 0
>>       def test_timeout_break_guest(self):
>>           log = self.do_cbw_timeout('break-guest-write')
>> +        # macOS and FreeBSD tend to represent ETIMEDOUT as
>> +        # "Operation timed out", when Linux prefer
>> +        # "Connection timed out"
>> +        log = log.replace('Operation timed out',
>> +                          'Connection timed out')
> 
> If we know for sure that it’s ETIMEDOUT, how about os.strerror(errno.ETIMEDOUT)?
> 

Good idea, will try.

-- 
Best regards,
Vladimir

