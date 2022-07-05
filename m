Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DC56764A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:21:27 +0200 (CEST)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nAq-0000RH-Ow
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8n7t-0005nP-Ur; Tue, 05 Jul 2022 14:18:22 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:33244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8n7p-0000w7-Ui; Tue, 05 Jul 2022 14:18:20 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 54A2A2E0A27;
 Tue,  5 Jul 2022 21:18:04 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 DOy2JkhZY3-I3J4EuHh; Tue, 05 Jul 2022 21:18:04 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657045084; bh=/MzdAxO5xzMSUlryd9aQYDbnJZYtSCpIl223oeGK88Y=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=atHhx6zEXNywm30f/vAPX0m6Ug2PvAABIvaWF5H+zjrDVnO7kC1EFfCGYWOCzRsgp
 X37wJHBVTVjx1upyHUupSvwUOvSH5oiqxbaz2Gk+hVgUovWiKWjGLdbqshUW3Hd8Rq
 L456zMSKowI0W7F3cUMpE1uYC8uizp9C4JVZgBTg=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:6429::1:1b] (unknown
 [2a02:6b8:b081:6429::1:1b])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 iBP9j8uEjC-I3PeAhRp; Tue, 05 Jul 2022 21:18:03 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <556a2ccb-27db-8f74-fbe9-6911aab43f5c@yandex-team.ru>
Date: Tue, 5 Jul 2022 21:18:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 thuth@redhat.com, jsnow@redhat.com
References: <20220705153708.186418-1-vsementsov@yandex-team.ru>
 <e5fa4843-31e1-9ce2-fd13-ffa1b6ee6f1e@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <e5fa4843-31e1-9ce2-fd13-ffa1b6ee6f1e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

On 7/5/22 20:22, Richard Henderson wrote:
> On 7/5/22 21:07, Vladimir Sementsov-Ogievskiy wrote:
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
> 
> You'd have to have an attached cirrus token.
> Better to just use 'make vm-build-freebsd'.
> 
>>       def test_timeout_break_guest(self):
>>           log = self.do_cbw_timeout('break-guest-write')
>> +        # macOS and FreeBSD tend to represent ETIMEDOUT as
>> +        # "Operation timed out", when Linux prefer
>> +        # "Connection timed out"
>> +        log = log.replace('Operation timed out',
>> +                          'Connection timed out')
> 
> Um, really?  Matching strerror text?  This is ultra-fragile.
> Dare I say broken already.
> 

Unfortunately we lack a good interface to test simple reads and writes in iotests. qemu-io command just print the result to stdout. So, I think, in short-term, this is the best thing to do. And if just `git grep '\(write\|read\) failed:' tests/qemu-iotests/` we'll see that this is the common practice.

-- 
Best regards,
Vladimir

