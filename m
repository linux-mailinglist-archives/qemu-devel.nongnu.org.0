Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABBB3DA0CB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:03:47 +0200 (CEST)
Received: from localhost ([::1]:43608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92tG-00005K-3F
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m92rz-00075S-HR; Thu, 29 Jul 2021 06:02:27 -0400
Received: from mail-vi1eur05on2124.outbound.protection.outlook.com
 ([40.107.21.124]:64992 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m92rs-0007xr-Ou; Thu, 29 Jul 2021 06:02:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQzvknDk23qTCDvPBoXNUUOTGRBpM6sHUXZ9/5EAazkp+Yu22SUZOqSJsCRmoyWDMoO10iR8p4WG7JBZN4wVwdGrRnQFTSDBDy9aRjX0gZCfKgD1765Z00IzLzBq5WapQ0nwyGYpeFCWLFHsKFRi8QGqV9qzjNv7waul95xJYEDKcSFcB1PERVdLkDkDvTYN6Gl5/Ir+D9uG5eM6GZNYdaS8V/BHVZH1m3B1uEOHQFWlAmBBTtEPknbGIu35P9W5uhEgZ+jo5vfW0DXqxQtne4/KSsJgPKxM0nRxuQNFrJkPYTO03o9xNJ6b5X15V3ChsTpnm50VIjQASz+Y0YfvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0J9LGJpLiHw//l+zh/40n/KIkUTqQxuXo34cq2Y+qYs=;
 b=YdWngTPB4WFhOC1NOsR3I59iTAAzEQdgaXtPt676At2uNoQElf0ZqDquY2Kr47ZHiUV2rhUPk86K6qJRMVbSECdWGHQSLB/FLDYJWQUp5fDURzqaJoJ+nPcbc3gg2pu14LNmy36nAEThJtju9exbk9JB9JNy4s/3Ra2VQBv/uTK6DWy1uYPLr9vj9snGUmFHYf2uWQNTsYPFicMspxzpEbd0TuxH+mDfuvbxkqr9pocUHoR7DlPzhQ4Jinx7FWkIT/UNmPJJLx8kF4ODiLzldX2etC2cKG0jZy8fLLcsA5eaqdGA0dY61Z2JG3j+N20Wo5fl3PeVDKHge9RtE+1tiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0J9LGJpLiHw//l+zh/40n/KIkUTqQxuXo34cq2Y+qYs=;
 b=Db/A9M0A2+PDDxRVxK0TEIfdVbOSilVsBKozJAyZYxu7aZJu+wAcku0pEK7fiBhuAvyOOZQ54rGVCptMs3EmJ7Ma0yHS4jkowc2C5cbff7AszSLHkVE5+YpOJ21JPJLgw12p2vDRZRZ5NlKpSNkts1e9ThIyL2DPT2ZURXVPkPo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30; Thu, 29 Jul
 2021 10:02:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 10:02:15 +0000
Subject: Re: [PATCH RFC 0/3] mirror: rework soft-cancelling READY mirror
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
 <eb6db91e-9b6b-331e-8a8d-ee4fcf60ff2f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <19e149dc-ff1a-09b3-2d6c-2d046e9daabb@virtuozzo.com>
Date: Thu, 29 Jul 2021 13:02:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <eb6db91e-9b6b-331e-8a8d-ee4fcf60ff2f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0099.eurprd03.prod.outlook.com
 (2603:10a6:208:69::40) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 AM0PR03CA0099.eurprd03.prod.outlook.com (2603:10a6:208:69::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.29 via Frontend Transport; Thu, 29 Jul 2021 10:02:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6bb3a2f-70af-4808-f32f-08d95277f14d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542C809EC12BAF8EAFA3412C1EB9@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/pkKp6iYjqgjz5hW+7smoyXgS9D82fhilOrxCRC+cmZMbSPAbEr/y1hWIfbHcXtwB/7FlXY7XClNsP1+uRsTdMH8Y9dBa7X01T//ITG8VANBMwXG9hPne6nm9KIhzVKfelV9CcuSUpJ/bJaeeUKM6s392np0ZuqHM3opTKAACNQsPHu41tgIHtiXxltBKljiSZJ4cqu2gpLD0rPeDEd6YI4tLcYA7w55jYN3ezfZgUpBdU25MDSgXSKv/ujaV0gOukzb1aW9oPAG6LiW7uuPsdY7AxhSP//Rh372mDbIoAAJxiSja6qjzMSzH/MhmalTL77RrakygNI+OwOEGAFVH/fxD8tlt9MBWbwValjQDu2aVwoyz0/9d+Lm1YivBftGK/rJvtWwgZG0kWSB0yHd8n4gaVSIdM5hlaYEzwDM08lJILx3bEJOfeez4APqqF86h3wdUpOj/Pc3X5q/gmjoaDnUjg1rOFco+vz5X33yGMKlp8uqhg5lZCTqSCA/zUL+U6G0z+pwLEheZ1D+/9HI/2lwBvGxOkeC+Xwa01GiMmFkiLtwqC2IKBjg3IGYJjKHU/YyPLwQBE20ISH77/SelUuPcD0m1Nv8A5ircccxX/pW589Xt5FGoDZTmUdPZhKSl64AnlN3KgqBf7fTDdTf1eXJ2Os8+q67Lt0/elnG6MtChcNUKQzjobCgbREHa99eNfOgt3hCWZO+Vm8VgmfdIIGPg0zkfYKditTkAi5kYqsFET1PE+2F8WfMNdZs97RSRfKZXUFG7GwsY9biAa/Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(2616005)(2906002)(26005)(8936002)(16576012)(5660300002)(66556008)(66946007)(66476007)(53546011)(6486002)(508600001)(38100700002)(8676002)(38350700002)(31686004)(186003)(36756003)(316002)(86362001)(4326008)(83380400001)(52116002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTg0ZzkrUnFwM1JWNVJncGxOOGNSSkFaRlhQTWMwZ1JsbFVUa0swNnZ3djZj?=
 =?utf-8?B?c2crSHFBUXJ2QkoyZndpbnY0OUJHbWxsYy8ySnV4UlZ1c1hUSkhsTUVVbFc5?=
 =?utf-8?B?NjM4UFBqWS9BbDlGaHhndjIvWjEwS3B4dm04NUdUeThpSENBTGpOV2YzbGJz?=
 =?utf-8?B?K0JXOE9keWZYbzgxOE8rTkRWYlZwcUdFM241NVlWSVoyZDNCVXladmllVk9k?=
 =?utf-8?B?NFpObFhVeVUxMk1IcU5rVnF4U0NWT2lNVktub3lNUDROUklTbTk3ZnRkZjFv?=
 =?utf-8?B?cldCQnlyanExVHg0TjdURFRFK3ZkUDFjazhhSG82UStKSGo3eUptYWlKY3ph?=
 =?utf-8?B?Ky9rVnFaWlZOSXBlSE45RE5ZMG1odTk1aVpSbGZBTFN1UzhDWmQ0SVFmVlZi?=
 =?utf-8?B?SElmRHNvWkM3aG11NXFDWkJaSkYwTTBvdlo5MWNLTGZSMDBPZFdHeVU1YnJr?=
 =?utf-8?B?b1E4MzJnTWNGMGFRbkhBSHRnaGhBT05nVEo5emt5V2hVRnNWWk1jTjFjOFRy?=
 =?utf-8?B?WnFmdWZEMUhZcTNJNVNOenNBaFNDek03bzZjdVFMMEtzcDJUOHRWYWg4RHpo?=
 =?utf-8?B?WXlRbFY3ZHRSS09lKy9rQm9lalIwbUNiME1PYjdmWU1kT0xUbysvNGhCUG94?=
 =?utf-8?B?dHRjWGVHZ1FDc1dKdTFvODVPZjhQZmg4RE1MaEVLYUVVbGsxRUVpVkdOd1B5?=
 =?utf-8?B?eFUyUGhDWTBnYmNDK3haME0zaFFwOEpSVmtvaUhkamJsWG96VHBNcXBOZUN6?=
 =?utf-8?B?UWN3cFNRQ2dDZUdNSU5RNmNLTTMxRTY3bFZya2N6TFh4SHFiVUNoZW1TWHZt?=
 =?utf-8?B?dEpFVE9xbEtxVk5kT0RkZjZKaHEwc0ZzRENnMUJGV0poVTVlL0taUUdPZVMr?=
 =?utf-8?B?Y1kxV3pFQnY4Wk1JY3RGK1FZeU8vN3FmSnBWNTVESU9qTm9Ca0RFRStNNkph?=
 =?utf-8?B?S2dibnp2dzlXQXRvcG4rQ3hrY3NhQm8rUkN2THZ1Q1BBQlFraGZGRE50cWxT?=
 =?utf-8?B?NVdMd0YyOTFUSzREUHVLejR1R3dKb0t3TFVzL1ZxcS9VMUs2bE0vSmdyNTM2?=
 =?utf-8?B?dE9XZlZFMmVET3NpMm43THpld1JFZ0M0NG5yYXFOT3B1R1RFS1NGN1ZWTGZx?=
 =?utf-8?B?WktzZFJXSEZKV0x0TnVxVjRHWUlpQVFSZGh4L3BoMXYwMVFYRVdTYUNTK1BJ?=
 =?utf-8?B?cFpoelRaN3laVWNrRlhTWVF6VFo0S0NPTy9ZUncvRlAxNmpyWE9zUXVZQ2V0?=
 =?utf-8?B?ZHFaL3lnRGJYZGQyYm4xT1VLNktoeGdjdGZzRm5xS2hKZFp4NktCZmQyb25h?=
 =?utf-8?B?Ni8zZFZ3ajhEcDAwZGtzaTRpdkY5OHZMcyttL2l3UWN1eVZWZmVaK1hmT3Fp?=
 =?utf-8?B?UzZDNTFUMDJsUEVBNTZ2QllOUXFQYWYweXM3Qi9mV0ExaGcwQXV3bFEra2x2?=
 =?utf-8?B?TFM3SlUxcGcwcDVSMnZvRGhIdDV4R2NVVThnZGx3cVVpSUVOd3FiSXhMb0Rj?=
 =?utf-8?B?ejIrS3ZhWGs1Qmg2V0c5YkRVSTdGTXVUdWFwUFIyZk4wMmJPMlllajRRL2c2?=
 =?utf-8?B?d3R4NS9hWlo2cXI5bFNlTXBnd2pYZHJ0aHQ1bFpKSExnLzBXYU02dWJnaDFq?=
 =?utf-8?B?NDlpdG5rcVZIdFczbEVWZzNOazBrMG1BNHlSK2M0NVFrQVFCWTFDQTd3STZa?=
 =?utf-8?B?ZDNFNmROQlFHaVhDczU0dlIvaURJT3FYNFE2djc4TTcyOHFyL0JqdDBNbjJx?=
 =?utf-8?Q?yskkbXLTHA48+w6kR0Dsu7OapbkzFq3mpBGqTJy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bb3a2f-70af-4808-f32f-08d95277f14d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 10:02:15.3963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w07xCWMMFMuxMVdRNcxnzLZF4MRfIMQPpJPg8ApZMgC+01ILJGg79SyXDcGDPt+7A8SP2QeMJFcHsH/ERnELYMHIX9w5uqPbF1a+esBJ3F0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_NONE=-0.0001,
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

28.07.2021 10:00, Max Reitz wrote:
> On 27.07.21 18:47, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> That's an alternative to (part of) Max's
>> "[PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel"
>> and shows' my idea of handling soft-cancelling READY mirror case
>> directly in qmp_block_job_cancel. And cleanup all other job cancelling
>> functions.
>>
>> That's untested draft, don't take it to heart :)
> 
> Well, I would have preferred it if you’d rebased this on top of that series, precisely because it’s an alternative to only part of it. And if it’s just an untested draft, that would have been even better, because it would’ve given a better idea on what the cleanup looks like.
> 
> There are also things like this series making cancel internally always a force-cancel, where I’m not sure whether we want that in the replication driver or not[1].  With my series, we add an explicit parameter, so we’re forced to think about it, and then in this series on top we can just drop the parameter for all force-cancel invocations again, and for all non-force-cancel invocations we would have to think a bit more.

I now don't sure that patch 5 of your series is correct (see my last answer to it), that's why I decided to not base on it. My series has the benefit of handling soft-mirror-cancel case the other way and handles mirror finalization in case of soft-cancel properly.

> 
> Specifically as for this series, I don’t like job_complete_ex() very much, I think the parameter should be part of job_complete() itself.

That was my idea. But job_complete is passed as function pointer, so changing its prototype would be more work.. But I think it's possible.

>  If we think that’s too specific of a mirror parameter to include in normal job_complete(), well, then there shouldn’t be a job_complete_ex() either, and do_graph_change should be a property of the mirror job (perhaps as pivot_on_completion) that’s cleared by qmp_block_job_cancel() before invoking job_complete().

This way users will lose a way to make a decision during job running.. But probably they don't need actually. Moving the option to mirror job parameter seems a good option to me.

> 
> Max
> 
> [1] Although looking at it again now, it probably wants force-cancel.
> 


What do you think of my idea to keep old bugs as is and just deprecate block-job-cancel and add a new interface for "no-graph-change mirror" case?

-- 
Best regards,
Vladimir

