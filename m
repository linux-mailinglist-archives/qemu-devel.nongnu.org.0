Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8A2391265
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 10:32:45 +0200 (CEST)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lloy4-0003Ck-Kq
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 04:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llowl-0002OG-Nc; Wed, 26 May 2021 04:31:23 -0400
Received: from mail-db8eur05on2095.outbound.protection.outlook.com
 ([40.107.20.95]:18899 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llowi-0003HO-7v; Wed, 26 May 2021 04:31:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTiTHLpKdp/jWYYrnQOSbNw6WBkM+gn2TOBiDqhXtNuzmWEK9ZSnT8MV/KJICrgRjUPZlwEliGjGUts0Bc0xXyjtADJEtvTS5WRcbwTxIv7/l7+YmEdl/rUr93Cwf2gx43loiQHZRD3/zxHTNCnMeCCAJIbx9rpWp8G36FOnI1jydXViJzZUi3kBidg41X76RBZMvyh+ZMWVdQvryTqZhQYpNn+az+xSf/8fK+2/s1UTndNo1Nktm9z3Ch2wN65wxeT0SOELpgn9KT+nu6SgRMufRrVAmgNh/k7pxneGjHZ0cJJF3jEqoEQWZcnEVxcV+NXwZx8ZlUmtgSzV2I87xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L51TtPYj9kHTcnbKF/XLiVTSoXjkVXmR0zpZ7oxY+7U=;
 b=SQ603tSWlPqJSA9+X1MWSHu9t/ar6DtjpoeGj6A+pm2cO++ET8iJXTdV/bjPPkbAMhxCEMWSpcGyuHsIx0BNmHGT2bNajvzp5jcTUEPs5jyGzhUjo7n2HjoNhyIfVFV41WSl9gwec028UMorkgCUep/a1t0ccU/lO6kMHfbMJARqB8lfwvVKyc/zMTqd4rrCanZElCi6SB0x4a02+2Km5xr/EkTc28kX0sNdpLsZ6C7vgzwXtHnEIaiu5YH7iOCBNH7C6/YaRSVc5Q4J3t4FnVmBszl8NsKzbtogccMp+LytH9PTP0YmWJPsOqyO4X4E8c6dRmzqoATaniDeltxqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L51TtPYj9kHTcnbKF/XLiVTSoXjkVXmR0zpZ7oxY+7U=;
 b=njRKrLuo6VZkUIGQ4vw7mB3IR+0k75IhgIPPq+KmQLQY4HLgT00rSTR0FbEWzaot+tVPFR/+g8w72EYH5xmZX0hPFqDdCorY+s7iMBn869WyjLIuyU5bMStqtlafqxQRa6gyyEKwlQHGXmskMK8akpHN+77Ec234GROxcStXmNE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 08:31:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 08:31:16 +0000
Subject: Re: [PATCH v7 13/31] python: add MANIFEST.in
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-14-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <da420bbb-6ce1-6119-d921-20f8c577c6d4@virtuozzo.com>
Date: Wed, 26 May 2021 11:31:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210526002454.124728-14-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM8P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 AM8P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 08:31:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b08775e-ceb3-4567-f256-08d92020a105
X-MS-TrafficTypeDiagnostic: AM6PR08MB4070:
X-Microsoft-Antispam-PRVS: <AM6PR08MB40705734A5863932B2F61C64C1249@AM6PR08MB4070.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z6E6wtGvC0HAs3v6f8Odw+UrDU5B4e0Kgd+rQO6EbYla1uXzPS1zmW2t/Sb43rVP5FgguiMZMmi5BipIcAe1ke/PgSghH0uuEMpOX0sz2jMGXA3CrK2EzbU6K/cErgjMGCcwRaAmuog3RzNeyNRYBDFVxRS6cnRRWQGv/AztjsfTsKXQdizo6xxC2UPOj8mTSSByX4V/AXmbvwiAbZREOj19ohLfXunp3d4122nnraQA1pCiaAHgazRkbVre3oaRBsbuI8qMoesDZ8BP9TgBoVmd4YVtVFPTVVfGa6mUg0XhLPz0+mnpZBPihxmdH7uTc3Dh1scFmjOfhaBpKaxPHe/osuSXJTnMHSLCy9cpslAtga+KXK7Ll/e5Rok3xok8YtoWpAH2TMimcXD5CTPvaMKtNdhtij4lCjbUIU9SkPoelidLBUWvpfRJ1JO+bvCYuQCjPt8crOiwDIxRO0FwSCy0B9lkq+VAVfnEhwcObg5ZC+UCi3pQN9/QwKBDS74t4YB6D+VYuzyUycs1+r3o2mwqCpjAinnoDcQ6GSdOdl0fYAoPXxAmc/hJviR+hxe3hHo89JHSVrwfc1M36hbyAicW+o2brev2GRnhfBLxtceuSsmoMW9f1036kELaBI7e+sj90hAes1qhXWznSULEPCWoT3U9/Zj6VCBHS7dbvNSrvPiRK129E6RB50vb0nDifswDIc9nf9JwQCNDFyx8TDPQf94sXCUcXmzRpPQPeO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(346002)(376002)(396003)(8676002)(36756003)(52116002)(8936002)(956004)(16526019)(2616005)(16576012)(66946007)(7416002)(66556008)(66476007)(186003)(478600001)(26005)(6486002)(2906002)(54906003)(86362001)(31686004)(38350700002)(316002)(5660300002)(38100700002)(4326008)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aG00Ymp1ejNPNlVDTEUzSHo2dTNsTEwydTdIUytDbjlYWVRMV2NEdEdyL0h5?=
 =?utf-8?B?d3czaTFoRHNhRXZ0VTdGWk9Na2RUTVR6TkEwZDQ1Z1lPRHE2OU5Db1RYNUlp?=
 =?utf-8?B?bEcvWnRrK2lMZXZ1QkV6cnp1ZGlTdGFCRzB3RHFEamREWGl2L04rcmIrVm9k?=
 =?utf-8?B?cElyeDlwVHp1ZzNZS3RMUElMamZmdm5LUXQyQk1GMjhnRFNnR3V1ZWZtSTE2?=
 =?utf-8?B?aWtyRjZKT3hWbENpUkp6cnVOUktJUU81NnVPY1JJQ2hiTTFjNXcrQ3BDRnBm?=
 =?utf-8?B?anNaY1pJNHVVV25QNEJiUm5GNzRjek5XM3Q2ZUFNVHIxeUpDNmcyR2FnaGI2?=
 =?utf-8?B?VGhTUWpkUUhONUgvaTJoV1Zjc292dXdHaVdQT0JLZTFpL0hqbW43YzNhek92?=
 =?utf-8?B?SENrWkc1dzBuOTNhYzg4QzBVeDdTL3J4dkFXTENnMDBGODkyMUVicVkzU0lt?=
 =?utf-8?B?TDJ2ZnU2VERPTjJoajZMeThIK041ckFZYzR2cEZucjJjVkJIeW1iNXhLN1VY?=
 =?utf-8?B?bmU2WGw2MUUrbkd6VmdvQ1dZdGhsSk85NWN5RU1lbUNUaGRhR0ZoUm0rNWdk?=
 =?utf-8?B?dUpLRnVxRjFUUGpqcjhrSDV1TVBaWTBoSFkrQ0ZObnkyeXdiU2NDRTJOeTNo?=
 =?utf-8?B?SGIvamdhM3VMei9wMmI0RzVMOFpCNEpJWFZJMjJuU0J4Q3lIRGt1UjlFMng2?=
 =?utf-8?B?RVRtRzNrMkJicDRzK0NtSEl5bU55V2lqa290UTd2MkR3R2tKTW1mblZjcGZS?=
 =?utf-8?B?M3ZiRzNwRk9zWmZVUzVaQjJSZ3JBbXUvck9rSkhreVYybGVwdndoSEIwemdz?=
 =?utf-8?B?QUV1Q0pFTWxiQVMwMWFIMGRQVEtjY3NvQXdsMkdWZXY2NzBCakJTZUV5djls?=
 =?utf-8?B?a09vZmR5dmxCeG9kcWtLWllLNVFEUzR0TE02aVZwNXdiRWxTQWJEdmY5WWVr?=
 =?utf-8?B?L2J3TUp4VmZvR1l2N1RjWVpzcGVWSVpzdVB2cGh3TkhWT1dZS0hNR2NwMEFr?=
 =?utf-8?B?b2tRbEFaU2srTWZFc2Z3ZTRtZzlTaXN3WEcvTVE1ZGF1UGtVQjZ1dlVHVzJp?=
 =?utf-8?B?VG1aVlJ0MlhnK0Z2V2J5bVdPNTErZTVRLzQ5YkNvRFc3eVJlOUNOT1lRamJH?=
 =?utf-8?B?dVNua0pxNUlYT2I5QlM2aUlsSm42RkpqTzdLNUN5MlhmREpJMkZFTk1WWGJx?=
 =?utf-8?B?MnhGODdJQWpUbzVFVXRsZlExZW1BQi8vV3l0YUNjczFRNjA5M0JOVkxkZk1M?=
 =?utf-8?B?bGRxbTFEcVg2eDZJUXpMWjhmK2c1VldzZkJCNTk5VmFrOElvK1FMbWl1Qnds?=
 =?utf-8?B?cHVFaTFGUWVsaUdUNHlYQXU0dWs4czQ4b3VQTTRGaVo4bnJidXNFZzRBbmtt?=
 =?utf-8?B?amtDckpOVUdCQzE2dVFONTdCWnJvY0NEbXo3K0lXMzhuMnJycWJGSGZjakxz?=
 =?utf-8?B?QmFOWG1YelN1Q1NFbDNqT0UzblNNenY3RXpqOW9kODhyUE1VclBKZDN4NGwy?=
 =?utf-8?B?cTRDdFhmMnVjUHpVaitBdStWVGJaNkVHMWkxMXh6S3lIbEljNTU5MjRvVDk0?=
 =?utf-8?B?aHhDdjFDV3VIVERKeEQxLzlDcnRkV01MT3FOSUxrUDlOTkdpYWZnbm1DVjIz?=
 =?utf-8?B?MlFXem5UZ0l3ekNHbWdsa2FHTHRhVC9HNjcvQWVHckMveUUzZURIeU42S0Uz?=
 =?utf-8?B?SjlaMDFFZmhuVDl5d1I5cXZndy9GZUtpUEkxeHNZQzhTMXM2MHRoMVNuVFZZ?=
 =?utf-8?Q?VwEacJEZmQ67C9CRnzmYZxiAe4SUE7wFEkipiS1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b08775e-ceb3-4567-f256-08d92020a105
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 08:31:16.3444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZySqKYjhJm11j/i+r8mIUxwG5aNmAThp5kkgptuBSnJBwSiLaL1MvXRxqeFZJmrONNZijG6dJLfJPy+kAlnKRQeMqqwoytTIl1Wowxy5rZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Received-SPF: pass client-ip=40.107.20.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

26.05.2021 03:24, John Snow wrote:
> When creating a source or binary distribution via 'python3 setup.py
> <sdist|bdist>', the VERSION and PACKAGE.rst files aren't bundled by
> default. Create a MANIFEST.in file that instructs the build tools to
> include these so that installation from these files won't fail.
> 
> This is required by 'tox', as well as by the tooling needed to upload
> packages to PyPI.
> 
> Exclude the 'README.rst' file -- that's intended as a guidebook to our
> source tree, not a file that needs to be distributed.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/README.rst  | 2 ++
>   python/MANIFEST.in | 3 +++
>   2 files changed, 5 insertions(+)
>   create mode 100644 python/MANIFEST.in
> 
> diff --git a/python/README.rst b/python/README.rst
> index 38b0c83f321..0099646ae2f 100644
> --- a/python/README.rst
> +++ b/python/README.rst
> @@ -33,6 +33,8 @@ Files in this directory
>   -----------------------
>   
>   - ``qemu/`` Python package source directory.
> +- ``MANIFEST.in`` is read by python setuptools, it specifies additional files
> +  that should be included by a source distribution.
>   - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
>   - ``README.rst`` you are here!
>   - ``VERSION`` contains the PEP-440 compliant version used to describe
> diff --git a/python/MANIFEST.in b/python/MANIFEST.in
> new file mode 100644
> index 00000000000..7059ad28221
> --- /dev/null
> +++ b/python/MANIFEST.in
> @@ -0,0 +1,3 @@
> +include VERSION
> +include PACKAGE.rst
> +exclude README.rst
> 


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

