Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1473B56598A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:12:31 +0200 (CEST)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NkU-0002K0-6q
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8NiT-00017X-KF; Mon, 04 Jul 2022 11:10:25 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:34326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8NiP-0007kz-JD; Mon, 04 Jul 2022 11:10:24 -0400
Received: from vla5-d6ec41cad181.qloud-c.yandex.net
 (vla5-d6ec41cad181.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:348f:0:640:d6ec:41ca])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id D22E32E0A08;
 Mon,  4 Jul 2022 18:10:07 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla5-d6ec41cad181.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 lmsVFbKXp6-A7LeueqF; Mon, 04 Jul 2022 18:10:07 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656947407; bh=U2dGThoeJOflxKc85WGeat46EpSSbU7L0Dk6kq7Dd3o=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=QHAykLsXErvuj3KG83eORuddW1hu74r1hMFu+3xQBMNt84C+VqfE7RFicO9oPur6c
 4S8HOqrgiIddSqt2mP4/eZFMg3cG1aWXknMdNWyDNFwocFp/8CqB8xufESp+9H1yuB
 HYjqdYqtrWvl3yGQUntLVcvy6rof//Ll6gVEd0CQ=
Authentication-Results: vla5-d6ec41cad181.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b533::1:31] (unknown
 [2a02:6b8:b081:b533::1:31])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 kcHs307fpC-A7UuttcH; Mon, 04 Jul 2022 18:10:07 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <6af72aae-4664-e3f5-11cc-eca355b929d9@yandex-team.ru>
Date: Mon, 4 Jul 2022 18:10:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PULL v2 0/9] Block jobs & NBD patches
Content-Language: en-US
To: John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220629081517.446432-1-vsementsov@yandex-team.ru>
 <230922ea-a0ae-06f3-af17-0964dabd13fa@linaro.org>
 <CAFn=p-Y9BVujsBzeoVswWQeA-rfNJPbS3_hT+npjOo_LqKd9rg@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <CAFn=p-Y9BVujsBzeoVswWQeA-rfNJPbS3_hT+npjOo_LqKd9rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/1/22 20:02, John Snow wrote:
> On Wed, Jun 29, 2022 at 7:18 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/29/22 13:45, Vladimir Sementsov-Ogievskiy wrote:
>>> The following changes since commit ad4c7f529a279685da84297773b4ec8080153c2d:
>>>
>>>     Merge tag 'pull-semi-20220628' of https://gitlab.com/rth7680/qemu into staging (2022-06-28 10:24:31 +0530)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://gitlab.com/vsementsov/qemu.git tags/pull-block-2022-06-14-v2
>>>
>>> for you to fetch changes up to 1b8f777673985af366de099ad4e41d334b36fb12:
>>>
>>>     block: use 'unsigned' for in_flight field on driver state (2022-06-29 10:57:02 +0300)
>>>
>>> ----------------------------------------------------------------
>>> Block jobs & NBD patches
>>>
>>> v2: - add arguments to QEMUMachine constructor in test, to make it work
>>>         on arm in gitlab pipeline
>>>       - use bdrv_inc_in_flight() / bdrv_dec_in_flight() instead of direct
>>>         manipulation with bs->in_flight
>>
>> Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.
>>
>>
>> r~
>>
>>
>>>
>>> - add new options for copy-before-write filter
>>> - new trace points for NBD
>>> - prefer unsigned type for some 'in_flight' fields
>>>
>>> Denis V. Lunev (2):
>>>     nbd: trace long NBD operations
>>>     block: use 'unsigned' for in_flight field on driver state
>>>
>>> Vladimir Sementsov-Ogievskiy (7):
>>>     block/copy-before-write: refactor option parsing
>>>     block/copy-before-write: add on-cbw-error open parameter
>>>     iotests: add copy-before-write: on-cbw-error tests
>>>     util: add qemu-co-timeout
>>>     block/block-copy: block_copy(): add timeout_ns parameter
>>>     block/copy-before-write: implement cbw-timeout option
>>>     iotests: copy-before-write: add cases for cbw-timeout option
>>>
>>>    block/block-copy.c                            |  33 ++-
>>>    block/copy-before-write.c                     | 110 ++++++---
>>>    block/mirror.c                                |   2 +-
>>>    block/nbd.c                                   |   8 +-
>>>    block/trace-events                            |   2 +
>>>    include/block/block-copy.h                    |   4 +-
>>>    include/qemu/coroutine.h                      |  13 ++
>>>    nbd/client-connection.c                       |   2 +
>>>    nbd/trace-events                              |   3 +
>>>    qapi/block-core.json                          |  31 ++-
>>>    tests/qemu-iotests/pylintrc                   |   5 +
>>>    tests/qemu-iotests/tests/copy-before-write    | 216 ++++++++++++++++++
>>>    .../qemu-iotests/tests/copy-before-write.out  |   5 +
>>>    util/meson.build                              |   1 +
>>>    util/qemu-co-timeout.c                        |  89 ++++++++
>>>    15 files changed, 482 insertions(+), 42 deletions(-)
>>>    create mode 100755 tests/qemu-iotests/tests/copy-before-write
>>>    create mode 100644 tests/qemu-iotests/tests/copy-before-write.out
>>>    create mode 100644 util/qemu-co-timeout.c
>>>
>>
>>
> 
> iotests: copy-before-write: add cases for cbw-timeout option
> 
> - This is causing the FreeBSD VM tests to regress for me, because the
> new iotest is failing there. Haven't diagnosed further yet, but I will
> update this thread if I get better info.
> 

Like other problems around this test (I had a hard debugging session for the problem that reproduces only on gitlab pipline :/, it may relate to the fact that I use QEMUMachine class directly and avoid -accel qtest. Also, to fix test on ARM, I've added -machine none.


-- 
Best regards,
Vladimir

