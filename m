Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179436F618C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 00:53:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puLKP-0001g3-BG; Wed, 03 May 2023 18:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puLKF-0001fo-AN
 for qemu-devel@nongnu.org; Wed, 03 May 2023 18:51:55 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puLKB-0008D9-Lt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 18:51:54 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:3f18:0:640:6450:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 599DD60BF3;
 Thu,  4 May 2023 01:51:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43b::1:1a] (unknown
 [2a02:6b8:b081:b43b::1:1a])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id fpXTR60OhSw0-lZRU7GTs; Thu, 04 May 2023 01:51:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683154302; bh=0mb0AJZk8K69AZ1pTLQq2wM2V1CUX2+cknmxlCCGefo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=d6WVfDPewALqVPtep70ay4DFyGSiKzBQzXW7aUD5IZzKhAoovK0mcy56ccfBCMccT
 jJvN7uujIFcYdEC1Ty2cClJhmPUlwwiKNd8eS5xHHjBNcrRPHaXZX4qxE6EsDIKtQz
 yRvd7boS0Gu6jJi7AjW/9NEHFLTHW17g7+CYgmVI=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <68dbd97f-df39-9521-5a8e-7d013f1d81c1@yandex-team.ru>
Date: Thu, 4 May 2023 01:51:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 07/10] migration: split migration_incoming_co
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Leonardo Bras <leobras@redhat.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-8-vsementsov@yandex-team.ru> <ZFF3DJ9BpFAYEVGV@x1n>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <ZFF3DJ9BpFAYEVGV@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02.05.23 23:48, Peter Xu wrote:
> On Fri, Apr 28, 2023 at 10:49:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Originally, migration_incoming_co was introduced by
>> 25d0c16f625feb3b6
>>     "migration: Switch to COLO process after finishing loadvm"
>> to be able to enter from COLO code to one specific yield point, added
>> by 25d0c16f625feb3b6.
>>
>> Later in 923709896b1b0
>>   "migration: poll the cm event for destination qemu"
>> we reused this variable to wake the migration incoming coroutine from
>> RDMA code.
>>
>> That was doubtful idea. Entering coroutines is a very fragile thing:
>> you should be absolutely sure which yield point you are going to enter.
>>
>> I don't know how much is it safe to enter during qemu_loadvm_state()
>> which I think what RDMA want to do. But for sure RDMA shouldn't enter
>> the special COLO-related yield-point. As well, COLO code doesn't want
>> to enter during qemu_loadvm_state(), it want to enter it's own specific
>> yield-point.
>>
>> As well, when in 8e48ac95865ac97d
>>   "COLO: Add block replication into colo process" we added
>> bdrv_invalidate_cache_all() call (now it's called activate_all())
>> it became possible to enter the migration incoming coroutine during
>> that call which is wrong too.
>>
>> So, let't make these things separate and disjoint: loadvm_co for RDMA,
>> non-NULL during qemu_loadvm_state(), and colo_incoming_co for COLO,
>> non-NULL only around specific yield.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   migration/colo.c      | 4 ++--
>>   migration/migration.c | 8 ++++++--
>>   migration/migration.h | 9 ++++++++-
>>   3 files changed, 16 insertions(+), 5 deletions(-)
> 
> The idea looks right to me, but I really know mostly nothing on coroutines
> and also rdma+colo..
> 
> Is the other ref in rdma.c (rdma_cm_poll_handler()) still missing?
> 

Oops right.. I was building with rdma disabled. Will fix.

Thanks a lot for reviewing!

-- 
Best regards,
Vladimir


