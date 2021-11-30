Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B985463558
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 14:23:54 +0100 (CET)
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms36u-0007Qo-Jz
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 08:23:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ms32p-0005o4-IK; Tue, 30 Nov 2021 08:19:39 -0500
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:59744 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ms32l-00072t-1J; Tue, 30 Nov 2021 08:19:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCBqzyn3nDr1t0BNSEAzM/SS5CkdRB9yTtNLdmqF+r+Ncgw0iCv9d5crT3RJklVu/bEfEMgpGr1UNmT28ppBMbc8zHehZT7wgHV8EHGgONQSHAPecVRjHfDSqsAi7e6JEoQ//xygJ4KkeCtzR58enQQen+dHzfl42AZ8CF/fVRjLS8SWBucNQOuo/pQO8iy91TJjEGKdL7IhA/ye4ER6fmAVymc1SlQatUU0aG7geB7jg11U1eRVdFeKiTuLyCftMKnjNeqQy1eZfP4xaj+/ziU2iT7jyuOJgvNJhzEkTJV7g+lwtvGiFzzNYR3thGzCX481uTUAT854852PCMg2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXTs/0L0EC9Xeoz0EkQ1RA7T85SO0k612MI0vZvD5Jk=;
 b=gyQ7b9wQlrTjLxnpM3sRIXejqyCBW1WtuGmR+c/5Fw5rN2S72WU70Po9Khj8aw/RgeUBHMxnulXBNiUWURZ6SO49EpsiGmubxPb0GqP0rg+bnD0QUl+SVsiQ4Wfqb9dJ2aF5pMlRcrPs5GOorBHsBo/fUPgUpTSJhsIErc2F+hy6B8uDLVUPc8O8Ie5yz7VDvX2iX+kkRzEOlR5EgE75tqON+YDdXUKa3U1eyH4LcweirFHXoVTE8u18uK37BhFPR0L6+td0V2urpfdPG/U838v9NkD5byPnvUzIQHLICeet/FUGQH1eqgQgfbe6j8uDDZqUHUjZyakfqcPsoHBC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXTs/0L0EC9Xeoz0EkQ1RA7T85SO0k612MI0vZvD5Jk=;
 b=t4neBmg7XIiaAoFxDds23Y7c+SuampVMVLkKx41Zi9AyCvOg6MpP7EsFhKKxNPGNJ/hCmjlp/XNfCIWodvTK1dP2DdHrsgfreufhKBWJ9opHcP3dzKV3rg11Si8/8ZvizxV1KSup2DzW1AQIYSR/4GyIO3Cc77ClUBst1oKxwuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4514.eurprd08.prod.outlook.com (2603:10a6:208:13a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 13:19:31 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Tue, 30 Nov 2021
 13:19:31 +0000
Message-ID: <3d382d7e-696a-82f3-75ec-62d257fdc869@virtuozzo.com>
Date: Tue, 30 Nov 2021 16:19:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH for-6.2 v2] block/nbd: forbid incompatible change of
 server options on reconnect
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com
References: <20211129215300.1468291-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211129215300.1468291-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0021.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::34) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.234) by
 AM6PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:20b:6e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 13:19:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99733925-2cd9-4299-034b-08d9b4040b38
