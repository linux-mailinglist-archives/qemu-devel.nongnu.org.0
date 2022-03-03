Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57F4CBD82
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:18:03 +0100 (CET)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkPC-0003pW-KD
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nPkMv-0002LT-3B
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:15:41 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:41973
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nPkMr-0006zI-Qk
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:15:40 -0500
HMM_SOURCE_IP: 172.18.0.188:60092.1426024598
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id A9CBA280095;
 Thu,  3 Mar 2022 20:15:00 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id adcb90dbb7d74a908edd11fac4c1f376 for
 armbru@redhat.com; Thu, 03 Mar 2022 20:15:29 CST
X-Transaction-ID: adcb90dbb7d74a908edd11fac4c1f376
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <5781f7e3-b660-cbed-9aa7-443bd25934f4@chinatelecom.cn>
Date: Thu, 3 Mar 2022 20:14:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v18 7/7] softmmu/dirtylimit: Implement dirty page rate
 limit
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1646247968.git.huangy81@chinatelecom.cn>
 <cover.1646247968.git.huangy81@chinatelecom.cn>
 <0c8849e11cc2d2ec549c926af5977cbd9f460b60.1646247968.git.huangy81@chinatelecom.cn>
 <874k4fckh2.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <874k4fckh2.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/3/3 20:02, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Implement dirtyrate calculation periodically basing on
>> dirty-ring and throttle virtual CPU until it reachs the quota
>> dirty page rate given by user.
>>
>> Introduce qmp commands "set-vcpu-dirty-limit",
>> "cancel-vcpu-dirty-limit", "query-vcpu-dirty-limit"
>> to enable, disable, query dirty page limit for virtual CPU.
>>
>> Meanwhile, introduce corresponding hmp commands
>> "set_vcpu_dirty_limit", "cancel_vcpu_dirty_limit",
>> "info vcpu_dirty_limit" so the feature can be more usable.
>>
>> "query-vcpu-dirty-limit" success depends on enabling dirty
>> page rate limit, so just add it to the list of skipped
>> command to ensure qmp-cmd-test run successfully.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> Acked-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> ---
>>   hmp-commands-info.hx       |  13 +++
>>   hmp-commands.hx            |  32 ++++++++
>>   include/monitor/hmp.h      |   3 +
>>   qapi/migration.json        |  80 +++++++++++++++++++
>>   softmmu/dirtylimit.c       | 195 +++++++++++++++++++++++++++++++++++++++++++++
>>   tests/qtest/qmp-cmd-test.c |   2 +
>>   6 files changed, 325 insertions(+)
> 
> [...]
> 
>> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
>> index 7f103ea..4b216a0 100644
>> --- a/tests/qtest/qmp-cmd-test.c
>> +++ b/tests/qtest/qmp-cmd-test.c
>> @@ -110,6 +110,8 @@ static bool query_is_ignored(const char *cmd)
>>           "query-sev-capabilities",
>>           "query-sgx",
>>           "query-sgx-capabilities",
>> +        /* Success depends on enabling dirty page rate limit */
>> +        "query-vcpu-dirty-limit",
>>           NULL
>>       };
>>       int i;
> 
> The new command lacks test coverage.  Have you considered writing a
> test?
> 

Yes, test case is the next step after supporting dirty-ring-size option 
for guestperf tool. :)

https://lore.kernel.org/qemu-devel/cover.1646304624.git.huangy81@chinatelecom.cn/
-- 
Best regard

Hyman Huang(黄勇)

