Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CAB52CA02
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 05:07:40 +0200 (CEST)
Received: from localhost ([::1]:40562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrWVn-0004gE-Gt
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 23:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nrWTr-0003Oa-L0
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:05:39 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.221]:45690
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nrWTo-00043h-Ep
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:05:39 -0400
HMM_SOURCE_IP: 172.18.0.188:60442.528550548
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id B939E2800A6;
 Thu, 19 May 2022 11:05:19 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 3b4a54c44df847b1aad1be99357f43b7 for
 eblake@redhat.com; Thu, 19 May 2022 11:05:21 CST
X-Transaction-ID: 3b4a54c44df847b1aad1be99357f43b7
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <53512b9d-2a0b-5353-b0f6-b712de80f909@chinatelecom.cn>
Date: Thu, 19 May 2022 11:05:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC 1/6] qapi/migration: Introduce vcpu-dirtylimit-period
 parameters
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <cover.1652762652.git.huangy81@chinatelecom.cn>
 <23b507e7d9d230f1ea46bfe907acc09315505174.1652762652.git.huangy81@chinatelecom.cn>
 <20220518150504.w3atejqy6xalap5g@redhat.com>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <20220518150504.w3atejqy6xalap5g@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.221;
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



在 2022/5/18 23:05, Eric Blake 写道:
> On Tue, May 17, 2022 at 02:35:01PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Introduce "vcpu-dirtylimit-period" migration parameters,
>> which is used to makes dirtyrate calculation period
> 
> make
> 
>> configurable.
>>
>> To implement that, refactor vcpu_dirty_rate_stat_collect
>> so that period can be configured instead of hardcode.
> 
> hardcoded
> 
>>
>> Meanwhile, introduce migrate_dirtylimit function to help
>> check if dirtylimit enabled during live migration, set
>> it false by default.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
> 
> Focusing just on UI...
> 
>> +++ b/qapi/migration.json
>> @@ -760,6 +760,9 @@
>>   #                        block device name if there is one, and to their node name
>>   #                        otherwise. (Since 5.2)
>>   #
>> +# @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
>> +#                          Defaults to 500ms. (Since 7.0)
> 
> The next release is 7.1.  You'll need to fix this and all other references.
Ok, i'll fix that in the v1.
> 
> Do we want 'dirty-limit' instead of 'dirtylimit'?  There was a recent
> thread on how to translate QAPI to other languages that are a bit more
> insistent on MixedCase, where properly separating English words makes
> it easier to translate to the expected case.
> 
Changing the parameter name sounds ok to me, i'm not insistent that。
>>   ##
>>   # @migrate-set-parameters:
>> @@ -1125,6 +1132,9 @@
>>   #                        block device name if there is one, and to their node name
>>   #                        otherwise. (Since 5.2)
>>   #
>> +# @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
>> +#                          Defaults to 500ms. (Since 7.0)
>> +#
>>   # Features:
>>   # @unstable: Member @x-checkpoint-delay is experimental.
> 
> Is this feature ready for prime time, or do we want to initially name
> it x-vcpu-dirty[-]limit-period to mark it experimental?
Indeed, for this fresh new feature, finding factors affecting migration 
need more practice, marking it experimental could be much safer, i'll do 
that in v1.
> 

-- 
Best regard

Hyman Huang(黄勇)

