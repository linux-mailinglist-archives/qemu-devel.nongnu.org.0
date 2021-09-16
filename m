Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A3340DA6F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:58:08 +0200 (CEST)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqxr-0007Ab-Gx
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQqug-0003ro-Bm; Thu, 16 Sep 2021 08:54:51 -0400
Received: from mail-am6eur05on2090.outbound.protection.outlook.com
 ([40.107.22.90]:31136 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQquc-000074-W7; Thu, 16 Sep 2021 08:54:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCkVwm7p1GNnD6rNjsggekX46cQ07EMG79bQYI1AEyPOveIgcHUlpxKsZ1fWrAhkSy4Xw781EFJF/Cakp4RWo5lI5j7GyaLktqlDbPdSwy3eAYSewN/2Tb0vpFG7Gqq6PO4VW8u5ZnShRD7OsltbuQcw/gf1U+3Ky1ilDALZnUT5yOUDnhdE1MJtvE2CSH5PO4eQTtAAgQlD2yLKBIyB0MHonUb61vEu+PcMfclAvYy9psPstHqelFEQNrwbIfgn8fYe3woJMLbIkq2eoK+xC37xX+lMQUA9Y2LfSKvZxPnyFIPQObLhUjQ0tV9pZ8Dx+RxnO5+uCmeBNCZI6+GSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=p7CsMD8dV89Tk8d1Kh4r5wy172lVeccqMoq4vCq/22E=;
 b=bgQJshUxWnaabE9TCI8BDapXA3sppL1NPDnOBBsObX++dT92ZLwi20T+QPJrqDL75Gc4lATUAVMGIyNZrXfguSR2nRQhyZy8JYWrNiHw7350VkOGt3MGk+UbljMj6mECZf8HACel0Q5ojmX6kRwYPo/fWXKR0h31+pu6rsg2Bnv3KQQkuux1kbv0aCBZuygLNwwmxEf/EbORTTkfxpRBR6y1Ry0KEpAzeAYzH2IbwKDDepGdq4NUb/SaVv4UPDU8i+NsBthrgEgjMLUe/dtASvJfnEdx/rNfyZzVEytPDBPmP4eYC3GbtJpNNeZqrdV1pRklvjdhc31yCRCzuEN2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7CsMD8dV89Tk8d1Kh4r5wy172lVeccqMoq4vCq/22E=;
 b=AqFU7om/HL9gh9foQcL1/E0u6ygmwZfzT3+ob/8vJPYDRtOU/YSGJq0wQ6eQmiB4OmH7wyBWW04K7wGaiW+n3GtFJ+RJRH9cdjINgwHjIAVHIw3r6nG5WIb9fLOLN+UDlqC3DN+OK2ewN0f1WYeDhcldl65P1m1vkZe1PatyqB4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6887.eurprd08.prod.outlook.com (2603:10a6:20b:38e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 12:54:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 12:54:42 +0000
Subject: Re: [PATCH 5/8] qdev: improve find_device_state() to distinguish
 simple not found case
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, ehabkost@redhat.com,
 berrange@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 nshirokovskiy@virtuozzo.com, yur@virtuozzo.com, dim@virtuozzo.com,
 igor@virtuozzo.com, pkrempa@redhat.com, libvir-list@redhat.com,
 stefanha@redhat.com
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
 <20210802185416.50877-6-vsementsov@virtuozzo.com>
 <87r1do7q3p.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f276f83d-3e41-5349-ffa1-a4282f6cfd35@virtuozzo.com>
Date: Thu, 16 Sep 2021 15:54:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <87r1do7q3p.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.205) by
 FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Thu, 16 Sep 2021 12:54:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b084e06-62eb-4a7f-4c7d-08d9791126e9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68875985553858338B817776C1DC9@AS8PR08MB6887.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8tsce1iiFuavgc/taQKAZY7sY2bT9YQOirR9vrOozwJH3xZt4LxrzEyuiJvCUMiHf85YVncNw5KqOWqzI5dIZR5L6As79bjBmTroKL8wiakzINNqngi9CZzhDUpbrwBOWBMLhs1yMjb2dvhayqe3zmaWs7yPEmnwZ9oTfMBs1DotHRIHDHbi9pIc3ES3O6R3mQP3D2wYxBYqkZpwCovjnqdDA2wkgfzruadDG/8YXxY3zMhOdeuCHe5eGmZs7zR1IMtu40HG603SZ7C6d2lXZrWhzVeVlpJj+pSpY3cbl1dUoQE8gMvT752IakuU2TKZ8lR2ndKj0fCQj6h3RwU82G84cJFCLS1f45l87TD72CS+PzpGizDYzgNmKQiVLTNFxn6kGiZcmE5e7fQuW46XYkf2KTm5Dz2JM/F5+/R7cbotQFvYPsWc7LuNfswADyDUqvY8F3y97+srAvRtNdmF5aKQeZlXd45KQwQuyG0HCoPzcJ5YLNZhbapYu/Pl8q2JI1Tugk0YcO5U1nqUxAWJM9NUJtsEtasJGmOsB1ww2fEM7r1Hqa6yx0+dvdyZtQAbxalbJEPf2Jyrj9HV46nV7R7e5pvIefax539B0RsnxoMfRXUE1KbHvKMTTPSvn+viWxgitTGQMOWl3nJ1dTlZgaG8VnC99p2NV+qckuXYGHFeTDeLu79Jk7+TY79FOOhdc2XWLMr6aLFqwQ1Lmhur7vZJkxcsNItTD29TAFh6U1XbGfzr9pptdzlXy+1n/ePFKBofJiOM8B+huwXrxpBoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(2616005)(26005)(186003)(956004)(86362001)(83380400001)(31696002)(5660300002)(66946007)(66476007)(66556008)(8676002)(8936002)(36756003)(2906002)(6916009)(52116002)(6486002)(478600001)(7416002)(316002)(16576012)(4326008)(38350700002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW9oN2NCai9vL3ZQdlVZNVQ1RThjOXdOa2NKOXZ4YTlkR0pGZHAydnU2dGFL?=
 =?utf-8?B?bnc3RFdJZnhRWjl6YUIzTjBjUTVRS2lWdTBja0pRYnlqcVhTQVdZNU14VEEy?=
 =?utf-8?B?TjNpWTJYTUM5SmI3M1FMZExUYm9mTGtHSlBCLy8rRjdXQVRCendsYSs1K1RV?=
 =?utf-8?B?MWwxL1RNNUJPTDZBT0ZHdUxxeUtZNjZkclQzSUxKRkxvNXJzNDdjK2l0aGFE?=
 =?utf-8?B?TVNiVVM4T0hIRkc1VWRETlBKNmxqVWE0cS90T2JyaitZKzlISXFYQm5KZjJJ?=
 =?utf-8?B?dGRXNnRUSzhnUVYzd2NCL1BEc3RtL2t4V3ZPS0s3YmpNazNiQWVkOGdxei9X?=
 =?utf-8?B?Y1BXbkxUblNuRDJER2RGTTJrWEZ1UXVCREdGVFFxYVN1R2NoMXN6dFpUVmlv?=
 =?utf-8?B?SFV3UWxyWmxKcEFHdG51TlhRa3E0MU1RYlBsOWxUY2VydC9JVEVyZkVrWURm?=
 =?utf-8?B?MHFwcDR5MUZVWndjMGF0UWltbXZlWWhKMFQyanNpSVh5czlnWk90c1Vkd2Qv?=
 =?utf-8?B?TGIxZ29EK3l5aU1MUWFGZXVONzQ1clRXSFU0ZlE4MGpXdmVwZjExQTRMUnFH?=
 =?utf-8?B?b1l6emxqek83eFMweHNiVjZWV3ozOVBmOXJTamErWkM3b3VhME9idWNCcUhL?=
 =?utf-8?B?K2ZFNVJnaWFJdGk1eENXeTIvdUQ2NGh2VmhzMGJQeG9lMkVsWG11Yld4WlJJ?=
 =?utf-8?B?K29pVkY1T0U0aUtxN2g4dHB3bWtKM090Snpsb3pCd1pkN0RYSmxtaGdtTE80?=
 =?utf-8?B?VGc4M2NycXBCRHZONGFjUlJ6cFE3VkIvMEdTR1Z4TzFRaUJ4Yk1yYmtMNXV6?=
 =?utf-8?B?ZEVBcWY1dFhpcXc0VGpZVklpNTFBTUlGbkJWSjNCN25USHhhNSszU20wMDEr?=
 =?utf-8?B?ejFRNkJNVlpXT2dQRENKNXRvSTAyTGIxS0ZGeWpwb08xd1dDdFJzLytzZlda?=
 =?utf-8?B?VEpqcXFqTFZ4NnNvMmg1T20xRklONWF5TXVVSDhZUmVpMWdka1NQM0diT1Fk?=
 =?utf-8?B?TkRwMVpEZ1JpVllxMndVNW1KeXBvbmpsZ1B0dGFpK0REeFZyWVN2MjQ5VHAx?=
 =?utf-8?B?MlV2Y1pDZk5rMlQvejV1NmozL3F4R215WEJGVXptTXRsV2prc2J3bUZmWUdv?=
 =?utf-8?B?Q29Sdllxa1RtdEFtT2xHYnZvcE5MQ3d1WWFqZThRZE9YSWhIWjZOdFA2d3VR?=
 =?utf-8?B?MDVLNlZsRUhYQVordHhLQTNuWXQ4dVdZN203VnRHK3VGR3djWCtHNE1qdnJ2?=
 =?utf-8?B?TzF5bEZnZm5LRldZUUQ0ckxGSlpDWCtNdXRFa2RWN1Z0c3o3MkVaaFcvK0VN?=
 =?utf-8?B?ZEN2eUZpeFVHb0w0aTB0UU1KWXJhbVdkOHNvd01la01EWER5ZE83cU9YVVAr?=
 =?utf-8?B?aE1sMWdHUEhOZ2VYNm5CcHZ3aG9YUCtzdHZmcEc0RVFzOVhiT1l5M2h1eDJD?=
 =?utf-8?B?SHR1RlBmb3BUNzd2Y1cvRTNxU214VVhnUzJ1ZGRLdkQxMG1yL1RxbHF2Ym9V?=
 =?utf-8?B?MThJU2NwYXd1MW1mM2FITnhnUmRsTVJPZXk2a3dQaDB4WUt4MGhZZTJMOG1I?=
 =?utf-8?B?bEVzUU4zS2FHSTMwSTVwaGFPR0VTb1BUeWR4d1M0TVhLRmg5US9LVTlQK013?=
 =?utf-8?B?TDRTSlNGMU5oOGF2YmdrUEVucnRybFRXQlV0WEJBR2lvTTBFQVd3ZE4yZGts?=
 =?utf-8?B?a2tJL2N1SXNEVEFTcWE3UGxhYk9KYWd0NHB5ZklSNmZHVmVLRXdqbVBOVTBT?=
 =?utf-8?Q?utjjvNq8TbKaveTB82JPTHl4uaLpMYClxkrl+M7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b084e06-62eb-4a7f-4c7d-08d9791126e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 12:54:42.7413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hao9ZiLHrMtoDCs1vedTeIWgoCUgo6ZJskcit5OKkh1FXDNX9sV+mZtq2fqnDK24qWuFHJjZrjKqQJTZty1Kb11gmRktZR2t8AzBrFXQpfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6887
Received-SPF: pass client-ip=40.107.22.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

16.09.2021 13:48, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> We'll need this for realizing qdev_find_child() in the next commit.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   softmmu/qdev-monitor.c | 48 +++++++++++++++++++++++++++++-------------
>>   1 file changed, 33 insertions(+), 15 deletions(-)
>>
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 721dec2d82..0117989009 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -819,7 +819,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
>>       object_unref(OBJECT(dev));
>>   }
>>   
>> -static DeviceState *find_device_state(const char *id, Error **errp)
>> +/*
>> + * Returns: 1 when found, @dev set
>> + *          0 not found, @dev and @errp untouched
>> + *         <0 error, or id is ambiguous, @errp set
>> + */
>> +static int find_device_state(const char *id, DeviceState **dev, Error **errp)
>>   {
>>       Object *obj;
>>   
>> @@ -835,17 +840,16 @@ static DeviceState *find_device_state(const char *id, Error **errp)
>>       }
>>   
>>       if (!obj) {
>> -        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
>> -                  "Device '%s' not found", id);
>> -        return NULL;
>> +        return 0;
>>       }
>>   
>>       if (!object_dynamic_cast(obj, TYPE_DEVICE)) {
>>           error_setg(errp, "%s is not a hotpluggable device", id);
>> -        return NULL;
>> +        return -EINVAL;
>>       }
>>   
>> -    return DEVICE(obj);
>> +    *dev = DEVICE(obj);
>> +    return 1;
>>   }
>>   
>>   void qdev_unplug(DeviceState *dev, Error **errp)
>> @@ -894,16 +898,25 @@ void qdev_unplug(DeviceState *dev, Error **errp)
>>   
>>   void qmp_device_del(const char *id, Error **errp)
>>   {
>> -    DeviceState *dev = find_device_state(id, errp);
>> -    if (dev != NULL) {
>> -        if (dev->pending_deleted_event) {
>> -            error_setg(errp, "Device %s is already in the "
>> -                             "process of unplug", id);
>> -            return;
>> +    int ret;
>> +    DeviceState *dev;
>> +
>> +    ret = find_device_state(id, &dev, errp);
>> +    if (ret <= 0) {
>> +        if (ret == 0) {
>> +            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
>> +                      "Device '%s' not found", id);
>>           }
>> +        return;
>> +    }
>>   
>> -        qdev_unplug(dev, errp);
>> +    if (dev->pending_deleted_event) {
>> +        error_setg(errp, "Device %s is already in the "
>> +                         "process of unplug", id);
>> +        return;
>>       }
>> +
>> +    qdev_unplug(dev, errp);
>>   }
>>   
>>   void hmp_device_add(Monitor *mon, const QDict *qdict)
>> @@ -925,11 +938,16 @@ void hmp_device_del(Monitor *mon, const QDict *qdict)
>>   
>>   BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
>>   {
>> +    int ret;
>>       DeviceState *dev;
>>       BlockBackend *blk;
>>   
>> -    dev = find_device_state(id, errp);
>> -    if (dev == NULL) {
>> +    ret = find_device_state(id, &dev, errp);
>> +    if (ret <= 0) {
>> +        if (ret == 0) {
>> +            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
>> +                      "Device '%s' not found", id);
>> +        }
>>           return NULL;
>>       }
> 
> Awkward.
> 
> Before, find_device_state() either finds something (and returns it) or
> doesn't (and sets @errp).
> 
> Afterward, it can fail to find in two ways, and only one of it sets
> @errp.  The existing callers laboriously fuse the two back together.
> The next commit adds a caller that doesn't.
> 
> Failure modes that need to be handled differently are often the result
> of a function doing too much.  Let's have a closer look at this one
> before the patch:
> 
>      static DeviceState *find_device_state(const char *id, Error **errp)
>      {
>          Object *obj;
> 
>          if (id[0] == '/') {
>              obj = object_resolve_path(id, NULL);
> 
> This interprets @id as a QOM path, and tries to resolve it.
> 
> On failure, @obj becomes NULL.  On success, it points to an object of
> arbitrary type.
> 
>          } else {
>              char *root_path = object_get_canonical_path(qdev_get_peripheral());
>              char *path = g_strdup_printf("%s/%s", root_path, id);
> 
>              g_free(root_path);
>              obj = object_resolve_path_type(path, TYPE_DEVICE, NULL);
>              g_free(path);
> 
> This interprets @id as qdev ID, maps it to a QOM path, and tries to
> resolve it to a TYPE_DEVICE.  Fails when the path doesn't resolve, and
> when it resolves to something that isn't a TYPE_DEVICE.  The latter
> can't happen as long as we put only devices under /machine/peripheral/.
> 
> On failure, @obj becomes NULL.  On success, it points to a TYPE_DEVICE
> object.
> 
>          }
> 
>          if (!obj) {
>              error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
>                        "Device '%s' not found", id);
>              return NULL;
>          }
> 
>          if (!object_dynamic_cast(obj, TYPE_DEVICE)) {
>              error_setg(errp, "%s is not a hotpluggable device", id);
>              return NULL;
>          }
> 
> Unclean.
> 
> If we somehow ended up with a non-device /machine/peripheral/foo, then
> find_device_state("foo", errp) would fail the first way, but
> find_device_state("/machine/peripheral/foo", errp) would fail the second
> way.  They should fail the exact same way instead.
> 
>          return DEVICE(obj);
>      }
> 
> Better:
> 
>      static DeviceState *find_device_state(const char *id, Error **errp)
>      {
>          Object *obj;
>          DeviceState *dev;
> 
>          if (id[0] == '/') {
>              obj = object_resolve_path(id, NULL);
>          } else {
>              obj = object_resolve_path_component(qdev_get_peripheral(), id);
>          }
> 
>          if (!obj) {
>              error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
>                        "Device '%s' not found", id);
>              return NULL;
>          }
> 
>          dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
>          if (!dev) {
>              error_setg(errp, "%s is not a hotpluggable device", id);
>              return NULL;
>          }
> 
>          return dev;
>      }

Looks simpler)

> 
> I'll post this as a cleanup patch.
> 
> Note that this function does two things, one after the other, namely
> 1. resolve a "qdev ID or qom path" string, and 2. convert to
> TYPE_DEVICE, with error checking.
> 
> Factor out the core of 1. into its own helper resolve_id_or_qom_path(),
> and the next commit can do something like
> 
>      obj = resolve_id_or_qom_path(parent_id);
>      if (!obj) {
>          return 0;
>      }
> 
>      dev = object_dynamic_cast(obj, TYPE_DEVICE);
>      if (!dev) {
>          error_setg(errp, ...);
>          return -EINVAL;
>      }
> 

Thanks for working that out, I'll go this way in v2

-- 
Best regards,
Vladimir

