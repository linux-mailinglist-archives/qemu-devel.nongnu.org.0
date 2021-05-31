Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6DF396512
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:21:07 +0200 (CEST)
Received: from localhost ([::1]:56826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkf3-0008E7-MN
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnkcn-0006UO-GU; Mon, 31 May 2021 12:18:45 -0400
Received: from mail-eopbgr10127.outbound.protection.outlook.com
 ([40.107.1.127]:3136 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnkcl-0008Sm-0q; Mon, 31 May 2021 12:18:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYnMVg7m7ozLJHNXctcoQEF5P1mhXoBBbJZAl0s5pQxc/MB1aKwU4o12UfNQC57IRvTwYH1DqCdnnFu3l5DIVt74gKSma4M7Co6pralQB/7dqtHwtld1JWM7GmVBr+suAKd+iVfugk2bG92ahMLPKxhOfvryd0IdiHC05lCna1MY55mNPoknqkgI1nZwJlnCj7czk7x9Pk08jOsV+tACeVlspHSXQATCKREl9ebIU4EwfXmplT6cTeW5rEM7POKoYbckjW4lXU3BE/wA5a3gKU+w9gYhejiAYMEGLRRle4VybXXXM7NTyqYYONkUaCyKdDuAcHYGQwGWddfz9lzubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L+3xW3jhBbVUo+UlZ6ViLz40anrE5eTX9O/lr7C4hc=;
 b=EqnTLaqPUqzuKz7m765Zo8ljE0s/x1mrVGPkVsJsmehoR9TvI7L0cH0B6vqf3pq1oNghfSfGx2W7ZKz5XNY88vSVaeP1jiYbIdQK+feVAJZ2niT/+t8UuCftiPOSOmLNYL+u/Nlqva4A1+F/HTUmhkh/2UF7zfpY8cqxAJoym78iVOfF3CMgletAsoZz5kZ7UCYWouJeKr2xsLvaEU+A5KsRGMyco3Q3wfTFzPIaoWhIve0m7ZCkf6ARZNJ0SfIkEkuP7iHP0BJYWJiVvNcG9DsxOG2WP2JfGGY2Jfr8UKOH2/tSqqklZ3Cb/gDD6LR3yv3zgGT5Nups0hPHYRMTww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L+3xW3jhBbVUo+UlZ6ViLz40anrE5eTX9O/lr7C4hc=;
 b=s6O31fLQlhuqrqldd2f5OBk/gSbc+pi/b8xWxCc4meY1XyfIlX+Y+rBuL7N7nKyeCe0GYJldovO7bmRCO+LIzOFC9D62g9NOdyvTsQ2xwSe4I7fn+ns90XFJKioJQLm12wt1LzN08cRvnt+O9B5cJO6dtHwgqUjDnHg+Vr36cYw=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 16:18:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 16:18:39 +0000
Subject: Re: [PATCH v2 2/5] block-backend: improve blk_root_get_parent_desc()
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 berto@igalia.com
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
 <20210504094510.25032-3-vsementsov@virtuozzo.com>
 <YLUEne2OsslAJaRj@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0272ee1d-c24e-df09-2778-c7729b24e15a@virtuozzo.com>
Date: Mon, 31 May 2021 19:18:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YLUEne2OsslAJaRj@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Mon, 31 May 2021 16:18:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c0aff1d-8ebf-47e9-05b0-08d9244fc019
X-MS-TrafficTypeDiagnostic: AM6PR08MB4214:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4214FC37A8CE8AC82C97D7C7C13F9@AM6PR08MB4214.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:210;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJbEpp0o9QqUn2mjdk3CITIr1gfFrN/0ZevO+Mwt9i7mUTfavBsvFuNTbjZzyZGHKdEW6Ykj7JVa/O/lZdQFLt0tpIe80qHFxZLtGSDYGD1BE2eqsdN9ehyCoCU/YiiB6hJK7aDIVw4qVUsXatRvdeTKLg6Nkuqih3bynSkcExhvtH4kWpfCt/t6hZog7FqK/9VfUKDW4DKwOLM6L56Skz+ThFwKscyLAHHlB8dD/9WbL9RDSbv8x8MmjOtBPem3yxaXEoU+XSUGrpDHiWaUzHw7TVtRz4YUh6V0bTGiCyZa95gZiLtm2Lg+jGrHeoFcdHZJjiqKvmNegyMjylUAEgcyxjn1EWigHNbPmNaGoFygKdHwA04Zc8YN17pVKgRik/sAhhVzC19ljVAG/3LIpODAB5hMdJl7qeHUU4yisbexRMS4LtLJTZiJZfYtbJ5otn6OkHHQi6FeGac0NPIjZxtp8+MNn4WszeVOAHCB778mABTJzwolAWcCD2TOwfHPd85axXHJp3nDbR/SuZ8ysHxxo7rnVKaPjKdAScOI21pyEoqobTdr8JODZKx6br+i1PIxeHW0J3vJk8aztXn+O14ZxzntCRJGtpTvHEeOZ/HfPolQsTeyiUpANbtxuHdJj1ggSauR7PzeckYXh4jvzAbz1l3rdnQ0rCDAnvokdKyyEYyZ1mpGjRASegiC5K4RdILswooaCVnAMXdbQBxWeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(366004)(376002)(396003)(66946007)(66476007)(86362001)(66556008)(956004)(83380400001)(2616005)(8676002)(316002)(36756003)(31686004)(2906002)(8936002)(6916009)(5660300002)(16576012)(52116002)(186003)(16526019)(6486002)(38350700002)(478600001)(26005)(4326008)(38100700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckl5bnlUaDF6YzlJN0RtUFVweU5Ya1RPWk5xdUZPaWNKdFdmKzRXcEpkd3dX?=
 =?utf-8?B?cWxncjBzRWtzMm9aR3dVYStSeXhINDRvV1ltOGRkMnNUSGNzbG9UZ2tlN1lH?=
 =?utf-8?B?WTM0emY2QUJTT2YyZmFrVEtnbFpIOGl5L0ZENnRSOHVjNzFJaXBoRWppd2pG?=
 =?utf-8?B?ckJURW5vb0ZvbkpDOVM2QXh0WnhBaFN5NklBSEp1WTVBUzhvVjE0WVdPT1lz?=
 =?utf-8?B?TXRET3pYZFc4ZllnY25QakQzY2gycm5rTlZlb3dmU1FCdlJ6V28zazZSRDlL?=
 =?utf-8?B?UWRLY1YxWUpCa2l2T05rQWRDZmFqc1ZRNUQvbHBFcGh1WHNxNGN6UzMxaFB3?=
 =?utf-8?B?UThiYUJ0U0N2Ti9Na0UzRDNJMG0xR0ppNlVBT2xKQ1RKbHFDbENUZXVuemtY?=
 =?utf-8?B?bDRkT2FIMDE0UjNjdlI1SjlReEwrbFBZYnpIN0w3emM0QkhlQngvT0xjSEda?=
 =?utf-8?B?Q0o0TURCOTVVV1ZacWdta1IzekZxNWM1c2Q3YUVhbjYxOWRhZ05ZTThxd3VW?=
 =?utf-8?B?Y3RYYlZRVDBIWTN0M0U2YXpQZGNUd0gzMzZZZkN5Qit0amFTTEQ0NTdTaGNH?=
 =?utf-8?B?THNNVWFkb0hJaXAreW1TNGRLanp3S1ljTXhwaUxvanpvUlNNNzJLYUJIWUdz?=
 =?utf-8?B?dEUwbHhXNHdFdWlXaFBvT0N1c2tINEJtci9XSm9EbXo4Um51b0Zjdzc3RUdE?=
 =?utf-8?B?dXhudEowN0RWN2ZseWtIOWtCRFpBdTA3MTNLc2k1R2gxS1ZwNDgvMEx4cFpF?=
 =?utf-8?B?S1I5R3RKS1paVnk5aGRmbEx6RzU1Q2taSDZPamRoT0M5Wi9MODBOZ2JYK1Bq?=
 =?utf-8?B?TjlyVUhlMk5kRXJPc1FTS1crYWlOMnlsVUVxYkMrTFVNbHRhVVEwQjZhZGtE?=
 =?utf-8?B?LzhxTlRKNnhPTU81YUZKNkJnMW1QRWZTek5UUmpxbmx6aHVMcEh5QnFvM1hr?=
 =?utf-8?B?WVlMdHZoU0VMdTBndWMxaG1QN1c2UHlBRjM0am1ncTM2QUJ2ZTZlYUxPeWl3?=
 =?utf-8?B?b1N3ajQrVFZQcGRPaEhFbWhYU3dPZ0VhZTZlY2VnQjZXZUtENEcrMnptQnhz?=
 =?utf-8?B?WXd2Yjh0Y0c3cFRyMVJMSXJDVEpSUGs5ZHdmWVVyN3NJNlNwaXpzWEZTZWIr?=
 =?utf-8?B?VGJiSzJqclprc0lWdEFlZEZlQ1lsUFY5c0Nid0ZlQk1wUmZXL3l2UjJrcXly?=
 =?utf-8?B?bGFEY240L3FrQTR0U3l1cnBQNndpMmpYNWwvV3RGcVVkQk9oR3BvanV0MnQr?=
 =?utf-8?B?THhoSUFzZzlxd3pSTmdRZUFVaXhnTVh4djFpanJHNEwrL1ZjWmNjVTVkVEl6?=
 =?utf-8?B?RTZEWldYWkdacjBiNWlUNDYyZVNCNXhYY2hxUTh5N1NGaXdPNmNCQ2ZGaFhu?=
 =?utf-8?B?UmZaTnFSWUdUNlUwVVdtUDJpSkR1aXd3ajNFelJRN1dHQ1U2d3NqQkl1aHh1?=
 =?utf-8?B?Qzg4UXA0a2ROa2oxRHJvMzNOVlZ2SHUya2JLR0xTK1pIVW1Ldk42aFJpakJZ?=
 =?utf-8?B?emhPMVJsTlNER0h6dFQ5YllXZjhxUDFYcUJ0V3BPMmVhS0pOUmp6TytpbWRq?=
 =?utf-8?B?dlg5Z3VRVWxvb3p3VTBRUFd3aXh2dlZmVksyemxsWWhGYzhuWWlONDlJUEdp?=
 =?utf-8?B?YVVWSU1KL2U0NmNDOTAwTnk3bnZrTGd5emZnNWZvOHpJNVo0QVgzM3Q5Rm1s?=
 =?utf-8?B?Y1pIaThrTGc3bmxzY0pzNlNnZ0kwamdtSWVmUUJxVUt0SGNPUmlKRzZlQi9N?=
 =?utf-8?Q?eHLYNneQusgyCDkSjzvfYroyv3MZL3R4m85YCVK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0aff1d-8ebf-47e9-05b0-08d9244fc019
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 16:18:39.4134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPB22UKxMVYfQr7Bzt/JZFbuAIXV4xhvNAdnTLOwvXvdGTk3pJc5/HsLZrTlohmGr9ziBnRIqOMnj6DQSdTfTUJpi2yjavCls/gip7X3qSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4214
Received-SPF: pass client-ip=40.107.1.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7,
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

31.05.2021 18:45, Kevin Wolf wrote:
> Am 04.05.2021 um 11:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> We have different types of parents: block nodes, block backends and
>> jobs. So, it makes sense to specify type together with name.
>>
>> While being here also use g_autofree.
>>
>> iotest 307 output is updated.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Alberto Garcia <berto@igalia.com>
>> ---
>>   block/block-backend.c      | 9 ++++-----
>>   tests/qemu-iotests/307.out | 2 +-
>>   2 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index 6fca9853e1..2b7e9b5192 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -142,19 +142,18 @@ static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
>>   static char *blk_root_get_parent_desc(BdrvChild *child)
>>   {
>>       BlockBackend *blk = child->opaque;
>> -    char *dev_id;
>> +    g_autofree char *dev_id = NULL;
>>   
>>       if (blk->name) {
>> -        return g_strdup(blk->name);
>> +        return g_strdup_printf("block device '%s'", blk->name);
>>       }
>>   
>>       dev_id = blk_get_attached_dev_id(blk);
>>       if (*dev_id) {
>> -        return dev_id;
>> +        return g_strdup_printf("block device '%s'", dev_id);
>>       } else {
>>           /* TODO Callback into the BB owner for something more detailed */
>> -        g_free(dev_id);
>> -        return g_strdup("a block device");
>> +        return g_strdup("unnamed block device");
> 
> We should probably keep the article: "an unnamed block device"

OK, will do


-- 
Best regards,
Vladimir

