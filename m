Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A862A381953
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 16:21:53 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhvAu-0007Sd-P3
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 10:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhv9K-0005td-7q; Sat, 15 May 2021 10:20:14 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:1158 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhv9G-0007XR-NI; Sat, 15 May 2021 10:20:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGkBqA0NQq7IkP9aIvKRpUhafo8EZ1PElCvpuXFXhzCtu1LBCJmCnldCEIxO2Zfdw7WVs7ds+tQPba7KODbB8sd2lwHrX7vPZX5bDlnIKY3BAZrrsNapfCcsjljMovWpyy6GJo14Lpm4j4pWEHIDN8/ErF51m4Rcl1xEbGPVrrFMYRcSwdXhHQ+wpXbYPQTFGJgvgFgRmR9hFUp5glD8SYnQ2xgg7ipDjd69EBs7UPZvAMPTZdijB7TRC6NY+vCPa6xZFUpbnOXuKYOZE1ErTki++8Xvrx3ZK7O01I5lNpOAaFXRTdNjN/nQjDa06q0cbZYxElqqx4IuyLbUchsOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCih4JyxcCt7njxd5QfAGhh6HEDZjPH9/y/bw/4ig34=;
 b=U6zZnoyfEIggvfMEwGt4C7eCf0VzI9Kxf5sE0X3sSPCCsc3+j8kgZuderShEJnPoSYXmnmCl2KGuvOimZlwhnrpPj4V7iLpPWrOo76wTcUWDJg5yVe/XW0xHUp88kkgioCZjT+UjFPxYOcZtP/xhWj9ldC8nVDwqSGxGoBU1su7izv00PvOHWE6A9FLBONHOZ0Ct0LK9Yq5Eyf82jNKlxBv9zxD5nl0VXFf6MAOoZ9jStCrNp8pMIU7M0OjvbPzlOIa8pC5OQxvGjuK9PyRqz7N1op4dK77xXswtKLF9Iyf/TGDDhwPGeI1WD2Xrsyct13k6WXz9dXB/fDQlZZE+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCih4JyxcCt7njxd5QfAGhh6HEDZjPH9/y/bw/4ig34=;
 b=IsTBR3ioTtFGiGgWOqY8Mkrc4ymVxSizqcGX7FD5BJ44KvIzdk1Py2sIhQXCgEJwxa+he/IAi3/4jJz8g3b9nVn9FnHkKukJ2/Ejh51y3I6zN3abkCM7oG6JTyvYW1fcgLjmxknL/8P/9T48zZpqTfXJUOLF68YaEkA+GpUE+SA=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5496.eurprd08.prod.outlook.com (2603:10a6:20b:de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Sat, 15 May
 2021 14:20:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 14:20:06 +0000
Subject: Re: [PATCH v5 0/9] Allow changing bs->file on reopen
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com
References: <20210515134705.433604-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6d497e6d-12b2-cd60-2974-85f989c91cd1@virtuozzo.com>
Date: Sat, 15 May 2021 17:20:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210515134705.433604-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.249) by
 AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Sat, 15 May 2021 14:20:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9250bee3-a3da-4bef-1bca-08d917ac89bf
