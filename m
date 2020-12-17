Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9262DD546
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:32:30 +0100 (CET)
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpwCb-00083c-6K
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1kpw9l-0006P6-8s
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:29:35 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com
 ([40.107.7.94]:5249 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1kpw9i-0006oK-Fj
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:29:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qb0a1GRxRwxPlribh2mcYOY12lapOkFz/EH2TWUnCvkY2IE93S74q/RGlN9klECSEx3a7RQd9gUS06Bp2MXDKt8AuCfNn4tR7VT2QmukdVc8yJulwZDjy4JYKSNbXKuoHbVC2yDZ6XKwdSS1KljfIWc6EXsepvzdQ9BFWMOJ0sHEPbK3dIAsPnrSviX4MfM6rJDdMH0D2epvjru4aWCDETiQDwNTx3TrOPVWkchbSg9x9p48anbiVu/xz69NjGusAHm6i3Z8kyGgq8AeCCgbdrwDawfcu0URhigsVQGCVygwKt7T1KsJNIOFg9Ur++AFdi5TkHxsdzu56OKY+AC+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVt3RKOcacJgI2IfbGUn/FedPo3J3I49fWUgyGyoXfg=;
 b=DU/4WGhsGs81nrs9NhKTJR0YuaV57KwjklifqiCWbzWlCYOPoOPU84IpzMXa8yfylsK4j4rKmzy8HqNqt+Q3SnVF2+2czgAw1sdvvpX57mrlqwBjTeZuTQv5gUa+DXttKF7SjZfKvVdUFv+L/zdlx7BzmzVdXqaJBKc3QI/TtMrbTOJgdFEN0CMA5gYz/viez6zoVK07PDtRY2yOMTn0a5D4hmrbRplIxhW5Y1jaC+MmMP3m+bLg2xD8YERf285XO8te3xIFl0OqvXC+FiHanMmhZ3WMoMnvZlkPmKGgdBJw50lVdaWGJMelftEgC2hz/D4VcAAbLoIfmJZVWhxk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVt3RKOcacJgI2IfbGUn/FedPo3J3I49fWUgyGyoXfg=;
 b=T7B1jIk4X/opSjm/LsKMWcc9jWzM0fAR/7Fqs7dfCejKjJpBt5vo9lLvOjeTXIW4SCS08ykMEvoGOq+kNgFrjcMlx8v0F5G8e3lBfiWumoVBEbPWWSoYkLYYOsW/gDrxRuQq1JLYJ8wws4+x6QXDWnqQddKq39LZ4v/9iZWqB9k=
Authentication-Results: outlook.com; dkim=none (message not signed)
 header.d=none;outlook.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM6PR08MB4343.eurprd08.prod.outlook.com (2603:10a6:20b:ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 17 Dec
 2020 16:14:24 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::311c:c7ce:56cc:1399]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::311c:c7ce:56cc:1399%5]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 16:14:24 +0000
Subject: Re: [PATCH 1/2] savevm: Remove dead code in save_snapshot()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Tuguoyi
 <tu.guoyi@h3c.com>, berrange@redhat.com
References: <1607410416-13563-1-git-send-email-tu.guoyi@h3c.com>
 <1607410416-13563-2-git-send-email-tu.guoyi@h3c.com>
 <20201217152708.GI4117@work-vm>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <5b4d677b-88aa-ab28-cc2a-dc7d1c4934b8@openvz.org>
Date: Thu, 17 Dec 2020 19:14:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201217152708.GI4117@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: HE1P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::18)
 To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.22] (31.148.204.195) by
 HE1P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 16:14:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59a4afc6-f6c1-4b94-e07c-08d8a2a6d1f9
