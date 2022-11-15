Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36AD628F91
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:53:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oul7l-0006Z0-PG; Mon, 14 Nov 2022 20:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oul7j-0006Yd-LG
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 20:52:27 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oul7g-0006DB-Jt
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 20:52:27 -0500
Received: by mail-pl1-x633.google.com with SMTP id p12so11806952plq.4
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 17:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pGN7jbnPNb1XVzcbq8HrvmmgVcfF+XM/hNeHfbSHSuM=;
 b=UYQFsDk7s4/Xn01m4OnM7B0wWPe+wUN4Wt28HRd8r8cD6ZeIJkHk7WnrjJaEhEHgqi
 ki1ZBYsx02OgZVHv6S8qGEdp97y+kwGYbKEFRegOe9TsMzisrlbEcJQQEyNpJTZDRiYY
 s+YBcuLDIEfzmdG3vn2gmV0iEI1TME4lF/aWbevK/QT6uT5Io6+XJ5KJnjiV6P5deQkf
 qBjkBGgNCqkmqy21ipuyvPQzCcj4PDHHLig1Z2s6JPxzx2HrHrkXblKsCbLBTiUefRNv
 oTT0o+rJQl2VzvdLul7jdpliEAMyjOPga1iwEgcTPh/GIiyX2iMy3zqqDigB0jyOK5zr
 oqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pGN7jbnPNb1XVzcbq8HrvmmgVcfF+XM/hNeHfbSHSuM=;
 b=vcHkqX3Mu9M57zRGx8pTvBFYNp/uza6c+YmOPSBZBwQ4kPLlfUmkafsP4f6mqb4NXV
 FThUGVFIejGVE/E2uBTZJUTXGOfR/91ajE+TlADiOsEtHATdmaIydjSaqjWkN8Xogkzz
 mtnSbUeWSt0RMfkfQcSUnEZqIpY6M99No8Yic3iqMWbxV4rFWnkBQ9qf5ezv9wfBMMli
 L2hiXMLc4L4rrcP/MPxNg0VEzTczxUjN0/QlpMEJbxJ601h5uOGZq/PXE1tX9LQ8K/mJ
 R+6GZ9LkSJiptXPeaD/rtDT/XNzUKDmYMZDlaQhCbV65ea/zANHrP8ASpzFT5gk3F2y+
 uH2Q==
X-Gm-Message-State: ANoB5pkcGAZb3pHKr1H2e+2VNGUtT3r2GgghDfC7QM8WsrUs1NV0bIUp
 cnI29y+kGm6Vqi1LrBPwWQaHxw==
X-Google-Smtp-Source: AA0mqf40G9a1NrBSLsflq9uKqU7M79Pg/Y10qj8beq13E4J/9SgjCsGAhukjtMPQvcCiVZ6LYjqA1g==
X-Received: by 2002:a17:90a:e610:b0:20a:78b7:9210 with SMTP id
 j16-20020a17090ae61000b0020a78b79210mr15637257pjy.138.1668477142104; 
 Mon, 14 Nov 2022 17:52:22 -0800 (PST)
Received: from [10.3.43.196] ([63.216.146.186])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a170902a3cc00b00186748fe6ccsm8229384plb.214.2022.11.14.17.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 17:52:21 -0800 (PST)
Message-ID: <a5f10b1f-2b2b-d407-1218-80a3791f08f6@bytedance.com>
Date: Tue, 15 Nov 2022 09:51:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Re: [PATCH for 8.0 8/8] hmp: add cryptodev info command
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: arei.gonglei@huawei.com, mst@redhat.com, eblake@redhat.com,
 armbru@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org
References: <20221111064553.246932-1-pizhenwei@bytedance.com>
 <20221111064553.246932-9-pizhenwei@bytedance.com> <Y3KGBiYh3QpzhVOX@work-vm>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Y3KGBiYh3QpzhVOX@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 11/15/22 02:16, Dr. David Alan Gilbert wrote:
> * zhenwei pi (pizhenwei@bytedance.com) wrote:
>> Example of this command:
>>   # virsh qemu-monitor-command vm --hmp info cryptodev
>> cryptodev1: service=[akcipher|mac|hash|cipher]
>>      queue 0: type=builtin
>> cryptodev0: service=[akcipher]
>>      queue 0: type=lkcf
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   hmp-commands-info.hx  | 14 ++++++++++++++
>>   include/monitor/hmp.h |  1 +
>>   monitor/hmp-cmds.c    | 36 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 51 insertions(+)
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index 754b1e8408..47d63d26db 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -993,3 +993,17 @@ SRST
>>     ``info virtio-queue-element`` *path* *queue* [*index*]
>>       Display element of a given virtio queue
>>   ERST
>> +
>> +    {
>> +        .name       = "cryptodev",
>> +        .args_type  = "",
>> +        .params     = "",
>> +        .help       = "show the crypto devices",
>> +        .cmd        = hmp_info_cryptodev,
>> +        .flags      = "p",
>> +    },
>> +
>> +SRST
>> +  ``info cryptodev``
>> +    Show the crypto devices.
>> +ERST
>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>> index dfbc0c9a2f..b6b2b49202 100644
>> --- a/include/monitor/hmp.h
>> +++ b/include/monitor/hmp.h
>> @@ -143,5 +143,6 @@ void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>   void hmp_human_readable_text_helper(Monitor *mon,
>>                                       HumanReadableText *(*qmp_handler)(Error **));
>>   void hmp_info_stats(Monitor *mon, const QDict *qdict);
>> +void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
>>   
>>   #endif
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 01b789a79e..3f1054aa1e 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -33,6 +33,7 @@
>>   #include "qapi/qapi-commands-block.h"
>>   #include "qapi/qapi-commands-char.h"
>>   #include "qapi/qapi-commands-control.h"
>> +#include "qapi/qapi-commands-cryptodev.h"
>>   #include "qapi/qapi-commands-machine.h"
>>   #include "qapi/qapi-commands-migration.h"
>>   #include "qapi/qapi-commands-misc.h"
>> @@ -2761,3 +2762,38 @@ void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
>>   
>>       qapi_free_VirtioQueueElement(e);
>>   }
>> +
>> +void hmp_info_cryptodev(Monitor *mon, const QDict *qdict)
>> +{
>> +    CryptodevInfoList *info_list;
>> +    CryptodevInfo *info;
>> +    QCryptodevBackendServiceTypeList *service_list;
>> +    CryptodevBackendClientList *client_list;
>> +    CryptodevBackendClient *client;
>> +    char services[128] = {};
> 
> I'd rather avoid magic length buffers; the magic is always the wrong
> number!
> 
>> +    int len;
>> +
>> +    info_list = qmp_query_cryptodev(NULL);
>> +    for ( ; info_list; info_list = info_list->next) {
> 
> maybe:
>   for ( info_list = qmp_query_cryptodev(NULL);
>         info_list;
>         info_list = info_list->next) {
> 
>> +        info = info_list->value;
>> +
>> +        service_list = info->service;
>> +        for (len = 0; service_list; service_list = service_list->next) {
>> +            len += snprintf(services + len, sizeof(services) - len, "%s|",
>> +                QCryptodevBackendServiceType_str(service_list->value));
> 
> Consider using a dynamically allocated string and then just using
> g_strconcat or g_strjoin() to glue them all together.
> 
>      new_services = g_strjoin("|", services,  NULL);   ?
>      g_free(services);
>      services = new_services;
> 
> Maybe?
> 
Hi, I'll fix these in the next version, thanks!

> 
>> +        }
>> +        if (len) {
>> +            services[len - 1] = '\0'; /* strip last char '|' */
>> +        }
>> +        monitor_printf(mon, "%s: service=[%s]\n", info->id, services);
>> +
>> +        client_list = info->client;
>> +        for ( ; client_list; client_list = client_list->next) {
>> +            client = client_list->value;
>> +            monitor_printf(mon, "    queue %ld: type=%s\n", client->queue,
>> +                          QCryptodevBackendType_str(client->type));
>> +        }
>> +    }
>> +
>> +    qapi_free_CryptodevInfoList(info_list);
>> +}
>> -- 
>> 2.20.1
>>

-- 
zhenwei pi