X-MS-TrafficTypeDiagnostic: AM7PR08MB5496:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5496819CCD3012C02A665CCFC12F9@AM7PR08MB5496.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cY9FyLxKXCVRUsioOdBDGkZPxjgi5r7fxSwfvDXXlqr+SRrFGp6lWS3/67IFscNpEovpuM4jDe6A51VYMtTDcCOp+s9f+CypESRQgCg4Hg6GIAhCpH4vvpl4hQBR0V8CffA8/tcuwA0fM8LxKp0VIJtsfyfwqzy40WEfvsiIcGsrXPWMH05unZs9noNIWsJNJT///s2LTDfS3K6QR86oVzYgaBRo9kRhs1Z4TxV2j0sici3onM3pbiZkzIw9lo1m3bSmZzuSQyukSTIMQJ8Q1nwl58L1uPp+OkjmQ8ijSg9PVFPcZQtMCLXaLMNMco0wKHDKM2rbeKCcHoq25JSX1OiRuJzpP53rrq95wjscowhCam3h9a4XssoGiJeWqFaVooCJEoOfKmXse7U+32y8/LoptrKPDrUSFKkLp3J3k09vRUlzLASrZr+aU5TMqu3H7wnT6kLEyuWgQ6AJwqohoQWNmUfKUBdK+4H7czOEae9N8fFmeLDaXyXu27c9zTnyH1WOCTkA/3ol/7C/gspX3qclCa7doQc6KT7K3Ed/zW4wr5V1PPcgYIPeJsPdHTQXWBvu/5t6RpGTgFGWJwXAO2tjJh2kK2k8nqGyNs9Wj4z11k0/CF4UMnGwTeA4vwPDrF9mKuPU3hWlCblnJrB1rL+F69DwsGuHxzQ8yT8OqgnfotxErSX0loxtPyeF7aKwLDiiLFnHVpBuyjOHSP9O5wmxB0Zw+0swIt8ry8Kf4N0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39830400003)(136003)(83380400001)(6486002)(31686004)(38350700002)(5660300002)(38100700002)(66556008)(4326008)(316002)(31696002)(66476007)(956004)(36756003)(2616005)(186003)(8936002)(478600001)(16576012)(66946007)(2906002)(26005)(52116002)(8676002)(16526019)(86362001)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?azdpWklSSjJLdmNWVlptdzFtaTVSTmExRzdEdlFDNy82c296K1h0cXQzSmtr?=
 =?utf-8?B?MzN4azJLOFBuT0RiTGM1b3JDNXg2MkI3NW5JMzYzWTVuVlZQRU5FNGN0bFl1?=
 =?utf-8?B?cEJXQno3U0ZVZk54YWVITUhocU9SYXNzTlZqR2ZCSG5td29Gc0M0c1Q4YWhK?=
 =?utf-8?B?L041VUtMV08zdU9lTmk3WFYzRGtuRTJDcXAzUHVqS2IvWFc4NkE4d3NBSFBx?=
 =?utf-8?B?R2dseGdLbFdnUE1BbFJBYm1QQnhwQm4vTzhlVmJ3YlIvK3V2RHRZTVRxUERu?=
 =?utf-8?B?byt1TW16TG9McGhPWHk1b2xuM2NqUnRtMElaSERBRFR0MVBIeWdWeWlLUmNn?=
 =?utf-8?B?MVpmVEpxekJLb2l5cVY3cWh5bFNycWcrN216M2VGb29DRG5vZkZyRWovY2lt?=
 =?utf-8?B?T2R5NEdyVGJqR1VocXRWRmxoTkhWZFlONnlzRVN1V21vL0FOQmZxSDljcGxB?=
 =?utf-8?B?WmE5eDZXYW9nUFI1N2lhdDdTVHhsMVVxRExJWFU5d0NzM2ZWWkpab1RoQks0?=
 =?utf-8?B?a1F4UVRPVnFQa3owVGpDSTlDZXpHcjBUdkVVdS9TQWJwOGRGU243NU85K3JL?=
 =?utf-8?B?NjRGc2xNekNPNzhuRW9Mdmhzbk5ldHVSMDJkRU5xbDVpQ0F1bWR1b2FiSWkx?=
 =?utf-8?B?aDE2V3B6VFVXYk1XZWxiOGtsWjFXMXpuLzFNS1ZFN21uSFpZekZWZmd3SFFw?=
 =?utf-8?B?Ry82RTBQS3ZQc3BvNDI4WE1KeTBGVTZmMGk3L0g2UmhVbXZWNGx3ZkwwNGls?=
 =?utf-8?B?NHhqaUxjUDJjcW94V3hYbnpUWS9ISENhdWJkcGZKaUZLNiswU2NFemR0dG1l?=
 =?utf-8?B?andtL2x1SDliaWRiaVY3WDM4S0ZVc3R2bjVZNDNWT3Vyam9FYk9CdHFqL1pj?=
 =?utf-8?B?S256Y0MwYS9mak9GUDhUUzFZRENPTTZjclJtUTBLNUpaQi9NR0hwZTRCRzNm?=
 =?utf-8?B?b1ZlVGRYSU9mQzl0TEtWRldib1VQVUNKSEgxcGd4OE55bm9NUDlVcXBpYURE?=
 =?utf-8?B?bVhLQ0VEcnZEb0pQbDdFMTJjbDJ6RWdONFhTZFV6WUFzMmdGYkd0NmJ4bzlP?=
 =?utf-8?B?OTZjeXNLcTYvTjdBZFErazRkcHMxd0JsTVpQcTB4NVhDSUdxZnF4TlJyVkts?=
 =?utf-8?B?N3RCU1NhWXNjSEhhc05pcktFYVVXMEhDenpGWUpReTdqVmQvTlBTaGYwUGlC?=
 =?utf-8?B?Y2t5dkdPTGpkMHZEcDExS3RKclU1Ri91VVJBQTArVXlQU0hadjNBcDY5Tmlv?=
 =?utf-8?B?aEtWaU1Yd1FLVXQrV2s2c3d0eFFKS25JWXNWb2N3QTVCZEtLbU5aMVNDclNy?=
 =?utf-8?B?L2JYVjdlbjd0cGZrc1crVVpkYUVIaFFmdUljbmVqNHFjUks2cm5TaFNodWRF?=
 =?utf-8?B?OGNwSXN5QVA4MHNnc1hmVEVtV1Bldjh3aC84YnY1Q2lTZlo0ZGxzcDArRXFs?=
 =?utf-8?B?NEJHUXcyOHdKWVRMWHpUaXViSWMveDJDMHc2bkJrZTRhN2VCZ2d4VGc5bzdB?=
 =?utf-8?B?RjdCNGY2ajZXS0IzOTlOR0ZEMFFOVzlma3N4Ry9PUnp6WXZoc0JlS3VuRXhj?=
 =?utf-8?B?L1c2WExPMUxnMHVaNEo2SiszNk1rVFgreFJZU1Uvc3pLYXlrTUJjZ2cwNUFz?=
 =?utf-8?B?bnNtelVkUlFKOHpVZDBQN3dXalUrdjRDdHhxYUNQZnE3VG5rNXdnRW14Sm53?=
 =?utf-8?B?N002WWZ0bHVleGhXSmNUbkRuQ0FLWnp1dnU0Z0R4RTRQL01jNUxHbGt1QUdM?=
 =?utf-8?Q?6Qd4nm2ryfChB7gNC9jYn4yF7jRAZdaHr6/zRMr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9250bee3-a3da-4bef-1bca-08d917ac89bf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 14:20:06.3667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MQbX7tszNJH8sb5CWyj/R/0wJ6Zr0ZFpIIASAhqFXm3tJVG6uAE0o2h9javv399Yqgr/6lAUNMyhaxLg9D5wdXsPHDcXf490xI89xLznYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5496