X-MS-TrafficTypeDiagnostic: AM0PR08MB4514:
X-Microsoft-Antispam-PRVS: <AM0PR08MB451495D0FAD2B4AC14DA2C10C1679@AM0PR08MB4514.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EE3+vPjsUCtaoQWpAaTGn8t0ACIMhtHcE2HvFY3L02wMFAnidATXlVBjYCy9XcfCM5W7uVheAm4mG2wg5ybuHOO5IPnuEmPD8xgG++KcWVapEjvZSiVYlK2mP07I2aYwjaEagr8C+NxTXVlpYiPPcFZbsvCSCYJIFEjFYhLEOWWr+jI0cw1555VvEQ70cemSqzrhfjBux59QTgAN1aEFhZ9PV/2MIjB2zS18eNmEhb4uH1pOUtJR0b6dDtBTjo8pAa9pWEJrk8tXIJEucPHD/ZDNFTcLa+0eECTBHGLB5g+U12vigVKngHxGqJc+S7DHwA9cIdkKhbxUuk8w/iNuAdUqcgpqH32AqSkhfJ5K6GlW7lvJ/zOFO8mUHGKX16gk/LvSat0Ri37hOgTz1/U/9G6EFcsvUE5/mMii9b67tSEn/it/y0M0dHiPZxprC+urada4ZwCSu+cKqNw0FnllJvN91wMULRmErulepsb3jK3KYUWxoXx8lajH5EUqHDZNivgZ9UOcBsHty0NXmFlCzllDoN6NSdGgQWKcnoJLYCgDPs4V/hdgMPsvsFU+CdXMTMbQlboKAPj6sGFuXYWpdFCz7G3OSfaXhuHmRpk/pUHm+ocIBYvtofU//VPthr4NVwkxk7GmzDvyCuO7f3qhWmZfAn/rghdTBBVtDvTUPl7VuAVJBYOgPRcaQzkIvodVln0h75qS4Y9FQAs0OpANo6dI0AmG0cqM/KY//bbpzj5NIpR4aFObvCoTXsZoIdHtqrjUaLjuYf2cx09d0AlMPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(31686004)(956004)(2616005)(8676002)(86362001)(66556008)(66476007)(38350700002)(38100700002)(6916009)(31696002)(66946007)(2906002)(52116002)(36756003)(4326008)(5660300002)(186003)(6486002)(8936002)(508600001)(26005)(16576012)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzRucU0rc3V4UkhCQzNrR2ZBQW9UZ3VLN2Nxb1NxN01vblRHSi9EZUdnZUs2?=
 =?utf-8?B?OThiMlZlVkdYdXd6SHk5bkVtMjQzODdXaEhQVTQyMFV6aGhZblZ1MzU1M3U1?=
 =?utf-8?B?Sm5vc001R0MyMDFxNmQ1N1VWaDNiZzBWS0F1MzVpK3VCWllNTEVOWXFMMVhH?=
 =?utf-8?B?RDV6dzUrZ2Zha1l4b1VTaEtac2lZVXhKNUNZdmVFWmt3dXhaVTR3ZnRDU2Fk?=
 =?utf-8?B?eVpTZmZzOFNhV1NoMGhqeEF0dm9mMVBuYkxFL2ZQa3I3VTlEMUlQaTdkK012?=
 =?utf-8?B?VC9vSVdWd2QweEVZZ1FEaDVka202MmpRdnFWb2o1SExyZDdBQmZxSkJGTVZ0?=
 =?utf-8?B?Rjk3ZGM3QVZMR1pRY0tmb1JTZFAxRkRZUkora21QTlpFZE9Rbm5IeXo3S3lq?=
 =?utf-8?B?U3ZOdTBTK0JiTUkwL04zbTNmT0tzOUZLdXNyM0FnbVl5L2p1QmluVEFyaWh5?=
 =?utf-8?B?RFVKOHZCS0ljelJwMVM2WHBSWlplVFNManlCNzMrVXZWNlYxT0lFTlU4RDdl?=
 =?utf-8?B?dG1POXNyZHJ0U2p2QWFwZ1dBOWxERUhHM042VXk2ZS9hVUxrVDE4SXZWM0pN?=
 =?utf-8?B?aWkyV1drNlV1QkYyTGtZeDNyNklDNUxpZm5tS3R4c1ZBRjkrRVIrd3k2ZXNj?=
 =?utf-8?B?SU1Xa1VKL1NHNFlVYnlJa0gwSzMzZWZSNjRtb1pYY0QzOU4xMzRjOHgwbktV?=
 =?utf-8?B?THlFZWY2WmExVG4rU1lyVmF2eVJENGpzaENmQ05CNjEwa01ZbWFPV2E5V21I?=
 =?utf-8?B?OWoxMlQzOEJ2ZmtMLzE3UUl5OFFIOG5IMld2UkNtd1gwSjNMZERybkhsSGVZ?=
 =?utf-8?B?YUlwSkRwLzlyWUdGZ3ZSeXpCTVoyK21UY1NNUEpXeDFzSGlLQmJnU25CaHo4?=
 =?utf-8?B?Sy9NczhwelRIV2FYWmdEdytmTjhlaWd3TEVrMkNrQXplRzVjakV5UytkdUhy?=
 =?utf-8?B?aXl4bFEyczhjcmZ6bkt5Mm00cHJSRXlVWVdrRDhGOEIyeVhUUnBqcEJxL1Iy?=
 =?utf-8?B?ckpWOWcvbDNVblhzVDIyTllXMW9yWVZIREsrcFdRQmsrWmw5TUJ5c2hLRGhH?=
 =?utf-8?B?LzQyZmtGc1BWd0ViZzd6YjdSVEE4MjgzQTZJb3JBdGhnNGJveFpxeFNVRjdm?=
 =?utf-8?B?V05senhIMllVcEk5RlplZzNrc3lHem5KRXJjQWRPSUJudk5ORGgxS0Zsbng2?=
 =?utf-8?B?cXE2SVMwMTRuYVJOOWEzY3Q5UWFNRnVmTVBLYUJRdHB3dmdJQWk5M21rWm8x?=
 =?utf-8?B?UGVCa0FiZDQ3MXZ4aDhMaXhESFJCUjdMTGZhVzZrcU9UbWNGUjRYeGJUZ3Rp?=
 =?utf-8?B?SnJrT2IvV0VYbmpPMTVpaHlYcjByMENGMWN6bTl0QkpuVlVPdHRvRnZ5Mm54?=
 =?utf-8?B?NldGZUx3bGZQNXNpdUdwVUUzZzNxT0o0TnFUbDdJRmRIdXpaemhDbEdFL3N5?=
 =?utf-8?B?emhBZGlVRzJxaDRZSUVVL05XaUtDaUE3QnBwMUdidndkbG9hK0JreXh1WDMv?=
 =?utf-8?B?V2EzRXdVc092Y2NlN1hHbjRmWFJrZVlEbXY3cURKYjY5c3dZVzZTNEFWM2RN?=
 =?utf-8?B?OHg4eVl5SVFFMWczc01ieEdRNnR3ME45VUZkSnFBcFgxQTl0NVJ0ZGJsazlK?=
 =?utf-8?B?V0ZvUEVMMGJGYlZlT3ltUWRQcGxjRk10YjFWOGtrOVRVVEFFbXJqL2Y1SCtn?=
 =?utf-8?B?VzM1ZVVNNmI1eFBtUlRoZlZQbm1QS3k1UGhuekNvK1BTbUt5TVB2TlRsMWxl?=
 =?utf-8?B?cTcyVERHTHpLMWRVdUY1cmdFUTJqVmYrRHMvejJEbStDM0E5bW1Ed0pMS3RS?=
 =?utf-8?B?Z0NjZXQ5U0FPRDRMZEZGVW94TTRzZEpLMGlZK0VabXI4MUtjbjh1VEFVbUQx?=
 =?utf-8?B?TTBXU2liT0JjRHA3STFoRCtKRHVIemdlYWo0cmtyc0Fqa2daK0pJbVZFTjN6?=
 =?utf-8?B?azV6Z0MzalZwTHN5OEoxZmxJU2V5SUhnSHFtc1I4SG92M1l6ZDAwNWg4MEpT?=
 =?utf-8?B?QTFWcUFVT2xkeml5UEJtMVlzaEhlb1k3UUh1V3BLK1FlU3NtcFZlMVFXUmtF?=
 =?utf-8?B?MDlFNHhobXNndERCMk0walBuY3NyZ2NUMC9EYnpkNlk0Z1Jkc2s3aFlBTFc4?=
 =?utf-8?B?SlBZQkp4UVVJMkZEendTQk01UXIwSWNDTFR2T1dncTBXakN5Y0JYNlNTbi94?=
 =?utf-8?B?U3Y5ZzVYOUEvaEliS0t4Y2djRTMwalpzaG9ZaU55WjJPdGw5YjE2aWJsV2c2?=
 =?utf-8?Q?3AILtiQtqCQfrV8iacUqR026pJAO2kM/vzoz8qzWNk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99733925-2cd9-4299-034b-08d9b4040b38
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 13:19:31.2029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPC2GAvOPHg4vML6enzrDMA396gnVdEZBbAbkSX57xudHb+H8MpFcx+kV1awo1aiIUh+Dp5QiecQkvBgsto0H3XUfXkeYazqPaKONpAqTnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4514
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_NONE=-0.0001,
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

