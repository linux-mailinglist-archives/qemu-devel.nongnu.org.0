Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DC6FE1C7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:46:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwm1H-0008Ld-Si; Wed, 10 May 2023 11:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pwm0f-0008C4-AB; Wed, 10 May 2023 11:45:51 -0400
Received: from mail-am6eur05on20721.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::721]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pwm0d-0003Mu-7w; Wed, 10 May 2023 11:45:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtYrl35+tgqx9oH00EqYMbAbHFqOlPeJrOhYzRDNbisVmlH2dmQMhBxVQMspgg5xccpkQPdfEKJ6Vq/97JQ8Xh00vUjosxWiOu5i9nKuhChdWceXNAVJFBCvdsxk6a7Y/qIAA2Ky6EUWFYOViz6KmU9GdO2B1i4LTPcjZizXY3XBORbRvBB+lxiuy9rR/NDe9zVftFb077ic1/DJny4zPWKE7Tf2ZWneheDI+NdhIlEbmepVhg15ncOM+wInKO9UnDjT98SCNvW1wig1IutY+OLskH0Nt9mqLCwc4Ab9vh/xMuXZy82yLquTpgmqUCrIQ4xqVIyK+ut/hYpmzrbXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOOoNQIFRzSJ+EPP7yzlldAfd+HMY0ncT8tWTGzDH5M=;
 b=KDfhJETjzrEJWtwt8mNw+W/op3cIXA9hJEze3JJZHFiFdExmAJWuSEq5zHrgn5OAeRAK7tZMllmxq/21bmBxtKM94Cpz1Eghrav4dUUfI6Ixl3vqfSIAwPVYJwC/mo80piZH7kPNsamOTHoYOQIE78mbf+LffQ37S+nyQnJYrnx5pbhWhFnyzarLyUf3YLU7tXLPnxQQOHaSKureGLVxesI3qvRzB2ZWNjB8s5D5xVjHOqCsx2zj/4FA05BSfbvRz9gT14umY3Ea1VUspm3OqD9RwyUX//MJ1yYyzrLPrnmuEhcvrEqf47IllBmEIgW5rpNzGfyXFuNNQV5pPRJEKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOOoNQIFRzSJ+EPP7yzlldAfd+HMY0ncT8tWTGzDH5M=;
 b=qSgH3MPAqbaHAEVsgTM2E96ZyqY/AOsaDorvgDso9j4O0WgQDPqxoSV1v2BEBXWXGvBZMGb6/nO2culBKlxHuj0yHXInmpbloDF3/x0QjhJ5wvMHuQhmxBbaqcpxibAfsCC0KRY8gPkDi154pbQ9sJ96WfBmp4iUYxws+vTcOWyniqytIDUJFeAF4cLR71+bgN10CstXqsDV68MRRIioIt/DszC5iOghc2IRm9dE3BFItaapa5uacR+sUIkmrQEEV8nYQtBkPM2PQ0DrpRjXmUScyy1w0om8RMex2oOXA4Fg/lXTjKntGsYT/0gxWrvEHc0kD8mFv6tMgOpNeOIYeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB9885.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 15:45:38 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::b50f:b94:a801:adaa]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::b50f:b94:a801:adaa%6]) with mapi id 15.20.6387.019; Wed, 10 May 2023
 15:45:38 +0000
Message-ID: <b2c70a6a-4ca7-fece-3125-22b957cabf26@virtuozzo.com>
Date: Wed, 10 May 2023 17:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v9 0/6] block: refactor blockdev transactions
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 alexander.ivanov@virtuozzo.com
References: <20230510150624.310640-1-vsementsov@yandex-team.ru>
 <a498899e-60d0-4969-85de-bbd74e04d454@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <a498899e-60d0-4969-85de-bbd74e04d454@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AS8PR08MB9885:EE_
