Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD335568B9D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 16:48:34 +0200 (CEST)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o96KP-0002la-HH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 10:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o96IJ-0001lZ-Ua; Wed, 06 Jul 2022 10:46:24 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:56676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o96IF-0000Zc-5m; Wed, 06 Jul 2022 10:46:22 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id CCDD22E1F61;
 Wed,  6 Jul 2022 17:46:06 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6422::1:33] (unknown
 [2a02:6b8:b081:6422::1:33])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 TjG7Ah4pku-k4PiYMTv; Wed, 06 Jul 2022 17:46:06 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657118766; bh=zTgBwbsbgDTaN9Hlql69fwe+gyCzfMYKofaYvMUf4Lo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=MPgADcf2X1oFggUMoUGuoeqDbTOBBXtwf+A0czSp60F5zAVqjGy5mxO1611yTL/9J
 Itj1O+MNGvGq2nkTh/hQi5m7lhDuTcKSyu0dOh5A9JYzXuQ8xyyOtNiwR/6GQMswCv
 +xuZzJG4KOpwC12Uxgsm6xlnaXFFmYy4BZYo7zmQ=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <28788b2a-2144-17e9-b7b0-daf498bcbf49@yandex-team.ru>
Date: Wed, 6 Jul 2022 17:46:04 +0300
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
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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
>> https://gitlab.com/vsementsov/qemu/-/pipelines/580573238
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

I've checked this with make vm-build-freebsd, but it doesn't work:

--- /home/qemu/qemu-test.fxwm16/src/tests/qemu-iotests/tests/copy-before-write.out
+++ /usr/home/qemu/qemu-test.fxwm16/build/tests/qemu-iotests/scratch/copy-before-write.out.bad
@@ -1,5 +1,22 @@
-....
+..F.
+======================================================================
+FAIL: test_timeout_break_guest (__main__.TestCbwError)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.fxwm16/src/tests/qemu-iotests/tests/copy-before-write", line 207, in test_timeout_break_guest
+    """)
+AssertionError: 'wrot[102 chars]led: Connection timed out\nread 1048576/104857[73 chars]c)\n' != 'wrot[102 chars]led: Operation timed out\nread 1048576/1048576[72 chars]c)\n'
+  wrote 524288/524288 bytes at offset 0
+  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+- write failed: Connection timed out
+?               ^^^^ ^
++ write failed: Operation timed out
+?               ^^ ^^
+  read 1048576/1048576 bytes at offset 0
+  1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
  ----------------------------------------------------------------------
  Ran 4 tests


Probably pythonic os.strerror doesn't correspond to what we have in C..

So, let's just go with my fix.

-- 
Best regards,
Vladimir

