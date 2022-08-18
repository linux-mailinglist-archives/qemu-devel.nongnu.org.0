Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911B859888F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 18:18:43 +0200 (CEST)
Received: from localhost ([::1]:37192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOiEB-0005Dh-6N
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 12:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oOi8x-0007y8-Oe
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:13:15 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:58764
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oOi8v-0004WW-BK
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:13:15 -0400
HMM_SOURCE_IP: 172.18.0.48:33548.886578629
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.115 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 404DA2800A0;
 Fri, 19 Aug 2022 00:12:51 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 609b05be5f1e4ef4adb8d5e4815b2e47 for
 peterx@redhat.com; Fri, 19 Aug 2022 00:12:54 CST
X-Transaction-ID: 609b05be5f1e4ef4adb8d5e4815b2e47
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <6d244afc-44fa-fd69-d322-79c3b651ea5a@chinatelecom.cn>
Date: Fri, 19 Aug 2022 00:12:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/8] qapi/migration: Introduce vcpu-dirty-limit parameters
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
 <01d837637e7725a49d1fd3cd22370d6c9f6b9e61.1658561555.git.huangy81@chinatelecom.cn>
 <Yv1mrddIGIBjOv3I@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Yv1mrddIGIBjOv3I@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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



在 2022/8/18 6:07, Peter Xu 写道:
> On Sat, Jul 23, 2022 at 03:49:14PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Introduce "vcpu-dirty-limit" migration parameter used
>> to limit dirty page rate during live migration.
>>
>> "vcpu-dirty-limit" and "x-vcpu-dirty-limit-period" are
>> two dirty-limit-related migration parameters, which can
>> be set before and during live migration by qmp
>> migrate-set-parameters.
>>
>> This two parameters are used to help implement the dirty
>> page rate limit algo of migration.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   migration/migration.c | 14 ++++++++++++++
>>   monitor/hmp-cmds.c    |  8 ++++++++
>>   qapi/migration.json   | 18 +++++++++++++++---
>>   3 files changed, 37 insertions(+), 3 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 7b19f85..ed1a47b 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -117,6 +117,7 @@
>>   #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
>>   
>>   #define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     500     /* ms */
>> +#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT            1       /* MB/s */
> 
> This default value also looks a bit weird.. why 1MB/s?  Thanks,
Indeed, it seems kind of weired, the reason to set default dirty limit 
to 1MB/s is that we want to keep the dirty limit working until vcpu 
dirty page rate drop to 1MB/s once dirtylimit capability enabled during 
migration. In this way, migration has the largest chance to get 
converged before vcpu dirty page rate drop to 1MB/s。 If we set default
dirty limit greater than 1MB/s, the probability of success for migration 
may be reduced, and the default behavior of migration is try the best to 
become sucessful.
> 

