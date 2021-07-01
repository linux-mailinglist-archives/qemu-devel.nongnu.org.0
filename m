Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4663B3B8EF7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 10:40:06 +0200 (CEST)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lysEu-00052s-Su
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 04:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lysE1-0004Mx-OI
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:39:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:18653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lysDx-0001mn-Qc
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:39:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="205491408"
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="205491408"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 01:38:54 -0700
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="457574649"
Received: from unknown (HELO [10.239.13.19]) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 01:38:51 -0700
Subject: Re: [PULL 3/6] hmp-commands: Add new HMP command for filter
 passthrough
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210625031136.2775308-1-chen.zhang@intel.com>
 <20210625031136.2775308-4-chen.zhang@intel.com> <YNxJ87c2ajCw1Oe4@work-vm>
From: "chen.zhang@intel.com" <chen.zhang@intel.com>
Message-ID: <2e26e916-7a1c-dc46-bed4-db566625596a@intel.com>
Date: Thu, 1 Jul 2021 16:32:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNxJ87c2ajCw1Oe4@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chen.zhang@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/30/21 6:39 PM, Dr. David Alan Gilbert wrote:
> * Zhang Chen (chen.zhang@intel.com) wrote:
>> Add hmp_passthrough_filter_add and hmp_passthrough_filter_del make user
>> can maintain object network passthrough list in human monitor
>>
>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> ---
>>   hmp-commands.hx       | 26 +++++++++++++++
>>   include/monitor/hmp.h |  2 ++
>>   monitor/hmp-cmds.c    | 76 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 104 insertions(+)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 8e45bce2cd..426a7d6cda 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -1292,6 +1292,32 @@ SRST
>>     Remove host network device.
>>   ERST
>>   
>> +    {
>> +        .name       = "passthrough_filter_add",
>> +        .args_type  = "protocol:s?,object-name:s,src:s?,dst:s?",
>> +        .params     = "[protocol] object-name [src] [dst]",
>> +        .help       = "Add network passthrough rule to object passthrough list",
>> +        .cmd        = hmp_passthrough_filter_add,
>> +    },
>> +
>> +SRST
>> +``passthrough_filter_add``
>> +  Add network stream to object passthrough list.
>> +ERST
>> +
>> +    {
>> +        .name       = "passthrough_filter_del",
>> +        .args_type  = "protocol:s?,object-name:s,src:s?,dst:s?",
>> +        .params     = "[protocol] object-name [src] [dst]",
>> +        .help       = "Delete network passthrough rule from object passthrough list",
>> +        .cmd        = hmp_passthrough_filter_del,
>> +    },
>> +
>> +SRST
>> +``passthrough_filter_del``
>> +  Delete network stream from object passthrough list.
>> +ERST
>> +
>>       {
>>           .name       = "object_add",
>>           .args_type  = "object:S",
>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>> index 3baa1058e2..ba6987e552 100644
>> --- a/include/monitor/hmp.h
>> +++ b/include/monitor/hmp.h
>> @@ -77,6 +77,8 @@ void hmp_device_del(Monitor *mon, const QDict *qdict);
>>   void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict);
>>   void hmp_netdev_add(Monitor *mon, const QDict *qdict);
>>   void hmp_netdev_del(Monitor *mon, const QDict *qdict);
>> +void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict);
>> +void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict);
>>   void hmp_getfd(Monitor *mon, const QDict *qdict);
>>   void hmp_closefd(Monitor *mon, const QDict *qdict);
>>   void hmp_sendkey(Monitor *mon, const QDict *qdict);
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 0942027208..26ff316c93 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1638,6 +1638,82 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
>>       hmp_handle_error(mon, err);
>>   }
>>   
>> +void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict)
>> +{
>> +    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
>> +    char *src, *dst;
>> +    Error *err = NULL;
>> +
>> +    spec->protocol = g_strdup(qdict_get_try_str(qdict, "protocol"));
>> +    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
>> +    src = g_strdup(qdict_get_try_str(qdict, "src"));
>> +    dst = g_strdup(qdict_get_try_str(qdict, "dst"));
>> +
>> +    if (src) {
>> +        spec->source = g_new0(InetSocketAddressBase, 1);
>> +
>> +        if (inet_parse_base(spec->source, src, NULL)) {
>> +            monitor_printf(mon, "Incorrect passthrough src address\n");
>> +            goto out;
> Are you leaking spec->source ?


Good catch.


>
>> +        }
>> +    }
>> +
>> +    if (dst) {
>> +        spec->destination = g_new0(InetSocketAddressBase, 1);
>> +
>> +        if (inet_parse_base(spec->destination, dst, NULL)) {
>> +            monitor_printf(mon, "Incorrect passthrough dst address\n");
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    qmp_passthrough_filter_add(spec, &err);
>> +
>> +out:
>> +    g_free(src);
>> +    g_free(dst);
>> +
>> +    hmp_handle_error(mon, err);
>> +}
>> +
>> +void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict)
>> +{
>> +    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
>> +    char *src, *dst;
>> +    Error *err = NULL;
>> +
>> +    spec->protocol = g_strdup(qdict_get_try_str(qdict, "protocol"));
>> +    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
>> +    src = g_strdup(qdict_get_try_str(qdict, "src"));
>> +    dst = g_strdup(qdict_get_try_str(qdict, "dst"));
>> +
>> +    if (src) {
>> +        spec->source = g_new0(InetSocketAddressBase, 1);
>> +
>> +        if (inet_parse_base(spec->source, src, NULL)) {
>> +            monitor_printf(mon, "Incorrect passthrough src address\n");
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    if (dst) {
>> +        spec->destination = g_new0(InetSocketAddressBase, 1);
>> +
>> +        if (inet_parse_base(spec->destination, dst, NULL)) {
>> +            monitor_printf(mon, "Incorrect passthrough dst address\n");
>> +            goto out;
>> +        }
>> +    }
> You could merge that into something like:
>
>     IPFlowSpec *hmp_parse_IPFlowSpec(Monitor *mon, const QDict *qdict)


OK, I will update to V2.

Thanks

Chen


>
> Dave
>
>> +    qmp_passthrough_filter_del(spec, &err);
>> +
>> +out:
>> +    g_free(src);
>> +    g_free(dst);
>> +
>> +    hmp_handle_error(mon, err);
>> +}
>> +
>>   void hmp_object_add(Monitor *mon, const QDict *qdict)
>>   {
>>       const char *options = qdict_get_str(qdict, "object");
>> -- 
>> 2.25.1
>>

