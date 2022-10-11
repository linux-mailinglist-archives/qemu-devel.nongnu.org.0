Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F95FB077
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:31:53 +0200 (CEST)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCYC-0005Ex-L6
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oiCQY-0008Cs-71
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:23:58 -0400
Received: from mail-db3eur04on0719.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::719]:9286
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oiCQR-00035a-Ns
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:23:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIkWikJQgrujDca6FnvaLhYYvSz1XMCczsUB6oWD5Kj068Pp/Z9iPN/UG4+ObZLzzcWQUnTuSV6ONF6v/RSD0CKNri+vewy0N64Lg76KMb6pI1tveehYJOKiuGt2+lLjhpFuPGlnqgIlMxPGeLUzHCjdwSGr/Pgct7HNTo12FhvHFv3xBP4a32IxsSLE5ji2wZnTBEQaVtxGro24fqKvdghVvoGrXonIV8oDaqQOltwZGZmpH5Dg3kXDYwpXDKoWFV4fHGQ76j7zbA+cVXCpmCRNhtIkdQZ0vUHjAKjSHImzaXCwfrMnHTnmlbGngnUZl0K39UpXf2DFL+vdSZXp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aG4zRycw8gvzC/ge4ChjpRbWhnH7uFocAl91yiIucxw=;
 b=IH6IoVXlyS295VJ1/l8+7ymiWFV4oKAL8qzwunzQTdQeigmyii6POEomx+UW441J4aFYEtC+00OgxlarFPd7CmgtrMCKUtRKh1mlWrS+slrweUAPADmh4OsvWje7UA3Y+WcDX+EzCt7VAWU1z48OsWPGzOypJPAlick44hSEIsfT+nPKVRVo0LUH90zlAkhoqcdXQuEzJh5MUZDJLVD1y+UuUk2jZBc68xSUvidxa/PYnMUZBxc4Ms4RJ7VE+hpgSuf00GYjWqtsYq5MUiEUtpd/dSgBbU6NYbkP74ec0xSJgB7kPXZn9k4xQ8XiT4bjtjWphWzBRTIM2VsbhYt4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG4zRycw8gvzC/ge4ChjpRbWhnH7uFocAl91yiIucxw=;
 b=JwCS3aqaCOFdAqq04IJp6mnpevPigOaaU1cf5nD2R67/pN+tiJxKJzkzzpTFC1ksMxFW9PT21KVL3q3eB9+uuY6AaqXn2e4fosRIE+uZNbXa6qIEq3MAb3LsXIGj3nxONOgTkVaonRAGlQFwiUtksLAijIRx8s5T2kRhhKCzhlFKZ0VWrxYUs1pZmjVn2RuyjVA5bIPT5HXFKMpgJldXUPfjxs1JE7pT9O7fgdxNl4AuX82HwP7vwMAYGllVFtJ81tMwGXMH8Nc+ZIjhx1JqRkLrPUcQlAyUig0iRxWiExsWbtMujBlFCfaWye+J7kO6WZKAG2FpJes8wRWVDb384Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com (2603:10a6:208:5e::31)
 by AS8PR08MB8490.eurprd08.prod.outlook.com (2603:10a6:20b:567::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 11 Oct
 2022 10:18:45 +0000
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::7f2a:a87c:67ad:8cac]) by AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::7f2a:a87c:67ad:8cac%7]) with mapi id 15.20.5676.038; Tue, 11 Oct 2022
 10:18:45 +0000
