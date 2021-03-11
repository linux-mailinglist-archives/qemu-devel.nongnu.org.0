Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC63D3370C6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:04:04 +0100 (CET)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJ6p-00074f-Uw
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lKJ4g-0005nU-Bt
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:01:50 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lKJ4d-0006Jj-8e
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:01:50 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dx5Z110HSz17J7r;
 Thu, 11 Mar 2021 18:59:53 +0800 (CST)
Received: from [10.174.186.85] (10.174.186.85) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 11 Mar 2021 19:01:35 +0800
Subject: Re: [PATCH v4 3/3] qmp: add new qmp display-reload
To: Markus Armbruster <armbru@redhat.com>
References: <20210224123419.786-1-changzihao1@huawei.com>
 <20210224123419.786-4-changzihao1@huawei.com>
 <87lfawu0sv.fsf@dusky.pond.sub.org>
From: Zihao Chang <changzihao1@huawei.com>
Message-ID: <799464b6-ac7b-9293-4508-105b81087687@huawei.com>
Date: Thu, 11 Mar 2021 19:01:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87lfawu0sv.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=changzihao1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, yebiaoxiang@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/3/9 17:35, Markus Armbruster wrote:
> Sorry for the delay, I missed this one.
> 
> Zihao Chang <changzihao1@huawei.com> writes:
> 
>> This patch provides a new qmp to reload display configuration
>> without restart VM, but only reloading the vnc tls certificates
>> is implemented.
>> Example:
>> {"execute": "display-reload", "arguments":{"vnc-tls-certs": true}}
>>
>> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
>> ---
>>  monitor/qmp-cmds.c | 12 ++++++++++++
>>  qapi/ui.json       | 32 ++++++++++++++++++++++++++++++++
>>  2 files changed, 44 insertions(+)
>>
>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> index c7df8c0ee268..02ac2fdb1a47 100644
>> --- a/monitor/qmp-cmds.c
>> +++ b/monitor/qmp-cmds.c
>> @@ -334,3 +334,15 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
>>  
>>      return mem_info;
>>  }
>> +
>> +void qmp_display_reload(DisplayReloadInfo *arg, Error **errp)
>> +{
>> +    Error *local_err = NULL;
>> +
>> +    if (arg->has_vnc_tls_certs && arg->vnc_tls_certs) {
>> +        if (!vnc_display_reload_certs(NULL, &local_err)) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>> +    }
>> +}
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index d08d72b43923..922d9ae0772e 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1179,3 +1179,35 @@
>>  ##
>>  { 'command': 'query-display-options',
>>    'returns': 'DisplayOptions' }
>> +
>> +##
>> +# @DisplayReloadInfo:
>> +#
>> +# The basic information for reload Display configuration
>> +#
>> +# @vnc-tls-certs: whether to reload tls certs
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'struct': 'DisplayReloadInfo',
>> +  'data': { '*vnc-tls-certs': 'bool' } }
>> +
>> +##
>> +# @display-reload:
>> +#
>> +# Reload display configuration
>> +#
>> +# Returns: Nothing on success
>> +#
>> +# Since: 6.0
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "display-reload",
>> +#      "arguments": { "vnc-tls-certs": true } }
>> +# <- { "return": {} }
>> +#
>> +##
>> +{ 'command': 'display-reload',
>> +  'data': 'DisplayReloadInfo',
>> +  'boxed' : true }
> 
> Why 'boxed': true?
> 
Completed the modification.
And patch set v5 has been sent.

> What about:
> 
>    ##
>    # @display-reload:
>    #
>    # Reload display configuration
>    #
>    # Returns: Nothing on success
>    #
>    # Since: 6.0
>    #
>    # Example:
>    #
>    # -> { "execute": "display-reload",
>    #      "arguments": { "vnc-tls-certs": true } }
>    # <- { "return": {} }
>    #
>    ##
>    { 'command': 'display-reload',
>      'data': { '*vnc-tls-certs': 'bool' } }
> 
> .
> 

