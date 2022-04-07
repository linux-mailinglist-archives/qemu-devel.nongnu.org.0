Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC94F88F0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 00:00:11 +0200 (CEST)
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncaAk-0004Me-Dl
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 18:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nca8r-0002Tc-Uq; Thu, 07 Apr 2022 17:58:13 -0400
Received: from mail-he1eur04on070a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70a]:11239
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nca8o-0008KB-Nl; Thu, 07 Apr 2022 17:58:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgIcADDcZUNcdAny+FCk4z6HHbm1FgkMavl1Wf87ORChSj6hHHqJrBXkKxBtAh//W4mKOdnSDkJcKeWHjp+NLDKFkqi38RsI7b7uZ5NEr2kYJWYjcrX79w5gARehGofLty6E4bprzTjYSMS+hYwsE9ficQ6WkvZvCRXieDcglv7JA8HPryUw7teKOBOx0xN3D/Qkamt1fUnJbjpU/t+rWJHv1IXeWyNkRkUuvU1I2RmD9hxk9q7THQJcsLjwKHuL2VjEJdK4FN5wT8K5764Jl+GzWg7YOwt6pms4F5QD0UBWg/Zyukw89gDTNjR1vv1y6zOuMeMvb2/7rhwCswpUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fI3EHttSkpDh89N2sUc9j397ZkXOnW8XL8pakQ+chS8=;
 b=ihgOh10PKPYaRW/FWs2S6AEpO7whOgM0icwxBb/QoETmmS6Xdbx3qN8sUveyo7/506OYCM7D+rGEl7y/CrO/j144ObyEuEsjpEcJsZk+v1mgbKQvPsYPCOIBLOScyHzmqFGsL9XPGs9WphuRujd/TPc1Z5hYedkBZXh5h/tbRd21JN6wlUAyE1HfwAjOgrj0CCwzutqGIvuz4BdSHRMyoRsL8ww4jIaxjLsxbH/0T7s7daOrDwTKCoDtEsRNr9U0eY/XL0nd/pGpR4EYMBblfhDMvoWxjdtQAc8NkwvdcpYGXRIXBnIyjovRuq+DjJoKAI7L7HQqF9dLX7+6m1orDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fI3EHttSkpDh89N2sUc9j397ZkXOnW8XL8pakQ+chS8=;
 b=RXqs2BH4+Ml4AbPz6fJEw34ffNkscfEJ49jCaboEcAOTmeI9VKi+H/o6yQI4nu0GaxmqeFiPhxllkZ9N0RGqs42tf7unQaeC4j2+WvEV1H/v8qF24biLCyDGthWLedqve/xVZsI4/+O2cV21maTm8RKWXy0GnpWgujRnzMPmdyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR08MB2941.eurprd08.prod.outlook.com (2603:10a6:802:1d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 21:58:05 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8d23:cb3d:8eb4:e3b5]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8d23:cb3d:8eb4:e3b5%6]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 21:58:05 +0000
Message-ID: <efc590d3-52ea-5c19-7d27-1be5df200c42@virtuozzo.com>
Date: Fri, 8 Apr 2022 00:58:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for 7.1 1/1] block: add 'force' parameter to
 'blockdev-change-medium' command
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20220407204812.691015-1-den@openvz.org>
 <ff0ffd84-2333-7779-5888-c5d5a44836b0@mail.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <ff0ffd84-2333-7779-5888-c5d5a44836b0@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::28) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3875860-a724-457e-35e2-08da18e1b1a7
