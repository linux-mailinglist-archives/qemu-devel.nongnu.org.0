Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAE1479AB4
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 13:25:05 +0100 (CET)
Received: from localhost ([::1]:56576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myYlr-000811-JT
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 07:25:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYjF-0005Ox-Jl; Sat, 18 Dec 2021 07:22:24 -0500
Received: from [2a01:111:f400:fe07::702] (port=63337
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYjC-0007f0-Fv; Sat, 18 Dec 2021 07:22:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtDgsEvwGQ4YWoMtro82u2diNo6WosJwx1d/TDFhGnaXyrlYuSxA9gdcvQmCDyTg4cosp9NYlo5KvLwE2RacytvTI/eyUgCMX5Q0aaD4bLOQw+lZ7QusYkWR3gE46E/MasRLaQrdtqjgX3bY0Vl3O4OXW2BctW74nUFmzzOMc465/dKS0vwjVGed+wAcpZKHVCyGvhFOKDBhNCO8XEitbkaIEGYemNr9cgHprHcrUkuCaBDhfKmPVMzajDTxEEs/FKqcYzVRx43E+AYfEUAwZCZkiB8egbj06Szm4CO0SilDpT+ymLD0IoF+q9Ztxrw7/8oUnuoEynGbkpNJ1j6sNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6J+bXuQfPpGv7/UJeV753g9CYRV5AgADU9mkJckJak=;
 b=bHi+OTED8D7DVaJPVc4H1MCnRHCSMW9OzxiIBeb57FpUNYWbzw6y3UYYoneAN/s7/zcpOJ2R6KFTwkdsuyxsLipGQ3pBTO3/a6LN5IEKtd4/CH6R+g+KUtGo8DPCiF7DfSYsmlpmzlruCd8rfNbGlqRxzdr/pNPBiclWRZNF3GZc2PKW38VgEAWuVeWdDqLG6xhRumXuAkt/QBud3bLq5w1HmzizIEPH6jvQmZ8qRtGHWUBLI23GXvsfgbqFA0zG4VXsHeT7z3G1/A8aULdaizO9tqKB18p4RIUPdL9dTT+K2jRNsFVXirp+PjhmLd7rFdYPeoddnmk1nJwMUvSiDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6J+bXuQfPpGv7/UJeV753g9CYRV5AgADU9mkJckJak=;
 b=okmglWsmxGoQn1EGn72euhnV+m7m1JdrmobLO6RB05ejhJmrOLGglAmpqKwByoRP6dxoUn9PtaISimLZws71zJVwNBsKZvwzRvgWRCukGa+mqOsNpuCTC3wwJMziGeIuF4brfDkrmKHd7VmoquzAIYO+5Aosxr8UbASLHVWiog0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4435.eurprd08.prod.outlook.com (2603:10a6:208:144::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Sat, 18 Dec
 2021 12:22:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Sat, 18 Dec 2021
 12:22:14 +0000
Message-ID: <7e2e1bfb-e093-3854-eca0-0f63d1daeeb8@virtuozzo.com>
Date: Sat, 18 Dec 2021 15:22:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 13/14] jobs: add job lock in find_* functions
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-14-eesposit@redhat.com>
 <c1919268-88bd-6fae-0bbc-4ebe7830e7b4@virtuozzo.com>
In-Reply-To: <c1919268-88bd-6fae-0bbc-4ebe7830e7b4@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 18 Dec 2021 12:22:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad7d7bda-59c1-4854-c565-08d9c2210637
X-MS-TrafficTypeDiagnostic: AM0PR08MB4435:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB443532A709A80C422AB5BFB5C1799@AM0PR08MB4435.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Rg57jzXEa8MNJvgU5W+G//IzzpuI/9cxkhbFZjq5msM2IMG3yUiq3K9VkjZvYGdN2Yr5AAMIpzEmQL8qLbbgxgyLZpOvG5q7m7i8Zhl7cosZDgU90TG2gCNsG8Cb22LPSDm8ERbXI7LxfUS93CWn+E3m7BFiywbW+Jf4cfryuJ6XXjNSxvQwY7tsI6WjtbTcwF1+c1IVc3WIUJr7GKr7g9YQBgL/03w3I6Bo1NjrwO0L1vEFWx1NgJH7P9idpFI+Ednu/lQLfDIWPUClW/7CGAnCa7TJoAbIwcio+gLoSJPwpEchiNbajoEEbyUfaDGW7093xuQkr0rsa+ptmInukoVH8QQc6xa2GeJgri/1zk9AtSaMAcSCRU2REDXFM8xlxJXCs4azEGPpkIjSarukb1xD/uF1pDC1OEPfJDMTZHAeuU7lWmeh3wlaO+r+N91ik2Z+mAlTt+dEa6hQ+WwZRb80+21XpF7KkB14iP5XT9UP5aaPmuQlerl6Dss7l9UpMQRea0s/zw5CsBtW0Mj7s9iECXMqp3nM/hFFnIm66MGEKwiinKMYBSluOeh/uMj6d6msXslZZNj4Jm91uFu427JSf+Tmwm+BCuoG1JuB5x+RH0b2JRNaMoUBVQrzGVHgad8HRZlPi1IhkioreWZnouJV/LDLnD7EnMijSBQhhsud0dqthme2STfb14Hi4bH6aWkjSLP1QSGgqMlV4Rh1K318JpViYz93ZbHWHbL+T3+sFVymWH3/uCXU+CIpdhRznHxJmPHbb1UnwpTNJa7sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(36756003)(2906002)(2616005)(26005)(8676002)(38100700002)(956004)(8936002)(316002)(54906003)(186003)(16576012)(5660300002)(83380400001)(66946007)(508600001)(31686004)(86362001)(66476007)(66556008)(7416002)(52116002)(4326008)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmNkTFV6TE1CTGtySWpXRFJFeE53dzZlcTB4anVxRnZQaUQ0aGpKb2dCTlIx?=
 =?utf-8?B?Q0FvcU1vZm1VcVZndktacTVQMXdQSXNEejZrbm5RWEc4ay9qdHZieGQyTEdw?=
 =?utf-8?B?ZlNCNWFNbFhVSjMrRWVib3RNMitxQXVyOEVRbVBxaEp0VDRtOGlRTGdNbVRE?=
 =?utf-8?B?bWR4QU0xTUdNT2tHVFFWU3FYUklZOHcxMWUwaGM4L2JwcnFVMWFGeVdzWHFu?=
 =?utf-8?B?NmhLMnR5OUlNeUgyd3FiQzc1K1cwVzFOcEJQOG1hVUNlUXd4YWVKZm5NR3Qx?=
 =?utf-8?B?YkZWVFpDRkIxaE04bWJTc281NW9JL2RDUjZqNHJibEE0STMyenVuTE5sVUQ3?=
 =?utf-8?B?eVdNQVZVeWtJYlg0K2p2dnJnTlROelkveEVsbmdFQ0dKcWNqTmV2eUJ6YzBE?=
 =?utf-8?B?cy9va0tta1dEMlNlQUFzUnFxUEFSdko1Vkx0aHVsaHU3UXRjSWFENG5aZUFv?=
 =?utf-8?B?dk5tNU95RWc5WHRJcTU3UldWbFMyOFRvOUsrbTEzYjRSRWRPcUp3Qm1Fc05Z?=
 =?utf-8?B?MWswdW1uUkIzRi8wMGJsb2NnM0RiY25lN1FHUkdmYTQyTmMwZUk1M0hsUGFm?=
 =?utf-8?B?YXZtZEpVSEx6RFhocXFFMFBWaVpCM3NlTTRJbWZnNjhiT05HOHdhaGdZSXdX?=
 =?utf-8?B?a3UweVE1TExHSDBhQWZSRThlY3BsSGRLSWNRcVhWVU9PRFBxcEZ4RUFlZENa?=
 =?utf-8?B?TlJoWUR1bVYxM2tBMnZKNVZmejczQUVUWHlIbm5mSG5JTVE3MC9yWTcrZlly?=
 =?utf-8?B?NEpqOVNmUVhJWStRSW12N3l1SVFwRXFDbko0bDN4MnFlOEc5NTFUeENON2No?=
 =?utf-8?B?ZWxIRUZGUVNnVlN3TWRabVMzdlhUeUpaUmx1Z2c4V014SWlFS0hXQzZiZ2JL?=
 =?utf-8?B?elVaODF2T3ZwamY1d2ptUyswWkY0bnJUWkZvdVlkSlQvWTlPbHB6R1IxSS9u?=
 =?utf-8?B?eGIzUzFJQ2xLanJINlFtSm9nSHlrR3g5enF4NTFjclBsSkU2Zi90ZHMrVkpB?=
 =?utf-8?B?RlVnbVUyZ3htUFhUenp3MndSbml0MmluczFiM1UvZElqSE90Z1VUOWw5TFNB?=
 =?utf-8?B?TDRkUjJ5WStXUnpPZjhjeVFZMWZUZzExSHh6anpuaU1yMUdNWktUUms3djUv?=
 =?utf-8?B?OC9oWVJvWlV1ak5iNnFIeUhSRTRCYjFJSUhvcnpGcHZoQTIySW1qek13TW9h?=
 =?utf-8?B?N1N1Yy9mUXB0TzFRbXVkT0RVNTlpQXIvUHRLZmRndkNJbjFkVXJHWEJmalo5?=
 =?utf-8?B?eFZXWkpid2dJYXNYejBUd2ZGOXcwR2xPQmo3THFFTTZTUGlMTE02WGFscEtl?=
 =?utf-8?B?clRQd2lXOTV3VnR3a2paeW1BeUNPYUxQREMzMWk1WUNQZzZZeUxQcDlMdkJO?=
 =?utf-8?B?R0d1OXpmU25DTDArb0NydG9UMXZ3b2RYRTR0MEVmUC9JMU0zbXREUUpCTXM2?=
 =?utf-8?B?L1pJUjJrSTdESzNpRmNuQmtUaWVtQXYwcjJFOUpqY05QazhVbkRyWlJObmNq?=
 =?utf-8?B?MjlxU1lXNlR6MVdPK3N1dGI0QVN6ZkFKcndnb0xsSTMxenBTcXd6WUxHb2Y1?=
 =?utf-8?B?c0cxdmYxWkoyRlBuYTNrdy9zaGh2UEpkemJoS2VBZlN5Y1B2UW9PeXZQZEhJ?=
 =?utf-8?B?SEo1V1hTQi83aFNsQmh5azU5Vm50TUlhS3hRQXp5RXlBVU14QjZIdDBDZlRj?=
 =?utf-8?B?RW10T0I1d2RVd2lReDdDNW1pK2NWeHRtYkU5VnkzZnRNRFkxNkZVODdwRmUw?=
 =?utf-8?B?dU9KbzBuRlBQRVNpZVdWelAyMGVBNFpnaDZNcndtaXN1ZEh6SVFiYVFpM0dw?=
 =?utf-8?B?b2Fwd0VWU1FEamNVbjBsMFU0VTZxMHF0Vk1OTDcza1Z6MDhMTzRsV095aktv?=
 =?utf-8?B?blFaNDE0TlFod08yRjVHbjZwSk02Z3k3VU90Q1VrNDVELzZaS1U2V3lEU2Zz?=
 =?utf-8?B?RWcwTjg1QmozQVZ4ci9JU1ozMy9uK1JQR09FTnJuR3RmWkpRcmhoYVF4ZUtP?=
 =?utf-8?B?NzRoT3pHRTBWWnVEc3VNejZvVHRSakc5d0pUOGx5dHRFdGVjeXNWZExIWmM3?=
 =?utf-8?B?WXVXQnYrZXJUM1VpeS9QSUpxUjUvdzlDcXVHZGwxK3lyVHRITkJocEUzd3A5?=
 =?utf-8?B?VHlXQjhtUURuOFpSaVlYL0JIbkdzQ3BzdVU1UFdqclJzVmk4dEJyTW5nNEhP?=
 =?utf-8?B?b0h1NmpzVUtQbmlpYmtRR1hYclJlakRoc3JQeUdKdUREbFhZbmtKbUpMVit1?=
 =?utf-8?Q?txJ6nXvCOWOvqt49klkhe/rdSBcIVMa9LdUfGdx+Z0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7d7bda-59c1-4854-c565-08d9c2210637
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 12:22:14.4430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GB4nrgtaTFgsyLL3lpm2huSzvPmen5C+5kJRW19qbjfmde+CzjF6dRGv8gAiuhsxLbKP0sC759wHNkEiTW1HjIwJadKXXzV9V6wnnSOCpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4435
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::702
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::702;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.12.2021 15:11, Vladimir Sementsov-Ogievskiy wrote:
> 04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
>> Both blockdev.c and job-qmp.c have TOC/TOU conditions, because
>> they first search for the job and then perform an action on it.
>> Therefore, we need to do the search + action under the same
>> job mutex critical section.
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   blockdev.c | 9 +++++++++
>>   job-qmp.c  | 8 ++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/blockdev.c b/blockdev.c
>> index c5a835d9ed..0bd79757fc 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -3327,12 +3327,14 @@ static BlockJob *find_block_job(const char *id, AioContext **aio_context,
>>       assert(id != NULL);
>>       *aio_context = NULL;
>> +    job_lock();
> 
> JOB_LOCK_GUARD() will look better in this case
> 
>>       job = block_job_get(id);
>>       if (!job) {
>>           error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE,
>>                     "Block job '%s' not found", id);
>> +        job_unlock();
>>           return NULL;
>>       }
>> @@ -3353,6 +3355,7 @@ void qmp_block_job_set_speed(const char *device, int64_t speed, Error **errp)
>>       block_job_set_speed(job, speed, errp);
>>       aio_context_release(aio_context);
>> +    job_unlock();
> 
> You add job_unlock(), but not job_lock() ? Something is wrong. And anyway, I thin JOB_LOCK_GUARD / WITH_JOB_LOCK_GUARD are generally safer

Ah, I understand now what's going on. If comment "Returns with job_lock held on success" appear in this patch, it would be more obvious.

-- 
Best regards,
Vladimir