Message-ID: <91db0531-0793-92bd-2d0e-8ad8921cbfb9@virtuozzo.com>
Date: Tue, 11 Oct 2022 13:18:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PING PATCH v5] Add 'q35' machine type to hotplug tests
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, den@virtuozzo.com
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
From: Michael Labiuk <michael.labiuk@virtuozzo.com>
In-Reply-To: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To AM0PR08MB3298.eurprd08.prod.outlook.com
 (2603:10a6:208:5e::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR08MB3298:EE_|AS8PR08MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: d70880e8-a662-431b-6274-08daab71fad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KbfEgRCjaWqr6nl2X6apGe+H56fKOfO9PuPCrNc0uXnopjLT9i+teCBVaFDo5D5e8tJXzyxgIohhQeS5O+9YhqwBGbFS9l5pHYcwf/7S9VoXGjs2ACDP6zS2/PmUWbXBhxxp0qedwVo3KwOy7v+FUSnyrzB9dWcNYSFUd3Gj7699JbCqJf160s+0kxbvi1e/EleCIkVDjqoreUCuzYdoOIfA/K+gNK1m4yQ3aR0Qj358rYsf9f71V7ltIW+iH0Q3IYDf1Ql3EURUdRV8Jju2dx2ojRzqv7w/MFvOgYd+Uc8am8gNnFfSAOv7695DDRgbkaFsUvllSQIlPuq6PEHYIjO3nemYvtXO0lwOQuueu9s9EXEg1G7l9Qfw5h+ovoXI7aUu7AJnP474WrgHaHWUCtxbS+FvIbaR0sANXCmGBgGeXJH6qcECzH03+9hfu3AQxlUG9lWdfwrQfH8sIFdYSdn3+lIET6JvP97vyYY8GJa2pyM9NaOWvri7qy9pu3Y9UqYAnQRk45PL8Ij/OWF6CMgAd0r6407yoHjmwNR1kHQpTTazUyT97nL5CzeoZs7Bl/IhIHBotikuQvvaRHOAO2U11qF4RHPVC4eHw3Xw+JGWafPD2M45OdU9ppp+1xU0SWbd2ZJfQPzkBTpTWWlMvWORxmNtqEO7RSdyRGxrkk7VKLE/tEPZL68uKOdniHUEbthpVuWRhBG4xFEEcqMi0b63HQ/OvT1cZ5OJfMxoEYL/315s+zXSxQAxpCMrYqXuPy7l2Ephh4FYCfsccT3zfB6TuVfM4YOYXefh5sIzmVp4AuaBIMIG2oc+RnSnb+HkIPzgvuqW05+sV1gfImWhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3298.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(39850400004)(346002)(451199015)(54906003)(316002)(2906002)(83380400001)(36756003)(66946007)(8936002)(44832011)(86362001)(38100700002)(31696002)(8676002)(26005)(53546011)(6506007)(6512007)(6916009)(186003)(41300700001)(5660300002)(6486002)(966005)(66476007)(66556008)(107886003)(478600001)(4326008)(2616005)(6666004)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTZOV0pPdFI0ZjZkb29jZXNHQmprKzBsY3kzb2pZYzg0YU1YbDJNYkcySzFr?=
 =?utf-8?B?aHQ0SHB0UjNNYXV4VVhNNjJCdS9KUHZFK0s3N1lreXYrQzBTVWFsclpYT1d0?=
 =?utf-8?B?VXJ2a050ZEMwZllBUERZNmQ3dnV1cUE2NjdaemZLOElNcnp4VkxJOG5OWnNQ?=
 =?utf-8?B?UjVqc3U0alF0blpRakRUcVc5L0RjNnpWVittQmJPQlhYRWVSdFRpeEY0Y3hX?=
 =?utf-8?B?VWZnNXJvWk1RZ0E4RDFzRW1wZHpzVnJFMUZTTXdkQk5RaXdIRzBQZGx1ek9N?=
 =?utf-8?B?akJ0M1IwbFZzTjY3YU84V3BmcHFISUdFV09HUlMyZVlQTTFZOUhHclZxeUlU?=
 =?utf-8?B?blNSVUFyaVV2cG01K0Z0K1ltL2VtbjFjeno0c0svOHI0R2hkMzRtZnNweEJV?=
 =?utf-8?B?KzRHREY5dUVqdjN0L0JzTkdMNnErNVdLYndoZ1FkWjk1V0pwK1BHQTV4K3hl?=
 =?utf-8?B?MlVUais5cHZ1QUdqMDFPMUhRbDVEM3N5Z2NIQTR5eFRIWWJWZzB6YkgxaEhx?=
 =?utf-8?B?Kytwc1pOL215eXhMM2ZvdThzVXFUTXZ1TjU5V21OUmZtdW9iV0k3S2dKSFlu?=
 =?utf-8?B?WDJwM0NwYUIvUUl4TGJ3RFVaMnN3UnV1MGc3R3BWNnN3MHpFY3VLZ0NJNUQ0?=
 =?utf-8?B?RWVpVEZoNEJ0ZnkrcHJwWnRPeDFUU250T2tBTWZOWVR4c29sMDd3NDdNTG1J?=
 =?utf-8?B?YWFpMHZmTjZmYUNFNWc4TFF2N3VhajZTNXgycndOVDhYejZ0c2xJNkF0Vy8w?=
 =?utf-8?B?c1VjcDcrQ21vMDBwV1pHdDhRbGZEQTA5OHNmci9EMWdzQzB6SmJYdm40Q3VB?=
 =?utf-8?B?b0dCbWFJOWc2aEwvcjk2N21ETHhNeTBnZXFQaWVWeHZmVHR4eTk2NFUzeFdL?=
 =?utf-8?B?blZLZWRKWFNzRVNTNHo5ZjE2K1hGUVpzcXRLZzNTWU1CVU53d2NhMXdlYXpH?=
 =?utf-8?B?SnFxNjVZenUvNDdUckhsNWVtUE1jVDZUaWdBcXlyRGNqeFY5SW44QU1VVVgx?=
 =?utf-8?B?UEIrWUtWRGx4RnpmSDNoUWM4RyttRVFZS29lZXhQdFFJTC9DNVU0cnNmaGxH?=
 =?utf-8?B?Q1JtRjB4Mzh5K1ZhajhEbWdhMVliWWdQWjkrZ00rTEdveFFuRkIwa2ZaSDBv?=
 =?utf-8?B?MTFDcEN4SmJIYndxWjl3WEhQZWp6TTlYdnJmTDJDWWRsY3VNSmUvR1ErTzh1?=
 =?utf-8?B?NTN0T1NEcWE4NllkMVo3dDg2VndMaEV2ZXo5SkF3eGE0bEFlbm9GOUVpa1VE?=
 =?utf-8?B?UzAzZW8rMUlxcDQwMmN0R0VJMTJFNk5uRlZVWTlqME40TXA4alZBVnVpNGI3?=
 =?utf-8?B?RUtxTVRDaWNKdWNhVWVNQjArQlZtNWdGdXpzamo3N0dxUXhibWg4UHhYaUJt?=
 =?utf-8?B?QlQybnVuam1Ga2F4bW9TVEZudDByY1JGSjNPZFlvVXRRVy94TW5jUWp6ckxC?=
 =?utf-8?B?dEMrWnEwZ05RZldaY0E4K2doM3JQS25EZ3B1Z2xwdlZ2N2tXYWtocHJxOWkv?=
 =?utf-8?B?b29zMFBCRGNQcE0zWmE2MUdhdGI0c01Cb1dJcStZb3NlZHA5aGd4ZzdXUEtM?=
 =?utf-8?B?blJRK0hhVHF4Nm0vc1N1S1RKcHkvK01TaWJsU3pPZUhVUzNQb1g2VkhmSGE2?=
 =?utf-8?B?Z2NsQURZOWFQWXhERW5mTDZDbnd6a3ZWakRuUU11TVZSV2V2NW1FOGlHNmlK?=
 =?utf-8?B?WWZiRm1xa2ZBT1NzREFVRFVPeVA2Yy8xcFZyVDNSYWJwbm1aRHdMTTc4Q2oz?=
 =?utf-8?B?bTg5VkpvU3BpTVpMRVEvcDFJYTM5YTlseldIZFQ0SnRhVWJNS0U1bUhNRytv?=
 =?utf-8?B?M1lMT0JQOXF6ZWExN0gxZlJFRnRPZmd0dU9RUWpHanNxWHoxbVNvVGJvMUVI?=
 =?utf-8?B?TDhmUWlGdHpYVkI2OXp1b0RUc3V1VDFlcDZ5c05Uck9vblR4dnNwdHV4OU0z?=
 =?utf-8?B?eVV0ZkFYNGtlQWVobUdsRGhkUjVuT2tBelljNjRLbzVySVROUjRmaXVvYml1?=
 =?utf-8?B?OEFIcC8xbXMxU2VUaWlCMGNDbnZXUktxd0M2Y3Y2TWc3UjdYcjlIZGVCUXRE?=
 =?utf-8?B?OEJyL1N4S0dPYWxDekxKWnR3VDFhbzdKNG5yeUVrOHByZUo0d2s1THZHQlZO?=
 =?utf-8?B?UFFQU0g4bDFQenRucVVGYkVJTFk4UitWb3JpSk9MeHhFSnkxM1JVbVA1MDRW?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70880e8-a662-431b-6274-08daab71fad6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3298.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 10:18:45.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OScmFA2UCcvVov5McbxZQ/CLMGPZyq0gqpyNKvDZsWvK3aZ7yAtU9VeLWSBf50C6XdZNmjen8oHm8v34FbxdNmpt//9l8EjsBs7iw7ny9sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8490
Received-SPF: pass client-ip=2a01:111:f400:fe0c::719;
 envelope-from=michael.labiuk@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

I would like to ping a patch

https://patchew.org/QEMU/20220929223547.1429580-1-michael.labiuk@virtuozzo.com/ 



On 9/30/22 01:35, Michael Labiuk via wrote:
> Add pci bridge setting to run hotplug tests on q35 machine type.
> Hotplug tests was bounded to 'pc' machine type by commit 7b172333f1b
> 
> v5 -> v4:
> 
> * Unify device removing in tests.
> * Using qtest_has_machine("q35") as condition.
> * fixed typos.
> * Replaced snprintf.
> 
> v4 -> v3:
> 
> * Moving helper function process_device_remove() to separate commit.
> * Refactoring hd-geo-test to avoid code duplication.
> 
> Michael Labiuk (9):
>    tests/x86: add helper qtest_qmp_device_del_send()
>    tests/x86: Add subtest with 'q35' machine type to device-plug-test
>    tests/x86: Refactor hot unplug hd-geo-test
>    tests/x86: Add 'q35' machine type to override-tests in hd-geo-test
>    tests/x86: Add 'q35' machine type to hotplug hd-geo-test
>    tests/x86: Fix comment typo in drive_del-test
>    tests/x86: replace snprint() by g_strdup_printf() in drive_del-test
>    tests/x86: Add 'q35' machine type to drive_del-test
>    tests/x86: Add 'q35' machine type to ivshmem-test
> 
>   tests/qtest/device-plug-test.c |  56 ++++--
>   tests/qtest/drive_del-test.c   | 125 +++++++++++--
>   tests/qtest/hd-geo-test.c      | 319 ++++++++++++++++++++++++---------
>   tests/qtest/ivshmem-test.c     |  18 ++
>   tests/qtest/libqos/pci-pc.c    |   8 +-
>   tests/qtest/libqtest.c         |  16 +-
>   tests/qtest/libqtest.h         |  10 ++
>   7 files changed, 425 insertions(+), 127 deletions(-)
> 

