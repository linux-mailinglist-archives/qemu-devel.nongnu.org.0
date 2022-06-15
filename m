Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F654C520
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:52:41 +0200 (CEST)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1PhY-0001KJ-B0
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o1Pcn-0007ou-NL; Wed, 15 Jun 2022 05:47:51 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:48666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o1Pcj-0004hD-E3; Wed, 15 Jun 2022 05:47:44 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 314B72E11D6;
 Wed, 15 Jun 2022 12:47:15 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 YglmxI1cl6-lEJmR2gf; Wed, 15 Jun 2022 12:47:15 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655286435; bh=77Bi4rEjnSiD4r6XEwwsCtQFxOImDFxaxOHoo2ddSsg=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=XHDivOUelFvZq7mF+AA+c0zujzHP03FvwUPEcW1qh3o/4j/UxPwy0EeRRR7t9ZXmr
 QB99Jt+J2qmqv9ynS3qS0UH30wjPS21VeLD+mLRFyt7RZYDs6i7cbeM995S7LBCLSl
 bMYUmgZllJBaPBlwsQtGbTLiIMy4fSfKyAHIsjts=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b67d::1:1e] (unknown
 [2a02:6b8:b081:b67d::1:1e])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 0GoOpp2AO4-lDM4vfAl; Wed, 15 Jun 2022 12:47:14 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <8b8ba4be-2713-7b8d-a7a1-398ee37f41a4@yandex-team.ru>
Date: Wed, 15 Jun 2022 12:47:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PULL 00/10] Block jobs & NBD patches
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 peter.maydell@linaro.org
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
 <795ad7ac-27f9-4b84-4d47-86d107f5bf49@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <795ad7ac-27f9-4b84-4d47-86d107f5bf49@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

On 6/14/22 21:05, Richard Henderson wrote:
> On 6/14/22 03:29, Vladimir Sementsov-Ogievskiy wrote:
>> The following changes since commit debd0753663bc89c86f5462a53268f2e3f680f60:
>>
>>    Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging (2022-06-13 21:10:57 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/vsementsov/qemu.git tags/pull-block-2022-06-14
>>
>> for you to fetch changes up to 5aef6747a250f545ff53ba7e1a3ed7a3d166011a:
>>
>>    MAINTAINERS: update Vladimir's address and repositories (2022-06-14 12:51:48 +0300)
>>
>> ----------------------------------------------------------------
>> Block jobs & NBD patches
>>
>> - add new options for copy-before-write filter
>> - new trace points for NBD
>> - prefer unsigned type for some 'in_flight' fields
>> - update my addresses in MAINTAINERS (already in Stefan's tree, but
>>    I think it's OK to send it with this PULL)
>>
>>
>> Note also, that I've recently updated my pgp key with new address and
>> new expire time.
>> Updated key is here: https://keys.openpgp.org/search?q=vsementsov%40yandex-team.ru
> 
> This introduces or exposes new timeouts:
> 
> https://gitlab.com/qemu-project/qemu/-/pipelines/563590515/failures
> 

Not obvious from logs, which iotest hangs. But excluding iotests that passed, it becomes obvious that problem is in copy-before-write iotest, which is added and then updated in the series..

And most probably, that's a new timeout feature, that doesn't work (patches 04-07).. It works for me locally still. I'd be glad if someone could look it through.

I think, for now, I'll just resend a pull request without these 4 patches.

Also, could/should I run all these test pipelines on gitlab by hand before sending a PULL request? Or can I rerun them on my qemu fork for debugging?


-- 
Best regards,
Vladimir

