Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987067F7DC
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 13:50:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLkf1-0001lX-1m; Sat, 28 Jan 2023 07:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLkev-0001lP-3R
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 07:50:17 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLket-0003qm-5e
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 07:50:16 -0500
Received: by mail-pg1-x52c.google.com with SMTP id s67so4839208pgs.3
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 04:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X8V6GWVVJ3vKEXd04wyUFu5C/pdLBajEHs0qWyquTjA=;
 b=tyVQeiGA/GNQq529+QV/4rZacLCrNHsoQ/1fE6OGF/Db2oQdMo7Z0ImNs6FkBsl5CX
 IKoai0fw3d+iU/PsWBYPw9llYQa3A8TyUG5JxkDbSYB9eo7fsP4dM5C5Sx022hg2v/Ou
 HU8cQD7wARJYn8PZzAknze3cUnivkMxoeLoVy9PMQms+4llbpTEEgPfSK9ACzvYjd1WR
 K0upA7fmIvuaWwaE2uRB/EcNZ3MFJfvkBA4ki4xo47KXSQifziHtShfg3UGBvZZmPwc/
 tlE7npWWuIWXOHRBDn1f78WU3cmks89gfZrWSSriQkxhjdT/p9HDgGJGTlD/G+lTn91W
 DDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X8V6GWVVJ3vKEXd04wyUFu5C/pdLBajEHs0qWyquTjA=;
 b=T8PgmCUO1NBfoviBc+jWXeUHs2gKhvqL6FIiyJrXOv7QtS9+hWIf7HiwR3jxq9Sq8l
 RfnOMl8zdVSsWKEuxbR2mffMBhaXNL6rETHKwKZuZ5H7Cvnq7YZhnfxcCJBKiRVFU7MJ
 +6GMsLeKdTVT7uKRWq6ZKZy/VsyaNAIcIYpsooaulL8twLlPjDouEVlrI5n1x/A3Ww7O
 E0bUWaxTSe2G59P++G9FoJA/YOivORI3bSzMUz5cpog49nhaeohHS5+Fs7sIT9ztOiwD
 ouDoUcZ36dgEacbuZ53OoKuJ2ZZg5P8rUqNxunVhsa/2JUWeGgoo0S6p3nJ8z//5HO5I
 4+qw==
X-Gm-Message-State: AFqh2krPvIWW+GtsVPoRXmVoSc417AIx251S9TKnUe2yLaFd0jTnvTvy
 9Ej/X42r7GTX3ESBIdOsV6RecA==
X-Google-Smtp-Source: AMrXdXtma/hAbSN4SAKOWQaio7kXnCm3EmoGGEwZFVtyKBhZBttjMzzf/tJwgQMLo/miOZQz67qlGA==
X-Received: by 2002:aa7:8198:0:b0:586:a3a9:6163 with SMTP id
 g24-20020aa78198000000b00586a3a96163mr41010911pfi.28.1674910213554; 
 Sat, 28 Jan 2023 04:50:13 -0800 (PST)
Received: from [10.4.162.76] ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 c64-20020a624e43000000b00586fbbdf6e4sm4283108pfb.34.2023.01.28.04.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 04:50:13 -0800 (PST)
Message-ID: <1d9e8fed-45b7-fed3-e3b4-e752c0362eae@bytedance.com>
Date: Sat, 28 Jan 2023 20:50:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Re: [PATCH v3 05/12] cryptodev: Introduce 'query-cryptodev' QMP
 command
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: arei.gonglei@huawei.com, berrange@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
 <20230128035633.2548315-6-pizhenwei@bytedance.com>
 <20230128062647-mutt-send-email-mst@kernel.org>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230128062647-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 1/28/23 19:30, Michael S. Tsirkin wrote:
> On Sat, Jan 28, 2023 at 11:56:26AM +0800, zhenwei pi wrote:
>> Now we have a QMP command to query crypto devices:
>> virsh qemu-monitor-command vm '{"execute": "query-cryptodev"}' | jq
>> {
>>    "return": [
>>      {
>>        "service": [
>>          "akcipher",
>>          "mac",
>>          "hash",
>>          "cipher"
>>        ],
>>        "id": "cryptodev1",
>>        "client": [
>>          {
>>            "queue": 0,
>>            "type": "builtin"
>>          }
>>        ]
>>      },
>>      {
>>        "service": [
>>          "akcipher"
>>        ],
>>        "id": "cryptodev0",
>>        "client": [
>>          {
>>            "queue": 0,
>>            "type": "lkcf"
>>          }
>>        ]
>>      }
>>    ],
>>    "id": "libvirt-417"
>> }
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   backends/cryptodev.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
>>   qapi/cryptodev.json  | 44 +++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 89 insertions(+)
>>
>> diff --git a/backends/cryptodev.c b/backends/cryptodev.c
>> index c2a053db0e..d51eeb5ee4 100644
>> --- a/backends/cryptodev.c
>> +++ b/backends/cryptodev.c
>> @@ -24,6 +24,7 @@
>>   #include "qemu/osdep.h"
>>   #include "sysemu/cryptodev.h"
>>   #include "qapi/error.h"
>> +#include "qapi/qapi-commands-cryptodev.h"
>>   #include "qapi/visitor.h"
>>   #include "qemu/config-file.h"
>>   #include "qemu/error-report.h"
>> @@ -33,6 +34,50 @@
>>   
>>   static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
>>   
>> +static int qmp_query_cryptodev_foreach(Object *obj, void *data)
>> +{
>> +    CryptoDevBackend *backend;
>> +    CryptodevInfoList **infolist = data;
>> +    uint32_t services, i;
>> +
>> +    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
>> +        return 0;
>> +    }
>> +
>> +    CryptodevInfo *info = g_new0(CryptodevInfo, 1);
>> +    info->id = g_strdup(object_get_canonical_path_component(obj));
>> +
>> +    backend = CRYPTODEV_BACKEND(obj);
>> +    services = backend->conf.crypto_services;
>> +    for (i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
>> +        if (services & (1 << i)) {
>> +            QAPI_LIST_PREPEND(info->service, i);
>> +        }
>> +    }
>> +
>> +    for (i = 0; i < backend->conf.peers.queues; i++) {
>> +        CryptoDevBackendClient *cc = backend->conf.peers.ccs[i];
>> +        CryptodevBackendClient *client = g_new0(CryptodevBackendClient, 1);
>> +
>> +        client->queue = cc->queue_index;
>> +        client->type = cc->type;
>> +        QAPI_LIST_PREPEND(info->client, client);
>> +    }
>> +
>> +    QAPI_LIST_PREPEND(*infolist, info);
>> +
>> +    return 0;
>> +}
>> +
>> +CryptodevInfoList *qmp_query_cryptodev(Error **errp)
>> +{
>> +    CryptodevInfoList *list = NULL;
>> +    Object *objs = container_get(object_get_root(), "/objects");
>> +
>> +    object_child_foreach(objs, qmp_query_cryptodev_foreach, &list);
>> +
>> +    return list;
>> +}
>>   
>>   CryptoDevBackendClient *cryptodev_backend_new_client(void)
>>   {
>> diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
>> index 8732a30524..940078ace0 100644
>> --- a/qapi/cryptodev.json
>> +++ b/qapi/cryptodev.json
>> @@ -43,3 +43,47 @@
>>   { 'enum': 'QCryptodevBackendType',
>>     'prefix': 'QCRYPTODEV_BACKEND_TYPE',
>>     'data': ['builtin', 'vhost-user', 'lkcf']}
>> +
>> +##
>> +# @CryptodevBackendClient:
>> +#
>> +# Information about a queue of crypto device.
>> +#
>> +# @queue: the queue index of the crypto device
>> +#
>> +# @type: the type of the crypto device
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'struct': 'CryptodevBackendClient',
>> +  'data': { 'queue': 'uint32',
>> +            'type': 'QCryptodevBackendType' } }
>> +
>> +##
>> +# @CryptodevInfo:
>> +#
>> +# Information about a crypto device.
>> +#
>> +# @id: the id of the crypto device
>> +#
>> +# @service: supported service types of a crypto device
>> +#
>> +# @client: the additional infomation of the crypto device
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'struct': 'CryptodevInfo',
>> +  'data': { 'id': 'str',
>> +            'service': ['QCryptodevBackendServiceType'],
>> +            'client': ['CryptodevBackendClient'] } }
> 
> So we end up with both CryptodevBackendClient and
> CryptoDevBackendClient. Please don't do this.
> 
>

Sorry, my fault, they should be *QCryptodevBackendClient* and 
*QCryptodevInfo^.

>> +
>> +##
>> +# @query-cryptodev:
>> +#
>> +# Returns information about current crypto devices.
>> +#
>> +# Returns: a list of @CryptodevInfo
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'command': 'query-cryptodev', 'returns': ['CryptodevInfo']}
>> -- 
>> 2.34.1
> 

-- 
zhenwei pi

