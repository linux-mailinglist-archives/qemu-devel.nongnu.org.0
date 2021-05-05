Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A63374980
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 22:35:03 +0200 (CEST)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOEY-00076r-5m
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 16:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leODh-0006Uj-Fq; Wed, 05 May 2021 16:34:09 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:20622 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leODe-0007ID-O8; Wed, 05 May 2021 16:34:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2Ae7XoLM4Ojyclvy5yCLUNwJBbh4AYml6Q1hMhgqfuVO2qQP7H8jJC/4ppjsbpDM64F6JPKKl7US+Lm0hSRMYbx9FpAbJV57MYyia1zYDGvMvVn87goAQkyknt2eBYVopLI8i0hSvPmxEixObkxFt29/1SAOefAVrHmeKg1Rjpf+PkY6nYIEX6uNmguJ6R78ZvMzpLTxI+PrwvZlubpGLvFeM03D1wJPwRg83mN3qVDLOn558p+JEvGVuMmIyY/dUhgirB5BFPiLnnSlSL9PDjQQLn/0dJBefj2pme/ehfF4g9A9NnwjcsxH3hTcPi7pPcxkVekyIW4dTq6GVKz5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RemfswBen7yuB7c8bdw4jzEAeYzpj0YhFh28icHZ7X0=;
 b=gO45/+D+HciSl5nTT7N4l47fIWSLv+s5TqDQUdBCwQSRgjq+YAWcUufMLWKYIqMN1TD+YF7wPed+8BwFETDm6qAKdTHPRgDL8XqVELuXspNF4yE8O0xJDKsssHqIZN4hT3TEiCOmfRWUZB+Cu5bWnbcUrHc/APhiW1/JXkpeZnx4UzPmNpwmx+ycHo4vx6XOGke6SiF1PcPaP8Ur6VRu3VSL16R/op8dMywZk8H3jH8puTdGpdVurBCPw8DTcG4T8v+NsK4ioGQN6QOqii2CzlhyeH+/Ugl2Sm5v2+zVD8HsfZ89RB63W/loI0TmdvL7Vbk8+nPdjorZ9U2njNR5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RemfswBen7yuB7c8bdw4jzEAeYzpj0YhFh28icHZ7X0=;
 b=uQYWM8EH0IzYlR5yOMNeSm0lO0StsaYQ8M+JYZVLoK2fw0M0FKdLzjcIVJ7ryncqQlwt4oCVpO/xRq2QA5op7UKT2m4Bs5hxPAQJcoX5DtDBMhfBhy2TTsOgKfGH+hkhzcxVNhj9ewtZ4iG6xlY+3A9uWZG+KDduuGRzqS6KtuU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2984.eurprd08.prod.outlook.com (2603:10a6:209:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Wed, 5 May
 2021 20:34:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 20:34:03 +0000
Subject: Re: [PATCH v2 9/9] block/write-threshold: drop extra includes
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 kwolf@redhat.com, eesposit@redhat.com, pbonzini@redhat.com
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-10-vsementsov@virtuozzo.com>
 <908586ae-f631-d626-3963-5b96d0c69b05@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a7ecc2ec-0c3f-41b8-7093-1bd193648a4f@virtuozzo.com>
Date: Wed, 5 May 2021 23:34:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <908586ae-f631-d626-3963-5b96d0c69b05@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: AM4PR0101CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 AM4PR0101CA0067.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 5 May 2021 20:34:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 937f6b6b-eeb0-4cd3-a736-08d910051f0e
X-MS-TrafficTypeDiagnostic: AM6PR08MB2984:
X-Microsoft-Antispam-PRVS: <AM6PR08MB29848355F932ACB74F42040EC1599@AM6PR08MB2984.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4yJvuQV4KLQ1vmzsZPaVfrCzrxVAELmOeV1FjM04bcxf9FduWqQTSOYQ01kX+5kbIcUDCTLoa2HxIyYp49nOuobN9RFVMhoIcodqv9zs33WfafxC1qnwA0tYWjRPBnjoh5kzK5jVcBHIg56GultYJECOFLhtPmVSLmFPb666gTM5yQYahm6URe4MjV1+AmYf20DSrbIu/nMZIo7eLLPyntR3qCUbb938uINjf3XolZMTT9ycUlmLaZpB4ssjjY7u2wFf81pVwwhRPJCXnda7igUgHtjktVc5FKzhCWiOmWdpylICn8lq3vY7qr1DX8dPO6lXqzNbAgNSDfY0pe4KGvwXILTCJPzKl9ILLhylwrt/zWiBIPnQIoHAnFQQvlXj7JIRv2FXfpD24ftxTFhM+uG1dDu/72qL3j6p8Ibtrlh5TcaBDXkn4r/ldxqYb3Qu8Gj8nr+gOWw26yn11oZtltmhTQE0+wXaVCCwWO49uYBdD9HuV7rwjpE9zQLmGzg2pSV2zQOi7AXH4QXBk9cirEbvs4lE7eX8zZyGS64I2Jx9lrRg2x9n0TB8uPJT8pE8EbZL9+idfoX1YmeBSySiuV9H6CvB0LyTR8ZcF7pf/MB8ZuCPrnV8nY7Hxb7Gv5gZB1NuqnhAEZYVJcjaUpZkgVwTLDG2CGmaGQpm/tVMi7ppR54C+onNlHszAU+1AXWP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39840400004)(376002)(136003)(16526019)(31686004)(66556008)(4326008)(53546011)(66946007)(36756003)(6486002)(52116002)(86362001)(478600001)(66476007)(2616005)(5660300002)(956004)(2906002)(186003)(8676002)(16576012)(38350700002)(83380400001)(8936002)(316002)(31696002)(38100700002)(26005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dmtTVVRoQmt4RUZkYkpwSUZOT3RURUpleW4xZTgvSDBrZ0pPYlBSeWU2RUJ4?=
 =?utf-8?B?TzVDL2JlZXN1Z2YxMmVVeitrRVRtb0JOYXB3Q0UvY3FoK1huWXIxbWJiaTNR?=
 =?utf-8?B?NHUxS1djYm5LaFQ2am5LYm0xaHdGUEVMY0QvcExETkhhRWVTSzRUdHg5R0NK?=
 =?utf-8?B?YUh1bGNmU1VlaE9ndE9UcStPazdHUmw1KzZNUFdrdTdFd3pVbk1ScFF5TEJH?=
 =?utf-8?B?eFdFeXJDeDFHdHh1T0VNNjBYWVBCZWFBc1FZaXErUC93enBXZVJWaHZ0V0xo?=
 =?utf-8?B?UmZOQkdXZ0tZUkNyb1lycWhUa3ZZSGlpNHNYQngzZFZCVFJRNXM0TjlMS1RF?=
 =?utf-8?B?UElqN3NsRE51aDBuTlg0ZGlSR2RuYThQOTNHMGF6ZityYmd4aW40SEFNTFdM?=
 =?utf-8?B?b0ZCRmlmalM2V2w2UFpoQXByMU9tK1RlYWQrNjlWdU9DRkdkWkVVVWc5cVM2?=
 =?utf-8?B?ckNqazRNSm52Kzk1RTZVQitPQmYva1NQd2xkM21EOStvMW02dGVwaG5TTEVv?=
 =?utf-8?B?LzE5VG1ZZGl5c2hzZVR4SXh5cFNoVDE4eGxiZGRQT01kZjhxQXFTM2s3MEkv?=
 =?utf-8?B?endnanJRdGdUZ1NnaVVSN0N0NXZkUDdlaGFwblpiRFdhdDVaT0YzdjlsZVlF?=
 =?utf-8?B?dHFSWUEvb0w5NG5oWGhRSGZlVDNwT0VKcHM5UVpEZEZXYS8yQkFsNXJldDhR?=
 =?utf-8?B?bHQwK1pjTS9JbmlKcEdMVm0yY0NZMFcxV3RzS0VhSHVNbTNCUWJLaVZVSHZl?=
 =?utf-8?B?bnV0R2UrR1BueGx5LzN0anRlWUQxbnVVb3pCclRLdkxjVXBxdzRSc1A1YTdE?=
 =?utf-8?B?bk9jWVB0RDBxbE83UXJmNWtKM210am9vZUhUSnNhdFRnWnBQWHRuVnFVQ25k?=
 =?utf-8?B?SG00VS9DdmdaWnp0dCs2YnlwZGN3eVh2cmg2UjRzc1Z2dHJBZGNUdG5pMWRo?=
 =?utf-8?B?MUdZdE5ZNFVBMW9yamtkN3RvblpwNm9MSWZiZjM4SGtQNExYeW5RcFBKa2gv?=
 =?utf-8?B?RWo1VVo2dWxWVXJnT2daYXpabjNNdDIvWXBWUXhEdk55aTM3RndlQkxKelU2?=
 =?utf-8?B?N2JWWUU4TGg0Uk45cHp3ME8zRG5wc3NYNERidG0xdUdsOFR1WHJTMHBZUGNq?=
 =?utf-8?B?bmRRM0llM2lpK3hIQ0w4MEM0QmhwS3BkNEVVZG0yOGliTmJrTHhIdk4vekIz?=
 =?utf-8?B?SVN6WGdRQUhWSHgrTmJQMXcrUWFSaHp0OXhoeG1aK3hweXdyclhzb0xJL3hD?=
 =?utf-8?B?Y0dCRzY0UWFrMnRQaS9TQWlMb3lmbzIyaFhkUEdsS3FQUkdhTlBuZ3RPREpF?=
 =?utf-8?B?ZiswNUt3N3Z1Myt0RiswUGlLVk90cGdmRWx0aVJtcmFsemFRNXkrd0kyZFIy?=
 =?utf-8?B?TndtK3Uwb1pycjcyS1JPZk5VWnBMMU5qMGVyNFF1TUJPZmhYVVBTaFB3VVI2?=
 =?utf-8?B?V2tSMXRsWnUvN2d3R1A3OVZCUGwycUxubnZ5QVRwNUlyRmViUGxlMW5oR0VG?=
 =?utf-8?B?RHhqSFZpaFpod1lLc1JGRitPRTQxbzRUWnRtV1oveVVIdDNVTlpScWk2YXBB?=
 =?utf-8?B?NlFaQXVueDd0MXBqd0RwTG1HL2JQQWdpdU5qMkswSlN3ZWpYRWJQUHlFWm1D?=
 =?utf-8?B?NWs2OHY5WU5nbFRRSVpoeGd1dDdRZDg4WjVvd0tQTmZMNDN5eUJxU2s2MVF5?=
 =?utf-8?B?dVdrOURSUTRhZlNSM1EzQXFJaERvWERwV2JxbUxHMGcwbFg3UTNzR3MyUFRx?=
 =?utf-8?Q?BoWzMbuQ4yEBu2ztRXLYYzmFzpK5tlVsRG9Ayq1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 937f6b6b-eeb0-4cd3-a736-08d910051f0e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 20:34:03.3273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUgpbkrxa6CLpBNP9m8a2MN2dZvQF9QjZwAUcZtZSFj82qvNh+k3Fnza9FmN4c/tCm+XMnBd/NFNjmAlRgg+zB77d4HbomucOatF2X5oZL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2984
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

05.05.2021 19:23, Max Reitz wrote:
> On 04.05.21 10:25, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/write-threshold.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/block/write-threshold.c b/block/write-threshold.c
>> index fbf4e6f5c4..db271c5537 100644
>> --- a/block/write-threshold.c
>> +++ b/block/write-threshold.c
>> @@ -12,10 +12,7 @@
>>    */
>>   #include "qemu/osdep.h"
>> -#include "block/block_int.h"
> 
> We need this (for bs->write_threshold_offset), but it’s included through block/block_int.h.  I’m not sure whether we should drop it from the includes.
> 
> Perhaps we should instead drop block_int.h from write-threshold.h? Shouldn’t including qemu/osdep.h (which includes qemu/typedefs.h, which forward-declares BDS) be sufficient there?
> 
>> -#include "qemu/coroutine.h"
>>   #include "block/write-threshold.h"
>> -#include "qemu/notify.h"
>>   #include "qapi/error.h"
>>   #include "qapi/qapi-commands-block-core.h"
>>   #include "qapi/qapi-events-block-core.h"
> 
> Btw, where does qemu/atomic.h come in?  Looks like it comes through block_int.h.  I think we should include it explicitly.
> 

I'm not sure. If something is included through another include, why to include it explicitly?

For me, if statement can be removed with no effect, it's an extra statement.


-- 
Best regards,
Vladimir

