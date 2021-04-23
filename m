Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9829C3692FA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:23:27 +0200 (CEST)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvmI-00057W-Nm
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZvkE-0004T8-KW; Fri, 23 Apr 2021 09:21:18 -0400
Received: from mail-eopbgr70139.outbound.protection.outlook.com
 ([40.107.7.139]:35302 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZvkB-0003h5-EQ; Fri, 23 Apr 2021 09:21:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnzmLG0DZ/sCEWql04c6OlaDrKDBHQtTG9rcVzLETygLJYejXC0KclluYzZzS4MofbOwiMOZxe6eFagsYZJhnlfpbDc7FneEuVi3d2lbfSjXTaoaOvc8jneYWhtXKLDADjAJKaN64jf7pbWBd0HCckm7cMHNZqjTcSb6oTREi+il8tGr/N4q0eVHORQGemh6ke95oVu4fpTgwWcItL4nqWxhqAwvHFJw+ECAScPKztNzp5PCjfPcUX37nIrjdkIDfgGlRUpOG1qyVVb3Rx4EAcK6DFKQwrOS54HkAPA6hvF6viEKRH8LQS5SETNU0FGKWl5EwMSjFtJrKXoXHnQcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlI/rLphQxUvyuCRa/AL/jAzlLNTLxxfZGRQzLytVR4=;
 b=M9/t1rM7egyVayluTQs6iTSW5V/Ar3nEs4ZkpGqnjU2qS4kuhkg0LGBLCBsNO+H4NgAKC9NSbUMafX2OklPYDDgjsLgo6rBKXedL+d/j4iV8tJIkt6DavzXxNuiE9gGUJ0O18QppWqbsYekxmY+dAMJaTgY02gWM72SGBPCZ4RhBnL1WiKN8ncB3mkjQucyNcQwTd5ZAwo0ZsY25gN2Jc16RylCsH7GDgRTxnyIp0bXFQKIQ4yTuGHPMTQeRiXmvywITvtsqjBAtUUYQVUzmK37AKiI8lZAQ6yHx1bfMWidKMV9jb8NIgk80X5aHvMRGf4dfHZfPzNH02u8PBAWQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlI/rLphQxUvyuCRa/AL/jAzlLNTLxxfZGRQzLytVR4=;
 b=EQslbsYd+HvvYbxAroIc1Qzlb52lULfqZmQPVsEDICM4LNSBobS2+vgN3jpvHJDlkIkCgWBk4iSSkpA4ShFylKSG510sVhUvIGshqpU3txocuh6hLFj9WgAe9Fn1/ZGy7O8p7aIvMJGjMOAG7/V2dgzcILIjBsnIPLjmz3NKKVI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3719.eurprd08.prod.outlook.com (2603:10a6:20b:83::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 13:21:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 13:21:10 +0000
Subject: Re: [PATCH] qapi: deprecate drive-backup
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 armbru@redhat.com, jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 pkrempa@redhat.com, nshirokovskiy@virtuozzo.com, den@openvz.org,
 libvir-list@redhat.com
References: <20210423125900.3640-1-vsementsov@virtuozzo.com>
 <YILHBKxVATOq0+w/@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <934906b1-81df-791f-a0d3-c1a851512f0a@virtuozzo.com>
Date: Fri, 23 Apr 2021 16:21:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YILHBKxVATOq0+w/@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: AM4PR0501CA0055.eurprd05.prod.outlook.com
 (2603:10a6:200:68::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 AM4PR0501CA0055.eurprd05.prod.outlook.com (2603:10a6:200:68::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 13:21:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 720faf1b-f668-46be-6eb5-08d9065aa94f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3719E8BCFAEC326A11AF554BC1459@AM6PR08MB3719.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OoL/po5sF3DlSGiNF638Dpd6dzBy3y2O3RiarOFMtdlLI/iS9XeWiO4V1Vd5nf94P9Zll+WtE+UsQR7aewHFecfvtzHIPMgL9mfiU5Xyl+1O4jQEtytKQxPzafOBb6WiRTh3O9RHg2xQBcCZcfczeIwahh67/9FiC5B0YyQLGs2WgLEm39/N7UY8ztOj1QkpRx5wS6dqIOV44FzLQU73gDE9ocZX1KhkK2sc6NmtBTw/yh/iQMvWKGLnEExoO4aRkgksTV4SJ0xa4uH0q6OGg+VM2w43xBfqfmaQ/31Aj4znlNjUKUkIKHjg8VP/MqE1BGmhsXEhy+RtdSv8vMpvlloBARJvg/uw7o1W476wVin8sfFMN5E0wW6unkT4vtEwV9IGByCUIjG7ZHc7uMleiyMd6nmrPbkPLPTAxwhNswmfgffupDq3AEB+OJSyYLsO4k2p86MMb3xSb4yRjbmOsQLHgKdEcSJgZhvvbR5RwNVnx0MnSV4qd9pSxPdXHc07Jgwg5ejPNvZYSCKBZVtlaI6v6t6z2oFVIktBBpbFsd4SCsDs7Vf+KQL0q3pr0+rkJxO/eIv0VlMFTA9E99Gkb2KPGqeHnt3zQNS3W+pKX4/l2C7MI0V2n8VDx7KCLA9EhuxaYOudjupW2LOTK1LDA9Uf3ws3ppfWGj/CIADh58+Wb1cKnnIlVs4KPRfXjISCFWyvf5NKJcuc/aOUDueq664SlhUQEgYGpT7kPW3ujXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(39830400003)(136003)(66556008)(478600001)(316002)(186003)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(7416002)(86362001)(52116002)(16576012)(16526019)(8676002)(31686004)(6916009)(31696002)(5660300002)(8936002)(956004)(36756003)(26005)(4326008)(6486002)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0Q0ajFpaTFEU2VQdzFJSlB4LzExSmhZcWVhMHBTSi81T2JMbGtEeGN6UlZv?=
 =?utf-8?B?NlJsaE9IYzRUUkJaQUl0enBzNTh5NjkvNmsvbForRjVkd2wzSzdTaHg0cTBD?=
 =?utf-8?B?UnZKR2hmZDhBbkVRVkkxWDdHSm1JVGQzUHhLOWFOSXpLMlphM00vSm9EM0ZI?=
 =?utf-8?B?aU5aVURjNFMyZEtBTWxtUjZpeVR3blEyMHpnTnR3WXlYbzh4bVVkSnltTnQ4?=
 =?utf-8?B?WjF2SjV0VnJiM3FuNktId0hucExBMzBqK3kxQzBLZkg4bzRGanVrQlorQ0t2?=
 =?utf-8?B?ZjY1ODRjRlZ4THp3ZzllbkdqY3NWQWtjMkpVU1lNNnJGbHBZYzJCYldXTTlq?=
 =?utf-8?B?S2pkbThqL1hQeVR6WENnZUtOb3M4cldIUkNRN1JRSnhRU0JwYzF5RWNhbXUw?=
 =?utf-8?B?MEg0clhIbWowMnEvYUo0ZktrTm1jK1BMZnNOVitWNW90QjcvSHFiNkI3SzQy?=
 =?utf-8?B?bDVlWmoySlZTRk5JcUc5cmJYUS9MYjIyUko3ei9TRElOays2NlNWRWh1LzNI?=
 =?utf-8?B?d3Y5MEpDM1orRU9NMGovSndqcFBxYTdrbWRObUxWNWNFOVIvWmJhRGhPQ0FK?=
 =?utf-8?B?NERIUmpVTGErSUkwMHk5NmhrQ1UzWUU4dFdYNnNhK01ZZTBsRVNNTEVEVy9i?=
 =?utf-8?B?VkRlbVo4M1E2amZScEZqOWh2VUNTbm1JaWprRVFPV3lGN2IxQXFWSVZZdTQv?=
 =?utf-8?B?Q3N6Tk9xaU5XOG5McGxkNzd5eTI2eFNSUEFEQzkveFB1S3JVRDRIV2wvbGNq?=
 =?utf-8?B?blI4cCtUc28xbnZ4bUVoM3A1YzAzYVFnWVhlWGJPUE82SmFWUnYya0lqd3Js?=
 =?utf-8?B?UXQ1WHZhSHBkbElaTEx1RnBQeWo2MElhbGo5c1JmY2FrbXhzeVZkTm9KZjFV?=
 =?utf-8?B?b3R5Z0dYcTVBQ2s0ZDVZMERUWnRleE9BdGdMRlhxUjg3TWppY3laWnMxYkIw?=
 =?utf-8?B?VjRkTlR2eTF2emZHbzNEVDJwOHNLbm5PQUsxWWVoQjJnN3QySzl2M0tYV0xW?=
 =?utf-8?B?WTI4UDdMYjU2LzBva0M5TFZCamFkN0g0L2V3NThQNmdxYlB0azNLbEJ4WmMv?=
 =?utf-8?B?T2dsaVV0cWx1QjhrdVE0b05JeURjVithVHZIOFcrZDM2aXF1cjZTWG1YcG82?=
 =?utf-8?B?MWJKUUViZGdVNWt0ZUNscmxiWTZuTnRUcTgxZVRZT0hUV3J1eHBnTU9vWThD?=
 =?utf-8?B?NUpiZk5na2NXcUFqOVNFY0ZBWVZDTzNGZW9mcTk4aWFwRVJick83Z3VjVy8r?=
 =?utf-8?B?M1o1VFRqNXp0SE5CMExZY3Y5N3FUTXllYTM1dE1jc3RVZWJBeWpQUlhLUGJy?=
 =?utf-8?B?amhhKzk1OGVxSjhXYmZpbEpndWZkRmxZZWtoaEtROFJoUGVZQ3lKaTVJM0R2?=
 =?utf-8?B?WkF5MnA4dkIvOUtlaGJDSWhMWGpXZEdjTTdVOHduUVE2a2dDbWJ3Z1JJOGRy?=
 =?utf-8?B?S2ZGSnlvZFJGR21lUFFFKzNBenpURzh4YWNNdDN2MkpENnVzN3FnYkdaNWhR?=
 =?utf-8?B?MjJNWDJXT3llWGIxam9NMUx5N0FMbFdRamFTczZpUzN4NWQ4YU5GZ1ZRcmlt?=
 =?utf-8?B?Ymk5NHBZelN1YkNCeDJUMWJKcURROTRaOEhVenorblVRa1RsamhNcTFoWU1J?=
 =?utf-8?B?clZlN3NKNDJoMytCa1kwSWlXSlcyUUZmRVFCMGNicGJCcXNUMW5NbjlldDZK?=
 =?utf-8?B?N0NJWHhQbnpqODE3ZEpFRXV3K0Z4UUQrZW1GZ1gvdTlmc3RaT1ErVHF4ajI4?=
 =?utf-8?Q?W4sl0g2Zo+MV7FD8rdu1ARvSV/DgaAx+bzpoOvV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720faf1b-f668-46be-6eb5-08d9065aa94f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 13:21:10.8029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9IfA55jj4iMy6qL23gps8IWXhVCsaG4ru3d891yKKT0poI9BOQZtK1peyB49NI1U7CJWJkYI01slNjl7zDwFFtsxQVLJKoEDXiR+52b8dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3719
Received-SPF: pass client-ip=40.107.7.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

23.04.2021 16:09, Daniel P. Berrangé wrote:
> On Fri, Apr 23, 2021 at 03:59:00PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Modern way is using blockdev-add + blockdev-backup, which provides a
>> lot more control on how target is opened.
>>
>> As example of drive-backup problems consider the following:
>>
>> User of drive-backup expects that target will be opened in the same
>> cache and aio mode as source. Corresponding logic is in
>> drive_backup_prepare(), where we take bs->open_flags of source.
>>
>> It works rather bad if source was added by blockdev-add. Assume source
>> is qcow2 image. On blockdev-add we should specify aio and cache options
>> for file child of qcow2 node. What happens next:
>>
>> drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
>> But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
>> places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
>> as file-posix parse options and simply set s->use_linux_aio.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hi all! I remember, I suggested to deprecate drive-backup some time ago,
>> and nobody complain.. But that old patch was inside the series with
>> other more questionable deprecations and it did not landed.
>>
>> Let's finally deprecate what should be deprecated long ago.
>>
>> We now faced a problem in our downstream, described in commit message.
>> In downstream I've fixed it by simply enabling O_DIRECT and linux_aio
>> unconditionally for drive_backup target. But actually this just shows
>> that using drive-backup in blockdev era is a bad idea. So let's motivate
>> everyone (including Virtuozzo of course) to move to new interfaces and
>> avoid problems with all that outdated option inheritance.
>>
>>   docs/system/deprecated.rst | 5 +++++
>>   qapi/block-core.json       | 5 ++++-
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>> index 80cae86252..b6f5766e17 100644
>> --- a/docs/system/deprecated.rst
>> +++ b/docs/system/deprecated.rst
>> @@ -186,6 +186,11 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
>>   instead.  As part of this deprecation, where ``nbd-server-add`` used a
>>   single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
>>   
>> +``drive-backup`` (since 6.0)
> 
> NB, it'll need to be 6.1 by time this patch has a chance to merge

Oops yes.


-- 
Best regards,
Vladimir

