Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E52736B0F6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:46:37 +0200 (CEST)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxp6-0006IG-Le
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1laxnC-0005HV-C0; Mon, 26 Apr 2021 05:44:38 -0400
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:57341 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1laxn9-0007D1-3S; Mon, 26 Apr 2021 05:44:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP7JRP9IkClwKDgn+/iz2zTYz1TMDPqpTYJbC9CKMOCRSkkM2AqHpwKDVPsMt+dcOVWroFDfPkCoC7lsDzMR7wWnDTszc1ghDCUjGa14D1NfTbEaOf54guDYGPF5TDDJ2dZioLSq+dTIRXUu5UDWl+kwNC6IxghCrJdVvxw5AB+ygH4bZTOdayd/ylTKe8JZuiA+SNL+G2wBeD2+++3wo02YGV/bnHvaLcYRKywT6VS0gTrNM/xD5Pg/gLS7OYN4q0sxX3lGVhIcxa/KpInZUvf+Cy4s/tbwhArCatC8KmCyhATTOiSdmULQ/q2qtAMMhkPlPzyj57cErOIVSThfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xHoIjyvO0zkEJJRHb5MtV032JNPNmzJ2wgZjemBW30=;
 b=T5s0PzImfqX7E7Qy6SAQjWlGerpekoZcPbEk1e2PxlkUEsRmE8QTn0tN0fr2q4Tb7zBH6VYPGE8Y/X0kEwIImXXN4mPmM1K79LwyDQiW4TsIWc/aquAuqoz3oYDCPNnli0+t8szc6ymsBIrYK6Y/Z7h2I9rIB5n766adlvF8O8AMOaFTCIZPiC3vDZoN8a5JrLvm9KjxvvV1I1sAg3W3dE9GdBSRNbzxk9vhfF0hZjdDpdZf/v6dNRxJvrczkJzSni6pv5Xfu+qWClXleJIKhHm0WrP6q6mcMI4fKNVW4s690XRTkQGgBut4ND7s23Sb+URVJRlrBLl3mNnFf+N+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xHoIjyvO0zkEJJRHb5MtV032JNPNmzJ2wgZjemBW30=;
 b=VWyMLT2rcHpFBxD+5CsOOpmTksnTqZbeZKfml1++8mpG8k9OqtmLVEZRAy7Pp4lBr828cz4+B65XsKKlhSeBZCPoNvTvoW/ycuL++kSlKQHthWzmGZiPtlhqxytTGWVA2ORmUY9mq6qXQ9BDQ/Osit1BOqqhxdgvLr7fcYlso7Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Mon, 26 Apr
 2021 09:44:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 09:44:30 +0000
Subject: Re: [PATCH 1/2] block/export: Free ignored Error
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210422145335.65814-1-mreitz@redhat.com>
 <20210422145335.65814-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e1374b1a-67f0-b55e-2d3e-7440dea21b26@virtuozzo.com>
Date: Mon, 26 Apr 2021 12:44:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210422145335.65814-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.17 via Frontend Transport; Mon, 26 Apr 2021 09:44:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77c4852c-3058-44f5-50a5-08d90897e3f8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-Microsoft-Antispam-PRVS: <AM6PR08MB36219F9C0720F6EC029E7D5BC1429@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z04Ne5PD+TmWZdgjj7KvkyiQsv3lcgNNg3FSXHBGVa0+lkqfHc2nEDSqTcKX1Rv5/dGh1jfnwC8NQyEZYXFmaMMb74Pnbls145wNxfyOgYelwaU8aGUXRWpyg2V7JEM6VwVQ1uToYBjamP/ibVqoHmVZHOEZES4lrOCin6Cs/C1mxmC8+8Hr7TulO+hukdQKOEzUvap6aiGH1wfoFlBWHbh1NeCmkm1hKmXLQxrZTcBgxpw/XqdXvI6MMbBAofIV/+UKv7XyDTGJcTOg0pm+WpbYU/zdAoLKVqX/bcrvYlV9BBG9lAAqig1OxEE94bTGe37UeVfPoT5yssdrfw6wosDyIFbfeznttKUixmOepgnafn1FO20CK+EV4p5zx04JCuT9LzAlgoaN91EmJiAGw25dw2Z6k6mJxMHqPG/dwhWfG2dOSCFeoWciV4pKtu6zSJCLd03L3F9feKf6RZE3XH7QgO+dU2ZNmyscPylsOB9t56FWBvD81NSusp5KVOPZ2wVBLEw9n/PuWXtS8sTgpN4srMqvXmfnJHgvzmeY2RQT+t/CzxaGMQA/gxcYMh/MprDu6w1GmyT7HocmPj0NSRmKSqgoIcOKrU7CukyvSFQqhWsUMB+ZBW+ZUamAOvFlHMmAVTaD3KHpkMFmje+gA7rt1ySEAj0dk49zY5MV87SMg8+4yznTxRSI7ef4H9bnZBqip9qM7P3Qc2ys0i+N3Ua/pU0YH1oSM5CwdX5Womk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(366004)(376002)(346002)(136003)(5660300002)(66556008)(66476007)(478600001)(26005)(16526019)(66946007)(186003)(2616005)(4326008)(8936002)(31686004)(8676002)(36756003)(956004)(38100700002)(38350700002)(83380400001)(2906002)(54906003)(52116002)(86362001)(316002)(31696002)(6486002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFYwcGxRL3lUcEdwKzB3TWx0d1k4NkJjWlNsN0QyKzZaN244bEJQSmRFNmFo?=
 =?utf-8?B?STRFSW9oUVZBVTc3dXh3dENqdytETi9CM0ptdGJwdHlEWGVlcWFad1N5UkxY?=
 =?utf-8?B?dFJaK3BrRG51enJhTUdNSWIraWZ1cXFaR2V6UHpyam5SNkE5MWVLOENUMGgy?=
 =?utf-8?B?WjQ4c2diclZzbUpZM0xTN1J3KzZQV1hWV2FvWjg2cEdmTGN3OWc1bWRpNm1k?=
 =?utf-8?B?OVVtWll3YlJXR0t0Y2RWUGs3VTkwSXVWQnUzVlZjNnMvRkltd2dxU1lTK2Zq?=
 =?utf-8?B?a2pWTEIrNDRsSHBKTmhXRy9EYXJIZVU1Wm41YUcrbFFibU1pVTVROXd3djZv?=
 =?utf-8?B?SzIxckFBRi9lQ05Ca2gyZUtCQ1BBQmdmNEY5SGFBMm1QYUdocnF5Vk5Rc1g3?=
 =?utf-8?B?ck5uQjQ4QUJZajFsYjF3MFZTUThHYWpJTEZqaGxOMThEWElYZGswZjdRT1V3?=
 =?utf-8?B?NnZFNi9vNDl0VHVWUjZBby9WcGxDM0gwaWJIbjUyUjdMZURLZlMveWVDb21F?=
 =?utf-8?B?RUtLd1BQUEVwZnoyeWpDck81MTdlQjQ0ZXE0TWR6MnUyRHlFY0JuMFFPSEpx?=
 =?utf-8?B?aEV1RTlTKytXSVlPLzFpaXN4NjFwVXFCTy9UdG5SS1hwb1JsRkJHQTM4TXFD?=
 =?utf-8?B?bVQzVVgzTkUwSGM0aVdobDB5SXBjQnFPK2hZN1dwNzhSUnltNXVIS29NWkh0?=
 =?utf-8?B?dmlJTkhQT0tOWTNYUXdhS0JyTXc0WEtVT1ZFcEZhK0hhb3k0L2RQN3Y2SGxm?=
 =?utf-8?B?M205OElGaGNVcGFpamNpTkQxQUYvb1ZqZ3NQejR5UFM5SUw3bHJ6bTJ3WGF5?=
 =?utf-8?B?UzdWUENOd3BRcmhHRmZmOHprMTdRZjYxckxCOUpWeTQ2Q3lPdkhwcitDb0p2?=
 =?utf-8?B?QUJib3h1T1RyQ0grdlhXQ3FZQytaMml1ZnlJc1Y4OU5BVmt6UjN6SHFlZ0VO?=
 =?utf-8?B?T0l5eEZFaVM2QTc3dzk2M0diZmlhTmQybkhqazlTMjZXMmFGMHpIcVdyeVRy?=
 =?utf-8?B?V0s5RGFMSjRMa0RoQ2NxQlM0VG5qNnlLWWJVZzdpNThzK2NVQVNuYWlnYldj?=
 =?utf-8?B?VHZhaGFSaGpCVVcrZHhtYk5JaVVMNnJVcHR6YVJCdWk3UFUrejZsZk9KcUgy?=
 =?utf-8?B?aktuV25ySFkwUDVqekdZVnRzaWI0L1ZxWXNRTkJ3OW15dlRaTk04bm1GQ0V3?=
 =?utf-8?B?MVZRVXVUTFJ0S3Fndm1kRGVOYUNWcWFiRW5ZaWVCWHpKVE8rQ1B2bS9idGJC?=
 =?utf-8?B?WExwTmROMXBBZHpGczRFcEhhQTkyRE9LYnc3SGRQa29NOWdWc09UcWtEQm5n?=
 =?utf-8?B?VlpVMW9ERzE3cVN1amZad090ODd0NlJFM3ZwWExTWW5kWkRGNTlUMHBReXlL?=
 =?utf-8?B?ejZhdjlJQlhoRjZFSElIc3RkbXpiUkZsMWx0RkhwQTlidnFLT2NzYnFqQy9Y?=
 =?utf-8?B?Ly9Ub3ZvTmo4bm9PT0hVOTljN01NdzlNZks4VWJFYWszS2RZamtwY2U1WEFC?=
 =?utf-8?B?bVJwdUpXSklsU3FkTFhSbzlSZVEwNVZ6T3hiQWFuT3c2Qm8zRW5qYkF0bnox?=
 =?utf-8?B?NTdCZVVqbTFhRS9PTGNQMjF3NUR2S1hqKytjT0N1bC9ESkp5Z3BVSjF5alM1?=
 =?utf-8?B?TGFQNzlFbHc0Y2tWZVlLS2I1YjYvNlp6c1BSMFcveEpDaUY5QW55YStnajIr?=
 =?utf-8?B?alJxbmFUUGFVa2JqMmpDcEZjUlRHb1JJeEFEV0l5cWtsMXZKa3JmaWw5MkJa?=
 =?utf-8?Q?HjoqU/+Rn2SPwZHvqf24DI/ue9dI4m7uvIZTQWP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c4852c-3058-44f5-50a5-08d90897e3f8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 09:44:30.9248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYbeDVTGWyuML2LmwpDokKRTYxtutuA1qs7jZ1ASD0ovRd6w08NZq2YquY4GhQ8MXD0+470TU4P1egyTt4cQEw3CUw91XE0NsnWqi/pnYY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

22.04.2021 17:53, Max Reitz wrote:
> When invoking block-export-add with some iothread and
> fixed-iothread=false, and changing the node's iothread fails, the error
> is supposed to be ignored.
> 
> However, it is still stored in *errp, which is wrong.  If a second error
> occurs, the "*errp must be NULL" assertion in error_setv() fails:
> 
>    qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion
>    `*errp == NULL' failed.
> 
> So the error from bdrv_try_set_aio_context() must be freed when it is
> ignored.
> 
> Fixes: f51d23c80af73c95e0ce703ad06a300f1b3d63ef
>         ("block/export: add iothread and fixed-iothread options")
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/export/export.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/block/export/export.c b/block/export/export.c
> index fec7d9f738..ce5dd3e59b 100644
> --- a/block/export/export.c
> +++ b/block/export/export.c
> @@ -68,6 +68,7 @@ static const BlockExportDriver *blk_exp_find_driver(BlockExportType type)
>   
>   BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
>   {
> +    ERRP_GUARD();
>       bool fixed_iothread = export->has_fixed_iothread && export->fixed_iothread;
>       const BlockExportDriver *drv;
>       BlockExport *exp = NULL;
> @@ -127,6 +128,9 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
>               ctx = new_ctx;
>           } else if (fixed_iothread) {
>               goto fail;
> +        } else {
> +            error_free(*errp);
> +            *errp = NULL;
>           }
>       }
>   
> 

I don't think ERRP_GUARD is needed in this case: we don't need to handle errp somehow except for just free if it was set. So we can simply do:

} else if (errp) {
    error_free(*errp);
    *errp = NULL;
}

Let's only check that errp is really set on failure path of bdrv_try_set_aio_context():

bdrv_try_set_aio_context() fails iff bdrv_can_set_aio_context() fails, which in turn may fail iff bdrv_parent_can_set_aio_context() or bdrv_child_can_set_aio_context() fails.

bdrv_parent_can_set_aio_context() has two failure path, on first it set errp by hand, and on second it has assertion that errp is set.

bdrv_child_can_set_aio_context() may fail only if nested call to bdrv_can_set_aio_context() fails, so recursion is closed.


-- 
Best regards,
Vladimir

