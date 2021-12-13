Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EFF4722CA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 09:40:43 +0100 (CET)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwgsz-0006BG-FV
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 03:40:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwgr5-0005E3-P7; Mon, 13 Dec 2021 03:38:45 -0500
Received: from mail-vi1eur05on2111.outbound.protection.outlook.com
 ([40.107.21.111]:8673 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwgr1-0005iB-J0; Mon, 13 Dec 2021 03:38:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXrVv2y8bBTQKvwzBmI6xiqvEGgCmVRICplGZ+rbqQisWNB8RGGeq7QwfGtDZs4XMNRN8AHSt/bIgnfJPSWs7ZbbcB2hoEvq/STa0KItU/hJPW0hoQGamVlNaiQojRvygYg/Q/2pB4Blly+Lbdrm2NDlqqP3v6bA+r4INdh3aowZ2v5WJzP43dJOJul52dsG/vav8ToKmV/1XVx5Zo6wNgkle4/gEdhD+X3QBjDqQaD8sUcLUStnKAkPTVy4FkHARzavjuSmjbZ0rGF6gx65+/G6xX4R8y6fXUewzKySA+QEGsVQHaPVc1xO+Xch9OCIL0ElrgZjIh8BIqEEvc59Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRdQfr5KOK+iUeG0Mp5iu+TAPjl2wfrzj2oDVpKXJmA=;
 b=khULAeReLsbE1rYQVWsv+tnqQK658grgd/TNfg1OAFxvwosWLfRvMzWJcSLu3ihrs6rH6limPAwOfOh7aea+6zQnWhUSnqbHAJdiSLNe2oAbbfVxAPhG79t4Mw0bkBXtLb8XFeD0uxwAWmtkudyolenARYxNbNXNrjdf2SRDgruOTE54Gd9OixFJu490BYnH0LmOJuxNyZ1Z9uGi0zIyJA69ZrOtrey0pU7qEhfR71YmUv0Twqlzi2t240bRmcuRKAXIEVZPfLSsXN1FtO5mJUmZ3Hv55hztVQPpqfmhTieohK3J74CfYlJ2tx2vnR+4I3T0XI62HP+bSBIpi+0Ibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRdQfr5KOK+iUeG0Mp5iu+TAPjl2wfrzj2oDVpKXJmA=;
 b=cvTd/BUw8Apcoz5w8v2Adj0IR7u8Ssj1wwHyKNo9J6LsiLopRB1VxZo7EhRd/ByHFd+MEv0I1gSr0XH8S0ireidrmIVguqpdnbkPubswXvmiqa8q0V0WI+je6DNp9/wPUR9bkWQmmfMZIW81uKA730wEhy4pJZ+Fl+qWw0XcnVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM6PR08MB4643.eurprd08.prod.outlook.com (2603:10a6:20b:c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 13 Dec
 2021 08:38:30 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 08:38:30 +0000
Message-ID: <ad009f7d-7a9c-9c89-47c6-46bc8e8091a2@virtuozzo.com>
Date: Mon, 13 Dec 2021 11:38:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits
 cleanly in some corner case
Content-Language: en-US
To: "Rao, Lei" <lei.rao@intel.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
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
 <baf86cd2-7b88-7206-a215-a9ed91c16fa2@virtuozzo.com>
 <22da77b0-114a-49b0-9ec5-588556697fa2@intel.com>
 <3bfce568-8ec4-420e-482d-8af30de19ab6@intel.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <3bfce568-8ec4-420e-482d-8af30de19ab6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0121.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::12) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69ee5569-ff1b-4ebd-0365-08d9be13f0de
X-MS-TrafficTypeDiagnostic: AM6PR08MB4643:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB464305F1515B91F5B3B81718C1749@AM6PR08MB4643.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nOanQr2Sf7/rK9ftEi/1i2Od37fWotDl0hEZY+NJvgaQ4agnb/SW/HQcLe8wrDpVgqmZ0QWBHDMDvN5nCOk8G1emgm5zA10ZyWLzU/EyhTVe8l2o9O9/v3/U3EbbBik3hAM9pyYQYdE1Ofo5T8YHy9I4TZUYBANkj6SKNxjFyHDmITuV7GEIJqLgZaF/Nok+WrwTwp2ePNG+o0jGkYvmASFSYcjYLcbVvSh4KcFLpE2qrwTtY33cQaAizq4vfyMAVabyuVUZzr446flYNvtEPW4PawMjFM5g7DouNLT8puNSXcOgKDrTqOB8/iPLor9xxkduDo8xwv4ehW9UJxMiEGoxsfNc0D0MIHsyBTOYPwBaTW4emJTvRily4Qgj3vxuA1fTb9iOjwOGZirUKuak4/N06jHgShi1Vds7M16l+MMbp8bB1GST+1fMAqNh8jCMnYWCwoTRag48srb5jV7ntj04wh706L5L4OuVQkWkxpdNpgNYYIumQjmPkM1MN7oo4IFKyGdTlqrCZvVogwjouG3RB2WAmZMvGXUz+LCAJmhZ3yMkL4ey5n+LDbxtI/BLkSZozTHfIswDoD2HcEWNNx8CmjT4IdQ5q/yf5qhS/6sPlUcJ43ArrSZ6YvC4JHGO4UoHP7VGXFJUGSERQrdCjMdaZjZB3g3lin2DguWxd/VlIwy5FkPSduRWu1O95mzsqiuHrjoo4J2eTFZbVeXGGLV5kV7ULOykfuYLw8MIg5icvt9OH0WYIJbkpIJo+nFBbl2XLn3ciXVPV/Dknmj4Bw04AI6bzeOdiIoNeUvaIYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(31686004)(66946007)(83380400001)(5660300002)(66476007)(186003)(6486002)(2616005)(86362001)(38100700002)(36756003)(508600001)(316002)(52116002)(66556008)(110136005)(30864003)(38350700002)(6512007)(26005)(2906002)(54906003)(8936002)(8676002)(6506007)(53546011)(31696002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmJBZmNudEFEK1YxVk56bGF1ZjN1blhIWnUvRnBUWkVxZG1qTzJPVmZFbndY?=
 =?utf-8?B?cmlqMlhaeS9ockRFMkUrY1ppTE5KTWJlUW12c1BwMzZITnlvaVROeC9tbGJR?=
 =?utf-8?B?TEFiTDVHN3FYZStrT2VIWnhselQyVzY3dkREaG9UWG5YN3NCaWl1NnZSeHRP?=
 =?utf-8?B?Y2JoL2lrMEdyMS9wZFpkSURISndwbFpPdlRHS2I1Q0FDVG5oUDB5dWFTZkFx?=
 =?utf-8?B?d1VNVlI1QUNOREpneEduU0VIS2lpUXAzbGFwTHo3UEh2OGVXK2RsWmN4ejRk?=
 =?utf-8?B?aVZ2aXlMMVY1YUlXY3R1cU14QXkyRFhNa0h4cXg5OFpBSmNtWjVBeFdSQlV0?=
 =?utf-8?B?ZXNVN0V2SXh1eE1TZ1JES1hQRVVPc2JWYXlhMzFZckxhQkQrbHpNVmRIM2ZC?=
 =?utf-8?B?WU5Rb1FLOGQvWjVsbHFwRHU1Q1MzekNTS3BodUprRzNibUFRbmhMS215S1BN?=
 =?utf-8?B?Zm1ucjl3amIvaWZwK0QvM3o1ek1PTTJzalVEUUJEVFVCTHFZWHhMUzFwU05O?=
 =?utf-8?B?cUZoZ1RlRHNaU3NLOGlpRUFwZTFnbGZnK1lDdGtYc1dqd2VqRGY1eFp2ZDcz?=
 =?utf-8?B?bE9tcEV6cTY3M0NGVFJmK3d5US9aNzdWVzliVms1WFBpcDM4ZmpyV1hPblU1?=
 =?utf-8?B?djI0YjZOc2hUaHRBZnp4M0RmSHN3eXlZL2QxNjFrVHpSMHBrQ05IT0NYZjZo?=
 =?utf-8?B?Rm1TU2wvQ2YzemVmV1dMWjg4TnA5a01yc0NQR09IUytrSk5KUnhPZE9ubmtj?=
 =?utf-8?B?VXI0NTU4enl2STUrbW5nTk1NYkVlMVFJQ2FYTlRoS1FOekZ6a1ZMNVN0K0hO?=
 =?utf-8?B?eU1lRlMzbndIcm5BM1dMWGJEKzV5Y2lORUk1dFJrNWQvTU5zL0F1OFpKYTRL?=
 =?utf-8?B?MXRzUFdJeUt2dFJkOGtFWWhVeWFsR1JTMFNxd2FjUXN0dVpRamtnV2EvSVp6?=
 =?utf-8?B?b096OVlZREcvckNzVnlpa0dJdFZWTGQ2RmMwMEl5RFcxS3lINmYzVjhWaVVl?=
 =?utf-8?B?aDJPNmwvUUhKazQ1U2pTeTlXWFkrMW9qZm45bEZvOUFWY1djeXQ5djBpNFpK?=
 =?utf-8?B?V28zNzZFUEZaWTUraFEvbER3VmdrblZ1bnJ5d01nV0h6UytIa2VPcFlpdGtm?=
 =?utf-8?B?QmN6cFAzcCtnR3JoMXYvSk9VVDZqN2FBanRCdEJaUU9IYnlhd0k2QVJwbVA5?=
 =?utf-8?B?RUxoU1BNSkZHWE9HL2E3S21ubHZqSkN0TGpGeWJGUjloVkExWU1xbHZvbWNa?=
 =?utf-8?B?YmVKOVZqWHA5SmI4cXE5QitQSjlpS0FXdUIybnpOT3BLZjNmWXk0M2ZxbFdG?=
 =?utf-8?B?aUZWblltcGQ3TmRxSGFYeTZpOXp4RmdVK3hNRFhMOVdZM3NMK3VSTEVoNHZE?=
 =?utf-8?B?NlJ5dFUzQllVZDViK2dMTDZ4RW1uTWg3OUQ1RnFFU1BxNXpoNktaSTlYMHAx?=
 =?utf-8?B?Tkx0V3JyR0RPb0ZBN1RxZklZeHBsZ0JGejluUkpqZ2p4OHBZSklEWndTREhK?=
 =?utf-8?B?K3dmamFjUVIveFR3MjlkamxRTVRoSEw5UXBJbnRJdnk1N25vampBZ3pPSnJF?=
 =?utf-8?B?L2hXbk1SUFF0eWdtTEFaalhBcml2OEdtdVhqa256d0wveTh6Q1dVNklrV2lJ?=
 =?utf-8?B?K2JNcGRYeE8zV0VQaFhyeWJGdVVCeFZtclc3alg2R1VSakRRaUg2QkxKZ25n?=
 =?utf-8?B?ZlNjUWNvbkt2L3lmcU5Xd0F2Rlh0cGd1bjkraTJrMzhHMFVKWmhzOVVmYU1n?=
 =?utf-8?B?NXEyMGJ4cUwxeDFhb1NudnUwMmkraWpSUzZzM2ZrelJMcDYzWkFBMnk3ZnFh?=
 =?utf-8?B?VzdHd3ZFUHdtZW8zYlVvSzJEUFMvbmxabm5pNmhaQ1BpQXlSaGNmWXpobWJt?=
 =?utf-8?B?UnlTQklIYU1iTGMybnVlZDJOMTFjaGN0MXhOZDJZSU1NOUFPSUg0S2t6bEx0?=
 =?utf-8?B?TCt1V0hXUm9NVVZ4NDR6b1hXMXdxMmhZQjhtY2xDTFZ3WWFKa1J1czBwLy9W?=
 =?utf-8?B?U2RnNEdnQjJOLzAwVk9vVUU4S08zRVVmcUJlQkNBWjdnUzRVV3lzZHhLY0x3?=
 =?utf-8?B?QWRjaW52VGc1Wjllc0kyYzZ6S05YQndCdWZaU1RHWXBiZit3VWdiRU9HOUkz?=
 =?utf-8?B?UEpQbHV4eTVGQzZFNXVFSXFpS1dMaUt6aWdoenp1RVptNEtGd2hUeGNqamR4?=
 =?utf-8?B?QWxTMXgvN0x6OWRSb1grZDNFcUx5dGlWNFFObm9ZdjRpZGlJbG9Vdmw0clVv?=
 =?utf-8?B?UjdrY2pXRGIrUmtxMnU3dG92T3hRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ee5569-ff1b-4ebd-0365-08d9be13f0de
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 08:38:30.5727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMNqr3+LCEdTBqLerfqNm30SPawdGeII9WwhtDMyWGoxzWenDO/KizbRoHXrEslf1hkGqwcEi5WgbknxXyXk2pxcon/KvD5bVWTtBMzUDFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4643
Received-SPF: pass client-ip=40.107.21.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

13.12.2021 11:02, Rao, Lei wrote:
> 
> 
> On 12/3/2021 9:26 AM, Rao, Lei wrote:
>>
>>
>> On 12/2/2021 5:54 PM, Vladimir Sementsov-Ogievskiy wrote:
>>> 02.12.2021 11:53, Daniel P. Berrangé wrote:
>>>> On Thu, Dec 02, 2021 at 01:14:47PM +0800, Rao, Lei wrote:
>>>>> Sorry, resending with correct indentation and quoting.
>>>>>
>>>>> On 12/1/2021 10:27 PM, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> 01.12.2021 12:48, Rao, Lei wrote:
>>>>>>>
>>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>>>>> Sent: Wednesday, December 1, 2021 5:11 PM
>>>>>>> To: Rao, Lei <lei.rao@intel.com>
>>>>>>> Cc: Zhang, Chen <chen.zhang@intel.com>; eblake@redhat.com; vsementsov@virtuozzo.com; kwolf@redhat.com; hreitz@redhat.com; qemu-block@nongnu.org; qemu-devel@nongnu.org
>>>>>>> Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits cleanly in some corner case
>>>>>>>
>>>>>>> On Wed, Dec 01, 2021 at 03:54:27PM +0800, Rao, Lei wrote:
>>>>>>>>       We found that the QIO channel coroutine could not be awakened in some corner cases during our stress test for COLO.
>>>>>>>>       The patch fixes as follow:
>>>>>>>>           #0  0x00007fad72e24bf6 in __ppoll (fds=0x5563d75861f0, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>>>>>>>>           #1  0x00005563d6977c68 in qemu_poll_ns (fds=0x5563d75861f0, nfds=1, timeout=599999697630) at util/qemu-timer.c:348
>>>>>>>>           #2  0x00005563d697ac44 in aio_poll (ctx=0x5563d755dfa0, blocking=true) at util/aio-posix.c:669
>>>>>>>>           #3  0x00005563d68ba24f in bdrv_do_drained_begin (bs=0x5563d75ea0c0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:432
>>>>>>>>           #4  0x00005563d68ba338 in bdrv_drained_begin (bs=0x5563d75ea0c0) at block/io.c:438
>>>>>>>>           #5  0x00005563d689c6d2 in quorum_del_child (bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block/quorum.c:1063
>>>>>>>>           #6  0x00005563d684328f in bdrv_del_child (parent_bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block.c:6568
>>>>>>>>           #7  0x00005563d658499e in qmp_x_blockdev_change (parent=0x5563d80ec4c0 "colo-disk0", has_child=true, child=0x5563d7577d30 "children.1", has_node=false, node=0x0,errp=0x7fff3cf5b960) at blockdev.c:4494
>>>>>>>>           #8  0x00005563d67e8b4e in qmp_marshal_x_blockdev_change (args=0x7fad6400ada0, ret=0x7fff3cf5b9f8, errp=0x7fff3cf5b9f0) at qapi/qapi-commands-block-core.c:1538
>>>>>>>>           #9  0x00005563d691cd9e in do_qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true, errp=0x7fff3cf5ba98)
>>>>>>>>               at qapi/qmp-dispatch.c:132
>>>>>>>>           #10 0x00005563d691cfab in qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true) at qapi/qmp-dispatch.c:175
>>>>>>>>           #11 0x00005563d67b7787 in monitor_qmp_dispatch (mon=0x5563d7605d40, req=0x7fad64009d80) at monitor/qmp.c:145
>>>>>>>>           #12 0x00005563d67b7b24 in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
>>>>>>>>           #13 0x00005563d69754c2 in aio_bh_call (bh=0x5563d7473230) at util/async.c:89
>>>>>>>>           #14 0x00005563d697555e in aio_bh_poll (ctx=0x5563d7471da0) at util/async.c:117
>>>>>>>>           #15 0x00005563d697a423 in aio_dispatch (ctx=0x5563d7471da0) at util/aio-posix.c:459
>>>>>>>>           #16 0x00005563d6975917 in aio_ctx_dispatch (source=0x5563d7471da0, callback=0x0, user_data=0x0) at util/async.c:260
>>>>>>>>           #17 0x00007fad730e1fbd in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
>>>>>>>>           #18 0x00005563d6978cda in glib_pollfds_poll () at util/main-loop.c:219
>>>>>>>>           #19 0x00005563d6978d58 in os_host_main_loop_wait (timeout=977650) at util/main-loop.c:242
>>>>>>>>           #20 0x00005563d6978e69 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
>>>>>>>>           #21 0x00005563d658f5ed in main_loop () at vl.c:1814
>>>>>>>>           #22 0x00005563d6596bb7 in main (argc=61, argv=0x7fff3cf5c0c8,
>>>>>>>> envp=0x7fff3cf5c2b8) at vl.c:450
>>>>>>>>
>>>>>>>>
>>>>>>>> Signed-off-by: Lei Rao <lei.rao@intel.com>
>>>>>>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>>>>>>> ---
>>>>>>>>    block/nbd.c          |  5 +++++
>>>>>>>>    include/io/channel.h | 19 +++++++++++++++++++
>>>>>>>>    io/channel.c         | 22 ++++++++++++++++++++++
>>>>>>>>    3 files changed, 46 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/block/nbd.c b/block/nbd.c index 5ef462db1b..5ee4eaaf57
>>>>>>>> 100644
>>>>>>>> --- a/block/nbd.c
>>>>>>>> +++ b/block/nbd.c
>>>>>>>> @@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>>>>>>>>        assert(!s->in_flight);
>>>>>>>>        if (s->ioc) {
>>>>>>>> +        qio_channel_set_force_quit(s->ioc, true);
>>>>>>>> +        qio_channel_coroutines_wake(s->ioc);
>>>>>>>>            qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH,
>>>>>>>> NULL);
>>>>>>>
>>>>>>> Calling shutdown here should already be causing the qio_chanel_readv_all to wakeup and break out of its
>>>>>>> poll() loop. We shouldn't need to add a second way to break out of the poll().
>>>>>>>
>>>>>>> Calling shutdown can wake up the coroutines which is polling. But I think it's not enough. I tried to forcibly wake up the NBD coroutine,
>>>>>>> It may cause segment fault. The root cause is that it will continue to access ioc->xxx in qio_channel_yield(), but the ioc has been released and set it NULL such as in
>>>>>>> nbd_co_do_establish_connection(); I think call shutdown will have the same result. So, I add the force_quit, once set it true, it will immediately exit without accessing IOC.
>>>>>>>
>>>>>>
>>>>>> What do you mean by "the NBD coroutine" and by "forcibly wake up"?
>>>>>>
>>>>>> In recent Qemu there is no specific NBD coroutine. Only request coroutines should exist.
>>>>>>
>>>>>> Forcibly waking up any coroutine is generally unsafe in Qemu, most of the code is not prepared for this, crash is normal result for such try.
>>>>>>
>>>>>> Also, there is good mechanism to debug coroutines in gdb:
>>>>>>
>>>>>> source scripts/qemu-gdb.py
>>>>>> qemu coroutine <coroutine pointer>
>>>>>>
>>>>>> - it will dump stack trace of a coroutine, it may help.
>>>>>>
>>>>>> Also, to find coroutines look at bs->tracked_requests list, all requests of bs are in the list with coroutine pointers in .co field.
>>>>>
>>>>> I am sorry for the unclear description. The NBD coroutine means the request coroutines.
>>>>>
>>>>> About "the forcibly wake up" I just set the receiving to true before qio_channel_writev_all() in nbd_co_send_request()
>>>>> to ensure that the request coroutines can be awakened by nbd_recv_coroutine_wake_one(). But that's just a test.
>>>
>>> I'm not sure that it's safe. On nbd_channel_error() we call qio_channel_shutdown() - it should wake up everything that sleep in qio_channel code. The .receiving field is only for nbd.c specific internal yield point.
>>>
>>> Could your change itself lead to the crash I'm not sure too.
>>>
>>> Still, on normal execution paths, there shouldn't be a situation when some qio_channel_writev_full_all() is still executing during nbd_co_do_establish_connection(). If it is - it's a bug in nbd.c of course.
>>>
>>> To check it without changing the .receiving field, you should print all stacks of nbd request coroutines at the point of qemu hang. What they all are doing?
>>>
>>> If one of them is in nbd_co_do_establish_connection() and another is in nbd_co_do_establish_connection()  - that's a bug.
>>
>> OK，I will try to reproduce this bug again, but this may take some time. Previously in our stress test, it usually takes two or three days to hit this issue.
> 
> 
> The bug can be reproduced in the latest QEMU. But the root cause is different due to QEMU code change.
> The gdb stack is as follows:
> 
> #0 0x00007fe00c53dbf6 in __ppoll (fds=0x7fdbcc140f40, nfds=2, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> #1 0x000055c67de72a11 in qemu_poll_ns (fds=0x7fdbcc140f40, nfds=2, timeout=-1) at ../util/qemu-timer.c:336
> #2 0x000055c67de43fab in fdmon_poll_wait (ctx=0x55c67ea73ca0, ready_list=0x7fdbec9fe730, timeout=-1) at ../util/fdmon-poll.c:80
> #3 0x000055c67de4387b in aio_poll (ctx=0x55c67ea73ca0, blocking=true) at ../util/aio-posix.c:607
> #4 0x000055c67dd1230a in bdrv_drain_all_begin () at ../block/io.c:675
> #5 0x000055c67dd1271a in bdrv_drain_all () at ../block/io.c:726
> #6 0x000055c67db3b1a2 in do_vm_stop (state=RUN_STATE_COLO, send_stop=true) at ../softmmu/cpus.c:268
> #7 0x000055c67db3bec9 in vm_stop (state=RUN_STATE_COLO) at ../softmmu/cpus.c:658
> #8 0x000055c67db3bf9d in vm_stop_force_state (state=RUN_STATE_COLO) at ../softmmu/cpus.c:707
> #9 0x000055c67d8159da in colo_incoming_process_checkpoint (mis=0x55c67ed0d550, fb=0x7fdbcc135f40, bioc=0x7fdbcc02d010, errp=0x7fdbec9fe928)at ../migration/colo.c:685
> #10 0x000055c67d815e3f in colo_wait_handle_message (mis=0x55c67ed0d550, fb=0x7fdbcc135f40, bioc=0x7fdbcc02d010, errp=0x7fdbec9fe928)at ../migration/colo.c:815
> #11 0x000055c67d81604a in colo_process_incoming_thread (opaque=0x55c67ed0d550) at ../migration/colo.c:883
> #12 0x000055c67de47e1d in qemu_thread_start (args=0x55c67f1bb380) at ../util/qemu-thread-posix.c:556
> #13 0x00007fe00c625609 in start_thread (arg=<optimized out>) at pthread_create.c:477
> 
>  From the call trace, we can see the thread of COLO is hung in bdrv_drain_all(). Specifically, it is hung in blk_root_drained_poll().
> 
> After analysis, the root cause is that, when the QEMU is draining IO, the nbd_drianed_poll returns true because there are some
> IO requests not completed. This causes aio_poll having no chance to return.
> 
> The data dump of the NBD client is as follows:
> 
> (gdb) p client
> $41 = (NBDClient *) 0x5639f19754a0
> (gdb) p *client
> $42 = {refcount = 3, close_fn = 0x5639ef270bd4 <nbd_blockdev_client_closed>, exp = 0x5639f1d769d0, tlscreds = 0x0, tlsauthz = 0x0, sioc = 0x5639f1d8aa20,
>    ioc = 0x5639f1d8aa20, recv_coroutine = 0x5639f183bb10, send_lock = {locked = 0, ctx = 0x0, from_push = {slh_first = 0x0}, to_pop = {slh_first = 0x0},
>      handoff = 0, sequence = 0, holder = 0x0}, send_coroutine = 0x0, read_yielding = false, quiescing = true, next = {tqe_next = 0x0, tqe_circ = {
>        tql_next = 0x0, tql_prev = 0x5639f1d76a28}}, nb_requests = 1, closing = false, check_align = 1, structured_reply = true, export_meta = {
>      exp = 0x5639f1d769d0, count = 1, base_allocation = true, allocation_depth = false, bitmaps = 0x0}, opt = 7, optlen = 0}
> 
> We can see the nb_requests = 1. That means there is an IO request not completed on the NBD server side.
> And the NBD receive coroutine is as follows:
> 
> (gdb) qemu coroutine 0x5639f183bb10
> #0  0x00005639ef3fe50b in qemu_coroutine_switch (from_=0x5639f183bb10, to_=0x7fd0f5fff5a0, action=COROUTINE_YIELD) at ../util/coroutine-ucontext.c:302
> #1  0x00005639ef40dfc2 in qemu_coroutine_yield () at ../util/qemu-coroutine.c:193
> #2  0x00005639ef24e4db in qio_channel_yield (ioc=0x5639f1d8aa20, condition=G_IO_IN) at ../io/channel.c:545
> #3  0x00005639ef24d71a in qio_channel_readv_full_all_eof (ioc=0x5639f1d8aa20, iov=0x7fcc20edcde0, niov=1, fds=0x0, nfds=0x0, errp=0x7fcc20edcf10)
>      at ../io/channel.c:138
> #4  0x00005639ef24d8df in qio_channel_readv_full_all (ioc=0x5639f1d8aa20, iov=0x7fcc20edcde0, niov=1, fds=0x0, nfds=0x0, errp=0x7fcc20edcf10)
>      at ../io/channel.c:202
> #5  0x00005639ef24d5ec in qio_channel_readv_all (ioc=0x5639f1d8aa20, iov=0x7fcc20edcde0, niov=1, errp=0x7fcc20edcf10) at ../io/channel.c:103
> #6  0x00005639ef24dd1d in qio_channel_read_all (ioc=0x5639f1d8aa20, buf=0x5639f30eb000 "", buflen=19660800, errp=0x7fcc20edcf10) at ../io/channel.c:320
> #7  0x00005639ef25ec54 in nbd_read (ioc=0x5639f1d8aa20, buffer=0x5639f30eb000, size=19660800, desc=0x5639ef5ae73a "CMD_WRITE data", errp=0x7fcc20edcf10)
>      at /home/workspace/qemu/include/block/nbd.h:361
> #8  0x00005639ef264682 in nbd_co_receive_request (req=0x5639f1744a50, request=0x7fcc20edcf30, errp=0x7fcc20edcf10) at ../nbd/server.c:2328
> #9  0x00005639ef2652b3 in nbd_trip (opaque=0x5639f19754a0) at ../nbd/server.c:2629
> #10 0x00005639ef3fe20a in coroutine_trampoline (i0=-243025136, i1=22073) at ../util/coroutine-ucontext.c:173
> #11 0x00007fd52da17660 in __start_context () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91


So client side hangs in bdrv_drain_all_begin() yes? We see that server side waits for data of NBD_CMD_WRITE, it's normal for server side.

But what is going on in the client, we don't know. We need also a call stack of coroutine of tracked request on the client side. So on client, you should look bs->tracked_requests list, where bs is BlockDriverState of nbd node, and check .co field of the request, that's a coroutine, and run qemu coroutine command.


> 
> We can see the NBD server is trying to read data from NBD client, while NBD client can't reply data
> in time because the QEMU main thread is busy on other tasks. So, the IO request can't be completed
> Then it will hang here. The point is we can't assume NBD client behaves like local block driver,
> network/NBD client side maybe have delay,etc...

Yes, but on channel_shutdown it should finish immediately, isn't it?

Also, you don't say about any network problems in your environment, so we are not saying about hard disconnect?

There still may be some bug, that can be fixed.

> 
> Although this issue happens in COLO stress test, this looks like a generic problem.
> if NBD is involved, any usage of bdrv_drain_all() will depend on NBD client to complete all the requests.
> However, generally we shouldn't depend on the NBD client side because all bad things can happen on network.


Yes, bdrv_drain_all() waits for all in-flight requests to finish, and if we have long requests, we can wait for a long time.

For example, if nbd reconnect-delay is set to 30 seconds (I don't think that it's your case?), and server disconnected, bdrv_drain_all will hang up to 30 seconds. To avoid this hang on block-job cancelling (assume you have mirror job, you want to cancel it, but you have to wait 30 seconds for drain) there was implemented bdrv_cancel_in_flight(), called from mirror_cancel(), that finally cancel all requests waiting for connection.

Another example, is hard disconnect of the server: in this case tcp io may hang for a long time. To avoid this, you should setup keep-alive properly.

But as I understand, that's all not your problems, as network is OK?

> 
> To solve this COLO issue, one option is, we can slightly change COLO operation sequence to drain IO in the
> a NBD client before the NBD server drains IO.

What you mean by drain in NBD server? As I see from call stacks, drain is on the client side, and on the server we just serve requsts..



-- 
Best regards,
Vladimir

