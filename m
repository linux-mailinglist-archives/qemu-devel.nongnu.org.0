Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5E53C6DC7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:52:50 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3F5t-0001jA-Qz
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3F3j-0007A6-6G; Tue, 13 Jul 2021 05:50:35 -0400
Received: from mail-eopbgr60125.outbound.protection.outlook.com
 ([40.107.6.125]:8641 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3F3h-00065b-I7; Tue, 13 Jul 2021 05:50:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2jGe8Q5+fA/MGZ1UwUbGY6b1T/1f2pURbf8mQrSIyvFuXxQXOwk5tyTATmIz/2ecJYQLz2bLdTE2xpzS1aVWvWtnbjgVQvJjok1DelCjzGCNgbhxlCPVKj7pLGTtSHycI2dfYnN06rUQ/euWRpF29W+2ScA2/54PKu/hZl5KySclTHu6gAUm7JvJJWQHAw9T4E75tN/80F2iLHjoDo6y24LhjI7H4SxNJTYdWLJSCf9vbrvxIvJ0Lf0O/q6cmtvotWu4F42BsfuveCCo01nRBGnxs1009Deggogct7zzjXz3mWsrSoCfAeCCkJtQSmIeE0ziYJSzlJd24IPeLzJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcX3sRwdTBMAR7NatWfHBZiFG0pprXs0ivgQ5/4Dl5o=;
 b=kuWadFPfIg5mecE3QaUgWrdNar/kj1/oZSXEuA/sNdi/c3feIKVLEEZLaRanZpL7ftd6ZVrDWO9Ja7GWRNbq2sGnXdveqj2BLanMHVGMdtAA637OPb9V75UGugtwqNWsMbDYaOxE3gWVK5asx9XCd8d+/F6oxqt2LQBlYZVJ14JJ9gkhPrl98FvuLCymIJtEAkgliJ0iJDPIPxEv5sZ3Ky+Ly3ZDQlwAUbkfxmgoBnXBEBPiGYju2ourDv0EvTPsQhE0ewChC8v8Y5aqHiSMdfEbGVXAR0wAoyKlFsGcxpjZKfBGvtVkNe7+v3fBKGe6IydjkJqWfPbKfjj/mewegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcX3sRwdTBMAR7NatWfHBZiFG0pprXs0ivgQ5/4Dl5o=;
 b=G/rdeQgy6sc1G9JLZDIvat078wppfiMVDB/3K7iHhk0VOuhtHRBFx1GZP1wIH6lwUiCv9/xP1/6Q+tqSJfadcFzEquSAif9I+A1iu8gPb2IrGMe0Nr06CacMKuEKmDjENkeQsowbcnqZ/AxUNUAbycVTOpfiVCHB4P38pDUOba0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 09:50:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 09:50:30 +0000
Subject: Re: [PATCH 10/10] python: Add iotest linters to test suite
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-11-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8c61eec0-3b6e-28d1-7bbb-867a8cef3be4@virtuozzo.com>
Date: Tue, 13 Jul 2021 12:50:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-11-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1P18901CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.215) by
 HE1P18901CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 09:50:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90b1e01e-8417-4f0f-dd90-08d945e3a69a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17131C6AEDBE0C40133528D5C1149@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jPljy9pY5aRBeQFjldbP/F/eIwL4+8Tm4Eo9T4/4MMjjBb9OCxQj3dzy3u3rOtipRPFlYrs7Djyuk+Axi4sAsAbHuTsGEo6+i2YdNhdg21Ev4ZBfpzAXzZLq0ihQorFz22TMTzVuU4y5o/oIC7jYQmnTEJin6KWMzgl0N4/6r1aAaMRSKeUF73+DWJQjpgrH1bWJycfvPkcRxd+QudTi5uP/zHLSAM3OtJ0xh9YY48qMqBrHQuoyDu1tqZlnYIFOBO/FqTTFELy+wYHZ6O04JAC+9sppNoKmB/UieoIL3+ldd7liQeAo+sXNr6NUf907iqwPzveGYTcUMYMO3aG02OTcejTp3hNJn5eJU6jiihiPmiQwGciy5lVUUwtXWxQkPSfX2wpzl1qgijONrPO7g4ugt6d4ivE7icjfMI7Gynyut2Tm93kh31mE7K3eGWVUG0WH2g9lH8hWWXYZgoFBiRlbaktxKYsZCmSuGAZw351az2LYTAn2lHp+UpUGEurpUBV1P99gNqHzcGmr9EAI9KXKjqpltJi1g0DE6wS0GYOESO5aZKE9ZyA7lB0WMHKBb3I5P4nI8iyX/KZ4U56muaTEDE1OYiF36P/HoJgDTciEBgnfE9ycMlD+Gm2dMGN7beKoiYPdrfLLxCIKBq5OhA325ztEIpVlc3LoelmyQa06239pI19WkUU5lAkTn0pM3vTTmOS2tyQytd0sJkuYMmV851MrvBzurtsiZcWEAUXmiV2gQAdRCy2jq6DgW4V5RYcMuosOk8UomJTo8d52mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(2616005)(956004)(498600001)(36756003)(4744005)(6486002)(26005)(4326008)(8676002)(186003)(86362001)(52116002)(31696002)(2906002)(38100700002)(5660300002)(31686004)(16576012)(8936002)(66476007)(54906003)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xpcWRrOTIrYkJ3OHBLa2gzbWl6RkxPcWMzZHppNHZ0TkswNzJhSTd2RVEw?=
 =?utf-8?B?Q01pd1BrWmZLRVJwb3gvUERhTTVibGdIMWQ4S1JQRzV5UXlRdy9iaXYvZ2xH?=
 =?utf-8?B?S3JzVzlxdUNaTWpVYjQ5TlRjZkhHdXBPTWN1L2NRY3d0ZHJZa0d3TDltNGxr?=
 =?utf-8?B?SHRGcVh3N3VYamRyWSs1cGhYUFlDUEd2RFRIUWpXSnZXeTJXbVZDOEx3NjUz?=
 =?utf-8?B?dy9sUnhpNVo3TW96VndCaE5ZbGJJR3dNZnBsM29IZGNhcEY3NFcyekpoTUt0?=
 =?utf-8?B?WFNiT3RyMVk1N1dHWUR0VzRJWDlyMDA1RkkvdFdqa2p5U2ZoelJDK1NmREw0?=
 =?utf-8?B?Z0Q0RmRCMEpIS3pMUkYxNE4rRTFuMmR6V3VUblY4UkhESFoyMUhxbHVnUCta?=
 =?utf-8?B?M0NFK0dqU0lscmg3dHp6WHd4aXFBdURxWEdFQStNaFRYWE9Xa3BXQ2xheFpJ?=
 =?utf-8?B?eFZkZFJIbmNSZkpzamQzSHlqQTBEb0lFRDdMMSt1Zi92Mk41L3h3ZndSelUx?=
 =?utf-8?B?MWg0UW5zTkQyalFQcTJZNEQycVl0eVJNS1JhZkErZWhpWHNQaFFkWDV2cVJh?=
 =?utf-8?B?V2NBNXppTFNJalFIOGJ4Q21VNTZRRzR1Y0RGZ1Vhak55RWllcDIxTDRQbCty?=
 =?utf-8?B?T002U1BpaGYzKzdWbFpINzY4b21nWkhSSkErMVZKTFIxanFVTGhCK3BnWEJT?=
 =?utf-8?B?c3U5M29aZzA4dFVjdFRIdElRdDNBUlorZmFSREk5TWkvdFNMZDB1a1JIa0FK?=
 =?utf-8?B?T0UvWHcvb3lDR0VIanFNZDdjSkg2OVpkOU9qWnhuVFJQeWc5cnlDLzE2RERF?=
 =?utf-8?B?NjZNeGV4UXQyWUl3L2ZFcndzSVIzc3czZWdKT1lhYUhUdk9zZGlPektCVGlI?=
 =?utf-8?B?VHZzWExENEh6UmhDbnZMZ2dLNkJldTNXZ291clR3b2luSUpxK0M4TjNHRStG?=
 =?utf-8?B?R0dHSGxpWUJLemQ2STVTUG83bWFtZEtpbWE1eWJyakd3ZmpaYTZpRVN1TjZt?=
 =?utf-8?B?bUJEWFV1RC9uRE9mQkhrVmhCUGwxMVIza3FZRnlVY3A5bTUwTlF2UlhXVktD?=
 =?utf-8?B?cHdyRlhPcVBaOGtwemZGaEZUSk9rM3o2aE14MkR3T0RmRk9WNWhzYWcyclBx?=
 =?utf-8?B?YVZic1FNNjYvZWlWSEpFaE8yOGVQUXVsRGFKa2kvUlJaMmVUbVA4UGpHZ001?=
 =?utf-8?B?dW9lUTZpNFZ1REJ5S1MrK0FGVUlSa3YzcHdlRlFnT2ErZWxYREtmd0dhZ3Ix?=
 =?utf-8?B?NWNhL05YSVFReUVpc1NzVDhzSU1zcHFMZUl4SmtLbjBxWWswbkdjTEF4SzVn?=
 =?utf-8?B?MkdxZEZrZG1RbHhEY3VNeU9ZOWlxb1FpRDFEYm1aOEF6VVBHaTQ3MVh1NWZa?=
 =?utf-8?B?cGtmcTk2MXV6OFozbDU2ZzZ5WXVzY3F3VVNjNnFXSk5MM2tGZjBJSno3OFBY?=
 =?utf-8?B?eUttZVQzSVRuN2pMOGpDdFZLWTc5a3BUcmMvU1l6U2g3eE0yRmZQSCtkSlAx?=
 =?utf-8?B?Vlk5Uk5xQTdQcTVRWElaTndKZ3ltb2I0WDNsdlBJbWlOWFFLcUVLbjFNMHpS?=
 =?utf-8?B?V1F1WjRzMFY2L0R3MHlaN1djbkc1S1JxcWdiSzg5TWN4Szh3d2IvZkVTRHdK?=
 =?utf-8?B?aFJNcU9hak1VWmVYWi9wSlI4ZmVSVmxOTVg2SFUxWjFEd1ZDdTRBNTdMYWVl?=
 =?utf-8?B?a0NDUGNERVlIQ0VlNXROM296TS9YaWtkaVNOM0VVWmo5WDlrbXVMbm9VSXEz?=
 =?utf-8?Q?3vh1F/U73IYKu6xFFhDT4LIhAYDd7eHbsnQx/yQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b1e01e-8417-4f0f-dd90-08d945e3a69a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:50:30.5541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1B2u+dpK+tsXK0cJlKF/YKMjYnhrMRdBk5zVygUZYuYP+j8lGz/y4cV7cIjL6dxh0ygoY7RyNH4w3rCeAOXKFA/vm0LTcgCFSJ6cnKxdeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.6.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.06.2021 21:20, John Snow wrote:
> As a convenience, since iotests is an extremely prominent user of the
> qemu.qmp and qemu.machine packages and already implements a linting
> regime, run those tests as well so that it's very hard to miss
> regressions caused by changes to the python library.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/tests/iotests.sh | 2 ++
>   1 file changed, 2 insertions(+)
>   create mode 100755 python/tests/iotests.sh
> 
> diff --git a/python/tests/iotests.sh b/python/tests/iotests.sh
> new file mode 100755
> index 0000000000..ec2fc58066
> --- /dev/null
> +++ b/python/tests/iotests.sh
> @@ -0,0 +1,2 @@
> +#!/bin/sh -e
> +PYTHONPATH=../tests/qemu-iotests/ python3 -m linters
> 


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

