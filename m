Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF655484D8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 13:33:51 +0200 (CEST)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0iKM-0007qU-Pq
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 07:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1o0iGL-0005vp-An; Mon, 13 Jun 2022 07:29:41 -0400
Received: from mail-db5eur01on0701.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::701]:57827
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1o0iG9-0000yq-Ey; Mon, 13 Jun 2022 07:29:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpOLkLAsWB5RuoWlqeenxJE5Fj2A6bUSIvj2YkL3nfMtnaWob/FKa4uTsoR02FbJQJrQpKeplbJTWGEz9pUTs5UJ+KIsJdzK8M9DWXPwXL8Cin0qjndXIF3RU7R2s5iMCNnC/InwVfW1X6QrX9aCbvCk8TvTwW1zbBysVXAGeHmq5RLGMBCp2j6RSoRq9ziTtrF1pmTB9NljO9Eb7Aj5c7bLxxK5O1ryqEn3ovarpMVMlM8ZW23lBG1ewN/3gMKyLXnuhvaqfi05E8sw8pVq14llwSmN9bUHPgPwU62STXLLcKUR7GYOogfd8Pq6Ss0QKHBxv+h5+kAwswVVSho6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3mQX5escw82pfPjm1z0Oteo7zVFc0o2twK+kHyR0lo=;
 b=lbBXzYoAorJDgwH7/X+Ob6r7lA/RgS/ylSwZoPZ7JjKNfAsHWMn0KAhYBx5ejFyXr+SU609xiz/ziqOUSpw9+5rxjh7tDNv44crP1KvyxazftElS363v9Z3NbPboadJxNvFtj0aHrS8/gZBQ6OSEF6PcU487+dWCY/NsXwDPn4g9NR6Yv/YLkfeoBP2J4Zg6GFpAZoNKAxiz0KsxYlmaXUmrMkDXYn2jG0zy5n7IC1lE7zQPsrQ3cAIAI/cw/TH6wW1w+SssViWGhioEQp7K/GZ6ix3t5r55ILh8NlcU8VLBv3W7W94cdW02U/vTaY31KabrzSiH6nYiPV7+0urqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3mQX5escw82pfPjm1z0Oteo7zVFc0o2twK+kHyR0lo=;
 b=VekM1fbng0iroFVP5WGnFsNOj5wT4u6f9d9rBkiphWyf+ViGKRhpJ77p71Gx14bE2x52KVRf6qXwHkOCjpaKs5T4SfQgsG0BHNvCRz9LPOrXhwq1viKxAWdkhnDb2br9DsIocPb3EjEWI5hKfVTOuVCw1FoTUUEwPKs+JHPPvzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB7PR08MB3130.eurprd08.prod.outlook.com (2603:10a6:5:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Mon, 13 Jun
 2022 11:29:07 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1%5]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 11:29:07 +0000
