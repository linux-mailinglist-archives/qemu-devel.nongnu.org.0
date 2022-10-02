Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AFD5F20CE
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 03:15:47 +0200 (CEST)
Received: from localhost ([::1]:38624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oena5-0001Wt-S9
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 21:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oenYS-00005V-RH
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 21:14:04 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:58000
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oenYQ-0000Zr-Nb
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 21:14:04 -0400
HMM_SOURCE_IP: 172.18.0.218:54490.756208713
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.226 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 60D0D280169;
 Sun,  2 Oct 2022 09:13:45 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([118.116.19.226])
 by app0025 with ESMTP id 956ab914770c421cb2207e0ab1c302eb for
 armbru@redhat.com; Sun, 02 Oct 2022 09:13:48 CST
X-Transaction-ID: 956ab914770c421cb2207e0ab1c302eb
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 118.116.19.226
X-MEDUSA-Status: 0
Message-ID: <00eac029-89b0-04ae-f591-c91ac5baba51@chinatelecom.cn>
Date: Sun, 2 Oct 2022 09:13:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 5/8] migration: Export dirty-limit time info
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <5ca0b4ae2aa787c1547d798521ab0e67867437a8.1662052189.git.huangy81@chinatelecom.cn>
 <87o7uvjszm.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87o7uvjszm.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.743,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



在 2022/10/2 2:31, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Export dirty limit throttle time and estimated ring full
>> time, through which we can observe the process of dirty
>> limit during live migration.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> [...]
> 
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index bc4bc96..c263d54 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -242,6 +242,12 @@
>>   #                   Present and non-empty when migration is blocked.
>>   #                   (since 6.0)
>>   #
>> +# @dirty-limit-throttle-us-per-full: Throttle time (us) during the period of
>> +#                                    dirty ring full (since 7.0)
>> +#
>> +# @dirty-limit-us-ring-full: Estimated periodic time (us) of dirty ring full.
>> +#                            (since 7.0)
>> +#
> 
> Can you explain what is measured here a bit more verbosely?
The two fields of migration info aims to export dirty-limit throttle 
time so that upper apps can check out the process of live migration, 
like 'cpu-throttle-percentage'.

The commit "tests: Add migration dirty-limit capability test" make use 
of the 'dirty-limit-throttle-us-per-full' to checkout if dirty-limit has 
started, the commit "tests/migration: Introduce dirty-limit into 
guestperf" introduce the two field so guestperf tools also show the 
process of dirty-limit migration.

And i also use qmp_query_migrate to observe the migration by checkout 
these two fields.

I'm not sure if above explantation is what you want exactly, please be 
free to start any discussion about this features.

Thank Markus.

Yong
> 
>>   # Since: 0.14
>>   ##
>>   { 'struct': 'MigrationInfo',
>> @@ -259,7 +265,9 @@
>>              '*postcopy-blocktime' : 'uint32',
>>              '*postcopy-vcpu-blocktime': ['uint32'],
>>              '*compression': 'CompressionStats',
>> -           '*socket-address': ['SocketAddress'] } }
>> +           '*socket-address': ['SocketAddress'],
>> +           '*dirty-limit-throttle-us-per-full': 'int64',
>> +           '*dirty-limit-us-ring-full': 'int64'} }
>>   
>>   ##
>>   # @query-migrate:
> 
> [...]
> 

-- 
Best regard

Hyman Huang(黄勇)