X-MS-TrafficTypeDiagnostic: VI1PR08MB2941:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB294168471C3E64B523736481B6E69@VI1PR08MB2941.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X/gx8cWYzA3kBjJ8DdkqtVkgc4M/N3fio7UssKZ//jPhCZxA4S2NRylfOg3qS3O9qpggYos3fD1CMJe3VczkhuDmdQctu0Grr69MG2V0kMDPxzYRCbK2q2VyiCx2U2hwUly7hQ8l5/Vyo98ORdbCsT4WmK1mpMVWsUaO7FanvS4m6hS/S/NpIkL4wBF9LEQS4ITnbhmHKdY7XmxMICi9sb/Sg5r4TzDUK1Z2m93LGxEodJRcp1tli51qBEL801BC1wZOcj8Uw1R+DZytKmjCCYTB5WwE6wdEEgHNee1a2B6dJ5qTQolSKaO31E9mA/F5g/3dT9LjgDdZk5lgi1iHld/oX8F5WJ+IzKWSKoGCdQVDp47NbHBH5yIOuW6if+Ib+PoZ3q8QlJv3teCh3zTCoqeitIhZeE/Ff4HfQL+hoRqiujJXCkNlzukku26GJFzch4LBEO4iifi9tI10AkYl2C3gbcF5z9FqTQIWiw/xRwiZXMxOcj1/5bwVr33pStbwjBkxIcRIw0Prh1hxbMP/5VO7NkrzDKwf226lotlbz4/GX0fVowR6HA5nxuewic5rsjID0yTLsAq7e8GtLGPHYrl0EbTH6JzWwBuWUWc0TfSELdDD+7CciGRIyXzYluXfw+OaeuzBRsyiyijOCWkR8/9O3LkB4rF7RuIbXULPps2YZDNO667yAMNfGMWtttwL5a7HZzkyPNoHRxng9l/EMbyhn6g3TVuEKm7Eam6V5E7hXygsxyBGHQUYLAdrPMccq0PxLF2lAMXVh3EX4CIV9vI5S0zWnoVHsKn2LWG3A5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(38100700002)(38350700002)(26005)(31696002)(86362001)(54906003)(31686004)(2906002)(186003)(316002)(66476007)(8676002)(66946007)(508600001)(83380400001)(4326008)(36756003)(5660300002)(2616005)(8936002)(52116002)(6506007)(6486002)(6512007)(53546011)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azU0MXU3WklTYytBNDhsQWRTSk56TElJRFFYcHF1M2VJcXZHVis5dkFLbGhM?=
 =?utf-8?B?WnJ1K29JYW5RYTBpQ1NzSTVPM0cvb2d5VTZwSlVXL3NpM2pUVUx1WUF0TWow?=
 =?utf-8?B?SWVSQ0ZPR3YwQUtmK2pjd3dlZTRJd3lheUxPSEVnRFIwS0xrWDNQaVlJWHRH?=
 =?utf-8?B?VERvaEFiZ2hGd0lESHFxZDVSNkdtaTBJWWtZRk41a2tTSzFPZzRiYVluVFdr?=
 =?utf-8?B?UEFBRGFHV2g0UDcyRjVPa29aWFBjK2RteEFxRm9lcEZmLzZIVzRYQ2YxdFFP?=
 =?utf-8?B?QjdJbDJocFA0WDZ3WU90K0NmdVdTNUNTVVh4Zkx6NlR4bHlXUTVXQ2V6ZUJm?=
 =?utf-8?B?eDlvb0lub2h5L1JjUm4zdWo5bnMrYTQ0emlSTUU0cHZFVjNRU3Z3Z0RmKzlT?=
 =?utf-8?B?M1NlTVd6MGpIQmtBUzZUS1RyREdzVkQyYjdpQ2VOYTQzMmlrTGRqSHZ4blVK?=
 =?utf-8?B?OFFId0VweG5KTGplcVBxOTdBOHpRcTdaUjl4MmlBMHloME9aRHpqV0RnWWJV?=
 =?utf-8?B?clBGbzhxVThROCtZVUFFczJmRXhlTWRkcGtYVHNkU0NoNHY1Z3o5NmovRUR4?=
 =?utf-8?B?eUIrcnVINVMybGU1OVppRGg0SjEvb0dXTGpwVDJGVkVvTEFlY0NXRTFCMVNL?=
 =?utf-8?B?WFhtZ28vemVUZUZvcjhBOXFVNjhSMDgzUGl6dmpWQVIxWHMvSzdibFVOaGVX?=
 =?utf-8?B?REhreTVQYkl6RU52Wm5sZUEwUlR3cEN4WEcxbUhaNXZlTnBtRTE4MWZDUmwx?=
 =?utf-8?B?ZlJEc0JBQW5SRG4zcDlhN09kRnlsd2d6MU5iS1ptMzV5dWsxeEMvd3phOU1q?=
 =?utf-8?B?RVRXaW5PbHZuWkh5ZzBjM3pTa040TGI3TzVjVW1IR1pvQkJKR0VmV0dPRXRr?=
 =?utf-8?B?WnB4Uk8rOGFXSEpPYitPS0xMOEJDZ0Rwb3duYTh0bHMzMlFYdTZUbnFxK1RH?=
 =?utf-8?B?dkt3ZENteE9wMStOOWlNZUhtRy9CZmUzNGs3alVNRElWQVBNZmIvUlVvcHpE?=
 =?utf-8?B?UzBETEFnOTdoMGl3VklZV0lzVW9kRnNQZlV3RGx3SkdkSnJHYzRUWGpZcHdB?=
 =?utf-8?B?V1BTWTFmT1MvcDVNYTRneVpVZ1pXUFZnME4zejJEczVjQ0E0b3ZOK2Qxdmhk?=
 =?utf-8?B?bGhBK2pWYjRyWTA5aGVwajdPd3lUUERWNmJPZEhuWDZFbjlYQ1JMT09hT292?=
 =?utf-8?B?dm5taWJmcEgzVTcyRVA5OENrQmJ3UFVIUms2TkNkQmNwQzJZLzJpQ290RlZO?=
 =?utf-8?B?T1J3YkNRNW9rNFo5QlJSb0Ftdmp3clE5aUhvdnhaeU5iNS9zOElYY0R4WG5x?=
 =?utf-8?B?QXJMcmkrdVdad01JNFpQZDc3dytrcFNVTTFadk1jaHYxV29MTHJhQWxudTVO?=
 =?utf-8?B?dkRKQktrYjh2a2Y0ajhDbmRJTEJER3lRZmZtUjQzNG1uVXB3Q0hlQjB1cjEy?=
 =?utf-8?B?emg3ZDB2OTZaVGtDcGE0Rm81K0tUV3FkRUtCQW1ROUd6V052L0lrV2QrVDIr?=
 =?utf-8?B?TUd0VThoRkRLbks4L1ExVmh6MXpqS3NhWkhGVlA1UVR5Q3Uyakx5UmhodHVz?=
 =?utf-8?B?anRzaWFhdmdqUllMUm02c29ENHBrbHpFVFMzS2k5MkIxRGdzTTRlb3NYRXFi?=
 =?utf-8?B?bWIwSjdGa3dxNmZDci95NHJBZ29OZkRqZndkc0diazNvV2tQSkkxNHQ1QUpW?=
 =?utf-8?B?RTFIcnp6bnplbVFxMVZnaEsrYzJWdGQrMno3TFoxSVg0cFd2cVNQeGRrc1pu?=
 =?utf-8?B?S0ZSTTN5b3VlMVpXY0pWbkQrUmFGbmVqU2RpL29zbXdNYUlFY0p0YzZ2RHJS?=
 =?utf-8?B?b05kclhrT0wxMGtJUis5RWpTVW02bWtsK0d2SW9zUm50dWJLSThpRXRWeFJF?=
 =?utf-8?B?bzVCVFI1N0h2R3ZGVDlONTF2cDZNa2t5a2pHZVpGZDkyTUpSQjhhYlBNWVRB?=
 =?utf-8?B?N2R5bEJ1RFZkT0ZhbFNFTThvYys4aGd0bUFxSy9CcDF4cThJc3NTemhvNHZH?=
 =?utf-8?B?K3hoc0xOSXMxNzBVWFFTT250UjFXQmc4cWVRS09mc3BCWDVEOS8xQU03eERW?=
 =?utf-8?B?SWxVc0JSMWhaNXV2NGM3WW1hRTlTSkF2SFk1U1d3aDdNRlduNWJsVWVHb1U0?=
 =?utf-8?B?NTg4L3NNSFcxK1FRUUc3NFpQVEhCTTI2RGo0dTRlb1Q3MmpHdDNFTU5iTkwr?=
 =?utf-8?B?c2kxbmdVcy9YMkJBUFFVdm5ma1dwc1NvcndZODlmZjdDd0E4ZTBWb1pwVFRT?=
 =?utf-8?B?OHdTckVFQ1BsS29lWnVkQUF0czRlWExQMktFVU5BTzRZVGMxWUh4UzJRRzFz?=
 =?utf-8?B?NnNGbjZRZnJHc0JGSXZqd3VSV3E1M1lJVEp6TWZ2MURzSW1CbnovZz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3875860-a724-457e-35e2-08da18e1b1a7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 21:58:05.4986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tw/Vyvm1Bs6T5L1ln7bLKNN0XpEEQOj6LfICjRUHlgboWb7BNDigM5+5suLpT9+OaUOF2J0a0rhEjVL7Uv4hqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2941
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70a;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 08.04.2022 00:51, 'Vladimir Sementsov-Ogievskiy' via den wrote:
> 07.04.2022 23:48, Denis V. Lunev wrote:
>> 'blockdev-change-medium' is a convinient wrapper for the following
>> sequence of commands:
>>   * blockdev-open-tray
>>   * blockdev-remove-medium
>>   * blockdev-insert-medium
>>   * blockdev-close-tray
>> and should be used f.e. to change ISO image inside the CD-ROM tray.
>> Though the guest could lock the tray and some linux guests like
>> CentOS 8.5 actually does that. In this case the execution if this
>> command results in the error like the following:
>>    Device 'scsi0-0-1-0' is locked and force was not specified,
>>    wait for tray to open and try again.
>>
>> This situation is could be resolved 'blockdev-open-tray' by passing
>> flag 'force' inside. Thus is seems reasonable to add the same
>> capability for 'blockdev-change-medium' too.
>>
>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>> CC: Kevin Wolf <kwolf@redhat.com>
>> CC: Hanna Reitz <hreitz@redhat.com>
>> CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> CC: Eric Blake <eblake@redhat.com>
>> CC: Markus Armbruster <armbru@redhat.com>
>> ---
>>   block/qapi-sysemu.c | 3 ++-
>>   monitor/hmp-cmds.c  | 4 +++-
>>   qapi/block.json     | 6 ++++++
>>   3 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
>> index 8498402ad4..5b4fb75787 100644
>> --- a/block/qapi-sysemu.c
>> +++ b/block/qapi-sysemu.c
>> @@ -318,6 +318,7 @@ void qmp_blockdev_change_medium(bool has_device, 
>> const char *device,
>>                                   bool has_id, const char *id,
>>                                   const char *filename,
>>                                   bool has_format, const char *format,
>> +                                bool has_force, bool force,
>>                                   bool has_read_only,
>>                                   BlockdevChangeReadOnlyMode read_only,
>>                                   Error **errp)
>> @@ -380,7 +381,7 @@ void qmp_blockdev_change_medium(bool has_device, 
>> const char *device,
>>         rc = do_open_tray(has_device ? device : NULL,
>>                         has_id ? id : NULL,
>> -                      false, &err);
>> +                      has_force ? force : false, &err);
>
> It's guaranteed for force to be false when has_force is false (ans 
> similarly for pointers), so that can be written as
>
>   rc = do_open_tray(device, id, force, &err);
you right :)

