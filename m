Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E432383DF5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:59:12 +0200 (CEST)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijOR-0006JU-80
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lijJ4-0008Ut-8Y; Mon, 17 May 2021 15:53:38 -0400
Received: from mail-eopbgr80113.outbound.protection.outlook.com
 ([40.107.8.113]:52032 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lijJ1-00055f-Gs; Mon, 17 May 2021 15:53:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1s6IAOVQtwo3SV07x9XUDssPvyWxjcvF6wFChwofCqiEWqhmI5/Vj3kHL1giqNo/8JI4beqTdLmYu68ZkhmievdFYiBEgIsDtl1dNTxjDKbtgLV2yX3HWOTNotshzhUK86eM2LG0+v1MeRFwiDe3UTp3zZplaCt1FGG8MsTnh34nQ2yeLWyosD1sbmiYbUwnoXYskC11HKTvzqDGd9t8ycGsFnTsO7qvNX4agJi1M8C0KaZ1rrxYT3T8nHxvEyPp9aDbXpVVAXUg0DoSP8cIFChrvlnw2TjDPT4xblFUm898KeitoPIDiyphD9T67h0zV4mYIrmnh3i/p523QlX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDlhVoeKQQ3F+erqZ3RjsJPhJ01KYYuNO8ufaMXA6+g=;
 b=VZaGltV8QRgQDLO1zAbDlEW2hp6EzEuFhFH04NqcdNV0Bc1Y+OyOaabFX2PnEsu7V0saV51x5yWmk1moH1CVDI03LydCBZwdfttuSdI1YKT0r6o7MdOFW+JCr3fkqql85416HeSmMaiRAaImB7RftWxjgI0Bayr2clhr3s+Fo7KdIQZe48NpOg9VSVf2dRfHIrLHi8i2e7eAM/sxUEYbpHewJ1xvCxj9R2pCNYlYWQ6/Yl8cOjjRU4v+JN33tFAeWotgemVk75E9ztNYl/hMVeQlh8qKhGVUz1dovF/ASnKqZukALPH6E+Bga34k5obzzJuDd9xalVzkfSEdW/O6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDlhVoeKQQ3F+erqZ3RjsJPhJ01KYYuNO8ufaMXA6+g=;
 b=uTzW08mX6Ne/a4eXKyGWAa6JgOKWXhNsPkmro6V/CxYDxhe4Dtxl7uk5jTMCQMcEK3ucMPJwGHjN01hj+HxlYdrfetn+2eTT3kfPfIdPwU5IHeDs370MxjuxLhp6GenvLTTMqKdfc/CublADB3QeKB/Xf20UE1rCy5uOIGG0HU8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5030.eurprd08.prod.outlook.com (2603:10a6:20b:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 19:53:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 19:53:31 +0000
Subject: Re: [PATCH 08/21] block/backup: stricter
 backup_calculate_cluster_size()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-10-vsementsov@virtuozzo.com>
 <d03c7bc4-2ba3-6a81-f152-f88c2368adec@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <722754c4-f668-c801-faa2-bba7a68bd09e@virtuozzo.com>
Date: Mon, 17 May 2021 22:53:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <d03c7bc4-2ba3-6a81-f152-f88c2368adec@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: PR0P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.231) by
 PR0P264CA0098.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.32 via Frontend Transport; Mon, 17 May 2021 19:53:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c43b9a20-ae76-4d7b-d444-08d9196d72a7
X-MS-TrafficTypeDiagnostic: AM6PR08MB5030:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50304E9A91C43ECC7F38F421C12D9@AM6PR08MB5030.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mYmKwr31mpWeDgIb5YPjHOtmUwZTKrxHNYjiVh8cm+I1D1jU+M38A4qCOKVEPXSz30F48K3z2wo1hcSO2svqG+YxOgneCOrze4R09TeJlBtvgWU6L5ox1uX/He9hOkVnXf2C4zfcMOma8tbmMMRWYLBjjecRj19MMSbV/mbUphOB7xe7vnBEUbS5j5LGJcC4DRLORgxwEToDz15Q7iH9ta3vmsuMjqzkIFfSK0wyjKJIfacbjC44QcoePH6qpT6a8mCZzhqAa0SpwrzZvU0sec+6CLnndCs5XM/4wiOc0k1uT5GHL0wx83+RjZLHfuXJbybD2+S3Lot1c1gpNOCmEQhIkTkg/5F0904Yg7Ty9LcDumKwEUQWiXBS96db0T+TfjUcq+EDOModpMaGHuuOQaKdVlRIJXDLWfV1H6m6/qfGNuuPX4PPppThQBZ7WCFZKeDLTfM1pgsY2hEgShgL1nSanIySrXovtnVbR5eW6OAF+9ggKI2MsSf2rm06L5l8jGc6lfhf1wz7Nnx/1cUR5JYy/qBgj9r9Z6jj2mXaznD34bFpooMdlk8ArUFYtmPEJFWkUkn9Mf01S5iCzXksm+5hXwG0dQiN7PpfPfcOzcNJdRi7NZWa37h6U0X989ZJSqADA/wCL8pHBao+emQB3mcLzBDJx1EnhDq9GYEuq9XULTJWOtg9UcsydkM8BjoktCiXhlq8MP6W3umTNzLw4Ws31QufjXWhlURr2t05Y2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(2906002)(5660300002)(478600001)(38100700002)(38350700002)(53546011)(26005)(16526019)(66476007)(36756003)(83380400001)(6486002)(8676002)(4326008)(7416002)(316002)(16576012)(107886003)(956004)(31696002)(2616005)(31686004)(186003)(66556008)(66946007)(52116002)(8936002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ellKTURheUo4c09EOTd0dlhGTUpEc1YvQ3VKcUxNNWxXNHgyeEVKTFIvakoy?=
 =?utf-8?B?bGNmei8vVkNTNmRIeGhUYVRPYzJsekpEMGZNNjNDVEJsN3VycndUVkZCVks5?=
 =?utf-8?B?U2dHRVZ1OE9HYndFQTU2RlZTTnFsNDllNG9uUm9QR01PeURPZ3BtQjhlREVT?=
 =?utf-8?B?QVF6TGs3NkI2L29TNDZ2dUR4NDVYWmw1V3VDZlhIaitLVVkxTmI0dlJJcGVl?=
 =?utf-8?B?SnFzZ0FiRUxOTnNzakdWcnYwNGJJYmd3MysrL2FESVFlRHhJcE9WakdRZE42?=
 =?utf-8?B?dUtoL2ErMURQYTA4a3IrcjdWNFJBVUpkT2lJMzhCbzEwN0ZmTmY1Y3RJdmo5?=
 =?utf-8?B?REM1dFhwcFdyQ0JRY3RpWEhnUkRXQk92OW8wa21rRTBxb3dXRFEwWnI0M0pQ?=
 =?utf-8?B?c2t5cHBSVDZDayt1ZXBqOFJIdThaZE1kZENvMFlQT28zZk5CWGhZUlk2WkZu?=
 =?utf-8?B?bmZuWkFGWUREc0xtQXlTUVZKZDdGYmFUTHRxNXV3Wmt5clRkTjZidHlBcHdp?=
 =?utf-8?B?Yk9MblZ1T3Y2ajlpVGREMVdXZ1E2UkUxdlZTcC9FejdveWZkZG1SdGtjVlgw?=
 =?utf-8?B?aytWQTFWa0RCY2Q2djlkMStBOUdZWWhwNDdwQUZwNk16Ynk2ZWRucnBFTzVJ?=
 =?utf-8?B?U2pxRWhDQitQTDdRRU80dUlCb1ROcXBVaGVxcjVFK1EwaTRGRlNyR1Q3UURv?=
 =?utf-8?B?M3hucVgxSFk1elBzaWUyWnhWbnJjamQ2ZFV0WWZPQUlTMVdXNXJMNnB5NXRU?=
 =?utf-8?B?R2Z2SEh2U2k3Z2JDUDl0NjF2cHlVMUF2RXRWSTZrWnRNZjJVSWx1ZVJCbXc1?=
 =?utf-8?B?RmFlbWZPenRsSDlhdks1bEJOL0NHQVJiK2pTVkpvVDdCczlSc3dnaVNvcGIr?=
 =?utf-8?B?M08reWQ4L01McVhJRDNMcDRlaDk2SjQ5ci9PTG9FaDk2THM3b09IaWxEd3Nn?=
 =?utf-8?B?ejZiQTE0Zk1ZeFQ0K1V4bC9GY3ZYNTNaMnhzc3pDbVZIcWhzbzREU0RBZ1Mx?=
 =?utf-8?B?ZFZFdHh3R0VPdFdjRUlPeUV0K3VxdVZvMEV6WnBJVnBLZkFuYmtQQlkrZzJ2?=
 =?utf-8?B?VW03TU5VRWNYa0JqamQrbjJ3dktDNDRpK3pGdnZjWlYzTWFtVmI4emNVZUpi?=
 =?utf-8?B?dXZ6dERLai9kQXZURTZDZXNlbDJYM3NHTzlRa0FTc09PRnllVmhlM05KbHB4?=
 =?utf-8?B?TTc2a1ZSNnlYdFY2UTFuUms1eDdpWmpkbThJVlQ4ZVdRblVBWVVTSGFOcEF0?=
 =?utf-8?B?SmMzSkF0b3F6ZXo3bDVaNWliNzJTa2JQWHcydzcxNGtLa3lrSzV4QjRuQzhT?=
 =?utf-8?B?OU9IZzdkSWI4UE5XblRIRXBLa3lwckdkRHQ4bUlMU1BFbzVaSTZXb2ZiKzNJ?=
 =?utf-8?B?S1pNczh4VGVXVFFheUdDalR6aStaTkczK0NrV1Q1MENoeHZrOG1pMHJrNDhw?=
 =?utf-8?B?NHB0VjYwTEtFcFJIN29FeFpQSmliVEVodjAvc1hBQ1dGN2FXclJ1VnFtcFMv?=
 =?utf-8?B?ZCtPRHJQWTIvQlZGaXVZUUFhNFA2QmVSdzBvMVdFdmhPSG84aStGT1lxOVhU?=
 =?utf-8?B?TjgyMUlJTGY5akE0aEF3Q2o0VkxFd0lYTjNSTHROQm1kdTRIRVEyVDN3R2hq?=
 =?utf-8?B?VEdMM3JQdG1DWEVWbk1NZmEweEllcTVseGprZjdUdXgrVnZtOE50MTQvNHN6?=
 =?utf-8?B?ZC9ueGRrc1pTc0lhT3hZYW9IZFMvYXVQeEpRQ2txSDZBemw4eThsY095akNY?=
 =?utf-8?Q?CMhj1unlvBXwxONPDx6zn7tG2SP0CwEQzTmiUt2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43b9a20-ae76-4d7b-d444-08d9196d72a7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 19:53:31.5994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptDJz+ZFn6O0KtgAceVdN0PTwujTP90B0wNaG0evWEMmflaesbkczPTIKIxS/AZgxlhr8fwN8OszKOiFeSiA1JO+DwQgIKZVxfhectmShVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5030
Received-SPF: pass client-ip=40.107.8.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

17.05.2021 19:57, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> No reason to tolerate bdrv_get_info() errors except for ENOTSUP. Let's
>> just error-out, it's simpler and safer.
> 
> Hm, doesn’t look that much simpler to me.  Not sure how much safer it is, because the point was that in the target_does_cow case, we would like a cluster size hint, but it isn’t necessary.  So if we don’t get one, regardless of the reason, we use the default cluster size.  I don’t know why ENOTSUP should be treated in a special way there.
> 
> So I don’t know.
> 

I'm probably OK to drop this for now and don't care. Still, I can share what brings me to this:

First I thought that cluster size should be easily available for any driver:

protocol drivers and not-backing-supporting format drivers can set it to 1 or to request_alignment, if they don't have a "cluster" in mind.

backing-supporting format drivers should of course provide actual cluster size

And I decided to just add bs->cluster_size variable, set on driver open, to simplify the whole thing and make it clean. Then, most this detect-cluster-size function would be just dropped.

But it occurs, that there is one driver, that has a good and rather tricky reason for ENOTSUP: vmdk can have several extents with different cluster size..

So I give up refactored, and finished with this one patch. It can be simply dropped, I am not really a fan of it..

> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/backup.c | 14 +++++---------
>>   1 file changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/block/backup.c b/block/backup.c
>> index fe685e411b..fe7a1f1e37 100644
>> --- a/block/backup.c
>> +++ b/block/backup.c
>> @@ -367,7 +367,10 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
>>        * targets with a backing file, try to avoid COW if possible.
>>        */
>>       ret = bdrv_get_info(target, &bdi);
>> -    if (ret == -ENOTSUP && !target_does_cow) {
>> +    if (ret < 0 && ret != -ENOTSUP) {
>> +        error_setg_errno(errp, -ret, "Failed to get target info");
>> +        return ret;
>> +    } else if (ret == -ENOTSUP && !target_does_cow) {
>>           /* Cluster size is not defined */
>>           warn_report("The target block device doesn't provide "
>>                       "information about the block size and it doesn't have a "
>> @@ -376,14 +379,7 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
>>                       "this default, the backup may be unusable",
>>                       BACKUP_CLUSTER_SIZE_DEFAULT);
>>           return BACKUP_CLUSTER_SIZE_DEFAULT;
>> -    } else if (ret < 0 && !target_does_cow) {
>> -        error_setg_errno(errp, -ret,
>> -            "Couldn't determine the cluster size of the target image, "
>> -            "which has no backing file");
>> -        error_append_hint(errp,
>> -            "Aborting, since this may create an unusable destination image\n");
>> -        return ret;
>> -    } else if (ret < 0 && target_does_cow) {
>> +    } else if (ret == -ENOTSUP && target_does_cow) {
>>           /* Not fatal; just trudge on ahead. */
>>           return BACKUP_CLUSTER_SIZE_DEFAULT;
>>       }
>>
> 


-- 
Best regards,
Vladimir

