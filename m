Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAED3ADA7F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:08:08 +0200 (CEST)
Received: from localhost ([::1]:52068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lucZr-0000le-87
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lucXV-0007DJ-JO; Sat, 19 Jun 2021 11:05:41 -0400
Received: from mail-eopbgr70114.outbound.protection.outlook.com
 ([40.107.7.114]:54586 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lucXR-0007WD-O5; Sat, 19 Jun 2021 11:05:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYILwBIjXbeHGxLn9p9O6bcZWoOLrJoBrWLddXu4+VI3kwFQRPn4kWW0hHoU4RabZiodjAE29mKXtsoSYQBVkA7QDXVa6TeE5UF1+xm5WknoAq1VjO4oofkeVcNCUaKyrxkATjX5bcWh4wFhOD2RYg9SiRbTgE+g+HjGBG5muvnhLqI4tmwpU4tzR37HLBdbIIsY9YEvR7uJvP2zd9a+QFTiD14fpcuAvtNB9eQQGnRKSnAb9HeQVzE96o032i7eISl/0llyleF9Cuhnq/oNxFiBuYNSZsMk6+CUvMicjxQZpS8prC6x8SEjrqrz108ffqZhUCsAK+DHsBNY1NoVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76ETz6Ie89qTyuD4IqAolh1m2xannzXitKGWq9TqAdE=;
 b=alWg8BFiAjjlJIMug4FGnwALsootORdSBWI2FDTjFaSRxoLOc63GTj4SuLstj+F9aL+7RLA02MzYnKJ067w/ohZoD3epH2hU13mIcQ9yjKEGz1yhUUE+OB9/Q63dsQ6J68bmxCmQ5lEjevU14Ocoo1/oVc/NwetmYPmQ8A1UEIIAr6tG4gCgVauHgCpvDQEERtLoTD4zBKsiQowYiC+TpD14CM7WqPYSWu3C5RAns7K2GC6Q2rC1EmFnrNL16rUtjgfPXR0hHnyIvJsm2SiN601lpJhC0OrWCFStpKbjO0DQwYzTwgUb3htaslLvD0yVo9Gwp3nUmHNO/qe8TAoMzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76ETz6Ie89qTyuD4IqAolh1m2xannzXitKGWq9TqAdE=;
 b=iVQODDXbT/xGFSINt5jdoGWzqlWLUmFqZMIkDL8uJutYHaXp/2FOknUJ9E+P2CLB6W8z8xSDRj5anoB16Eab3nlMb34ISx19tEYNxRA6BIE9V9MJBzONX7Rry4WL6rBMOBCB5p/eu3CKjFyZOus/llpeqTLKCESO2hBRU3U6q0Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 19 Jun
 2021 15:05:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 15:05:33 +0000
Subject: Re: [PATCH v4 2/6] block-copy: streamline choice of copy_range vs.
 read/write
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <37566b62-5a48-57f5-6dd9-8cd2bbe4fe15@virtuozzo.com>
Date: Sat, 19 Jun 2021 18:05:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614073350.17048-3-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0902CA0009.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0902CA0009.eurprd09.prod.outlook.com (2603:10a6:3:e5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Sat, 19 Jun 2021 15:05:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a2c1106-61ed-4a3f-df1f-08d93333af99
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32245141578FE82E0CCED8FEC10C9@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3v/60pxIG22CpA0nI6gUBT1XBacKMJ6KwBYXbDwD2qFZcegi3tAZob/1w9AlIm4ZVE+aq5UK9iMssqRGqqvXIVB2y2pK7QMkVQMu/yxJjfVzMFU4mBOOmSdwKylRykedZnCs/hDV382TBRDupfX6Rayfjv6eB+Y5hNP35kuYp79h65TxiLRNOn5Z1QROKQkmC4rrcZneQdWgh7UtyRhK+a+DmGTxzK+EUF4X7XT+6rO+TjFe3rxYL1dzs4kBb5qGinjeZMw5UPmPJlGDu9X8CRtTt5DfSFAJM7bCfg68kLFHgxKEkQCEP1TsN57UVhMAKMTQKWDd/bKe86uvPuGUOMLCy+zYVJTF1FziMQ3F6OQxCIzysC1PttBdBp9ccapcyvGCbjnYYyWyD0GApEPc0BwE8IlPDvPLX1m2cePSHhMVd/y9ivDtpacC+abhe+LCr3LZbhIJfuCIBB2njkr+Z2wT4Mot2W2eF0uXSLuDQeQB6giaPv5Drf7r3y4vTbz5FSaaBrm/ZdrsKfbYXKO8zOPDoOCagrRnCFpd20vkeH4dJCihJM4G4cciUfKlgrQe8neHagott/eeckNjolTX+JC/41qxOAev50PWQjH/H3FT8QM7+2lDFDxh7ynyya1Tw1ftvPdBIE2E2uAckgG/H5s7DL8Dh88XAlRrjbPBG0aqGSVYGIPELceH2SAOduu1FIQ9L+GkYNPqBGtYNV2L52KUBZGEFYcYrvIZsJBfWPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39840400004)(366004)(26005)(5660300002)(16526019)(36756003)(4326008)(316002)(186003)(956004)(2616005)(16576012)(54906003)(38100700002)(38350700002)(83380400001)(66556008)(66476007)(8676002)(31696002)(66946007)(8936002)(86362001)(52116002)(6486002)(2906002)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekVJNjNwNDJhUlhnbk5hMzhTcWhvQXdEV3ZwK0NhS2NnS0lFNFBWQ1VFVmpQ?=
 =?utf-8?B?cTE5bFVqM2ZoeUJvVG81Wm5PQkxNdzJON0pZQ21YMDkvTDlQaHpBNkpPTExi?=
 =?utf-8?B?RDZQcmhWeVMyblZaWFRKOCtodVlQYjRvZUNYemtQQzFMc1VWQkZmNnlHQmFO?=
 =?utf-8?B?UklpanFJOGt5UkQ0bnI4ajk3Sm05OTZrNTZLV253ZDJmYjU5c3FkdGpmdUhx?=
 =?utf-8?B?dVZuNXJ4eElwSlVrejhkVU9sQmphbDVWeEQzb1Qyd1lkektzOWdSWWZhZDVy?=
 =?utf-8?B?VWE2VTlNeml5SkRrZFVQUkwwbDFEZFhvL1BEK0h0TzdZbUlZeGZyOFBLRVVt?=
 =?utf-8?B?UTZOZUVrN3RZSUtEVk9OVkxVdVdWT1QyS0JJbml1eFNnSlpjbk5hcG9Wb09o?=
 =?utf-8?B?NXRsS3JwV2c2R0RwcDVXOUxkREdvVHZTTUdQWXRkMTh1ZjBVblMwdVVacFdu?=
 =?utf-8?B?ZllzWkZ3TkdCMURLUXdQZW5hKzM5clV0ZE0xVnNQRGFKWUxHdFIwM1prTytI?=
 =?utf-8?B?akMvRzBGTDFURHl5N2xadmZ1OGJKSEdnSWVhWC9PbjJzZnZtUENxSm80WXZh?=
 =?utf-8?B?QVpCUmFxNVFIcjlTTmV5eWhWSkdHR1VEWUQrWGFmTDFUM2d1RVc2TklacEtB?=
 =?utf-8?B?dEFBK2h5SkVvanRRenF2c2IxYTIrbkt6c1psekJKVENzK0JpYWVleEZ5VXpJ?=
 =?utf-8?B?SHAwSXZrS3BuUy9xbm5GQit0NERRMW1yRkdEN3hJM1lpR0QvblFUZHVPYXdu?=
 =?utf-8?B?T1Z4bHhZMnJycmJpTVlSUU1ySVB1NFVqQzc0dUxPVG9DbEhnOWEvSFlGaEIx?=
 =?utf-8?B?YnEzeExoSm1qQkY4MHNjdDlsb3ltMGdhb21FdXJXdmhtSVM2SFJPYlF5SzNH?=
 =?utf-8?B?NXlGMFpRakFpU1RhajdvYktReGRZcDBIYzROZ3dETFhHMUNSN0lwZm9iRUVR?=
 =?utf-8?B?clJsVWpBaVdyR1pidDQzVUxacDJBclNRSUdaYW9PSjVDMEEyQ0oxbU9lY3R6?=
 =?utf-8?B?SzdQUVhOcE1seENIMmpwZWU3RUVsbVNFaTY5Q09jUE1YR085Q1lXU2tJaXNy?=
 =?utf-8?B?ZS9RamEwempucHZJOTdLWjY4V0NzNEFnNTZDM3hOZ1hraUk1TmFob0xNN0pY?=
 =?utf-8?B?cUJGME01TXVZKzlMczdVUWdqUHdGWTBrelFjZzVES1lnMkdISURZeHFDZWZR?=
 =?utf-8?B?REQwdDhOYzh5RkFubDFsL3dvMGlCMktQbHFOM2N3SklTMmUwMnYrWFdGNFY0?=
 =?utf-8?B?TGMzNnRjRkZmQ1NJbStNa2wxcmFSaVpMUkt3Z1M4L0RiMEdPc1NKT0p0bGZv?=
 =?utf-8?B?ck1IRWRxL0FrTVVmSWZITUJDRkFmaUNHalpOSHVWYWJvQytEcTBxRkd4cHpo?=
 =?utf-8?B?b3IvajA4bmp5UlRvK3lWYU4rRXROOTJUYlpUMWhPSEFUUkozY09pdlkwSklC?=
 =?utf-8?B?d3RtQnFWM1phdE1MdUZUVUFNM2ZJbFkwSVh0a3lrUWUyV0pOSGdldkw5YUtG?=
 =?utf-8?B?M1VpZmtrRjM0K1hTc09meUt5cVlmeHdwbkI4R3ZBMUVzSVN2RHMvY25xdkhq?=
 =?utf-8?B?eTlUdDNqcXQ0NGNsWFRGd1c0Yy9yTjdNNkpMclByam1hVnd5b21DT2VvaUtU?=
 =?utf-8?B?OG5rTUptcFFWRXpMZno4M1k4WGhsZU93UGJ4UTdYRGNpcmJIWmE1SWZtM01E?=
 =?utf-8?B?Ukp2T3NtU0RzWHppck8xdEpQZ0RLLy8xcCtTaFdFTjcwYmhBbXorV2pwSjh5?=
 =?utf-8?Q?7JDAcvrY36hbo9Lz31+mRc0zaF6qQCS27JwQPwl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2c1106-61ed-4a3f-df1f-08d93333af99
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 15:05:33.3216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ytN4J2uV3w9yXQizPx+Q+5wTupLDCZl0xHdHBCUAxCkBwWbjQPVvANuXk0OGK/O0bzR/JYJAs7i3ASWWq13rqCWYvtKt3gxufHcyaBHu40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
Received-SPF: pass client-ip=40.107.7.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Put the logic to determine the copy size in a separate function, so
> that there is a simple state machine for the possible methods of
> copying data from one BlockDriverState to the other.
> 
> Use .method instead of .copy_range as in-out argument, and
> include also .zeroes as an additional copy method.
> 
> While at it, store the common computation of block_copy_max_transfer
> into a new field of BlockCopyState, and make sure that we always
> obey max_transfer; that's more efficient even for the
> COPY_RANGE_READ_WRITE case.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-copy.c | 174 +++++++++++++++++++++++----------------------
>   1 file changed, 89 insertions(+), 85 deletions(-)
> 

[..]

> @@ -267,28 +293,28 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>           .len = bdrv_dirty_bitmap_size(copy_bitmap),
>           .write_flags = write_flags,
>           .mem = shres_create(BLOCK_COPY_MAX_MEM),
> +        .max_transfer = QEMU_ALIGN_DOWN(
> +                                    block_copy_max_transfer(source, target),
> +                                    cluster_size),
>       };
>   
> -    if (block_copy_max_transfer(source, target) < cluster_size) {
> +    if (s->max_transfer < cluster_size) {
>           /*
>            * copy_range does not respect max_transfer. We don't want to bother
>            * with requests smaller than block-copy cluster size, so fallback to
>            * buffered copying (read and write respect max_transfer on their
>            * behalf).
>            */
> -        s->use_copy_range = false;
> -        s->copy_size = cluster_size;
> +        s->method = COPY_READ_WRITE_CLUSTER;
>       } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
>           /* Compression supports only cluster-size writes and no copy-range. */
> -        s->use_copy_range = false;
> -        s->copy_size = cluster_size;
> +        s->method = COPY_READ_WRITE_CLUSTER;
>       } else {
>           /*
>            * We enable copy-range, but keep small copy_size, until first
>            * successful copy_range (look at block_copy_do_copy).
>            */

Comment outdated. Maybe:

/* if copy range enabled, start with COPY_RANGE_SMALL, until first successful copy_range (look at block_copy_do_copy). */

> -        s->use_copy_range = use_copy_range;
> -        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
> +        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
>       }
>   
>       ratelimit_init(&s->rate_limit);

[..]

> @@ -377,76 +400,59 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
>               *error_is_read = false;
>           }
>           return ret;
> -    }
>   
> -    if (*copy_range) {
> +    case COPY_RANGE_SMALL:
> +    case COPY_RANGE_FULL:
>           ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
>                                    0, s->write_flags);
> -        if (ret < 0) {
> -            trace_block_copy_copy_range_fail(s, offset, ret);
> -            *copy_range = false;
> -            /* Fallback to read+write with allocated buffer */
> -        } else {
> +        if (ret >= 0) {
> +            /* Successful copy-range, increase copy_size.  */

No copy_size now. So, "increase chunk size".

> +            *method = COPY_RANGE_FULL;
>               return 0;
>           }
> -    }
>   

Comment tweaks are non-critical, can be done in-flight.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