30.11.2021 00:53, Vladimir Sementsov-Ogievskiy wrote:
> Reconnect feature was never prepared to handle server options changed
> on reconnect. Let's be stricter and check what exactly is changed. If
> server capabilities just got richer don't worry. Otherwise fail and
> drop the established connection.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> v2: by Eric's comments:
>   - drop extra check about old->min_block % new->min_block
>   - make context_id check conditional itself
>   - don't handle READ_ONLY flag here (see comment in code)
>   - wording
> 
>   Code seems quite obvious, but honestly I still didn't test that it does
>   what it should :( And I'm afraid, Qemu actually doesn't provide good
>   possibility to do so.
> 
>   Eric, may be you know some simple way to test it with nbdkit?


Ok, a simple test I can do:

qemu-img create -f qcow2 a 10M
qemu-img create -f qcow2 b 20M
qemu-nbd b


then in parallel:

./qemu-io --image-opts driver=nbd,host=localhost,reconnect-delay=5

check that it works:
qemu-io> write 10M 1M
wrote 1048576/1048576 bytes at offset 10485760

Now, kill nbd server

try again

qemu-io> write 10M 1M

- it will wait up to 5 seconds for reconnection

Now start nbd server with shorter file

qemu-nbd a


Prepatch, qemu-io will successfully  connect, request will fail with "Invalid argument".

Afterpatch, qemu-io will refuse to connect to shorter export, write will fail with "Input/output error".


> 
>   include/block/nbd.h     |  9 +++++
>   nbd/client-connection.c | 88 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 97 insertions(+)
> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 78d101b774..9e1943d24c 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -157,6 +157,10 @@ enum {
>   #define NBD_FLAG_SEND_RESIZE       (1 << NBD_FLAG_SEND_RESIZE_BIT)
>   #define NBD_FLAG_SEND_CACHE        (1 << NBD_FLAG_SEND_CACHE_BIT)
>   #define NBD_FLAG_SEND_FAST_ZERO    (1 << NBD_FLAG_SEND_FAST_ZERO_BIT)
> +/*
> + * WARNING! If you add any new NBD_FLAG_ flag, check that logic in
> + * nbd_is_new_info_compatible() is still good about handling flags.
> + */
>   
>   /* New-style handshake (global) flags, sent from server to client, and
>      control what will happen during handshake phase. */
> @@ -305,6 +309,11 @@ struct NBDExportInfo {
>   
>       uint32_t context_id;
>   
> +    /*
> +     * WARNING! When adding any new field to the structure, don't forget
> +     * to check and update the nbd_is_new_info_compatible() function.
> +     */
> +
>       /* Set by server results during nbd_receive_export_list() */
>       char *description;
>       int n_contexts;
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 695f855754..d50c187482 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -37,6 +37,10 @@ struct NBDClientConnection {
>       bool do_negotiation;
>       bool do_retry;
>   
> +    /* Used only by connection thread, does not need mutex protection */
> +    bool has_prev_info;
> +    NBDExportInfo prev_info;
> +
>       QemuMutex mutex;
>   
>       /*
> @@ -160,6 +164,69 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
>       return 0;
>   }
>   
> +static bool nbd_is_new_info_compatible(NBDExportInfo *old, NBDExportInfo *new,
> +                                       Error **errp)
> +{
> +    uint32_t dropped_flags;
> +
> +    if (old->structured_reply && !new->structured_reply) {
> +        error_setg(errp, "Server options degraded after reconnect: "
> +                   "structured_reply is not supported anymore");
> +        return false;
> +    }
> +
> +    if (old->base_allocation) {
> +        if (!new->base_allocation) {
> +            error_setg(errp, "Server options degraded after reconnect: "
> +                       "base_allocation is not supported anymore");
> +            return false;
> +        }
> +
> +        if (old->context_id != new->context_id) {
> +            error_setg(errp, "Meta context id changed after reconnect");
> +            return false;
> +        }
> +    }
> +
> +    if (old->size != new->size) {
> +        error_setg(errp, "NBD export size changed after reconnect");
> +        return false;
> +    }
> +
> +    /*
> +     * No worry if rotational status changed.
> +     *
> +     * Also, we can't handle NBD_FLAG_READ_ONLY properly at this level: we don't
> +     * actually know, does our client need write access or not. So, it's handled
> +     * in block layer in nbd_handle_updated_info().
> +     *
> +     * All other flags are feature flags, they should not degrade.
> +     */
> +    dropped_flags = (old->flags & ~new->flags) &
> +        ~(NBD_FLAG_ROTATIONAL | NBD_FLAG_READ_ONLY);
> +    if (dropped_flags) {
> +        error_setg(errp, "Server options degraded after reconnect: flags 0x%"
> +                   PRIx32 " are not reported anymore", dropped_flags);
> +        return false;
> +    }
> +
> +    if (new->min_block > old->min_block) {
> +        error_setg(errp, "Server requires more strict min_block after "
> +                   "reconnect: %" PRIu32 " instead of %" PRIu32,
> +                   new->min_block, old->min_block);
> +        return false;
> +    }
> +
> +    if (new->max_block < old->max_block) {
> +        error_setg(errp, "Server requires more strict max_block after "
> +                   "reconnect: %" PRIu32 " instead of %" PRIu32,
> +                   new->max_block, old->max_block);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>   static void *connect_thread_func(void *opaque)
>   {
>       NBDClientConnection *conn = opaque;
> @@ -183,6 +250,27 @@ static void *connect_thread_func(void *opaque)
>                             conn->do_negotiation ? &conn->updated_info : NULL,
>                             conn->tlscreds, &conn->ioc, &conn->err);
>   
> +        if (ret == 0) {
> +            if (conn->has_prev_info &&
> +                !nbd_is_new_info_compatible(&conn->prev_info,
> +                                            &conn->updated_info, &conn->err))
> +            {
> +                NBDRequest request = { .type = NBD_CMD_DISC };
> +                QIOChannel *ioc = conn->ioc ?: QIO_CHANNEL(conn->sioc);
> +
> +                nbd_send_request(ioc, &request);
> +                qio_channel_close(ioc, NULL);
> +
> +                object_unref(OBJECT(conn->ioc));
> +                conn->ioc = NULL;
> +
> +                ret = -EINVAL;
> +            } else {
> +                conn->prev_info = conn->updated_info;
> +                conn->has_prev_info = true;
> +            }
> +        }
> +
>           /*
>            * conn->updated_info will finally be returned to the user. Clear the
>            * pointers to our internally allocated strings, which are IN parameters
> 


-- 
Best regards,
Vladimir

