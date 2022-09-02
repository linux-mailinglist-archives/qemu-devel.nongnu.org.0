Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7076B5AB180
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:35:50 +0200 (CEST)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6pp-0003K1-Ig
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oU6iJ-00023s-1S
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:28:03 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:56290
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oU6i7-00052n-L3
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:27:57 -0400
HMM_SOURCE_IP: 172.18.0.188:45710.503253820
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.8.31 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 99AC028008F;
 Fri,  2 Sep 2022 21:27:34 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id bbd4ba033829438cb81e86f1919a4694 for
 armbru@redhat.com; Fri, 02 Sep 2022 21:27:37 CST
X-Transaction-ID: bbd4ba033829438cb81e86f1919a4694
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <a81cb160-01fe-ea41-1887-71ee8ba420f3@chinatelecom.cn>
Date: Fri, 2 Sep 2022 21:27:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 2/8] qapi/migration: Introduce x-vcpu-dirty-limit
 parameters
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <58009ed32bc30ce40228b191fdd9cacc259ac859.1662052189.git.huangy81@chinatelecom.cn>
 <875yi6xkwz.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <875yi6xkwz.fsf@pond.sub.org>
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



在 2022/9/2 16:03, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Introduce "x-vcpu-dirty-limit" migration parameter used
>> to limit dirty page rate during live migration.
>>
>> "x-vcpu-dirty-limit" and "x-vcpu-dirty-limit-period" are
>> two dirty-limit-related migration parameters, which can
>> be set before and during live migration by qmp
>> migrate-set-parameters.
>>
>> This two parameters are used to help implement the dirty
>> page rate limit algo of migration.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> [...]
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 332c087..8554d33 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -779,6 +779,9 @@
>>   # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
>>   #                             Defaults to 500ms. (Since 7.1)
>>   #
>> +# @x-vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
>> +#                      Defaults to 1. (Since 7.1)
>> +#
>>   # Features:
>>   # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
>>   #            are experimental.
>> @@ -801,7 +804,8 @@
>>              'max-cpu-throttle', 'multifd-compression',
>>              'multifd-zlib-level', 'multifd-zstd-level',
>>              'block-bitmap-mapping',
>> -           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable'] } ] }
>> +           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable'] },
>> +           'x-vcpu-dirty-limit'] }
> 
> Shouldn't 'x-vcpu-dirty-limit-period' have feature 'unstable', too?
> 
Yes, i missed that, thanks very much.
> Same below.
> 
>>   
>>   ##
>>   # @MigrateSetParameters:
>> @@ -949,6 +953,9 @@
>>   # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
>>   #                             Defaults to 500ms. (Since 7.1)
>>   #
>> +# @x-vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
>> +#                      Defaults to 1. (Since 7.1)
>> +#
>>   # Features:
>>   # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
>>   #            are experimental.
>> @@ -987,7 +994,8 @@
>>               '*multifd-zstd-level': 'uint8',
>>               '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
>>               '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
>> -                                            'features': [ 'unstable' ] } } }
>> +                                            'features': [ 'unstable' ] },
>> +            '*x-vcpu-dirty-limit': 'uint64'} }
>>   
>>   ##
>>   # @migrate-set-parameters:
>> @@ -1155,6 +1163,9 @@
>>   # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
>>   #                             Defaults to 500ms. (Since 7.1)
>>   #
>> +# @x-vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
>> +#                      Defaults to 1. (Since 7.1)
>> +#
>>   # Features:
>>   # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
>>   #            are experimental.
>> @@ -1191,7 +1202,8 @@
>>               '*multifd-zstd-level': 'uint8',
>>               '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
>>               '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
>> -                                            'features': [ 'unstable' ] } } }
>> +                                            'features': [ 'unstable' ] },
>> +            '*x-vcpu-dirty-limit': 'uint64'} }
>>   
>>   ##
>>   # @query-migrate-parameters:
> 

-- 
Best regard

Hyman Huang(黄勇)

