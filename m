Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C3387921
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:47:02 +0200 (CEST)
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liz7k-00078H-Vz
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liyj8-0006jo-El; Tue, 18 May 2021 08:21:37 -0400
Received: from mail-vi1eur05on2098.outbound.protection.outlook.com
 ([40.107.21.98]:45504 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liyj2-0001kU-DL; Tue, 18 May 2021 08:21:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2Pez5HvVZzJjBblXybrbZ5fyWNO//siSkWds5ZC5evoVDsGZybOJS37K7GY+dvN+EmCfUkbXIUoNu1cWgcrLqoj2q13pgUF8ydCULpNZP5am8NDJViEOEJLtnbozbfbPi0gJYdlQ2kk2cNBtnU+/+jG0MLrxZMzri2fDiCgt3tDwgZuNLSC5K+75avnCbpSA77D2hj7oQZJzELqvqhQnUa826SgofQxlEdeifG6zawbnwjQrGohBdvbcE3T9C0nG61hPJpZVN/DsBQeQ6hEHl5108KfKFPrELHpIuAjnTktOjmLJy3LfMR05QtHzepXEox6mfjIw7x5tCRVH19bNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDAOqnTNP1pxM8Ls3nMdPjJrFuN7gIDjRQloH1VLd48=;
 b=KZpOupNOy3V85BkF2qpeugpA2onyAvJAM/NhzfmnKvrYU73SHcBatTu9nOdWB92A/NO2JPcJ6IhyXfQNZgQZPjQPVUwC4F0m3DYnKyiJDCd3zf2p8qkrbRE4gwpbhTBDd7uMo/jMlTCHY2TcEuW76vsa4sM0oemnf2G/wDNWWgZSAjAlrCu6btwgARIZhN9NfeNLPQwiPxDmOZ2PJPJDHW9GMBWo3ZvqshIbtt+4BKOGE231t+RaC6faepTaGawQbCE003W63QqFv/SdXdT8op/W1uwJRblrfSmou3Ozka3JH+3YAnA0d5rfUBEL4STbyVkUvwYZufYnUuj90Ccm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDAOqnTNP1pxM8Ls3nMdPjJrFuN7gIDjRQloH1VLd48=;
 b=X/uktpI4p8Om5baYOT0DKgRc090jwIWvEXjI52pJPBWC4p1da+IKVXfLg1rcsgodVGMMxG41sJuuKpLvJ7coACsikdZFVWWRs5UWVOtXMYQK3Cohf0IjvzeSX5cBN3HOVCx/4Va1xAtIVG3pjJd5klLHjopQ4yuVvGUIQ0vxGiU=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4167.eurprd08.prod.outlook.com (2603:10a6:20b:ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 12:21:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 12:21:25 +0000
Subject: Re: [PATCH 11/21] block/copy-before-write: use file child instead of
 backing
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-13-vsementsov@virtuozzo.com>
 <29390f62-af03-f9a6-c349-af69578302de@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b410742c-9ce0-6393-d0cc-de6f49d0c3a1@virtuozzo.com>
Date: Tue, 18 May 2021 15:21:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <29390f62-af03-f9a6-c349-af69578302de@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: ZR0P278CA0144.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 ZR0P278CA0144.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 12:21:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfa18910-86e5-45e1-0514-08d919f77469
X-MS-TrafficTypeDiagnostic: AM6PR08MB4167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB41677678C544CA0ACF24CD2CC12C9@AM6PR08MB4167.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZyKu0RDMRDrB+N3Q7av+8EewJGzcWc5Td+dapGnnuMAohwHEcZ58PFrdUelSly8+402axEMA1puYMdAbl9dCbr6xiv/O46kg+43W2obur78dAK4DIOZ/OQ0KdoiGYY8OTAE2Ri6JytpTnq6HDd+y8jFsZNbCzzKCmfc9ho1kEDa0G8Y9+A6IHkYX6qKUYHiWrvlf9qGr7Hzb6sK3J3PXFyg/9dWziHF5QiLOGz9xheOIqIevo1rWdCog4uzgrdR8T3euDKc+EJqGhChWS4JlzxszPbB7BjVOaGAO9+oEXf9Xh8G2Z1b8JWTUGc/2IUQXwqXG/aWbr3tWI8wK2Dht9fPWtvVlt121JFADcjGVf4MQSdkB60UpKgZ02i1JsI1huGuHjEBszfAcvs833XahCPr1U8CtwKTOhKY4BiQuHIazHhttWG+75++n/TVKqgfeR0B+vxZR8vHhktPEDVSFEXxm/z7KCZCDbO3JdyvJb7czGGV4vdW2xXgLXcb15fh3g95Ypfj7W80GIXOQGnJjAnkDqDI42v8/0f1FkPKTT/9DWyHzdqOzpJNnskJBClEqh2jeV/gjUq59jT+/ah6BFfoikssNOTj0I4489qAmLbNwf0+/16jkuA2mtFwxKAvGkUEy57ZFPgEDzkvZvFJuvTU9hk77rwDlPLV97bWSuQ4kCpeVOkTNDpt3zzv20B2CDWKyoNl+z7AQz2gCYMGLwOdBbZxYqlmS2VhFoVHqZKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(39840400004)(136003)(346002)(8676002)(66946007)(16526019)(26005)(107886003)(66476007)(4326008)(8936002)(186003)(53546011)(66556008)(86362001)(31686004)(38350700002)(478600001)(5660300002)(83380400001)(52116002)(38100700002)(2616005)(316002)(6486002)(31696002)(7416002)(16576012)(2906002)(956004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Vnl3empJRXRhVjdUcG5nbVUwQXVGMFRyZ3V3bjNULzRiazVQQk50OENQZVY4?=
 =?utf-8?B?NFJNUjZ1VE1OZVZiYXRZNTRWSW5iTzYxU2hBa25rTjNTcnZoZEtScVIxTWpk?=
 =?utf-8?B?ZmZ0RTB4L09wOU5ha3AvTDdUczQxcjlycldwOXI3UUppQUhsQ3FqUU9VcUtR?=
 =?utf-8?B?cXhjczRvcW01UTdlMGhIMWtDd281Y09tamJyaHY2a2FwMStnbVNWU09ncnZT?=
 =?utf-8?B?MVI1dTI4UTJWV1pjUG5ibGovWVljYUpnRytKa2EwQ2p5cW9md2FFN3A5Y3Qr?=
 =?utf-8?B?RlJDRFpITk5WZHJVV2xDV2VhZk05N3pDK0xSbjR6U3pmL2xRWDlvWjZXOS8y?=
 =?utf-8?B?SGF4THhCclRGM1N6d3JjMGFNZXAzRDZPQTZiZHI0YSs0b3hGZnFLZTZXOHo1?=
 =?utf-8?B?a0JtcXZiKzZhWFlDYlkwYTcrNlNWWko1eGZxS1FvR3FRTm9Rb0hKZEFoSy9E?=
 =?utf-8?B?RmNvOGpocXdOV1ZlSTJycWhPU05KTXNWSytjUjh4L2ZPcnluMWVPdUFXbzNI?=
 =?utf-8?B?bkorWERhSnppbGlPMndJUmYyQi9yVVkxbjlZQUdXaHE4bUxUc01kU2hnZjM2?=
 =?utf-8?B?Sm9heGlCcFluREl0NGZsdVZQSUYzcm1MV0ZZcVJVMEYrSWlmTktUTFNHcTlj?=
 =?utf-8?B?TFEzT0FBd1JLMHZlRGZEZElLclZSR1h5QnVTVHFCM3lMalJzc2wwOEQxcnNF?=
 =?utf-8?B?T1ZZMjY3em1JTnRlY2R4TVpRelowamdoTHFUWFVQNmhCV3dSWm1SSGZCMTE5?=
 =?utf-8?B?ZFR6eXZUK2lySmZVS2JPWGxvblRaRm9VSCt1aW5jYUtjWlgxa3RPbWJCR2w3?=
 =?utf-8?B?NGRpN0dxUlZzTWwzeUQ0YmNIQ0xNRWhveThiLzE1ZTkwZ21yQ1ladGN1bE91?=
 =?utf-8?B?T3RJaW8yZTNNWTE4QXRIRUREWW51TDdQb1ZONUFPY0taRU9FQXZySERVM0Q1?=
 =?utf-8?B?RXA1SDlDanpubm1jMk5WSXJJM3ZFRTFVbTV3aEUyZmtBeExzTlc3ZW44a283?=
 =?utf-8?B?a3FMbFpuNDQ0S005V2tLUk5GZmFMelRGYndaVjB1a2tKMU5wZHNlS1RwVnhQ?=
 =?utf-8?B?NnU1dzRiMDY0MkVldkUrdmx6UnJkb2JVUERqNm5SY3pmVmJzeWxXVFQ5ZXJl?=
 =?utf-8?B?Tm41VHZLcDU0ckxJT2VNdDlvdmQ2Wk1yTzJyYTBTZlViKzc4MVlhbzlyb1dz?=
 =?utf-8?B?WnM3dXdWWUQ2cUloNmMzNHJXckZzcDRORkFuYmcxd3kvdDhGOVVpdlhGaVli?=
 =?utf-8?B?dlRjV3hoN08xbWgvTmhKMTl3M0NwWGJ0WVc0aTMyYS9odGlBd1VZenVhY3hq?=
 =?utf-8?B?U1QwaEFqSGMyd0ZkdHU1ZGd3aUVNQU0yWmJqeFkzVzFEVERvTnlia0VKcER4?=
 =?utf-8?B?cHVwVHVXVHNHUGlXSy8rM3NuQjk1QVAyMFdJQS9RYkdZSUhiSHNoUTRFR0hY?=
 =?utf-8?B?djI0YXVPY3hZNW1STGJ2dXQybk1DbnVDYXd2aS9lSUZIckF4ZE1ZZFpOVnEv?=
 =?utf-8?B?SjM3azNJQk0ya3YvZVc5cyttMUZ0alRtZXdjalh0NytyYW5ycUl0UWhnSzRi?=
 =?utf-8?B?YWFlOTMxSU15WWJmODJtcDhLckZOdjVIRmRhSEo5cUtWWUR5MjRBTHFrcHF4?=
 =?utf-8?B?b3prZXg5aGZDQVN4WTZBQkpLUnJJUjFkWkxZRERHUXU0UU14TGV2b3lidzcr?=
 =?utf-8?B?dzJXbVU2dkk1ZVUxaEdZQ3pkRCtiVkdIVHpNLzNCV1VmdlMydi94dzZiaHVF?=
 =?utf-8?Q?fp5nfsahd/jZgden9CGqQK+jqT//jKmnzNd5L0c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa18910-86e5-45e1-0514-08d919f77469
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 12:21:25.1506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXXgH+vxn/DKiehgx4u58vgf52ttBQitCv8C/CT0zXHnOrUPSIBwgEsh8XjjsWinMHImZ0cnceW0gLZFFVTUJjz5I/7aPPtWLzd30zAawvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4167
Received-SPF: pass client-ip=40.107.21.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

18.05.2021 14:47, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to publish copy-before-write filter, and there no public
>> backing-child-based filter in Qemu. No reason to create a precedent, so
>> let's refactor copy-before-write filter instead.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/copy-before-write.c | 40 ++++++++++++++++++++++-----------------
>>   1 file changed, 23 insertions(+), 17 deletions(-)
>>
>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>> index af2bb97a30..2f06a524b8 100644
>> --- a/block/copy-before-write.c
>> +++ b/block/copy-before-write.c
> 
> [...]
> 
>> @@ -201,22 +195,34 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
>>       state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
>>                                         BDRV_CHILD_DATA, errp);
>>       if (!state->target) {
>> +        error_prepend(errp, "Cannot attach target child: ");
>>           bdrv_unref(target);
>>           bdrv_unref(top);
>>           return NULL;
>>       }
>> +    bdrv_ref(source);
>> +    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
>> +                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
>> +                                  errp);
>> +    if (!top->file) {
>> +        error_prepend(errp, "Cannot attach file child: ");
>> +        bdrv_unref(source);
> 
> Already existing in the code above, but why is the reference to @source dropped here?  Shouldn’t bdrv_attach_child()’s error path have done that already?
> 

Hmm, yes. Looks like a preexisting bug. will fix and update this patch.


-- 
Best regards,
Vladimir

