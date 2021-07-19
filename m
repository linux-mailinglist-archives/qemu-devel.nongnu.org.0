Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648683CD61D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:52:38 +0200 (CEST)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ThF-0001Rr-FS
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5Tg1-0008Tv-UZ; Mon, 19 Jul 2021 09:51:21 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:16132 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5Tfy-0000t8-Qf; Mon, 19 Jul 2021 09:51:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJmVfIYtAA3tqIrardeuhN8563QKSJQn2e5PQcUQq0I414PmRNc+wISNDPKJa66VGLMV5LzbdxfDrP7Az+ip3clPEVJwaROAVRyfLmZJbeQqGEdxs5A0Y4LswlTZDvMhLPrT1E9JA3LYtC0r1W9IkwHUqRhYR33yPork1GI/BDfNrbD5Od/5N5iA9iva/0p9x4hHfZK55uaD9x21QK0utQ0t6At+tt1Jo99KNHXnjKK0Tqp3tUmd5RHdw7s635bw5z0ry+gEZ9cyRUA+UYQeWV6RAtGbkDWFNynp0mZ9yA52u0AUpZpDKLpypFCvYvIypZZXQYAmKBylhJaRKclYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/O8AwXWvOSlOZP0/s9AkLIcVUYLiiC5g/g1Q/IN6VU=;
 b=U5ndxG67j2DidylL2Z+PgR8kKg0DHml6eh1yFbQsohICfmRlDjbjRYa/jsIc22/WYjKvf852L0qE349fvVy1dKDWHnwRTeaRLcWazckbDmAo7NQl/w8f3PKcMHqL27ehCpUjr3sMGm2kUNOxJIfjDwUgR0cv+iRJjrzFGKX+YZB+rPfemwqxD49XtQPNJ4DRAKyMOdfdwQgTrzbAdu8T8KCWrsvz76SEU7lC9LsOJTV1lb92efCSf0npECff892UcvIYzbZ40ob9spcR4uHualI94wgf5W3lXFnN6v5hB3jMplKGGJieuo6fhGkoLFvSym//CkgBwcAhkdta1sUDaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/O8AwXWvOSlOZP0/s9AkLIcVUYLiiC5g/g1Q/IN6VU=;
 b=KO5hp2SDOsT4kriCZrUQZKexdOxGxc/vJ5zXpw+XNUrVwLcuPs7JQW1QPRkRLz5Q/vMbICiUkn1H6zPaRO43KAsCbjcOn4CV0llVWPu/rVQQV4Hm7gQBnBdCdjrOY3Bi5lmt9REnt4cYrgYftcYyrg/lAf1yv/CvHyuDpBC1Xw4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 13:51:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 13:51:15 +0000
Subject: Re: [PATCH 02/14] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org, jsnow@redhat.com
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-3-vsementsov@virtuozzo.com>
 <5e3574ea-2d7a-d159-3882-3e627841f368@redhat.com>
 <34791223-deb6-36ec-1c97-9956da2395e2@virtuozzo.com>
 <ac56e6a0-8303-b290-fb63-9ab1f6a0c6ef@virtuozzo.com>
