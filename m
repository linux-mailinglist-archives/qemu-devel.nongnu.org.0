Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791C047031B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:48:48 +0100 (CET)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhCY-00088R-Ut
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:48:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvhA3-0006cc-QF; Fri, 10 Dec 2021 09:46:12 -0500
Received: from mail-eopbgr70091.outbound.protection.outlook.com
 ([40.107.7.91]:35420 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvhA1-0007IE-EU; Fri, 10 Dec 2021 09:46:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtcjZwksdH75okGz37emuUz9Dr1zo53ie5Xe8lCIWRV+0BZH01FCSLtZCY8Lf2T75nDW5PiusGunOIeW1E0oAujkKUvGchEBhFB3aG7a/1EyVzZW5z+8TXlo50p33Bi4mLe2dVHGBbxVUIcZj4ae6LrY3mSrQMTCX7I4cNQLrf5V53R9EUyg9E9xGXKid3dToKRtDjx+HeRMcv/wKs55Tlyahr+puPyGu7Y1jVXXD4f+ywNkE98r/16DsZPMz8apjWXa0+KdZ5vA4xcuwtuYyoFqk7+wnfFh/X85v3PZP0ahYdWR1SZlpepedJDaIYPZTmESpKc/KE/YKUiNzvmCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RsMioGTcVLgpVBiLvmkPmknlGMrNWkqAW6jo60miJU=;
 b=dtwnEddUrC86qOvC/HeA0wS2bf/YiRs49gMcS3UgvDgxRaHVBhLM+V19vvYgJlW83lwdgVKhbRVg8srZ1ImjVG7cA/xttHagCjHGprW9EcFDX6ja7BS7DnJplWl+NcbgdqDqbqSmxDTL0gP6llnRrWKNaddXOhgJwH01XKC9Zd8ZfbLH07Eh7s/DaGsHy6BBBWGfOyB0Oj9EkXDpMYYdo7Wzn9P6lpMqwoLS/BiTnwv122VuUQ+8iia4hj8cqedMmMhTT78LKM6gfYFH74klJ62NDWyFWG5eUbTeheltdHAm3AZUkh6UeqCRCkvHfcdP2UPNhmbhX1AcLcZtee5FKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RsMioGTcVLgpVBiLvmkPmknlGMrNWkqAW6jo60miJU=;
 b=hOw5MdSV1/Pt/98t+vMxInN537w08kuxs/osmYPQNVxJpEWsH6ZzHs9G+NM7q9GcmtNWwPN60Z7NyGw06cwgEXXWFpBqtAgSgwoCwFIxLtXBz+cE4w5DvrnB5BcstaWvv3F4D7B9ygHeHDOURlnsjRlc6nQCPHotoBv8HeS+heU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4147.eurprd08.prod.outlook.com (2603:10a6:208:12c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Fri, 10 Dec
 2021 14:46:05 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 10 Dec 2021
 14:46:05 +0000
Message-ID: <a1b79536-8715-1bf2-729c-2aae4345050b@virtuozzo.com>
Date: Fri, 10 Dec 2021 17:46:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/3] iotests: check: multiprocessing support
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 jsnow@redhat.com, den@openvz.org
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-4-vsementsov@virtuozzo.com>
 <YbNl6BA0shsS6TX1@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YbNl6BA0shsS6TX1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 14:46:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe3d91d4-e60d-491d-f93b-08d9bbebcb8c
X-MS-TrafficTypeDiagnostic: AM0PR08MB4147:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4147EE8310330C75C5DB1715C1719@AM0PR08MB4147.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MlFbWe11sj5pFJ6eir2DYBIBn5RS3Llj0ynds6DSYNpXe3xW3XVyDTK6MX7PL0pX2xp7GJgrk6Jh4WU55ORErxswuhZHX0jhhVmOh9M6p8Ztzw+xQKFVDemHVLy6eAyppJiqMrt3bFs0R705wNHQRs7jzvLOCSzeY/bFOehvFGBmt9EynY+wzLU7096eO/q/i5HBjltJiFz9TsjU4v8f7+F8Ayf/aG04tpNoZVNVbM3Kd+BHG+TDQyW1OdG0gQu0iFsfz6qn0DxDRWvmQLzLdidYi2+g2Dy5q6kSk0FJn/LsixOj8vztQsLJEnIYSiAkjnA+mMGoJMO256X67+Y9G4QVLFbRO3xHIMqr3G6gyOAzWUyIN04Yc4pDRce0pVRMQcUCTGlV0aC9Qxz2GHR04Jn4tLduUeONjTfvFB8Tsf/Jj6yuXYE4DfRTRueN18fedJJ0LvpC3PH/KfX4VlcQn1+yvdv+jdVB6ZCgO6aDHHJZxYF2NS+sxROG6JYyHjYh+D9V11OY2SS7IYsedfdBRfbcfhAEiRRDS/HhPGabt8kVx47ocTEF589i13eHD+hMZZw4ZI0W+ahOgkeWW7nGq3D6x+gFDuAGI9CjB0+InZHTrHDhghgLV7hnbam1OPwiPofECHDB9oHXSAlid7RArnoerskNye5dHB/DEn1beG0fqBaiLbvucq00QbB0N0Zdqvrt323xrSaQshlshrLhKJSAoSxATI2CzfJnt7oJcfy+jzDSgigu8tBuDJIT7dPILudmRgpPTxjq5mt3o92N5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(26005)(8676002)(52116002)(16576012)(66946007)(186003)(31686004)(2906002)(66476007)(107886003)(4326008)(8936002)(6916009)(2616005)(5660300002)(6486002)(508600001)(956004)(83380400001)(31696002)(36756003)(66556008)(316002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEM0b29qQ21HZDhKOXNXZFVnS0hNUEdJNDloMmNKTzdWTm42OGtrUHhSelNY?=
 =?utf-8?B?V0hIQ3dHdnZSTGtRT1JPb2JtTHZSeTllNis0c1lIUHlqV3RHY1crVy9HLzRO?=
 =?utf-8?B?aWlkSkdJSnQza0tWYXBvUUt3S1hSQmliUzBEUk1TaEIvdnhoblFJWURta0hU?=
 =?utf-8?B?TURCOCs1Slk4VWlBZnozMEozZVdkQUNJVmVQY3lCelRBcXh2aG5XRkdsWElz?=
 =?utf-8?B?TnB1SE5sUit6T2NxTHoyQ3c4YmRnaklpWEpubld1dExJVHpvTFFnTnNYZ2k1?=
 =?utf-8?B?QmRveHJ0T2dTTlV3bjJpZFd1WGtTdDdRWjR3aG1YcVZPclJpTnFUQnJDVWtB?=
 =?utf-8?B?YWlQTjBrWUVTdWRmYldqaFF4YS9uSUtyTTlLWitnajZRUUtNNGZaK3NldmxK?=
 =?utf-8?B?YnJuY3owYkxBSDcxZktPK2dEU3Q4RlBLZFg2dFJjOEpGRzhhMmFDeThlTkw1?=
 =?utf-8?B?TmJwTmh1UDU0WnZpeGtyVmlEcTZWZEw4Ukpzd0lMMDhvYVBYTys4blVkLzFz?=
 =?utf-8?B?NjJLdjVVbmNBWit0WUFkQWxQNk8rTkhiNlp1QTU2eXB4Y1JMaDFRRzRPNkxz?=
 =?utf-8?B?eHlzamNTbDVlNGVDTkJYaG9BSmNBSC90SHg1Nk51YUU0RlVOWjdxSGVQTVpq?=
 =?utf-8?B?WVhJa096TEU3N01LWjdSQ0pZVHgzRGs2TzNXQzcyTVovQ00rbm53Mit6MGhv?=
 =?utf-8?B?STV4dXJTRGJ1WllKT3BHSEpFY0Q3ME9LK1N5RTFoOG5tMXRyRE5KTjN3c1FP?=
 =?utf-8?B?UTltTWdjSGt4RU9iZ0RyczgxbEhvZnMyYU81S3FaSStlOGRxQmxuM0IrcUEv?=
 =?utf-8?B?QURyTUNZRXhncGNKQ2hWUUozNjJwQW5tZzFPWHl2QWJGeXI4MjVXSS9uTXQ1?=
 =?utf-8?B?a0hMUlVFWWJNeUNaUjI3TVAxV29QTmlkcTQrQUF0M2dJSnZSMndBRFZDSXFF?=
 =?utf-8?B?MFJFajNFb2xvZk9vb2ZlOUpBTlkyZy9mdTgrZHdHSndmdUY0MkExSGMrcXlp?=
 =?utf-8?B?TXppZzkwMHBJVHZ3akM0RVQyT1lYTlBlLzg3MjVJSEVDNDc3Z09ENnoyUkhs?=
 =?utf-8?B?a3Z3SEVlcXZRdWVvQms1ekJCWWROWC9YTncvSk13elZpMXRIMFlWZVpSSzl1?=
 =?utf-8?B?ZEZaM3NwVGtZQ3BKL0U4QTFwMVlaTnRkcDZMQ0NkVEVTc1RldnhMWksvbitU?=
 =?utf-8?B?QjhwY1NIU1dIWThRVXlkc1VGUmRDSitHb0ZrcG4wSmp0cTlxVkovYjBmZUxZ?=
 =?utf-8?B?L0ZHUU92YmhYZ21aUnB2bEJNcHJCZU1PeHE4RExTNm1MR0RKUWJ4YWxKTFc0?=
 =?utf-8?B?c25uZUw3anVOTlRGNVdFOTdRRFd5NEdaUnBpL29XeVFPYXRZWHZXYlNGMjFn?=
 =?utf-8?B?T1RHU010dlphVmU5RkFrTFRobnNXTUJzeDhBQ3RPN2FGN292MzB5dHVUYVZD?=
 =?utf-8?B?MnNzaDN0RVY3dTFOQTVubjRwQnRZUXNHMncrSWRvdS9vUXBObzRad0RVSGRw?=
 =?utf-8?B?SURGcGJPbVRZN25pU0pkc3Q1bVlTUFFFbXltYXJQNDNxY091a2wxZk1FZDZZ?=
 =?utf-8?B?TzBGN2kwNWJseXRFWUhkN1R0Q2xsYlR3clBLdXIzMGd4a3NaYkFNUm9OWXZY?=
 =?utf-8?B?YjNDcmUxMUc1SFF1ZEFnN1JXQlBseVlTbjMvNG9HRlFQVEN0MHhlOUtJdUNa?=
 =?utf-8?B?am1JTVdvdU5naTRidDgxU3NQK0U0NlN2U3JQVmRQa2FDdGU2ZDd4RzQyZEhM?=
 =?utf-8?B?dHhLL2d1T0U1ek05QTNIelQzbVFrRE5qY3NJdlBUbTRobFdIblRTWXlsemt6?=
 =?utf-8?B?Um8wVFFVdWhuSXlsd0VxSFhMdjFNSmc5MzNIYW5mME9lTUZSTTRqSFdSWVhD?=
 =?utf-8?B?U045YkN4eG9Eeno2ekk1dytSeE5IVzlpZWlGNUpUM0xLSmhqb01vRFpFV2d1?=
 =?utf-8?B?bEh4a2pacDMyMTV2L3E5TDNxMTB5aEVacVp1dFNkdWtDRXNtUm5hdjVaZW9Z?=
 =?utf-8?B?aHVNd2o2TzRaR3E4TitDamVSWkoxQ2ErYW9ZdVQ0OGIzdlF3dVVoaTRESjhT?=
 =?utf-8?B?MDhzOUxjZGY4a1Qza2pndEVQMVE4aVFnMHMyK0hlYVh4d2RxNFJSc3ZGamNS?=
 =?utf-8?B?S3NsdFFuUks4MFJjb3Z3N29iUDl4K1M2TndHTGVzMDgwem5GWGVaZ3B3RVg1?=
 =?utf-8?B?SitKc3BKQzZSWWl3NEFwalN4N0ZhbGRFeGtzRDJadW9VeXZDc0FXSjNIWXND?=
 =?utf-8?Q?IjX1R+J8eK5fLxCQu/AM0FIAl8of2RhZ/P5Bpnq2NE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3d91d4-e60d-491d-f93b-08d9bbebcb8c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:46:05.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFxlI5WKDMSMZMOG3fx00dU4zDHrLvabAZGMdTXus2C8pxsOtb1v4JKjA3hMPePYHcuNk8ySW1kcM2SS4gqTOwIiVbHL/aheZbnCPYPCiT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4147
Received-SPF: pass client-ip=40.107.7.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

10.12.2021 17:36, Kevin Wolf wrote:
> Am 03.12.2021 um 13:22 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add -j <JOBS> parameter, to run tests in several jobs simultaneously.
>> For realization - simply utilize multiprocessing.Pool class.
>>
>> Notes:
>>
>> 1. Of course, tests can't run simultaneously in same TEST_DIR. So,
>>     use subdirectories TEST_DIR/testname/ and SOCK_DIR/testname/
>>     instead of simply TEST_DIR and SOCK_DIR
>>
>> 2. multiprocessing.Pool.starmap function doesn't support passing
>>     context managers, so we can't simply pass "self". Happily, we need
>>     self only for read-only access, and it just works if it is defined
>>     in global space. So, add a temporary link TestRunner.shared_self
>>     during run_tests().
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Just wondering, is it worth even supporting the mp=false case or can we
> simplify the code a bit by always going through multiprocessing and
> using nice directory names even if only one process is spawned?
> 
> Maybe John's observation that directory names get longer might be a
> reason not to do that by default. Any other reasons you're aware of?
> 

I just wanted to keep the behavior without a new option unchanged, to not deal with possible CI failures on "make check": who know what multiprocessing brings together with performance.

-- 
Best regards,
Vladimir

