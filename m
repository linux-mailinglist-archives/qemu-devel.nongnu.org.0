Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63993F9D27
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 18:59:45 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJfCi-00020z-GH
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 12:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJfBR-0000o7-1C; Fri, 27 Aug 2021 12:58:26 -0400
Received: from mail-eopbgr80113.outbound.protection.outlook.com
 ([40.107.8.113]:23943 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJfBN-0002ny-Fn; Fri, 27 Aug 2021 12:58:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk9NipHwbbPIHgg4fSJMLBZbC6YPGsPqIZ4fuHe+zBar4M0jBQ/ciwTP/MgH/N1Jp84at79OsZRRhX5QHa7vsilWmldozqo7L5Mih7COGMV/iJTkwhagAKAoAg7pUP7964WMGdEhjBP3EdYbJ7PnTNbVg4GNjd8vixxAg3dnGxplWObjifsl1+K/ZKB4VoMxEslHkMEvRO9ezsFFBHPB6QpbpJlwfZSgJuDaQm8llPiaRIen91W0yIsUdEmPGAa6IaReSr7wUtw6CHm8ZFAPheURKD2kpjUQrwj70Fw6xDafvVzXM8U27aHTuqxo5swJHl4yy2L6q77ZzV57Em0STA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOi6sNMfXWXziLTyDTi5sxJW8MYfEdG1uQcw+VKHncU=;
 b=X4d8FtM9OLPWgcXyLrOVo/SGqrJFZ5lpVnsW4gRwGdDK1lSbsLTm8OpnZT/UPITNYH1mSw4DInhf1Om7nj8/SBm3nwtmOqNCw/sWJi+49fAvp9UDumflhDOcyOQsj11jyXK9BNGyCRb6e5+J/zRXgnzrpXjGI4CezlfqYhrhLnZ2dU6LZKdW48Px5tGcALob5AJgdXgYGCSOErK6I1TaJahP7Bzf66EOGLtiuBoquRAa9xOzEEUZZ2kxmm5DFn2iuTWVIOhWocDN0SMe3yknD+jFc2XB2ImvTv6rJd0cBlAQHDvnylLMB3R8Gq+htWmipDumN2E0siDf0XoPZ51kTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOi6sNMfXWXziLTyDTi5sxJW8MYfEdG1uQcw+VKHncU=;
 b=BtgOfymxZH51NkOF+4Fyv2zGOxQEq6IYtTFQKb56jM8nrmQc+Bh4ZnTe909U87upXIzwh5RzRM/q0lxAHsRE7o6N3XPD8mzXzsfFsgRZexppoi7TLRvd1RXsitPVzcG2ryHn0y7BJxCoMkHzgFCdStGxNlLKwTXg5L9P/svs8Hs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB5584.eurprd08.prod.outlook.com (2603:10a6:800:1a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Fri, 27 Aug
 2021 16:58:13 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%4]) with mapi id 15.20.4457.018; Fri, 27 Aug 2021
 16:58:13 +0000
Subject: Re: [PATCH] nbd/server: Advertise MULTI_CONN for shared writable
 exports
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: rjones@redhat.com, nsoffer@redhat.com, kwolf@redhat.com,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210827150916.532260-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <81fc3d16-b357-5a8c-45f2-682ddf253590@virtuozzo.com>
Date: Fri, 27 Aug 2021 19:58:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210827150916.532260-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::35) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.220) by
 AM9P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21 via Frontend Transport; Fri, 27 Aug 2021 16:58:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32e42e32-54af-44a8-cb13-08d9697bdb22
