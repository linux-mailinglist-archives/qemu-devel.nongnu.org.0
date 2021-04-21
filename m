Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3EA3674C8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 23:25:53 +0200 (CEST)
Received: from localhost ([::1]:51270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZKM4-0007TE-Ec
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 17:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZKK1-0006Jv-1z; Wed, 21 Apr 2021 17:23:45 -0400
Received: from mail-eopbgr140098.outbound.protection.outlook.com
 ([40.107.14.98]:19437 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZKJx-0008A8-VX; Wed, 21 Apr 2021 17:23:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EybVF1bV+Y348G6WDs5kimW5GJkNJtJ36DnjlcyogORiVrNBc7Xgt9Qtme+FJvbkPqnbAuiRm0h7xBue4zMrzGX3gh74QryC3geShBn+hKRgmM+pJ4pE6aZQ0Vz2mWc8XWwAibWqr7hSmTYLfW+6258PJ9fP/wf9I0xZU91nWZgnNulAZ9MyL1KOyWG0yGw3kUlstv+rKDSpwsKZ20oZ0KR+NZYVw48kwr175VN4Wu3KdhQELAjPTmcDMBpA+vs9ssSkYqEAYvj9HZUgxP9cRMvYVGGs+XvIv5edwRKwolMrHdKVCBkMh+TJXIRa+MJJTYcAuvKFgYLJq+bige+l+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhcw3D3tofdAVXO+xzpaksISKNP1uAHq+EmJ7fCp5S0=;
 b=HTnwXeGjLbUmk0dYlikvo0lHs9FsjrpFAT3aVFTtaTBKy+y3dtFhfSAmzG0yZpX7mqSszEQE9CCMnl+ODdSRlUUhfKGskxCwep3z1L2kmUpjjeaWM+bsRR5UfaLzRchBxfb0rtLs59t41nNys+BXGOeVqWyPohdGpcVMJXonPnxto85ybFFXcWcUCnQSyMhOyaNhrJY8/d/um5r3nHgO2QdSDgd224bX/odUlZiYUzgNPoesvG8ispRRs3DN1WmEmRPeuhxYUmyqIpjLzlRKWQQCtojkjXIQBNzXbWceIfjGS3NM8J+BCw4bpMKJVfGIhHn8fvdyihHjXex2BP3meg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhcw3D3tofdAVXO+xzpaksISKNP1uAHq+EmJ7fCp5S0=;
 b=pDC33bxnC3OYuD/pnjCIWZew98sud9z6fWZfxqFJIqKbFvy5b4SS/JJ+X2iv5KlG0TMtebSDKVhUvaMl69AFz+hrRO6VbQ2wO/uYVHMlQzmh4m2aHB62d+GGNxjgoqfPqGZIA43ElL+wJlCJh+58coaFnUIzAjeI+p0Y1QmFnX4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 21:23:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 21:23:37 +0000
Subject: Re: [PATCH v2 4/8] block: make before-write notifiers thread-safe
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4f1ff207-2a18-fea7-b9e8-a2e5191e82da@virtuozzo.com>
Date: Thu, 22 Apr 2021 00:23:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210419085541.22310-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR0P264CA0194.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR0P264CA0194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 21:23:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dc2c2f2-8f3d-429c-2b79-08d9050bb9a7
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334323AC7118EA1C1D2F119C1479@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: icjzennoIoXTGFJFcoECkz/ECkckzYTYeZUCa7t5xCuKaJZYkWhxD6UvTmItpSg3dmf53GTQa57K+RDC+xoUz+L75qOZOMIEEXzA4MprbjjSnRb5Ki+WYPSsE4hDajM7+Isz054FCQw+O3mNNNQgT1Qx+j8wHJoZa8Ge3TuocAKHEymAFm4OcbpWEJjOO1cbj1DomMWV/02HaaAm+s7f8SdjYJnNmn07BKEL/OF8JiZogO/nUBPs9ReLrfJh3PBNe7s45pghOQcNAEYcvROf9x6PXSf/ndjM4pDiO6Iru80IaYFSeRxqxzZvtBJRKmNQQ0RdQzMuny2aevzZPOAgq/lGNfIbqDZzC5LiaUk6ysBFWIodrUDCfChf71hG0OZFPtikHLDrGqdUPTJhEnXJH1Q86GK37iPxbiI0Yf98Zcc20H1H4lYmZKdg8ODDWTSJLlHwe2czT3AvchPJK3rCJ0cb0m/wyYHJEJNeqRNIPtAOs/E+LMqtk8zc6YUuPv0ultT+92Qx4K5MVkzaPvl3wbrZX+ADlgtbb7RjV0QpTw4q6oV5OwfODctmkrtTzSwRnGPMllFQUUqXJaOnuiIjat7ryRB8KFhjn+tQhqSY905uKuL5691D5QQjqc6pusBJDZYNNg7zzaU4NG/iEYMVGNPMICIfKeTtHz7ZDUcO3rNuf/0d3jMs0L0oWP5isuZlC6FbuidoliLm2Nqv26VvHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39840400004)(376002)(396003)(6486002)(4326008)(66556008)(38350700002)(83380400001)(7416002)(2906002)(66476007)(31696002)(86362001)(36756003)(5660300002)(26005)(52116002)(8676002)(956004)(478600001)(316002)(54906003)(2616005)(16526019)(31686004)(38100700002)(186003)(16576012)(66946007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WnRqZFFJeFRkZHpsalpjdkxIVk1leVE1eEtSd3VYSG5XSVY0UzFPZ25zMXZT?=
 =?utf-8?B?M2dVUHRicHRvdVV6TGs4aWxHeE9oWHZzdjB3MFhUYnhUUlprM0VCRGovWXBI?=
 =?utf-8?B?VjZId3pFSnA0N3B0eDBQcit0WFk5M2ErM3ptT0JJb3AxZzRZRi9XcGpVdVI2?=
 =?utf-8?B?NC9MWitpcUFVNVNMMFVKT09ZaFpuNGdzV1hScUVxUjViTDVYcUp3d3I1MzNS?=
 =?utf-8?B?Z2RVZ3hER1hnL2VlYUNKclloVFB6WUYwci9XRm9zRDJ4dG5NaTEzUSs4UEd5?=
 =?utf-8?B?bUxQNVovVUtkQmI1bVhQK3ZxdWNPMm9oVWhNamlVSGMxTWxEVko2TUMzOCt5?=
 =?utf-8?B?SXBwamZicGI4WnAzNjJwNjlEMUliazhhYkFhOE9LYjBSMklEdTQvOXFqKzFO?=
 =?utf-8?B?RDBobzFFcmpkQW5ybjVDa1lMTG1KV3JvM3ZmRmZUM1A1cnBISGFYU2xsaUx2?=
 =?utf-8?B?Qk9QcUxJZmhTUFhRL3hmVzR1K0J0b0NSRkFqYXErTk90bVVqZnk3ckFXMzlS?=
 =?utf-8?B?WkE2VVBnY0RNY0crK3F4U3dVbWxhWStrZUlTV1E3dEF4cW1QekI0c3hUL3cr?=
 =?utf-8?B?Zm5LVTFoQ2puN1VCeGlZRSt1QmdDRlluSFN5TDFvRDdKcWZYUkttVWhPN1RC?=
 =?utf-8?B?Rm5tc3kyM0RsOW9BTlhoRkF5VEF6bkxZUVg5MFVHSFZWSkxnejR5QU1ESzYy?=
 =?utf-8?B?Z2JwZjFBa3l0NTAwYU4xSVhGUE9ORVdRdEZkQ2x1ZzNUOVBsTjc5NzMwYmRx?=
 =?utf-8?B?aDlRUCs4VElQN0pDamxzblRaekh5aDNLZTFkUXFXS2Jzd1RUS244NTZ3emhI?=
 =?utf-8?B?Z1liQk03cFY3aXBCdU5mTHlQbTNYbmU1eGVoeVlRbk9BSWd1NGN5WHVGb3RF?=
 =?utf-8?B?ME9lK2t1ZjRuK1RBSEZtUE9XSDVJNlUzbE1aQWM0M2FTZzc1emRPRU56RWtQ?=
 =?utf-8?B?cWNFTWN3UHJsSGV0L0pLUzNWZngyTk4vcDlyaFoxd1EybDJtRitXZnZhUFpx?=
 =?utf-8?B?TEtUQlBDNktHaTU1UERTc2JTc0d1cldUeTJubmhUWUNPM1NFdWNrdjNQTHUy?=
 =?utf-8?B?NGxocFQ2RDBRMUN6TktlWmdrS1orRjBDUDM1QkNNWU03YW9MQ2pqK29QRXdS?=
 =?utf-8?B?WDdCbldHRm5vL3JyMlplRFpkMjJSaXp6N3FHVHdpTWFHMmdmV0ZOMmFMT3RF?=
 =?utf-8?B?TWhYSUJWc09keDFXend5bmo4b0xYWm45RFZyZEpnZWY5ZExnSXEyY1NUYm9V?=
 =?utf-8?B?MmpCbnlWZnFjZmRtM3BvMlQzZEpXS29rWTFtZE9uU2dlMnBGbVo0ajh4TmhZ?=
 =?utf-8?B?VWdGRXZ0cm9rOUdEeXpvQ2JucldXdUFQVXJwb2ZxZGdBSThJYTE5bmorOHQz?=
 =?utf-8?B?MDNxTzRLc1ROSW9seVhUTVRLOGxLcDZFRU1KdC8yT3IxV21oT1RXQWFkTVRD?=
 =?utf-8?B?UHhMRktvNGY3eGQ4WGdCNUxaNkRYVCtDeVpZWVREL3NTb3BCQ3Z2M29Ta0Ix?=
 =?utf-8?B?TTFtQk5IME1RdnhDenNQVXNEck43SFhSaWdMWDdMdjRvaUZIVHU0cGtiRm8v?=
 =?utf-8?B?SFpmOWFJRFVMQXZJdDlnRDQvS3o2dytDV0RyNTA0N01aeHJHYTNtVDluOTdC?=
 =?utf-8?B?aXdYeFZZMU9iWGYzS0tiNjZqM2gyaWNxc29SRTVsU3B1QThNSGdGemNjb3o2?=
 =?utf-8?B?SXlRQUI5c0lPTWxGNmVjQ0VxRFQ1ZXlUdVJuamxsM0s2cGtYVUZJRlhJTWoz?=
 =?utf-8?Q?SFU876oUMJlDbB4LEyT1x7MiJk5FxDFxj364EhM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc2c2f2-8f3d-429c-2b79-08d9050bb9a7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 21:23:36.9455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Np7fOMT2MillH6fdzPEcQq7CyHh1A2rGj2MrfBf0LvAunLuNl0Il0wtxMo44EGIn4VGp3MSGIF5RACl75aKpTqRi2KK7UeSbmO6UgafsrHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.14.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

19.04.2021 11:55, Emanuele Giuseppe Esposito wrote:
> Reads access the list in RCU style, so be careful to avoid use-after-free
> scenarios in the backup block job.  Apart from this, all that's needed
> is protecting updates with a mutex.

Note that backup doesn't use write-notifiers now. Probably best thing to do is to update other users to use filters instead of write notifiers, and drop write notifiers at all. But it may require more work, so don't care.

> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c                   |  6 +++---
>   block/io.c                | 12 ++++++++++++
>   block/write-threshold.c   |  2 +-
>   include/block/block_int.h | 37 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/block.c b/block.c
> index c5b887cec1..f40fb63c75 100644
> --- a/block.c
> +++ b/block.c
> @@ -6434,7 +6434,7 @@ static void bdrv_do_remove_aio_context_notifier(BdrvAioNotifier *ban)
>       g_free(ban);
>   }
>   
> -static void bdrv_detach_aio_context(BlockDriverState *bs)
> +void bdrv_detach_aio_context(BlockDriverState *bs)

why it become public? It's not used in this commit, and this change is unrelated to commit message..

>   {
>       BdrvAioNotifier *baf, *baf_tmp;
>   
> @@ -6462,8 +6462,8 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
>       bs->aio_context = NULL;
>   }
>   
> -static void bdrv_attach_aio_context(BlockDriverState *bs,
> -                                    AioContext *new_context)
> +void bdrv_attach_aio_context(BlockDriverState *bs,
> +                             AioContext *new_context)
>   {
>       BdrvAioNotifier *ban, *ban_tmp;
>   
> diff --git a/block/io.c b/block/io.c
> index ca2dca3007..8f6af6077b 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3137,10 +3137,22 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
>       return true;
>   }
>   
> +static QemuSpin notifiers_spin_lock;
> +
>   void bdrv_add_before_write_notifier(BlockDriverState *bs,
>                                       NotifierWithReturn *notifier)
>   {
> +    qemu_spin_lock(&notifiers_spin_lock);
>       notifier_with_return_list_add(&bs->before_write_notifiers, notifier);
> +    qemu_spin_unlock(&notifiers_spin_lock);
> +}
> +
> +void bdrv_remove_before_write_notifier(BlockDriverState *bs,
> +                                       NotifierWithReturn *notifier)
> +{
> +    qemu_spin_lock(&notifiers_spin_lock);
> +    notifier_with_return_remove(notifier);
> +    qemu_spin_unlock(&notifiers_spin_lock);
>   }
>   
>   void bdrv_io_plug(BlockDriverState *bs)
> diff --git a/block/write-threshold.c b/block/write-threshold.c
> index 77c74bdaa7..b87b749b02 100644
> --- a/block/write-threshold.c
> +++ b/block/write-threshold.c
> @@ -32,7 +32,7 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
>   static void write_threshold_disable(BlockDriverState *bs)
>   {
>       if (bdrv_write_threshold_is_set(bs)) {
> -        notifier_with_return_remove(&bs->write_threshold_notifier);
> +        bdrv_remove_before_write_notifier(bs, &bs->write_threshold_notifier);
>           bs->write_threshold_offset = 0;
>       }
>   }
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index 88e4111939..a1aad5ad2d 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -1089,6 +1089,8 @@ bool bdrv_backing_overridden(BlockDriverState *bs);
>   
>   /**
>    * bdrv_add_before_write_notifier:
> + * @bs: The #BlockDriverState for which to register the notifier
> + * @notifier: The notifier to add
>    *
>    * Register a callback that is invoked before write requests are processed but
>    * after any throttling or waiting for overlapping requests.
> @@ -1096,6 +1098,41 @@ bool bdrv_backing_overridden(BlockDriverState *bs);
>   void bdrv_add_before_write_notifier(BlockDriverState *bs,
>                                       NotifierWithReturn *notifier);
>   
> +/**
> + * bdrv_remove_before_write_notifier:
> + * @bs: The #BlockDriverState for which to register the notifier
> + * @notifier: The notifier to add
> + *
> + * Unregister a callback that is invoked before write requests are processed but
> + * after any throttling or waiting for overlapping requests.
> + *
> + * Note that more I/O could be pending on @bs.  You need to wait for
> + * it to finish, for example with bdrv_drain(), before freeing @notifier.
> + */
> +void bdrv_remove_before_write_notifier(BlockDriverState *bs,
> +                                       NotifierWithReturn *notifier);
> +
> +/**
> + * bdrv_detach_aio_context:
> + *
> + * May be called from .bdrv_detach_aio_context() to detach children from the
> + * current #AioContext.  This is only needed by block drivers that manage their
> + * own children.  Both ->file and ->backing are automatically handled and
> + * block drivers should not call this function on them explicitly.
> + */
> +void bdrv_detach_aio_context(BlockDriverState *bs);
> +
> +/**
> + * bdrv_attach_aio_context:
> + *
> + * May be called from .bdrv_attach_aio_context() to attach children to the new
> + * #AioContext.  This is only needed by block drivers that manage their own
> + * children.  Both ->file and ->backing are automatically handled and block
> + * drivers should not call this function on them explicitly.
> + */
> +void bdrv_attach_aio_context(BlockDriverState *bs,
> +                             AioContext *new_context);
> +
>   /**
>    * bdrv_add_aio_context_notifier:
>    *
> 


-- 
Best regards,
Vladimir

