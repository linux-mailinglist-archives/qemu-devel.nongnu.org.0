Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE73934E5CF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:53:07 +0200 (CEST)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBze-00048m-Nd
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRByP-0003S1-91; Tue, 30 Mar 2021 06:51:49 -0400
Received: from mail-vi1eur05on2112.outbound.protection.outlook.com
 ([40.107.21.112]:26817 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRByM-0007Xm-1d; Tue, 30 Mar 2021 06:51:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mS4TkniK0sugyKk+N+kmY8xQxdKTihsak9VLVd/IheQ/l/cc3EEEhiz6qeqO9SBPDSb4y9d+ewuQDSugb95I4jZV2bYRKRgUgaSJsTJoP9sipPq9XsdBIrpsi1LrZJaUIqbDSnUnZ4RvdFJbUYI9TIbFZT65PXH9m8BgFVBiST3cC+2DM7xiWoTGWHyzO0mcOLmbODzxh/RxFEhh2or15fCb01cfTsV+FHrwc+ESvovmVJDCFgTOYAX9fks/eQAutUm4DeK4d/9wJWU6CcX0JQAGQNgl6aj2pZVbz4cD6oYswPe7haIbcUphoivdC4gwuv9E55dbtWU30SfuR8DI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6XFELP1QubpicQ8xGptFq3PNkBMjcvzfoQxLS7lU48=;
 b=aHy3ZEMQJ1ArRBn7tO7w7g+Cl+5Y2vSsw/JOUtJtruPqdOIVdu932R/OxIAfpbFumbvzcDFbCbbKpG9tOqvVKeF5iTDoQTw+1yuhdWfxfDqXAqc7SqeyA7KmwvBcZedT/cD/N7GjqeWNTwSuOfqw50IQPWE7vsCjXCqqmu6FbsMnPc3Fw6FUaAb4N/Ftp6wJQZMxVYK5ppQTT/mUhSKjFBwlTn1009RAWvvQEDi16pMzhSWCPzqQhY88CYW/Z4ySojxSyBttWFCfqj/EKFQl/+EmZNPavSiqKchor+uJLkNp0sKe4abDb4I8sTxi9XtQMxUYMn6H4uYA2Y7E4h9lLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6XFELP1QubpicQ8xGptFq3PNkBMjcvzfoQxLS7lU48=;
 b=hpNjPHychDsiBUSB9YGhvaMBtGVXQkq6PnkP7X6bVhY7LeWYWsxz0T7TjFdSjhakkQRFbOe4nwnnN+c+ZyrxU2wL0LCyuGUX2YkgXqBO37NLi3S+p5vqF7RKTGZQFArbSCcYMZdl1kd7RGxyvXFzDRg7hlE2dJtpAnN6xf6Pbio=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 10:51:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 10:51:42 +0000
Subject: Re: [PATCH v4 for-6.0? 0/3] qcow2: fix parallel rewrite and discard
 (rw-lock)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
 <f16e8ea3-5af7-abc2-bf1c-7fd997ecf651@virtuozzo.com>
 <c3c2ea3a-9475-69f2-b9d7-e88001d822c0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <166496e1-f855-5813-2fe8-88035fb85a26@virtuozzo.com>
Date: Tue, 30 Mar 2021 13:51:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <c3c2ea3a-9475-69f2-b9d7-e88001d822c0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM0PR07CA0032.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::45) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM0PR07CA0032.eurprd07.prod.outlook.com (2603:10a6:208:ac::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.17 via Frontend Transport; Tue, 30 Mar 2021 10:51:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e81c4987-4103-4192-b1e1-08d8f369cd7a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915FF9F55807895B2657C3AC17D9@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLThcPjxm89KJvxBCjryK9ImOIHfVhyKwGlefpRpwa6rdvIE5zxqsnGR3tTGvZh6N+idERv11GFjjAgXK0jCNGbVk1rryo+3G1ojETtyZ1zFy/w2SbA0hLb3MdnVJRaNyexWzfeHeauZvcpyyomPRGVyeJZwuvdALAxkkvyhkK63D0QjJm+wTIPCGv+uk6scBxqzr2y79gV/oNtRv0RdpF8X5BFnvnrrL9XbaDqkKMEIk92VVuqQqKVH/E7xb1TvqpVP6dlHkcFH7qTzbDWnUjJA9qYx4DLw+T7zvr9F03zEY+ORWocoqZhk/YUbg2qzcXI4dZiIDn7hZM3tzlgu1khLIY0Ug3VXK8wnnUE5289zWrP8RwB0KL+PXKQIoptnaADjNJ0kBeE5mTEn1/qutMop0I2Hk0HS175uNapzK+EPG46w53UolfrOiAiaoEOWpe4oipQfYJ0IA/Js2d4+R9dgncJjRs7B4SsS/XKMPvjJH3ec+rjzmHDa0N4d5UXaun7Wu4iXwvUCwtvdfcPvd5EqjJYitNcBQ9kZXzb6w2or69w5Dnwk4RI9F3qORipnEpGnJ2TnHJJ2CzWLJpWPKiIA1kVi+2EWCYnqtW6ec9Nh4QhSvb/m85t6w3td6UgvgmBYDwe7SQ+VThJr+9uddAMPQ4veYPRuZBeitdarIa5COu9YOCO3IoSyNVdToJihsdy0xOt7fsM7tdgaYbUEq3QCzqIzchUa6Fvr4iCRslg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39840400004)(136003)(366004)(16526019)(4326008)(2616005)(16576012)(52116002)(8936002)(6486002)(8676002)(5660300002)(86362001)(2906002)(36756003)(478600001)(83380400001)(31696002)(66946007)(31686004)(66556008)(107886003)(38100700001)(53546011)(66476007)(186003)(26005)(956004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?clJlbFg3eXZpT2V2by9JdnNIWmxGTjJZM2xlTG9BdFJEaFJPMkFiY0U5UDNY?=
 =?utf-8?B?a0ZWY1ZTUmdLTmdpalZ5cjViTy9vTWN3S0lMU01iMlF6dnFCNElHNkRGUmk0?=
 =?utf-8?B?YkVKMXpCbWprT0tHZWFBS0x6UVlzU0dWWmw1allUMzdVQVFoaTBNL2hBekR1?=
 =?utf-8?B?bEM4N3h0Q2dBWU41Q1hNVzUvSkpsczZZRFozSzk2U0xLdklMZ1dPQnFwQXVX?=
 =?utf-8?B?Yk4yeGJJZnNlTGh6UDZMM1plQlE5d3d0dzBqSHBYOUZkQ2NENVZTdldGOGFG?=
 =?utf-8?B?aEEvOGZnOXZIYzdWSEo5ZXNoZGJrVjEvSDJSNlZ5RndwWGtUMXdtbVVuVFNl?=
 =?utf-8?B?MFJQRzFyUjhjK0VwdlM4VmhrK1NTSUIrU01WSG9YbUFsNmFPaU4rMWxIZVFw?=
 =?utf-8?B?aVg4azE4MmRSOEpNVzB3UVMydWxqV0p3YXIzR2RzV1ptUGswYmx6Tk5wOVhp?=
 =?utf-8?B?VUhwWWk3cFFwaXVlaVBRTGhOVGE4ME90L21qbHBVNnZTYUQraktlSHhSR2h2?=
 =?utf-8?B?Ni9JQkVRbGRyVnE3SitaeXgvbWxlVXZvRXJsdkt1TzU1dTNpUEFXUm5MazRm?=
 =?utf-8?B?eStxRkxIVkgvVXdmYnlSUkZ1Zkg0TERNUmUwYzJZV0tBVjZCSUJVTGRiZjFw?=
 =?utf-8?B?VmhKRXN5Z2ZXRVRxQ0dRWnFaaG4vbjlqVitrTzc2dzYzNW1aSTJIVWxEMUR4?=
 =?utf-8?B?QVhLa3MrZVRUNFJJRlhMbGlLV09RWVNGUkkvZFVQeTVxeGNDbjJSMldnVmpm?=
 =?utf-8?B?VStEbEdmNHFvd1J4UEV3TEFyNFpWeVlIemRQdUN1R0tycmJiVFVuTko5Z2c0?=
 =?utf-8?B?cEI1RkcrYkdQQm5sSkRkL1d3V0lHdW1hQk5udmdUNG45b2d1SlRBc1pNdkY2?=
 =?utf-8?B?cGhvZ2x2cUcyVGd5azArTE9hYlY2VDVidUM4LzFTcThHVkFvYVBxQU0vR2Nj?=
 =?utf-8?B?OVo2cEp1eTVOQTZ1TTk0MkVOaDlEeWpOcU10emRXUlBpTllpbXI4elNraDR4?=
 =?utf-8?B?Ym9OT0FQa0lYTVRQbjZPdTdkbmtXWCtLL1QvYjdtajRpNFlEbjF5Umc5RWNu?=
 =?utf-8?B?UWZWbE9hbjQvQ1hPWHNZWC92c0hqemdKMi9pOWd4ME9WNXYrY3EvbHUwamJF?=
 =?utf-8?B?R3M3bnFTdVVibzF4OEZrYXVTWFRJZkJQVFVMM2RIQmdPNVZJT09iQ2prT3ll?=
 =?utf-8?B?U09ja056ZDJRMzR4NERZYy9aY0tjMEx5ZDBMV1dZcDdNOFBNT0hmVnJ6dmZT?=
 =?utf-8?B?OXFvU2VEemo2ZThyN3VxeTBLVUFFN0lBbkRYNzNtNjBaOW93UjVDaVhFeXhl?=
 =?utf-8?B?V1h0cWc1Vyttd2JPQ2xPMmZkRDBjd1JzWGp0U2lrT1g5WTRSM1dNUHFwQzU0?=
 =?utf-8?B?UmU5dWVlY2VaWjJVRXQ5ZlFLdnczQ1kzWDhLQ25GUHlJQXJjQXVMVU5ibW9o?=
 =?utf-8?B?S2xYek5HeGErTWdQZERlVFVGWm80UENMZkFyTmM0blNRSDVkc0xIaVpZdHNH?=
 =?utf-8?B?cW90SGRSQ1JTM0JRanZLbStjVHlzbHlvZkpMeXlJNFRJTkM1MEF2VmF6aC8y?=
 =?utf-8?B?Z3UyS2QzZUtMR2JxMTMxZkpsMmVSeStQQkIrWTViQTRvakdHSXpReVdyaUFy?=
 =?utf-8?B?NUdwcFFvMFVCbitNbWhGdmp2b00xMi9Ha01XSERVbHFFM2RERUdXZ0tJQzdW?=
 =?utf-8?B?L0dNODhTRFBpdHlWdXBSenN3djhPODRLUEt1RWREb3hBMU9lQ0pxeXpmMmNP?=
 =?utf-8?Q?JHuwDjSY5aiLaQHB3LWKHnNviqQ4zIui5I+/5vo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81c4987-4103-4192-b1e1-08d8f369cd7a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 10:51:41.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mkLk4tDAxkRWKnEauzS4l3TsCoLDCmvKlkoE1ITm3y5UTzNzxkuT5stluUiRw/ws0OluMR2sMIL9CxFO5HmsCufSowJuFlXtjVM/C1fD/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.21.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

30.03.2021 12:49, Max Reitz wrote:
> On 25.03.21 20:12, Vladimir Sementsov-Ogievskiy wrote:
>> ping. Do we want it for 6.0?
> 
> I’d rather wait.  I think the conclusion was that guests shouldn’t hit this because they serialize discards?

I think, that we never had bugs, so we of course can wait.

> 
> There’s also something Kevin wrote on IRC a couple of weeks ago, for which I had hoped he’d sent an email but I don’t think he did, so I’ll try to remember and paraphrase as well as I can...
> 
> He basically asked whether it wouldn’t be conceptually simpler to take a reference to some cluster in get_cluster_offset() and later release it with a to-be-added put_cluster_offset().
> 
> He also noted that reading is problematic, too, because if you read a discarded and reused cluster, this might result in an information leak (some guest application might be able to read data it isn’t allowed to read); that’s why making get_cluster_offset() the point of locking clusters against discarding would be better.

Yes, I thought about read too, (RFCed in cover letter of [PATCH v5 0/6] qcow2: fix parallel rewrite and discard (lockless))

> 
> This would probably work with both of your solutions.  For the in-memory solutions, you’d take a refcount to an actual cluster; in the CoRwLock solution, you’d take that lock.
> 
> What do you think?
> 

Hmm. What do you mean? Just rename my qcow2_inflight_writes_inc() and qcow2_inflight_writes_dec() to get_cluster_offset()/put_cluster_offset(), to make it more native to use for read operations as well?

Or to update any kind of "getting cluster offset" in the whole qcow2 driver to take a kind of "dynamic reference count" by get_cluster_offset() and then call corresponding put() somewhere? In this case I'm afraid it's a lot more work.. It would be also the problem that a lot of paths in qcow2 are not in coroutine and don't even take s->lock when they actually should. This will also mean that we do same job as normal qcow2 refcounts already do: no sense in keeping additional "dynamic refcount" for L2 table cluster while reading it, as we already have non-zero qcow2 normal refcount for it..


-- 
Best regards,
Vladimir

