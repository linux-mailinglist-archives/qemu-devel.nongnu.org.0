Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D50559895D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 18:53:48 +0200 (CEST)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOimB-00030i-8G
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 12:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oOikP-0000TD-Uf
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:51:57 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:35424
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oOikN-0005CH-Mi
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:51:57 -0400
HMM_SOURCE_IP: 172.18.0.48:37716.1129631787
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.115 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id D88FE28008F;
 Fri, 19 Aug 2022 00:51:43 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id a007915652ed434fbb810ee5f55954b2 for
 peterx@redhat.com; Fri, 19 Aug 2022 00:51:46 CST
X-Transaction-ID: a007915652ed434fbb810ee5f55954b2
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <4bbcb624-2197-9cef-03c7-fdbed23c4716@chinatelecom.cn>
Date: Fri, 19 Aug 2022 00:51:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/8] qapi/migration: Introduce x-vcpu-dirty-limit-period
 parameter
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
 <22a4776fc05a4174cb07728e0350430a420e2b9c.1658561555.git.huangy81@chinatelecom.cn>
 <Yv1mWLkErL/BNupE@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Yv1mWLkErL/BNupE@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/8/18 6:06, Peter Xu 写道:
> On Sat, Jul 23, 2022 at 03:49:13PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Introduce "x-vcpu-dirty-limit-period" migration experimental
>> parameter, which is used to make dirtyrate calculation period
>> configurable.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   migration/migration.c | 16 ++++++++++++++++
>>   monitor/hmp-cmds.c    |  8 ++++++++
>>   qapi/migration.json   | 31 ++++++++++++++++++++++++-------
>>   3 files changed, 48 insertions(+), 7 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index e03f698..7b19f85 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -116,6 +116,8 @@
>>   #define DEFAULT_MIGRATE_ANNOUNCE_ROUNDS    5
>>   #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
>>   
>> +#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     500     /* ms */
> 
> Why 500 but not DIRTYLIMIT_CALC_TIME_MS?
This is a empirical value actually, the iteration time of migration is 
less than 1000ms normally. In my test it varies from 200ms to 500ms, we 
assume iteration time is 500ms and calculation period is 1000ms， so 2 
iteration pass when 1 dirty page rate get calculated. We want 
calculation period as close to iteration time as possible so that 1 
iteration pass, 1 new dirty page rate be calculated and get compared, 
hoping the dirtylimit working more precisely.

But as the "x-" prefix implies, i'm a little unsure that if the solution 
works。
> 
> Is it intended to make this parameter experimental, but the other one not?
Since i'm not very sure vcpu-dirty-limit-period have impact on 
migration(as described above), so it is made experimental. As to 
vcpu-dirty-limit, it indeed have impact on migration in theory, so it is 
not made experimental. But from another point of view, 2 parameter are 
introduced in the first time and none of them suffer lots of tests, it 
is also reasonable to make 2 parameter experimental, i'm not insist that.

Yong
> 
> Thanks,
> 

