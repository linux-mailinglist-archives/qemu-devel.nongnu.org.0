Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F461585025
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 14:40:39 +0200 (CEST)
Received: from localhost ([::1]:53626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHPIE-0003iX-33
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 08:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oHPEL-0006dd-VF; Fri, 29 Jul 2022 08:36:37 -0400
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:63111 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oHPEI-0001oI-Qx; Fri, 29 Jul 2022 08:36:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNyyunpPcCBqjLFJL9lqJAnT84qYrvzQDONFPyXEfg+j6MOya+ziy6KPvp6CrO7KX3KX/vKQBodHbG7ZwQJSEzX1Ak75XCoYldT2+QVkFVG/eXPqi+kApT3CgOUdyMT5Yxio7ElYf+In+iyo3hbXc8qHj8wWS4jwbtCB6+Sli62NyFyVx7eqzVpvcuF4NBOtUWjfn92n7rEGPaMHgD3RXDIwybmw4Fu7vdySzll3MfqfAzMOpMGPdrZ2Bhz+wwJ8kv8mr0che7PbqN4ICHcBhtBncuUePHlv57b1fCYXVOO7tODBQEruXyPsFM2FX1d0xg/ZcpwOff/iS0qH+wzgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWe5Cjb3AZzDvbPhTOB7w/eNJgnipxWHpdk1FHEpnBU=;
 b=QbWnDBxyINqAv8rzldo18xFcrm1z3ENJbZNGnTzx9zOQjV5Ffr2YAc4wPaVDyv125Ye3dfTQhlF98/6vvilohjf0qv8qlk1OPrarCz3Td5p/wkHeExidbPjvSiqukKWa/6PessqzzWqk0YU+4bPBLL6k0gAmkD/ORS3npuwkqa7aSy7xyQ+ep41r5xTxMwcnm/z7tAAukZmQwUvrcp9DDPCAMeSLwccqwNTL8Y8gYmiJmwVUTrSiBbDs6dVd6OhMlOJ/LQ0hk8ZVqMkp+BIRP6Mau4O1pIyfyy2xdaTJgMP2ja4W7GgrmqqqYi+dWgIUExSpC6nBCUWuSBzai+DIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWe5Cjb3AZzDvbPhTOB7w/eNJgnipxWHpdk1FHEpnBU=;
 b=kCO7nB0mrkktVnzkHhA5hoN9a54oPPQLCuWqpdc+vkDS2WocChgdLOtNLcieINfNPd0CDDrCLIOxDjOO+EOeBa+Dsn3kLPo4t6t8ucMqA7j85CQcZoh4qaQjAsg8GW0DC97PjlhXURX9SBSW0FgeujSqtl9Z2y1Zo97rM2rbvesrubityrpxVBeV9LFw6XYz4H4S9DJOP6gHD9pd1XjTpRS8It23IbTAGv3vcOKZoLi/f69BYQ1h05Ni3jpEgyUqaCt5Dj4j0qrIIgw60tvjSKxJmCJ63vrNawcWumLfKLOkYWs1w/kwIpjHJaajmoifAQZyoZJKvdCfFp7i9/I+Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM0PR08MB3026.eurprd08.prod.outlook.com (2603:10a6:208:65::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Fri, 29 Jul
 2022 12:36:25 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5458.026; Fri, 29 Jul 2022
 12:36:25 +0000
Message-ID: <0d0b7c13-9dd5-49a8-86cd-30a748959b7b@virtuozzo.com>
Date: Fri, 29 Jul 2022 14:36:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] block: add missed block_acct_setup with new block
 device init procedure
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20220711110725.425261-1-den@openvz.org>
 <1aa3921a-0e67-d580-9bf2-c098d242e380@yandex-team.ru>
 <66373021-7dad-953b-b244-75a4756a0b33@virtuozzo.com>
 <YuOkvmbvhzD2dsGq@redhat.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <YuOkvmbvhzD2dsGq@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0051.eurprd09.prod.outlook.com
 (2603:10a6:802:28::19) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30a99fd2-d587-407b-0521-08da715ef37e
X-MS-TrafficTypeDiagnostic: AM0PR08MB3026:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32YxI+nRUnZPsPlWSSxZf9ZCUk4x1lI7rHpv8dUyni+vS572r1GOKTfsd1E/xdNl/bPHhRm5xYvdWdeYlfXI+vIPuw/93vUNUvNBmRsKg4bruae0ed2RNPEQ7L7982vpWeBZbz4LO0+VnTi8kvV7UoYxx2896C65N72kw/LIq5bD5GhZ7Puptpe/vpi5JuxYAS5h6W5ZUBcFlUfZzjpp5yKFOKwPXH3+WyUEwoTlwQBKNwBpfoaUXuHLwBeo2xP3o9IZlqo+ZGY921540YzdZHkdSu0uj8Uu2euCqe8JuTMjezX5Ri7ffzy/PRLOOuhsR2MFhUvSR6dK/ArNrxTvWelTRsvB3LiIw5xaw2i7neqrAj0dENlhgw7/xmVhFsu0t6n1HZ/ALFSMmuBqO5FS6UtqldZ5s0/NckHk/a11IFIBYczIHIvJ4qv716rrInlzmL5UfkHVwVOfskVLEBCSPBtbM9dghFu3S4MQS06UFjJfWnqABPBWBMC+3PhyJ2MLsz0P323TXXz+2EqLhE6A1PDK/4lgcbozkSTPTCfioyYMU5V1uIEQh2XTNrMx67RovwPuwiHLdgk5TwmtytdEtDv2Tio7F/QP6sGrNxNQc8/7dhq9Bvi3R4h2K1YGnwZIMofTk/0oXwBShMGPZipxfHQ4Mj+fDhxwyWlp9iiX02924D8mkH9n7wA7kGmIDjIWIvw4kKp06CodlSBI6vPVNJGeWyDdvkEZQRftGIq01Xok3E5+xS33TQfkSZj2W28REggcDOBMZMSmLg2ryx4Q62VaBUM/yACQBq+4MXmjQegc5LGyABwSHO7cWImGpZKptZ3Lv3hLYYKSQlkLjKU88eRJVSau2TEKJUDCRD6leLa8GH3vwb8rp6uzNL5zDNH7em7PCl8yweyevcuvhEaP2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(396003)(376002)(346002)(39850400004)(5660300002)(83380400001)(66946007)(38100700002)(66476007)(8676002)(8936002)(2906002)(38350700002)(4326008)(66556008)(41300700001)(54906003)(6916009)(53546011)(31686004)(31696002)(36756003)(6512007)(966005)(26005)(52116002)(316002)(6486002)(186003)(86362001)(6506007)(478600001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emhsdlpYUG80QkF0TFVNZ3dOUDhBOFE3d1cxMXFKL2JyR0tNTytYUFoyY2Uy?=
 =?utf-8?B?OGxleURTeUQ3VDBKMEhqUVBhOVpKa25MQjg3bmFKMVFtRVB6Z1RQUXhPRHZ0?=
 =?utf-8?B?Kzd3YTYvcmpLYm9mdURuRUVBdUMzR1lxR2tCdVNzWkJERzZEcjByV1QzRjRa?=
 =?utf-8?B?QmkxOVEvdTdiWWh1M2pBTi9jZFhsM09DMHVvNkJMOEpaN0R2Z0FTeXd1c0Vu?=
 =?utf-8?B?bkVrZ0JSUVVTR0ZQenc3SFZtU1MzOXF2U3FoT1BCSjNwVVIxTTI4UDBEOVBj?=
 =?utf-8?B?azRBMGRwUG9QRkE3MWwrZ0c4YTRHUXYrSkczc2oxbDlkLzM0ckNDdW90ajl1?=
 =?utf-8?B?UDJlUW44cGRtUjlhdXMvcktzN3NPTUJYSTNFVStqYml6UjVOOVl4dzMwVHJB?=
 =?utf-8?B?REZjakVNclI1dWRQa0N4MzlHU0tJYmtoN0Jnci9ySTRlalFJZXBuTzRZLzFt?=
 =?utf-8?B?T2JNL1Fpd253V3RGUENvNmxxdzNTR0FjN1pkRTQ2a0N4VVlnbXMxZGUydVJT?=
 =?utf-8?B?dmdVL3lWZ0szOCt3UDl1WlFiSnlWUDlSZmU0dEdhdDdPM2MwdkRIR0gvVlYz?=
 =?utf-8?B?c2RVK1hJczJNdjlLRkN1TUV2SlJLT3hUclRWTXo2cjVBenNUb1oyUHh5UEN1?=
 =?utf-8?B?KzdOTTlhNUdQcGt1KzBjZ1EvMU1uS0txcUxJOE0veTlWU1Joa0FOT1NUTzVY?=
 =?utf-8?B?bktLS3BNZGZuZ3hWbTI4eDhYN1RlalRaNUJ3T0pQOVJhWndBNGRUMXQrNGcw?=
 =?utf-8?B?MC9vUzJlSHdTQWFKZmg0MTZNWk5WeDlBdElTM1BVaDBPdGZCVXk4Mmw3Y1NY?=
 =?utf-8?B?M256b2d3MnBvNUwzRERCSTY4OXdVTk5FTjM5bFNSMkU4aXF6T0d2MHMrb0lL?=
 =?utf-8?B?QllwRlk5UEJFVGY3Vzc1WEtzYjdHYW83azN5eUlLM21yS2puN3MwV24xazNz?=
 =?utf-8?B?cldrQlJRMjl6ekkxcXVqc29EakdKK3pwVm5pWkV2emxrTEZGQk80TzB1MXVh?=
 =?utf-8?B?aXdsVjloM0syYUpRRDlEN05LYWVBMXRVeFNEbDNqTU05ekFnSTBHQXZSTHRQ?=
 =?utf-8?B?eTFyWXJWYnJadmtUN2Y1MUxmZUxWTTRCVWc4S1BYaVo4eGgxb08ybXUraHZV?=
 =?utf-8?B?VzZiNkd3ajBvbVNsSThsd0ZvTkhCWXFKU0taOUU3NWZTVDN5Z2E3UU5lSjJl?=
 =?utf-8?B?b09yVEtjMmF0SDF2MjJhdjB4dXRYall2MGc1bFlDK0NMSXIvTjdTL2FpbjVT?=
 =?utf-8?B?dThkU1cyZm1HR2tDaFlXUnpvblI0WUhwZWNWQkVRMy9kVkpDZEp3anYzdzFO?=
 =?utf-8?B?MjNBRkw3d29YZklBcW15YitGTmF6dlFEYmVwelg3U0l3RjFQSlhlM2xscU5U?=
 =?utf-8?B?WlZTMnJXbXNoQnBrKzV3MVBINjRJL05Ja1ZlWTQ0NjRnTVYvWThWOGZJazJE?=
 =?utf-8?B?VGhNbm1jN2l5czhLckdoZis1RWZ5V0NEZ0F3VE1LMFM2U3VrZTkveWR0SnBL?=
 =?utf-8?B?S2kyQ1hHMHYrcFduempFM1kyVmxvUjcrNDBzWjdkNlFmSkkwREhocUdNM2NZ?=
 =?utf-8?B?bnIrZDIvMFQ1WkhZcFpiS0xrMmxSSVhZNmxXRmlKcE5yQUNsSjJoZ0Fwa2k3?=
 =?utf-8?B?azZPSXlEVDlLMFBJMVZMVndSSkNOYytvbVdvTTVhdC9PSEFtNFBpM2I5WXV6?=
 =?utf-8?B?alZSK2FaVUNZeWdmdkNsblJEK0xwbmJjTjhoai81dXQyRXludi80UlA5YTNz?=
 =?utf-8?B?ZDlLRXBDdG5PbmcrTXY0SWRwalE4NUdpSHUzL2JFVnZVZXRIS3ZVeUpZYUY4?=
 =?utf-8?B?d2VhZHFBTWRyNFF6VjdzN1dMTlRDS2JSNlI2Rlk1L0hPSG5tL3ExOXo4VTdY?=
 =?utf-8?B?cWhMM21XQkJQT0ZJbHNVZm1VV01HMzI2NTdKUmdWVWpVc3oyTFhwU0hNV1dl?=
 =?utf-8?B?cUJCbTFCbzdCNDd3ZllzKytxQUlhQjJxbUFETjNEMDhjMWk4bURVZ3d4TDZl?=
 =?utf-8?B?c0xPQnRvYmpLWmdCd3hFc0dXU1BHTEpRcWxnaVYwbTNRdkJJUG1tT21nVTZu?=
 =?utf-8?B?N2h1Sm16bDJnU3JJbXJ5cXZ6UnRPTi8rUG0vL05kemFPZXI3UjRuZ1JpalMw?=
 =?utf-8?Q?k7KU96EBC16PvzrDa3tFqNgJX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a99fd2-d587-407b-0521-08da715ef37e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 12:36:25.3426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hX0j69syVIopvUkiWMoUFTMVnszZ8TRH4t+rDtbcnnP6TignYzC+FyewP20WkHad1jw/Uc1hyjaDeQfq2rsayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3026
Received-SPF: pass client-ip=40.107.8.119; envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 29.07.2022 11:13, Kevin Wolf wrote:
> Am 28.07.2022 um 21:27 hat Denis V. Lunev geschrieben:
>> On 28.07.2022 16:42, Vladimir Sementsov-Ogievskiy wrote:
>>> On 7/11/22 14:07, Denis V. Lunev wrote:
>>>> Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
>>>> the first glance, but it has changed things a lot. 'libvirt' uses it to
>>>> detect that it should follow new initialization way and this changes
>>>> things considerably. With this procedure followed, blockdev_init() is
>>>> not called anymore and thus block_acct_setup() helper is not called.
>>> I'm not sure that 5f76a7aac156ca is really the corner stone.. But yes,
>>> libvirt moved to "blockdev era", which means that we don't use old
>>> -drive,
>>> instead block nodes are created by -blockdev / qmp: blockdev-add, and
>>> attached
>>> to block devices by node-name.
>>>
>> git bisected, thus I am sure here
>>
>>
>>> And if I understand correctly blockdev_init() is called only on -drive
>>> path.
>>>
>>> I have some questions:
>>>
>>> 1. After this patch, don't we call block_acct_setup() twice on old path
>>> with -drive? That seems safe as block_acct_setup just assign fields of
>>> BlockAcctStats.. But that's doesn't look good.
>>>
>> hmmm
> I don't think it's actually correct because then a value that was
> explicitly set with -drive will by overridden by the default provided by
> the device.
>
> A possible solution would be to switch the defaults in the BlockBackend
> initialisation back to true, and then have a ON_OFF_AUTO property in the
> devices to allow overriding the default from -drive. With -blockdev, the
> BlockBackend default will be hard coded to true and the options of the
> devices will be the only way to change it.
>
>>> 2. Do we really need these options? Could we instead just enable
>>> accounting invalid and failed ops unconditionally? I doubt that someone
>>> will learn that these new options appeared and will use them to disable
>>> the failed/invalid accounting again.
>>>
>> I can move assignment of these fields to true int
>> block_acct_init() and forget about "configurable"
>> items in new path. I do not think that somebody
>> ever has these options set.
> Well, whether anyone uses the option is a different question. I don't
> know. But it has existed for many years.
I have said about very small patch like the following

iris ~/src/qemu $ git diff
diff --git a/block/accounting.c b/block/accounting.c
index 2030851d79..c20d6ba9a0 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -38,6 +38,8 @@ void block_acct_init(BlockAcctStats *stats)
      if (qtest_enabled()) {
          clock_type = QEMU_CLOCK_VIRTUAL;
      }
+    stats->account_invalid = true;
+    stats->account_failed = true;
  }

  void block_acct_setup(BlockAcctStats *stats, bool account_invalid,
iris ~/src/qemu $

but your proposal with ON_OFF_AUTO will work for me too.

The real question - do we really need to publish this option
for the external to configure it?

>> The real question in this patch is that this initialization
>> was a precondition for old good "long IO" report
>> configuration, which should be "enableable".
>>
>> But  we could move this option to "tracked request"
>> layer only and this will solve my puzzle. So, I'll move
>> "long IO report" to tracked request level only and will
>> create an option for it on bdrv_ level and will avoid
>> it on blk_ accounting.
>>
>> What do you think?
> I'm not sure what you mean by "long IO report". Don't these switches
> just change which kind of operations are counted into statistics rather
> than changing the structure of the report?
>
> Conceptually, I would like accounting on the block node level, but it's
> not what we have been doing, so it would be a big change.
>
I have to say sorry again. I have found this place once I have
reverted to my very old series discussed here + some late
additions on top of it done by Vladimir.
https://lists.defectivebydesign.org/archive/html/qemu-devel/2020-07/msg03772.html

I will definitely have to come back to this later.

Den