X-MS-TrafficTypeDiagnostic: VE1PR08MB5584:
X-Microsoft-Antispam-PRVS: <VE1PR08MB558481FD4B7F4D03A72B959AC1C89@VE1PR08MB5584.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ry47qLYNLpApQnf/KyC436RBaRfFVy2v5osyEitqJ+BOh6qM3wY3NK2O6iAyCbFWVs1pVMUWjuMOH2Y37uc8VROrAQSW0ZodYnGZhdNbIUQ2xoIRYfmzuf2TLU8srH4L7hsY2UcZ/S3446xy3EDkFqfapUywE+VEtSgAWhVGWAEan9Jkry5YbBdJanA/Q2wl5klG0Hj7RnKegOJ8+U8OQFxzA5pGbvJbQlyjMHcVlbWUpPep4TPDQxmdKgLuQqm4rxxPptu3mmeNvXOIS7NvYJdBaN0+UDfIVi46isVXV0ykaUkzLQu/n9jGaQhnRM/qRRuK7xguULKQrdPMiemnvC7YdegKRT0KoUH8vasqN30zvu/ZA9ttTdNCFWS9MLAoL+U6t5AZO21moT75LkWhgEIKmlCyDjbmkRpMUUhps8ZxV7CXL89seJH6nO1iL0pazexK5aaI5Rj7Xb5UvDfZHSo84SkAluGHhWLS90DMlYMZwGXZ3nBgU2NwNO9elUs4EUpmIipnKXZ0BXXWUF05PiF3O4klzjE/HeQNL09y/V8jYruhuFeu04e0aEXcLooqydQAEXp+NIKB/i1OQG8mOggOvCGdvDvlIEgDjiPq4uxm8I/pKVSZOGqdi3uGh941HgDrxciRxfPL/wIv4mnV0UzEIR5YcLVjg5eTYlfwKCjjT57CDCxn4xJ3VB+UdlZa506qzuRrsWSD2hFXpdKnDZqQwaSURqhOH54lM/Slj0ZAec45fMo3tGXKnH9hsU9D3ssDMRqvnATCzHUL3vahVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39840400004)(366004)(136003)(376002)(6486002)(36756003)(83380400001)(26005)(4744005)(4326008)(186003)(5660300002)(86362001)(38100700002)(31696002)(8936002)(316002)(16576012)(66556008)(478600001)(8676002)(956004)(2906002)(54906003)(2616005)(31686004)(66946007)(66476007)(52116002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDZxVnM2OGFWNVJWdlMwSDNuajVRZ1ZyZm5zYnN5a2Rjb3lGMWorZzlCaWRE?=
 =?utf-8?B?aFUvUXZhYVNRemlnNDhkUkNvVFl5RTB6UERXRmM2T3pEYThNZmRxTmFCMEpI?=
 =?utf-8?B?bzhacXVzWXBGTDlpR1RXMVRQdWI5eVF2Qzl5YTVFZDNLUU90eEJhNWs4NjVv?=
 =?utf-8?B?NGRBUVordDVwSWh1ek56RHVaOTFMczJkK1B0R3d5VlpzeUZKV3ZMSnFHMHU0?=
 =?utf-8?B?RnZYdDdEZXVTcjFIM0d2TDZ5dk9jYnNvMUVNMDhnMDNISjJ4RzQwK2VuTHY0?=
 =?utf-8?B?RHlQVjAwWGV0ZXRraC9TeVFSYW1SWGwyRnN0YVVSYkhuS0xkK2d3eFoyVVho?=
 =?utf-8?B?cUw5YkhoeEtzL1VodlFwbzN4dXhEbWdWUkNjeWFodGIwTkloUm9XSmx6SXF2?=
 =?utf-8?B?Q3c4ZkIvZjIzTHJVbVZ5blgrUG54cmJVMCtNaDNJNWVpNVVqMjU2WTBxRWFG?=
 =?utf-8?B?UzNwa1djMk9xVmhyMi9sV1piMGQzWUZCOGx0aEg3eGJObm1uckRYSHZxVTht?=
 =?utf-8?B?RTdnWFQ3ZVB2ODRtY29BTlRPenJHRXI4RjcyaGhCUFdhUmdVVGhpc2preW5K?=
 =?utf-8?B?b3Z3UDhFaEdHU1YxbWU4M0ZhL3QxR21DNXU5aUhidWd1VUpzcjl4cTk0cEE4?=
 =?utf-8?B?ak05VUxzb2w1cnpaaXB4L1MzWDNPNUdhQmgwRjJtNkd1cHVMa3lIWVdHY0ow?=
 =?utf-8?B?Mk54UCsyTCtnL0ozSzVHMWlqTlE5dU9mOVBXUzBkeHJZL1hySVBWQkpsNHNx?=
 =?utf-8?B?cTlUaTYwdUZLa29Gb2FaNFZhcUlMMWUzVzFweHFYUUFDNUZlQTFPQzVwMzl2?=
 =?utf-8?B?S2RXZ2tPUXBmb0VMZXB3SG80ZUh1c1NIbVJKVzFwN0Noa3JTL3A5UEtJR1Ru?=
 =?utf-8?B?RjRJTTdNa3NnWlA4SWNUOS9yUmtWVzdCTVZ6aElQb1QvTjY4dkM5WThQdC9F?=
 =?utf-8?B?UThjNyt0cDZmL0huZXUrNU5UYUlBa2NFYUJNMWdzbUFwdmVwQkRIWHM4WHBL?=
 =?utf-8?B?WHZoSlNpQVRuYlZtdlVrdjlhV1ZtR081aHpjNDRlc295SGZVNUZ1eHF6Y3dJ?=
 =?utf-8?B?UW1KUEQ1Sllpc1RmeEZMbmZocUlUK0w4TG5DSzN0bXB5N3dEU3dqQmVGN3kw?=
 =?utf-8?B?NklEbHgzVXNXRFNvZFU0QWlPT1VCZGx0VVgrK2NxdzF1THlZRzdBUGVScG1S?=
 =?utf-8?B?blkrOC9uaFZMbTZGZC9ML3dvQk9OSkZJMGsyeU85bEM4OHpxL2VOU2NhWVFT?=
 =?utf-8?B?bXFJbjF3OTMvcmdkYVR6REtaeGVRYVVyeTNzUlFWdEFTS0xiWElJWnppbGRs?=
 =?utf-8?B?SjZJOU5pa0Zick1lRHRBZkwvZmRHSndQV1F3ZUtKT256Z0xpT3I0Y2xZN0Iv?=
 =?utf-8?B?RDBSVElvS0tZdk1zY2hVVHJjTHBobk43cGdnaHJWTldRR0M4Z1doNy9iZHph?=
 =?utf-8?B?T1JIVmFJNEg3SXlCcjdkMzhjQXMyUkNtdWRza2lXWFRkdlBjSHJ0blBLZEdk?=
 =?utf-8?B?S2tOOWtmUTJObG53R25UbDFRYUIrai9Mbit4emI1ajdRcTg5WWs1bmtaTE9y?=
 =?utf-8?B?TlY5Wjl0SXNuc0tQTWdpZVduTGFXMENlMGp2SU45b2RBTFdMcEhYblRxbGpL?=
 =?utf-8?B?azJOZnlyK00vdCtubmtOc2ttSnExQUJXRzdacW5jQWd4eFlLWGZkTTY4b21D?=
 =?utf-8?B?TTRDNDJHeVVyZG1QSjdxbGJSNmZ3MDA4REJHY3h5TWpMQXlHU0twT2pYeWhr?=
 =?utf-8?Q?VDpuP9QVVfJohEnohYKlvjtsDKfjBMU6g0ByIlv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e42e32-54af-44a8-cb13-08d9697bdb22
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 16:58:12.9374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY6FvzPjJXgMlCm1OjGj6heHQwJSI7x18Q2VaPOacqrPip3RPqhiALXlSABBVlK8KVzKexhDP1PCLzBZgLqQwzG1ochdFMGV7L99aWNoyGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5584
Received-SPF: pass client-ip=40.107.8.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.437, RCVD_IN_DNSWL_NONE=-0.0001,
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

27.08.2021 18:09, Eric Blake wrote:
> According to the NBD spec, a server advertising
> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> not see any cache inconsistencies: when properly separated by a single
> flush, actions performed by one client will be visible to another
> client, regardless of which client did the flush.  We satisfy these
> conditions in qemu because our block layer serializes any overlapping
> operations (see bdrv_find_conflicting_request and friends)

Not any. We serialize only write operations not aligned to request_alignment of bs (see bdrv_make_request_serialising() call in bdrv_co_pwritev_part). So, actually most of overlapping operations remain overlapping. And that's correct: it's not a Qemu work to resolve overlapping requests. We resolve them only when we are responsible for appearing of intersection: when we align requests up.

-- 
Best regards,
Vladimir

