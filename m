Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E44660FE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 10:58:34 +0100 (CET)
Received: from localhost ([::1]:51850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msirI-0001cq-Rt
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 04:58:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1msinX-0006Jf-9G; Thu, 02 Dec 2021 04:54:41 -0500
Received: from [2a01:111:f400:7d00::71b] (port=23521
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1msinS-0003pE-T3; Thu, 02 Dec 2021 04:54:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpmbfgIi6HpU00paJ7JBdpfDRjGqo9Uan3vXcaubNm6LBSpZFPJInMlW6I4waVrdZQgqdAoZLRHPAWzBSTgwBx0fgWP3ITIxW8yf4CoDik8PgjsDjRvF7uN+L4VtrSC3RDX906R6eSA/iTx4dRw5H5xzujen/jBKADjDCiaj4hbStvrtAYGUFdDCGTHg8wHhzlUXw/Y5xJ5GcrZLdABC/tl6lQPAJUTeQyAcDIS6mbVrvLZN13Lg6cpPRCI1aW5I6XEUZELOBSnBWhmqofK2ZSxoWzddDBntediiDj8EJ9qj98/nshqSY9Vo4S2/Ypqc1FtjDNagGYgAYsiVTi0CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIycyKAdZMswifiEzC6/22GsLRESpNIXZ5D4OI27v78=;
 b=H4xNi2HgT2HS2JwkOxaqJluEJfX+mY4uIUjtqcKxanxhXUCBYxgyqyptJRYwmISx4xcLPqEgUWoPemmDlqa6fomT+avmbTTU4nXafbv+7uo6O9eZxSoFPab+MwReYTZ+QrV/HDr60NDgcZwzj2hBtN28DF92H2JCDyyHHktYOqsn83aAwoY3Y+f5WB9pXEoRY/TdCobIMexxOOh/bUcJNuBfo8fPtqsLGjYZ1lniojNlrpw8xncWX871H16q1D5W6bvZYUNHddAa5ZujpklUgOcooP9odNEV/RdQYs3N1NlY5YXdLpxLC/a4pUSGTbvvwZ3YPfYpWeF1nvRDf9JuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIycyKAdZMswifiEzC6/22GsLRESpNIXZ5D4OI27v78=;
 b=FeHfbxjq4wA7Btg0NSiv5wow63kiND5tKLURGpi6jLRwyg06tc131qS4W2kaG1hrYPB9wNLBtFE+Cr5HaX4nY1RfFpA3EERTFBQftQEeQNGz2Vt07wI65IzGol/zRwyd4hlVdwEV6zi/bnas10iwbdWHBFvSJuXs1obR7NqavLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6785.eurprd08.prod.outlook.com (2603:10a6:20b:309::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Thu, 2 Dec
 2021 09:54:31 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 2 Dec 2021
 09:54:31 +0000
Message-ID: <baf86cd2-7b88-7206-a215-a9ed91c16fa2@virtuozzo.com>
Date: Thu, 2 Dec 2021 12:54:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits
 cleanly in some corner case
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Rao, Lei" <lei.rao@intel.com>
Cc: "Zhang, Chen" <chen.zhang@intel.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211201075427.155702-1-lei.rao@intel.com>
 <Yac8B76dAulyx+2T@redhat.com>
 <DM8PR11MB5640D2F156E53A0CD644AC71FD689@DM8PR11MB5640.namprd11.prod.outlook.com>
 <a1706788-2f28-9948-f68f-a6fd51b81fa3@virtuozzo.com>
 <836f8fe3-5262-d179-a66a-325935ec7005@intel.com>
 <YaiJgpEahjc1OyR4@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YaiJgpEahjc1OyR4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.226) by
 AS8PR05CA0014.eurprd05.prod.outlook.com (2603:10a6:20b:311::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 09:54:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba90c6b0-517a-42e5-7e45-08d9b579bc71
X-MS-TrafficTypeDiagnostic: AM9PR08MB6785:
X-Microsoft-Antispam-PRVS: <AM9PR08MB6785CE32051069E9096E79CCC1699@AM9PR08MB6785.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uk0lyUu0sfLZLVXuPL9VcmrcTnlvspej1pzo5I+5/+mJK88DYiwK2yB82I0s8aVmCdvdTYXGUsvkS4JycuLu4Y+IWKFlj5L+gtAW9ma5dOJpY/GfvATQIee3O3X2wDHcZ0y/qVuR+p7dhzAytkFLCrO8HiAcMw8fOQv5XP7rdy+/28lV1Szeo9RZKLUxPulOVBEp5PLesUwltb/7bfE+7MO00zyZdipI6XBeCGeQjpgjL98KCzC2kLXHCin/e5YsU4f6tu4snMEIFm1JdW8I2l29Tl3YNdBtWAsZLIqlmFKtp/ow37BC96zKqrKF9AsW+YaHZfLWZ8/kG1gnLJ50Xr00/zjHwyEJlhQdDtVViAQimUhsF7Cv+6BjyueMvjAcpjvwfkkFl1HZVuTZK8VK9NTOjMHW50ozZ8lwFUltH/0S8ULF65d0vbGdV2Bj063eFS2A6EpHvUg14RxUybhueGm/NN18BTOzgGCAiXpWYyI+BZvpwtUuE5HScc+vhh+XPkYuQufzNW4QOZWMlg/IgOV2qU/qXbGJV+rTHrp8Eul3YWtv5+jFO4d/sFdsjXojCW7HX/LZYA4MHK1KaMXp/w+HGQjMRQXNXlK9OXLDXyJ5pSH6f/gZ4xEC/7baSJzL9ob+QpapTFlS6wKOZVNJxs4Wcfcz4MDLJRnGaY2UckpYssdx74e2EuIjilrCr/5tVePAQvBgB+Cw2Jde1fyX7J92UzorG/eZr8+xo7k3wwrHunDurDs09mfnPcLzahXKWjncXD86RGtwhaSOdFl4rlcWTFGOpe9oRfGvQwJ+I9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6486002)(26005)(53546011)(83380400001)(16576012)(36756003)(316002)(2906002)(110136005)(54906003)(5660300002)(66476007)(38350700002)(8936002)(66946007)(4326008)(30864003)(956004)(508600001)(2616005)(38100700002)(86362001)(8676002)(52116002)(66556008)(31686004)(31696002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9IUGZsVnhVYmk4MnQ3TzZjSVFFemh2UXFkdEZkUUJVZGpWNmlrU1NkQzA1?=
 =?utf-8?B?TExZcjJvRGxNNEJHUzRYK1J3ZkF3d2E5ZjNoZ0JtUkhKbDZpU0FPUUJkdXo0?=
 =?utf-8?B?THFUNmZBTWEzQjFHWk9Pc3FUZUZscXFReVhBQWovdmdaN1NmMXhjK1cvMGRR?=
 =?utf-8?B?SWxhajNWOFZ2VVFnL0NYdEZIdEJhd0dqb2VjTWY0eDBtdytRODIwanJWa2U0?=
 =?utf-8?B?YnZ0QksvZENDRitaZE4wek9IaWhVOCtJdjZDZCs0Q2s5emNYZWtCSlpuTGN6?=
 =?utf-8?B?a1VqZGpUL25EU29OT2tlT1VWTXA3QTdNSjRyVlg4VDJrZ3BaVDdFUHhIUUIv?=
 =?utf-8?B?R01kcU9BQmJac29TbldWNG5lOEZ0RnlHaERscWRVTVhmWHA2NjJtaXR5TG5T?=
 =?utf-8?B?MHR6ZVZiZGZDN0gzbEc1aUszbUwrOTZGNEIyU2pKSjJoY2RIZnJ6bGFvblQw?=
 =?utf-8?B?dEZ4S2lyeHZZYWd6bGcwdGV4MDVOTDZHa2JpUUg1S2FnY3RkMHlzRytFZzh1?=
 =?utf-8?B?NnBURythTUFnQUZhdnYxV2o3M3ZxRjFLemNQcG1VOFZROFFqNS8vNVROMVNH?=
 =?utf-8?B?K3VKZ2U2bG9yRzVpUlNycms3d3RSMmZ6QS94cENvR0txK2M1U1U4YTFLQ3hS?=
 =?utf-8?B?Qm05TUY4aHhqeEVEQVBLVlNHRzl3bnNVcVY3OXV5VEZ6NEszQzkrMmEwb2to?=
 =?utf-8?B?WEhWMk5oSHFKa1VYL0k4bnpvNFNPUDBZZ1BiS3JMRG90QnVUMHA3NktiMDA1?=
 =?utf-8?B?VHhKUGZ4UDZzaEpvUDhXb2lDQnllWUxhdmtTQmR4S3hVNGsxMzlweWREdnVt?=
 =?utf-8?B?dWRuYkxwTjZkenZtaGZIeTRCanpDMUZpUmtIalMzRGY2SlJyOXdxSG1haTJi?=
 =?utf-8?B?YjNHRVArUENnN3YrOHpXV0t3WlFwYUR1VVdFUTFlMUxnTW5UTzlwQ1h1WEdB?=
 =?utf-8?B?WENZY0RIREQybkdneXF2R29HRVV5Yyt1SlpBM2xTd3IrTjQyZk9MREJ4ZVdU?=
 =?utf-8?B?VFJkeXFabVNPQzJmTE96UXhVVXl0SjZNcm5OcTBqdk5YK05QK1FSUDNOYjls?=
 =?utf-8?B?aXhxY0g2UElpTUc0Nm5mUEN3dkIrNkJDQ3NSR2t0TUdWZkc3L1RVTlZOUTdx?=
 =?utf-8?B?bXVwd2pIdjJJbzR2RVU0YmlMVHk2cS9XWGJjZndFajc1ZTlmZjl5TW01SDIz?=
 =?utf-8?B?bE5sN3c2VGZTOU5wMnpyWHZXSnBxb0VDNjJKTHd5SGlGTDE0ZzRXeGZ5cTg4?=
 =?utf-8?B?cTk2bG4vd1J2WldoR2tvSXJOWHBjTlRQcFNIcWVDV2FxbEpHZERueGZrbWti?=
 =?utf-8?B?SWJrN3FncC9LTmRVSE8xckY4aDBsRCtZM1U3ck9WUmNpSzJzYWpFNTVvV1NN?=
 =?utf-8?B?ZEswcjlHWW9JU3NYYU1TUWhRajBxa3dpZnBBTktRMnBuUXBHUEVNcDhvaFVp?=
 =?utf-8?B?eDMvbERjRzFxY1NBNk4zNFZ1VncrN2Vkc2V2R2tVL0VlZGh2ckgvalZXek5Y?=
 =?utf-8?B?eHZ1WGhkejF6anpUT28vclU5UXU0M0g0bUR1ejJYQWNYa2h4OXJ5dWJxc3lF?=
 =?utf-8?B?YkorSjY2U3A1M3hSd2Nsa0dBVG1IYnVyeEpGWlU4c3RWMEVOYVF5M1RKV0tX?=
 =?utf-8?B?Ull1b2JBK2dLSzNpeTBBZ3JKWURuY0Q4U3hJV2NNKzZpaDd2MFBNY0VocStD?=
 =?utf-8?B?TmgyTy95SFlkTTBPQUVyeW5jbUszVHIzYm1xeFZMU2lqNFR2ZzdDZXB1ZWho?=
 =?utf-8?B?Sk96OVhBdGNGdTBiMDh2RHpZUHU3NElqYWZiMFMxOVE3ZnFoYjhhVEtnQWRV?=
 =?utf-8?B?NFpoMzREbHhmK2h4aGphMnNvaUlFSU9pcEdBb3gvNDZpeDJUTzd1OEdqdS9E?=
 =?utf-8?B?dm5xbGtGcEc2Qm1EMVA1TG1mRDVDTlBUa1hnS2NjTXNwcFVzOURlS3gzNk44?=
 =?utf-8?B?dmhLVHhRNmJjZ1ZtT1JBdzViZTFUcEt2OGVVd3B5aThScTlYT0xjV0NnODBD?=
 =?utf-8?B?UXRrUy9XUmNpZllUTnNsSGxBY0NCUFd3dXluSE9hNDZHVGVzcFc1WTN2d3dh?=
 =?utf-8?B?eW5FN0VQTUdONk1XMmxKVk14OVhOaHk5dmU0ekFzakJEVjRyR2VmZ2dWOG1q?=
 =?utf-8?B?Y1M2RlV1ZFZtR1ZWYlpRajFQOWJMRm1rWWx6dGQxUXFhSG4xbC9ORWpDNG5n?=
 =?utf-8?B?YXZ0U3RFNGtSci9IcjJydHRxdWlJYWtBcHVabzl5QVB5Vkxpcys2TFB3MmR6?=
 =?utf-8?Q?qf6RUFFYdWkPKD3ibyOV0+rbOh5H69qbngK1NV2+GM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba90c6b0-517a-42e5-7e45-08d9b579bc71
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 09:54:31.4068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcLFvm5O91rLrB1hHjO5sDVex8oF8H3T6Bmsbdat65lNwQiD/aIi4Jpfi3/EIPqY2SpoLWC78fzt/eqsO+t99ExUb0t0vr3HJsJ3N2nHGt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6785
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::71b
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::71b;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.3, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

02.12.2021 11:53, Daniel P. Berrangé wrote:
> On Thu, Dec 02, 2021 at 01:14:47PM +0800, Rao, Lei wrote:
>> Sorry, resending with correct indentation and quoting.
>>
>> On 12/1/2021 10:27 PM, Vladimir Sementsov-Ogievskiy wrote:
>>> 01.12.2021 12:48, Rao, Lei wrote:
>>>>
>>>>
>>>> -----Original Message-----
>>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>> Sent: Wednesday, December 1, 2021 5:11 PM
>>>> To: Rao, Lei <lei.rao@intel.com>
>>>> Cc: Zhang, Chen <chen.zhang@intel.com>; eblake@redhat.com; vsementsov@virtuozzo.com; kwolf@redhat.com; hreitz@redhat.com; qemu-block@nongnu.org; qemu-devel@nongnu.org
>>>> Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits cleanly in some corner case
>>>>
>>>> On Wed, Dec 01, 2021 at 03:54:27PM +0800, Rao, Lei wrote:
>>>>>       We found that the QIO channel coroutine could not be awakened in some corner cases during our stress test for COLO.
>>>>>       The patch fixes as follow:
>>>>>           #0  0x00007fad72e24bf6 in __ppoll (fds=0x5563d75861f0, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>>>>>           #1  0x00005563d6977c68 in qemu_poll_ns (fds=0x5563d75861f0, nfds=1, timeout=599999697630) at util/qemu-timer.c:348
>>>>>           #2  0x00005563d697ac44 in aio_poll (ctx=0x5563d755dfa0, blocking=true) at util/aio-posix.c:669
>>>>>           #3  0x00005563d68ba24f in bdrv_do_drained_begin (bs=0x5563d75ea0c0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:432
>>>>>           #4  0x00005563d68ba338 in bdrv_drained_begin (bs=0x5563d75ea0c0) at block/io.c:438
>>>>>           #5  0x00005563d689c6d2 in quorum_del_child (bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block/quorum.c:1063
>>>>>           #6  0x00005563d684328f in bdrv_del_child (parent_bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block.c:6568
>>>>>           #7  0x00005563d658499e in qmp_x_blockdev_change (parent=0x5563d80ec4c0 "colo-disk0", has_child=true, child=0x5563d7577d30 "children.1", has_node=false, node=0x0,errp=0x7fff3cf5b960) at blockdev.c:4494
>>>>>           #8  0x00005563d67e8b4e in qmp_marshal_x_blockdev_change (args=0x7fad6400ada0, ret=0x7fff3cf5b9f8, errp=0x7fff3cf5b9f0) at qapi/qapi-commands-block-core.c:1538
>>>>>           #9  0x00005563d691cd9e in do_qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true, errp=0x7fff3cf5ba98)
>>>>>               at qapi/qmp-dispatch.c:132
>>>>>           #10 0x00005563d691cfab in qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true) at qapi/qmp-dispatch.c:175
>>>>>           #11 0x00005563d67b7787 in monitor_qmp_dispatch (mon=0x5563d7605d40, req=0x7fad64009d80) at monitor/qmp.c:145
>>>>>           #12 0x00005563d67b7b24 in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
>>>>>           #13 0x00005563d69754c2 in aio_bh_call (bh=0x5563d7473230) at util/async.c:89
>>>>>           #14 0x00005563d697555e in aio_bh_poll (ctx=0x5563d7471da0) at util/async.c:117
>>>>>           #15 0x00005563d697a423 in aio_dispatch (ctx=0x5563d7471da0) at util/aio-posix.c:459
>>>>>           #16 0x00005563d6975917 in aio_ctx_dispatch (source=0x5563d7471da0, callback=0x0, user_data=0x0) at util/async.c:260
>>>>>           #17 0x00007fad730e1fbd in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
>>>>>           #18 0x00005563d6978cda in glib_pollfds_poll () at util/main-loop.c:219
>>>>>           #19 0x00005563d6978d58 in os_host_main_loop_wait (timeout=977650) at util/main-loop.c:242
>>>>>           #20 0x00005563d6978e69 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
>>>>>           #21 0x00005563d658f5ed in main_loop () at vl.c:1814
>>>>>           #22 0x00005563d6596bb7 in main (argc=61, argv=0x7fff3cf5c0c8,
>>>>> envp=0x7fff3cf5c2b8) at vl.c:450
>>>>>
>>>>>       From the call trace, we can see that the QEMU main thread is waiting for the in_flight return to zero. But the in_filght never reaches 0.
>>>>>       After analysis, the root cause is that the coroutine of NBD was not awakened. Although this bug was found in the COLO test, I think this is a
>>>>>       universal problem in the QIO module. This issue also affects other modules depending on QIO such as NBD. We dump the following data:
>>>>>       $2 = {
>>>>>         in_flight = 2,
>>>>>         state = NBD_CLIENT_QUIT,
>>>>>         connect_status = 0,
>>>>>         connect_err = 0x0,
>>>>>         wait_in_flight = false,
>>>>>         requests = {{
>>>>>             coroutine = 0x0,
>>>>>             offset = 273077071872,
>>>>>             receiving = false,
>>>>>           }, {
>>>>>             coroutine = 0x7f1164571df0,
>>>>>             offset = 498792529920,
>>>>>             receiving = false,
>>>>>           }, {
>>>>>             coroutine = 0x0,
>>>>>             offset = 500663590912,
>>>>>             receiving = false,
>>>>>           }, {
>>>>>             ...
>>>>>           } },
>>>>>         reply = {
>>>>>           simple = {
>>>>>             magic = 1732535960,
>>>>>             error = 0,
>>>>>             handle = 0
>>>>>           },
>>>>>           structured = {
>>>>>             magic = 1732535960,
>>>>>             flags = 0,
>>>>>             type = 0,
>>>>>             handle = 0,
>>>>>             length = 0
>>>>>           },
>>>>>           {
>>>>>             magic = 1732535960,
>>>>>             _skip = 0,
>>>>>             handle = 0
>>>>>           }
>>>>>         },
>>>>>         bs = 0x7f11640e2140,
>>>>>         reconnect_delay = 0,
>>>>>         saddr = 0x7f11640e1f80,
>>>>>         export = 0x7f11640dc560 "parent0",
>>>>>       }
>>>>>       From the data, we can see the coroutine of NBD does not exit normally when killing the NBD server(we kill the Secondary VM in the COLO stress test).
>>>>>       Then it will not execute in_flight--. So, the QEMU main thread will hang here. Further analysis, I found the coroutine of NBD will yield
>>>>>       in nbd_send_request() or qio_channel_write_all() in nbd_co_send_request. By the way, the yield is due to the kernel return EAGAIN(under the stress test).
>>>>>       However, NBD didn't know it would yield here. So, the nbd_recv_coroutines_wake won't wake it up because req->receiving is false. if the NBD server
>>>>>       is terminated abnormally at the same time. The G_IO_OUT will be invalid, the coroutine will never be awakened. In addition, the s->ioc will be released
>>>>>       immediately. if we force to wake up the coroutine of NBD, access to the ioc->xxx will cause segment fault. Finally, I add a state named force_quit to
>>>>>       the QIOChannel to ensure that QIO will exit immediately. And I add the function of qio_channel_coroutines_wake to wake it up.
>>>
>>> If qio_channel_shutdown() can't kill request that is in qio_channel_write_all() - it's not a reponsibility of nbd driver, qio channel layer should take care of this..
>>>
>>> Or, you probably need some keep-alive settings set up.
>>>
>>>>>
>>>>> Signed-off-by: Lei Rao <lei.rao@intel.com>
>>>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>>>> ---
>>>>>    block/nbd.c          |  5 +++++
>>>>>    include/io/channel.h | 19 +++++++++++++++++++
>>>>>    io/channel.c         | 22 ++++++++++++++++++++++
>>>>>    3 files changed, 46 insertions(+)
>>>>>
>>>>> diff --git a/block/nbd.c b/block/nbd.c index 5ef462db1b..5ee4eaaf57
>>>>> 100644
>>>>> --- a/block/nbd.c
>>>>> +++ b/block/nbd.c
>>>>> @@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>>>>>        assert(!s->in_flight);
>>>>>        if (s->ioc) {
>>>>> +        qio_channel_set_force_quit(s->ioc, true);
>>>>> +        qio_channel_coroutines_wake(s->ioc);
>>>>>            qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH,
>>>>> NULL);
>>>>
>>>> Calling shutdown here should already be causing the qio_chanel_readv_all to wakeup and break out of its
>>>> poll() loop. We shouldn't need to add a second way to break out of the poll().
>>>>
>>>> Calling shutdown can wake up the coroutines which is polling. But I think it's not enough. I tried to forcibly wake up the NBD coroutine,
>>>> It may cause segment fault. The root cause is that it will continue to access ioc->xxx in qio_channel_yield(), but the ioc has been released and set it NULL such as in
>>>> nbd_co_do_establish_connection(); I think call shutdown will have the same result. So, I add the force_quit, once set it true, it will immediately exit without accessing IOC.
>>>>
>>>
>>> What do you mean by "the NBD coroutine" and by "forcibly wake up"?
>>>
>>> In recent Qemu there is no specific NBD coroutine. Only request coroutines should exist.
>>>
>>> Forcibly waking up any coroutine is generally unsafe in Qemu, most of the code is not prepared for this, crash is normal result for such try.
>>>
>>> Also, there is good mechanism to debug coroutines in gdb:
>>>
>>> source scripts/qemu-gdb.py
>>> qemu coroutine <coroutine pointer>
>>>
>>> - it will dump stack trace of a coroutine, it may help.
>>>
>>> Also, to find coroutines look at bs->tracked_requests list, all requests of bs are in the list with coroutine pointers in .co field.
>>
>> I am sorry for the unclear description. The NBD coroutine means the request coroutines.
>>
>> About "the forcibly wake up" I just set the receiving to true before qio_channel_writev_all() in nbd_co_send_request()
>> to ensure that the request coroutines can be awakened by nbd_recv_coroutine_wake_one(). But that's just a test.

I'm not sure that it's safe. On nbd_channel_error() we call qio_channel_shutdown() - it should wake up everything that sleep in qio_channel code. The .receiving field is only for nbd.c specific internal yield point.

Could your change itself lead to the crash I'm not sure too.

Still, on normal execution paths, there shouldn't be a situation when some qio_channel_writev_full_all() is still executing during nbd_co_do_establish_connection(). If it is - it's a bug in nbd.c of course.

To check it without changing the .receiving field, you should print all stacks of nbd request coroutines at the point of qemu hang. What they all are doing?

If one of them is in nbd_co_do_establish_connection() and another is in nbd_co_do_establish_connection()  - that's a bug.

>>
>> The issue is, only waking up the request coroutine or shutdown the QIO is not enough because there will be a synchronization issue.
>> For example, When the NBD request coroutine is awakened in qio_channel_writev_full_all(), it will continue to access the ioc->xxx,
>> but the ioc has been set to NULL in nbd_co_do_establish_connection(); it will cause segment fault.

Could you provide a call stack of this segmentation fault? And coroutine stack of coroutine which is in qio_channel_writev_full_all() at the moment. And value of s->in_flight?

> 
> That is a serious bug. Nothing is permitted to free the QIOChannel while a
> qio_channel_writev_full_all API call (or any other I/O call is in progress).

I understand this.. There are only two paths that calls nbd_co_do_establish_connection():

If it's nbd_co_send_request() -> nbd_reconnect_attempt() -> nbd_co_do_establish_connection()

Then in nbd_co_send_request() we should have been waiting until s->in_flight becomes 0. And we are under mutex.. So there should not be any parallel qio_channel_writev_full_all() or any other qio_channel requests.

Another path is nbd_open() -> nbd_do_establish_connection(). Here for sure can't be any requests yet..

> 
> If multiple threads are involved, then each needs to be holding a reference
> the QIOChannel to stop it being freed while in use.
> 



-- 
Best regards,
Vladimir

