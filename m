Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05F758C877
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:39:37 +0200 (CEST)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL22i-0003rj-Ql
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1ua-0005rY-Dy; Mon, 08 Aug 2022 08:31:12 -0400
Received: from mail-eopbgr20135.outbound.protection.outlook.com
 ([40.107.2.135]:21825 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oL1uX-0005aS-1N; Mon, 08 Aug 2022 08:31:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABzPN2N9DdKcTSBd+CVoREoZToOkMhqZ5w0zQ7MeT6vMzz/on42BXc+Yc3mMN51XnwHeoeC/A1S9umfkHePP15eULr0AdHFEQw44QTYiO+tk9bE5+iaW90iPYYKAKhisBc8+qIJ8iWqTyaLjnqUpbYuYGXs3GaoSX0Nm4w81MLWP3ljcgHSEG9GGKpCQdBnqaTPmgPwWyraBA0OZXSmKrVO0cf8tl98Nx6wSwkkNoZe3H4QbSHT+HrbEkxxx5lA5PMq5hMWLLeXnJDA4FoTk+hyTVwF3YWVNbzN6g9y4/duqHB6K1OUT1SEkloyTZs3xYuF9TWs/4gaY8hz2AjtUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfaHv7J+0CGszeinldKUNifYcS3d92Lz/wrWD8o+q8M=;
 b=b7VvEj0DQhswMsn7Kd+a6sv/iWg/YkB3xkcnB6on/As7AssxP2VNl4p70rzkeDaX67ftLaKblNd0lehO4E8CsI4Dqef+HMcZyAdVKDVYcWXRlf7tKy8HJHuWpTzb/C2v9wqlxwLORyPAaBWwDCknxCAg88phOO+alXJ34a7CdeHPHEeexEjwp4gkGI+8ANQlAxud/QlqiGbVtoOn7tT4+QsdmBK+j5eXButNaF5OUokzS9PsRNDvZeMzu0gNGtZzOQOcymfnK9O8W2XhLJXQR61oNGSM8TjiRgZS2OopOQASRqfi1wPRa8yCAKFBZjkTQ5Id0di6TxLKMzWKJhzb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfaHv7J+0CGszeinldKUNifYcS3d92Lz/wrWD8o+q8M=;
 b=vSOOOaequRwnVf6GGC36m4fElQUUj9UW0wL3AX4c+U2NSEh4lnDTB5vO2A1Ex0kaPO0ttRQFt3p4+QNk2JVldmlxqxDwOeq8jfE5uhmzCKz4C42UKIOUlGbvUuOaQOe2jEHlKgI/L9CruzlYiNwD3rfYm5f7TN4UwARzUBe8TwzE08ucBu8kKsgh+PCR61Sh19Tt9brwHgWF9Ka6pQfjJT+hKl2gl3DL/bzi+Nv2BmP+Val0p7AZPc1y5Cf12mfKFhBRQk0j5LTQ4H773zi28EZ6aMe8u7YRSYrgCmTXJCaMnGcqc9vcfVhnQMJOGBVtkrGFiGNDzE3wpzBTmNHLQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DBBPR08MB4475.eurprd08.prod.outlook.com (2603:10a6:10:cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 8 Aug
 2022 12:31:04 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:31:04 +0000
Message-ID: <e172c07d-467a-7adf-f209-4c53f5cc10ba@virtuozzo.com>
Date: Mon, 8 Aug 2022 14:31:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/9] parallels: Move check of cluster outside image to a
 separate function
Content-Language: en-US
From: "Denis V. Lunev" <den@virtuozzo.com>
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
 <20220808120734.1168314-3-alexander.ivanov@virtuozzo.com>
 <c16f830c-a4d9-df28-949b-24a5177ea2fb@virtuozzo.com>
In-Reply-To: <c16f830c-a4d9-df28-949b-24a5177ea2fb@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0081.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::34) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 213d3799-c494-42ae-c107-08da7939dc20
X-MS-TrafficTypeDiagnostic: DBBPR08MB4475:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kdnmoaib3smMTL1WfBahYbO6LNFxFbShSbf4c8I4glzsF7upEmhNME7zbuhhiuHwqzLc+FkXtIRkpk5DA3Efj+EV/0QmiDto51Tp8CwNZ31G8ayuLtF8Q6z1psV7HTqOJftTyI8HToQ6XM6dQiMosBYUpsQst2NtoTpACpEZBSFaCeoKLU9VfeHQwxqwZJykh3oUGENd8JyTnhGDyT81qzD1V4mKmPqxgh3rpYcIMAJKUzrTjt4Squ8nYU7aT2WgpkeXiTXEDbQUGAHhi2oUrxkmabduqMz7QXhqVCtRzUz7/Ahiu2Wsg77rPIw1L0gg0vyPR3HVmW7g4SBZm1o07U5oGq6+MGuvdXEIeJEUtejF3mCqOYKZgn1PyJWaZgP5j4O2XYhoKVKkEf+sLthWdJs+OzRoAveAWVQhee9LNI/kw1p0+iMDjr05UGDUugfKvWrWcsH4602dQL3zhTn2N+zbmNmC3lh3YOxy1E8EABJyAyYgfUAeDxOEqGP6xbzYehU2aJSZPxWG+APdRwKU+M5fIvpvSTGDRs5zaSLcj7eEneC0oQueCypMM5/qmQgyh7b1ko7L+uz7lB4GnU5vsNsWVadVRnjsnSOXFKUM+nl2U4r+BhTmot8Dp8nIRj08xwc9Wsq412+ZQGQ/so8vx3Zf3ArdzDsDRAmzScHu7pI4oItX9QCAPmovQgKErUk1zDfrUP0OJVzHHf9Q6SbRuC4U4/lxW/0xrwE/VErqIUtMO/Mf/YMBp1lhb9aeWYMSctrWV9xLVCF5kzD4mUpXILukDzaDZyzsj1R5wObW7sYQslrg7IrlxaDzwNi4n7JF64nSEWo86lDzukNDz9t45S4u38cbf9q1dgrN2uRTf0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39850400004)(136003)(376002)(83380400001)(2616005)(316002)(186003)(52116002)(6512007)(86362001)(6506007)(31696002)(26005)(53546011)(41300700001)(478600001)(8936002)(5660300002)(31686004)(36756003)(2906002)(66946007)(38350700002)(38100700002)(66556008)(66476007)(6486002)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEJud3AxR0E0WENXTUw0MHY3dDBld0ltVXpxOTdHdVlyZTIxL0xUVmk0d1Ur?=
 =?utf-8?B?QnNVZnNLL2d5c1VVMWpJdmxsa09HQ21WMFJXdy9YaXRpTi9Hc21XT1I3SjFC?=
 =?utf-8?B?QUdZZ0lvaHA4ZHJYQlNHU1lNb2cvMmxUeVhGVHExcythUmx2a3pxMDhEVU1O?=
 =?utf-8?B?VFpKNXlSWGhUOGJsK2laTXdaQ01CWjJvcFhJa0M2K2ZWYnY4dnRpUW1GMFZQ?=
 =?utf-8?B?TFovV0ozQnVDRGx6L3RmTy9mcjBnbTBYTGVYcElvK01tSGFZWE1lSWMyYm16?=
 =?utf-8?B?ZTZQUk5uQzVvNXduMWk3Skc2Ti9vNkVPdnhnTjFCdGQ3NWk2RjFaeUl4SlJa?=
 =?utf-8?B?VmZMVDdsZ0RoZVdDUHhEeHlHd0dHanNDTUdiL3J1b0RRTit4NjVheUFTV2FX?=
 =?utf-8?B?QzBLS2t3SFhPQitwWHZvckVZZnNqeEg1SThPeTRBUzFhRjdkOXE4MUR1NTZI?=
 =?utf-8?B?YmdwM3JPZDlYOFh6MU5QanBEOTE2Q1BKamplNnlHN2UvWUI0VkhRTGcxeDlE?=
 =?utf-8?B?cjFOOURxUVhaSEZmM3ZwNUVBdUtMUlJKRDNmZ3N2cXkrbmVwZFZMUFp0NGpz?=
 =?utf-8?B?Tm5hU0tzbno2TzlGVVlFRG5VUVVWT3lFNHovdmpIS0gyT1NLMFdUTlVJVGln?=
 =?utf-8?B?WEVCQmNuai9vT2Fxb0UweFo4WmtBQVFsMURNZzJUdVg5eGxUS1hWcHJCV0Vo?=
 =?utf-8?B?eHFteFQ2L0ovZ3NkOFVXWHpRbkpUV3NuRXBFb2VxcXdCM3l2S2pkWWlnMUtm?=
 =?utf-8?B?UzM0NW1obVVkSCtmeXJGZkhSZzZzWmlRSGtlYnczamJNbGxVR29vNTNYb1B5?=
 =?utf-8?B?ckxzcm5yQVFvQlZZMkdLeStQQ0N0d2M2a3ZZRjVGUlAvR2UyclNsSXpMUExp?=
 =?utf-8?B?UWd3UjhGanlha1Y0MjNXcEN2Sm1XT1hnbEdySGFaUWtVZ212Y2dIby9SVjg4?=
 =?utf-8?B?U2Y2WFZFd04xOGl2Y0dvNXhqK3llUmRJbUVWTjF2c05IRzhKVG5EYnJiSnlC?=
 =?utf-8?B?M3BKcnRhU1BBY2FlZkpBdERiemVBU0RWYmRqUjFiMGpUYjc1ek9WWjJzTVNC?=
 =?utf-8?B?TXVvNm9vTzdGTWNHWWZJSGJpeTZMT3kzYjBwWjhubFRJa0hjVmRDK2RTNnVX?=
 =?utf-8?B?V2dyNE4rRUozckhmbHVIN1FQUU5za0RYTmdRVjBZbytqbEk2K0ViczZxVjBB?=
 =?utf-8?B?Qy9RVFA1RjFlWjFMSHJiNm9RWnNaZlBXTTdVSEF5UnAvd1NUc2ErWlRrWElx?=
 =?utf-8?B?VDN2RzNteWN5Wm9LS2xRRTFPRmRUc0pSMnRCNUVtM2pzQ3E0UCsrcDRqOGt6?=
 =?utf-8?B?Zk1aTmFlNFhxUUZGalRPcU4xYm9CWWFhU3pLeG5pQk03WmdzTjJJRkVSQWow?=
 =?utf-8?B?SjNtRWxRUEdURlFTOFFvaEFiUW1BdDZ5ZmdKajdoaEd1ekZjMiszaDNJUUFF?=
 =?utf-8?B?SUpmNzBhdnFrWWloK2o3YUpadTBydkt5U21oMjZQWW9hUGxGcmFPOFBpRjRQ?=
 =?utf-8?B?cDhraUdXTzd1R2taRVNOVlNLWkdGc21zT3kwandCUEhieXJhSlc2VWVTcmY5?=
 =?utf-8?B?d21zV2xWVU9tNnVHakordUYyS3JweGxtdDg0R0RaUEIzb09DRVZSY2FuNTFs?=
 =?utf-8?B?dW1HdTlteVZrcGdhTVpvTU1iM3NWT0ZzM2NuNUVNR0czMGlzWW1zUE56QW9S?=
 =?utf-8?B?eEFSZVVQRjR2VTA3TkhhVFVaMyswTGZGK3g4T1Nud3VNS0VleTFTRXcrUUJz?=
 =?utf-8?B?R0ZEVmE2WWFrYkZwcmxHWTFncnhJTGpRTVB2cnpHa2dDRVpYajBhdVdFTEJI?=
 =?utf-8?B?eVkxSVNVNjlrdmgyYXRXN09QQ25Qb1pISWtWbW5YR3ZMeC81aHNPdy92am5Z?=
 =?utf-8?B?N1FvcGZES0E5ZnphZWUyL3JiRFB0QlNmUFVxbTgvQzB4ZSsrakdLTGJZRUQ4?=
 =?utf-8?B?R0Q1MitTbHZJT0dpUXE0NWMxeHNQTjFMRStiYXNTYXJUeDhuRG9iR1VybllZ?=
 =?utf-8?B?ZjVsbGRud0kxK1FLZ3crOUNUaUhYeEEzNk1BejV1d3RkNG8xSzkwNWVsMm1V?=
 =?utf-8?B?ME1PdXlWOURFNFNWdEFpL09zeGpwNTBQWGo4Tk56NUppVms4ZTNoSXd5V0x1?=
 =?utf-8?Q?c8vS4BM4zCY7YSJr4CvNZMy45?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213d3799-c494-42ae-c107-08da7939dc20
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:31:04.0514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXMXRrwnsfZAbo2Bi1JY2ofQMuADHt8PiDgN6Ou5rXKmc6fLqybklbwnzbv52L19cxeuPOSldpKmBS5Vg37UfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4475
Received-SPF: pass client-ip=40.107.2.135; envelope-from=den@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08.08.2022 14:19, Denis V. Lunev wrote:
> On 08.08.2022 14:07, Alexander Ivanov wrote:
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 76 +++++++++++++++++++++++++++++++++--------------
>>   1 file changed, 53 insertions(+), 23 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 108aa907b8..7b400ecdcc 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -413,6 +413,13 @@ static coroutine_fn int 
>> parallels_co_readv(BlockDriverState *bs,
>>       return ret;
>>   }
>>   +static void parallels_set_bat_entry(BDRVParallelsState *s,
>> +                                    uint32_t index, uint32_t offset)
>> +{
>> +    s->bat_bitmap[index] = offset;
>> +    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / 
>> s->bat_dirty_block, 1);
>> +}
>> +
>>   static void parallels_check_unclean(BlockDriverState *bs,
>>                                       BdrvCheckResult *res,
>>                                       BdrvCheckMode fix)
>
> This helper seems unrelated to the patch subject and should be done 
> separately.

more specifically - you have created the helper BUT you have not used
it at ALL places where we update BAT. That is seriously wrong from the
code completness POW. If you have getter - you MUST use it everywhere,
even within allocate_clusters().

Normally you create helper, f.e. refactoring code of allocate cluster 
promising
that the code will be reused later (non-functional changes) and after that
in the separate patch you spread its usage refactoring other code, f.e.
to avoid flush_bat tracking.

