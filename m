Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FB0349A0D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:14:25 +0100 (CET)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVR1-0006Yy-Kr
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPVP2-0005Y7-8l; Thu, 25 Mar 2021 15:12:20 -0400
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122]:40029 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPVOw-0007xt-L3; Thu, 25 Mar 2021 15:12:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3zn/zUkD/A005pPMSBaxr+2Ny0MfaJ3SKHd+uM7dlUEwtU3i1tuTmWfMfpcTkO/PNt7glVog0aLDvWxquk7QLPLggNAu27qooziu0j+dFJMje7mDWStJZCmCCEypBMBnvyiKPvSEYkPFhXCxJcshAqS2AaxP77PUqiqRzJlzo/aCBSQiB1PscAYc5LCj+jEdweAXwx69biO/Am74j7P6luIjdqchIYGY71P3ztYU4Eb0oK3ADFSRS6Sszm97HsBqJoA/0JKYgFqAK3M0UBuHXFRX2BCDPf4aFL7R1kUfXxVa4cbf3ZmAIvyuwl5LVfVM1+OY0YwsdkEkgkhpO1UTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym5bWuCmPiCEe2HmE/qWYvrfXBMP7DQY1qs4vzgL/DM=;
 b=Fn0OyGPxIHONa7bs6XcuP2/7mLD/SSbtKf5Wcc3W1BMqNmVMDfO7cW5154/f35R397RY4KJzURKpzcZSirUkTujg+4pph2qIo+JUZ6RF11B8LqlL2d3vH36F8yeeOGVPNbl3VJfS+Ac59PrMX/vI5cAs+q8AM4SVr5LFgYeqkE4x++zh9glD9/PTpDj2blbjuxEFyfRkd/hC+4XfyeD0qU8tXibZct2cw77m+SODLhxUroclEun0nl1tAh9j+ZYW5XAbhru+XDoOYuuuyNdRKrqsXb9l4cczN6TxsBLMKS2uoEhm+aJ92d6jHhwiZ54YdxyLEtHOCD9nwkI6AiuhHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym5bWuCmPiCEe2HmE/qWYvrfXBMP7DQY1qs4vzgL/DM=;
 b=kszo69oOKYlDmzVhCDupM8f+QazIrBmokeHRHM1VSVrDqOdHX2KQRTWCaKJT13W2sNI/pevT829rS/ODVQyHbrpv1TfZRoMcWNyu0F8EZkEF4wK6z6yJG77NyJeeEihquGyDqmvjBcQhWLCvA/BdH95g1BAwEoIczyQq364luyg=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1777.eurprd08.prod.outlook.com (2603:10a6:203:3a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 19:12:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 19:12:08 +0000
Subject: Re: [PATCH v4 for-6.0? 0/3] qcow2: fix parallel rewrite and discard
 (rw-lock)
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f16e8ea3-5af7-abc2-bf1c-7fd997ecf651@virtuozzo.com>
Date: Thu, 25 Mar 2021 22:12:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210319100811.342464-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM3PR05CA0103.eurprd05.prod.outlook.com
 (2603:10a6:207:1::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM3PR05CA0103.eurprd05.prod.outlook.com (2603:10a6:207:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 19:12:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26c18b4b-33fb-421f-be45-08d8efc1e293
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1777:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17778AE12FDA58C955EA3707C1629@AM5PR0801MB1777.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cpbFltSW0wkDRMyIk21keTqIEy2NGZlXsXu7BJ4ebr4b0jzPsvjikZ0aY6MLIQeD/SOdSIZ8xNQDmZI8dh5apY9Xj2DQtsKQIfdaWCTkS5+Rd1iQZURqEjUHbz8VxgzKo/Nz6CT3CKBgKUpmu1IpO1K84zolejQRnzq7jNlRNG+6vRc2VK/yFFkjfyQichFRi75zDXGio1CZpxT5ClD2ItZ9KWU8oFf0MKEHJuO08f+HkoWnE7Mu8aZq8uj4NoXneUW5PHSjQaX3eTZnEnGRq7RVdENoE5tSnusWJ3O7e1/AOYVQWj2EC4ApF8RWfQhRBRAC97m20SR/XODK3ifFQA0vtehEAN77An22tr6xzAfVmaiw1VXpMcK3rftrhjFKuFxkHeNRRNa57P0ACQr5s7G7ZIN+uGwjYfCuFGclYObYmPyoKMUTlQbMq8H64M24V42SipC1vuXHNsaVmHQV/MECMAD4I8JSSaolyrsm5I0O4BfZsggrm2ZUVid81/04iEy7m/jvvK4gYU5bmRgS2BqgszAOl0+i0Tdc7YsAWu57DUNd6rkYTE+wEyTpzZGYwNqMrXNEUa31saYEJ6/uTCq3A1O6zp9jB9a1ch6XMofj7M9jcffr4IxuzQbgkSfRUHtzl60kBgM7Dwor39rd9EoztANpmHV6S5Ln9krDy1L6Kv0xN9JMp44GljYAlUsD5HiWAvf3QwIbFJY2txPYTNisTj6vVpwuGwSMikFnGVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(16526019)(478600001)(36756003)(66476007)(2906002)(16576012)(66946007)(6486002)(6916009)(316002)(186003)(83380400001)(66556008)(4326008)(31686004)(38100700001)(5660300002)(956004)(8936002)(26005)(52116002)(86362001)(107886003)(2616005)(8676002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NitPaVQrc0FCSnBzWEZncE5BSmY2Mkc1dnhUZUhhaGZqQko2OWRxT0RXTERz?=
 =?utf-8?B?M1RLb2FXa044ZDMzMEhMaytnWk44LzNybVBxTG9kbGx3L2xja2k4VWhMZ3ow?=
 =?utf-8?B?cTNDRjNieEFmUUdBUkJkUkd1Z20vSFBNNks4N3p4RVRPOE82dmt2TTc3emtD?=
 =?utf-8?B?azQvTmtSOHdQY2xXeEFPVUtxU21NUUtIeGhBcmplWlN6WStyeWw1R0IzblQr?=
 =?utf-8?B?S25LdGFFVEtFbGVJeVZWWGhEWVU3VDduVCtNTnVqdzJRQi81cExaS210SUd0?=
 =?utf-8?B?WTdPcTZ5bm9STFJmVWgyR09NWnBYUFJ1SkFjSUEwcmU2OU0rMVVSSTY1aFhy?=
 =?utf-8?B?dlBFbE4vd3J4blJ4SWdjbUE2TCtFTEMrTWZOdUtvdVhxc2lpWExURnNsZFNz?=
 =?utf-8?B?bDNxUjJJb2l3OVljTVFaUmdpdkRrV1hLOXFLNlJJZjErL2VQZHJvTFkvcjNV?=
 =?utf-8?B?cTM0NG02NWp3UlQwV2VRbDQzQS9NY2NCM0svZVgwUnAvV2lzYVF2c2FIZEho?=
 =?utf-8?B?UDBWanVSTHFFcFdSZ0pHNzF5N216LzJadkpTeGR6Q2s0Rkh0TkZybmdmZnRI?=
 =?utf-8?B?cXZrWXcxRUVvVEZsMWt6V2UzSVNuWUlKNWsxcUhMU2dWZXJuditDM0pnbFRn?=
 =?utf-8?B?SDIveUxwYnRxWTlwTUlDT2hCMnJrVFRPOVViZ2RtbFUzTmc2WktOSzlMcTNQ?=
 =?utf-8?B?Wjh0MzFOc0dLYjFmOU9aelBqV1FTNm5sNGt5NEFUd2kweEdibEhOQ3NPQjlu?=
 =?utf-8?B?b3VmNXVld0xlZ0MrcmJpeUJtM2krRUZCa0pmTlFpT01QRUkzTTlOVjVhR1Rl?=
 =?utf-8?B?cmlRNlh1cUZFemFDUzNiMGM0Y0lJVXZFWlpHY1JWUEJDN0h4bXZGU3BDTVVP?=
 =?utf-8?B?MFd0VlcwbFR4MWcrMEZrVGJNQm1NVUc3WTFLMnF4S1NxKzBXNDd5cFRCcXRz?=
 =?utf-8?B?M3MxTXFpS0hFZHBPcUlrVWkycFJMSVh6RFJwVVMweHh2VFpGdWZtaXYzNkIw?=
 =?utf-8?B?clZKTzMwc1FxbWdtOWQ1QUJWVHYxTWh5N2lPTDIvRGFJTVFRQStDVU5pNG9s?=
 =?utf-8?B?cHArb2tNU2I2RnZBUWRFTVRnK3M3ZkNBY2FRb0I0QUx6NUlIVFFLTWpTK0FE?=
 =?utf-8?B?WlIxVnFxV3ZMcGExalhiL3ZPd3c5OE8yRkkwcnpkZmFFaDNscU9reXBWSlRW?=
 =?utf-8?B?R3llYzZqTHFaZFMzQm5oRE1XL25LTFJWZTN1MU9WSGg3QW5CbEY4TWJzRlF5?=
 =?utf-8?B?YXkycmFiTGhwUEpmcnk2YlBBRm93dmRMVW9pdG1rV2g0Wm5UZTVCS2xrN3Vp?=
 =?utf-8?B?U0RuejFRWDJ0ZSs2N1diNVRkK3NpTDVtbnIwTUpRS0x2SkNobWptcTVkN2ZN?=
 =?utf-8?B?YUgyYWFXbzJCdm9MazF3MmIva1orVlRsa3U3eklRMDVvdEY0SEhkZU1qK0Ny?=
 =?utf-8?B?dWNOS1B3NnRLTFRxRS9EanE4Q1pFNElzemVpT0NubDhxeVJ2ckRaNE8wb1BT?=
 =?utf-8?B?WU9CRU9JZmZaWUNDc3FaUStZMWlVZUhzSzBGcDV1NVZyUHlZQ1IvRWV6QlZm?=
 =?utf-8?B?ejIzQmYxNFhWV3NTMHdkd2NzdHEyWE44ejFqVGJ6ZVBzendCUnZ5d2NxZ0Nx?=
 =?utf-8?B?R0NEcTR0ck1IUW1RNjZhcGovZjJKVW9yOW80L3FtUnpoZk9KdGI4ajNwcjgz?=
 =?utf-8?B?REdHb2YwV2FrRmFyMEFiNXNUalZSaUx5eW9nelplemlkTjlWRTRKMHlDWTZr?=
 =?utf-8?Q?lV3/dhcIEdrHNeLrqH2fdvGX9rcQ2JWVGzEtgF3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c18b4b-33fb-421f-be45-08d8efc1e293
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:12:08.3369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cabZtvTuF+trSM1U43B7eKjPhVK/mGFL32mQEKPIyo7nukGV3dVQh1qOeNP1lKs2yx6ZcMgwc54as0NZ+TKRmPWGKdhdozj/KX58LTAbrMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1777
Received-SPF: pass client-ip=40.107.8.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

ping. Do we want it for 6.0?

19.03.2021 13:08, Vladimir Sementsov-Ogievskiy wrote:
> Look at 03 for the problem and fix. 01 is preparation and 02 is the
> test.
> 
> Actually previous version of this thing is
>     [PATCH v2(RFC) 0/3] qcow2: fix parallel rewrite and discard
> 
> Still
>     [PATCH v3 0/6] qcow2: compressed write cache
> includes another fix (more complicated) for the bug, so this is called
> v4.
> 
> So, what's new:
> 
> It's still a CoRwlock based solution as suggested by Kevin.
> 
> Now I think that "writer" of the lock should be code in
> update_refcount() which wants to set refcount to zero. If we consider
> only guest discard request as "writer" we may miss other sources of
> discarding host clusters (like rewriting compressed cluster to normal,
> maybe some snapshot operations, who knows what's more).
> 
> And this means that we want to take rw-lock under qcow2 s->lock. And
> this brings ordering restriction for the two locks: if we want both
> locks taken, we should always take s->lock first, and never take s->lock
> when rw-lock is already taken (otherwise we get classic deadlock).
> 
> This leads us to taking rd-lock for in-flight writes under s->lock in
> same critical section where cluster is allocated (or just got from
> metadata) and releasing after data writing completion.
> 
> This in turn leads to a bit tricky logic around transferring rd-lock to
> task coroutine on normal write path (see 03).. But this is still simpler
> than inflight-write-counters solution in v3..
> 
> Vladimir Sementsov-Ogievskiy (3):
>    qemu-io: add aio_discard
>    iotests: add qcow2-discard-during-rewrite
>    block/qcow2: introduce discard_rw_lock: fix discarding host clusters
> 
>   block/qcow2.h                                 |  20 +++
>   block/qcow2-refcount.c                        |  22 ++++
>   block/qcow2.c                                 |  73 +++++++++--
>   qemu-io-cmds.c                                | 117 ++++++++++++++++++
>   .../tests/qcow2-discard-during-rewrite        |  99 +++++++++++++++
>   .../tests/qcow2-discard-during-rewrite.out    |  17 +++
>   6 files changed, 341 insertions(+), 7 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
>   create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out
> 


-- 
Best regards,
Vladimir

