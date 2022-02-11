Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879964B2763
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:49:25 +0100 (CET)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWIe-0004ja-2T
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:49:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVbZ-0006pz-41; Fri, 11 Feb 2022 08:04:53 -0500
Received: from [2a01:111:f400:7e1b::70f] (port=20320
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVbV-0004j4-TX; Fri, 11 Feb 2022 08:04:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bib0hBOMklEdrAQRvhMvUVdXmsmKYDZRqwDbkjqsKT32pEv0Gf7UJq0WNtHuFOn0JgMcx2ydznkLR26kc4ioQ5CmUau+VP8Tsd9sInRc448mZBV6wVk+1en+GMsDy1BNWRyrg1RYqyDZwPDAXy8HGCkCBgc/Y3wUpLAthEkyX6gxr7tb9jxViPyiIr+ddW6MBUgw93qwjXC8f6dlWlVLExSCGK0/C/ZIcmst2qG9Ptqtxv/rx8ATH5GZiv5IO1DfD1VQJPFRnt4BonJXzCZ0ltlvG9iJIV8T19YK/6OFzGKugdiRjZf1q/msmdmbmq+vV7fBsj6v4LqoXUieZpookA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bi4dPjgWLdcXe5tVXq6rQCdVoC8jw5UdCCVZqcEVBGA=;
 b=EbEmQ+qAmChlOlBRs9Dpru5zYrZtpHfzuJJ/bPq28iD5VqbFo7EujKQa75RzClskLgox/VGnVAYq1uzQFIzvQntM3tkGbSrE+N7hJY+6QWhdDG6Ml7sDDXgCWVvo3iA7F8mMpG4gFSiBfoxgACEMv3aeXod8Uzv6oUyKY32BUgx3pEaOci5kBtcB3lWv5zfE5AZgSY8GVgtU0PKt8n47MkkkSgJiio3tZSPa8EzcsoTsdxzRSMWifsrmRLb/sy8ZwI3Z3x9dMuHQBbFNc8QBIvJgC/+rw3/HaSaVAYsWjwvTf8U5SjsGFFNFxsTZn6P9tEAdPgmdk4N4ea+tmSP/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bi4dPjgWLdcXe5tVXq6rQCdVoC8jw5UdCCVZqcEVBGA=;
 b=etAoymjeSm+65QvBIYt65fnlmGpBrn0t0He3h16iUS459Vqjs24JTXraMPgA9UadZ5HgTWqifJdqfB7DFsfl2k/dmMxznjHTSU5GpHQkMiA+xGYefZ8s1pUfxk69hU2xG5mSgw60RUoydGIXS7/wt7qIg5DZMPXmL4+rxOSu870=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB3895.eurprd08.prod.outlook.com (2603:10a6:20b:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 13:04:47 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:04:46 +0000
Message-ID: <101e60ea-b752-887b-8b8e-f73561266357@virtuozzo.com>
Date: Fri, 11 Feb 2022 16:04:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 0/7] nbd: handle AioContext change correctly
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, eblake@redhat.com
References: <20220209140258.364649-1-vsementsov@virtuozzo.com>
 <CAFEAcA-12iJfa7F-zGBb--V3yehi3iV2A6u_BPuEFb-9kjHBVw@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFEAcA-12iJfa7F-zGBb--V3yehi3iV2A6u_BPuEFb-9kjHBVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d096d2f5-5dea-4148-7291-08d9ed5f13d1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3895:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB38955A3FB62FBEB44DDB9A51C1309@AM6PR08MB3895.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrjIxGty/EhZa244SLXSg/20m3RW07Nm+06jkqNLXbW07I9xf+a2uwraLVwM15RJ50fd43FjqmAHQgtLCuc9KDBISErh+W2879Q0e7rYa9oB07s3rSWminpHvF0eMG6Y4AylKMm53TtrARZtWi2e3Cwpe4nQpeumS3nJLENHbVKP5jt8mjGjNZnX7cqDGSSUa5o0+K2Fr4ZmN+SmYzwPfV0SUxm43Z4PGDel+7dF8tL+1IvBfo5OQ7n8qxBvKRu20oQqxJ0/2i6HSNr0HTYpaTeVmTGHtH53h/O2sgEJFRSZejcRUxqLXEeaEUgfIa5mMmlmntpSteEBi9CRYxyggArG3NA0EnVhpnN3OY0KDZ/2smROQzso4hUCLsvUKjVOm/lg/C3szq06A7H85ITjqiRGKaP21US9WOAsfr1I2XVh5wv5alP/gI4yT/oqiEuaKl0rJeruTHgZCuXkmThk3pX7QJCLRn9/GlUXjRqA28J3GMdePnYJQ1gOcfrv50x5xCVBc36P6meCbDUpVVT67/ZWZOLZWv2+HFk11SKNVlnzVAv90Z54QhXSaIeVxjbONNlOhnFzHC+j465m8eLLRkDuBUcv7Bsdsx9qAyXDKWvbeHVFctQsx9qKKqriEeGxs1QTHgvvM9ArIHOanXH9AR5qea96ZXoVK4h6IjCC5LSyW1Kg6WygS7rYLuUs6UH4CmeKsuUOjwdfd4BGKD9Osy1vrDXIE+7bD5QDCJJJHX8VPUPFP87Ce1liLeVMQsKqyMoDY6TvVWNxMyGweVJaZJNTCdNW1uOq2GEpJuPgZxeFJnNKmyMIzGPL77YTwAZyMRaHdUbmSLysVkjU2J7xhzsoVpFCG49ViPtTBshtl9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(966005)(66946007)(6486002)(508600001)(4326008)(8936002)(66556008)(5660300002)(83380400001)(2906002)(66476007)(31686004)(86362001)(38350700002)(36756003)(6506007)(6512007)(186003)(52116002)(38100700002)(2616005)(26005)(316002)(6916009)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkxMNVJRc1lSamkzSUpETG1CaWZ3ZDlXSm04L1owdVkwd0ZKcUh2Z1k5elJs?=
 =?utf-8?B?ZGRlV3dFQ1BOVWpXMmZHcWlmMUVmd3o0VVlPWkkxS0NKd0FNMytvamFOZGtn?=
 =?utf-8?B?T3lCMHlrQ3dxbDhEMzYwSWNwVXNQWWxXVC85Tzgvdm9hbWtvUk9BRTNheHk0?=
 =?utf-8?B?WW1zZCtJOWNwSkE4aXpic2hyZExpWXNPNmpTeUs1bjdzV2hMU3BNMWJXQmNT?=
 =?utf-8?B?ZzhoVUo0T3dxUGMyUGZyaDJLSEpodi9aNmxvR3JOVzh0b1d2WklWdkJZY3Iy?=
 =?utf-8?B?M2k3ZGpRd010eTNndVpWdmkweDRjQVc0K2FXWHdNa0h6YnNNK2hoOG9tenhr?=
 =?utf-8?B?L200ZHFDOHl3ODhkQXUzSmZxV0NLbnlMbU96L1VXdFpkeHB4bGpVNXovZGJD?=
 =?utf-8?B?cml6dUt5UWVORmQ1bTRvMDNaVHZmYmZaNlhFT3c2aHVqaEVTM09Hd1NtNnlS?=
 =?utf-8?B?RzdCS0hHMHJ1VWlSaC9UaER6bVlQcW16eGZDUWErL2JYNEczU2RqTE01cjVV?=
 =?utf-8?B?c3c5NUF1Q1A0ZHBacGtQMi9Ic1RRYlhNMURIbFZ3SnVKeWZ2UVhjMFRxdlR6?=
 =?utf-8?B?ZHhGemxscE1EVWNRbnVTMVV1MXNkRGFIVktsV05UOGdNN3RoQjY4Mng3YzBU?=
 =?utf-8?B?L0Q5c09xNzBEaG5qUnlYVmRMSjRRMXdWdENEeTBWMzZnRlBGaEVxUGhmQ05T?=
 =?utf-8?B?WnR0UmVQa1J6b3c2bjZHRldvVHBoczE1TkJQZERZOVFWc3N3SnRyKy9GeEZo?=
 =?utf-8?B?MW5rQWNGVExzTEhNLzVDdzZUZGtQeDdzNm9KbnV3eGh1NEc5dmt4S0lRUkZy?=
 =?utf-8?B?VXZ6UlE0bU15UitrdWdONnlDU3hTcm9rejQ0RWFDU251eVFPdGRxeTZ1cXdX?=
 =?utf-8?B?ano3M1JDN05kR3E1Q3dOUm9aRkJiOW5paWJCV1FCalQ2TlcyaFVwdUk4am5H?=
 =?utf-8?B?VUs3VENLU2tpYTljNkNKZjFGaVJNMGhmWVg4ejFZTkFRMFl6UnhGdE1pT25N?=
 =?utf-8?B?Y3ZtUjJFV3BwK1J0Wk84cmJ0QkVCS0ZLYTA5emg3RUFwdXVsS0NsSTFRWjRB?=
 =?utf-8?B?alZjYkd3cWw0Um44R1ZGTHhOekNWOU8rL1YrZkdCS3NOODBXT0cxRzNlaFdi?=
 =?utf-8?B?S3FMb2tJRVpPZWhNM3Rwd1hlaEJzZ0IxeDR2Y2pHNGhEYk82cGRCZUJ3YkpU?=
 =?utf-8?B?VUM4YXJsWGk4M0NzTUluZjNNd09vcFNSUURLR0pEeFV4M2F3dUtXSFUycVdP?=
 =?utf-8?B?SWhMOWxnek0ycHIzOUNUOGlhVVFWS3FLRmp3REZjaEY3b0hXVFFFLzlvVzV2?=
 =?utf-8?B?ZDk4d3UycHQ0TG1JL2sxSjBmNlF5RlJZd1A4bjJiUCt1TlUzSkUxaDFZT1Iw?=
 =?utf-8?B?UDVZTDM5TlFaeGVtcUVVei9ObFc5Yll1bUtDTTJHcEFDUVZ6THFabnRaTlRq?=
 =?utf-8?B?N1M3R3dQYkhOb3V2NU9JOHZ2SU9ocnVuZStobXFOaU8zeTd5TjdUTFJZcnp2?=
 =?utf-8?B?ZHBlNmNuM3E2Z2RSRTluZGRUVWNnYlkrZW5ueWp2MGFSNE9ScXBrN1puVnRB?=
 =?utf-8?B?bnBDQnAvY2YvQ1Q0UkdmZ2ZJVzRPT0JzeFMrZjVtZjYzVzZiSVF6dTVYUDA1?=
 =?utf-8?B?TlFqSDFEY2FKN0RyaXpuZ0Vtemd0NzF1ZlVYNVlXeFlSSHBzYUgzeEttUHlG?=
 =?utf-8?B?c2dyNGdDdm94c2t4RDAxa2lUSjBEelRiYjhnYTFhOFlycjJ4anBSTDlKVEor?=
 =?utf-8?B?UTJHc1dtKzViK3g2SXZ0YzNwaDcrd29rbmlDdWNjVUlJME14NGtid0MxSVIy?=
 =?utf-8?B?OFVtSkxldUdoK2p1aW9IcGNuUWNNdDdNcUhvUEpNVHdKRHJQMUFDZHMwU1pN?=
 =?utf-8?B?WjBvRFZJM2pvL3R2aDU1MTZCRGJpazRwU1p1NlVwbGhML0FOZERNWFZZNVdi?=
 =?utf-8?B?K1pnYy9rRXFTSVA3aHAwZEdidFN0QXdEMTFhWHRpTytEU3NYektwZ2lIMHJ4?=
 =?utf-8?B?L1IyZDBGcG1jTEF1NjI3bWtVM2tSbFBleTZDOTBneFhYZFpqei9oY2RYSXhs?=
 =?utf-8?B?TnVKSVYvWHJoc2FxMDdONjJVMWRkS05vY0hYSy9seVA3Z2RUNUNoOElpbXZO?=
 =?utf-8?B?Z05FbWh4cHp4SXdkaDRlY250NWF2Tkg1cDlIczBUMVJESGp2WDQ4NmV0K245?=
 =?utf-8?B?dVN3L09GQWc5TFhuWndtdkZVVjhtM01QcE5WTEJzNk16ZFdmNUpzQW9WS3Ir?=
 =?utf-8?B?ZjZjSkhmSE1KVmN0bU01Nkg3RHhBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d096d2f5-5dea-4148-7291-08d9ed5f13d1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 13:04:46.9348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pywuc771xrBVIL0w0c31fOvrgZ1aoMkafcZJppwSptB0jFnYtTxPlminfQKJHhkqWr3ZE+7Q0hPxq66JdirYMzYpmm0e4EvAPmj6QTNoW5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3895
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::70f
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::70f;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

11.02.2022 15:52, Peter Maydell wrote:
> On Wed, 9 Feb 2022 at 14:03, Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:
>>
>>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2022-02-09
>>
>> for you to fetch changes up to 1bd4523c2ded28b7805b971b9d3d746beabd0a94:
>>
>>    iotests/281: Let NBD connection yield in iothread (2022-02-09 14:15:29 +0100)
>>
>> ----------------------------------------------------------------
>> nbd: handle AioContext change correctly
>>
> 
> Hi; this pullreq is OK content-wise, but the commits are missing
> your Signed-off-by: line as the submaintainer/submitter of the
> pull request. Could you add them and resend, please?
> 

Oops, sorry. I thought I'm already an experienced maintainer and don't need to re-read "Submitting a Pull Request" instruction every time. I was wrong:)


-- 
Best regards,
Vladimir

