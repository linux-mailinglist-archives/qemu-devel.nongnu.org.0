Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D6A3BDA77
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:47:08 +0200 (CEST)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0nHv-000178-4J
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0nGT-0008PO-VL; Tue, 06 Jul 2021 11:45:43 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:58583 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0nGQ-00026z-DV; Tue, 06 Jul 2021 11:45:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTVrMOT78XfTBy7JmZ1Yaty9mgtWhoaj7qjq/mvnVyWPCp2ujt5xlJKhC6ULCB+uO2Mon4ViIwyWem7eFPKYNmOzqJcyYUNvnXpJ8HRkqBHGrw+SfHzk4ZSfJTKJpSypRf145Ww3W4dnVy3ejt4rlKRL3urU/Nnoo5kVV8jxYw8buOYyXyLt9oyDQ6c6ptgXFDRk1PHddWOzUb+QQf8aXt7F8/DeI+2Gbn5byDMO3iv2QZsQrqF1KZSCil2r/AYESo436QAYrfkoi+ijHfl7GFu2B9hnZqWtGB3uh+IA8ch7Tr1ccGprtoBMjEaXoBd3VmiXuxX262UJhG9wqjDXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WCUzJxKjH36qeQoMEsLG0buObyv97IJ37JSr6aTQdg=;
 b=T5EAMsAIQ33RUNlocw8BRYzLGCjrLpD7RPf9f9NTVX0G7uL7bDgDNdB2HX5vQLI3HwjzcDGdgpHrBGqO8ZHbQsMVu0tfINoKCRUoMfPL8XIyRFEaUyJp0Tu5woteXa7PtSD03vOKvQLaKsAxl144JxMcxKPGwFegnnhrzMm9JKNcd5YEyV5AVTxeBgEJ4hk16BauAsRrnJDgMNzaiORFT6oCRwnNP5zWHroI7yQHSDGArj0irgs9Ff3cy+dqqipEJnyWyCBzW0qBKGAht7OaYPajL65Tm4hWgQzC43NgHG8RxhgjDY5yMY25qCExlXW3sUwkEQmdm4B1PDYq3DjZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WCUzJxKjH36qeQoMEsLG0buObyv97IJ37JSr6aTQdg=;
 b=PH4wj8q1yYUHI0UeQ74t06HfCN/Cqs3mMqD2TK2tVnvJaS74V/gW2xEjuGHbwwirC/PumjCkSK+L7rKFHW7/4vK5+IdsmSEcYActbjDL0hXEA1T/xO8XYaYtz0XHrAaOgvq14H2XaWHVoaPr3sAWaSxWdbglJMzn4evIQQ9NRNU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 15:45:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 15:45:29 +0000
Subject: Re: [PATCH v5 4/6] block: Support multiple reopening with
 x-blockdev-reopen
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, berto@igalia.com, qemu-devel@nongnu.org
References: <20210706112340.223334-1-kwolf@redhat.com>
 <20210706112340.223334-5-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b9ff6ef2-b054-d054-435a-3ea31d47c68e@virtuozzo.com>
