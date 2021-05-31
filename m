Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470C396529
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:24:07 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkhy-0004q4-6D
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnkg4-0002PW-S2; Mon, 31 May 2021 12:22:08 -0400
Received: from mail-eopbgr10097.outbound.protection.outlook.com
 ([40.107.1.97]:64078 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnkg2-0001hb-Fy; Mon, 31 May 2021 12:22:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ46q1cR0GLOmpRQLBf1t4fEgDV5LLeC52aEUObGLFre+Zx+hzBfJY8K83PN8w5dBoW/LhYAJjWGB/S56CHi4sQgLY98Of+W64tDoKTk8rxQ3LMSeFm8+3k/itMKXKkPvDvTTHXGR3hXolXyORwTgaj820ngOC/cdpm1H6RpRqvxIrv63mh50MKO3SNqnMgCpJ9hcvBfDzbTkMjfHg0OdicCqkNTKotTN10p1P02B08Bvl62WJcXG/ubmJFtI+A2JR3Due0k77+sVYWhs7h7QOq2vx9OuKR+ZCMGvz7e/1Rz2UOE9qnWfXjDsXr9Wfz1g808drhhIarVH8zOoM9aOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXTdbVFgaxUyINTBmYYxLjOlemdnBJsqGwnpJPQ20bQ=;
 b=Foz9uIr5MNOj6wpsBd+PWTODA/u9d1tdJSjhFfHtBUALS/CTxWKH7MGhS2HBEUi43GfLqh35uJB/aSaWA0U9t8tpk+FRuLx6tNV/vDY8mld1l/A/1J7DCZ/MtAuQ/8wRHG0xRf7do/rpawmoRisa9nIfwGMWOUvwS7NMTHx6UWd3zZRRHQacm2k3E11shkzUrH7gywYi+TnfhDQi9LC2CxSmFxrypqNDVv3shgHDhzyZOnhJpPSCb0mfJK4SuX8dTlIWmbOzo6rnyPje6I/AhjssTLNk2v2zbovDpkJ5tSBmbvApKKnjsNFHOBweZkJHMAG0trt3Cr3eYBgMzRIBEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXTdbVFgaxUyINTBmYYxLjOlemdnBJsqGwnpJPQ20bQ=;
 b=n0yF6NikyxSAKHEYmQmsMqnVGNW3pQyDRAIGHsldhWkNobElpDvGmli/MCXDagSNXSzQhiacbXkPrGZlHh3pMevkm5zWhUHypQbN8DK6Bo2NhMwt1iAJBak18dEnb0siSyryGsA8xduWRdEn1OXxo38jOGvttKYxRHFi155+Bn4=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 16:22:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 16:22:02 +0000
Subject: Re: [PATCH v2 4/5] block: simplify bdrv_child_user_desc()
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 berto@igalia.com
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
 <20210504094510.25032-5-vsementsov@virtuozzo.com>
 <YLUFz4zbK3Xlm6Rs@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d98a61e2-e840-d736-5b03-a104335a91a9@virtuozzo.com>
Date: Mon, 31 May 2021 19:22:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YLUFz4zbK3Xlm6Rs@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM8P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM8P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 16:22:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8797ea25-767f-47ae-a830-08d9245038ea
X-MS-TrafficTypeDiagnostic: AM6PR08MB4214:
X-Microsoft-Antispam-PRVS: <AM6PR08MB42142EBC87B5EC069A7B7D6FC13F9@AM6PR08MB4214.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:287;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O7zSaECdy7e3dk55HzSEwK1lj1LWyopZL4qzQZ37WXGclZSM98XeIvADFQgsqXOy4s+3wY5DuTc0WUN/vFf3pMv1y29V0I6Qk3BZjgVe7LeIM4JNUdVfa0nkT6Y/uLPd30pFcS/3x7WQ8R5LPAs0hrsAHQnZGSTK/p6yXP3ae4YU3jYOD/u6f8lLlHqb97ML5NHqz7prh8dFFq2hMSxOvTx48BHnAVwEANPlyizr7GkLG1zyT6kFJrGDEhMHvZU/bnrm2ATyEzUFO49PgKnVaNcZ5oGmBIB4Z4Eo27sqLiH8Nl9ZimP8AUnBezeSfV28MM3ZDk9+LcxfMRCqbXYO5/XJLpA7Dra02W6lCgXSog8h6ip5LJSy+zq9i0B92HaAFFeDMvIY0FkhKkV8vRk5JsLOJYsM1Y3KYH16/Czmo8ZeVXqQthzUMVJKzkkiHJaSt4axQgYAZgwL7BCnbGpj3i2Mg4YtYkoznJFnBqI/YDPrfTm3FKGER5k4g7kAM/tMGeFJiS4H/Wa3/G9FjIXGJyC9xQVJ7Ky7mh+hs3KriEP6L91qi9uDNqneQEfcQyndsYz2qjgraw1nmN/iSMJ6Afquf6EBVLT/nRmHPqsACwxD56eRj/jUFCAkHE7CM4Ghntjaa62wNA2+N0g+jH5Bb1UYeWpAp1FtACsnyTA9JfIV+eqELyo3ZdCJ+/HeqQL/TgHhVJIgb9DD1yBVVzwCeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66476007)(86362001)(66556008)(956004)(83380400001)(2616005)(8676002)(36756003)(31686004)(2906002)(8936002)(6916009)(5660300002)(16576012)(52116002)(4744005)(186003)(16526019)(498600001)(6486002)(38350700002)(26005)(4326008)(38100700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dTNiSlFneW1LeDM3bTB1MnZFN2FMOFVzY2EvWi9ZSG1yMW42OFVuc0IrNVI5?=
 =?utf-8?B?OWU1d0FBYWlLeTlFYk8va3B6MFNDWnRXd0d4bURlV3h0YnJyRTl5dnlDb29I?=
 =?utf-8?B?RllFY1prQUVYNmlYNVVBUCtjc1dPOFV5WC84dFVjcG9LU0dSU0szRW5uczdD?=
 =?utf-8?B?SGhhNGRIbUZZaXdGWjg0Z2tMaE85N1k3QjloeTQyVEtHYTV0VjNwNU9kOFNE?=
 =?utf-8?B?T2JCRGhwTUhhNlJRSG5Eb09SUmtURTE1SkZLNFBpeDVFMmxIL1lYb0pyMmlR?=
 =?utf-8?B?OC9zQUtiYUdSVDRLL3ZNVDhOdk5OaTU2b1lJdlpPTk9Dbnhha3JBY0R5TUVI?=
 =?utf-8?B?TUNPSnk2dlFjbGpzd3NIbkxpMWJnSlNtTHA1RHJWY09NeWRLVXVzUE03ckd2?=
 =?utf-8?B?dWYxQllTUjJLQVBSc25nUTQ0UEtFUUFTcG1XU1FFTGZkQ1V4cEQ4VnFVSVVj?=
 =?utf-8?B?aXNhUExidkc4ZmNXT2lJSEtzcEtFU2hCaWpVKzVMVDVnM3g2OFVLYytKSDI2?=
 =?utf-8?B?MUFQcTRsNGZ0L3N6S2FueVk4WWdDd3V3cWZNT3kwNG9DVkh6UC9xdXppTm9B?=
 =?utf-8?B?ek9Md0NUMGQvb0VXbFh3bDc2dnF1alVGYUdNSGVkMnBhbmZRNzRKSnFBTU5P?=
 =?utf-8?B?WlFBcXZEb0RJSTdjS3dKZ016c1Q1S3NLMi9ZSFVURHRqRjFzcGhTa282djVZ?=
 =?utf-8?B?a0VnSEhvMlc0Vm1ZUjliaGY4VWc4TkZPWFI0eWtSa3ZDTDRVb3hlRGJ0Y0h4?=
 =?utf-8?B?eC9nTTBPbVBVYUJqakt1Sk5QUmkrZTVsc3JCUU9xUlBwc2FTaUtVdnJJUUpk?=
 =?utf-8?B?aFJJbzY4WDhWZ1daTzlBcnVsK2hHN1l6MFpiTlpYRDVpQ1N5VmZRcDYzMVI2?=
 =?utf-8?B?M2lDZHA4dFFxWHUxMHBFUlBuMFpRWlZZWTJES1dINXJ6a0tjSkRLcnlGWDBw?=
 =?utf-8?B?MjJPUjlUa1lsMGdRSnhOdWVta1ZwczQxakNLVExQYUdkaVlic3g0cEFPOVJR?=
 =?utf-8?B?VTVFeHRaMlUxTGx0L0prak9la0I4UXhXMnpiSjl1VWlJOGhiVHl5SjVYMUpt?=
 =?utf-8?B?b2dvdTVzdXozeXZPNldkd0lnZnJEOEJOZjJZeXZ5SU42R1lDdmhYTnQwQ05m?=
 =?utf-8?B?TFRIK0dLcjdZSkw0YUlqbVpnVGd5WEJQV1lwNmRjdnkzKzJrUjcwYVdVQy9x?=
 =?utf-8?B?YmdLTjFjRG1GSkFZbi80ZHNBeWM0ZTdUT1dPWjhPR3NoWlkreUFPR08raDFO?=
 =?utf-8?B?c0FHcVJDd2QyV29Hekc4dUExVUluL2h5WkIzTmVkYjJ3cWczaTR3Q0ZFUENu?=
 =?utf-8?B?N01WaWhXTDN3TXN6ZEtmcVVqQlZzUW1QMjdZVXdadkQ2S3BRUVE4Z25oamFE?=
 =?utf-8?B?SEFOc0NVRGJRb3dQNHk1aFRjd1ZOem16SU9VSGFhVG80NXY5dVhIMHI4THpO?=
 =?utf-8?B?ZFJGOVpFUGFxRWZHcHU0ai94T2tVYnVXcWsrTmNSVHR1MERiUnh3ZGxsd3pa?=
 =?utf-8?B?VDNYZ01qQzQva1J6Z0RnY295NnVvZ2Ewb1g0SnlmbUFKL05mQUpCQndvQ3Yv?=
 =?utf-8?B?T3Q1LzNvdXREM3VLNlVWc0xEQnRIcE1lM3NiTlRmWjFsVm9scE5HRlcvYTlW?=
 =?utf-8?B?YUM3eGJ1UjYxdXdkaDdYbUZJQWtROU5Vb2IxTzZlQ3BTOWpVYlh6eWRuSmR6?=
 =?utf-8?B?OTVZVXhqbVprYk1FOG5xa0pxcEhxTlZRQkNaa1UxNHJnWCt1WDZidDZ6cXpU?=
 =?utf-8?Q?kWGnPZYLyUdd8WWOa2qKrQ05GjdOQTdYd2sS22l?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8797ea25-767f-47ae-a830-08d9245038ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 16:22:02.1179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oM3Sx5C+8AO+2NVMFmI9OT/kh9xR431Rp/sjt0alAszjt8uGkn+zHOPnwEyfFKq35Jfhnkl/npwSPCktawIKQraePbq1GDt9kziuv6oXdwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4214
Received-SPF: pass client-ip=40.107.1.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7,
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

31.05.2021 18:50, Kevin Wolf wrote:
> Am 04.05.2021 um 11:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> All existing parent types (block nodes, block devices, jobs) has the
>> realization. So, drop unreachable code.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Your fixes the other days showed that vvfat has a BdrvChildClass, too.
> This instance doesn't define .get_parent_desc(), so the code that this
> patch removes is potentially still reachable.
> 

Right. Will fix it and add an assertion to bdrv_attach_child_common()


-- 
Best regards,
Vladimir