X-MS-TrafficTypeDiagnostic: AM6PR08MB4343:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4343D2F0EDF6BC59473B81E5B6C40@AM6PR08MB4343.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BHWJYAxhFAJ7etVJmIgjfDFaloSMY+3T/cf1hSMvwpZzPywonTt+u2IS+TYo3qaAeFa3zni1J+A8b8577EDj7Ki3movEYNx0N9+OoqUNjAYZxHIB+Acmf7TcWXJXHASQTQQ9ng9wjdcN0Qu54H9ukljU23kI+Xhd6J4AtI5293qd2UresLxYQpiyWpjEE1xcJPvYJ9djR7j/rTF2jtlH5rx03G/EK3iF7IcBClpe0G5ZA78cTtBuTEs3smdUITs2yFWrcUfGHmjO0QzpjUl3cE4nepyWpWx2dg9zljT08BHKVDYsfs/wjkI1ZHDkgFQFjYFSSlnej3GDWERJEtgAlcyz00sLRNoCyLCvSYuYbDOE560B6yJB7Wv6aR/kIg2qSkRw+b0OHq2+stnva9Lb+a/Is9V7bkDt22A4IM/0I7TIBKOE2OewZoJG34dpISda
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39840400004)(52116002)(16576012)(42882007)(66476007)(8936002)(956004)(83380400001)(478600001)(110136005)(34580700001)(31686004)(66946007)(66556008)(5660300002)(316002)(31696002)(36756003)(16526019)(4326008)(53546011)(26005)(8676002)(6486002)(83170400001)(2616005)(2906002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUppM1pXQzk2UDYrdWNpZkRsTXJFTC9sRjdNTUtUSTUzNGhETGwzR05iWkY4?=
 =?utf-8?B?ZndWWkpRMnBOWllXbnJ3L3lXTDYvR2MzV0x3Q1kyYi9yTlBEb244UUdQV2hS?=
 =?utf-8?B?R0k4Mkt2ZFJ1K00wVjJxQWFsMUIrS0FrRjUzRHRlQ3M2bzlNMDZGUVd3blNE?=
 =?utf-8?B?SnlYTmk4cllWcFFvUlVmdXlXdXRqUERrZUY0TFlHcDNQQ0JBNmh3WjRCRDBE?=
 =?utf-8?B?VWg5djE2eUZ2dUh1YlRLUmRON1hMa1NXVTliZTc2MVVIc1ltbkorRUM2S0FI?=
 =?utf-8?B?enVTTjlwNXB0SWNpZU00Q2dNbmZZUjlmZzIzdTlTcjRmTXZONGkrT0xJeGlm?=
 =?utf-8?B?c3BGVVhqTXRDNGNMaFo1cXcxdmR6bHhIZnVhQ0ZZUXh5dGl2MTA3Z0pON1Y1?=
 =?utf-8?B?RG94RjAwZ09JdXJINkRoa3prbU5FVGFHKzY5b0Njblp2cjRmWTZUaGN3NERQ?=
 =?utf-8?B?RllKTk83MERzTDRaK2ZPeE91WlE2d0hFMTNjdkN5Z0N0YmNCVCsrd2E2Nm5B?=
 =?utf-8?B?em1lQWQ1anloQ2RGQU9yMENUdzc2bit3TWR3QU1ZaTlyT2xtcEgrNWR5Yis1?=
 =?utf-8?B?SHphRzBNaitVa0FjQWMwU1BnMnNvN284RnRDb0JKS2xEZGZJUDVySFRuWnND?=
 =?utf-8?B?cjByS2JlT3pQRVc2a0hxVlVidVNQSFN0MVBudmZrYnM1MWE3ZWdxejFkeWR6?=
 =?utf-8?B?K2V2YTNvZTQzcElZWHNJNWErYUs1ZU5EL3orQVN2c1hiWjVVV3lPTTk0UXA5?=
 =?utf-8?B?SzhXMkpWcWF0ZCtsZlVWRHhBRzVPRkcxeWNTcVdheGRIdWhzR0hEcDZ2MFQx?=
 =?utf-8?B?VGUraFlNQzJnZVVUMTR1SCsxbnZhRmo4aUZoVEo4WkR0VVJXQVNzM01hTmJn?=
 =?utf-8?B?ZlU0ajlmL2lLT25rZnJicXdCVDBQMGdOUThiL2NMREtDN2YvaGNYeWI2NnRX?=
 =?utf-8?B?YUhPcXIwa0VsZm1wa3V6V2tTcUJKQ2IwbEJFYjh0OXU0NU81Z2Jab0hBa1FT?=
 =?utf-8?B?R2V6ZSttSWpWL3FPY1VwSXU5cGlwSUxjVXpoams3RXo4T0NkR1I3dmNqenRI?=
 =?utf-8?B?UmVOT21lRXY2b2l0VjlLemdQNFVxMmtPRzZIUW1VcHhmczlrcTRTUWdrNlFM?=
 =?utf-8?B?c0IxVDdXajRsbThpTzUveDlPRkRkU29ZOGdURmpkbzJHZkdURG1LRElxMHdM?=
 =?utf-8?B?dlN5UGZpNUxtYWVZZnFXcEZ2b29QSVBNMCtwR01UWHU1bjczVzlrUE1RVHpx?=
 =?utf-8?B?dDJJY3VoM0hFTHlleGtjWlNjNkFiaVRmUExSdVB0bXBNbTFXOUUyaCtIWURl?=
 =?utf-8?Q?A9ZLyoZ1u546JT24lXahr8s02I00TqlqXi?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 16:14:24.2850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a4afc6-f6c1-4b94-e07c-08d8a2a6d1f9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VP/oNV0Fsl8t04oHZJR9SuVV47e4ZHvMvrnjbjgArTO/ZZO1GauixJDSykgHHCGKLr1AJhnLy65fXdNljnH24w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4343
Received-SPF: pass client-ip=40.107.7.94; envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: tuguoyi@outlook.com, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 6:27 PM, Dr. David Alan Gilbert wrote:
> * Tuguoyi (tu.guoyi@h3c.com) wrote:
>> The snapshot in each bs is deleted at the beginning, so there is no need
>> to find the snapshot again.
>>
>> Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>
> This looks OK to me, becoming redundant after Denis's 0b46160 - but
> I don't know the snapshot code much;
>
> Denis - do you agree this is correct?

For me it looks too that the code becomes redundant, thus

Reviewed-by: Denis V. Lunev <den@openvz.org>

> Dave
>
>> ---
>>  migration/savevm.c | 10 ++--------
>>  1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 5f937a2..601b514 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -2728,7 +2728,7 @@ int qemu_load_device_state(QEMUFile *f)
>>  int save_snapshot(const char *name, Error **errp)
>>  {
>>      BlockDriverState *bs, *bs1;
>> -    QEMUSnapshotInfo sn1, *sn = &sn1, old_sn1, *old_sn = &old_sn1;
>> +    QEMUSnapshotInfo sn1, *sn = &sn1;
>>      int ret = -1, ret2;
>>      QEMUFile *f;
>>      int saved_vm_running;
>> @@ -2797,13 +2797,7 @@ int save_snapshot(const char *name, Error **errp)
>>      }
>>  
>>      if (name) {
>> -        ret = bdrv_snapshot_find(bs, old_sn, name);
>> -        if (ret >= 0) {
>> -            pstrcpy(sn->name, sizeof(sn->name), old_sn->name);
>> -            pstrcpy(sn->id_str, sizeof(sn->id_str), old_sn->id_str);
>> -        } else {
>> -            pstrcpy(sn->name, sizeof(sn->name), name);
>> -        }
>> +        pstrcpy(sn->name, sizeof(sn->name), name);
>>      } else {
>>          /* cast below needed for OpenBSD where tv_sec is still 'long' */
>>          localtime_r((const time_t *)&tv.tv_sec, &tm);
>> -- 
>> 2.7.4
>>