Date: Tue, 6 Jul 2021 18:45:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706112340.223334-5-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:208:d2::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 6 Jul 2021 15:45:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b13c134e-fdd6-4131-af37-08d9409514e6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6293:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6293041080A923C223673A3DC11B9@AS8PR08MB6293.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HucTUD9PpZduxzN9JTHKANKe1hVsTbGMzkVJQ33KRay12091sxgk3M5Mft89M4c8r+txA+Fyje7R6WOdx3Iz5d54pnlTEfD56R7XKuZ9Jn6Yy/oQjUtETzB6UltGxyG/D/jJ/z++/drtlhzs642KhNb7fOtS3JIan0EukYBrA6AF3nAA5RS9yikKhz3UnL5Epc0NdX7iTVh9vGklFrlSj3f1go08bJ3C3xoRaTN0CBEdRSr05PS7y1nfNedXXG1OpvrH0t6kPFmvt/ygnLVd1wIIoF5Glw+sUGOyrjikuZ2iYIY9oyn1H+/p3Rx67Wds6ffhY4tPXAZjKZ7faf3Tlr4yavH1snABKVGE0bfdUlpTL4GutjTV+NgLJC6bNnHiW5M/Y4s81aQ3EFrh9bzLb8xubKXevjMcNgK49UDe8g6TVA62oDxvk9wTUmXBvNNF5XavGbfhlvD6fLI3V96AQ4aWUuWTlV5tjhfK3UEMkGK8FmAU8/c0kxULPvm4whCJPwmkJThv97zwgyP4K78/jwDDF4jun3lH5/rfXQN3uaGZEsNN78gtYi9S7QufmZAlpaDaU4mtL+ZjGIBA7kpm9fZNSDcmd4z6Gzrq+eChH0V/RCFcGSmk+UMC1Zx9kvwnZmuA/H23ITu2M8+BRmsWTRmBuFVJLfD/+nzRotmRVRgw41R51Sn9YwbRxSUlVjc1f1SQgR0r1MhbFtqfHWCB8UHS/37plojv41YUbkyphRGgUt+tlBIkcmCAlh/Warq4K9vj7fwJFDdVRn3/XoDcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(396003)(366004)(136003)(346002)(16576012)(4326008)(5660300002)(66946007)(83380400001)(38100700002)(52116002)(2906002)(8936002)(36756003)(186003)(66556008)(31696002)(31686004)(316002)(6486002)(66476007)(2616005)(478600001)(26005)(86362001)(38350700002)(956004)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azVnM0Z2R1NKanRQZVZCenlnSHlERmtGWXhwK0svc0dKNDY3S0dzbkw4UlR2?=
 =?utf-8?B?Q0lwaFRINFlJcUVXbkYxNmlCRnhVM0ZYdTd1ZzdxZU16UzdFQnBhTFVUUlV1?=
 =?utf-8?B?ZnJ3M1huMTRWOHZSdFRiU2JLL2V3YzBWdkV3WUEyL1FTQzNCb3Y5ZkhpVVJR?=
 =?utf-8?B?T3hsdlArUDFESjhrSENKVmF4SXQrZHdCbm16cERwdStDUzFsNmlVb1k1Ykda?=
 =?utf-8?B?Rm9KbXhWL25wNFBlK2k2czlqYzBMWE9RNFpBaDNHZWxHWWI0dHlxYUZ3azVS?=
 =?utf-8?B?WWRPc3FPckFWelpJVEM5bjJRRC9sNmhaZ1gzbkpUakNxYkVjNTJTc3Y1bmg2?=
 =?utf-8?B?eEt2ejgrNUZXcXpFbzYyZ3hqbDFmQVFPOGJPckJpTjI5TUxSSzMvMHZTQTBu?=
 =?utf-8?B?THBzRHEzUTE2b21XUFMvT0I2RUJiYkViZFQyY0RPOVdFakFSZUtoWDNwdnFZ?=
 =?utf-8?B?SjNxMkpWbmdjdUs0M3R2bkJOeW9Mak0rRzh2OGVsN1laL2hjYWQrdHpiRmNm?=
 =?utf-8?B?TmE3TWl0Z1QxZno1UDVRUjRDREFHSHc2TGZxSnQwc3ZRalMwU0cwUkt1RStO?=
 =?utf-8?B?LzVYNWJHam1DQ081ckdZc1ZTOXZJdXZDYW5hS1ZBZS8vUGxNd1RVeDgwUjJS?=
 =?utf-8?B?UUIyNHI5TnJ4ZmRGMWdYWndJaitTdWpkSVM5bkRSSG8rZ0VwaThmWGtPZnZY?=
 =?utf-8?B?eTArNC85N0ZDbXhzbktFTXM3ZWIwUVAyVFg4OWROQkRRYUxZOTQ2S0ZGMVJE?=
 =?utf-8?B?YzJqd29rN2tMa0FzejcxNmdvY1hWcFFYa0RxVjVIY215ZFJ2NEFaTDdKWHZm?=
 =?utf-8?B?QW9ocXhRZzZmMkZUbXVOOXlDWFdPaDAyVU54bkJiTCt3THNnbGRSOE1JWGRh?=
 =?utf-8?B?SHZaU1B6bFJ6Y3lYR3ZNVTlBODVGYk9nRndoNGx1eXhTMFJPK1cwRlc1N2hn?=
 =?utf-8?B?VTZhS1ZodFlJWEZHUDBXWFVSUnVaMURVTTllVkREbzZjS2RqdUZsOXhKTHFs?=
 =?utf-8?B?YmNxendmMmloU0NDeStIVlF6V1VmR0MwbmtEV21tT3lzalpyNjlsKzJCOEo4?=
 =?utf-8?B?WnJBY2poVG4rMFpKelREeFByY2tBbGt6NG9MRUtMR0ExdTVKdVF1cmtnemxH?=
 =?utf-8?B?cVVIUmhJeTV6eHJLd0RQdmdjWkdFZ29IMHRicXJxQlhkZlZ5WHc5S1pEOGdU?=
 =?utf-8?B?Vkt1QTdUUmFONGFadllSRTY1R3I2SUJOWmNzeE95RVc3cmUzV21vczVaTldh?=
 =?utf-8?B?ZjMzaG1jWkJqYjhHNHJ5MVpRdVhtSjZKZEpqVXN1RDVoNk5oQVR6VkJCZ0xi?=
 =?utf-8?B?SVYramozTmRiazBSWi9kNFNUc09FUGhGcXord2dONzFPWTVGREoxMWxoT2lt?=
 =?utf-8?B?Y0E4YjNMcFN0NEI1M2pLSmpGblFjcG4yaTFseUNYVnFKdWpJUktMYUFkdXZC?=
 =?utf-8?B?Y29sL1Z3ZUtKc0RmR0ZtNjRUY3ZkcWxLSDBEVzJLVUdWQXZBemhOVkdoSDJE?=
 =?utf-8?B?WjNicUJCejZXalVYT3p2RDNBQmlnL2doQjhXcVNLSnU5Q1A3Qk56S1JQdlcx?=
 =?utf-8?B?eFd2S0NkRHkySHpjT3F6KzMwSWwrb0hVY3BFUGdzQ1lPZ2UwNVdZRW8rV2xx?=
 =?utf-8?B?QUd1dndQd1czbzJScmFRZjVxSzRLUG1SZGxFUGI5OW9zbHF5ODNCQ2NyTEc2?=
 =?utf-8?B?OUxKbzMxWVJDL2ZTVHhtYlAwdC9lbG5iWkc5RWR2dFZGWi9tWDNjNHJKaStB?=
 =?utf-8?Q?CkKtzff0Rb3NkNj5DGQWy4ohjisjnjVXQO7TkcP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13c134e-fdd6-4131-af37-08d9409514e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:45:29.6106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DP/ATJQ5Zj9SlVaRm+2AoprEQeoO6XhKUnTySACHTqbJsvfzSug2B8wtKxNn/0DKjXQf6z1jMCVKOHMrG5GBTlROwOJ2MYRlLJHeBUGoCIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Received-SPF: pass client-ip=40.107.7.123;
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

