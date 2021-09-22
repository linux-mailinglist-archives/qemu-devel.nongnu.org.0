Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10904150A2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:45:55 +0200 (CEST)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT8Bm-00060i-Aa
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mT7mP-0003V6-Fj; Wed, 22 Sep 2021 15:19:41 -0400
Received: from mail-am6eur05on2104.outbound.protection.outlook.com
 ([40.107.22.104]:52288 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mT7mM-00066d-8h; Wed, 22 Sep 2021 15:19:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oM0NMfEgwsTi9/u8gK1JBawYV8piRxcAtScBPOW5C3W8NuAMj3XIKbJZxFUgUs/insLTGiY4HbXor0G+B1mTtEFkNFvX2W4CA5vIhs0GN43oCaWVngjBXOBsez1QqlgwFRlJC4En772AH73Ce0xL4EybjFXDy7Yk66vePdj63eeI1EcDS0Ro6lpKc1MrXmB48h/5fOAxMyP0JIL/OX559lzaQNrAJK5SZX9TDlKB+xW6onZ1pDx6p2F93WXHhDwTSQU+YmuJjpgCJs77A4H4APObqVA3QCreg5Y/GDxvblgfpOMoOSsIKhoj31J+T1f5He4XWYl14TA+VWmxLUYhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ktZAYl3Af1I6FeJWBKKh5HPO6brRtyIxhUvJZKFdE3Y=;
 b=MLYR4VRFWGBoASmDEuyPP9dN44/eG1HO+Zisr+l0HFd4ai8PsHbHvzTaJy7K82IfOblkmkt3yy96xfy4OvFSEq+o1XrrkhTLumwXlcbkSvV/hw1D9kXHvhqplD1Ib23Oe/s93e2QpiFttMTxyRl/IZVdfcQyUHnwESC5yCaesj7EOvI7bM82ehz2XBq8JEiPVLk3lQm5XBlolCGoOJ2hyDq0vIC9ScdeSPMBHhIFHRKw0Gl39A21jc+B+J/tK92pTvlaTvQWlzwHkRc/PE0/M+WdZkJJaAajt8Tmb1AJiC4cyXE28q1v+zHyuTizziegfDOn0CKq+ewb5luBG+S1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktZAYl3Af1I6FeJWBKKh5HPO6brRtyIxhUvJZKFdE3Y=;
 b=RcNsZD3dyTHQPMtQpzRHNDopq5UeovkGGMteahF+2TyljIQ/Od/GfWdvayTmmc5PDCrwkQIvEHjtDpa0OV9Yucxqatn/blQ0JG9VIDkhskCkrYGn2Wk/a2Gcv+g8cJT0TTXd8RzPKBQAOQWI9cO6BpcYJDSh/zg9Y34pkw0X0mk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 22 Sep
 2021 19:19:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 19:19:33 +0000
Subject: Re: [PULL 00/12] jobs: mirror: Handle errors after READY cancel
To: Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, jsnow@redhat.com
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
 <4a51243d-5746-260d-3045-b48650aa5047@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <46b96d63-e6f4-5dc3-a4ab-ade47ab5f553@virtuozzo.com>
Date: Wed, 22 Sep 2021 22:19:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <4a51243d-5746-260d-3045-b48650aa5047@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR05CA0143.eurprd05.prod.outlook.com
 (2603:10a6:207:3::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 AM3PR05CA0143.eurprd05.prod.outlook.com (2603:10a6:207:3::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 19:19:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f70d4653-b0b5-4a87-0f1b-08d97dfde8af
X-MS-TrafficTypeDiagnostic: AS8PR08MB5910:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5910F7882B86C6242ECBD083C1A29@AS8PR08MB5910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MdlE+8rLHV98zOSrrKtzFUlLV6EfXX+cFU1lxptnL++QBsWjx6DOb9XWFev1seDndK8jGIThiwnB+LnI/wlxQaQsspTsEZT/YTEJY8z9PcG7nFwuWcmhVAOX5PsCAufzMQUkrjeekqLPIUdUbrMt1YwrNFdVgJwj2iVn/igLjMdN2/VJHiOc3nX7k5MogFBMsFKsQhenbG9/WIs2yuOzqgm2t8xTQEwcVEt6i0cDRUYArVi3gk9yECuJ7epEKe6y7rzh5mIVXzHsNVzP9kYyHd9T6B+8tdYJA150R0Upf1sZQdNoBjcbjDYiQLY8I6dg/Fwp9yxtITTceslpnM1fij3CmjmDk2XpFpLALL1sg5KqVT7E4LH63vlv3QDIboT2ZaZaLwgRocZnTCPyYYbtiXmXHwECPtYLOfnUxM0Xryz1hmg8FOpYk/86RuqECEPkyT0qgKJW2aj6rdEMEwzvaRaLkO4JR/0Gt6+fwy6O2UAaIvPh2T6zD1j3kut99DA/YzeE9fi0zNDc6r5d+00pImuKJxuKAwiN1csjbFOrbhTxReRhINgNZd/g9Pirt0/V2SLLdbpJnMqTbbnhFfmEbWtAK9bpLFMHFfURDi33cJm8jo00OPb5Ge9tMOgOFo14fxt+RQfZuLGKv5DuAVsrh0MZPuU9U9GKPENVJFb6gUfKE3CY/mBtezSKyU42YCptOanLyeQsaq+mNgkGoJ3DNWYSGeZITVeAdNjwPk4UnWvrDy1BeWxHwHC29EMs7BuMcJFjNKrDWKCGhluq/jMz2WPe14gNDKZMbfvULd4uNNCWAzwVGJosB284DZNGOWetQ1wD4WjXzbMsEU5OsZLpoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(5660300002)(8676002)(26005)(508600001)(316002)(66946007)(86362001)(83380400001)(16576012)(66476007)(2616005)(53546011)(956004)(966005)(6486002)(36756003)(38350700002)(38100700002)(2906002)(31696002)(186003)(8936002)(52116002)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXF4TW9FM0NWZ0czblEvMmtXRzFwV21oaDNWYldRTTNZaUd6aXZTc0lHMTJz?=
 =?utf-8?B?cytsNEk5QVd0L3J5UVhPeVZ1elpYcjlNWUlRNm8yVXFKd01EcS9oUXJqWHB0?=
 =?utf-8?B?cmU5Nk9KWmYvU2dJTkIzM1dsSCtrclgzdmFMVCt4clE5OVhSMGhCbkVZdXlX?=
 =?utf-8?B?UlNRd2RkSjJGZGpKQnJVK2pISFNGZkphcjc4OTYrZndpd1pLZWVvUTBzRElO?=
 =?utf-8?B?MTdwaGtEeHBqTVkyR3FuYjFBRlpMTmFFaGNrMVRDTUUyZndOa2pVMC9LTE82?=
 =?utf-8?B?SFo2ZXkyR3VQdnorcmtQRmtBWDFMWmlDVHZpK2RNZHFveC9JUGVRWm9UMGpI?=
 =?utf-8?B?ZE9GS1kyTnZYOVFmbWh3YXpUTVdGR0hUUGxCclNjeGVPWjhtd2ZXSjRkWXBX?=
 =?utf-8?B?NWl2dGtNMDBEcE9WdFdQbStQV3EyL2txWlZGejY2Nlh6VFlEZ2RDWklZN0RV?=
 =?utf-8?B?cFVsVHRaeE1UZTVwUXdwZE92dFYvVEVjQ1RocGlyeSsreDJBM3R5T1MxMEhQ?=
 =?utf-8?B?bzB0WmNEMnBOTndGV2JHNzJKMTJvcW1ERm9Ja0Nnd3Z3dDhOV2FCQzNUK3E2?=
 =?utf-8?B?K0hMVG0yVE04Tk5IVjdEY0daMEhQMWlNcE9iemdJRWhUSnl2WVdCL05kaWVl?=
 =?utf-8?B?QkxwSytvQXB4Uzc2V3NrSVVNQXpyL2VnYUR4Ly9FUExneFdEdkFVK2xIL2wx?=
 =?utf-8?B?anpQVkI4VE1LYjlOY3IxNSttdXZJRVEvaUpWbm5VODNvU2xuOHNwT2hWS1kw?=
 =?utf-8?B?dEtFT1pmbUxuOWc1ZGpqWGpUbE9nSzM3U2RybDRmcjNUK0tGdC84OGtKT1l3?=
 =?utf-8?B?Q3YyUmNkTFU0bjJnYzNkeXdTWm9Sa2pMdGhRc0U3L21XdUV1cSt4djVkR2Iv?=
 =?utf-8?B?am9aUEs1NTl1WGFGa2k1WGVEMjAyVnFNUTl1UVZZOHJEY1BnRTRrS3N0em5B?=
 =?utf-8?B?eGlMTXNrdGdxRzJuLytaYnBZZXFwMVZZUHFFWS9zNUJTU3J3WTFIcVdGVXlv?=
 =?utf-8?B?eHlwbUpBdXp2MmlMZWRyYVdER2JpRlUxckVsSXVhQmx6ZkJTSjA3cVBvNUxq?=
 =?utf-8?B?dy9xNGtrMkdGSU1Bd2xlWXJtYlNZcFNxb2VtV3l0d3dGSnNFcTFSZGdpay9j?=
 =?utf-8?B?L3BSemZoaVBDWU1Sc2gyZ1Irc1R5dXVxNWhyT3B4SEVrVmJlZks2VytNeHFM?=
 =?utf-8?B?VkdydnFzZHNwckc2K1o0RFF0MC94VitSM2txZVZjYzBoV3AxcGdBdHNpRFh0?=
 =?utf-8?B?MDVZUVlLMHJIa3Z3S0VpY0NhRUNlblFTMm9jbmRkREJvSjkvSHVHdmxaRGVi?=
 =?utf-8?B?RHZrU3FxR2JReVpJaHB5SkxsaWdiejlWVWpmNnhsQmNYdGROSHpaUGlrb0Uz?=
 =?utf-8?B?R3dQWE55TkFZcTNkNEwzOEwyY0ZyaEdKTTd5NHBMc25ZSkFudFF4dkpVcGlF?=
 =?utf-8?B?L0JKYmV0cEZwRjhDQWhhM0x2bE5LTFc2M1ZTQVJvOEFWRjdLR0ozRFdVeXdv?=
 =?utf-8?B?ak1LVk1mQmJ2cjZOV2FxK3c4VXhkaysxQy9QQnNkMExEZHQzcVNLNVV6SzAx?=
 =?utf-8?B?dHRyakhDeHNQT3BFUWcvLzlDZE5HNCt5ZWF6V3g2eGdzL3g4TzFPUE5ndk9q?=
 =?utf-8?B?ZklCdVVYSnBPcjBEUkg5b2JxVjFYTlVnRTlNUHZLYmRqeGhPSkYzK3BvVktQ?=
 =?utf-8?B?WDBHWERNM3pYaXdNOGVIOFBsdm93Szd1bHhkY2NSbURuQWVRZXZVUjZ5WFZ5?=
 =?utf-8?Q?cqn9Rh4yfMVMhjr2RBtN0KE3vdmnnIJtalxQlb5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70d4653-b0b5-4a87-0f1b-08d97dfde8af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 19:19:33.5472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MDTqQUAWHD8z+eu2lgLPV/2VuaowD1hU0VVIzwZz8cY9+ab3TN5wGyd6nL0zSP6GRPG4Wp/S9PP2cG40KSFWe11nskDXnKyuhRSbcPUF7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
Received-SPF: pass client-ip=40.107.22.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

22.09.2021 19:05, Richard Henderson wrote:
> On 9/21/21 3:20 AM, Vladimir Sementsov-Ogievskiy wrote:
>> The following changes since commit 326ff8dd09556fc2e257196c49f35009700794ac:
>>
>>    Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-09-20 16:17:05 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://src.openvz.org/scm/~vsementsov/qemu.git  tags/pull-jobs-2021-09-21
>>
>> for you to fetch changes up to c9489c04319cac75c76af8fc27c254f46e10214c:
>>
>>    iotests: Add mirror-ready-cancel-error test (2021-09-21 11:56:11 +0300)
>>
>> ----------------------------------------------------------------
>> mirror: Handle errors after READY cancel
>>
>> ----------------------------------------------------------------
>> Hanna Reitz (12):
>>        job: Context changes in job_completed_txn_abort()
>>        mirror: Keep s->synced on error
>>        mirror: Drop s->synced
>>        job: Force-cancel jobs in a failed transaction
>>        job: @force parameter for job_cancel_sync()
>>        jobs: Give Job.force_cancel more meaning
>>        job: Add job_cancel_requested()
>>        mirror: Use job_is_cancelled()
>>        mirror: Check job_is_cancelled() earlier
>>        mirror: Stop active mirroring after force-cancel
>>        mirror: Do not clear .cancelled
>>        iotests: Add mirror-ready-cancel-error test
> 
> This fails testing with errors like so:
> 
> Running test test-replication
> test-replication: ../job.c:186: job_state_transition: Assertion `JobSTT[s0][s1]' failed.
> ERROR test-replication - too few tests run (expected 13, got 8)
> make: *** [Makefile.mtest:816: run-test-100] Error 1
> Cleaning up project directory and file based variables
> ERROR: Job failed: exit code 1
> 
> https://gitlab.com/qemu-project/qemu/-/pipelines/375324015/failures
> 


Interesting :(

I've reproduced, starting test-replication in several parallel loops. (it doesn't reproduce for me if just start in one loop). So, that's some racy bug..

Hmm, and seems it doesn't reproduce so simple on master. I'll try to bisect the series tomorrow.

====

(gdb) bt
#0  0x00007f034a3d09d5 in raise () from /lib64/libc.so.6
#1  0x00007f034a3b9954 in abort () from /lib64/libc.so.6
#2  0x00007f034a3b9789 in __assert_fail_base.cold () from /lib64/libc.so.6
#3  0x00007f034a3c9026 in __assert_fail () from /lib64/libc.so.6
#4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, s1=JOB_STATUS_CONCLUDED) at ../job.c:186
#5  0x000055d3b503e7c2 in job_conclude (job=0x55d3b5e67020) at ../job.c:652
#6  0x000055d3b503eaa1 in job_finalize_single (job=0x55d3b5e67020) at ../job.c:722
#7  0x000055d3b503ecd1 in job_completed_txn_abort (job=0x55d3b5e67020) at ../job.c:801
#8  0x000055d3b503f2ea in job_cancel (job=0x55d3b5e67020, force=false) at ../job.c:973
#9  0x000055d3b503f360 in job_cancel_err (job=0x55d3b5e67020, errp=0x7fffcc997a80) at ../job.c:992
#10 0x000055d3b503f576 in job_finish_sync (job=0x55d3b5e67020, finish=0x55d3b503f33f <job_cancel_err>, errp=0x0) at ../job.c:1054
#11 0x000055d3b503f3d0 in job_cancel_sync (job=0x55d3b5e67020, force=false) at ../job.c:1008
#12 0x000055d3b4ff14a3 in replication_close (bs=0x55d3b5e6ef80) at ../block/replication.c:152
#13 0x000055d3b50277fc in bdrv_close (bs=0x55d3b5e6ef80) at ../block.c:4677
#14 0x000055d3b50286cf in bdrv_delete (bs=0x55d3b5e6ef80) at ../block.c:5100
#15 0x000055d3b502ae3a in bdrv_unref (bs=0x55d3b5e6ef80) at ../block.c:6495
#16 0x000055d3b5023a38 in bdrv_root_unref_child (child=0x55d3b5e4c690) at ../block.c:3010
#17 0x000055d3b5047998 in blk_remove_bs (blk=0x55d3b5e73b40) at ../block/block-backend.c:845
#18 0x000055d3b5046e38 in blk_delete (blk=0x55d3b5e73b40) at ../block/block-backend.c:461
#19 0x000055d3b50470dc in blk_unref (blk=0x55d3b5e73b40) at ../block/block-backend.c:516
#20 0x000055d3b4fdb20a in teardown_secondary () at ../tests/unit/test-replication.c:367
#21 0x000055d3b4fdb632 in test_secondary_continuous_replication () at ../tests/unit/test-replication.c:504
#22 0x00007f034b26979e in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#23 0x00007f034b26959b in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#24 0x00007f034b26959b in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#25 0x00007f034b269c8a in g_test_run_suite () from /lib64/libglib-2.0.so.0
#26 0x00007f034b269ca5 in g_test_run () from /lib64/libglib-2.0.so.0
#27 0x000055d3b4fdb9c0 in main (argc=1, argv=0x7fffcc998138) at ../tests/unit/test-replication.c:613
(gdb) fr 4
#4  0x000055d3b503d670 in job_state_transition (job=0x55d3b5e67020, s1=JOB_STATUS_CONCLUDED) at ../job.c:186
186         assert(JobSTT[s0][s1]);
(gdb) list
181         JobStatus s0 = job->status;
182         assert(s1 >= 0 && s1 < JOB_STATUS__MAX);
183         trace_job_state_transition(job, job->ret,
184                                    JobSTT[s0][s1] ? "allowed" : "disallowed",
185                                    JobStatus_str(s0), JobStatus_str(s1));
186         assert(JobSTT[s0][s1]);
187         job->status = s1;
188
189         if (!job_is_internal(job) && s1 != s0) {
190             qapi_event_send_job_status_change(job->id, job->status);
(gdb) p s0
$1 = JOB_STATUS_NULL
(gdb) p s1
$2 = JOB_STATUS_CONCLUDED



-- 
Best regards,
Vladimir