Received-SPF: pass client-ip=40.107.7.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

15.05.2021 16:46, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Alberto, I'm sorry for not consulting with you about sending this.
> 
> Actually, I wanted only one patch
> "block: Allow changing bs->file on reopen", as I'm going to send another
> series based on it.

Haha. Actually I need instead a way to insert filter between root device and top block node, which is impossible with reopen, so I probably need qom-set instead, as Kevin said.. Or something new. Anyway, I've done some work, hope it's helpful)

> I started to work on updating this one patch it and
> it turned into a refactoring series below. So I decided to add you patch
> with test cases, for this series to be a complete* v5. I hope you'll
> have time to work on the rest of your series on top of this my
> suggestion :)
> 
> [*], supporting multiple reopen and final publishing x-blockdev-reopen
> not included here. Also I didn't address Kevin's comment that we should
> have some error-path testing of new feature. Probably I didn't address
> some comments on "Allow changing" patch, but it changed so much that
> review should start from scratch anyway.
> 
> v5:
> 1-7: new
> 8: changed a lot
> 9: unchanged
> 
> Alberto Garcia (2):
>    block: Allow changing bs->file on reopen
>    iotests: Test replacing files with x-blockdev-reopen
> 
> Vladimir Sementsov-Ogievskiy (7):
>    block: introduce bdrv_remove_file_or_backing_child()
>    block: introduce bdrv_set_file_or_backing_noperm()
>    block: bdrv_reopen_parse_backing(): don't check aio context
>    block: bdrv_reopen_parse_backing(): don't check frozen child
>    block: bdrv_reopen_parse_backing(): simplify handling implicit filters
>    block: move supports_backing check to
>      bdrv_set_file_or_backing_noperm()
>    block: BDRVReopenState: drop replace_backing_bs field
> 
>   include/block/block.h            |   2 +-
>   block.c                          | 287 ++++++++++++++++---------------
>   tests/unit/test-bdrv-drain.c     |   1 +
>   tests/unit/test-bdrv-graph-mod.c |   1 +
>   tests/qemu-iotests/245           | 140 +++++++++++++--
>   tests/qemu-iotests/245.out       |  11 +-
>   6 files changed, 287 insertions(+), 155 deletions(-)
> 


-- 
Best regards,
Vladimir