06.07.2021 14:23, Kevin Wolf wrote:
> From: Alberto Garcia <berto@igalia.com>
> 
> [ kwolf: Fixed AioContext locking ]
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   qapi/block-core.json                          | 18 +++--
>   blockdev.c                                    | 81 ++++++++++---------
>   tests/qemu-iotests/155                        |  9 ++-
>   tests/qemu-iotests/165                        |  4 +-
>   tests/qemu-iotests/245                        | 27 ++++---
>   tests/qemu-iotests/248                        |  2 +-
>   tests/qemu-iotests/248.out                    |  2 +-
>   tests/qemu-iotests/296                        |  9 ++-

[..]

>   
>   ##
>   # @blockdev-del:
> diff --git a/blockdev.c b/blockdev.c
> index f657d090d3..1e8c946828 100644
> --- a/blockdev.c
> +++ b/blockdev.c

[..]

>   
> -    bs = bdrv_find_node(options->node_name);
> -    if (!bs) {
> -        error_setg(errp, "Failed to find node with node-name='%s'",
> +        bs = bdrv_find_node(options->node_name);
> +        if (!bs) {
> +            error_setg(errp, "Failed to find node with node-name='%s'",
>                      options->node_name);

indentation broken

> -        goto fail;
> -    }
> +            goto fail;
> +        }
>   
> -    /* Put all options in a QDict and flatten it */
> -    visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
> -    visit_complete(v, &obj);
> -    qdict = qobject_to(QDict, obj);
> +        /* Put all options in a QDict and flatten it */
> +        v = qobject_output_visitor_new(&obj);
> +        visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
> +        visit_complete(v, &obj);
> +        visit_free(v);

[..]

> +    # Run x-blockdev-reopen on a list of block devices
> +    def reopenMultiple(self, opts, errmsg = None):
> +        result = self.vm.qmp('x-blockdev-reopen', conv_keys = False, options = opts)

I don't really care if this doesn't break iotest 297, but PEP8 doesn't like whitespaces around '=' for named arguments..

> +        if errmsg:
> +            self.assert_qmp(result, 'error/class', 'GenericError')
> +            self.assert_qmp(result, 'error/desc', errmsg)
> +        else:
> +            self.assert_qmp(result, 'return', {})



-- 
Best regards,
Vladimir