Message-ID: <ba072e04-5e4d-10ba-15c3-66074892ccec@virtuozzo.com>
Date: Mon, 19 Jul 2021 16:51:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <ac56e6a0-8303-b290-fb63-9ab1f6a0c6ef@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0041.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 PR3P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.28 via Frontend Transport; Mon, 19 Jul 2021 13:51:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fccb7d1c-4965-4dac-43db-08d94abc46ea
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6790E4D7DCB22FF513DA8C46C1E19@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 927B0npnFSA4JO9G6IEDnMP61M7IZ5tQD42eKnPl9ec1wetOs4zwp/ywFq0U3xzWeVKNLoRLkslb9a1mb/zqn+kkv5PHov0shSXct5T/XKkBj/2Ywxm0q3IFVzySmk9j4AfYyfn/zZwV4vkq/aizWGPYMpONtoOGyA3jQmgmxU4z7WgK2/f6prQoiBEfblN0OR+cR/WThcktmVKti2YT3iEq+bwi008zU8KGRHlX8mkEqmz/S/rMYZX2Hqxl0U0CqJdMBSfJwCGKpQI3t+paQyzh57d1yh+2rGBhMrIoERu8t/4nAKuDD0M0aoq0DNV9cT7TgWRE5bNqKYRh7E1YO+oa3kjr+DfOlIzHWcSfwdPwFWdGuYjgMczxd9VfCFODMb5fl0PsPez5biXSB5ZcmlAKHxU1RdOS8dToAwfAygQ7QaR8O3Eec3Kb0d/czdxZYPKiFQBMO9QhJd1LtVsUQbFJhU5vizNDZ6DShf72qYWD70pfgX2xKiURGweQEBV7zq54dRplYPOVuq6FF1j9Hvp2awtYxMti4qISi5WW5PmBdsYTrj+BN2b5lY8Cd0uVhwVv9rabpQ7Tm47b/Q2emXL+2/suvWxtKn1cw55AfKJWIeEAWam229u2diFlGoKJa/jfCPRfjZaZuEcMoP9GGEKdgH2soIdl6+T1L7lAZ6+aMJEI6DyZ5XUCDg/gXV3xBibURVAyn5iBDdfS5Er6BK7M+eQBqiwOnsAWUqHx8HxhoxLwnDEN1VNCsDq6mQgG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39840400004)(52116002)(16576012)(26005)(186003)(478600001)(316002)(31686004)(5660300002)(38350700002)(2616005)(38100700002)(4326008)(36756003)(8936002)(66476007)(66556008)(86362001)(956004)(2906002)(31696002)(66946007)(8676002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE9iMWw2cHVKYSt0Z2hBeWhwa21yUXFCRFd6T1BHRzNEc2RlYS91RTNMM09L?=
 =?utf-8?B?eVlpQVF4QjRlTGdNSDdJMmt2QjdqUlZqRys3UUVEcFovNDlGUndDdUFINlVn?=
 =?utf-8?B?L2grQmtYcXZVaHRmVnVPNGJBWXQvM3pPazVtUUd1MlM1VWlDcFg3QlRVVHV0?=
 =?utf-8?B?cjlLM1hCWW00Y1RlaGVXWFc2WVBXeGhIdmFPVGdQZm1YOVhLZXpFZTVqUlVv?=
 =?utf-8?B?emgyNEFKeDVtdStDcnNhYkNybnVDVVFLRkhlN0lzR211T21IUzVta1lQN2Rj?=
 =?utf-8?B?V1duSUpyU29ZQ1Q4L1JTTENzUUpHLzJ0eDVRWGkzZWRqcy9sR21DcVNCOHEv?=
 =?utf-8?B?YW1ET1VrNnJ5c05tRUprU2F6ZjMyRU9jc0lQOHp2SkpIOHhxOU9mUFl1eU5a?=
 =?utf-8?B?RjZwcVpBOGcyc043MFZSNlYyMlpxUjh4QWJNOHcxN2xJTytNZnd5QXhiL0tH?=
 =?utf-8?B?dU94djlMVDd6RlpRa284KzVhRVoxYjVjek9hakFha3ZCOTczQ282THBtT2lU?=
 =?utf-8?B?Q1RWZ1BoU1grL2hrZHNPbHNkYzR3ZzhaU3RCbjA3QTM4MlFRV1FhK1c5TlAw?=
 =?utf-8?B?VUdqaG12VmNPbzRKaHYrQytQTFFSWERlbHNtUEdyQlNCYnBXMlNiNVRDQ1N4?=
 =?utf-8?B?OWZoMUNlTzB4N0pJQ0ZMZnhaNkZzMHBveXNRTFEySFdQMkJvUktTSS9mL0c3?=
 =?utf-8?B?UEloeXhKTitmemNDdUt2dWVodFBoT3pVQkc3ODJGRW1LOUtQUDV4L3lmUTA1?=
 =?utf-8?B?bGVYUmdTTVFleXRsZzJ5UzNPeElmSVgrMmozR25xTWt5OFJPTmNNYjk2UUFQ?=
 =?utf-8?B?eFgyTW94RjVpdHpxSHVPYklKek9ZYVBnOTFkbDhlVjltSjNDRUxxQ1BLdjlG?=
 =?utf-8?B?V0FNb0R0dW5zeWVod2ZZTUJpR2hCYm85NzFINnFIZDJpSEVqWFdybWtWS1Jl?=
 =?utf-8?B?aE9kbE9XSHZuY3NVckNVa0x2RWxXV20vcy9aR1JEeWtRbXljQlE4MVlOSGR2?=
 =?utf-8?B?VUNiRVVpZVUySlF6bjhoWXpmUnlQWWoxVzJLRHc3WjI5OXNINHNObzdtakNq?=
 =?utf-8?B?Y0dqNEwxMVJZSndpOEdhNmJla0VzWU90bWhZQmlmb2RLS0I5L2Q3bkpZNUFn?=
 =?utf-8?B?dVVVY2M2K0N6UUhYVkx0RVZpbjhrSGphSlFJZzREcS9Nd1BHZ3JVRmx3RUF4?=
 =?utf-8?B?aWlNRFlMQW5uaWF1NmN0WG0yTUFRelN2QnNPaEZvcTA1YUFCOG9talRqVlUv?=
 =?utf-8?B?Wm1iTzlSbytreERkMHp2ejkzZlp1UzY2S1ZtTUt2RHJocTBjaVVwbkh5OGxl?=
 =?utf-8?B?RG4wSGU2ZjdvQ2hGMmwwUjN6MitiVXVubXp5QmNZRkNreXAyYmZYaEU4Mm5q?=
 =?utf-8?B?OWJoY3prYUo1U3Iyb2VwbzZZVERaUmZTL2g0MFNQNWVZS1VBUU5HeWVKV1ds?=
 =?utf-8?B?Q29qb21wc0tabzBWNjR4d3BxcEdJNUtqU3JONGRoL1UwM0EvSW1qVER6bjlI?=
 =?utf-8?B?aU11VTJUTHNpNjlTREFXOGc0Ykk2RXI1Vkw4YS9oQ2pPVHB1cU9jeUYwYXl6?=
 =?utf-8?B?M0dPcFRsa0hidnJUcWNlcEpMeFJDaFA1T2xHclR4KzVpYWxWTTVHb2l1d1U3?=
 =?utf-8?B?QThqeGVBQVJla2xLeFpuNHhSZVVRZ2pXV0JzU1IzZ082bGJPV2xXSTJhdVJF?=
 =?utf-8?B?N3U1L0xXVFpnbjlzUWRiRDJlVnBaNFdzdWdGM2kxL2p0VUFPK052UE1ONnhE?=
 =?utf-8?Q?XT46+bYi0fpNvJKVly0kUtmj1wI/pPcDv4ibGKJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fccb7d1c-4965-4dac-43db-08d94abc46ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 13:51:15.4407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSoUv14i1a9iBR35ZoPXuqMOgbCvm4bMPjb5bf7wsDjTCh3QNdIOzgGAh7FbPv5+yj+sPNP16UESFf4vwG5ftnN3gIvr/IglkhjPHwElTic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6790
Received-SPF: pass client-ip=40.107.20.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

19.07.2021 15:58, Vladimir Sementsov-Ogievskiy wrote:
>>>>
>>>
>>> Could also be done with something like
>>>
>>> imgopts = os.environ.get('IMGOPTS')
>>
>> imgopts is a string after it. So you don't need to join it?
>>
>>> opts = optstr2dict(','.join(([imgopts] if imgopts else []) + parsed.o))
>>
>> Build a string to be than parsed looks strange IMHO..
> 
> Oh, but that's exactly what I should do anyway to cover several -o options. Now I see that what you write is correct.
> 
>>
>>>
>>> if parsed.f != 'qcow2' or (opts.get('compat') in ['v2', '0.10']):
>>>      opts.pop('compression_type', None)
>>>
>>> (Never tested, of course)
>>>
>>> Because optstr2dict() prioritizes later options over earlier ones. (Which is good, because that’s also qemu-img’s behavior.)
>>>
>>
>> Ok, I'll think about this all when prepare v2, and we'll see how it goes 

This way you also drop compression_type if test specify it. I think we shouldn't touch test specified options. Let it clearly fail instead.

We only want to ignore compression_type in IMGOPTS when create non-qcow2 image. I think I'll drop checking for compat: the only user for this check ic 065 and it's simpler to explicitly set compression_type in it even for compat=0.10 cases.

-- 
Best regards,
Vladimir

