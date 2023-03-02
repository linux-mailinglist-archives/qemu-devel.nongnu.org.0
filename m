Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693EC6A78B4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 02:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXXR8-0003B4-Oy; Wed, 01 Mar 2023 20:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXXR2-0003AL-64
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:08:43 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXXQz-0005fV-QH
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:08:39 -0500
Received: by mail-pj1-x1032.google.com with SMTP id x34so15291147pjj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 17:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677719314;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=58rcE+Z08mOHZlZdTg9N8MxYMc/4/qOU44tkGmFeBDU=;
 b=E5dl3Oav068fMX6c2BVVSbQ94VjprkeGhWT7TzbxlNTgV2BSPzWeuQVQDCYpz6Ql9e
 SlbzEvL2pwQIOKm9ZfcP0ZIU72MN+e5cRXolnXeIoFENofsQOR1pAJ6bB1lERWyyU6zK
 /i88bu+GAD3W8Fcm1uGHW57GUzsy5p51ukjMlgKQMt+PQJ+HIq/cv+WNALoIJ6xC4Zj4
 2fB1UzH1y/oiIhfTyddyZlEJggcQXmaDilwL7QqNQPlV1Aa8MZTDb14shI86jEp92u1G
 p2VGaIzjYMnqkzPudhC6HPLKFsU+CCUdCRX/rC4w44JVp1RzPMquoLi3ERD56HkvxipG
 j04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677719314;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=58rcE+Z08mOHZlZdTg9N8MxYMc/4/qOU44tkGmFeBDU=;
 b=AFtibHu0YeiuwWMOcgrXuJEqltwudd5DGd0OdLTeKJ5/d6RLnTKJAEFWDSGbstyvEY
 59+GxwRnq/BwNXXL5Hy/oef+LLZjdaLTpmJLua80g2VbDBfb42RrRlLQhenMAJybz8nx
 oDkL6gjLwDLPZbmhglQ887yrbG4LRoRgehpRJP/Ef/TBL19a0XTBY9aUF1N8VQidgZIZ
 u7dfXIPWVWw+2mVapPdL5rH2eZc8z9Ct2Ci1Zq844d+LYyKBkQqpMAYrS43GCoLoFMmR
 V9ASjOtmI2J7Ga2j6ms9pswzMYNV515nf+N3iD2CUMZ2GNIoqpje7jDErxldKOlMiNiG
 3bzg==
X-Gm-Message-State: AO0yUKXE6L+Bv1wu9WYO3K/uHkhLD3TWX/D2LjI2YXioTeNSKHDB/KmG
 dlVRwbbtsBV0ZVgLy7CPnxLN9g==
X-Google-Smtp-Source: AK7set/91NM/CzkHfX9eJ2HU6ZV5InJEMSNm9dqnzHbGIGsrgPDvxFkV3YMjmGrXUXAXvV0ToIrT+Q==
X-Received: by 2002:a17:90b:4b90:b0:237:b5d4:c0cc with SMTP id
 lr16-20020a17090b4b9000b00237b5d4c0ccmr9207965pjb.39.1677719313867; 
 Wed, 01 Mar 2023 17:08:33 -0800 (PST)
Received: from [10.3.43.196] ([61.213.176.13])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a17090a930b00b00234afca2498sm355483pjo.28.2023.03.01.17.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 17:08:33 -0800 (PST)
Message-ID: <f17630d0-fc84-d8a2-6d93-4d99eae47603@bytedance.com>
Date: Thu, 2 Mar 2023 09:06:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Re: [PATCH v5 07/12] hmp: add cryptodev info command
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, pbonzini@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, berrange@redhat.com
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
 <20230301025124.3605557-8-pizhenwei@bytedance.com> <Y/8tRTK4iMDtiElR@work-vm>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Y/8tRTK4iMDtiElR@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 3/1/23 18:47, Dr. David Alan Gilbert wrote:
> * zhenwei pi (pizhenwei@bytedance.com) wrote:
>> Example of this command:
>>   # virsh qemu-monitor-command vm --hmp info cryptodev
>> cryptodev1: service=[akcipher|mac|hash|cipher]
>>      queue 0: type=builtin
>> cryptodev0: service=[akcipher]
>>      queue 0: type=lkcf
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> 
> Yes, I think that's fine from HMP; you might want to use some of the
> qapi list macros;
> 
> 
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 

