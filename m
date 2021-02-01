Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A804F30A7E6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:46:04 +0100 (CET)
Received: from localhost ([::1]:56912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Yah-0006Nz-K4
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6YYs-0005Xn-4H; Mon, 01 Feb 2021 07:44:10 -0500
Received: from mail-eopbgr00112.outbound.protection.outlook.com
 ([40.107.0.112]:4360 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6YYp-0001HE-2x; Mon, 01 Feb 2021 07:44:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3rh7o4GFpFEO7GszTHLd+sctukUsNRosdp7dAcrKFrPJq99nB45QDZjSbvdbh21Zq0S6d48KyRLmpMM8h54fLlByaYpBpXXEqDEL3fOHUo5cTOHUnAYGwyK9ToByL6Iy1n7STcm7t5btk9NZO5FmM5GXXBKd6JQblzSTMI0UE3mgkAB0l8ldMyUZseK3adK1N10tXUkYVEKkLm/1pgOyMNm7Re4aJ92GBWzeBk0EHX8c+6VPr2kM/7Cr9dQgsrx0zlgOqcAoifMh7R8PfSasr2Qq9IOqESrVAOrBMlHMmAwm3VYigIMUZbqL2wdaAEvwC7NOq5skMFoeAuyXCBWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5T7mimp9gyriy9+PcxUwbFA+rvJa50HmdliIhlPdeY=;
 b=FgwL6nmdQOSXghL56NbcG+w1lxQm2s/2o8wcFZ8TYTeb0G0MaHyU5vuXN/Q0eh3HUjIelzCqgK4YhU2OxmMmAsKSQYEfsGDRFWLs5TO52qmOMACwbzIIrA7CJhxM//8d17RYx/ACL4cEzHDFmjjdlcJm+5jYdnnH7/338y7vu45/+Uzkje89bi6vgQx+ePFOf5O+UakROY9eN8mSw254e4MhTit96ZIwlpRKlwxUFrDtCjPfKmz4PdCK6vYx6qmMsl1FHeoNcuCKUMoKPZ2AmiKRobq4pUrdpjyKQpy440tqVW96Ucf5cziGCCWRH0IEnB/s42UU4KZpibwIkN6zBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5T7mimp9gyriy9+PcxUwbFA+rvJa50HmdliIhlPdeY=;
 b=Odyg99rhZvlkQ1EtjNvEZ6Wqb+i3YMpley70dTBW4uPfGmi3yzcT25+sNa8DBuXybZdB+sxWCvVqw44b7KrqIUtqkwhidp3kH2eawOEIzBP+fegWbB0O8fqGgusIV9zqr/bFIhy8Ot/aoQ4zKiBdTOliJAFqvIGZRCuh37haHKE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Mon, 1 Feb
 2021 12:44:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 12:44:02 +0000
Subject: Re: [PATCH v4] blockjob: Fix crash with IOthread when block commit
 after snapshot
To: Peng Liang <liangpeng10@huawei.com>, =?UTF-8?B?5LuH5aSn546J?=
 <qiudayu@huayun.com>, "08005325@163.com" <08005325@163.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "mreitz@redhat.com"
 <mreitz@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>
References: <20210126032545.13349-1-08005325@163.com>
 <20210128013053.23266-1-08005325@163.com>
 <ce0a7f2b-ccf1-f898-4bf5-5b256e9c2f3b@virtuozzo.com>
 <BJXPR01MB0776C4B34AEED1F927EBA870CFB69@BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn>
 <3058f4e4-fdec-6ffa-498c-66f609158451@huawei.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8041055c-b542-ad14-c8be-6266679d5142@virtuozzo.com>
Date: Mon, 1 Feb 2021 15:44:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <3058f4e4-fdec-6ffa-498c-66f609158451@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM0PR06CA0129.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.160) by
 AM0PR06CA0129.eurprd06.prod.outlook.com (2603:10a6:208:ab::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 12:44:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7296b8d-63f4-46b9-6464-08d8c6af0ddf
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-Microsoft-Antispam-PRVS: <AS8PR08MB58779C3F5D06BE4A37BFB8A0C1B69@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5zzzuWBTP/GAUSbNIQSt1hR8AT3k0oJP3BaJ+4eTD0ziqB5pBOcdYRtoJivH9Ijvhm+/GsUcSxi7oC8dyxCmL+8ujga7YEhABEJDn+hHoUufi5NDXIWv2e+/TzN/PpGtz/OtDVb6XAUNoN2VoqMJqp/hdH8WQjKpG3NIAh46/aPlJdngjcbunxIMiDD4LLjScADyVCi2c15PTHlOiWBYcP7RUnHLGKOkj83QgyDdhky62CpRJTCB4qJqDU3jNK76D+9XjHIQvLHWFOgqgIRSY9im+Zlww3WiBSAIvYWer0wZqEkyskC7JM87dNi+iZ3sR3V668mTqu6fXIh6ZFVLY8B6BeN1uHszcveJ2cgxhnibTF9K8FuzbJeNJEP8L21nvz13KSAnAfI1MVQ8h1fp1ZZ+a+NceF7flWf9xceDQc8J/mX88E7TrPv4TsJelBfagLTS2Cd8Yw8V6dEv9QPAaUpxIoqy5vCzB4Ik9waELICX2SGbAwtMMoMeK5J+TmLL6MDO1igDOBmFbSIxlxkVo763EK9L4wMNsaci7CYccy1B/Jv1EOt2O9R2ZheQfAvF7WUZONnJvHOz4cTvglomkuAE5qq/ZyF8aY5zAGpPdNbRMy0O2mjF3QI2XiMOF/feAH83pZP44nacxTYBwpE0z/M2vIMyNbFf0knpLiLXDVlaD5Jjd6PTGIewFnQ9zaO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(52116002)(110136005)(31696002)(8676002)(8936002)(2906002)(86362001)(4326008)(66556008)(66476007)(5660300002)(498600001)(36756003)(66946007)(16576012)(966005)(186003)(26005)(16526019)(31686004)(6486002)(2616005)(956004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUNzY3Z1V1VMWVZISWtuWCtwYkErOS9WZ25MSEx5bEJVK0hXQVdUenNEbHpJ?=
 =?utf-8?B?cyt5bzFZZ1QvblMrY1d0bDFWUW9Lc3ZEQms3bi82RFlMamttN1ZaNGVML3Jk?=
 =?utf-8?B?UkpZOTVzNmRoQVdkdXhDdGlIaitKbnJKblZlbWZmc3pCVlJSR3E4WThoYXJz?=
 =?utf-8?B?Nk9WajBjK1FjZHB2ZWhLcHp6eGdGSzV4UmI4V3AvWHM0MHlBTGdtdks0VXYz?=
 =?utf-8?B?bXdpL3FrWmx0ZWk4dDJ1TWNoRENFRmZ3SXlUdFBYUUVuZ2hRSWJDc2tPbGZO?=
 =?utf-8?B?MlFObm5JUXB6TEdrbXpOYUZzY09DVHhQOG5XajAyaU9ZVFhCZy9tTGlBSUNs?=
 =?utf-8?B?VUx1MHMvbnFGcWtrMFFiaWkvUTFUOXlrVENXTnA0UDZZU3MvSndkaHpKakRX?=
 =?utf-8?B?QUVZdjYvR2VPcHpKSkQvMHU3U3NoM2JmcjJzUmo3aFZ0R3BaUnllb2N6MlVy?=
 =?utf-8?B?YXQwNERNd2dHV2FRVmg2KzNXRHpKWnZCdmxJUG0yR3NPVWUvVFVZQWg5RVN4?=
 =?utf-8?B?Z1pxZ1k5ZCtaNHp6VGpyUXIwa3dKRGlTUEdhL2xzbTFIbzIwdUxUZFF3Z3BY?=
 =?utf-8?B?RjhoLzVWTG05SVhvckJ0RWZMc2NmTVV1ZkVkTVM0K254M1pvZlVZM1E0UlNa?=
 =?utf-8?B?UTNqN0tWdHBLVVNCMkU4K3A4aXpSNWVxWWV1VnQ0ZSt5OERYM0xzNkVMRUVZ?=
 =?utf-8?B?MFlPelkwR2YxeWQwNVpVNUlhZjlWQ0VMckM3dFpjbnYwazRFUkR0c1VRZkEy?=
 =?utf-8?B?VGtaSHhuQi83dWJUWUFIdU9uSWFmSWpPZ1dkdGJWRnh1enU5SHRqUngwYjZ4?=
 =?utf-8?B?VXdFRzJsbEN1SVpTYWFJcTJnbjdMSmcyN2ZTRm9iODlOMmFlSHRpSkZxQ1NE?=
 =?utf-8?B?RXpyNWVjMUVNQkQ3Kzd2d05hZHVOakxyckVRWHBBUzZTMnU0VlBRQ210TUNK?=
 =?utf-8?B?eDZkOFRHNE51OFdCSTFaY3NNRGRnejVmaHNRMXBWSU5kc09UY3lXbU5uWjFT?=
 =?utf-8?B?V21nSkZiVkRsQ3RpZU5jZk8ydFRWNURuUzFxZ0R5Y1p1czZXZ2J4UmpUN1pZ?=
 =?utf-8?B?K3YrM1p4NktKMkIreHVaVGJ0SHRuT1dSalJNcW5UQzVLTiswL2JmOW5XUHhn?=
 =?utf-8?B?bTVUQllCWUdFaEtJZnc5bDcvNThNdzNqbTVObnFWR3U2Z0dydjRsOXg3b0xk?=
 =?utf-8?B?dFBMRThzMS9hcHVIQ0RicCtPd1JqbFZOQ2I5RGNUM2F3Rk10ZnlGYzBKOTh6?=
 =?utf-8?B?b0d0ektPcmxIb2NGenIvN3AzSlBzUnd4bWJsNWJVbTBBOHRVcHRvNERhb2ta?=
 =?utf-8?B?cnEzdnB6dU5vbnlGalZydC9LLy9ibnYvcUxxTURtcXdzS3RRTGNJL1VTK2w3?=
 =?utf-8?B?Zncxa3FTRjBuMkdScWJLRlREZHg0K0laTkFIeEI2SENMNldGUU1TMkRCQlhp?=
 =?utf-8?Q?CpoIIihA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7296b8d-63f4-46b9-6464-08d8c6af0ddf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 12:44:02.8768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+cpiE9aiSi0e+2sh9hcFDv208rn3aVqZINysrvFZl23udT6IwLbqQXzVwBq8KMytnnW34vJDZW9qty4b121qkE6P0+Bpp3qqI4kIYMcPRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.0.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

01.02.2021 15:07, Peng Liang wrote:
> Hi,
> 
> I encountered the problem months ago too.  Could we move the creation of
> the block job (block_job_create) before appending the new bs to
> mirror_top_bs (bdrv_append) as I wrote in [*]?  I found that after
> bdrv_append, qemu will use mirror_top_bs to do write.  And when writing,
> qemu will use bs->opaque, which maybe NULL.
> 
> [*]
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20200826131910.1879079-1-liangpeng10@huawei.com/
> 

In this patch you create job over original bs, when jobs are normally created over job-filter bs. I don't know is it wrong, but it at least requires some research, and probably the code that removes the filter should be adjusted somehow. Also, you make bs->opaque be non-zero. But still, job is not fully initialized, and some another problem may occur. So, do we create job prior to filter insertion or after it, parallel io requests to bs should not interrupt mirror_start_job(). So I think Michael's patch is closer to real problem to fix.


-- 
Best regards,
Vladimir

