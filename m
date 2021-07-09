Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE6B3C21D5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:51:32 +0200 (CEST)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1nAR-0003ru-8F
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1n9A-0002Q9-9N; Fri, 09 Jul 2021 05:50:12 -0400
Received: from mail-vi1eur05on2105.outbound.protection.outlook.com
 ([40.107.21.105]:55390 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1n97-0007Lw-B5; Fri, 09 Jul 2021 05:50:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJ9HTpbCHj/RgCKNVFG+OyzeXAqckeBRB3trFnUmGGm+G6COgnVVJseq2x4GpUgsVc5+dzvH8Bi7r83UAfec2gllXzc0McvrCEnHREdfsU3V1ytH6R0ZJpFT2hoQQIKi795RN/41i7/ydGxpYUog1QzHSTtCrDDmPYPGU2jfjU7Af2Ikr5v7IqwyuAv9wcZC9An2HqxTvaTmndo3WBJt27kSZs0ckp2gPHXrUN5RYjeVWMD0gz1z4yTONYCgWJ0dgBSvm27qO3FyM08Y4wxGT7+bP9hW+RrJy6P3rNbZGpJxj5oV8V3iDoLspzkhd/uyUtBOUyVgdcTApxJTfwTLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUMKxM2FrrKT0uJkDoP4l3+g67e4XrTvJx+T5l38VGM=;
 b=I16CqiTcFTnK8ZZ19w1rMuKP36DO9BgspLEiwfmNI34l+DVlDMIS+KD9mCCeCcmcKiYhtpszbdqe0Z51tJ/jfZjLkM+quMWSimHc6Bw76yTpEzk+3odxiwreeJy23WrI6MxvCgQRzBi1I+qBFedpuxsRGReqGIXFWOSVrS3ZnHilwC1Emvuigo6s1uwrFDqByzrmHxOkIkiCF9rhCy0Tr9EtfM90nZphVFn2fAT0yq6SQAge1gexRqdWcPvS5f1Fh/H1hYq6nyQIaqQGYTDc8oUYD7vHxgySSSw8EOIhuS1jE7nIjAsCKybPKZF7aywDA8tXTJA1UW7jFzPWKDOSBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUMKxM2FrrKT0uJkDoP4l3+g67e4XrTvJx+T5l38VGM=;
 b=sdHwn1avLuMEfP8KR5trfYcMLr6pWxF0Ol/il3tzuxy7sBwnIVbsdZYYb7wjGVY3UFLkHDEajokeNXxDqHtMHV1/EHwILMj5AuWLNz4XL6h6/d7fKk6xr0PPM885RmsPWb+drz3N6EJGku7hRAu9PWct7O8Fpvn44u2W3XMXDT8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4342.eurprd08.prod.outlook.com (2603:10a6:20b:b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Fri, 9 Jul
 2021 09:50:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 9 Jul 2021
 09:50:03 +0000
Subject: Re: [PATCH 0/2] Let 'qemu-img convert --bitmaps' skip inconsistent
 bitmaps
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: nsoffer@redhat.com, qemu-block@nongnu.org
References: <20210708013001.2576991-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0fdc2429-6ed9-dacb-d3f8-4505c8089272@virtuozzo.com>
Date: Fri, 9 Jul 2021 12:50:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708013001.2576991-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0401CA0088.eurprd04.prod.outlook.com
 (2603:10a6:7:54::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 HE1PR0401CA0088.eurprd04.prod.outlook.com (2603:10a6:7:54::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 09:50:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9a4a522-7f50-434c-6540-08d942beecb9
X-MS-TrafficTypeDiagnostic: AM6PR08MB4342:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4342E881110D767E8D3354C2C1189@AM6PR08MB4342.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulVfKUyI5ZdYzS6Aq+cSeBOfFHT7KqbCcVwyqopvDPoGxwKgHDjS75Vy17uhtDaXJhMR7er+OIaZkBgzbzqomX7mAKMQmSkcW1sccP0E61xsRkwQL0jofZF10I2TadZPJfYYQI7WRhzwqoHYslm6ZrgzWvnYq45C2YGqJnqbAB0sHwLreSqIPMexamcaTZeOqOPQWMYxP/m3aoLGZwupQK9g5x3jcJfBtokoXIn5Iu+abG7eje1qnsgdzjiYwEj9NxeW20Se+QddH3KkFfWMXjVvlO12kJfDrG1Me14uDlfNbFSRjcQhEdM79vqhY+T8DXsuLFgbdDce3MQWvCixVN2K1kDHKoLmHcWHCPf8H5s4qMPIN8PJyyhEtOM0yhkPjOmF4T7XWxB5kNoJ2oOcDeSthXWMKwXrrcnV8N+83Sl6BGC1dw6G3jiDofo0FbBO9QG5DM0Dv+sFCtAR5vmX094Wxc15o21qobnwO9NLf7aiax7MwRtaBpxESjTTc7Und2CvQftqaoYFKEtlGzD5DXUNHw6QHm1dqUKhCP7727mTsnYXtbLMXNUVZDaNDESn5n/0AcwCpOagasb7rRjZax9Hk+SKnMQOG03FCK/oAEIV2PTL/5PpArR57pcTQFSIs7Zj/r4D8AnTf8s0K3EoNh/xDM339oOYT2rJWrP10Ifd+Tb0y9cDf+wOafLhyXzZucYcuuoA5J7D7FyxjBVUQsLEEkEeapRTeOfxOqA5gm4aB0N2nfDUyXjzuNfKJVtUGOkML03wCwkVoagMUruoYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(39830400003)(376002)(956004)(2616005)(316002)(16576012)(5660300002)(66946007)(26005)(52116002)(186003)(38350700002)(38100700002)(6486002)(31686004)(36756003)(8676002)(66476007)(66556008)(83380400001)(31696002)(478600001)(8936002)(86362001)(4326008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDV6SGlrUDBGVEVIa0tsd1NwUUZLanlYd0k5MGFUZDhHUVVweVNUNW5ma0ll?=
 =?utf-8?B?Z3d1Zm5UQnJySGMrSUZKMm1vd0g4OW10NG1TbmRlSmw1SlFRelpmR1VoaDNj?=
 =?utf-8?B?N0FKNzJ0eFhKMFJyNDZZZ1hObTB3VXdwUytuU204RTFjamRhZTlCT3NTQ2E3?=
 =?utf-8?B?VEpReEZLd1JmVTZDTFRNYWR5SlBSY2o0Z3hjQ0Z5TUFtZlJRNklOS1R4VWlj?=
 =?utf-8?B?eFg1VkI4T2JmV0dMOVpyVGNyUllxck1VeXI2Y29zNURMZkwwcno3ZUJIeFRI?=
 =?utf-8?B?TERIMnRTeW9kT2d2SHluSHYrRW1RMUxXdnhNdHU2OVNmOG1CRWNDNCtEcnhD?=
 =?utf-8?B?anNQNTRIUlg3aUt6YlBIcU96MEttbmxCWG5ITENUWkZlS0tKYndMMGJHZXor?=
 =?utf-8?B?MDBlQnJKa2huVFduVm5BZkd5Kys1eDNoVkVRTVBWUCtLcG5lWkd2YTNTa2hU?=
 =?utf-8?B?NC8zUitjSEplVTNYUHpNSTYva3JwOHlHN2J1SU5uVVcrUFZXWTMybXkwVXVj?=
 =?utf-8?B?NmlOL1pJeDdTbUF4MmpZZld4elBWSTdwTFpIZFpCQ1BaOExBcGtMN3BhdnA3?=
 =?utf-8?B?V3JDRkpLN0dGNlpzQlVhVkJSdS9BWnp4NDBsby9LLzZTd1N4M2hRdGV2MTg0?=
 =?utf-8?B?bUxucTJrdFZSc1AwekFteHN1eGNYQmc4V1RYVlJHYW1MRnAvclMySU5sdS9H?=
 =?utf-8?B?OTl4cXpYTjRXNTczNUN0Tm5CZ1lVZU9PUlFkemdwQ04rYm90RTRBemU4MzFz?=
 =?utf-8?B?WlBOQzFlaDU3dGtsbUhiOTNFb2RwaGY4WEtOOUk1MGtzVzQ0c2FFc1BPcFBz?=
 =?utf-8?B?Rm5FYWppSkpoKzFYZjNCbDZsaFlzZXJGd1ZiQ2U1UUNxWUptSVJ0VDl0cnpL?=
 =?utf-8?B?QWx5MENveVZ2M2xrVkxSVHIra051a3l0S0s2WW9EcEYvSE8zd1pnckdZcmhS?=
 =?utf-8?B?SWxTMFNoUHUwRUowNnFaRVhWbDZpYU5MOEQ5cXdSeVZzbXlYZUZ1QWNrSnY0?=
 =?utf-8?B?ZlZYMTZsKzRaSmNqOWVDNW1YelJ6dzdVNUZ3ZUdLUEMxZmtIUjFrSW9aZ2du?=
 =?utf-8?B?NktlRmlkQWpsSG1xL0tUYktlWlJhd1c4WXM2U1lxU1pnbXY1VEhIVFhTYk83?=
 =?utf-8?B?aXVpdUVlSCs4ZDU2QTUzQTBHOEhHcjVocDlLbTRFdGkvZ1RORTcwLzJ1bTlj?=
 =?utf-8?B?SFhpTEJzWjVocEpMWUxqNURubjJlZ0lvd2NpRzhGa3VuQ21rWjh1NkpCUkx4?=
 =?utf-8?B?bUFHZ2pJdlZCVkFoSlk5TThpR0hiaHdkdm5mMzgwSk5RY3BHdTlhcTZ2U05y?=
 =?utf-8?B?SzJ3ZTI4UkxoRFJEMklQSFYyRTB4dGxvM08yN2ZoVnAza1ZzVE9RVERKeGkr?=
 =?utf-8?B?QzJVYTdUYWtuTmxXeWJNNHVUWmhqc1V0UmZxOEJ0WFZxOWJ0Z0Z6c213OThw?=
 =?utf-8?B?ZXdGZTNJRllLUTVMb2gydi8wbXc3amNRTTdqblZxZURzdGV5Ym0vSVdKK3Jl?=
 =?utf-8?B?Z001eXRlL1VUR0dNV3hXQk9jb2RDM1UwcVAzU3FFTksxaE9ScncxS1B1L0NE?=
 =?utf-8?B?NktqUWN3Zzc5TmZsSWxLNmQ0bG9Mc0JZQVJWQWdhQzVSM3g4ajM1Sjk3Y1RJ?=
 =?utf-8?B?M0JBQmhMcVA5alFPdkFMUE1qb1k5eDlUaUR3TEk3dThXbkpiLytMaWJiRUpB?=
 =?utf-8?B?UVkzcW1LS0xFNHNNY0hrNFo4cjBCVUZsM1A4NmNvVUJsOGFTY2FQcnFGS3ds?=
 =?utf-8?Q?7SpwtLYexkVggY8GCvH9aTAS/vihFvJ76/HV7Yg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a4a522-7f50-434c-6540-08d942beecb9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 09:50:03.8252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93TDjToypWQVIxjgxZmoeN3YrzehzywNoCanns6DUwUcRAiC4yzkK7zhPioLcXG54P1wCGJcnWs7Wu9g96ApmZcQcaKLLFlDc06JoqBzTbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4342
Received-SPF: pass client-ip=40.107.21.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

08.07.2021 04:29, Eric Blake wrote:
> This is mostly a convenience factor as one could already use 'qemu-img
> info' to learn which bitmaps are broken and then 'qemu-img bitmap
> --remove' to nuke them before calling 'qemu-img convert --bitmaps',
> but it does have the advantage that the copied file is usable without
> extra efforts and the broken bitmap is not deleted from the source
> file.
> 
> Eric Blake (2):
>    iotests: Improve and rename test 291 to qemu-img-bitmap
>    qemu-img: Add --skip-broken for 'convert --bitmaps'
> 
>   docs/tools/qemu-img.rst                       |  8 +++-
>   block/dirty-bitmap.c                          |  2 +-
>   qemu-img.c                                    | 20 +++++++-
>   .../{291 => tests/qemu-img-bitmaps}           | 17 ++++++-
>   .../{291.out => tests/qemu-img-bitmaps.out}   | 46 ++++++++++++++++++-
>   5 files changed, 87 insertions(+), 6 deletions(-)
>   rename tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} (88%)
>   rename tests/qemu-iotests/{291.out => tests/qemu-img-bitmaps.out} (76%)
> 

I've applied this onto your nbd branch. This doesn't apply on master.

-- 
Best regards,
Vladimir