Sorry, I missed this in the v6 series. I prefer a followup patch to do 
this minor change, or in the next version(if there is any problem in the 
v6 version).

Thanks!

>> ---
>>   backends/cryptodev-hmp-cmds.c | 54 +++++++++++++++++++++++++++++++++++
>>   backends/meson.build          |  1 +
>>   hmp-commands-info.hx          | 14 +++++++++
>>   include/monitor/hmp.h         |  1 +
>>   4 files changed, 70 insertions(+)
>>   create mode 100644 backends/cryptodev-hmp-cmds.c
>>
>> diff --git a/backends/cryptodev-hmp-cmds.c b/backends/cryptodev-hmp-cmds.c
>> new file mode 100644
>> index 0000000000..4f7220bb13
>> --- /dev/null
>> +++ b/backends/cryptodev-hmp-cmds.c
>> @@ -0,0 +1,54 @@
>> +/*
>> + * HMP commands related to cryptodev
>> + *
>> + * Copyright (c) 2023 Bytedance.Inc
>> + *
>> + * Authors:
>> + *    zhenwei pi<pizhenwei@bytedance.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or
>> + * (at your option) any later version.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "monitor/hmp.h"
>> +#include "monitor/monitor.h"
>> +#include "qapi/qapi-commands-cryptodev.h"
>> +#include "qapi/qmp/qdict.h"
>> +
>> +
>> +void hmp_info_cryptodev(Monitor *mon, const QDict *qdict)
>> +{
>> +    QCryptodevInfoList *il;
>> +    QCryptodevBackendServiceTypeList *sl;
>> +    QCryptodevBackendClientList *cl;
>> +
>> +    for (il = qmp_query_cryptodev(NULL); il; il = il->next) {
>> +        g_autofree char *services = NULL;
>> +        QCryptodevInfo *info = il->value;
>> +        char *tmp_services;
>> +
>> +        /* build a string like 'service=[akcipher|mac|hash|cipher]' */
>> +        for (sl = info->service; sl; sl = sl->next) {
>> +            const char *service = QCryptodevBackendServiceType_str(sl->value);
>> +
>> +            if (!services) {
>> +                services = g_strdup(service);
>> +            } else {
>> +                tmp_services = g_strjoin("|", services, service, NULL);
>> +                g_free(services);
>> +                services = tmp_services;
>> +            }
>> +        }
>> +        monitor_printf(mon, "%s: service=[%s]\n", info->id, services);
>> +
>> +        for (cl = info->client; cl; cl = cl->next) {
>> +            QCryptodevBackendClient *client = cl->value;
>> +            monitor_printf(mon, "    queue %" PRIu32 ": type=%s\n",
>> +                           client->queue,
>> +                           QCryptodevBackendType_str(client->type));
>> +        }
>> +    }
>> +
>> +    qapi_free_QCryptodevInfoList(il);
>> +}
>> diff --git a/backends/meson.build b/backends/meson.build
>> index 954e658b25..b369e0a9d0 100644
>> --- a/backends/meson.build
>> +++ b/backends/meson.build
>> @@ -1,5 +1,6 @@
>>   softmmu_ss.add([files(
>>     'cryptodev-builtin.c',
>> +  'cryptodev-hmp-cmds.c',
>>     'cryptodev.c',
>>     'hostmem-ram.c',
>>     'hostmem.c',
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
>> index 2220f14fc9..e6cf0b7aa7 100644
>> --- a/include/monitor/hmp.h
>> +++ b/include/monitor/hmp.h
>> @@ -178,5 +178,6 @@ void hmp_ioport_read(Monitor *mon, const QDict *qdict);
>>   void hmp_ioport_write(Monitor *mon, const QDict *qdict);
>>   void hmp_boot_set(Monitor *mon, const QDict *qdict);
>>   void hmp_info_mtree(Monitor *mon, const QDict *qdict);
>> +void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
>>   
>>   #endif
>> -- 
>> 2.34.1
>>

-- 
zhenwei pi

