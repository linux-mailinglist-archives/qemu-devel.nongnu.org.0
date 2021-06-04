Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A2439BAEF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 16:32:25 +0200 (CEST)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpAs3-0006bS-U3
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 10:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpAr9-0005ns-En; Fri, 04 Jun 2021 10:31:27 -0400
Received: from mail-db8eur05on2111.outbound.protection.outlook.com
 ([40.107.20.111]:64992 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpAr4-00024U-Js; Fri, 04 Jun 2021 10:31:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIxOiaj6BJDZBewtQvfyjA1Gr7lyobxUV1UcQcR/BFletin4a9qoQEf9k5pXJQRUM9fEcZ/r8gUNHUahVJdHNJgV0EZAeqxWq4otE92D5nlEc+3eCLDQ5UlcKU1cm5PWqVeKd6L8Z22VlE92tuDL+jOB/7M7I5vEnifGF9Xa0J+9ih7SnvQb3Lp+eavmeF2xpKxiIWE7B3BvWeWJv9F5z4XL0yU6wUQCGemM3SADWxK0j03ltKzCbfKJORd8hHxNccwIvueMal/OhJszHFr+oMBejRcjCFN9uIQqIjrj4ZwJvVF+YYaiL3t61CEekEXmOSawjWVJE6VI8nltg2fbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OjoXNc6R2UGUnNjWhURSZcREQWAp4jBPoh5/kt2fnk=;
 b=RMoa9T+Nq1kkfs4BjDsyB3LhjsiLX7jblZKeLbQDKtwngy1RtD9bkmdWQgWK44zeNDCZ826dklZvNm1IGEcEALp8UBACYQ+BBcSx8RPBW/+snPQAtUlMwlXPeSTIE+DDfN7X4flNGDYD7CYpf3GmC3VvFKXD3aNLHoUeDTDBl5porABLWLdFrsNhbHRVnH+woCeFTtgf7jfDFrsDqQ89V8XagRJORIgqwt4c+VFKcsf6p/fcvidwJC60aaeOzJOZoCLXYiLfnyU4LUX1XKPmVPe4UDC7mN3tDNn+ssEsTQxG9+x88lCZHtZHoIogYo/xAKV65NKqI6d++0gGwo2KzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OjoXNc6R2UGUnNjWhURSZcREQWAp4jBPoh5/kt2fnk=;
 b=YqufMDsVo0G8oy2XGpmSt7S99UY6E3OiVdP2CSdCDjCdv+jWTSvTErPXAylVWrts/eqlb0IOeGTEiPflGfGSKb0rvecRRXAq2sNwnr973O++cNx1dHfjst6I3JjbN9qK3StLE7B4OfB7hPS5iDNyYQ627NWNBdr8R6n8psEO/PM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6504.eurprd08.prod.outlook.com (2603:10a6:20b:336::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 14:31:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 14:31:17 +0000
Subject: Re: [PATCH v3 4/6] util: implement seqcache
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-5-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <06f98a95-4f42-16b2-ded2-0b5f7a3af73e@virtuozzo.com>
Date: Fri, 4 Jun 2021 17:31:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210305173507.393137-5-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: PR3P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 PR3P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 14:31:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 087b513c-7adf-4fd7-590b-08d927656975
X-MS-TrafficTypeDiagnostic: AS8PR08MB6504:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6504567292CCAF339EF113CAC13B9@AS8PR08MB6504.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12wQa+t/b9Cpv40trWbtLclk2KV7IYpMtLzvqEu8gZuoNSyt01pwLfyyae7DDtHSEVDemoiXmxDKbAr7m+KGtlLOSAQ/nQELSs9WFA8mINj9iHKG1P08HAC8sgZuG18MUnmJAq4ZzLTvYZL6AtkZYKSG9vSLYiLMsr2B0sjFKji1FI7Dp8LfnvjCBYvU+oMnsZ24zb+hBQFv2fdYCBXngSv9NATvBzuc3X/gsmyEaUj/nPP8KA/fDl49jD6ZnbNAWuHjZhEiYTZ4wDKx43ej/S10YSXiRvnPbnmOdAboy+v/AlBi30G6ysAXR2QCmkeQHDLoVGQ0EmzMPGv491a7wCyLMVVUswqx2TCyMf6dOqyE5XSiUX8a98RFsjdt4TfB2GS78oCcU9CXPpkIUVJqPl+U16FrJiG1gyTBzeVWmEoBqygwfoibaar+qsnS/gswQa6XVpEQJUDKTKXZrwMUJ7H9xCuCrFrJ6i6vItLJt5q6MU3FEfJcC/R9+rKlNt7UouwI7dF2s0D0cGV2rTmjEHrHCU9Xcva7onoAxBdSSuTKt61Ic3iPFyelsdb8deEh+CsHaUUuHVR13ZUDX9Im1JeC/eTFfIYK47mQcKP83sb3Nb1m3WzqcBXZEmSECWhKCeDAilINdloIwE1BcI1L5hM3wV0CXlLlT0iRTyqE8GTBr7LDV7ZthtMm0Yt6SvoTccsNteWc2/4GffIDTU0GmlBGRdZAgbXns6j4Q2zNlgE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39830400003)(478600001)(36756003)(30864003)(66556008)(66476007)(6916009)(38350700002)(38100700002)(66946007)(31686004)(6486002)(4326008)(2616005)(956004)(16526019)(316002)(16576012)(86362001)(31696002)(52116002)(83380400001)(186003)(26005)(2906002)(8936002)(5660300002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WkVEeWVpa3hwdTJ3M1pVYWF0dVpZdngrLzQzbjBFZGdIbi9lRDhDK0dvbzE5?=
 =?utf-8?B?eEhNRUs5RDh0cTUxUFhvenZiVnl5bXlacVR3UG5nd2UzUnJXbzdUajUzYTlp?=
 =?utf-8?B?NU43clByQXdnS0hOc1lYTGJlZlExM1BydkJTcE5YSXREbFZzdzloWjAyNzZj?=
 =?utf-8?B?enNZaGVPT1NaUFhiNm5XZjBBUkVkdDZmOEJtdENYNUczeHhlYlVrOEczTzNO?=
 =?utf-8?B?YXBpOGxzaTJGNWZBYms1UU5ERyt0ckNUcnU1STlLaTJoM2QwdDVWc0xzd2lX?=
 =?utf-8?B?TStldVlOV0V2bnJTdHZLRXp5TzhzZGc0YU1tMDNDVGZzV0RyV0lWUzJVcFJP?=
 =?utf-8?B?OW53OGN2VEhJMmVqWVFNbytRU3hjbnViSmF4dTNoT1Y0dnNGSi80dEoxWGlw?=
 =?utf-8?B?WEM0MkErcFljMkczbVBwQVMrdE15VlN1VjgvQUsxdFA0MnAvVW1QN1NsdEkv?=
 =?utf-8?B?THJyVVlVT1piTTd2UGJCNStmc0piaWF1Wnp3dEsraGw5aWtaWk9tUnFud1Fm?=
 =?utf-8?B?Q2crTWtiaXFaU1pudDZSZXR0Rld5ZnliOXdXU3Vhcjh5QnhRYktrd3ZLaTYy?=
 =?utf-8?B?ZzJ5OTZwVUo4RUlWYjUxb3NMNWlDZkdvUTE1ODkrQnpKMDJxZnZTNSszMElD?=
 =?utf-8?B?cmYxN3QrSEQyRVRCdUo5cFRqcHlXeFNRQkRpRVlKTEdxdDF1cDZBVG56bEdt?=
 =?utf-8?B?Y1pTaCsyRlZMVXdWc3lOdVhLUFkzaEJIRThhNWl4T0ZlbWt0bHdHMEFuTlVn?=
 =?utf-8?B?eHB2Nmljc2NYdlRiRlplMFhTWnVZMzVNK05qYm10ZUpPWkdEMGpKbjdXUE9w?=
 =?utf-8?B?V2hqblRNYXhDVDBoT2lKVXNYZzFjYUhMR2k4WHp3SSsrMjNyOXA3UE45eTAr?=
 =?utf-8?B?VTM3T2o4djJURDBYZFFHa0dUZTJNOHowRUxUb0g3Rm9GZi9sc252bW93Q0U3?=
 =?utf-8?B?QmswQTZid2FyUHd3RVQ4QlVRcE1GclpMZXkwYnl3OVg1Mm41dmtNYS9PZzZV?=
 =?utf-8?B?R1pvSDJ4TGlmcHNPN3drU0VVNlVPOWUwS3FvY1p0aU1EZzB6Unk2WDQ1YnFX?=
 =?utf-8?B?OHRObjI3WlZZOXlzbjVoOS9zemVPeGxKNzRTYXV4UDlBR2FSMExWbzV6c1BY?=
 =?utf-8?B?VURMT3dMRVlQUXppbXhYQkpFZU10TGVNa0pmVkhwL0c2OEJ6bVg2dWtVR0tu?=
 =?utf-8?B?NldlU2FLamtoWlJVeGZCZUFSR2t1ZGVpNFRqM3RFejZIT2F6RXVudUdqSGxp?=
 =?utf-8?B?L0dKN0pFdk4vVHpKRllqWWhBdlkvV3J5SGZFUHpaeUJPZnBqVEdMRHZSQkVX?=
 =?utf-8?B?bVlKdWxuSVFvV1VGVGt3V2RxZENNT2puUTRLczlOQzRZQ2dESDM4citrMVU3?=
 =?utf-8?B?WjJXdWUwbm9aWkl1WG9wTVlFem5YWVBNdGhTejJISlRRaXhSWE12bjNENlR6?=
 =?utf-8?B?T2lPOUZKRkh6MFhkWmJFRDFFbzlCZEMxUzNGcnB2S0RobUhqV0Vmbmx6dzFp?=
 =?utf-8?B?NjVLTTV5OFQ4SEZxRlFPRnNuRTBrcDlRQkRLajV3bWcrZ201b2pZS25QaWRG?=
 =?utf-8?B?S05tVEppT2dCYlF6K0UydXFtQnNxbEhaVkxTWHJKS2ZkZTh1TzJtVE5iaVcv?=
 =?utf-8?B?M3IrcE5Xd2NuYkRYLzJCejhNWmVXeVdZYkFhTHRXVnB2TUJUcGg1bStrT2pj?=
 =?utf-8?B?VnRyK1RPMzdzSjdidmdBcXRFRUVjYVQ5N09iSVNIVkNyT1c3T0xnOE52dDJm?=
 =?utf-8?Q?ywJUZn6scmrCB9Xfx7bXpq4OZsGrO5S5fgUxmZG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087b513c-7adf-4fd7-590b-08d927656975
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 14:31:17.1989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /D8CUva7qHAh4+ZY81VYfyzEpMZXfqHp5sEVPL3NbVn2kCVk8jEVUkZ5kH5t2N4T8c9MgGhC1DcKQjgZkNcQyhKzy/BHVl09PHehl2OQMXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6504
Received-SPF: pass client-ip=40.107.20.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7,
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

05.03.2021 20:35, Vladimir Sementsov-Ogievskiy wrote:
> Implement cache for small sequential unaligned writes, so that they may
> be cached until we get a complete cluster and then write it.
> 
> The cache is intended to be used for backup to qcow2 compressed target
> opened in O_DIRECT mode, but can be reused for any similar (even not
> block-layer related) task.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/qemu/seqcache.h |  42 +++++
>   util/seqcache.c         | 361 ++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS             |   6 +
>   util/meson.build        |   1 +
>   4 files changed, 410 insertions(+)
>   create mode 100644 include/qemu/seqcache.h
>   create mode 100644 util/seqcache.c
> 
> diff --git a/include/qemu/seqcache.h b/include/qemu/seqcache.h
> new file mode 100644
> index 0000000000..a308d54b01
> --- /dev/null
> +++ b/include/qemu/seqcache.h
> @@ -0,0 +1,42 @@
> +/*
> + * Cache for small sequential write requests.
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef QEMU_SEQCACHE_H
> +#define QEMU_SEQCACHE_H
> +
> +typedef struct SeqCache SeqCache;
> +
> +SeqCache *seqcache_new(int64_t cluster_size);
> +void seqcache_free(SeqCache *s);
> +
> +void seqcache_write(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf);
> +int64_t seqcache_read(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf);
> +
> +bool seqcache_get_next_flush(SeqCache *s, int64_t *offset, int64_t *bytes,
> +                             uint8_t **buf, bool *unfinished);
> +void seqcache_discard_cluster(SeqCache *s, int64_t offset);
> +
> +uint64_t seqcache_nb_clusters(SeqCache *s);
> +
> +#endif /* QEMU_SEQCACHE_H */
> diff --git a/util/seqcache.c b/util/seqcache.c
> new file mode 100644
> index 0000000000..d923560eab
> --- /dev/null
> +++ b/util/seqcache.c
> @@ -0,0 +1,361 @@
> +/*
> + * Cache for small sequential write requests.
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + *
> + *
> + * = Description =
> + *
> + * SeqCache is an abbreviation for Sequential Cache.
> + *
> + * The Cache is intended to improve performance of small unaligned sequential
> + * writes. Cache has a cluster_size parameter and the unit of caching is aligned
> + * cluster.  Cache has a list of cached clusters, several "finished" ones and at
> + * most one "unfinished". "unfinished" cluster is a cluster where last byte of
> + * last write operation is cached and there is a free place after that byte to
> + * the end of cluster. "finished" clusters are just stored in cache to be read
> + * or flushed and don't allow any writes to them.
> + *
> + * If write to the cache intersects cluster bounds, it's splat into several
> + * requests by cluster bounds. So, consider a write that doesn't intersect
> + * cluster bounds to describe the whole picture:
> + *
> + * There are two cases allowed:
> + *
> + * 1. Sequential write to "unfinished" cluster. Actually it's a write sequential
> + *    previous write. The data goes to "unfinished" cluster. If "unfinished" is
> + *    filled up to the cluster bound it becomes "finished".
> + *
> + * 2. Write to new cluster, not existing in the cache. It may be sequential to
> + *    previous write or not. Current "unfinshed" cluster (if exists) becomes
> + *    "finished" and new "unfinished" cluster is started. Note also that offset
> + *    of the write to new cluster is not required to be aligned.
> + *
> + *    Any other write operation (non-sequential write to "unfinished" cluster
> + *    or write to any of "finished" clusters) will crash.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qemu/queue.h"
> +#include "qemu/seqcache.h"
> +
> +/*
> + * Cluster
> + *
> + * Representation of one cached cluster, aligned to SeqCache::cluster_size.
> + * Caches only one subregion of the cluster, started at @offset (may be
> + * unaligned to cluster_size) and of @bytes length (may be unaligned as well).
> + * The whole subregion always lay in one aligned cluster:
> + *
> + *      QEMU_ALIGN_DOWN(offset, cluster_size) ==
> + *          QEMU_ALIGN_DOWN(offset + bytes - 1, cluster_size)
> + *
> + * @buf is allocated to be able to fill the cluster up to the cluster end, i.e.
> + * allocated @buf length is at least:
> + *
> + *      cluster_size - offset % cluster_size
> + */
> +typedef struct Cluster {
> +   int64_t offset;
> +   int64_t bytes;
> +   uint8_t *buf;
> +   QSIMPLEQ_ENTRY(Cluster) entry;
> +} Cluster;
> +
> +/*
> + * SeqCache caches small sequential writes into "unfinished" @cur_write cluster,
> + * until entire cluster (of @cluster_size bytes) is filled by seqcache_write()
> + * calls.
> + *
> + * @cur_write->offset may be unaligned to @cluster_size if first write offset is
> + * not aligned (for example, if there was a flush request and cache was flushed,
> + * then we continue from the middle of the cluster with an empty cache).
> + *
> + * @cur_write may be NULL, which means we don't have current cluster and next
> + * seqcache_write() will start a new one.
> + *
> + * @all is a list of all clusters cached in the cache, some "finished" and one
> + * "unfinished" @cur_write (if exists). If @cur_write is not NULL it is a last
> + * one in the list.
> + *
> + * @nb_clusters is number of elements in @all list.
> + *
> + * @next_flush is an iterator for flushing. SeqCache knows nothing about how
> + * data should be flushing, so for flush user calls seqcache_get_next_flush()
> + * (which moves @next_flush iterator) and when data is flushed somehow and cache
> + * is not needed anymore, user can call seqcache_discard_cluster().
> + */
> +typedef struct SeqCache {
> +    int64_t cluster_size;
> +    int64_t nb_clusters;
> +    Cluster *cur_write;
> +    Cluster *next_flush;
> +    QSIMPLEQ_HEAD(, Cluster) all;
> +} SeqCache;
> +
> +static void cluster_free(Cluster *req)
> +{
> +    if (req) {
> +        g_free(req->buf);
> +        g_free(req);
> +    }
> +}
> +
> +SeqCache *seqcache_new(int64_t cluster_size)
> +{
> +    SeqCache *s = g_new(SeqCache, 1);
> +
> +    *s = (SeqCache) {
> +        .cluster_size = cluster_size,
> +    };
> +
> +    QSIMPLEQ_INIT(&s->all);
> +
> +    return s;
> +}
> +
> +/*
> + * User should clean the cache calling seqcache_get_next_flush() and
> + * seqcache_discard_cluster() sequentially before freeing it.
> + */
> +void seqcache_free(SeqCache *s)
> +{
> +    if (s) {
> +        assert(QSIMPLEQ_EMPTY(&s->all));
> +        g_free(s);
> +    }
> +}
> +
> +/* End of cached region inside one cluster */
> +static int64_t cached_end(Cluster *cl)
> +{
> +    return cl->offset + cl->bytes;
> +}
> +
> +/* Start of aligned cluster containing the @offset */
> +static int64_t cluster_start(SeqCache *s, int64_t offset)
> +{
> +    return QEMU_ALIGN_DOWN(offset, s->cluster_size);
> +}
> +
> +/* End of aligned cluster containing the @offset */
> +static int64_t cluster_end(SeqCache *s, int64_t offset)
> +{
> +    return cluster_start(s, offset) + s->cluster_size;
> +}
> +
> +/* Align down @offset to s->cluster_size and search for corresponding cluster */
> +static Cluster *seqcache_find_cluster(SeqCache *s, int64_t offset)
> +{
> +    Cluster *cl;
> +    int64_t cl_start = cluster_start(s, offset);
> +
> +    QSIMPLEQ_FOREACH(cl, &s->all, entry) {
> +        if (cluster_start(s, cl->offset) == cl_start) {
> +            return cl;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +/* Makes current "unfinished" cluster the "finished" one. */
> +static void seqcache_finalize_current_cluster(SeqCache *s)
> +{
> +    if (s->cur_write && !s->next_flush) {
> +        s->next_flush = s->cur_write;
> +    }
> +    s->cur_write = NULL;
> +}
> +
> +/*
> + * Write an @offset, @bytes, @buf request into the cache. The requests MUST not
> + * intersect cluster bounds.
> + */
> +static void seqcache_write_one(SeqCache *s, int64_t offset, int64_t bytes,
> +                               uint8_t *buf)
> +{
> +    assert(bytes > 0);
> +    assert(cluster_start(s, offset) == cluster_start(s, offset + bytes - 1));
> +
> +    if (s->cur_write && offset == cached_end(s->cur_write)) {
> +        /* Continue sequential process */
> +        memcpy(s->cur_write->buf + s->cur_write->bytes, buf, bytes);
> +        s->cur_write->bytes += bytes;
> +
> +        if (cached_end(s->cur_write) == cluster_end(s, s->cur_write->offset)) {
> +            seqcache_finalize_current_cluster(s);
> +        }
> +
> +        return;
> +    }
> +
> +    /* We are starting a new cluster. Check that it's really new */
> +    assert(!seqcache_find_cluster(s, offset));
> +
> +    seqcache_finalize_current_cluster(s);
> +
> +    s->cur_write = g_new(Cluster, 1);
> +    *s->cur_write = (Cluster) {
> +        .offset = offset,
> +        .bytes = bytes,
> +        .buf = g_malloc(s->cluster_size),
> +    };
> +
> +    memcpy(s->cur_write->buf, buf, bytes);
> +    QSIMPLEQ_INSERT_TAIL(&s->all, s->cur_write, entry);
> +    s->nb_clusters++;

Here, must also do

> +        if (cached_end(s->cur_write) == cluster_end(s, s->cur_write->offset)) {
> +            seqcache_finalize_current_cluster(s);
> +        }


otherwise we'll try to continue that new filled buffer by next cluster on next seqcache_write_one(), and buffer is overflowed [faced this bug in our downstream release].


> +}
> +
> +/* Write an @offset, @bytes, @buf request into the cache. */
> +void seqcache_write(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf)
> +{
> +    while (bytes) {
> +        int64_t cl_end = cluster_end(s, offset);
> +        int64_t chunk = MIN(bytes, cl_end - offset);
> +
> +        seqcache_write_one(s, offset, chunk, buf);
> +        offset += chunk;
> +        bytes -= chunk;
> +        buf += chunk;
> +    }
> +}
> +
> +/*
> + * Read from the cache.
> + *
> + * If @offset misses the cache, return 0.
> + *
> + * If @offset is inside the cache, copy corresponding available data to @buf
> + * (may be less than required @bytes if hole reached earlier) and return number
> + * of bytes copied.
> + */
> +int64_t seqcache_read(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf)
> +{
> +    uint8_t *pos = buf;
> +
> +    while (bytes) {
> +        Cluster *cl = seqcache_find_cluster(s, offset);
> +        int64_t chunk;
> +
> +        if (!cl || offset < cl->offset || offset >= cached_end(cl)) {
> +            break;
> +        }
> +
> +        chunk = MIN(bytes, cached_end(cl) - offset);
> +        memcpy(pos, cl->buf + offset - cl->offset, chunk);
> +        offset += chunk;
> +        bytes -= chunk;
> +        pos += chunk;
> +
> +        if (!QEMU_IS_ALIGNED(offset, s->cluster_size)) {
> +            break;
> +        }
> +    }
> +
> +    return pos - buf;
> +}
> +
> +/*
> + * Get next region for flushing. @offset, @bytes and @buf are out-parameters
> + * to return the region.
> + *
> + * @unfinished is in-out argument which means that user is interested in
> + * flushing unfinished cluster too:
> + *
> + * If there are "finished" clusters, "finished" cluster is returned and
> + * *@unfinished is set to false, independently of its original value.
> + *
> + * If there are no "finished" clusters but "unfinished" exists (i.e.
> + * s->cur_write != NULL and it is the only element of s->all), then *@unfinished
> + * value remains the same and the following logic works:
> + *
> + *    If *@unfinished:
> + *       return s->cur_write unfinished cluster for flushing
> + *    Else
> + *       return nothing
> + *
> + *
> + * Returns true and set @offset, @bytes, @buf and @unfinished if there is
> + * something to flush (accordingly to @unfinished value), returns false
> + * otherwise.
> + *
> + * Nothing is removed from the cache.
> + */
> +bool seqcache_get_next_flush(SeqCache *s, int64_t *offset, int64_t *bytes,
> +                             uint8_t **buf, bool *unfinished)
> +{
> +    Cluster *req = s->next_flush;
> +
> +    if (s->next_flush) {
> +        *unfinished = false;
> +        req = s->next_flush;
> +        s->next_flush = QSIMPLEQ_NEXT(req, entry);
> +        if (s->next_flush == s->cur_write) {
> +            s->next_flush = NULL;
> +        }
> +    } else if (s->cur_write && *unfinished) {
> +        req = s->cur_write;
> +    } else {
> +        return false;
> +    }
> +
> +    *offset = req->offset;
> +    *bytes = req->bytes;
> +    *buf = req->buf;
> +
> +    return true;
> +}
> +
> +/*
> + * Find corresponding cluster and drop it. No matter does requested @offset is
> + * cached itself or not.
> + */
> +void seqcache_discard_cluster(SeqCache *s, int64_t offset)
> +{
> +    Cluster *cl = seqcache_find_cluster(s, offset);
> +
> +    if (!cl) {
> +        return;
> +    }
> +
> +    if (cl == s->cur_write) {
> +        assert(cl != s->next_flush);
> +        s->cur_write = NULL;
> +    } else if (cl == s->next_flush) {
> +        assert(cl != s->cur_write);
> +        s->next_flush = QSIMPLEQ_NEXT(s->next_flush, entry);
> +        if (s->next_flush == s->cur_write) {
> +            s->next_flush = NULL;
> +        }
> +    }
> +
> +    QSIMPLEQ_REMOVE(&s->all, cl, Cluster, entry);
> +    cluster_free(cl);
> +    s->nb_clusters--;
> +}
> +
> +/* Returns number of cached clusters including unfinished */
> +uint64_t seqcache_nb_clusters(SeqCache *s)
> +{
> +    return s->nb_clusters;
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b2aa18e1f..5e263c3343 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3347,3 +3347,9 @@ Performance Tools and Tests
>   M: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
>   S: Maintained
>   F: scripts/performance/
> +
> +Sequential Cache
> +M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> +S: Supported
> +F: util/seqcache.c
> +F: include/qemu/seqcache.h
> diff --git a/util/meson.build b/util/meson.build
> index 984fba965f..6682e463ac 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -75,6 +75,7 @@ if have_block
>     util_ss.add(files('block-helpers.c'))
>     util_ss.add(files('qemu-coroutine-sleep.c'))
>     util_ss.add(files('qemu-co-shared-resource.c'))
> +  util_ss.add(files('seqcache.c'))
>     util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
>     util_ss.add(files('readline.c'))
>     util_ss.add(files('throttle.c'))
> 


-- 
Best regards,
Vladimir

