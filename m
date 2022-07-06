Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D5569050
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:07:21 +0200 (CEST)
Received: from localhost ([::1]:38976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98Ui-0007yi-Jn
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o98TZ-00074m-0h; Wed, 06 Jul 2022 13:06:09 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:59718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o98TS-0007YZ-BS; Wed, 06 Jul 2022 13:06:07 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 81BD82E0488;
 Wed,  6 Jul 2022 20:05:49 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6422::1:33] (unknown
 [2a02:6b8:b081:6422::1:33])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 M1JLT8AwAo-5lP4lF0r; Wed, 06 Jul 2022 20:05:48 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657127148; bh=qp9AFM3rpa8R9c3v8y0nZqb9yp12MACwiuGk9E1Tals=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=L3D94phlqjMe8R4YgdAU/PtUiZpjBKvpGox9zsLmnRszYV0xJiu0cMw37Iy5zcLEc
 yxVAXX9sH3225A7dit2/0XIeOBlHtl6AXj1u9UtXxyLDzjMag7sZt2kJJ8+CDsXkMV
 QLgWt0KqwFqAbY/s6nGSCjfYNzNeSOyA1KRsUkqo=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <709f360f-c83a-73b2-fc24-3e319d9164a1@yandex-team.ru>
Date: Wed, 6 Jul 2022 20:05:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: copy-before-write test failing
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
 <20220614102910.1431380-8-vsementsov@yandex-team.ru>
 <6201a201-24fd-3906-4d9d-06f8c6d94d84@redhat.com>
 <eceb0156-f3e0-a51f-32e6-1f7de13398bc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <eceb0156-f3e0-a51f-32e6-1f7de13398bc@redhat.com>
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

On 7/6/22 19:22, Thomas Huth wrote:
> On 05/07/2022 11.03, Thomas Huth wrote:
>> On 14/06/2022 12.29, Vladimir Sementsov-Ogievskiy wrote:
>>> From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>>
>>> Add two simple test-cases: timeout failure with
>>> break-snapshot-on-cbw-error behavior and similar with
>>> break-guest-write-on-cbw-error behavior.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> ---
>>>   tests/qemu-iotests/tests/copy-before-write    | 81 +++++++++++++++++++
>>>   .../qemu-iotests/tests/copy-before-write.out  |  4 +-
>>>   2 files changed, 83 insertions(+), 2 deletions(-)
>>
>>   Hi!
>>
>> Seems like this test is failing in the CI on FreeBSD and macOS:
>>
>>   https://gitlab.com/qemu-project/qemu/-/jobs/2670729995#L5763
>>   https://gitlab.com/qemu-project/qemu/-/jobs/2670729993#L3247
>>
>> Could you please have a look?
> 
> I just hit another failure, this time in a restricted build:
> 
> +FFFF
> +======================================================================
> +FAIL: test_break_guest_write_on_cbw_error (__main__.TestCbwError)
> +break-guest-write behavior:
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/tests/copy-before-write", line 124, in test_break_guest_write_on_cbw_error
> +    log = self.do_cbw_error('break-guest-write')
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/tests/copy-before-write", line 82, in do_cbw_error
> +    self.assert_qmp(result, 'return', {})
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/iotests.py", line 1190, in assert_qmp
> +    result = self.dictpath(d, path)
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/iotests.py", line 1164, in dictpath
> +    self.fail(f'failed path traversal for "{path}" in "{d}"')
> +AssertionError: failed path traversal for "return" in "{'error': {'class': 'GenericError', 'desc': "Driver 'copy-before-write' is not whitelisted"}}"
> 
> I think you need to check for the availability of the driver first, like it is e.g. done in the image-fleecing test?
> 

Oh, right!


-- 
Best regards,
Vladimir

