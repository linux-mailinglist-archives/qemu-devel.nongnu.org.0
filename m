Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B232F3465
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:45:36 +0100 (CET)
Received: from localhost ([::1]:50836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzLrS-0007qj-Oc
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:45:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzLq6-0006yS-HA; Tue, 12 Jan 2021 10:44:10 -0500
Received: from mail-eopbgr30132.outbound.protection.outlook.com
 ([40.107.3.132]:40430 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzLq3-0004f6-Cy; Tue, 12 Jan 2021 10:44:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjAfKvB2/ME5RfSQEKWWKQRGnUwsYGjCIQ8tVpnIEOTD16zJtfzSr19jILgittjNZVRstofWtmyCqfXjE786vXDv792ViMAV77UsCDEQSdRtfQzncC0nPcd3ezmMB/79yXX8LAKFIBIP1g8pSB1nyVUOn+blje9yQ41o172UKSSFTikb3jIcQ00KBanHI6L1a9+BI0lneqNFZx5UmuyDyOtuhXZUsqDBZ5af+tVvdpgAL9HY2/9tP/YBY4CwCHdgMT6XqpP6E32MIxohwCyc5FfSNn0qcjkzXRm+gp+oxEZAxgMLJqxRBsT4djTGieec5RHQ9dcNu2iJDkkW/XRpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35iMBa80/docRF65Ka7hzEg4aVCUxhXlU05AFMywMBU=;
 b=CkYSfxvX7uulNXAytk209ac5gSTQaOV2FFGehrL7LEWxRKnix81VWX1Q8uaZHKfyV8z3DK3gxSqAEI5+XptANukC4upLuhRAoLb3T7H2YLr54Y1IOHgPb9yxUjskinnNQtLgiG3U8Uw4q9cgfmrjirJ4ZCBIdZo9nDZf4bFMW1NYEuMtuqST3Y51wu1xIw9y3+Rt27VHk57Lrxn3p8ZzaPMARtXfRKoXcs2SxWwEvMdwEodpt29qmgrzgA5R1CBSMxhKZEjCnZYuwFVpmAgfvnSk4jmYO80aokayyb+OEWkwnAPK4tjWaG92Qeu5fkJLe/3I2UCTzPMsvl5y21JXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35iMBa80/docRF65Ka7hzEg4aVCUxhXlU05AFMywMBU=;
 b=Pvi9Xx+kMqRfc4tuyiHvzkgMIY2MRkzmdS1Y5ESU6NJq9VdbzNU+fugsGat7nXo/ocPW074oEgsFtWByhNKiCUNbK34c+SptA8p10fK1MHueG+7zJJ9XxhxX82UQnrragARI7mvQgpSiJxyxqq37tPoACLj8+tPK+DIFLd5T7yE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6166.eurprd08.prod.outlook.com (2603:10a6:20b:296::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 15:44:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Tue, 12 Jan 2021
 15:44:03 +0000
Subject: Re: [PATCH v3 20/25] qapi: backup: disable copy_range by default
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-21-vsementsov@virtuozzo.com>
 <c7c8350e-10cd-c8fa-552c-e3ced98ef861@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b94c695f-4c1e-2a5f-278e-78cf76782b03@virtuozzo.com>
Date: Tue, 12 Jan 2021 18:44:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <c7c8350e-10cd-c8fa-552c-e3ced98ef861@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 15:44:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcec8ecd-f489-4354-d93f-08d8b710e39c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB616696958D53AC24FA4B2C59C1AA0@AS8PR08MB6166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8w8jTKEPcqAWUfdIjbgk80QARQkUwLNJSzS4Hy4ChxluHKdoQOJ4kdRSL6kD/QbBYmuC38ncr53ly+V+l7foL98PdqZa/+6m+CN8+N1dY4FpKazF8gTJ5aVUQzbno4QrWTr4Z0xPa2MAkWShuy3vZVSGSPHy8tVXqEHye20MwVonb+Kg9feZ8VM08HmL7HgkYPkLpAndOeGSPgNDJbTfQ8HNi9jYCmZbbvzWAheElVtyDf4a0+1U5U8vAsLwQcz8IL3IkOpf2Vskkwd+zXj7fiGADZfou7JqAV0uHuGL77tlWhV88CZdb8UwpcA7oUkPWZg8rhQUnfCK0vt+tHuvJlDsGnTng+GADnz074jCstZLBP7oPuXTFXtxKwqqhm2ZjvASqAXWEjC0WO0rElWb9cvTYVnbraHsv1ACkbBgFrriuPDu5Ci70MA9EdLVHj1LRGUGLlWoQY7bd7UFbCrrQryxy3GOB/+wc6Tnyz4O3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(39830400003)(396003)(376002)(66946007)(66556008)(4326008)(5660300002)(16526019)(186003)(83380400001)(66476007)(53546011)(2906002)(86362001)(8936002)(16576012)(8676002)(478600001)(36756003)(31686004)(6486002)(52116002)(26005)(107886003)(31696002)(316002)(956004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VXozcktiNkZCeldHNStTRk5YdGlkU2M5bW1JRmFwRG1yTWtqOVdGZDEwR09O?=
 =?utf-8?B?TUx2WnJMUmZ3c3dMOTI0VnJwWk1QcVNmelJZZGtVazU4SGdBVGJLbkhHMC8z?=
 =?utf-8?B?WTNUTjlzMnJ1RUxvUUx3aVJiTE5FWGJHS21ZRlU4NnVpZ2dlS1U3N1k3RzRN?=
 =?utf-8?B?Yi9WSTQxbllTaE42RGhpSjZrRysxT2xkQWhnd05KenNHY0p0NnRhSmZGNDZB?=
 =?utf-8?B?dTdWNjRaNHJHTFFTNXJsc0xuZStqYTZOSWthUVY2Q3dSRTYwTlNlZlZnUDJP?=
 =?utf-8?B?VnZsRENnMG44YWd6L3A0R0NoNEJCRWxMMkdiWC93MTZybE5hcENiN0x0eWlt?=
 =?utf-8?B?ZGdMSWs1Y3pYUGU4NWppZXFRcG5VS0g4cUVmSVFRMzRPR1BuUmcxV0RycWQr?=
 =?utf-8?B?ZklJbDk0Vi9LR2M1V0JBUkMwVER1anplR1VZNHBHK1ovUnR4N3hTREVDbmlO?=
 =?utf-8?B?dVRCUlNsUzB1OThhcitnS1J4QmpIRUk2Q2NGamRHUEVTSU9ieGZUOWN3aDlE?=
 =?utf-8?B?ejA5L1FmWDVUZkJMNW9ZT1JuaGdlejU0aXJNQmE3WDFtaWtUbHhtR2dySWpJ?=
 =?utf-8?B?WUtYYmtaek51dlRjUXpkYmhwU0MrOWRXbnduMU91aGFkU1lrS3hNUkxHTnZx?=
 =?utf-8?B?dkNhdkxzSm9Zb09YQ2loM2NObHprMUM0dWNGVXRVUm43L2hGQmpnR3BQYjJY?=
 =?utf-8?B?R3VyZlJuNU8rU2w0K2wvMnBLNGJpek9ZaHZ4a1pHNGtEc3dDQnNzY1IvVWpC?=
 =?utf-8?B?N1ZqTDFsU2RxekNZMEE1UnltZ3hsNjVGcHJLWGgxVExmNDdWQkY2VEJselJv?=
 =?utf-8?B?aUU1OGxQdVd2ZjNkckxwTmVRTkNtR2paY3JwbktoUlpSWVFtMUdSd0N6cmxj?=
 =?utf-8?B?dkZzTlNKZmxBNDJnTENHMG1zblFGeE5vSE1yY3ZYRWtUWkIweEI5YUVpaHM5?=
 =?utf-8?B?Z0pldEJ3R1VubS9ySzRLY3hxTndOaGJwSmxkdXBNRGt3bmxzYlNUeTBaZ2dM?=
 =?utf-8?B?RU9zT293N3ZPZTQxdk5QaFBsNmxiUE5WK3k4TC8xV25oNmpneDNjN1RzWWN2?=
 =?utf-8?B?dXRKdnNzNkIybjY3Z0t5Ym9qUzMvL2taOVhvUzljTVhuc0U0UEFQL0N5cWZx?=
 =?utf-8?B?aUMrU0xDQ1J2aEtOQzdUSnNMTU4rK3MxRFZRM3pqV21vcitHTFhXcUZSdWcw?=
 =?utf-8?B?L0pXYlk4MU5QWlpBMm5FNy9nTUZ0UkE2OGR6OW5Ranlrdm9PNDZkUHFRNHYr?=
 =?utf-8?B?Ukp2TFlQUng3WnRnN2ZFSGczeFJGRUUwZEsrcm1iVTNKakszVStick96bHdJ?=
 =?utf-8?Q?/b/VVZclRowfUQ417gEAqqqzvAqJMSZJPv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:44:03.7931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: bcec8ecd-f489-4354-d93f-08d8b710e39c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/wgSfNJy9ottgGJxr/TVzZBLTl7PH/Gtc6ynyo1Lpaz1UlsdLzikNDSjBqbmydW3WccW07kp2y568f0QtJBHnswBrpiBjUT/oLGf+CViv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6166
Received-SPF: pass client-ip=40.107.3.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 17:05, Max Reitz wrote:
> On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
>> Further commit will add a benchmark
>> (scripts/simplebench/bench-backup.py), which will show that backup
>> works better with async parallel requests (previous commit) and
>> disabled copy_range. So, let's disable copy_range by default.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json | 2 +-
>>   blockdev.c           | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Uh, well, er, then why did you add it as true in patch 2?
> 
> Do you mean this patch as the basis for a discussion whether it should be true or false by default? 

Yes, I just kept the change in separate, to make it simpler to discuss.. Hmm, or seems I've tried to keep it close to the point when we are going to increase performance anyway (and making default false is needed for good final performance), when if we do the change earlier it would like a degradation during previous 20 commits.

> I don’t have anything to contribute, though, ergo I don’t mind either way.
> 
> Do you have an idea why copy offloading isn’t better?
> 

As I understand, it may be really fast for filesystem which will avoid data copying, like btrfs. Why it works slower for others when we enable async + block-status things, I don't know. It should depend on kernel implementation.

I have two additional thoughts:

1. for backup we usually want to do a copy on another node, or at least another hard drive, so we really going to copy the data, not just create some metadata links in fs.

2. even if fs can just create some links to existing clusters instead of copying data, IMHO it is not good for backup:

Main difference of backup from snapshot is that we don't touch active disk: it works in the same way like without backup job running. But if we do create fs-metadata links in backup image to original clusters, it means that on next guest write fs will have to do COW operation, so backup file will reference old cluster from active disk, and new cluster will be allocated for active disk. This means, that backup job influence on active vm disk, increasing its fragmentation.. Possibly I'm wrong, I'm not really good in how filesystems works.


> 
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 5a21c24c1d..58eb2bcb86 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -1376,7 +1376,7 @@
>>   # Optional parameters for backup. These parameters don't affect
>>   # functionality, but may significantly affect performance.
>>   #
>> -# @use-copy-range: Use copy offloading. Default true.
>> +# @use-copy-range: Use copy offloading. Default false.
>>   #
>>   # @max-workers: Maximum number of parallel requests for the sustained background
>>   #               copying process. Doesn't influence copy-before-write operations.
>> diff --git a/blockdev.c b/blockdev.c
>> index 0ed390abe0..1ac64d8ee2 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -2788,7 +2788,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
>>   {
>>       BlockJob *job = NULL;
>>       BdrvDirtyBitmap *bmap = NULL;
>> -    BackupPerf perf = { .use_copy_range = true, .max_workers = 64 };
>> +    BackupPerf perf = { .max_workers = 64 };
>>       int job_flags = JOB_DEFAULT;
>>       if (!backup->has_speed) {
>>
> 


-- 
Best regards,
Vladimir

