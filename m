Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598213D7643
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:26:07 +0200 (CEST)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8N5y-0001et-Ex
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8N4x-0000Fw-PB; Tue, 27 Jul 2021 09:25:04 -0400
Received: from mail-eopbgr40128.outbound.protection.outlook.com
 ([40.107.4.128]:65090 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8N4u-0006VT-Vo; Tue, 27 Jul 2021 09:25:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNZXXac6Y5o9uZ8wNsyloFM/cPX0x5S7ocK1NSnMWC9I+K0vpqYd0zjJ+4rxUyy+TsToLgUFb7LdYroMx1hEg8Aev7sC4wYTwZG058JpW9EoEkWO0Jl5bvpk9fRFK1zAWaW1yKcAKA9nyTWVrtJZCXUxRTAoNAL6PThm97mN1f1LNUlgptTpDMiAjlHHcD42MBgopb354f70iqWNXbkZDAlmetZA0SAAOEhVXWbZXcbzmEBVhXueExdcUUnDRZMZPS0PXC0v32MrnfHwZ/A14BPxumOfrFGuZBL9iI9sIP0UOnuO/shUCYJCp/WDX3wRJ98CTORbkvIOuhOAi3j4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQU2M1JEtmdbDuqoLoIm2JbHwxYPOWnjdUmPJtLdxWM=;
 b=Pd2cMy0fC0j8/lHnusjmwUgu2aAGa3xayItPzgB+fHK6zpihQPTCgn5Ca2J2aAFyCaZJNSVWUiLhi6Pr6IYTUqvdr6+8X59qBNReig+ZrsR403hV1VrI4RSxn4/EdjeBpp8pXVPX4MvJJJ+27NuHFr2D8zEpz0EwOJ57TA6juv53lCzbzA8JamZ+xyR+kjd8dggqoQrQx/r82q2EeaHRgPtx2Utw3wn5WhbfP+SPQivfJKto6C3FexC6lXnGtNUFEcxuGjCI5JXMvToGbmXEfAotdo+kHNBDsdlorC6SCWbF/C38kV28405ldc7Q+pg0n7aHbTcT9TutM4ykqwImPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQU2M1JEtmdbDuqoLoIm2JbHwxYPOWnjdUmPJtLdxWM=;
 b=As2aUYIBPe8bbug0NR4W7Rge8MilyCL1KGMHxYvuFOdDKvUJRsGsxgzNElcxa3dGAtodume+lkeUrjJzvLwET+qaM1PoFBIThS04wAV5zyMrzmGXHh7JSCFEZTx1j1u0dkHLMtJcD6abc80F94jPjnVnmvrfBfpTQwClbCS0U2A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 13:24:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 13:24:58 +0000
Subject: Re: [PATCH for-6.1? v2 7/7] iotests: Add mirror-ready-cancel-error
 test
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-8-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2345d4e7-2943-ae7b-eaa7-55870f4cb39d@virtuozzo.com>
Date: Tue, 27 Jul 2021 16:24:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726144613.954844-8-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Tue, 27 Jul 2021 13:24:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7d8c6a2-7af2-4a82-e6a1-08d95101ee0d
X-MS-TrafficTypeDiagnostic: AS8PR08MB5895:
X-Microsoft-Antispam-PRVS: <AS8PR08MB58957595EED55007AEA6E7BCC1E99@AS8PR08MB5895.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uAz8U/vc6JRFCZWhnx2YBwfCf4AQ9IHHV4poXaIWfAMR3zRGCfZ1KVh8mBPK4qRyr7b5KGYzRQn+ti0n9UmGxvn1gsOYjqvw0Ulm5Ix1mlAGUTrRdfrtaQFRwGFuKy2mmtHDKm/1RnJpTC2F+6RSMZWKg2pDHaflH/kAu/a8DL+YzzX7QHsrmu0C/GUdJKtZegSvkvgSHv+A1M2wGSkcPiiw28cWEJ/bFrbB/UcLfv7jsqB0quJ2nVYnEPc2O9fSSY8yumz7exhT65YYPFfYjojYrOyZcWEGw/K5YB20arI4qbe5MNHvz3GgSX+flVNzvmk1huWPjXW5Y5fB0IqFYXEEUxRgdtmU+Os3KWq2xEgCiVplObPdadkl2wWrHTd8AcjYvo+q29FZ17iDZHD0g5XjagWIbvNxuXagQFG/fna0dTm3owkkGD6fqIwL6GcfsWXSQjLDHtLwEYr7ayWFgmaiWUM/OSSJskcUhM6SIqB+IFkAHORbX1rmNIcM+QL82pCqgqcJvjEfbJkOqKAcUFmp0aRZhl02RNhj+r9duQDE/y8OyWYsDS1dzJQIIhiEQz2zGA+p/tZEOMPuEg5dgRbe7r7pRFSVU9y/yF/V7Ptc6ZXwS1rwc11b2xK2gjYqKIuSwVKchkEfQon40Yi+HU2+dzUoz27aa/Wt61tPdLXU+408Egh+aLFTNSHh8Xu8j2Mb7sg/Qa3ms6ydZfUed9aaKK/a1JiSd3Y/u3Y/GOgD2raZ2r5lGv3phF1M3UoXJMyADvdfYLxtgF+HdYw9Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(5660300002)(16576012)(66556008)(66476007)(316002)(54906003)(956004)(8676002)(4326008)(38350700002)(38100700002)(36756003)(6486002)(31696002)(26005)(8936002)(52116002)(4744005)(31686004)(86362001)(2906002)(2616005)(508600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cCszY2VMQVpKV3lzMHRyYncwazdlTTRHdE1USGV4UTFPa05VWm5BRFJZTDhG?=
 =?utf-8?B?ekc4clNzMEtpaVYrdW5lQ014MWhVcENtUUdrNUg1YUU5UElVazlRM2oraER1?=
 =?utf-8?B?V0lzK3VnUUhNakozM0JqK1Mxc3ZncUlyUTlKRXFWaVpSZzhmQlFUaVRnMHRJ?=
 =?utf-8?B?SDB6ajgxbkVwbElVY0w5bVhNMXArdDZDU1RJRWJ4LzZMK2NFSGl1bW5ZVVF1?=
 =?utf-8?B?SjRmaHRMV2dHcEptTEttNGxiMXhGbGFDaUJqRm54aUM1R1FxNzZEUWVnMzll?=
 =?utf-8?B?VUgrMHBDMjg5VTJNVjBGMHJsang0VDQ4eUlCeEJuRmorT0ZmQ2JlTjA1bXJt?=
 =?utf-8?B?dkdlR21PYm11NFY4WFc2R29MbU1kVWJCcld2UnhOaVNwKzFmaWxoTmI5a3R3?=
 =?utf-8?B?S2ZmOWo2Y0hmaWVPdkIzdVowKzFLM3BJYURHelUreFNLR1BEMVNnUUN0a0R1?=
 =?utf-8?B?VkF3OFNodWxWL2FWQWN2cTJzTDYrUEZsWW9SQzJvM3ZyMEo3TURzbU5YRkNK?=
 =?utf-8?B?QXdFSXJrT3Q2ZFJDRHptMGFkcFRoRXNwaWpPWWcxV1NnQUpRZ01QTUlUY0py?=
 =?utf-8?B?TkpvdnZyaFU3ZWN3K2ZSNTB4OTVIZVR1aXpDanQwbm13TDRMV2FRNXZCRUR3?=
 =?utf-8?B?ZG5VTE16RWs2MTRGRWZzdGJFSmowWnVpWVM3Q2FCVkdRNUJjR1JDTTdIeUVv?=
 =?utf-8?B?eVFmeWN6VnR0WG82TUpBZjRJRGk2dUtJZFN5UzhqZXREZXNaY0VIVjl6Qnpl?=
 =?utf-8?B?SytEQ0xybU9hT1MyWDFMMDUxOGhRckFkT3c4ME5xV1pHQ0w5R0RVdzBiYlVh?=
 =?utf-8?B?TlRTM3BsZjdBNk94T1dyVnVFZnF3SXhQMGtNdm5YN0M0U21JUVd0b0tZSXJG?=
 =?utf-8?B?VEZuU0tidllLc2E2bERDaTZFdXZoM2lhaGpXVUdJOXQ4amIyb2htWWtpMTNC?=
 =?utf-8?B?M29nVjNoRlhEMC9qKzMyL1BNMEViOFVvMzNScTgzZEZ3UGhPK3NHK2QzL2hM?=
 =?utf-8?B?b3F3TlMzZ2VHQ0x1YXNwWGVrTnBlTDBCOGhxakFtUDJ3UGtrS1BBa3RmcWo5?=
 =?utf-8?B?OUtvajRlZ0xoWnhBTWUrd0cyWllnN3pucVNyand5QlgrUW45YlB1aUZ4cG5D?=
 =?utf-8?B?Q3REUitDdU5ham5iQXg4R0ZGZGh3THVBY2NaWm9SN3AzdDJKK2FQcGRXS2NO?=
 =?utf-8?B?SFhpeVNXRThWRitId3ozbm42a0JLMlNHY3ZieHgxUGJPTTdzQnQyTnhyaEJY?=
 =?utf-8?B?TVZkL1dqQytuUVZzZGwwS1ZzT0JDbkhPTVZ5RHhqdzRHdEFWdTBGbEpQWUJK?=
 =?utf-8?B?SHhSUU9pQzluVVRCMjE1ZkdXTlphclA4TkoxeXBpMHZVRjFrMGtrVmhIVU1x?=
 =?utf-8?B?OXYrbkVNcWxsbG1vYXhaMkhaVUhIRDVxTjNjcmxvb2FJdXFLSEFVTWRsdEZT?=
 =?utf-8?B?aTd2K1BIeG8vQ0REcE5MNzdiL0ZwTU5Sc3BJRWhKQURWaS85SXFvTk5JTUgz?=
 =?utf-8?B?VEJyYVV3emY0dzJlZm1qdW9qWXFUdzNNR2RuY1k5QkFNN3g2YzRTRnBEalp1?=
 =?utf-8?B?cnhZUUZsdlZUN20vd1UvOGRLdXpXVFZnSk1RUlBUNDZyRTFTbFlxT1VhV3hk?=
 =?utf-8?B?UGxvcDNlMllZMzlGWXVGZVdQZ3djTnB1c3JMQU5XbFgxRmdVbVp2ZjdkWXcw?=
 =?utf-8?B?cXRpMjRFUVB4L0h2MUR0L1ZRM3NDNHlnZS8yTVUvMU5FTktWMUFNOWpOK0dn?=
 =?utf-8?Q?Ke7SaSkX1BTvI2t0CgDjQsx9FiJ8q6KkinYgZGG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d8c6a2-7af2-4a82-e6a1-08d95101ee0d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 13:24:58.1556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eb+8exp509sCqv9Mk5PgGt1AwjaWzbiMLY3khkDhP1YaAUdhChhvuxze3naAghD0E2v7KWG6xl/A7RlC2Kf9ogMSAdX9vxMv2ORxq/rKuVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5895
Received-SPF: pass client-ip=40.107.4.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_NONE=-0.0001,
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

26.07.2021 17:46, Max Reitz wrote:
> Test what happens when there is an I/O error after a mirror job in the
> READY phase has been cancelled.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

