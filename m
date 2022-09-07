Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DDC5B08C5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:41:43 +0200 (CEST)
Received: from localhost ([::1]:60138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVxBO-000118-TD
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVx91-0006OH-7B; Wed, 07 Sep 2022 11:39:15 -0400
Received: from mail-am6eur05on2099.outbound.protection.outlook.com
 ([40.107.22.99]:49057 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVx8x-00020A-Cv; Wed, 07 Sep 2022 11:39:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHrjP4pPpKT+CWCeauSAp+GjnmOjcKMA4cgvQUpXxiEQKia+Bsi8tnkumcgU2X73vXxCeGN+Nq9eCGJ06x3c1E1ENJxxa6ArBnfXSzsg3+NveMo5cpTcv0GGY24byz7TgJ1OamPGJuKn0+5NFhpXqyhUzF37ydP1rMNGShJyEl1TS/69zMy7Ho9tjdWSvx6y7gpGJ8CahyDcCaFaXvzS/UlhalJg5YWXgI8nls04Iqnfd4jcb7bb0sLqF46C5rwVWBsNAEB+9Lsz4U6w3eiRX0hyiQ43q2hJJ6r3oFVknOPxLwizF5RI5niHtTWReUSxOd1PKlA34StWleosIUAMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqUjcCwLGZM+LDYvDv6nuGa0hMbZBvXkOxnCra6K1zE=;
 b=E/r96FfrT4DPuzQcdE/3VgLNSoIgRJA1mvH8s/LDu9XCf1fmwCTKZ5G2qbV76KtHAFCHLqG1Bjkm0xML03j35iHkUntDHY2qY9tml3SI0FCZV3C1ztyXL35wkxP0Gn1mzV6TVyktXOPvy6FlI2W2UTKWFB/rcyv7UtFOp6CTqAsVLothRIhNK3ekbrpbsBe7j69wRQqcjO5ZMJ5Vx5xcTwVkJQxb4oipq9ru8KJBTj18djTuSSxpafCxxT25gL/1qHmrRrrGYr4kwPvAHNVzgz/JIUtBDGyNVH5Mmsw5RO6Up2nuWQL6XSeEZP9xaaOkvZ4jzfr2lRKh4FJjn1yLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqUjcCwLGZM+LDYvDv6nuGa0hMbZBvXkOxnCra6K1zE=;
 b=qNKTRrtMx3NC6o7jZXK/D8+RXNCcZesTgyng6vVKYjdVd2ji36fWP6QJFk9ZFe/Sv1edumLoWaJ/sZhnTxLRDdtFVegWQcsxFrR3mA8inCr0DZltFRO6JSA3+Nin/9V97FuahmnKw9NENWVSDMlBcwbqt0Ehc+qjua7OwkVwnbIFPi0hMq4jImBvydDhqsnQ+JZ+LxSdp5A40eQwK/VQWiVshBm/HjNwgA8fkIFq6pTUxV5C6GEMiaOmjS8plZNFLycolUmtDW17pacVJqxvFa+GQi/CtrLSmftqJXhDfs3wxo4XcodQbiWhRY99Hwfrk4t6GwjZm51ZJx+rAoJp/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DU0PR08MB9511.eurprd08.prod.outlook.com (2603:10a6:10:44d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 15:39:05 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 15:39:05 +0000
Message-ID: <6f382196-ad37-4d3f-7096-4ae51858c5ac@virtuozzo.com>
Date: Wed, 7 Sep 2022 17:39:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] parallels: Use highest_offset() helper in leak check
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
 <20220902085300.508078-5-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220902085300.508078-5-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0114.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::16) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fed9a2c-7fa1-428a-b106-08da90e718cb
X-MS-TrafficTypeDiagnostic: DU0PR08MB9511:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3mzM2QkbDkdetDa0HoC66ujrsHEF6T3IrPUSiCaQiNYt093JlxrVOkUH9Lz8ThbQ2Ro/B2zRAJYystMExfMcT/MebPruZyrxvbYyRf9lSlooPg69tK12lXLXGO4PdoYP3wAW9A59FOZS4aDTGB7zWJg2q7AbZD7dysU5ArQZGiE6xtPGwxYQNJ0E4Z29+q9wk/4glG21gBJHHg5dAMJmyNV1x8PWyHV4sAeJjHXhzWpU0jRadUVj+NNU4NoQ7O8l9O28evruBXVwxTPOAjOKsSiLAMBbvHOQcQVIdftBZt2jDjjG7hVoMHhZq/vFJ6uAUoA0X0q8bJS7SOBw3QR7HauRRtWbk/6ZF3Gf3/HwzG4vFQ+qShfwXu+Urv3DvPexLeZwOqV5R9e+epMZz/OOgJqOqW+28cYF2NG281Rk4Dz1dKB04Kl8hSCON6PUgtkg+N3SqDhYkxIJi60udW4DaM2El2D1+s1+i1ZEAH69Jr+UTSeTuVbNL2xD19LAF5vqKSxIuu36beTc6RIM4t1eGmjdPw46XEzLlYTUtT+bgx3cW/LsCT66E9JRpHim/P1ingIVMwVP9pvnlc53Cayf0uRVHJUavkMRpQQWW7nfjAhMwfYTcUfhlrCBjc1x7nzuwb2IfVzO7NM4IRuZ+o+BgOjEbT/LGp6mOkGFAyoSb6/jBN2hZgx2hba9E4YCHtXSfhPKlSGU9nBh68c0F/ckL1F6WXb29Fon4v2S3xbhL4da5HEv+3h80d7Fu8illrcltXndjJTOksVUFnDBMhL2vyLWflvwIECm3S/UhHxGplix+eciUKy2y0Ey3sq+/dXcRrF85PpRMHFlyIyqrd4plQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(376002)(136003)(39850400004)(346002)(38350700002)(31686004)(26005)(38100700002)(6512007)(36756003)(2906002)(316002)(83380400001)(478600001)(8936002)(66946007)(4326008)(41300700001)(53546011)(8676002)(86362001)(52116002)(66476007)(31696002)(6486002)(6506007)(186003)(5660300002)(66556008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVhRUVBydWh2NXNYUVVzVitxZDV5aG9qbnNsbEFKUVIzakFXNGFRN1duNG1W?=
 =?utf-8?B?cFpFcGdMVW5QeWRXVFlpU0dERkVXK1ZZY2JiQzhJT3lKY0w2UlYvN0FoakJU?=
 =?utf-8?B?RHlFRzJ0dXk3cUtrNUtoT1hRU3NRbi9GNUZPOHlGcVZFVnFZbzZwTk1pNkZI?=
 =?utf-8?B?R0hNQzB0Q0xqNVJ3SEpuc0xZY0lWRGNyUElwMnE1UlA0Ly9zZ3B0YUhIQ25u?=
 =?utf-8?B?R2F4NEJHOXYrZGxCTDRWY1J0bWxhbWR5cjlDeEtYMUU0aFBCdTJOM01NV1NH?=
 =?utf-8?B?cGZ3bXFSVGFscUI3VkVYdzdDekVwSXY4UHNBODV1YStlUWhJbW85a2h1YWZQ?=
 =?utf-8?B?eENBMXJpMkNKQVhJK093NEVBdFZoRUhhOHViSjVyTWwvMS83empjNGpNUDJT?=
 =?utf-8?B?STN0MlVuNW0vMlQ4VzZFSEsyVlRiV05qTFhRU2RkSHVybHBnNGRST3F6Tm1W?=
 =?utf-8?B?bHJFRm5DcTBrK0RJRnMvd3hIYWVyR1Z0SzNGN2tvUjJrMG4xdGcyQ2NKamRs?=
 =?utf-8?B?eldSekFEZHl4Z2tlMlRuZk9kK1N0eW0rSHYwd1c4TC9SdzVXVEJibTd2OWww?=
 =?utf-8?B?b2w4UVBYQmlLL1YrR2JpdDRhVFlUR3h6NTNXMzFHRkZGZFU1eDBCakp3VndD?=
 =?utf-8?B?c3pla0xNYStMN0JDNTlMcnRqSTloWDI5aFRWdU8rcFRzdUFQVnlPWXBmMVhx?=
 =?utf-8?B?UlI0RXJJbVMwVEc2SlB2SFN5dG1nWCtkOXNURC93dVE2Q0UvSE9abVMycUtT?=
 =?utf-8?B?YVN4RGJ2OWh6VHRxTTYwRlNTUStzMTRrNjNjWkVPenZBRnd5MnQreC9SNmpH?=
 =?utf-8?B?YnpHbnlsV3NxdmMxczJlUzNUTnhrL3FzYzJOR3VPLzBjUzQ2NDg2c1lZcktZ?=
 =?utf-8?B?SHRmV1h0b252djVjYzk0VnFPSk03WWs4RVZtR0hOYmdMV0tHN1lrKzQ1VW0v?=
 =?utf-8?B?R20wSXlHQjJHN1FpZHVSWmlHQWxMTmxVT3lVUHNlQWJUb3NCN0dXUS9vREUv?=
 =?utf-8?B?UjdNUmc4YVFEZ3JNcGFUMisyNzBXT1BhSUZzM0lDZUxWbzVhZDF1ZE1YQ3JE?=
 =?utf-8?B?Z3hDWElFYkZvU3JtZmlzMlhYNFZFeDlOUXh4UnlKN2FOUzdSazRaZ2ZJNTFz?=
 =?utf-8?B?MEk4OWVNZFBOZ0NHbHVXSHdVNCs1NWZRblJZSlBYSlcrcC8wUWtjbjk1c21q?=
 =?utf-8?B?QkRVRTY1UG5MYit5V2s1ZkNzWkJXZDloYUlpL0RqekZ1UWlDaWRreEdUdk56?=
 =?utf-8?B?YnBoQmRyV1N2OVdJMG1DVGw0SU5iakRmU3NRcjgzK0Rncy9HZ202ZlFwS2xa?=
 =?utf-8?B?YVJjbENCZEdoQlIvUWE4aVpKclRjVnQyaEdjUVZjMkJFUGNyV3FDdENFdTFz?=
 =?utf-8?B?djBwNHlUSzFzTEt3WFdDQjJxOXdSZGp0enhpeVlGdS8yNVBsd05yMFJYTkZr?=
 =?utf-8?B?VlNHbGtQVU05cnY3UUlpcEUxN1R4ajBaTlJWS0FsbEpQVmI4bUJ0N2YreU9C?=
 =?utf-8?B?Z3lmTExVc3FySThQZ1JNRXE3Z1V2WE5kSWU1YTFCcmtZN2haYWZmeGhObmk3?=
 =?utf-8?B?Vjh3RXUxYlEwb3VsaFFOMmYxbzN3NVpKeUwvZUo3b25Od0trTE5ZRkVaa1k0?=
 =?utf-8?B?VHM4cS9vQW5oYVRIUHFQcVhoNGpQeGc5WEJNUm1PWHN3TG1xaGhKbFlCNGhU?=
 =?utf-8?B?bk9lL0V6WG0zdUlyY3JnUkxxQzV1UGV6MW9nekVLdjViR2J4NG4reXVlSmY4?=
 =?utf-8?B?YnVjV3RhVlVCWDQ5VmtFQlFBUVIrWWthRWRRU21qanMxNDBVVU1LbWFPM2c4?=
 =?utf-8?B?UExIN0Flc0NtaEVGZG8wald2T3hQdkppcE1jYWsvS3V5dXVZc2xpWEpwU1N3?=
 =?utf-8?B?MlRtcy9rK1lWeEsveEdydy9lRkhpSnNuQWY5SExiWVgyVzNjYlNaRWhFYlhv?=
 =?utf-8?B?N0N3YUFneG9rTzZucUJoellaanRBZzFlVm9zVlFrL0VLU2tXZ3lCNXFPNk9U?=
 =?utf-8?B?bG8zbFJsOVdERFlOcVI5bVVPeUdzd1ZiZ25lT3ZISGRBeEJjS0s1aEorclJm?=
 =?utf-8?B?dkhVNTYrYnRvL3dMNTMzWUdDMGFPaXFBWitoQ1Ryd1lDWml5RzlwdVJJQjV6?=
 =?utf-8?Q?0o40xe7m35Q2UYg9jiNiZuO7f?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fed9a2c-7fa1-428a-b106-08da90e718cb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 15:39:05.6068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baXn0VuWVirMPVg/aOjNH586HvBYlaPkqiITNjh6YW8fhEIJ5w0gUu/4coEv5Jhn6MW/yjwVK7dFEcHGvECPcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9511
Received-SPF: pass client-ip=40.107.22.99; envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/2/22 10:52, Alexander Ivanov wrote:
> Deduplicate code by using highest_offset() helper.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 339ce45634..688aa081e2 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -535,16 +535,9 @@ static int parallels_check_leak(BlockDriverState *bs,
>                                   BdrvCheckMode fix)
>   {
>       BDRVParallelsState *s = bs->opaque;
> -    int64_t off, high_off, count, cut_out;
> -    uint32_t i;
> +    int64_t high_off, count, cut_out;
>   
> -    high_off = 0;
> -    for (i = 0; i < s->bat_size; i++) {
> -        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off > high_off) {
> -            high_off = off;
> -        }
> -    }
> +    high_off = highest_offset(s);
>   
>       cut_out = parallels_handle_leak(bs, res, high_off, fix & BDRV_FIX_LEAKS);
>       if (cut_out < 0) {
Here I kinda disagree. This change and the introduction of the
helper should be done exactly in the same patch as in the other
case it is not possible to say whether this replacement is
correct or not.

Den

