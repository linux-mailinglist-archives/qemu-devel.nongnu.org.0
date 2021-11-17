Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B330454CC7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 19:06:08 +0100 (CET)
Received: from localhost ([::1]:48256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPJv-0008Lg-5s
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 13:06:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnPIY-0007U9-RM; Wed, 17 Nov 2021 13:04:42 -0500
Received: from mail-eopbgr40117.outbound.protection.outlook.com
 ([40.107.4.117]:2694 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnPIW-0004Ry-Mk; Wed, 17 Nov 2021 13:04:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0SNArR0xg7pJfyJRsEPczwcmogVwp/BfuwtkRPPom4WrVqHwa5Jv8mcpXkm8Y+MCLTg9zRFT1guinBFHSuU8ncyIpR9fHUlXPQShV6wS5Nd+1HRO0Fv5a4SxRyDhuyR0r4YMoU/NhOsiC6eVBTdfJM4TdFfm4C1jZWKZDSXcBb7LH/80x3BVxG1wQHz5Mxgl74vfOSwxzGaTGAgQo1EMt/j5jChXy9w7Um0LnQLv3mBghFmaDCLgxV+ao3/WClFX+zO4PP7aEkGxJQhxVbssw3n2gu5NwNbOyTAtHeMay/MvMcBc1QuGmMNSMLypgndOdh/2R7d8ewstcNxWOEcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3axps4Ziw+Y7/BKmqZZSVjRW1tr8/208ejv+DfhMHA=;
 b=UtGtpg0stYdhRDaCgiofJArzDxLLZpG3rVu7/WS1AKHz+EgcbReP1OC/T2Mfynu6rlicHGn1BRfvc+l9yLqcSGJB2+SoxI++qmAkuXh32yJgmCEvBj0TlwnpXd96pD4wDTmAUD2VHBpD4xOWyz984CsZz+eFb+6eRfwyDkXe/Ev0uey3P3TKAbnwNKxfdA+r6hDraRXodkDYQgvTxeK+RdjOMq5IJaAjcqnh8wWqvSIc5ocguaM4TaUY7p+0+dAaMFsWG3YdFCBa2amUnuA70LGTYsJRol802ubSPpx2rzsAJgC+gYU2YcsntThpJRGnF/X/9gbdZgJ4J1FZ6H9SVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3axps4Ziw+Y7/BKmqZZSVjRW1tr8/208ejv+DfhMHA=;
 b=wa2HVqkHs6zB6TfNTOmX6HilqfeBCIlkL3qKxRaER50aTgd+s9P1xJ2mvwX+pU8Fo1wwgDydJ7V631yEHxr7OYpMBj18uw7o/zqZBBAHnHWBiL1x6Zlfd2XgKhHHRGAqQz4upPNNLVbZRoNVc2caML3N6d5z5HAZY1M+4WbjpZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2273.eurprd08.prod.outlook.com (2603:10a6:200:65::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 18:04:35 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Wed, 17 Nov 2021
 18:04:35 +0000
Message-ID: <d0c72875-4b2e-a1b4-646f-8380b0f3f6f2@virtuozzo.com>
Date: Wed, 17 Nov 2021 21:04:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH for-6.2? 2/2] nbd/server: Simplify zero and trim
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, rjones@redhat.com
References: <20211117170230.1128262-1-eblake@redhat.com>
 <20211117170230.1128262-3-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211117170230.1128262-3-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0030.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::30) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.233) by
 AS9PR0301CA0030.eurprd03.prod.outlook.com (2603:10a6:20b:468::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 17 Nov 2021 18:04:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d70d47b7-cce9-45b7-34be-08d9a9f4b6e3
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2273:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB227365C9119D70232FA7EAF2C19A9@AM4PR0802MB2273.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: diFfRuf4aSGZIFY3st5G3RrpHGb6CZ3McqG7xHq92LPTAdNURMpPZCh/z9KjstHIvoxfyxIZ8BMx3BAzOcSBjdUBRgqBLO5m2fEs1tufmT1vG+s+DLegdI/DaiNGy1J41Q2DNrww91MOv8Jzk3QeJ5pSVWTPr3j2745RgcSoTGoydJR3XB4ZHAbT4UarApN+kM1UIat9jyEsFbkycp6OryE5hzpBc5nEvg766bhnblKHjxJZ7dcbGE8jFWxA7zAEF/2JTr349FNRd0GPCz2IajLmzSJN3T+2BKJ4ns/2HeaEacz7XIuHk2rO0RSs+3nUln6gPtNdsmZBSy83pT9F+BJsCbJeJsCaVJ0QqGC5aojRs+QEq1q87hgkfAKF2mGR/qTua5e3emo3OtSilM/6RWQn7lIpFetB8EdAJyhwr4MZjZRCxxjRTipwGPnz1/2boIgk5G45TJRsDEEbc6VdbH7jP8JYfVKHi9VltSSbHMkJiENKxvS/Z5LcpWub+iTLSxI/PwBy2jmJ6dbkpsqU64Bey5PxRmB/pGcAAVrGhl12uv7+phHpLmITgv85yTELzoZxqccpQ8FkH5Rlr5af8anIWPC1s+c+Zlk6ql1GGnwIygPiIMHuFwPPVGPklFNkOtB6Ud1415RFUbPtyU/eyqL44/TDtE/mU4rXb6+zcEav+fmQRxBG6OooOT6z3kSecBkqEnPqj7cxWDXxpNsCgeUSvG6IcRwYyNhiKq01T3xgt57AJQgcln1one1p9zHUPfJfXLt3Xg/nmorI7aGH9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(86362001)(38350700002)(38100700002)(2616005)(2906002)(5660300002)(8936002)(508600001)(956004)(4744005)(6486002)(4326008)(36756003)(186003)(31696002)(316002)(31686004)(26005)(52116002)(66556008)(8676002)(16576012)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnBDS0Jvc0NqdFZQRXVxdStjSXRGeWpiNSt6MUJRVHpRTFAyVDMrcHFyS2hX?=
 =?utf-8?B?Y1pBbUdkMVh0MkhLS1J6eWc3RzlENGJUWHhaMlV3MDhCOHZ2azJUVS9nTzNS?=
 =?utf-8?B?TUNZN0xRRVlHLzAyQ0o2eFYyaE9JV2luN3kzaXYvWnJWQUJMLzczNVFPS2po?=
 =?utf-8?B?THF6azlFRHVYenovbE1ubmxWeUtKd2p2Ui9kS3A0MGkrQVRHQURkTEF5b2Jj?=
 =?utf-8?B?ZXlFOEwxQU90VkJwcmwrMjYyNUlhTmlRMU4zQmNvV2t5NlZ5Z21BbG1jdmF3?=
 =?utf-8?B?SWY1TTB5SGZoaHdHbW1iaXcwTmsyc1FjT0NGRnRnNHVrd1N0clV1OUJPbEJs?=
 =?utf-8?B?YmxNNFV0YWZwK1BPS3lZQ2ZFVy9JdmNtS2duem1qUEpzTHFYaU0wTWFDZmZy?=
 =?utf-8?B?S1JQSmpYQ2ZPVGdFY0RTM0RaaFRVUlppQVFteFdWSTQ2WVNxVkJUZVRSRUJh?=
 =?utf-8?B?cnJOQmJ1eDI2cituTHdwVlZWaDUxcFA3NklCMEZaSGJYVUVYRzhDUHFIMTM0?=
 =?utf-8?B?RTU4YmFZczIzamdKN044dUpmS2JadXYxUThSb2NWWVlyazZnS0JLc0tqRWVr?=
 =?utf-8?B?SHhqV2hJc1N3TWdsWnVhaXNUSElnZTJ6SjNHLzVuWGRsVEoyZXFlRjBYZ1dQ?=
 =?utf-8?B?Z0Y1KzJnN05LbGNEZXVxbWNOdEhvR3RLZ0daMncwTk52WFljVzVFMHZlQTJo?=
 =?utf-8?B?V2sxMkxJdUYvdURMZHJmS1h4OU9nSnFoN095eTZobHhTQzUwTEZ2c3hhWTlt?=
 =?utf-8?B?dzFkbkZabFE1MVFhb213NkUzdDRLRDhQTVhtbk8yVFc0UTBnVysvd0o3a211?=
 =?utf-8?B?THJKdHcvYk1VeWtCOGJLT3NadXM4R3hnWTNTMkFCU2V6MzFyN2MvWWtpUjdX?=
 =?utf-8?B?eWdCcHR4cjZrRUpqSU1qOHB5ckNSL1Ziayt6N3FyQmZzS0lJNFJKaUV3bGEy?=
 =?utf-8?B?ZUwvNUpmNGJrK0xKNk9aQUMyNytCMHBSQVhFRVM3NWhkZHJtMmN2MEZGUklL?=
 =?utf-8?B?TGl6WXg5d0pTbFpJQ3RIcFcyWmNtQWFUMVZOUmNBMVVOc2lxM3IzWDVvemZq?=
 =?utf-8?B?eldYdytNa05hWlBwbTltZjlJMDdFcjhDb3FreWtWK0c2K1RmdFZLL3hrRWc3?=
 =?utf-8?B?Y0M5cVkvN204YmtMR21nZkdNVnJMWDRMTW5iT2JmUy9VVFE2eCtYK2FHbk5T?=
 =?utf-8?B?ek94ZzEybUtWaHN2UkI0ZDh4WC8zRzBodCs0WlVxeE5PL05iWG82UFJjY3VT?=
 =?utf-8?B?NzhmT2xrVXdHZVFRRXRiMUFLaFlyUGgwcTA0d3VyOFd5MHZjN20yb014aHpl?=
 =?utf-8?B?a21QUUx2SlRDVlA5Q3NZb3JxRFA1UnhLQTZ2ZTlWWFp6QzAwMTI2ZCszVzhV?=
 =?utf-8?B?TWk5ZXZSSHB3cFk1TW1RSVJvQ2hxMzFBZ2o0MjVWNXdpaFpXdmE5cnE3empY?=
 =?utf-8?B?ck94c1UyR3JDZFpiam1VckZMbjNKVk9CSGxBRjR3cjZwRnpJQlRIZDJPdGZu?=
 =?utf-8?B?WlJDZHowaFBHdjE4YmVQeSs5eXhDQmVoN1VtRzlYWm1SU2U5T0VsTTE1Uk9O?=
 =?utf-8?B?UnhUUUpHaUpGZlhReXB6YldqR1BTUXVFbkRJZTZvSGlIWW9TdGlBVWdkcjNX?=
 =?utf-8?B?K240OXV1MmNTU2JDLzF5MEJxTzRaVmlFOTdEK3lEZVM5R25BY1JmVlFKand1?=
 =?utf-8?B?dG1DbHphclpuNmRhaVowWnBwYWtkV2xWcWZhT3ZZZGxwczlQMUtYWFd4Yngx?=
 =?utf-8?B?cjN0dUZYdGRKSngxSDliY045RlFHbjlWY0d1eUNlTUJhZThRSkxzZ3N0T3VI?=
 =?utf-8?B?Z2pCRlRoOGxNZW9pSmRlMWxSa2s4VzJuclNNbGo2QWhQQkpXSGxDb1FDbDR6?=
 =?utf-8?B?VU1FRVRVTU1TUzQ1THE3b3ZlejNsMzhMTlp6bmdqbC9nUGNuRDdibnNkSXU2?=
 =?utf-8?B?UDdzcmpTbXZ6OGdpRXc0NjU2K3FTazBEZzM2T1ZRT2o0RCtZeEN1dDI3MXhN?=
 =?utf-8?B?TTdmd2hjZGVVVXd1Q2dycUdQTnRIcFJMZ25FMUZCenRlcHdsbWg0bUJKQTll?=
 =?utf-8?B?bk5NRjRncEZVblNzV003VzA0Qm1zTzVldUdadzZqTlNqalppQ201YlJBSXlZ?=
 =?utf-8?B?U0VmMERSeDkxRmhyVkJvOXhuQzRZVW5EVDBqOW5UMFAyZ253ajJCbFNDMnBh?=
 =?utf-8?B?aHdCS1RkVnh0UjRTQjRlUTF3M1I0T2R2NzRIUEFibnBzbWVUSmFFL1plY3p4?=
 =?utf-8?Q?fhnZntPLc82AhLCiOfBvwDyuNAaC5HeFQdzP6JOR1A=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70d47b7-cce9-45b7-34be-08d9a9f4b6e3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 18:04:35.6358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVxCtUcJ6TPqCFUtJq6DfsSC+4G+u0XN/v+06dFTK4yF5PPJxu99Xv56Dt0O4Wcz4WlKbNzoM8rn6NdIIw4fQ7L6EFmdFleRJ4vuUblgNsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2273
Received-SPF: pass client-ip=40.107.4.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.11.2021 20:02, Eric Blake wrote:
> Now that the block layer supports 64-bit operations, we no longer have
> to self-fragment requests larger than 2G, reverting the workaround
> added in 890cbccb08 (nbd: Fix large trim/zero requests).
> 
> Signed-off-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