X-MS-Office365-Filtering-Correlation-Id: 93eb7f98-e2f2-49a3-dcf6-08db516d9a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VBX3tC+OXuQrNsbHElg+oTfqofmKHVjzUoMeLOiSn94hPPcNvW1tkia3eYj9yeZ8rbLvjLedNML8V5tWUuVJcVrS5d//VyuaMSqChBjyf78gH58vWG2YHnGBzJorvvpwN7QWq/V5B2dAJzP9Lx9ZzQwkarVKHnJTKRQpiK//a0npucOurV74mM7LyS74gTsYKzhu/AFnUmYCEdti1eqk6i4LJtEfVvBDAJXqjn3/UwHFaJkVMCNZ26N67neUDKFaJDMhOLJvQ2NO4PoGnmoykwYlO5YhY1DvBJHI5ndG2TyIqAeAKaysrSH4hkak2b5QiRfy8Itm2xuSeR2zjHMlNyLt72y0//zy6lojkDaYGpbIng1A3ZgAoDuHJ1OqHv8DajXt165CCDxyfKmAkD8r66bm4YhKoUQcfblzMgqTxLlW7h6OVpG1nwicsKOlKc/ynRkDS2yUOBU8vr09zEgaiNdwYSiW7nHDEx8VQAYmmRIBvVNzsy7f3mp8l6qfCy6QHVi9pHii+gH0hYaqGA+Conh8jq17n+OGIrELrYOio7CWyOm96P450zzHNBvQdRLl/0OfGXVcRgKxV2mUW+0/xeoUAi5OiMCDv2yBS3uMy8KKf8DpjjepIVWU1RwX3fgxnuvMa/mCXnAmnprU12PcdGrs86oxXy878P6QT/a3XkT20S/xwN3taGx+cs2eKv6f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(366004)(39850400004)(346002)(136003)(451199021)(316002)(41300700001)(8676002)(66556008)(31686004)(8936002)(66476007)(107886003)(2906002)(31696002)(36756003)(86362001)(558084003)(5660300002)(66946007)(478600001)(4326008)(38100700002)(6506007)(26005)(6486002)(6512007)(53546011)(2616005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnBuck1WVndSOHcvMElHeWMwZS9uWUNoNUFRblNHSER2ZUQyMkpxVXE2WWgw?=
 =?utf-8?B?bWNSYm9JZUZHZE1mb3Q3TkwvVm8vZlVHUGljdFZuTVZUaWxLSmZ2RHU0MFlp?=
 =?utf-8?B?T3dGc1ZObzd1bEZyVXM1enljcm1kVGJuRnNZcy9FS1ZnS21veTF5cWJOSDZX?=
 =?utf-8?B?Ri9oa2VyVmQ4cE42bTlNMFFrZHgzdjlBNGp0S3pIMXlXd0l1RXRjb2llbzU4?=
 =?utf-8?B?UitwTExLTUlKSXF0YlZHTDZvcHRZUzZ6VzZTb29mS21FWnFycDgyWDRKZk9W?=
 =?utf-8?B?V3p2ZC9tMGIxY3JaZ1N4Um5UN2E1bUhld0J3S2xzZzdpdVRMRlpTUHVPTkV5?=
 =?utf-8?B?OHkxaTVXWStTRVZFUFN1ZGxVQXZxVkVmTGNBaHhqeVphOHYveHU4SU03azIv?=
 =?utf-8?B?WS9LZUhoNXZGd3ZVRGlWdVg3TWdmaHk0aExJTENVbnVzWUs0VC8xc3ZDYkNo?=
 =?utf-8?B?dytUd1N5RitBNkNHUGVDUEcwbEZYMkI0K1N4dlk0elhPcXprYTZSUFB2Q0lI?=
 =?utf-8?B?c3gyYis0djBzSEhlMjNHZTFjSmFNU1lSY3hkTUxSdStHQmxiVFN1NVNhL3R4?=
 =?utf-8?B?VHNZWWNxQ2ZKcDNlbEszZUU1Y1o1UG56Y21kTDNkaHFSQTVPNmtFdTgwRnBZ?=
 =?utf-8?B?NWNvY1B0VEsybGZBOWpVQUd6WUl0V1paRFVPNEFPNjZ4M012VkFKbGpkMWRy?=
 =?utf-8?B?aUhjNlJ3dDRMMzllWjQ0bndJa1ZRR1dyN2RvdU9ZVDU5ZTRLVDcrVDlXZ1NK?=
 =?utf-8?B?VG11QkdhdWVxcStHR0Y1MHhNZ3FkYysyTUt3Z28wb2FIQnlqR3ZFaDBVbWJV?=
 =?utf-8?B?dzJBWVk1MFlDNVh6cnZvRTRjWFpCL1NRMUsxVXZ4aGpNZEhJK1p5NG5CYk9W?=
 =?utf-8?B?SUlGNzQ3NFh4eUVua29LM3Y0MEFJdzRXUWQ5RTlKRW1wdXk2Z0cvN0FmcVJR?=
 =?utf-8?B?dWUyaWlWRU1TZU9Bb0M5T2ZIUUVpYWdZYkRiRFhkak5lUGttbGhZbUVqaUNr?=
 =?utf-8?B?eGpTY1ppdmdXMXFTdTA0NkpYNEhHbW9VZDF1WUxGQTFXSVEvUnpXK0xPeVZt?=
 =?utf-8?B?WWxHempBMlFCQWVnRWtOaDJqZktGRHdHYmc3bS9uNjgreG1MWVBxWDl0MzJZ?=
 =?utf-8?B?bzhPNU5CODJJdnFBcEJ5WlB1bkwvZktENjduSjN5RUdaL3BBZDJWdS84VHJS?=
 =?utf-8?B?bHFQV1M4emYzT1lTU2VMNWxGUEVkeHlsQ3crMWVMRXA1djFaeVhZeXNyNVpt?=
 =?utf-8?B?WG50YUdKL1RrRmNUelJhNHBnMzBBZnV1bGd6bTVJMFlXWlZkYlZ6Ymg4TkRW?=
 =?utf-8?B?VnJKam11dDFIRzBWYkt4b0NzM2xuRVR2RmtMaGE4WGNuSnY0VjBsVUllWE51?=
 =?utf-8?B?WXIxY0tvbnMzQndoRkJNZGd3M09PTWhpMzgva1J2bzIwQ2p1dkhFeFhBWTA1?=
 =?utf-8?B?ZURmenJwWlg5cEdUd3JwNWFDL1AzKy9UaHV3dEhlaVFiYmZLVkRVYkRyM2w2?=
 =?utf-8?B?enpKcjVMNGZCK0ZzSFVKa3FJaXFsLzNmYlhSaUN5anJSc2Z4dnRZU3Y2Ni9n?=
 =?utf-8?B?R0hiSGw3VzJFSEoxWGEwUEVpS3hwSXpucEM3ZGk0VFJDTVBpaVJBYXUvSEhx?=
 =?utf-8?B?R1NJSUM5bllmYm81bC9RVzg4S2Vvc3owNkVKeUhPVXdiTlBjWkNVYjVmRm4x?=
 =?utf-8?B?ZHFMaDdFZE1jWVBkeG1CeEZ0R0xrZXZiejhWQ2dxd0FzMWV4SUtTejVLVnor?=
 =?utf-8?B?RGQxbDBVM09yejVkVlJZeHI5T1VlbG43c0l5ZlduaTg4VlRuWlphcE9QcEFp?=
 =?utf-8?B?bnloTU5BY3lYMkgrVmowazVYSWhybVdLNDBubE5Gb3lVMjAzdTRSOGl4VU1L?=
 =?utf-8?B?WXg2eWZvZEp6bUpxQjZ4N3NoeE55dHpDa0dyMzY0cUpNMzRPL1FkZjFXQVZw?=
 =?utf-8?B?WmUrK0dUdVZaaUx5RnhHSXJ5UWo2eXlvbEI2ZWM3NTByQlR1V0ptQnVjNDlU?=
 =?utf-8?B?dEU1MHBHZ3JRRkVnZXpUeUc2VTJYWE5tQUZpbnU4amhtQmZUOFUrRDArUHNO?=
 =?utf-8?B?QlphU1JhM2NoSGZpWHBQS21Nc1NBZFltNXNaNU5DSEg1WUVRdFMxL0Rnenhj?=
 =?utf-8?Q?xYfc5HGeuJhUp5NWPihNnOP67?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93eb7f98-e2f2-49a3-dcf6-08db516d9a11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 15:45:38.2801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bs5MorBxVSRY6vdpVmHeZM13HtGQf0Bc8tYkk2lwABNFfwPUsmSJ/LKO9vecES88zb8ZGB6SfreVdkJPt2WMPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9885
Received-SPF: pass client-ip=2a01:111:f400:7e1b::721;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/10/23 17:21, Vladimir Sementsov-Ogievskiy wrote:
> Interesting, I see two 5/6 letters, equal body, but a bit different 
> headers (the second has empty "Sender")..
>
for me all is OK