>
>>       if (rc && rc != -ENOSYS) {
>>           error_propagate(errp, err);
>>           goto fail;
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 634968498b..d8b98bed6c 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1472,6 +1472,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>>       const char *target = qdict_get_str(qdict, "target");
>>       const char *arg = qdict_get_try_str(qdict, "arg");
>>       const char *read_only = qdict_get_try_str(qdict, 
>> "read-only-mode");
>> +    bool force = qdict_get_try_bool(qdict, "force", false);
>>       BlockdevChangeReadOnlyMode read_only_mode = 0;
>>       Error *err = NULL;
>>   @@ -1508,7 +1509,8 @@ void hmp_change(Monitor *mon, const QDict 
>> *qdict)
>>           }
>>             qmp_blockdev_change_medium(true, device, false, NULL, 
>> target,
>> -                                   !!arg, arg, !!read_only, 
>> read_only_mode,
>> +                                   !!arg, arg, true, force,
>> +                                   !!read_only, read_only_mode,
>>                                      &err);
>>       }
>
> Should we also update hmp-commands.hx ? Or you just can pass "false, 
> false" if you don't really need hmp interface for new feature.
>
good point, I have added query for the dictionary thus it would be 
logical to make an update in .hx file too

> Also, I don't know what ui/cocoa.m is, but seems it has call to 
> qmp_blockdev_change_medium(), which most probably should be updated too.
>
Objective C file, looking like for MacOS UI

>> diff --git a/qapi/block.json b/qapi/block.json
>> index 82fcf2c914..3f100d4887 100644
>> --- a/qapi/block.json
>> +++ b/qapi/block.json
>> @@ -326,6 +326,11 @@
>>   # @read-only-mode: change the read-only mode of the device; defaults
>>   #                  to 'retain'
>>   #
>> +# @force: if false (the default), an eject request through 
>> blockdev-open-tray
>> +#         will be sent to the guest if it has locked the tray (and 
>> the tray
>> +#         will not be opened immediately); if true, the tray will be 
>> opened
>> +#         regardless of whether it is locked. (since 7.1)
>> +#
>>   # Features:
>>   # @deprecated: Member @device is deprecated.  Use @id instead.
>>   #
>> @@ -367,6 +372,7 @@
>>               '*id': 'str',
>>               'filename': 'str',
>>               '*format': 'str',
>> +            '*force': 'bool',
>>               '*read-only-mode': 'BlockdevChangeReadOnlyMode' } }
>
>


