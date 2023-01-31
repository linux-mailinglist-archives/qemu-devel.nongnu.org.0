Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B526831E0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsuP-0000F2-03; Tue, 31 Jan 2023 10:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMsuH-0000EV-1A; Tue, 31 Jan 2023 10:50:49 -0500
Received: from mail-db8eur05on20723.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::723]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMsuB-0006qR-I7; Tue, 31 Jan 2023 10:50:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVQwcvTpwZkWMVC4m9xGM8WjFqNmh4btUhwPJ++p5/7i61DV2bhLYS7/1lMUTvbXvSw32PK1pr1uqwkJZ/hf66T5gji35LEFAeRAHMZ1O4thSmADwaItaNqDNiAerOiXfRRsv7jGVbpnfCHAKucPifSWaeylYlty4xqq1viuYy0yQuE+gMCen/Jjq5/qTrDh8mHdCqqmzFNrVGGorCNCApSuaONZjoU4/kZrIEMv/QvSHDYPugXiYh1A0Ijri8+/+cyUVqTgnAeP2/gKwxlKGzd8fQacQtdvyjpRcvswPdEtDkajMWiAVyPzxJibUG5sIVBQGeLrH/LgfCoLYPmEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zg7QkxW9NGYeLMr7EVf+xAYv7NOsJkBi33VlAZcglE=;
 b=JzGGr3sZq2cstvBmNS/swa+RtyXY5CfokAjmeB10R10HZhqoAFPGb6Th3dDbShkYNPqle6uzEu4F0OJkGz4cjYFc5+YV9mU77MiTNh/d9BXenQ0uDW8SZMmdcH4xRfJaVZCYnJiEJeehyOYa0mkACKlBW6Gucn94+APXTYAkASnfsATgb6P8bQOIPRb66BoE4ihnmLIPwSnF12DeaHYMwGq8AT2FJAei+Ugaqv70WWI7GStXaLP3Ndq0zGHrBwx1FtKM/VsM5ft7pa6ngutVAIooKfsrI2Q9Pa3y1qJ/6mwbzWUG9lowUH3fdseVT3zUMmamCj2hxOobPEZDxzwSCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zg7QkxW9NGYeLMr7EVf+xAYv7NOsJkBi33VlAZcglE=;
 b=oejnWtFXGXzPhyovOMQn+s/kLHpW20RddgOSGCAFZm1Vnx60qGHobb4iZr+tN7OlTCu65YUDOtMsEbtUVZfmfiHMaJdojgMdVsPMHzO4w1zVePUAPdheDXZmJho6f2lTfr+WNr4K+uKzCzl1LBC2EM1An/aoF9N19m9hUbXZyO4fG8YmyrjYUcUmbBsyKNd43uQ8HHuGTLGQEU38+rR67mLps0/zCmQQjVFJNtL0k8jGXuYC3uPTG0WPEWlri7yIyHP9/Ey64LKhmunIyJX+2I/jDdL7TOX/0TveZzJdkzM8sUcpNZ2ykz/ywwa2L+IzZNRFS0ZMx6byXWLCLmwZOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB8922.eurprd08.prod.outlook.com (2603:10a6:20b:5b4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 15:50:38 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 15:50:38 +0000
Message-ID: <a2a922b4-1f70-2f56-bd42-372e7c090745@virtuozzo.com>
Date: Tue, 31 Jan 2023 16:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/5] parallels: Image repairing in parallels_open()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
 <20230112150149.1452033-6-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230112150149.1452033-6-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0101CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::11) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AS8PR08MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: 8399935e-a026-455f-d34b-08db03a2e60d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YX4ElvHm/zzkZ0jYOfbV/Ez7FRP/3MJNW0lUL9Hg7gbunQXrMaYPGSNizFen6tA4rWCCgT+vIqYEh9nLyiTythczjELPUP56HEmdopdibflIpyOUzXLehhbI2KyxwAXN4C97Guh9LMvSJ8MADmtGQ9Hci19fq1OLec1Y02JUIBUlppZ/KlEixgFWhKyyanef/MXVtJ/1sbo3iIgo2+aLnqdFyimoeAJWMXof0BSicKYXkUL09wL8TO+EpMi7zs5OawE25T5/YhTOT0+kPrr8SCeoKxj6baI5J/OT+SJXqYclcq27/UBrmPu+k9gFBrBTl2K0oKS80bHhnJNTVtWwMOOLVbC4d+oCsMOYIc9AL0/0fYPrcZy8feiiY14RQup4cpMbhhTXNS7x9N4Qb2ce9m89P878ZEGkniFvCzkGDD5cFLIaTfdk5jjyWaPgOhMWbppaxi7T+QYH9sJ6TICN7KMJ8VzRgg+hztySrMB9AhM35mSoBgJUxdZ3X/ybl0UG0NfZI/4ZsivoBPuSoAqHeC1EcmjKGl006RWUR4g8KISXGdiW17WqCf7kMrisMT4hCUzxYipVAcskVaYdibbRccVuYzbjxX1MPyibhlZcR4chgJSr5b94PWytbOHNVqZqomMM+1libgBbf7ju+Pao+BBn+468rIK0SXozuYjhtfHPKyziozhmIu04wcR+Mw8LWY/9/o1QDEP21CoNsj5sUH1JVLjAgye2p/vEiV+uFoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(366004)(136003)(376002)(39850400004)(451199018)(4326008)(2906002)(31686004)(5660300002)(6506007)(53546011)(8936002)(36756003)(2616005)(186003)(6512007)(26005)(41300700001)(66946007)(83380400001)(66476007)(66556008)(478600001)(86362001)(31696002)(8676002)(316002)(6486002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3J5L255VVZzNUllUGNsakp2UU9DdDdmT2Jack9KVWFGRXlvcXNMbzdoZU81?=
 =?utf-8?B?a3ExWVNycGRwamZDRUk3Tkt0b0ZlVjV3OEFRWFFROEtKamlvMnZNNlNpalJn?=
 =?utf-8?B?ODRUazBCMGVqTS90Z0dYUTJvb080VTVqVnMvbDdETmZyUjNWMnJmYzF0bmhK?=
 =?utf-8?B?RWgxMTZYRXcyTGNCVjJ2T0FaSk12b0NMWXBWZFBldjJaaUZ1cTNZbk53ZkJo?=
 =?utf-8?B?U2NSZXdGYnNwQ3RWUVBZOTluL3VmWmxOdGttblk2VVN4eEE1RkhPeUM3Y2Jw?=
 =?utf-8?B?bkk2TVhPTkV4S3VxUFBtTDE4S2puWnM1bGhZaUhJbkN6RVk2RXNseml2WTFi?=
 =?utf-8?B?TDJ3NTRkZzVuWHJ0dHc3NlJTbk1wRUdlcFNnOUcyMUg5SUxMS1hiamIvNUd5?=
 =?utf-8?B?K2NYallEZklkUytDcDUwWlFQelRkQzFlSy9KZHk3Q01DWFhDdm10bE5KVTlr?=
 =?utf-8?B?dUIzVHBZNFdyZ1ZaZkFmTUMxZVMxNVRRUzNoTXIwQjhlOWhiUUtUU0RRckVV?=
 =?utf-8?B?SjlhREl5USs0dTcwc1NpRDZwRzZNam1hekRMeHhrSENkU2h4a2M2d0lNdTcy?=
 =?utf-8?B?aXNjUlY3SDI1RGM2d0NPd0JJQmt3enduNUFUak5zdEZDK0dUbUptamdVUnpM?=
 =?utf-8?B?ZGNXenVvSWtBSVFKcndpSVR6ZnZUbDNuRFdHWk9aR2ZtZ2FMY0cvSkdtbzhn?=
 =?utf-8?B?emJBZUpDbDVqZ0ZhZkdoU3pCbFlkdkNaOGxNalRxSGc2YkI0QlNJK3NnSU5F?=
 =?utf-8?B?SXFPbFpKSFZQSzJWKzNQUXpnSW1KbjRjL2J4aXN2aHlveXJWbHVQTk03VW1k?=
 =?utf-8?B?QWpxT01iWWd4VW14dnQwQ2RCOGRmOXRVYWpoYXI5ZE4xdG5EY2xaRFFPVFB2?=
 =?utf-8?B?TlJOKzZySDFjOUhkcUZiblQrc2dHN0k3ZVJHNmtkVTFBYUViaTA1M1o4NEJ2?=
 =?utf-8?B?WFBqSUM2a0wvNitXa1c1aTFBQkQ3M1hHTWhqVXRsK2lpWWpNUFZGZzVsQVJF?=
 =?utf-8?B?MDFFNnhyV0JzNnduKy9Vc3lNVERBaEZRZzNaQTlqLzRITmp2ZXNxYnpXdWxS?=
 =?utf-8?B?Qk1ZNEY4S1YrS2lnYVoyREwrZlJDcm9qKzRSSmJ0VGhoeU9WS1lFSHRYK2ZO?=
 =?utf-8?B?MVNoZGJTaklLUlJsMTVUZm9HS1BId1NEblJ1UTlVTUN3NzNuRHRHN1cyVkFl?=
 =?utf-8?B?SXp4TlAxdlpONlZXd3UrVEdQN2tjRThEeVJKL1h2aWVYRWtyQmYyYldIYzBP?=
 =?utf-8?B?RWtvb3p4ZkF6ZVFBUDdLYUNWRnkwbUduUmhFT3l0ZzZJRUZ1NmhRT1ZCOC9T?=
 =?utf-8?B?a3hKSVk1NGM5aW42Mnl6bXAwWnRVVUVVTDNwbnR2TzdVNGw3RERaQzZOemdt?=
 =?utf-8?B?OHdqdjJNdkY3Mmx0czArN2czVE9yY3d4enpIb00vSDRUaTBxS3k0cVNmbEEy?=
 =?utf-8?B?VjNBS2tJMVFrc3hVZnoxR0F3U3NyU3NoS1dKcE5wZnJ4dWZudkJpSUFtUU96?=
 =?utf-8?B?ZW8rVUhOckUyeFN0MXdvMW54azdHazNKSlJQQzNuRzQ3ZW1VRE1sTmQvY0pO?=
 =?utf-8?B?N2FaNzFYalp1UlZtRzZsRVlXWUUva0p6bzFFU2t0T2h2T21uWmt6VFY3elI3?=
 =?utf-8?B?eVl3N2lkV1JONng4NkpTakFlL05QNGVsNHhLZzNZVWQrUXNGM2JXakJIL2px?=
 =?utf-8?B?U3BvMEtPTHAvRGtGOTgzaHpkU1VHSDFzNlJ0ekUrZmdDaUVFaFRzdGdIalRa?=
 =?utf-8?B?UEhmR1dYRGxCYksxZlp4UE53dERBZ3p5YmFXRG9kUUs3SjhtVS91ZjZtZWdM?=
 =?utf-8?B?dzFtSHdDdHNCT1l6ZnZKODkzTU56d3RXWDBTQUdYVGxaZXg5M3duc0grSk55?=
 =?utf-8?B?dFFSZUVjZDlBRkRTYjc4RCtocUVManBRZ3pnRFk4QTlVUnA3cUVCT3V3ZzhY?=
 =?utf-8?B?SHR4ZmVmNHo4UldVYkFhdk9HbUc0ZTE1ajZaMU95eEhjK1Z4WXVkbVI0dXdq?=
 =?utf-8?B?dGhvWElOR2dzZFFjeHk0SEpoKzVub3BXMTBWMktFMHBRQldpK091ZTZKWHp0?=
 =?utf-8?B?bkc3blhEYjFYMW9ndU5iTmNtUzRocU4yN1JBNUZidXFONXhIeFV3TkE1elhI?=
 =?utf-8?Q?xzAJGRMlhMJTyOMDqaL/c16KG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8399935e-a026-455f-d34b-08db03a2e60d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:50:38.3714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQKYBj+hAeTJhlfx0nwpH6OxUIQOvZrJTilHBbrFg10XF49Z8tDZBoRkPVTTx91FdVVuvcVFils9iQJFoTKKaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8922
Received-SPF: pass client-ip=2a01:111:f400:7e1a::723;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/12/23 16:01, Alexander Ivanov wrote:
> Repair an image at opening if the image is unclean or out-of-image
> corruption was detected.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 67 +++++++++++++++++++++++++----------------------
>   1 file changed, 36 insertions(+), 31 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 5c9568f197..74f6d00ffb 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -753,7 +753,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       return ret;
>   }
>   
> -
>   static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
>                                               Error **errp)
>   {
> @@ -965,8 +964,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>   {
>       BDRVParallelsState *s = bs->opaque;
>       ParallelsHeader ph;
> -    int ret, size, i;
> -    int64_t file_size;
> +    int ret, size;
> +    int64_t file_size, high_off;
>       QemuOpts *opts = NULL;
>       Error *local_err = NULL;
>       char *buf;
> @@ -1044,34 +1043,6 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>       }
>       s->bat_bitmap = (uint32_t *)(s->header + 1);
>   
> -    for (i = 0; i < s->bat_size; i++) {
> -        int64_t off = bat2sect(s, i);
> -        if (off >= file_size) {
> -            if (flags & BDRV_O_CHECK) {
> -                continue;
> -            }
> -            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
> -                       "is larger than file size (%" PRIi64 ")",
> -                       off, i, file_size);
> -            ret = -EINVAL;
> -            goto fail;
> -        }
> -        if (off >= s->data_end) {
> -            s->data_end = off + s->tracks;
> -        }
> -    }
> -
> -    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
> -        /* Image was not closed correctly. The check is mandatory */
> -        s->header_unclean = true;
> -        if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_CHECK)) {
> -            error_setg(errp, "parallels: Image was not closed correctly; "
> -                       "cannot be opened read/write");
> -            ret = -EACCES;
> -            goto fail;
> -        }
> -    }
> -
>       opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, errp);
>       if (!opts) {
>           goto fail_options;
> @@ -1133,7 +1104,41 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           error_free(s->migration_blocker);
>           goto fail;
>       }
> +
>       qemu_co_mutex_init(&s->lock);
> +
> +    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
> +        s->header_unclean = true;
> +    }
> +
> +    high_off = highest_offset(s) >> BDRV_SECTOR_BITS;
> +    if (high_off >= s->data_end) {
high_off + s->cluster_size I believe in the logic of the previous 
patchset :)
may be should be separated.

> +        s->data_end = high_off + s->tracks;
> +    }
> +
> +    /*
> +     * We don't repair the image here if it is opened for checks and
> +     * shouldn't change the image if BDRV_O_RDWR or BDRV_O_INACTIVE
> +     * flag is present.
> +     */
> +    if ((flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) || !(flags & BDRV_O_RDWR)) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Repair the image if it's dirty or
> +     * out-of-image corruption was detected.
> +     */
> +    if (s->data_end > file_size || s->header_unclean) {
> +        BdrvCheckResult res;
> +        ret = bdrv_check(bs, &res, BDRV_FIX_ERRORS | BDRV_FIX_LEAKS);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret,
> +                             "Could not repair corrupted image");
> +            goto fail;
> +        }
> +    }
> +
>       return 0;
>   
>   fail_format:


