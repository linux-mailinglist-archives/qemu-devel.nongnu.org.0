Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313385666A1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:49:30 +0200 (CEST)
Received: from localhost ([::1]:35580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fBQ-0003wT-SN
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8f6k-0001rs-MI; Tue, 05 Jul 2022 05:44:38 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:49258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8f6e-0006GP-37; Tue, 05 Jul 2022 05:44:34 -0400
Received: from iva4-7f38d418d11a.qloud-c.yandex.net
 (iva4-7f38d418d11a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:740d:0:640:7f38:d418])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 014F42E098D;
 Tue,  5 Jul 2022 12:44:20 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva4-7f38d418d11a.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 sJhQQomfgA-iIJKRbDI; Tue, 05 Jul 2022 12:44:19 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657014259; bh=FGgkmjVvQVMJGGIB4989cin2TihDwCiePWfKDrBSAkc=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=UBLIAadXuUuRcftejgyW35SX6fqdkeFNXStdlK8BYsk76+uDlP167wMQ+IwCCckHg
 3I7XcdnsZfDfYNKDhN1OByB6ByfzbUBz6WMvwUbfaOXykRhNSfLGmCJ5p7itVk74/o
 DPQm9yonp7Nuwv3VnRjS9wiMdZjcjlsd7sGM833Y=
Authentication-Results: iva4-7f38d418d11a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [10.211.91.215] (10.211.91.215-vpn.dhcp.yndx.net
 [10.211.91.215])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bRRsuqDg21-iIPq1T1W; Tue, 05 Jul 2022 12:44:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <be946155-e466-9bca-a6f4-d9b2b4c7f5c1@yandex-team.ru>
Date: Tue, 5 Jul 2022 12:44:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: copy-before-write test failing (was: Re: [PULL 07/10] iotests:
 copy-before-write: add cases for cbw-timeout option)
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
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <6201a201-24fd-3906-4d9d-06f8c6d94d84@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

On 7/5/22 12:03, Thomas Huth wrote:
> On 14/06/2022 12.29, Vladimir Sementsov-Ogievskiy wrote:
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>
>> Add two simple test-cases: timeout failure with
>> break-snapshot-on-cbw-error behavior and similar with
>> break-guest-write-on-cbw-error behavior.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   tests/qemu-iotests/tests/copy-before-write    | 81 +++++++++++++++++++
>>   .../qemu-iotests/tests/copy-before-write.out  |  4 +-
>>   2 files changed, 83 insertions(+), 2 deletions(-)
> 
>   Hi!
> 
> Seems like this test is failing in the CI on FreeBSD and macOS:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/2670729995#L5763
>   https://gitlab.com/qemu-project/qemu/-/jobs/2670729993#L3247
> 
> Could you please have a look?
> 

+AssertionError: 'wrot[102 chars]led: Operation timed out\nread 1048576/1048576[72 chars]c)\n' != 'wrot[102 chars]led: Connection timed out\nread 1048576/104857[73 chars]c)\n'
+  wrote 524288/524288 bytes at offset 0
+  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+- write failed: Operation timed out
+?               ^^ ^^
++ write failed: Connection timed out
+?               ^^^^ ^


Seems just different representation of ETIMEDOUT error. I'll send a patch to allow both variants.


-- 
Best regards,
Vladimir

