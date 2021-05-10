Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C13786BD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:32:33 +0200 (CEST)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg49I-0006LC-6S
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg45S-0003CS-G5; Mon, 10 May 2021 07:28:34 -0400
Received: from mail-eopbgr60134.outbound.protection.outlook.com
 ([40.107.6.134]:64974 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg45P-0003cN-7J; Mon, 10 May 2021 07:28:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xyc6xRA53CJkS6N8tmX/a3/GNlVWx83wgXghexa8piO+y6IMfqEyUmKFvyRZ+oBNBTnKMwMZh7hUkyRwUQuaUMz7DccaoH47/Ww2JXlS2WRvOpaTnMzOC3ueM3S7lFLLTS7BSzmZ4ayqcQsGK2RR5ndAZnC1MaRyXgW8vCVIakb9rWgm+bTwMhnGiHm+EEN44WNmuHiyWfjKOiy4OalHGRImanowHhklYHHr7Fyysxq090l/G5XtyR9zRe+tYuNLkj6C5ETPDi+jdtq4GSVYLP9LZI2gM7jHwR8VlPkVkVAnH93MRfOkdapgfIePDuxhzhCkeEOLie9tHtcPhMK2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiMjue/Qw8bSUI5Zrjt1lg3ohww6axxHSo/3FSBtSdI=;
 b=B9jcV+a5/CftRc0c+3GYMyKDdPU/Q8iMQ9t8Mq9n1QQGZWwL3Ht13IYUKTSEA0KmWrL0CgKBWUnyMZQDIo2sS0rbhxEwAlcMQH55Xm4ttXHk1yABnX++1ni6TyTA/QNzqcFnvUcMQnef08A+XeTXwfd494pJtHqwsyRfdn4FxtTvCN2oOBRWQ72+VPq1NWaz30bmccui5yOHLNoE1XocogJEb61Ce1gNX7piw6SGmia1zle0vhAyfRJL3Q/XbsP9OWUUvBpPro5Igv9LMjQDgQFWjA3WxGbDKUz0v5X6G4LGFxeNYVb025373SvfolHRPf8U+mAZHFc5fY/FFbvTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiMjue/Qw8bSUI5Zrjt1lg3ohww6axxHSo/3FSBtSdI=;
 b=vtP+Gw3l0iZyCIUGQXKjuThs2Anb6hyX31Y/XS9bfMTgapqhL8NYWQus7lTO6S40da4bTiMCBC4U4LpQTh1LA3E+0D+Mv7ZDqgVRPTIo0ZdDeZSaxVDayrZOsPuQt8DmeXfhQyzIThqKDCKyiGq1Mh0eLa8QmFR1d0Hra3Lzrt8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.28; Mon, 10 May
 2021 11:28:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 11:28:28 +0000
Subject: Re: [PATCH 4/6] progressmeter: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <946e8544-8183-25b4-6a6a-17eed8c1b009@virtuozzo.com>
Date: Mon, 10 May 2021 14:28:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210510085941.22769-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM0PR02CA0169.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM0PR02CA0169.eurprd02.prod.outlook.com (2603:10a6:20b:28e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 10 May 2021 11:28:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 274cfaed-434f-49c3-0ceb-08d913a6bb70
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944492227E71E071C9A7B8CC1549@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E/+LfyaBUEOzc4aNu6cC/xHNUiL37pYpxcDNppL/ELfJC57MxsYU5izg3EAzOVeoobThmhcUGCKwdArnmH+UbXp2A9JG34UNP5un5sxER26UVCoRAlVjA8rpSLx75zRJpP5z3KwzNcR5F5bk6UEQIcf5U20H3HvTQ7Ai7SnfvAMZ5vOcy6seViagqhHIb58/pCqlyx0/8gTsM1eSF3pMIBGqyqzeT3qNFCC1uRJAU3FdYBlOyzG0S0ApRkLRcrcCRvLjwNuscOuqP9o/xessam9M+uFI8DC2cSUZJJ29q2rX5ovkiX0V6dtGkbTQVmKcacJgH12CABrHlZAUxy1Gq0wuTv7qmDSAH6Tniem6vFgOeqlfMF7ZvLSETTR6+G0z4M6gv46JDptDYMoJvBL3dFBgiYiQY+6uCGdddjKi24R8j2Jm5XA1Lew7C/BC1N8QV66Ct3owmk6DWtIHgau2c6+9h24I+EBMig/dbVNh5LBz66pr4YaD7blgdPhYjz7tqOWqUySM35nAjBapsw5+K8VAs6bzYnfod3QdSR4JGHcFKmzF8ITIDMVr98Xus/IQmL6Tqy4jwZmxd9YF2mpSv/hzraNigbQFu+C4t0MHPJDPh47TQiuhcdofK/yyKTVGbedlUJM8SE0q1U9aC72xO7ko3yL6OmX5Y5mM/oUcsOqTFg/Olt2dpWWHhtkfbQocYwtlWa/B0J/QgnRA7UcRupQQdtQzzqB94xhBC2wUUfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(346002)(376002)(396003)(136003)(83380400001)(36756003)(2906002)(31686004)(2616005)(956004)(52116002)(4326008)(38100700002)(66556008)(5660300002)(26005)(38350700002)(186003)(66946007)(478600001)(316002)(31696002)(16576012)(54906003)(8676002)(16526019)(86362001)(8936002)(6486002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VE1NK2tPN0s4VEQwcU56cU1CRE5jZHJhdXBlQmRobENxWEQ5UVRZVnVvaFBq?=
 =?utf-8?B?QVlONjhudEtrci96SnhIcUsyaDFScGZUaC9SSWNpemZ6RVhtdDloNGpiTmcz?=
 =?utf-8?B?Zmo2VS9VQ25uTElObTZvZXI2Wjl3Q1RJSldIQ25OaERUSTJzNnJxdElzR0Q0?=
 =?utf-8?B?UWRIbi8xWDlRc2IzbW5XaW9qblI3RVVzVXNISU91SG1OTjhoNmx2cEFVWkhx?=
 =?utf-8?B?MVJJTlc1cEtzZEQyaUVhUFFrYWc2QW5lL0FXdXVYdHV1TTJENG9CdFNhMWRp?=
 =?utf-8?B?SWRoVW55TVJ1V1NlMUloVSsxWVRUS2Y1bW5NTWIyMzlBNHNBUGg0NmpiV2JB?=
 =?utf-8?B?SmFEdE9qOUVqRXhSaHhsNWMyczQvRHJEUFBHZEVWUzlKVjh2V3hKd05DUGFT?=
 =?utf-8?B?QWoybUNmdFdWdFVRMm1rTVdjZHVldnp5RG9nU25rY1JVcFAraWJacHRuVmNM?=
 =?utf-8?B?UWVGK3NWaWo2bWxKNW1Eb0JSSmFyelBQRkhCb3ZIUGw4SmxxT0IwVWVCMHZY?=
 =?utf-8?B?UWVjM0poSWdEbUxQb2NzR2tvMkl0WXlYMVRBNTZ6NHYwdk8xakF1bUhnZEp3?=
 =?utf-8?B?c3IwbzhCcmMrV3hCdU9WQWdaYWgxZnh4YmExNWttOWNOYU8xVGk3Z2tEUUNK?=
 =?utf-8?B?dkNMU0dYdzlISVNUUFRuc0UvdjNvSWNINEozZWhsNFZQTXk3VU8rSFlPc0Z5?=
 =?utf-8?B?MXFQQncwNGJ5VjQ3b0JFeVJocDZndERlWmdyYnorNE9lNmVISkwzR2tDMkt2?=
 =?utf-8?B?dVljdmYxeTN5dVFMQ3hlRy8ySWRyZVR0OEJJQ0M2WVhrSzRNUWxnZk9RN0pC?=
 =?utf-8?B?aWdsUEUxOHMxZFd6VEpPUS9ZZ2ZwTXVXUE9jbGVKRGphVStERDNwZUtJcERs?=
 =?utf-8?B?eis5R3JKVElGV1kvdXBDOHI0OGhtbTFnTUlYOGxZems1eVpqam1mbStuajJp?=
 =?utf-8?B?WUdPbHV4cDU2SDhyQVIzVHdRNkdWWW9USXZidUR6QW5mWE1vSnlYcm9lSld1?=
 =?utf-8?B?VEovSmJzakIyN3Q2aUt3djAxVXVSS2w4ZFR0LzNid1FkMTJqd0RsbEREcGFF?=
 =?utf-8?B?c2NMdkpMK2R4OFhIVHkrV1k3cndVb1JNRXJyY0d4OHRORGlGQ0pPak9HejND?=
 =?utf-8?B?cjFDeHFnS1lTaHlacXhyV3ZQbDd1ZnE3NVR1QVhLTWpiM1NlZlJCLzVGSW9G?=
 =?utf-8?B?c0hGdlpoZ253OGQrcXJHaStwUDNabUVveVN1WHhjQUlKc1ZUT0QwdTdJL0N0?=
 =?utf-8?B?OFh3anBkWTNrOHBJQkd6MTVsc3FTaW5FV0JqaUZBUUNvaG9qQjVHME5MSnEv?=
 =?utf-8?B?bmdPRzE3WUxxU3F5YVRVZ082NGNwazRPV1dGc09tMlc0MUFTak1mVUhWckxP?=
 =?utf-8?B?TnBReWs0Um1xcFJwWE8yVU54ZVcyL3oxSUh6NUFVdkZ4ZnlSeDJ0Qi84YUsw?=
 =?utf-8?B?UEU4YVAwY0o4UGVjSDdwYXYxaUVWQTB4ZUVhYVBPM2xiemNUeklpU2JGOE1V?=
 =?utf-8?B?dG9FUlRKbmV0SnJIemtGNzRWN0NVZkJnSGVkcitvMnR1Uktpd1lOelhYaGtt?=
 =?utf-8?B?WWQ4cXMvSWdRTFRDTWw5OVNvUG45WFBOK3hkeDZnZ0RncFpFL1NPcVZkR01m?=
 =?utf-8?B?bXlheHc2eGwvOFhvVlBFYkd3dlpZbDRDSm9xQ3c1VlIvcWFGTEtRczBGSWNS?=
 =?utf-8?B?WE5WNjQ4K1dLUExZMVA2VGQ4Lys0bFpOOTJiRFpCKzRLNUY2ZWczaVU0ZFN5?=
 =?utf-8?Q?/C4ZjxG/8iWqwt4B0WBUKs9ZoNPlZcntgliNNqa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 274cfaed-434f-49c3-0ceb-08d913a6bb70
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 11:28:28.0514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qy2S6tByogKNyzKRtvWslrJEwoYd8aOZelYHwyIKh4o5GJFMmdN9LL0IIM4UsB/p4kaVX7laGrJogcYHr7KVknlXoLlKoVyNOsCOLm5b0m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.6.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

10.05.2021 11:59, Emanuele Giuseppe Esposito wrote:
> Progressmeter is protected by the AioContext mutex, which
> is taken by the block jobs and their caller (like blockdev).
> 
> We would like to remove the dependency of block layer code on the
> AioContext mutex, since most drivers and the core I/O code are already
> not relying on it.
> 
> The simplest thing to do is to add a mutex to be able to provide
> an accurate snapshot of the progress values to the caller.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   blockjob.c                    | 33 +++++++++++++++++++++++++--------

[..]

> --- a/include/qemu/progress_meter.h
> +++ b/include/qemu/progress_meter.h
> @@ -27,6 +27,8 @@
>   #ifndef QEMU_PROGRESS_METER_H
>   #define QEMU_PROGRESS_METER_H
>   
> +#include "qemu/lockable.h"
> +
>   typedef struct ProgressMeter {
>       /**
>        * Current progress. The unit is arbitrary as long as the ratio between
> @@ -37,21 +39,50 @@ typedef struct ProgressMeter {
>   
>       /** Estimated current value at the completion of the process */
>       uint64_t total;
> +
> +    QemuMutex lock;
>   } ProgressMeter;
>   
> +static inline void progress_init(ProgressMeter *pm)
> +{
> +    qemu_mutex_init(&pm->lock);
> +}
> +
> +static inline void progress_destroy(ProgressMeter *pm)
> +{
> +    qemu_mutex_destroy(&pm->lock);
> +}


Could we instead add a c file and add the structure private? Then we'll have progress_new() and progress_free() APIs instead.

This way, it would be a lot simpler to control that nobady use structure fields directly.



> +
> +static inline void progress_get_snapshot(ProgressMeter *pm,
> +                                         uint64_t *current, uint64_t *total)
> +{
> +    QEMU_LOCK_GUARD(&pm->lock);
> +
> +    if (current) {
> +        *current = pm->current;
> +    }
> +
> +    if (total) {
> +        *total = pm->total;
> +    }
> +}

We don't have caller that pass only one pointer. So we can just do

*current = pm->current;
*total = pm->total;

implicitly requiring both pointers to be non NULL.



-- 
Best regards,
Vladimir