Message-ID: <34cfd701-4ad5-3574-59c6-537d1aa57e3b@virtuozzo.com>
Date: Mon, 13 Jun 2022 13:29:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] block: use 'unsigned' for in_flight field on driver
 state
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20220530103957.629398-1-den@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220530103957.629398-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0701CA0063.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::25) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9e3e6e5-3491-4c51-4b80-08da4d2fedc2
X-MS-TrafficTypeDiagnostic: DB7PR08MB3130:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3130085597DA3B2B5712C5D7B6AB9@DB7PR08MB3130.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KTmzVnoNgqCddHIXNZnwzgbrkTEb1hmzNIlq9Z0hSA9IwV6GuO1BVTAx5LPzQkz2nZe9QeAGy9E63GGB0+w7Bv1qDPG0PaKfuoH4DJhrPb3fehjIMGe26ln6Dxp4GkFIeyCvda/ghTJlOAFJYhhwl0itJKIZbNsJGTkhNkSCLlKQsj7tSXZ/W2Z+g3jLIWU7Dr8pwmz2vOw0foZOKBFjqx8mo54HcSbKpo9++BG5Zc6/vyjhDHM+OAuFoO9Cjt5D24PcWn+pJzQehGTeEM0G+rt1CcmNRkGI6u0k+wrhstORA+lHHtBGnPw4+m0xBvMhQdNk8RuonjQImEZKYHV9Fcxw527PCw5mJBde2A2PkYEe+IpYU6j0FKGRCgO18IMGVynJ+ejPKnXnzUDJMo6/UvdrAUJC9XZf1sZr0K/zd0EPvgQGZ0clr6CUtqJqAIOK+wk8FyUMHM9+oKaDioTSfka17J5QHHWq5V8NhODILrKHvDgprPsUn94xYdh5KiCB5OL6GC9HoVSHQr9Nu+WgOh5o8avY+wpwx6vCf61xZnBHzJ2DEG7Xu4p7szHW5xWNbg1C/AKUnGWHbE+KkWdu2iT/6PWQNvVfQLcbfu5gODdOXs1VCM72O4P1OYfYLm3nB7yW0deEMKuoWGlpXiHtobt8ICkHuTC6dvIuUHwVx+2txVprthtulo6AkFfmvwTCfGcDOMHRItaMkwhlIY8ZkqKWoQeIQNuQMXAXTK9PX/g1j1L3GAQhNr2zXvIThtTBF34kV/1Qzrg2c0bVDkmIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(4326008)(8676002)(86362001)(31686004)(36756003)(8936002)(5660300002)(6486002)(508600001)(54906003)(316002)(66476007)(66556008)(2906002)(66946007)(6512007)(26005)(38100700002)(2616005)(53546011)(186003)(52116002)(6506007)(31696002)(83380400001)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTRDUmRWdW9UQ0x3NmVoYmxzeENOTzdJVXVsNE5FNUlOOUpOUFRhNjhvTTlP?=
 =?utf-8?B?U29qbkpzMjlERDA1ZEpMMG85dE0xbEltYkxyeVppRTh5NnhwS0piS1FiZkZ5?=
 =?utf-8?B?LzhFRlJYUjhYZGxCWE9Jb3Q3Z3dBTkZxZm5XcVZxWnB4VWZ2RUVORGpPZlZj?=
 =?utf-8?B?eVJhVDlDMmhEcWhFc3ZXU2hkY25OelpkMTN4dXhEdmNhT3dkSUVtazVraGdy?=
 =?utf-8?B?QkFUblMzRUZNZkpTZnpvWHAzSHVzbzJpNU8xaEVHekorSU1DdDdPQ1ArVm85?=
 =?utf-8?B?YmordkxHZDZ3cjdpVkZDV2dVMTAzQWpoUjBvR2dLY3l2U29RRTBmWVBJZmJ5?=
 =?utf-8?B?R1hnUVpBODFnQSs3alE3WC9pOUUxM1RqTTBxdzBldlcrUkdnNURybnh1Qlo5?=
 =?utf-8?B?a3F4b3RRNDhoYWZKZk8xQVh4WDJrT1ZnSG9Ka1p2T3YwamM2MVlYWlNHbGx4?=
 =?utf-8?B?Q0xNdFZWTkVXUkJXa29oMzg0a01xKzAwRTJUS3lUblZRUGFaN0V6N2lEUmtl?=
 =?utf-8?B?eWQ2NG0yeWRqQlZZTmVzMUZMN1hkTXFSNHAyMVVJRVg0YmVUSktSM1ExNDZG?=
 =?utf-8?B?V3NwMjg5WG9UQ2dhQzRNQjBXdWpldmFjOU5KSTFFcG12ZW12eG83UzVFVUdy?=
 =?utf-8?B?TTlTTVQvMTI0dnFBL2VoSjJ3dkpsdS9lRzRXODJZaURJM1N4ZlBMZHJXZ2xt?=
 =?utf-8?B?WkdNbmdwYUZhRkFhRDdGZWI0aTdDSU9uMVU0WkoyVGFCNjMrKzlQZWJYeXlG?=
 =?utf-8?B?S2liVElPbFkza0N5ZUtQMlZWWWoydGh6M3ZBRms5Wks0OEpUUEFwZG8yWE5T?=
 =?utf-8?B?dm9iUTYyTFRuNGZuK2NnTWRieVdjc090ZDBtUnVpNEhSMG96VlF1TEd4RHRY?=
 =?utf-8?B?WlBzcmIwSWM1MWJhMWhyR0tjc0theFFrM0d1VmJRQk5wc3NZNXllMGFBR2VR?=
 =?utf-8?B?OVZ6NDNHakxqejFjcmtKTERNclQwWWFzWWxKb1lGdXh3ZkNlZ2RiUDV0aWht?=
 =?utf-8?B?YWxoNUFDYWcrS2poNG51d1lBQXd2L21wZlJ1bVI2ZEZvcncyUEkxZXFLUWxX?=
 =?utf-8?B?RTNzWVJDUFNiNVczS0ZSWXVHcnNsUFJTU2ZLcmxEcG8xam90cW1xUXNzNUho?=
 =?utf-8?B?a3JablJRUU9kSnFKL3NNZjVGWFVNV1FuWE92NkRvdWIyYUZTcnlXTjhQS2pW?=
 =?utf-8?B?Qmo2eVAyY0FRQjZMbEpmSWVmYkZMcWdkMHE1RWZ0UHdBSVhmY0tvMlFSaWtR?=
 =?utf-8?B?WElCR3NTcjJoaC9peitmc1psQXVaOXFiZjlBcllTb1FlbmZ0UFB4SUova3BS?=
 =?utf-8?B?NU1GZ1ozSmMrSXBjeXVhRWZGOXRNNjYyQi9pSUxCZzdaNENKeTBOWnU3Z25L?=
 =?utf-8?B?R25SZWoveXNUSXIzSmtJRldhWUR3eCtWOHpLcTZEMVBXY1lQeU5qS1FueUZa?=
 =?utf-8?B?QURDREJUaGVoYitUeTF6blN3SW9qTThvY0Fqemk0alZEcHJQM1gxWlIzZzA3?=
 =?utf-8?B?d0p2ZlA1UFFvRkR4aFN1eThKQnpQMUZMZG0yL1VDN2dNN0Nrdm5zVmJaeFRE?=
 =?utf-8?B?aHdsdkdYbE5uMHZ3QTNxMVowbFRLUFg4T3RyM1VKL1BGTEp1WVRjaTBDd2ND?=
 =?utf-8?B?bk9GRjg2M0FMb3pxRUo1SjYxU2hFbjF4YXJvaVlrcGpjZEdMZnp0N1NkRUFk?=
 =?utf-8?B?K3d4QUdpVytlUit1VVR4TTYrQ3BEUm0wUVVUUlc0V1FEWE1vazJSRldxMlB0?=
 =?utf-8?B?Q3U1Zk9DcTZ6aittN2k5TUl1aXYrKy82d2w1RE9MMitMZjl6ckhSMkpIZzJE?=
 =?utf-8?B?OS9HU3hHcm1FZUZvWi8wOWZveUhDT3RhaTBDV3MrMzBoOTAyRWRCS1M2TTNm?=
 =?utf-8?B?WEI3eXVrVm90d0RRdEUvU21peVZVa3c1NGtPdzBoWm1IdWN3bDlZb0g0YjVY?=
 =?utf-8?B?YkxCcVN1VUF3Rm52RXFTYmtTNTlEbjJzeS8rcTl6aVl5bHhid0V5czUxQXpQ?=
 =?utf-8?B?bFMydUIwSHZJRHdKbklvTkJBVmJ0bXVwdFp0QWhqZm9aYmh3dnJhSTNlOTJV?=
 =?utf-8?B?VDJhZXBKWmw5d1R4aDVKdEx5TXlsVXM5ZE1mOVdaSE9KalFiZmk4Z3lCNUtE?=
 =?utf-8?B?WktaVHhRSjJJN0ZhMnVtdkhhUm9pL0NOaDR2ZllXbkh0YXpMdXkvWXdZaVJr?=
 =?utf-8?B?cExpN2N6N295OHl1TjBta0pqUTZ6N0FIUS9DK1BibDc4eTUrRGg4UG8rMW1O?=
 =?utf-8?B?RHBXTXlZc2JmeWQ3aDhNTzlrRkx5WkhKU2JDbnBDb3M4M2tQOHpGalFhMzlN?=
 =?utf-8?B?YWlNdVlmWXFhV1R6OEpTWnFweWdmRmZiQnBZVG9EQWNRUktMcHl2UT09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e3e6e5-3491-4c51-4b80-08da4d2fedc2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 11:29:07.5487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/IxXD0yIqOwROP684SFrTdjRUaStE2VgT5hOb1Jga8oMg11OmQgXzpF3qqgqBn0fpXcN5wJ3eFgs58SzC3RoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3130
