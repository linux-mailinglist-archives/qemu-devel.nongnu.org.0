Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E6541624C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:46:26 +0200 (CEST)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQvZ-0004Bw-1S
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTQor-0006Rp-3U; Thu, 23 Sep 2021 11:39:29 -0400
Received: from mail-eopbgr60138.outbound.protection.outlook.com
 ([40.107.6.138]:42433 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTQof-0001xj-If; Thu, 23 Sep 2021 11:39:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYvOzyqZK+rRdTepbpdyesLHKA6ndhqGoThx5as23FfJ9FbfAc48Pfy6NZ42w5B6NZQRktHmLWqtzJiWR5uk6blkV9nTo3pnmSt49u8Pb6LKfODFpQRjGReyeYOzbSUtpKUM3RCRmjch3vvstZqW9IzIhtFZ6bCRpymcGvtYFIcbZOHQ5JdZt/1dZX6oJq1ErcK5/9axmEWn436hNpDPoNTMBO8VQPRx4El8lCu5TZwnZw35qagR6vbheDzn6vxR4Op5RpySlH7zwruES27J3tQvhtcQPXFWroR9PamsDW5cf9Albh361ENnxKTeTMqa5YO+bb/dAt5DtDdebE0k2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yBK+nTy6HM7iAIlg0kNmhESKnia016DedzUBEhqAUrg=;
 b=HsQuOljyEoJN5a8jCTQI0lUHBug4F8ib7NISeAMbUXi9O4DV+ss1vXx51bAxl+pM+McBjg9eatm6RBZQAhqiXrDmwjp2M9m0r4ITreJ1TfxtrQ/1v2dEsPcsOeU+aGdvg4H/tVu4GxwL7evNP/ydGVPpTm9s2m12+gwIER+FOldoBEX2ETku01mwgFMt93bOuCwn5a0munb3x5WI1o0kSyPoA/DNWYdmX7LU5OgCp9R65tQwrz7OIuR4Of7gT/ZfrlzI3rCspiwI65G65QvbktfIOmHCgTP8BEoO7xwj+p5cruwW0SJaVBINjQbRhWLchf1RAoas3gcs7pJl6lv1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBK+nTy6HM7iAIlg0kNmhESKnia016DedzUBEhqAUrg=;
 b=B7MbAZQr5uJxa7J0oTXhZekot+d+LGKhSCuk+XRaIU+0q7Imu8gHQGBYC3a1twNoPnbXfVfMVHhlrVIjJSo08PC9E8d8yGgF+OxrFil2O1pDdjSrU3AmC5rHUwMzYYaqmb3x0VSFFXTQNg7lHmFhvdRsRI+CPMi3pJE9txWZPOo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 23 Sep
 2021 15:39:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 15:39:14 +0000
Subject: Re: [PATCH 3/6] iotests/linters: check mypy files all at once
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-4-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <97e4b2f5-0e5b-cf16-e08d-7c601d3d3083@virtuozzo.com>
Date: Thu, 23 Sep 2021 18:39:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923001625.3996451-4-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0701CA0011.eurprd07.prod.outlook.com
 (2603:10a6:200:42::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 AM4PR0701CA0011.eurprd07.prod.outlook.com (2603:10a6:200:42::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.8 via Frontend
 Transport; Thu, 23 Sep 2021 15:39:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60b5651a-e324-48b3-fb44-08d97ea84b9f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45368A8A7916DEC5DCEF404AC1A39@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EeN78GqNrvsyHFep4Gz8Cw0uuIqvaGM8QbZZb/rPr6UKNyoIZKDQRB4if82Ixto6q/WT4cEunhtUsBqFh7L/1VRqsAEUWH4xN06EAPo+/Aa4SqW+L1Q36tN/orl2Er1oacLOeCdYNiFeO8slw8ncap/kMK7C+U3uIQ8XUsYQPchcxFo/xQtOMRMgR76pluLzTPPxGDw13FhcUyARy+yoW24g2GFwhb266FrpPPEmn4gC/RC4Kq7CtbeTuSsZKqSdrJBSkqwLXWK1e5e1Qx36c6o2EBAj+uNqHRLixVOvSiqeRDGmih7XhrnGxN09uWVWTw0NZSXNAUuVK3nTJQCJ1d/AgmaTS8n62OFPtNgRnvis2Q8H9czGSfa5tETJVnBA+ChEQwbQDqwrL3qLZCrPUsO9sPbeQ/Wo4X2P4VCNKqygGY/HGYKo3+KeUr6VFx7vxriHEqhX69h8PHhv+rKK/uAG8a+45kMrTjSTEp9Xo29oHgMT/TWSulCFXQNd9w8IWNk3m7CdtuKhfqNodB3MtX657kStdnmkSTVBd/3RkWDOJW03qOXwlccWque9tDxEWXy8BHw8gRhUS8EQbMM9YJbvoS/w1oDpx3oMTu0gMQSgXQCicItjeo2TkJo9eyyj9grISWvmlo8u0PuG8IwcyaflP5SsskU0GTTb7if34OTfb6T9piWPHhpHI099t630Eov4RzZ+UwVVtomiA/E74xE5g+IJJJEKx40ld+9oeztVDqQRv1r7D8mv1MhhLGQpEJWUFXGbc+WEzvYVDfa9xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(66556008)(31696002)(66476007)(36756003)(86362001)(66946007)(16576012)(5660300002)(4744005)(956004)(186003)(54906003)(38350700002)(6486002)(26005)(8676002)(4326008)(8936002)(2616005)(508600001)(31686004)(316002)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWRSSEN4MlcvTVpBQmdDMWlUK1B4a0pYTVV1SndzUXJwdzlKRkRadlQybHZL?=
 =?utf-8?B?V0tVMlgzSlk5b2ljTnFNQ2t6WURwRGpIM1hLOEczUlZNMGNVMHR4bWhTQS9J?=
 =?utf-8?B?QXhhYWRuMEJlNm40aTdQclV0SHJHNHBiVTJWMVBXSWM4QldNeGhUQmpFSGxN?=
 =?utf-8?B?eGdnLy9VZU1LTmdDYjk1c01RNDJaNkNwVnIwbkpvcXRQMmQ2eUU2RndFRmJO?=
 =?utf-8?B?R2Fic2FSNCtpU0dlVDRjZ2Ivc1g4dWtJN0lGZ1hNdGg1UnZJaVVxQldmUXJ3?=
 =?utf-8?B?bkU0QjRiMS8wbUpCYWpqekdvK002dUhzaWg5ZVBKajBsVVRmQ0QzVDcxRzdR?=
 =?utf-8?B?S0JySThhM1ZaanRqYUJmaEUxeDRqMlhvQ1c4Z3NYTE4rOFE0QjZjcEhIbHQ3?=
 =?utf-8?B?dVJBVTJnY3BlVkxqdURoclFLS0JEME5iN3ZwLzhNQUtWRExhOEZjSFNlaFEv?=
 =?utf-8?B?SG53dUtqVjlFSG9TM1RKcHBxL3I5eEcvRFZqT1dtZWVNcnRjN0Q0Vmd6Z0ty?=
 =?utf-8?B?MXZJUWZUcUo5czZQRm93VWZKWU9Jd3h3b2hzUjhpWW1McHV0akRWbFhqTzFo?=
 =?utf-8?B?RCtNUWgxSFErMFlNOVV6a0tCRnNVVWFFbFViRUlKcmlxczIzbDdWbGNRQ1o0?=
 =?utf-8?B?Yk9aYVUwa2dtM1Q5REZrU0NtMG9XV1BxZUg5eS9EK2R5Z2RFRVFWMmdqd1Jy?=
 =?utf-8?B?M2s0dmFoMlRTQmkwNnpoYVV1TEcwWVVEeTJNdE5EcHE3K3llb3dheXU1L1lj?=
 =?utf-8?B?bzhQaFRadjFoOVNNa1VEV3BzVFF2cXVTNFZGQlcvMDdSSkpteFBiVEtBVEpN?=
 =?utf-8?B?bHZneXAycWZJR1pUWnJZZkRuOFlqN3FwMVFnOU5QYWdVM3A1Nmp1bnF6YW1T?=
 =?utf-8?B?bDlBWTBCNi90WkdqV2ZzZnhjb1U5QXBTbFBmaU5CN1dTcEpUSzRnTVg1ZEZV?=
 =?utf-8?B?T0dnUzZlTllNYTlzRTJtT0JQRHdZUWhDQjJ0bDhLeHVETk43MFpGajZ0UWpQ?=
 =?utf-8?B?Qzh3UHNWQlFaVW9sM20wSzZndlZJQ0hEeTA0R0s0RUNLd0FuWUxhSU9FWVFL?=
 =?utf-8?B?eWxQQzZ2djhaNDNsU2xsc01FOFR2THNiK2x6M1Q0OFV1Y0tvQ2FaZWJKSzdl?=
 =?utf-8?B?cm4rYXNYcnZCcHVGNFM5ZXROcjROVTFPTkRjK2ZvdDNyaSs0MmozUXFKQzdQ?=
 =?utf-8?B?N3JVTFhWOUs4NzRuSVBIOGNLemx2ZWZ3YmdrWGpMNlF1dVc4MCswTG9oT01K?=
 =?utf-8?B?cTJtREdjcVNYM1h5K1l3VElXQlkwUnRXc1FmL09sSnRQSzYwVGw1ekphWFVY?=
 =?utf-8?B?OTlhdE5QcStNUmk4YWtpZm5rb1p0NnpycFFOanVLSmsxQ2VFaldKRTB4SVQ3?=
 =?utf-8?B?ZEduMnJhWGJvSnBBSjZaUFM0cElHWHFMWUZYRnRkQ3RVNDRyUGZybUNpZmR6?=
 =?utf-8?B?UFF6c0t1MU14ZUsxYlNVR0RBYk1ubTUxYWpDT2tFaGtVWUpsVlpMU01HMVlI?=
 =?utf-8?B?VittYzBXci9MMThoTVVrNVdhWENQSDJwZE9BNGY2SytXMGRGVER4cm1jejh0?=
 =?utf-8?B?VjdMd3Z1aFZvSTlVYlNuY00rOEpPYjVmcTJIbEhybWlUYnptdUdrWWZ5WlFH?=
 =?utf-8?B?bHI2OVRSNVNiY21UZFJhMy9rbUFMY2dVbitHSmd4RGovRnFtNy81d0tsd3do?=
 =?utf-8?B?b2NoamZUbjh1TFZzbTcxMnVWU2tEWlhzVXpRbW96SkF1cElxUThVL3ZlaStF?=
 =?utf-8?Q?/TDNqA2SCbWeqFCSzrWDMoU0qeeQdz1HspZayDe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b5651a-e324-48b3-fb44-08d97ea84b9f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:39:13.9580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpBoHpQVXX0SY584WJZDgzwvoW7TMQcpDJqM4mfszOdKpuMJ0nh1wuDkfl0gQYFXiKvCPiDkcND6E2Dh3sg9odLtsiYVUmTeTKH/qoYXh2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.6.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

23.09.2021 03:16, John Snow wrote:
> We can circumvent the '__main__' redefinition problem by passing
> --scripts-are-modules. Take mypy out of the loop per-filename and check
> everything in one go: it's quite a bit faster.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Hanna Reitz<hreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

