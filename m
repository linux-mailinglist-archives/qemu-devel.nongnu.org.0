Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB442480979
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 14:14:53 +0100 (CET)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2CJY-0000AW-Bg
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 08:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2CHT-0007JA-KU
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 08:12:43 -0500
Received: from [2a01:111:f400:fe08::722] (port=49894
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2CHQ-0007PJ-P4
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 08:12:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bchbh6d1M0qAqzeMFjase1wwHrLfaIM4e3b8Xx1R1TSeFMxa4yHUe4UUIfaWANHHfnfXjyowlDigHTYjFFECEXZcA266aYsDkrm0/BokrIpL1AW1VzT3TYT0hXWzVI6HWJyKhIaMqNtZdE5nWvK5DhNjz3+CNR9GS3XZZ5aR64W6HHG9M57P4pVTegfwysm6F38cIRREKd1NKrdibXh0LwYHjZqqMvryrkeqLWzmVcdnmQ9uIiBxFpslo3Qy4Mea0yKsBcANr8X3/9zM31AhOJfvDsUkVqszvGIO9Asv1poB5bF6y0f7KsOigvLhgE3sKyiB5Gab03gVbfTv1t5log==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEHAt0NP5UNgSYo9kUxZD1wW6M1Mmh0LBI/St7/ldmI=;
 b=KZRaWjMNCp0wz4Pd5mwgD29KBolAZZ7LGo5Yk5PSjmhl/ok3urDSvWVLWpgHaJ3Bf7uTAsQY9iFWagG1GecAtZCzJzXpFL4+SEoK4BQXPFsP1rleasOW778Z/26t3iU0IN3RZBKx3dldDUsfymbpZ6no1wCYRcPxzDKw9zZI8lEDUfPB4Y9dzNoruKMIA59t4WYX18I7MXDLjAeduy6z65F+Pf4KkpeMwOEwKd4Jzgl2hN52zoKShT6u4O9F99fKv6IsHCdMHiEXy7rzwq9C2uSTmMZN5oTqT+bKTL+V++PpzaqwtsHJOjRz0ckazlNXn8oEoj3vBqxXTHcBtZO4PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEHAt0NP5UNgSYo9kUxZD1wW6M1Mmh0LBI/St7/ldmI=;
 b=v91VeFD+mdsYBCpclCFUjd8cpTVU+7fbAPkSrz6YOuvPgv0lvigUPxmBPG1jOW6C3IaS5pSS+O0+D4RtiiQAjH93BeK8xKieDS0v97IhRzbnMz9c5mN3cCjkitoyuTrv8N2sueBfjsfhBcqVG//X0f75ciPrmz2fhQG+SymKETE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3185.eurprd08.prod.outlook.com (2603:10a6:208:65::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 12:52:51 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 12:52:51 +0000
Message-ID: <11f5ed2f-6f22-78cf-f11c-98c4f13ef655@virtuozzo.com>
Date: Tue, 28 Dec 2021 15:52:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/6] migration: is_ram changed to is_iterable
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, den@virtuozzo.com
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-2-nikita.lapshin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211224111148.345438-2-nikita.lapshin@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32d74ad2-1da8-44c2-09a3-08d9ca00f4ea
X-MS-TrafficTypeDiagnostic: AM0PR08MB3185:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3185F53B1C78F69083F2B501C1439@AM0PR08MB3185.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wiU/nzvAlhHtYEmZFAuwpuhqHedA3kfkD7dmT8WBvDmOOj6CC3X0gicoH0jQnmmqpOouxABihpyH8B+bh6USeZd8Gvdv6JtBftcoMDbwzzHA8Y6zJNUDlfVOsgzCC5iMQUBRJ1DKaqq/8aPawlb5ORr2BFb6xMzUTa3gi7+kibTrlOlu0n2Ey+7gUzsrykWa7qP8RRUH9yVXwoRGOLZWV225dR+lDUCjUOwsMXirlfgkwUarlILVODjadRaigbjW+ERucT+Jo9SGaBzVZKmV/0C/1ecFGyVUIKTwkN5zJvNm7ihfV3CRoF6F0a40pKtMF8Z08FaNZm2KWII2D84U429VXh7La0+gIZhgns1XRpxxT2P/LV3AHeL43eLzNo1v32iNZF6y0zojowPzvdI3q8J7ECZ8x8IZxlmO4fy4kunnwhVllxJpI12NL6AuS9KkodzafuW6fDnZV8srKCoM1Wc5brUhXdAc2XhLEmMShVasT4UMOOBJYpXc3ZJWhw2+6QVG4/SrXKoARU0uTfpTqEhe49yecAbYS/JF4udZv6rUdlvU3MPqKr3kit2ippaZK/hzgAgoK/mBWCUYViCFym/vqsOtAfdNLJX2SjX+DslsTbQR0YAe6XWmPlu1extFTAlvBg2eGJBCE2u5o3s0lHNKyh1pa+TtbdriIez3jHgZ8+iG4JXnpWTPOrcKRx7W3a1stlSvZUrf8Vt+gr6sJu+OuxKHBGjLaj6AQyqLgFKvIknh1X14hmUEejqhMJaiQWyU02Qyw/NKgPhrzqM1VA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(66556008)(66476007)(26005)(8936002)(86362001)(186003)(31696002)(66946007)(52116002)(4326008)(6486002)(6666004)(2906002)(31686004)(508600001)(38350700002)(5660300002)(8676002)(4744005)(6512007)(2616005)(107886003)(36756003)(6506007)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnpjclNFTFBZRzRTQlN4VXVpNnpYUHd1MDloNDluMCtaWjd2SUd2bUVNSG9V?=
 =?utf-8?B?Q3VXNC9YME9qdGo5YXB4eEJ4aVVlTktYZ0V6d2l3cXhoZW9VOXdlN1N0VFNr?=
 =?utf-8?B?YWNiemJ4WWFzbHN5K3NkdTZBNWF1cEh4MnhYcmMreTl0bFUvWi85QmlRYkox?=
 =?utf-8?B?QVRxb3JJb0NSeTlqSlkxMmM1SVNWWTVUMVJnR0s1UjMvcHcySm9XNmN1Nk9H?=
 =?utf-8?B?eCswR01QZXNKczk5U2dvV0J0aWZwWGY3Qk5kVFUzRnhLVEZvdHRxMmtVSWd6?=
 =?utf-8?B?djY2NEVjTENSN0VXN1RMRk1qN1d4dDQ2c3RrVjl5Zmtxc2FpVXFXdE1mQjk4?=
 =?utf-8?B?ZSt1enNwSkM5TzU3aU1yZyt1SzJyYzBLYUd3aURXVG1hc2Jya2pPMlc5RGxU?=
 =?utf-8?B?NVFaNHpQWjBsbm90Q3B5UWY3T2FzMmozUHlMS2IxUFU0aUZHbzRTcVVEeEZ2?=
 =?utf-8?B?SjhLV0VMN0pWdzZIWjlrSm1RSTk0UFBkWFB6ck1KNDhqdTN1TEpmSFdVaklS?=
 =?utf-8?B?RDcrYmxHWlVsUHdGd2t0NUlNUmJBWUhEdXo0ZGlUNlBpRk5tczd1WW5rT3Nw?=
 =?utf-8?B?bVdmbGFWNTlKMlJLcWF1ZFhCZ25nVjlLK0IxUytUVXN5Z0dSSHV0QkZqWVhT?=
 =?utf-8?B?aUNsMTVVcWhKYkw5d1hzeEF6bmUxT1d2cVZkRlFpZTl6Y01JN1I0dWVwMjFv?=
 =?utf-8?B?anJRK1BGQXd6YkxrWWJuRm9QQVJYV2d3V3h4NXZHaTFMeERGcGM5NWUzNy9t?=
 =?utf-8?B?YVpJcGpQeE5jSVZId2ZhT2NpY2NyM1poRXlCNnhZY3JpbTQ1SDl2TmpZK0pa?=
 =?utf-8?B?QkZCdm4vQWlPSjlVR2crUDF3K3ZkYUY4R1Q0d0sxZDYyeEkyRU9TcXYvNTNr?=
 =?utf-8?B?aDFROU1UZ09uM0VLWWwveXlBRzhpYlArVDJNd0Y5dlgzTWMrRytQeDl6UVMv?=
 =?utf-8?B?cHNNdUtpamQ2dTFKUnZHSk1ESHVPVUxqQ01uK3k0L3JmUVlPb004VFBQeGxu?=
 =?utf-8?B?bVRzN1JxNjR0Rm9wQlZJS0NkU1dEMnJtbXN6a1diK3EyVEtXelFSRW5HaGZD?=
 =?utf-8?B?TzhuZFFERllqa2xQejRodWpEeWFtNVltaFJ3dUZDb01vLzdRalpqd0tMVXp2?=
 =?utf-8?B?U091M1VqV2MvWVRHZUR3ME9DeWJtMEtVeXh1d29uTDlaaHpzWEF1bXlVOU5j?=
 =?utf-8?B?SGNWOS9SRmpJME81NWxDcDBkQkxScklqOVlRejRXVUJFZENJMkdEL0FFQjdM?=
 =?utf-8?B?NlVYVmVKOHNDSHl6aHZrenBnWEN6SzJPWmpMTW5LSkh4YTMyMXRCeG5kTDlv?=
 =?utf-8?B?NTJWaG8zL0gvWUFIUnZFRG44blMvenJUaCs1eld4K1dqWUJlWEJaSGlXT3E3?=
 =?utf-8?B?cXpSNFl0ZXQxMndnNk9BSS85TWN1U0h2VWROcFhJL1pHT01YM1pGTTN4RHRi?=
 =?utf-8?B?cWg1QVBTdk51ZmJiZ2swUVdEMzBlMFBxdGR0VnRkQnEveHBvVGtheXBIWlVJ?=
 =?utf-8?B?eXdFdHhLam80dmNEV3YvWXN3cExrQVgyY2U3S0hMZFVqLzlTRHEya1Z4alcr?=
 =?utf-8?B?R3U5QXZPUlNTYzlqdXdKaUxpVmR3NFpqbXRuY1NzTHV2d1ZubFNjbXlPaUlk?=
 =?utf-8?B?V1hDUmFSQmcvVXgrcTAzd2lsajFVUG5ySFU5Z2NQNDJDR3dtK0lBcnJFa2E0?=
 =?utf-8?B?MmdMbDVIVVEzU294VHYzY2MxTHorRm40TGlqRk1meEUrM0RJdjlrQ2hoaXFY?=
 =?utf-8?B?NGF6YStwQ2YrbUdTM1gyOXhxVE1WcHVHb0hISVloN3FHdEdHOGxSaDlweXQ0?=
 =?utf-8?B?ZDI5cWpMRENPalMrSkI3Znd4TlpCeVRZWHkvazA5eFpRNE80ZWhXMVJTTk51?=
 =?utf-8?B?SThOQmtTdStabUdRcWhScUhpL2ZLNW5ENXFUUmFaZ1c4T3RJYkJFODVyK1dW?=
 =?utf-8?B?ZFkxc09ISDc3SGtjYVNKcmszTHI3MFY4UGpoMUZQN0lpZ0ZnRTgrWXJTQjg2?=
 =?utf-8?B?MmhMN3ZBTTVYSmFUS3pPZFc3R0VlQzB1aHBPUnVuaVJvYkVvNUthWEl3bTFy?=
 =?utf-8?B?MitsU29UVWZEamdpY1FkNVpvL213UUVIVUlLeDkzcGpCcUJSdFhDWEMvaWJj?=
 =?utf-8?B?OXVzRTBUWmRtbWY2b1VpVng3QTF3Z2I1ZUhHYVpNREI4Vmg2c3RxNE8wOE9t?=
 =?utf-8?B?MVhIN1ZHTEpwdmRjQXN0ckdJajlDTUZ3c21mTStpRDRiWlk5VmRwc0tidGpx?=
 =?utf-8?B?M05BYkVXYkVXRlZ1SDNjcHZWNjdBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d74ad2-1da8-44c2-09a3-08d9ca00f4ea
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 12:52:51.3361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIuCO+P+OsFHg/LF/WQd1EEPUv4HoK3n6kMtoEq4BDFbdKS7YJoynd4uGzvHO49MSogKOtFYSHmNEEgkSyBJLberv70aGM2/pDHw25By0nE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3185
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::722
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::722;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

24.12.2021 14:11, Nikita Lapshin wrote:
> For new migration capabilities upcoming we need to use something
> like is_ram for this purpose. This member of struction is true
> not only for RAM so it should be renamed.
> 
> Signed-off-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

