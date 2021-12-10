Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6724447085D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 19:18:24 +0100 (CET)
Received: from localhost ([::1]:47952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvkTP-0002jG-19
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 13:18:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvkRa-0000Vo-R5; Fri, 10 Dec 2021 13:16:32 -0500
Received: from mail-am6eur05on2119.outbound.protection.outlook.com
 ([40.107.22.119]:52160 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvkRW-00071p-J5; Fri, 10 Dec 2021 13:16:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF0TilI2y9TSr4XSG2fYTW7gvJRMSr7tLt2LkdWbLq/gtSGIZuG8sHZXNiB85eMutA+ZqcTxo99aH5hjEyacyOWwd2pjFMiltU9LueVsWCEhC1cgOmu4xZCM1K/bE66SXQbIwDXvUzwdLbisTX8xVecuVIg95qOKESP0Ek9apmxCf8FvJVgXMydk+wWNxZeLmKNaSqloY7XXbzvS0qFJYNi0JYJ1JlExaB+qn1EQYj+wnEHHgHi4Q/YEM+TKdIo3k1FzWU+AMJk4aKmAls1pmCsbq4gu0BkBl+bOdx7CW6G/SVds7xYvh0aAXjm+2dmDHGhPqiUTZd0cX0I314vzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s27WwMiZPa1DcRdgansxFpf02TQ2FgtS0UwSjX+sVY=;
 b=gZXVsesJsE89L/HlxChU+jt4V17owKoeh3kWi85FfNmPzpydM60JwfXfaDpErtOc9lhOxqzQjWAQ5KExDzLd18yOfCZEm3U+JRW0VRwkih3sz+HCUix9K4p3pl1nyi8aBJQd2cumjFNd1kmFIOT/SdPk7zLpTJSW3JH83qHRNnph+dDJo1dB9txTb3685mtoSCCtctA6YTvGUb0rZKN9uvDYLCOXzqQVzg/ht/pXVx/XAC9AIa+0RFPu/+jkjMa4MS10UTuT227tatdg4+pnwGk5NXPPQTWQvm2bA7aZx3oCo33UH+ELy1IwKzz21ZHQOlMiJZWP32Pyoh1J3HJbhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s27WwMiZPa1DcRdgansxFpf02TQ2FgtS0UwSjX+sVY=;
 b=O1eVGsJRUrsNncqqgGqMmpytZsAlai/RCMXzVh8qHf/QN/smVolyQ+K2oJT3XqqPHW1BFvTgolDQczOeJKNxkCVZrArsGqf4PgV4yr0G0BgnQNVCT0OroM4fbWjhFze/SiPlsk9i/32FLs9Vz7d19BzQfGnVl7R4wR5AEgUvSm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4962.eurprd08.prod.outlook.com (2603:10a6:208:15a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Fri, 10 Dec
 2021 18:16:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 10 Dec 2021
 18:16:14 +0000
Message-ID: <60a56a8d-87fc-dbaf-0ebf-cd551ce13f14@virtuozzo.com>
Date: Fri, 10 Dec 2021 21:16:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, libguestfs@redhat.com,
 nsoffer@redhat.com
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211203231434.3900824-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 18:16:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b67101db-9bf0-40f7-8af6-08d9bc092719
X-MS-TrafficTypeDiagnostic: AM0PR08MB4962:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4962D3707FCCFB0CD72A18FEC1719@AM0PR08MB4962.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTNEmKJnyd/Dl56QCSicQcGYAWwrGykiCVCPkZHm1iR1Q4HW3h9OC2EYNebtTjxa7IUQqZMfbnvBnsr6WRi5z26ov8HyL5oBRnp5QaJkSniGkLKW3Z4QTi4c7Bv+WToHiXPRQj3QH8T9O2c+6r7R4XI18lAMfkxDA7YKKhUTzjN8WDRO4fbi/DUrMxHbaUY0tEg26ado3hdIyL+nJ+NboUbfoIHhlgvTOBxs82J575DdGG2oNLHY1dxbbOOnqWvnZ6BokUpTj55l+aAlwdDnMbADv8sHs4Wnmg3aMYW/xFw0ZsuScsFdXs3ZtGFGDD1r6rLAGr2QOn7Om8TRoy3pThOqCavwOjhEv5Nme62TfeFoQz3XDzc+68mq96uzu1EbzR+KHwv7ycZ3ImOxa7Z7krFEHd4lb6sdM8siYmSMnSaClQqj5wFfsHOuW9baGqFmR4S4Z4kwfBDy/hMaAd3oFYCjIp7Wd0hhTo3vZpcyTSIzJVH//vfftgV64wwcdd1CR+zqAiPcmpeqfSELiHGqclAlY11idOmWaZfeunn4e9NF9fFgFkHZJt8rWj/8Q75jXTaaVWnWYlcs8p/3Pt5jRTmMpyFZljjCJu7AZPokpdLyztfACShy0EsgLaFrZNQyt5wmyl0Und9phAzcbcIuht3Sx+7tISn9Ead7TVyEHUyv0HNlj9gaaZ8yKJS4QmdKuf7EEq1kqwbZWhUILrOwIR1ZXC81dfgONBRYHhn+3LKVyFZguJcKxd0/hOfPW5Uc4ldSAyQ4q6MYV4hDl9nLhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(316002)(83380400001)(4326008)(31686004)(38100700002)(38350700002)(2906002)(66556008)(66476007)(508600001)(36756003)(6486002)(5660300002)(52116002)(8936002)(2616005)(956004)(8676002)(31696002)(66946007)(26005)(86362001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjZHVFEvMmlrdjVBT2Q4aTBPZTQ2ckZNUm5IZ3dVdCtpd1VMV1Z3aWJobDNJ?=
 =?utf-8?B?aCsvekpnb21WNmNLNlAvZWs2dG1XOG56RTRmM0cvUVROSkIvNURnUXVtdUxI?=
 =?utf-8?B?MktFellQV0lMM29zeDB5d3JGK1UzckZ2RlkxdTk0VmM5SlR4UCt0MytQaXpO?=
 =?utf-8?B?TDNrOTdRQm14YzRIZXJzZHVHbVl5bGlmTDBqVzhXUlRiOU0wTUNOOWJSbUpW?=
 =?utf-8?B?NmVvRVZvWTR0SGg2SEI4cGtZSklOMmtXREZva09pYnIyY3Jpcm5FWmV4SXQy?=
 =?utf-8?B?SWM4MGljbmNRYkxpTlZtc3AxOUlJRHVzRkZwSTVCL3E5THllejNja3hEOThN?=
 =?utf-8?B?SWU2OTRPeW92ajFDeExoN2s4a2d2L1ZkQllJRHB2OTJBb29tQXdtU3hES3Nk?=
 =?utf-8?B?UUNUOGZqcEdSK3hMVFV5Qlo1amsvaXByWU9rL0ppallGNmNqVGJ5NVlFQmVr?=
 =?utf-8?B?QmVFZXdDdXI4WmZCQnFFQWNLSFJySkJHNzRlZDVVbVFTYkFWRFg4MzBHRHlj?=
 =?utf-8?B?cWhBVUo2S1BTclA1azBXZ1VuV3VNVWU0QWdKTDBHRUUyajk1dzlLU2gxekdG?=
 =?utf-8?B?amc1NEp3N1YxRDI4MnRLR0xoZGZ0R0JTditpRkMxREc3QmZaZ3J3eTEvMGN1?=
 =?utf-8?B?YkJuWUFWa1g4VENQVDV6ZG9SM0h1eHFiZE9RRVZKZjBndENWZlF0YXFySkxx?=
 =?utf-8?B?clRJTzZhV3h2RHB4SWFoeFRKdHhnTVQ4MTdmbVB0WTkrdXU2a05RSjZFUkdY?=
 =?utf-8?B?YnV3R0lhN1Nqa2t4SFl2aDM0K2s2NVJWMlNnbSt0UFRqZTJqaG4xQkxnRVIr?=
 =?utf-8?B?clBoYjRPcnVQUmxqUm4rU3VLUEVMK3lheEZ2cGd2NDlXSUhiY1hBUlV3OU42?=
 =?utf-8?B?cGxSL3BicmJsMThVMU9RZGhMcVFMK2grUWllTWs1ZVVWMkdxTVlkQ2pWU1pE?=
 =?utf-8?B?RW5hazVRYkZNdTFORHp0dGdBWkt2T3ZOWlVPU3hvZVloMmdFTEFieEc2L1pL?=
 =?utf-8?B?Wko3K2JFNW1zOXl1T29oM1R4cWRkOEdIYjlNRldMSjdqaXBBNys1TUpEY2I5?=
 =?utf-8?B?RzBvZWVpSHlWcjdvR3NueHZiM25YMng1OGEvY05kam9mUE02SjVrTUQwcm1Q?=
 =?utf-8?B?c1lud3FTazRlZHFMMW4zRFltVjVwR2FMdTdoY0NQUVA0elRzN3dEYm0wQUM2?=
 =?utf-8?B?bDY0SkpKSGtTMHNnR0NQc201RHF1ZlhVM1NqekdFd2ZmT0xBUEpmUWZGdzBE?=
 =?utf-8?B?ZGJnOXovYmgzSm9RYTZYSEdvOURRajZUcXpTZmR1aWpjbldxR3lmUGtwQ205?=
 =?utf-8?B?bFZ1OWNpOHQwOXNrL3R4Y2Vuc1hxeEVNblpHV0VDNjRFNi9EbjduU003UlpR?=
 =?utf-8?B?V3U0L040QzMwQzVtSGl1VVhrZk9USFpDRkV0Y2dvcUhmN2hwczJMeUc3VXp6?=
 =?utf-8?B?ck9QRnZReWV4VWRNcHdEbEFORUk4NHNnRzE0aWV3S0k4WHNMM01pZFYxOHFs?=
 =?utf-8?B?UlJmelBCNW1vRWhKZVhJVEZkbFVUT1VBekMvK3grN1F1ekd1cGxmc2t5cko4?=
 =?utf-8?B?TU9KSkwyanVJT05mMmdqS2d1c3haeEFKUDdPMy9ac0VicFo5Lzh0VXJNZmxs?=
 =?utf-8?B?VWxPWW16Z0wxL2I5Tlk5NldFZldsNFJyY3p6MHM1TFhlRERRZGZSS1hFNXcw?=
 =?utf-8?B?TjVsU0xEeEVCS2xHUGlGOHpWeWdKa2M4QU5BSkd0VURERlZwTnl0REZtWjA1?=
 =?utf-8?B?b0FPQjQwUFJqMC9vYWxjZ0tSUHhhNml4KzJuSGZBM3d3dUNtMHFuRlJML0Mv?=
 =?utf-8?B?c3JtQ0l5dkVnTG90ZnNDc1hVa3RkQlhnbjhlWGthcFdZMG5ZWFltaEQ1YkVP?=
 =?utf-8?B?ZjlxTnRSWGtNNDRsQkNhc25TbXBDZ3lxdHNTSVpidzVyNEtFbXAyY0VoMUFv?=
 =?utf-8?B?MW8wcGN0bHVHZkRIdENvd0NCZlM5amhLVXBGb0JtS3FSZ3QwWW96dkxIMFFn?=
 =?utf-8?B?OStrTGNDWGdocW0rZkVqZ1pjTDJjNjBseHhFcVBRNDQ1SnRpL2N5cW5OdzJZ?=
 =?utf-8?B?S0lRNEs1ODdDZ3hRZVdYL2VqTkcxa2xCYzBXdXB4WFJZKzVncFJMaXlGNnpv?=
 =?utf-8?B?U0Z5VWNoc3UyRkdGR20waDlkYVZ4dExHSnMvdFF5Y3Q3NUpCeVVJYjluK1Bt?=
 =?utf-8?B?bjY5R1ZMb3ozbmpnR2lMT2pHQ01HTTRGN09WU0hXNmZJT25kUWY4TmhGTWtq?=
 =?utf-8?Q?1rVt6rG2EcvLBrcZYWQQ7bjeOC/tH9/4Zcj8jLm/kU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67101db-9bf0-40f7-8af6-08d9bc092719
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 18:16:14.7125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQqOoNJ3o1UnwLoqaMI/2acyIe7DnBX8N6kOreeYu834qBKJImuSXRT6X/XKv1BmFn2ZSr2G2PHXyK2vZ5tpNRVP32vaThym7ZT+slNQFok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4962
Received-SPF: pass client-ip=40.107.22.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

04.12.2021 02:14, Eric Blake wrote:
> Add a new negotiation feature where the client and server agree to use
> larger packet headers on every packet sent during transmission phase.
> This has two purposes: first, it makes it possible to perform
> operations like trim, write zeroes, and block status on more than 2^32
> bytes in a single command; this in turn requires that some structured
> replies from the server also be extended to match.  The wording chosen
> here is careful to permit a server to use either flavor in its reply
> (that is, a request less than 32-bits can trigger an extended reply,
> and conversely a request larger than 32-bits can trigger a compact
> reply).


About this.. Isn't it too permissive?

I think that actually having to very similar ways to do the same thing is usually a bad design. I think we don't want someone implement the logic, which tries to send 32bit commands/replies for small requests and 64bit command/replies for larger ones? Moreover, you don't allow doing it for commands. So, for symmetry, it may be good to be strict with replies too: in 64bit mode only 64bit replies.

Now we of course have to support old 32bit commands and new 64bit commands. But, may be, we'll want to deprecate 32bit commands at some moment? I'm not sure we can deprecate them in protocol, but we can deprecate them in Qemu at least. And several years later we'll drop old code, keeping only support for 64bit commands. Less code paths, less similar structures, simpler code, I think it worth it.


-- 
Best regards,
Vladimir

