Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F6337B03
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:38:23 +0100 (CET)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPGQ-0006Sp-2R
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKP7A-00078r-Ud; Thu, 11 Mar 2021 12:28:50 -0500
Received: from mail-vi1eur05on2093.outbound.protection.outlook.com
 ([40.107.21.93]:22113 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKP76-0003LF-MT; Thu, 11 Mar 2021 12:28:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PotsVAbO/m23A+bXYD+CwEANhqsxRBQibqDVQTdk61jYTt8fG2dn11yEavlw0jYljjX8X1dbiC6E19H4k5B/XEIW+5eTr98De1ffKq2fEjm8hKnRryaQpzcg5zWrSRvZuJZUg9R588QfvIM0OYPkFyOgkU9K8JjW842mmOJ1QwYBz8aNklgqlPB9akBhkCXAkFIBOcUFYUYvCi7rXxu0SL+29epyOw41yrHef+rkSPTEHA8otPWdYkqPOC7NDebiDRbmFR6PTxCLFFrQ41Ire1LSVekK54lCw8K19OM/ndxhO67GAki/h7Ye6VXCdirsVphA1AdP55VaOAPsGrd8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppkm7Y+VWiseTq+IOQnjXFOCfwfgKAUxBbprMPRxs4M=;
 b=Zt7XqYQ/Ypjbs/XTbQS2sjSGsz9PFlEXr87/7GyZG3ejktuelXC/c8dkAIRU65uSo3zn1CuQG9B0B2qpYCcqXYrt5y+cEB3wramqKkrxgbI1HxvoRTvvqqq+A9i54C5YkRVRZKzRMwPBKLkjAHcnEBjTFEZRjSm7V3HDcI+vni876nTu1hM8u9Iw2/Uu+bCDN/qcZFf1k8+aPvShFO0PEDrU+xd07UvxrvyPwpOefsZnT6Z+IYkumwxpMMx7hBchBOhXGx+SqAJa6DD1Aa8LR21TUvnvYlZM4z39z/AWkBzcgB+d+vH8pOtGaX28PAqPDjLDWL385dpXZbnRPRqnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppkm7Y+VWiseTq+IOQnjXFOCfwfgKAUxBbprMPRxs4M=;
 b=JJ0pfwAz7rccpmI3ER8E3yGHetjIfSzE3LP/CcFYFJinNht3bhhAVYikzgq6CQbZ0aes94v9dtEUzfRFAxxwpQU/bq1y6rKvChCB01ukg/gmJ4EkTOZUtbcHrhd/LWibDNJJq/9/LsENgUuZ1SkN8gqkvF2+E61B3qgxJjT3pGI=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4950.eurprd08.prod.outlook.com (2603:10a6:20b:ea::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 17:28:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 17:28:41 +0000
Subject: Re: [PATCH RFC 0/3] block: drop inherits_from
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, jsnow@redhat.com,
 mreitz@redhat.com, den@openvz.org
References: <20210311151505.206534-1-vsementsov@virtuozzo.com>
 <20210311170946.GG9008@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9b4a9032-0985-41ac-a86e-091ac53167da@virtuozzo.com>
Date: Thu, 11 Mar 2021 20:28:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210311170946.GG9008@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR06CA0093.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR06CA0093.eurprd06.prod.outlook.com (2603:10a6:208:fa::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 17:28:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f569c160-6419-4347-65c9-08d8e4b31ce0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4950AAA0CCE3C41B5D18FEA1C1909@AM6PR08MB4950.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZW2Nt0HhJBBV5WGT13+EpMOl1By9NQrHj4OnW0FizarpholbbW2qtRGdH3xXNDXzTvvl4AF0sT8z4PeyynP7JpqqUSo0VBaOPOjW9G1X8LdvwJBT269hA1zs2V1VE05BOWCQei+EdbinwU6vpZTjee5ecfJDa2cptp5oEOCg/Oo1rVQqfff9idndz/zMAdVB/m92cNOfuIDLikwYYnQhh80jxN4v9ZdhIsTv1wTMsTg1Ogq9gPfv7c0a22lH7Hs/UhhKYaXowzRbpSBWDFb4TTYi4CKpyDCLAnc6DpEjstK2GUJuRCSZhENhXCAamW2LD6w0odKKRvtdPxmdlQ5SWyuIEEcw1DnvkQjLuCi/REkmrtK18S+6XAy8tbuSKWrjLTAD4xSJAgs2iDjQVVBOCObEz6Uqg4BQ7Fzj8uRZO3WkSQ5J1IB1/7sWNbc5pw/mu9H116Ub7ENTWBFPv8UG0QZssQ8Mf45zC5yIgiSw1BuGAP3uTtL/2GT0BGVOg/VNnyKMsPFiqodlnOtPElPstqyl09sszRZ2HDWpjRWQ/oRLn8McAGwQWFEdfyPic95iG87IGxFk3YMbs0uHwk951GMWEtzlOFLCwN1GtwYeE2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(366004)(396003)(136003)(26005)(83380400001)(107886003)(36756003)(31686004)(6486002)(16526019)(86362001)(2616005)(52116002)(956004)(2906002)(6916009)(66556008)(5660300002)(8676002)(478600001)(16576012)(66476007)(186003)(4326008)(316002)(8936002)(66946007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWlWanNPK1ZQODRNOG04MXlRcU0rZHdYRTBpdTRScmk5dW5YbDRjUW9wQlRK?=
 =?utf-8?B?bHhSdkhxQ0l0aDVlZUdxQVk3aDg2RmZOWDROQlNCdloyM081Nzk0QWFnNGV4?=
 =?utf-8?B?UlBvVWQvYncxRjBVKzZIbjVXc1daOFdPKzNHRW01RGxMbnBGb3hyc3BMUEo3?=
 =?utf-8?B?YVNya3Q4NDdUR3JnUElCOUw1bldjNmdwc3JxWkRkaUltTG1TRDVLN2s5d3N1?=
 =?utf-8?B?OVRUczI1RUpwOFRFVm8rK0RDNzdLK0JJZlhqTE5yTG1xOWhmN0UwM29KYitj?=
 =?utf-8?B?VTZJNE0vTTdCT25jdEg0YVJHYThpdVJObmk1TGFadERQNTFHZFAyWWMra0k2?=
 =?utf-8?B?cGJQZktaYzRiTWJXMUZaK2EvbTR2dHpHQjlmVGxTWndYNTA5ZlNpNXIwd0R1?=
 =?utf-8?B?Q0JvZUxVUlY2cjFaNEtENytQV3RLdC9teFZNV0tEY1pKbFdGYnlkRDMySmxK?=
 =?utf-8?B?UTEyWXhvemNMcWZUR1ZUWDcrOVljZm90M2VyVWVZdmNlSXdFWTh0N0huaksx?=
 =?utf-8?B?K2QveWJtMXFyc201M1ZSYTJ5d3RaamZWc1JNUlZzWGlrdkFlWlhXZVhOYkE5?=
 =?utf-8?B?TzZKMEJ0cXBTT2VZN1ZWSEc0NE5aKy9lcmlvS2dibDMzd3ZEZmJUNVdRYXZq?=
 =?utf-8?B?YjB0c3lMWkNWYlZQd3IwMzlNL0JtSUFkRjJTUmZ5aXMwQTJJanhmWVNGYzRB?=
 =?utf-8?B?d2t3NXJwSUdBTEZJKzVNekJTNHRCYW5SbnhKdUZhN281NW9LdjB2eituMXFL?=
 =?utf-8?B?OW54NWRkTUpua3NkMjQ0NGlRMkhyelBqNjlUSG9heE9qaSt5MnVhS05SU2NF?=
 =?utf-8?B?c3NJdWc5YzVGWjFvMEZOU2tmdDllMjJ1REJ1QzlFZmI4MTRVbk8xS2lzaFFV?=
 =?utf-8?B?RENCTzc2MVF3OW5NM3hLeHNVdEUzWUtxa3kxQ1NBaTJIcHBVU1JVUGkyK1Zl?=
 =?utf-8?B?NnhjK3czZThTZjlmRFQxZUxuZUlpaDhiazVxVGVhOGJQU0dlNU94Z1JCUjZG?=
 =?utf-8?B?eGQ0aU9JWEEyZmNOSURKNHVEMXBRQlI5YWhIM0U3MlhTakZZK3J5M2dzWGJG?=
 =?utf-8?B?NTFTbWNGTFJ4VVVVaFhidlZVSHdkR2xJQkxyOVZITjNKNVMwMjB1VW1BRjZ2?=
 =?utf-8?B?Nms5dHFVeGJVRzhwWkxJNnZRZ1BYSGhiSU9ZUmkyVzlVUitwZFJpMnJxNkRw?=
 =?utf-8?B?dWFrc1JJQXJxUzNBcExkUmljOG1NRDd1aTQzNmQ4VGZQRml5dW5tNi9CLzZs?=
 =?utf-8?B?OWZoaG8rK3FUWWlpQ0FCelZBY2UwVUJvVWlxaHJKa2w3WG9RN010MkwvU09H?=
 =?utf-8?B?cmhnNG9hYXRDWU05Yy9leW56ZDF3cXc2VllYeDVEVC9CZlM4K0szYUxxSzE4?=
 =?utf-8?B?Z0Ryc3dKcE16QXpmaGtCWlhXUnAvZ3NDTmx0WlBISWQzNE1qZlg3SFlDSmNl?=
 =?utf-8?B?R3VHVytTOEVub1VmQ1BJUFUxVmpkTFlwNG83TEVLbFpOemVrc29KMU4zQTRo?=
 =?utf-8?B?SkxUSC91WDNsL2htK1pyb3padnNoaW1aSzFScm8rejdoRVJxNGNkSzZTUWxh?=
 =?utf-8?B?bEFqVmxxSTh0WUZJSjdHSUloQldlNkhtN0hTcERzandFemtKREUyQXJjbGg5?=
 =?utf-8?B?cTZCRmhjNVJhNFVWTlVuZUxLMkVCMk92SWIwcCtUZGllSVFlZkdNeHkvRENj?=
 =?utf-8?B?K0lVMGM5eTZBZWN6SHY1cjVoU0Rxbi91K29ENUJES0xXY0hoYnhFdmptVVA0?=
 =?utf-8?Q?6nuRXFOVJp5TMF21H8Fx4CymC6cpcuRhvpEo6rG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f569c160-6419-4347-65c9-08d8e4b31ce0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 17:28:40.9096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BK8QO5uR1mUqJBFfjM22tbpb/vS7C6lm0pYLkfGx5TgHY9H6icVXZeO4RZpHqh6sAgRsf+dO27cGfWsQcm3yPrBZsvdhJzz8OaEP9eTMcmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4950
Received-SPF: pass client-ip=40.107.21.93;
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

11.03.2021 20:09, Kevin Wolf wrote:
> Am 11.03.2021 um 16:15 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi all!
>>
>> I now work on v3 for "block: update graph permissions update", and I'm
>> at "[PATCH v2 28/36] block: add bdrv_set_backing_noperm() transaction
>> action".
>>
>> So, the problem is we should handle inherits_from carefully, and most
>> probably it should be updated in bdrv_replace_child_noperm().. And
>> then, bdrv_replace_child_noperm will become a transaction action,
>> which should store old inherits_from to the transaction state for
>> possible rollback.. Or something like this, I didn't try yet. I just
>> thought, may be we can just drop inherits_from?
>>
>> I decided to learn the thing a bit, and found that the only usage of
>> inherits_from is to limit reopen process. When adding bs to
>> reopen_queue we do add its children recursively, but only those which
>> inherits from the bs.
>>
>> That works so starting from
>>
>> commit 67251a311371c4d22e803f151f47fe817175b6c3
>> Author: Kevin Wolf <kwolf@redhat.com>
>> Date:   Thu Apr 9 18:54:04 2015 +0200
>>
>>      block: Fix reopen flag inheritance
>>
>>
>> The commit made two things:
>>
>> 1. reopen recursively all* children, not only .file. That's OK.
>>
>> 2. * : not all, but only that inherits_from bs.
>>
>> [2] Means that we don't reopen some implicitely created children..
>> And, I want to ask, why?
> 
> The reason is the difference between
> 
>      -drive if=none,file=test.qcow2
> 
> and something like
> 
>      -blockdev file,filename=backing.img,node-name=backing
>      -blockdev file,filename=test.qcow2,node-name=file
>      -blockdev qcow2,file=file,backing=backing
> 
> The former means that bs->file and bs->backing inherit options from the
> qcow2 layer. If you reopen the qcow2 layer to set cache.direct=on, both
> children inherit the same update and both the file itself and the
> backing file will use O_DIRECT - this is the same as would happen if you
> had set cache.direct=on in the -drive option from the start.
> 
> In the -blockdev case, the nodes were defined explicitly without
> inheriting from the qcow2 layer. Setting cache.direct=on on the qcow2
> layer (which is actually created last) doesn't influence the two file
> layers. So a reopen of the qcow2 layer shouldn't change the two file
> nodes either: If they didn't inherit the option during bdrv_open(), they
> certainly shouldn't inherit it during bdrv_reopen() either.

Hmm. Understand. Than I was wrong. So modern blockdev behaviour is NOT inherit options. That makes sense.

> 
>> For me it seems that if we have reopen process.. And bs involved. And
>> it has a child.. And child role defines how that child should inherit
>> options.. Why not to just inherit them?
> 
> The -blockdev behaviour makes things a lot more predictable for a
> management tool for which we know that it can handle things on the node
> level.
> 
> So what we really want is not inheriting at all. But compatibility with
> -drive doesn't let us. (And actually -blockdev with inline declaration
> of children behaves the same as -drive, which may have been a mistake.)
> 

So, inherits_from will disappear together with -drive some good future day. OK, thanks for explanation


-- 
Best regards,
Vladimir

