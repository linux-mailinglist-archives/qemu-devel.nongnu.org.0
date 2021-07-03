Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867AF3BA863
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 13:19:17 +0200 (CEST)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzdg4-0001Mi-68
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 07:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzdeN-0000UO-EU; Sat, 03 Jul 2021 07:17:32 -0400
Received: from mail-eopbgr150093.outbound.protection.outlook.com
 ([40.107.15.93]:38102 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzdeK-0004ue-Ac; Sat, 03 Jul 2021 07:17:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDWvQDjLzqvgl9ZxI77HjtRoS5ykJd/Rxw0f7Srj1bj3wcdr4w7WYsJvpPaQvQFF39L1qoGlKRdAblUOCWiYVtlsitrMqKCBe5QV8gfcFzf8g7U11MgTLSpUyVck0hqnrQ1jb2q4zTkHiNFAQ0WEypkK4AwcdKkrZadVn+fIpvWwruf9PSnHMtRx0cSqXOOPrMBZ0uhy9aETWBpqXWtQycR6aP+bV08oYcCmJWkbz/sSqoxgkL+8+d7BwPMrYo3+bxyTKFG9HcaSmV6e/74HKhWjyBD17UEImLcbDpNQda2NFSii1JBS8alyqQ9FcxmgcyaYRTcnxbdZFqEANTfJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEMWo+aMGTtdmMz8w4/SsyVLqloIqATcOYR0ajcOpvE=;
 b=VM0mGirsaaQ3aLwWxs4UcgItTkAiTdvnyre9Ay5aG50TvI7Gjm0vs9WEdbOZ5SYmnQG6IsaDZ1efo4nx6U7HCogq5cwX0vyBM4UHc67tOXDrgLkNBbRj187x0XPCfXE0p6vFb1xl9VeaYRTZP4ym3RtUeoxvUePug8A8qfxMW/ttoOcUa+1eQB79ndHgAnLqOmXNv4GhqJW6xnC/K3CAIpLeLzKe/wt2IWDkMxfPRqdIR0OJsPLp4EKN84ki7hPDYaXc4kxhLhV/wGBJ+96nQtyp9jeWhqyzQI/qJu3cW++7WXsCfdOEi9PqoUoNuMLTTWeTKE7PZLEeNN4eq5YCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEMWo+aMGTtdmMz8w4/SsyVLqloIqATcOYR0ajcOpvE=;
 b=TQIKjfoi8ZHs6TEtUglWWVLgCQC0LkceUvOFcJSYLXZ5eHRen6xMtPJ7acUKcERsoUKB7s3dSi5KukotTyR4jljblKCPk9mt5uOa227iu0MrqrUGUGz8OF0waH/F/nv9JTewdu7Gt7nfVbD/7YwrI2tG/Kgz9uTJXZln13n1qr8=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 3 Jul
 2021 11:17:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Sat, 3 Jul 2021
 11:17:24 +0000
Subject: Re: [PATCH v3 00/10] qcow2 check: check some reserved bits and
 subcluster bitmaps
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <482f241d-1a1d-598b-9b58-a975e4657320@virtuozzo.com>
Date: Sat, 3 Jul 2021 14:17:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210524142031.142109-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM3PR07CA0131.eurprd07.prod.outlook.com
 (2603:10a6:207:8::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR07CA0131.eurprd07.prod.outlook.com (2603:10a6:207:8::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Sat, 3 Jul 2021 11:17:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a4b3cee-1a0f-4b48-9556-08d93e1421af
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB628026B4D9A59C9B17F8F658C11E9@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sq0KDDkkAiYz5WIrPL9U5Kc67JuUrPgwx/sbS4hwxp7t79nrde9QnsbeFxBgu3ks8RZ5MW4AIOtg89Tqfw1PA5OSJ/bvkHIcnQZ043WL727FoyLxMwsBvh3SFcgHDec+ycPLLmBsD9ovasja0J3huLI/lAnJ5xZe9ZPMhMXNWSa9UY/7JAmHF2R2GG4nawMEI/L1BmAg6G9v30cFWLK9pf446Hh6A/wxfiUAwHcRa+wUPUw+qC4OBdQo5MdYpHVQPwiNiDJRfa5+y3SNnd+gL99qYevslq+RA5XU4JjwGdpiWpMa9Nhq/tlRUK99/8w3szcaIkMpvfF1DMaisXjsFUs1kBTBT5eMgyL5vYvC9EwFNE1rEtm9+tC3di3AO/0h5oHkixrc/2ilqzVn0rUgcdyb/YjRdajbltuqzb6Jiksq4NxfP6mNDooeY9U3iyuXUtdypvgd85mfiNSc4rEaofcJqRckBib6eUFdOSFg2d/RD0/PoMOqzPBiIsLo/RqL8FeWewMGY0ISmCe8OZQOZELdqeaaXCR7KOhGsaMfAVxwNWOOiIZxKHeFg7WF/N0k4/L0W0yeWjX3qjAlM5ofHdBb+XzmRGPaNnqF5PfTUz3RgGhg4OuMr90julhpZaFQRCJGOT0rMHjRjOJzrBF2ozRcz29ABdYned/IT2lxFfOrfhf+I3pJob2Uj2PkqbwRd6UJVJpokzv2pIHqIvwXAFTHmj4mWc/mfN9elZiE9kqmUJTrSLZ47WUjFFhDV8kfr2G5j6OqLLAWOpqQqCocQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39840400004)(8936002)(956004)(6916009)(36756003)(8676002)(5660300002)(52116002)(6486002)(316002)(2616005)(16576012)(16526019)(478600001)(186003)(86362001)(66476007)(2906002)(26005)(4326008)(6666004)(31696002)(38100700002)(31686004)(66556008)(38350700002)(66946007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjQ1bExXS2tsdndKVGZNWWt6MlA3VTl2MkdUWUQyN2pORVhid3V4dVR0elVo?=
 =?utf-8?B?ZmRCVXcySXJ1YUVjUGJCREx5WUVOaHJSZEVyZXlBcU1keE5IZGlaL2RCWkll?=
 =?utf-8?B?SVVjZW8wWURYV2NHbE5raGVpUHdkZVFJTkY0cmUxeStWOVBXV3lZUmlGZUNL?=
 =?utf-8?B?UkwzTU5XV0Y3MklOTHBkb1ZzUmZ3SWtlZ29FNE1FTHJ2UWF6ZzFINk9PTzZF?=
 =?utf-8?B?WEV1SmV0UTBEKzJKNlg2YlRaRlZzTmxabFFkbVRtME96M0dOUjhCaUxNMEtu?=
 =?utf-8?B?dUVPQ05yRUxUclV6YzU4d2FkWXQ4cTQxUjlrNUljcFRtMWtlenpsV2VzS0dO?=
 =?utf-8?B?NExMNTVPNVNranBQR2FFcXI1bUhVK3h1a2tJTVoySlVQYVdqT1BpV0l4S1lL?=
 =?utf-8?B?ZktKN0hOd2VUdWZvbW5icHZmS3NGY3ZLZERQVDY3S05PeGRIVFdJSHV2cUhv?=
 =?utf-8?B?UWpIazBnaGE3YUR2cytlQ0VvbE1LSGRtaXJ5bVFqT3psTzdHclROMEZ6bUhW?=
 =?utf-8?B?cEwySW1JbHU5ZHFEeU1zMmRtVFhGbFlVaE0ybEV5cEpXNXgzMEx5Zk5zUGVp?=
 =?utf-8?B?VXA2cGxIcjQ3RVRpVEhiYWFCMUlPemFvOERWbjdCQTBzYXZodCtzY2dzaUIx?=
 =?utf-8?B?N0VDbG5hUjNwY2dhbnhRMjNLTnV5aUZqOVBHdFI3RXdKWHNoVUhIdWF4ZUU2?=
 =?utf-8?B?emxscEs3NEMwTFJNc1ZPYTJBS1EwV003MUllODhHeWtWOXBodVgwQUdBK0xS?=
 =?utf-8?B?d0YzZ1RvUGlFUE51Myt3VWJTRG1Ed3RJblNLR2s3NG5CcXI0STM4SHR5dXMv?=
 =?utf-8?B?UnQwalliUVhUTTBnLzVoRzh3b00xWC9KWHE4N3cvRWNkd0JyZ1pxeDRSZUMw?=
 =?utf-8?B?S1hKZWVSSS9kZlFUa2laNUwwM0tITnp0VzBZcVdwUHBVcDFwRzJaYncwT2RK?=
 =?utf-8?B?ZlMrKzVJN3lKK3FnL21oZS9yVk1EYWtZTkNEcVpHQ0RsVUdwY2trNmZUNW8v?=
 =?utf-8?B?NzlEL0toMlV6TVVIczd4T09kd2M3cTBjNk4xVmFrM2RSaFN0bTJEN2tTTHFa?=
 =?utf-8?B?N1RqQ09peXRSNWdsVWRla0I3dWJLSDByMHVjSEcvQVZoNFV3c3BvV1NMM2NM?=
 =?utf-8?B?d1ZsT3FxSTVHSGtXU1VhbGhpdi9rQ21yR09GQjZNMnc5cU0rY3JKdWNSbmV3?=
 =?utf-8?B?YWVSK1hmL3cxY2JpaHpHbkswUm5EY0pKNGtsS1VTazl5SDBESmdWOUp1b2k2?=
 =?utf-8?B?ajM4WkVSUkVSNGJQb2FrdjZRNmpYbHE1dnZsU3ZDMUx0Vk5hMlhNalFwRm9s?=
 =?utf-8?B?Vlh4L0lwMWlVbCtES0w1SFZkTWkvYVdveTVFUnRFdXBjVXZWWFkyYlRHRHFu?=
 =?utf-8?B?ZWJaeUFaK3JLZGZxL0o1QU1CaDMxMXhVUHZ4Yk14Y21JSXlNLy9lWVMzeVlt?=
 =?utf-8?B?R2dKSUlCOGM3a3JhSVBFVFpNMDNVejBzdjNmYU9CYmIrOVlvdWRSRGkxOHpz?=
 =?utf-8?B?MUowd1lJZUN6WUJzR05CU1IyUUxra016Ym5oN0w5c2Y3UDRmMEVPc2p3Y1hD?=
 =?utf-8?B?aTZ5Y3JDTkkxU25zQ01NdTA5TVNtYzZURmlPME1zMldnSG5BUzdaek9yUWsy?=
 =?utf-8?B?Nnc2MVovQWlsNnpzU0RXa3VTb2JjbTRDTWFzK2VZSTNTd3lxNXFxSXdmb0Nz?=
 =?utf-8?B?Yyt5UlZqSEg4NkV3SXZnVWtFNnBkRDBaUks4N1NxTXZWdjB5TUVsb3owS1Jw?=
 =?utf-8?Q?+QOguAct3nPipT0TOWNsEGCKSOgLCmIecOeCJ+1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4b3cee-1a0f-4b48-9556-08d93e1421af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 11:17:24.2376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfYMQu92CIefwYcMUNOYYjhtw7coRNhGazcOtXkxewyAA0Lc93uOne7h1XLSwsdx+7GJL7CEHQMEQnfDXQNRr1riGRYw04JSSxDo9S+bDK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.15.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

Ping :)

This still applies to master with no conflicts. All patches reviewed except for 08.


24.05.2021 17:20, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Here are some good refactorings and new (qemu-img check) checks for
> qcow2.
> 
> v3: add r-b mark by Alberto and t-b marks by Kirill
>   07, 09: add missed "\n"
> 
> Vladimir Sementsov-Ogievskiy (10):
>    qcow2-refcount: improve style of check_refcounts_l2()
>    qcow2: compressed read: simplify cluster descriptor passing
>    qcow2: introduce qcow2_parse_compressed_l2_entry() helper
>    qcow2-refcount: introduce fix_l2_entry_by_zero()
>    qcow2-refcount: fix_l2_entry_by_zero(): also zero L2 entry bitmap
>    qcow2-refcount: check_refcounts_l2(): check l2_bitmap
>    qcow2-refcount: check_refcounts_l2(): check reserved bits
>    qcow2-refcount: improve style of check_refcounts_l1()
>    qcow2-refcount: check_refcounts_l1(): check reserved bits
>    qcow2-refcount: check_refblocks(): add separate message for reserved
> 
>   block/qcow2.h          |   7 +-
>   block/qcow2-cluster.c  |  20 ++-
>   block/qcow2-refcount.c | 328 ++++++++++++++++++++++++++---------------
>   block/qcow2.c          |  13 +-
>   4 files changed, 240 insertions(+), 128 deletions(-)
> 


-- 
Best regards,
Vladimir