Received-SPF: pass client-ip=2a01:111:f400:fe02::701;
 envelope-from=den@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30.05.2022 12:39, Denis V. Lunev wrote:
> This patch makes in_flight field 'unsigned' for BDRVNBDState and
> MirrorBlockJob. This matches the definition of this field on BDS
> and is generically correct - we should never get negative value here.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: John Snow <jsnow@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Eric Blake <eblake@redhat.com>
> ---
>   block/mirror.c | 2 +-
>   block/nbd.c    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/block/mirror.c b/block/mirror.c
> index d8ecb9efa2..3c4ab1159d 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -73,7 +73,7 @@ typedef struct MirrorBlockJob {
>   
>       uint64_t last_pause_ns;
>       unsigned long *in_flight_bitmap;
> -    int in_flight;
> +    unsigned in_flight;
>       int64_t bytes_in_flight;
>       QTAILQ_HEAD(, MirrorOp) ops_in_flight;
>       int ret;
> diff --git a/block/nbd.c b/block/nbd.c
> index 6085ab1d2c..512a53bf73 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -77,7 +77,7 @@ typedef struct BDRVNBDState {
>       QemuMutex requests_lock;
>       NBDClientState state;
>       CoQueue free_sema;
> -    int in_flight;
> +    unsigned in_flight;
>       NBDClientRequest requests[MAX_NBD_REQUESTS];
>       QEMUTimer *reconnect_delay_timer;
>   
ping v2

