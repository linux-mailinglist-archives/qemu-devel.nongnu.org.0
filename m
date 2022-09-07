Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F163E5B0B79
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 19:29:23 +0200 (CEST)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVyra-0004b9-SD
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 13:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVyo2-00082u-RZ; Wed, 07 Sep 2022 13:25:45 -0400
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:8973 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVyo0-0002X7-0f; Wed, 07 Sep 2022 13:25:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUNxUfS1z52lYaNQ8OrHd100wTvHRhiygJeO1EVF9S0+twQEln2EOceTw7yYT6gKWCRcKUkPpkDBMTtm6hvA8xtfnE40vXhQr2TiNzUEGt1D1jCi2gi1DKIFdmlBD2X5Qm2OPFYUgjJKFLE/g5RxFteJMdd5lltG4Ezz8k9RALjkVVC2FQoeUw1B3ePXO3wXbjdUtHEqevZII0mwSYkv0TtV6y7KymFbEgy7eLmOmDpIEv5vMo2j4d5zUAg4Mh8DF5R14bDYulpbcmE4XnAwk1YH2/EDMBGfELaPy5UQJ/5+WmVW4EZmPrZGmppzyY5lJk5f+4njoZuzwWT7zsZC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5ibagYyTNmPoaO7ZIthzP6kTxqP6ZjbZpe+lhVChmQ=;
 b=Mll/HRSDFZ8B4duXi4G5mfLudrLgogMlKYS4MOgU7QY3zoAavRpDzLbea+Tp/S4o2fIRbpQWZZXoUZnth3OK5/VkDe3+qtWQAj7XFXyI2I82rqPGSeftBVVu91CUe6cvRwDOmS/hVTWDUgpfAR2PoqzbJ4xo8AG9Fjxl83Ln4+PbStxkxep8PTRhInT5OQ4PWUOj4aL0UfcZjUIgffwaNlQ6GvAmlsLOu1NOp42Wpdib0EXi7FQJpO8BMYVk0wurZuacwdoTZKZGR0gehOValWRqAZzpjcco0wHuwGkbVjJZzcLBt8JyWO2y4MNLZtz/EpEc9xx81jdO/Jx39YiyLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5ibagYyTNmPoaO7ZIthzP6kTxqP6ZjbZpe+lhVChmQ=;
 b=mkjfw7G1bxyPlS1r8zdhAN/SylRI8T7IT78WimnpAlteHFnWddbVAjhklb7J/N4EGhg7P5vs/5UOovptsrMEIP9QqpYLR1DXoOJIklKqufQFB9s4IA4KEkzMxpGmVBlWpzD21c2ttA93bmtRLsTIgzvpMK9hCt5C2tMtvfqcZ7EpbgP22wGzCZ9JVrIuZ/CzV3lrvsWAoNGXK7TTErhWu7JrhcfopCH5VM3Jfq94OxP1YRYW0fbWFvvNIEsxq2z7W6kgbsg0aXcixqsMEfWNvgZN76Xx21cUcJ8AQnbB3jr0rvwKGcAe0BbNWCR+GDkrU6J7OX2LeK9tDe3iLf8ByA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB4PR08MB9335.eurprd08.prod.outlook.com (2603:10a6:10:3f4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 17:25:34 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 17:25:34 +0000
Message-ID: <173449e5-d313-b173-240a-44dbe34dda16@virtuozzo.com>
Date: Wed, 7 Sep 2022 19:25:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for 7.2] minor fixups in block code
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220817083736.40981-1-den@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220817083736.40981-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::43) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1c17a45-3f32-4301-0209-08da90f5f8e7
X-MS-TrafficTypeDiagnostic: DB4PR08MB9335:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rqgUU9+GRA36FPaYpnNUSGvIELfugWCJL5oNgjxjxYbIDU4w6dKWfMB9DYPrIA8aJnTqIZbrg6Exp4YwbuDPILrU2khqdZYcx0veyKEjq3TYT+LtQ9pD0i7VsoCfXD2fWjZX5HvYUy4ZU848AG3SveEQiKMleeac/lNH5U90pfyNsGKvn9MAtPpEI+H0y3CTPJT84jtFxVSq0lBr4oG+Jp93k3Z5BMAF6NaeO/HTMWms64NapJDHhL2+KqOu+sEYFCPTeJZpHhiLl49Y9DJ1BQnCeu4xt38c3qqvgYpHFTwK1vv0C7tjMOl1wqBUt9LghnEu/EtcciL0QGVtHnak66lEoCwXMou+YufiB9pijkIFzuvOKpnd2NOIw3z59HjrZKcfK4+BiS5TOrD7XYbadN5x0397a0QnLs1phvtEoptpUnRJQuA8vFm6hiRo9cn2+mV2q7Stn7OwnwH4X4D4qdnVC8Ary3k38/+gCfhwJgDCmZNDnyOmhviR3Gx2ax9YpMVRi7twjYxzRG+MfnrX0MwLRNvX050AWwlX/JhMvUPU05BeKfXdu/iQqEzpyz8BBQftq/eiLBrjYgkUlqSj8u1Y9J682IIvnh9J46dUu2tsdV2l3AJhe3PC6L4OObFRyVGqF8CnuxJtwRNwrumH0arMCAGj1JE1gjQcEC8uHX4k1klll0+MddTi7P3Lc9rDPoywBxf08Ulch82O6n2O2rnrLuenOKtrLFf8EOObd+1fXa0zi8mrhHcw44dgBRcK4iG1dY56SgdWkXBANjwtWU4PqsWZFjwEeSofXTwKjy6MFw7av2r6sqzsA+YOMsTDMZcrfs+1//qdluXt/zXOLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(136003)(39850400004)(346002)(376002)(6512007)(31696002)(66946007)(7416002)(8936002)(26005)(5660300002)(41300700001)(38100700002)(2906002)(52116002)(4744005)(53546011)(6506007)(86362001)(38350700002)(186003)(2616005)(4326008)(478600001)(54906003)(6486002)(66476007)(66556008)(8676002)(36756003)(31686004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0tEa0hZOHV0YlJ1MWJiTURTY2wxajN6YTgyTTUzV2dKV2puUVVuTFlDclMx?=
 =?utf-8?B?QkZud083ZDNXZDZaSXJKY1ZCMk5JVmVZcVo3WXNwck1oZVhRZG9LamNIRGMz?=
 =?utf-8?B?YnVORXRxU0M0aURIUTIyWDUrU3VJblpOUXZtamJBeC9Tc3lMeEJKc3NSYU01?=
 =?utf-8?B?VE10QmhnMjR0WnRLdCtoK2I2c3IxM1hieW1Yb0s3Z0hVaU5iaFVsM0J5VHRw?=
 =?utf-8?B?cEhZNCtnYU9VWjNqdFFZZlY3WHVNMWtnRnJCVFdJY3FGdmFjYVB5c0t4RUtE?=
 =?utf-8?B?Z3ArVlg5SHR6ZExIRUZhZ3pPem44ZTZndnY5OGVQMFF4QytmeUJmVzZlellk?=
 =?utf-8?B?R3A0T0o1WGYzdXpCRmg4M29zZFJrSzVYVm03UnZYK1NVdkFDcTVCSmZYbko1?=
 =?utf-8?B?N2l3UVovOE90a2NEZkl6Q3FTS0NTTTJscHpqTTgxQXFsMXNGbXU0UmxOSkNP?=
 =?utf-8?B?VXVNa25MTjc4WnRWcDBPUEplZXh1SnJXVjNkSmpTKzZMenRZRlpnd1FHWHJm?=
 =?utf-8?B?NHdORnc3UmJXMlZVTzlSYlkxb28wdThwWTVMT21yQitvOVBxdnJrUGJEWEdE?=
 =?utf-8?B?NDdjTVZuODBrL0ZBOFhzaElrNk9uOVRiQzdIbGNKbU10WmJvUVpSUldMSEpT?=
 =?utf-8?B?bnlCTDFPMFFiR1UydUxCdFdjUlpuUG1LTkxnejBROFVFb2NiYklTNUVWNUxS?=
 =?utf-8?B?U2xnMWtTcGJCd2V4UGZBRHl6MTlDbXRRSVNBVkhpNlU2V3JrOGJoSFlTaStP?=
 =?utf-8?B?MjA5b2NOZ1ovdjJ1RmJnNXhWY0hWMGhQbkZIeGxidkVzUjIrS0o0N0FiWFgr?=
 =?utf-8?B?NVVGczZ3eGpqMmRnMW9ZamFaVG84bXhOWEppUUZobitzNGdHZmdSVjBJY2o2?=
 =?utf-8?B?MWFBWi9mS1J2NkY4bFBVa2JzL0cycENzeTdlSkpBQUVZYS9scitrYU55Ylo5?=
 =?utf-8?B?VmxwNkROT2o2WmFYbmtnbERhZklXVVlDQW9KczJ6N2FOSVJUcXJ1OWtyVTBM?=
 =?utf-8?B?VWx2OTM2R05QN3huczcyK05NR3U2RE5PRHd0V3FidWZnUGlKRGlJcmdmeHBZ?=
 =?utf-8?B?VU1seGVkbXNOSHZsR0tWRno2QjNoQkpDUEVTMWZLajgyM0JXQnd1K21GR0Z5?=
 =?utf-8?B?UytvdTNaRmZuSnhIQVZ6dDZxWHBIVzZubjFEaGJjeXQ1VHdXcWduNzd5bGNh?=
 =?utf-8?B?THcxcUlBeWJkTnhJODNscEZYd1N6L1diZkdheEFEVTNUdUNDZC9KaU8rQ29j?=
 =?utf-8?B?VStTRXhLOTNtaUo5MXJQTGRGTU9udjkvWXlhK0hpOEtHeGFwQmpXK0FoeDhO?=
 =?utf-8?B?ZDhKN1pCS0FSQVRVaUdBVUI3YjZmYk5MTVluUnFUckdKWEp5WE1RVHA3QjRm?=
 =?utf-8?B?NnkrbjllblRWak9wNUhtaTBtNldDSXNEdllSTVVIVlNTUm9JTnJPSHZiYjFL?=
 =?utf-8?B?NmErNnhvTEdGVDRXa3N5UzVnbFI0Nzg2YXBXYjFTUFYwOEdqd3ZyNTMrRTFs?=
 =?utf-8?B?ZmxMWGFCeGYyeFdEdFVOOVpQVEhlN2lhQWF5K1F3NzVkaUgyeGltQ2pUVnVH?=
 =?utf-8?B?b0NNSFl4TGxuVVdhVG95bEJ4RThYZTFhcmtNSm13MXI3SEV3ZHpVbHZibW9Y?=
 =?utf-8?B?Q3RzTTJLc2VnazFUZEVFYm15THJBRHFlczk4RU11ZW14NHdHamliRCtYY0xy?=
 =?utf-8?B?V0JNenJMQUFodVpUSXhZUGJLR2k1aW9saFQ3Mmx5R1pPajR5NmdMeEVHMnlI?=
 =?utf-8?B?WHpjaTRBUGp3REU3VEtBeG5kMzZmejhKQXhaTUVhcFhOVys4YnhCMmVtYXg5?=
 =?utf-8?B?QzF1ek9ER0R5NUhOZDBnb3ZqOUNFTUgrZjF6Qkh1dWkrWm41Q0hVeGUrQzli?=
 =?utf-8?B?b3J4WUtYQlIrR2Z6SDBuand2cjk3dnJwaXFhbEpBRTg5bWVMeGt0Vi9sTFpL?=
 =?utf-8?B?VkxsYWlONG9ZTUNaZnE2aEdVcTVPa0UyRkdFSGQra0lVdlhweEI4N1JqVHcw?=
 =?utf-8?B?bnFZamtlcHdINzRrdE9HY3Fldi95ZFdtR3hRMTNpNDREOVo1R3JjQkFYbzYr?=
 =?utf-8?B?N2pURkp5K3pOcmUzenNiaTZzV1pzNWNyR1V1WE56bjFob1l2em1pTXdVQmx2?=
 =?utf-8?Q?PA5SbkpSFxMEC7wbwhZ+BQ3+E?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c17a45-3f32-4301-0209-08da90f5f8e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 17:25:34.4716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZCOIZXgv9QU15LWVMEavVlRzXWytf6r5iqg5VeHLde4MJc01WqtNPxb8GzwHd7Qvkp9V8+1Rsl6u6qWgujTBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9335
Received-SPF: pass client-ip=40.107.21.102; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/17/22 10:37, Denis V. Lunev wrote:
> These 2 patches are just minor improvements to make code a bit better.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> CC: Peter Lieven <pl@kamp.de>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>
ping v2

