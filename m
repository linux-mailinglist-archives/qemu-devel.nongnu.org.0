Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CD49DE5F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:47:20 +0100 (CET)
Received: from localhost ([::1]:51162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1N9-0000Td-VL
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:47:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1nD1JT-0006QH-58; Thu, 27 Jan 2022 04:43:31 -0500
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:20651 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1nD1JQ-0001HJ-Vb; Thu, 27 Jan 2022 04:43:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+gl4APKSio7nlwcbgGm5G21OxZVLgRS1vkAPD2GmMBCa0/qt/QJ3E4ChSp96+t1s6Uy6fmlbFEbVMbl80y+CcJGUBU7FntLX+1HwbZFd2KhL+7xYhejm/vK1UwGG/x1hW3mUzM190bAV+t+Lf3upGx4sda1JEnh/CIDCLSH/3TotyBxoLr7OgVOg6XbW1DdC/ywVZyfGrlpvqSK86f2JGFJRWrUh2IgJMO1SRdhHH5ZH0Fkg4T3TSPMcVwAU99SgTe45gtgxtQ+e5wOx8ONezizw262aSNw/dt7fAzcJTFChiEwDF0BFbWqmPniuOdg9IvhvS65BILRQkR4a6iIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gttI68cBIW9y+gOsYwTqquvhImVcyNV66c5lBTr+QXk=;
 b=W9lCHYrvEsOt2PZ2U9SUl+q2C3XXQk/jYdqRji4mCxbnGGYDaB0+zsVzt1sHu2gXhzjeTErDugV5E8Y7xm9jzSITTV0DaAvfuCBbSzclUPXWFoikfZvCBDLtoQb3uLCAjaKJagsI+ME9cLh/6UsTNFUTwo0aS3VWp1+qBTHEPGlE3sz0a2dQfSr50Q70dM47ENEY2bbRwkuxcRjKDnAQ4r91hYfCJeAc2YXV/LOzAsbFB9f9U3QUcMRAh2OAcicaExfIKyGa09F7HhRktUOyhYfQuWDOn6nKxcprVMMw7cTDf27L73Q8LzPU2Phhqdtkw1DhYkNRpU8GSvOfdwzLCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gttI68cBIW9y+gOsYwTqquvhImVcyNV66c5lBTr+QXk=;
 b=KSwmA2itfNG4FjzDBD9mnxCkJT8rylwveRlI2vSDbBjgKF1gnV2hFWpsBu0WSbN/HlzgovmER1R1hkpe5NzCnhfk3kKDTgjNMFvzYPc3A2CMSloRjtVO4kOqmywXevNYbLNgx/yZDudaU7DZDMbCQ3rF+Rr/4acF8eSJ+qJOjbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB6PR0802MB2374.eurprd08.prod.outlook.com (2603:10a6:4:8a::21)
 by PAXPR08MB6544.eurprd08.prod.outlook.com (2603:10a6:102:157::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 09:43:19 +0000
Received: from DB6PR0802MB2374.eurprd08.prod.outlook.com
 ([fe80::fc34:de47:7888:2b4c]) by DB6PR0802MB2374.eurprd08.prod.outlook.com
 ([fe80::fc34:de47:7888:2b4c%10]) with mapi id 15.20.4909.019; Thu, 27 Jan
 2022 09:43:19 +0000
Message-ID: <43532595-3327-c632-1db8-22a4168de841@virtuozzo.com>
Date: Thu, 27 Jan 2022 12:43:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2] qcow2: add keep-dirty open option
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, den@openvz.org, igor@virtuozzo.com
References: <20220120162043.2693196-1-vsementsov@virtuozzo.com>
 <20220120162043.2693196-2-vsementsov@virtuozzo.com>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
In-Reply-To: <20220120162043.2693196-2-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0701CA0031.eurprd07.prod.outlook.com
 (2603:10a6:200:42::41) To DB6PR0802MB2374.eurprd08.prod.outlook.com
 (2603:10a6:4:8a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 436b175e-9e78-4994-17cc-08d9e1797369
X-MS-TrafficTypeDiagnostic: PAXPR08MB6544:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB654428B5018D465363F58ED3CD219@PAXPR08MB6544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WBQ3/j/7RX4BdrqNQLsGCNpWB/VZF61Ok1WX8TUry514u7x2p6d68Kdv0Rx5rr1F+69pAwNtdhMYQSNG7IzV9zdXvRiB+YSeeLyUUfx028Q2yDOCZToJ5AWUKq6N2FqBCNpUf20qQKcTiqnfKm+r4J//KA42IBe4WJ7/5e+QR3QMJZETsuauiKAA99DxoX8sbqStlGtwCV5GtdZmngNasbJB1s83S2g0u6SnQr9G2AFAfnTNFv6v4aXmrJIzE2yzeKWe80K35/J54HwWXqo20fu3S1kWApdjbr1bwH7McBWjt8nXwjfe/HYQcwSPkoHD4UuMtfVnk7estTB3Oih7OGM2rZI10zOyEDOQoVxBGwj/TlOb9chR6CFKlGVWDeqOhL/B8b+5dyZLbm5t5yZomHMHlhNFBmRHUhaRYy79n/f05Giv9eJoOLZsGm37LaSKly5MTIkTRM3a1fmRYOFVL2BZLzSPeOx5QwUiL7VHjL6Esa3r4H5xxZYmtIpaM0pDxK3d03F01T41wDlQpMtg8mUMXs3qFyogllefWC3CFcG8nQO4KvvAbERthC7F/XT+BhLthy+9g5KKq83ZSMKN/nFD1NTwU2wxAgZG8X1Jy2IAmqCV8CET5aAtc2rcsJ30jAZo1hNeBkNpVG8U21wf+YVMmADl4Yv2EY7bc+WKLYhCAshiYBpnZIqAFNQWbl82bku6aNwLv5GwWSCvHnntjbnNskep27xpE2ICZz2INw5ytLFPzc68h5U8LpCfVIJZyHQwScODKcMZz9hMvDNzZEWupeyb5kdnPF82L8vp9lE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0802MB2374.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(2906002)(31696002)(31686004)(8936002)(8676002)(316002)(4326008)(5660300002)(6486002)(6506007)(186003)(6512007)(2616005)(26005)(508600001)(52116002)(53546011)(36756003)(83380400001)(38100700002)(107886003)(38350700002)(66946007)(66476007)(66556008)(14143004)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEVvS3NVOXZLMGEzRXhudkFHbXV6ejFSVFlqTUFwUVE3MGgyMWxNeEs3SDBv?=
 =?utf-8?B?ODdMNWJXZGd2N1B2dENYUW9iUkJOMUtnNTB3UWc3cGJhWldCNkpvZHlJTVZx?=
 =?utf-8?B?dFhkUEwyWUN2Z0JBWWhjZXY2eWFLUlozYzlGMXFhRmxVMUp5d2Z3TEN5d1Y2?=
 =?utf-8?B?dTZ6QkRVSTdVNmc2VXc2MStyQWZDQW9yU3RsSHZ0Y0dsSEZWL0dzZWV4U1Rs?=
 =?utf-8?B?T09RUGdwUHVUMklObG1RZzFwaE1qbjRkTnJXcTd4dGFia0dkVS9RSUJMWExn?=
 =?utf-8?B?ZmNpWFFMNVFsdW92N1VNR3AvakRvM0xVNEFhQlF5c1JtS1M2d2ZKOXA5cG9o?=
 =?utf-8?B?RllzNzJVR3VVamdIdGQ3a1lIblVKdFNaczZuc2NpSkdwclZFRzFxdFo2Um02?=
 =?utf-8?B?Y0drdGZkWEJBVFlSNUlHK2UzZG1xVERGM0svTmFCZjNwZjBjUjJnZ3lVbURC?=
 =?utf-8?B?bjMxWFVoOEVTa1JNVzYvQU0xblZZanRldDU2STRuK2Nlc09XaFZINnRYd1My?=
 =?utf-8?B?TFlvS2ZKT1BPcmdzK2I5QzVWWXFEY0FmNXUyMDYvMmd4Ry9weGpmem5OYnRz?=
 =?utf-8?B?Y0xmK0lPc2d0NHRqa05Jb3JBV2tSK0llS3ZqVkF2U3ZjeTBoZUw4cFkyNXkz?=
 =?utf-8?B?cndBQTF3cTg4d2JadjdnMnRvWGw5dnJtQzFPQm1MVFNsVDZIR1Q4aUdwbU1E?=
 =?utf-8?B?WGFxNE5Jamd2eW9lM1ZVcFhiUTAySEErZC81K0ZRMHpLc2V1QmJmbG41dTBt?=
 =?utf-8?B?SmNrWTI3M1BSRHQveXMvbkl2ZytSOS9SMTVjOFN1TW5ITjdmd3NTN1hUZVNL?=
 =?utf-8?B?U2lIYlNWdGhKUUhRcDFXUnlIb3lBbndGMk5tV2dxTlpaZ1JTczlSek8xamxz?=
 =?utf-8?B?UFJxVGhFSHY5UkdsMmRlM3hydVZlRFRodTZEYVgrbVpZNy8zM1NDUXgzY1pl?=
 =?utf-8?B?c0RQZnhkZ0pXTkdLMnM3MlF5RXlGcTZ1cWZLUkdmV2gzWmpRZFFrU2JQTnNS?=
 =?utf-8?B?SmNNNVBhaG9CcDEzay9VOCtaWkdWM2lGUlh4N3EzNVgzOVkzSnhkSnFJcXlO?=
 =?utf-8?B?Nkt5a3FoaWJxZDRFRllYcUVjV2ttd0htUFZtQkNZMkdKZXlFUDdkeDJPNEVz?=
 =?utf-8?B?c1NlWHdWeWQ4dElEWDJHa3FyMmlhdmZ1QTZMMFNGVzYrdnRtYUxqYzM0dDJj?=
 =?utf-8?B?TkZhaVl3dkt2L3Z0c1FoUVBJS1dIVnY4ZXFsQW5DbVlaRTkyZzFBKy9KU3FT?=
 =?utf-8?B?L1NBSGpaOWluRmtZNWF0eFk0WWhyZDFCZkNNMUhBTEZWbVFvTzBiVzYyNWNv?=
 =?utf-8?B?N0hpYVJoV3puQjc0NWdhYzFkdk5ZNjV5dEczbjhuYzdEcHQ4VVNWdnRiaXh0?=
 =?utf-8?B?eXdtZVlNK3Y3anBLbjM0WjhTVUpvQ2tCaVZXRFBId1hYUXFMWHhPYzhGYWQ4?=
 =?utf-8?B?cHRYMFFOZktrRjU4VWV3cCtWYXE5ZlVPZnFLcHNQanlFSVo3NEgyZ054VGtB?=
 =?utf-8?B?aEtNVFFKc09aNXUwOUdqc1dwOGFqYlcwdTFWZWRJWjQ5MGltdW9RQkllaUxN?=
 =?utf-8?B?TzdRTlU4TFVLdVp1cDdmZGpZZmt0NXFuenh1TDhtaHI5cGFpWnR0eVU1WS9Q?=
 =?utf-8?B?UFpiY2drV3MxaXA2NTZ0S2NKVUM5eW93MG9kRDZ3RHJYL0xNaWpIWHJKbnUz?=
 =?utf-8?B?V05EWHRqZGEzSDd6Y1drYlpCczFnOE50bDdPdTRjVVU1R0hvNEl2bHRqNzVL?=
 =?utf-8?B?MzdBRGJFMmRrWlRKdE1VWUVwUCtPSWNuamlWckxtbFFZWUhYa0NTL3NQM3FI?=
 =?utf-8?B?VCtneUl6RUI0aUl0MHl2cGc5c1NHRVk2U0o5eDdYUWxsR3pLdlBEb25TSTlj?=
 =?utf-8?B?ZmFhbStFYWxBZldLcGQ3VEJuL2hLS0xmb01oVDN1cFVWakVXTXdreDRDajlB?=
 =?utf-8?B?TWVlbnpVZjVqVlYyQ1VVTi9wSlJXaEV4S1kwbnlZdmZiWlBPelBwMFg1S3JS?=
 =?utf-8?B?dEh6MmRDMGtlSjRNVG9JdEowMi9zdVJTc0wrWWh1d0pxOWU5MFNlUnRtNW9y?=
 =?utf-8?B?cVhhNUdQQndzZEFVaUc4TzI1ODJ4ZVA5RzVnaXR0NUhSeDNZQkpXUUlhOGtH?=
 =?utf-8?B?QTNQc1F3RkpRUFJvbVc2ZURTMFRROTQ4SFloS0pvT3BKeVB6R21RaEc3SzQ3?=
 =?utf-8?Q?m4USHTF9ciAMbsnGDHKIjqU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436b175e-9e78-4994-17cc-08d9e1797369
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0802MB2374.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:43:19.6476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWpVMvSND/BIcqBS+gzTedhKzHEPhRLFiyIsF/F/uOykqP3ZS72Qp3bR9rHUKgLBuUI33+lieo98b7yJ+lDj9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6544
Received-SPF: pass client-ip=40.107.1.92; envelope-from=ktkhai@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On 20.01.2022 19:20, Vladimir Sementsov-Ogievskiy wrote:
> Consider the case:
> 
> Thirdparty component works with qcow2 image, and dirty bit is set.
> 
> Thirdparty component want to start qemu-img to do some manipulation.
> Ofcourse, third party component flushes refcounts and other metadata
> before starting QEMU.
> 
> But the component don't want to clear dirty bit, as this breaks
> transactionability of the operation: we'll have to set it again but it
> may fail. Clearing the dirty bit is unrecoverable action and can't be
> transactional. That's a problem.
> 
> The solution is a new qcow2 open option: keep-dirty. When set:
> 1. On qcow2 open, ignore dirty bit and don't do check: caller is
>    responsible for refcounts being valid.
> 2. Never clear dirty bit during QEMU execution, including close.
> 
> Details:
> 
> 1. For simplicity let's just not allow keep-dirty without lazy
>    refcounts.
> 
> 2. Don't allow to open with keep-dirty when dirty bit is unset. This
>    may mean some error in user logic.
> 
> 3. For implementation do the following: dirty flag
>    in s->incompatible_features behaves same way as without keep-dirty
>    option: it actually designate status of refcounts dirtiness. But we
>    never clear the flag in the image, and we remember that it is always
>    set.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qapi/block-core.json |  5 ++++
>  block/qcow2.h        |  2 ++
>  block/qcow2.c        | 66 ++++++++++++++++++++++++++++++++++++--------
>  3 files changed, 61 insertions(+), 12 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 9a5a3641d0..3e35357182 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3228,6 +3228,10 @@
>  # @lazy-refcounts: whether to enable the lazy refcounts
>  #                  feature (default is taken from the image file)
>  #
> +# @keep-dirty: whether to not touch dirty bit. When set, QEMU doesn't
> +#              check refcounts on qcow2 open (ignoring dirty bit) and doesn't
> +#              clear dirty bit on qcow2 close. (since 7.0)
> +#
>  # @pass-discard-request: whether discard requests to the qcow2
>  #                        device should be forwarded to the data source
>  #
> @@ -3276,6 +3280,7 @@
>  { 'struct': 'BlockdevOptionsQcow2',
>    'base': 'BlockdevOptionsGenericCOWFormat',
>    'data': { '*lazy-refcounts': 'bool',
> +            '*keep-dirty': 'bool',
>              '*pass-discard-request': 'bool',
>              '*pass-discard-snapshot': 'bool',
>              '*pass-discard-other': 'bool',
> diff --git a/block/qcow2.h b/block/qcow2.h
> index fd48a89d45..696e13377a 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -130,6 +130,7 @@
>  
>  #define QCOW2_OPT_DATA_FILE "data-file"
>  #define QCOW2_OPT_LAZY_REFCOUNTS "lazy-refcounts"
> +#define QCOW2_OPT_KEEP_DIRTY "keep-dirty"
>  #define QCOW2_OPT_DISCARD_REQUEST "pass-discard-request"
>  #define QCOW2_OPT_DISCARD_SNAPSHOT "pass-discard-snapshot"
>  #define QCOW2_OPT_DISCARD_OTHER "pass-discard-other"
> @@ -376,6 +377,7 @@ typedef struct BDRVQcow2State {
>      int flags;
>      int qcow_version;
>      bool use_lazy_refcounts;
> +    bool keep_dirty;
>      int refcount_order;
>      int refcount_bits;
>      uint64_t refcount_max;
> diff --git a/block/qcow2.c b/block/qcow2.c
> index d509016756..1c42103fb9 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -514,15 +514,17 @@ int qcow2_mark_dirty(BlockDriverState *bs)
>          return 0; /* already dirty */
>      }
>  
> -    val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
> -    ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
> -                      &val, sizeof(val));
> -    if (ret < 0) {
> -        return ret;
> -    }
> -    ret = bdrv_flush(bs->file->bs);
> -    if (ret < 0) {
> -        return ret;
> +    if (!s->keep_dirty) {
> +        val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
> +        ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
> +                          &val, sizeof(val));
> +        if (ret < 0) {
> +            return ret;
> +        }
> +        ret = bdrv_flush(bs->file->bs);
> +        if (ret < 0) {
> +            return ret;
> +        }
>      }
>  
>      /* Only treat image as dirty if the header was updated successfully */
> @@ -549,7 +551,13 @@ static int qcow2_mark_clean(BlockDriverState *bs)
>              return ret;
>          }
>  
> -        return qcow2_update_header(bs);
> +        if (!s->keep_dirty) {
> +            /*
> +             * No reason to update the header if we don't want to clear dirty
> +             * bit.
> +             */
> +            return qcow2_update_header(bs);
> +        }
>      }
>      return 0;
>  }
> @@ -709,6 +717,11 @@ static QemuOptsList qcow2_runtime_opts = {
>              .type = QEMU_OPT_BOOL,
>              .help = "Postpone refcount updates",
>          },
> +        {
> +            .name = QCOW2_OPT_KEEP_DIRTY,
> +            .type = QEMU_OPT_BOOL,
> +            .help = "Keep dirty bit untouched",
> +        },
>          {
>              .name = QCOW2_OPT_DISCARD_REQUEST,
>              .type = QEMU_OPT_BOOL,
> @@ -966,6 +979,7 @@ typedef struct Qcow2ReopenState {
>      Qcow2Cache *refcount_block_cache;
>      int l2_slice_size; /* Number of entries in a slice of the L2 table */
>      bool use_lazy_refcounts;
> +    bool keep_dirty;
>      int overlap_check;
>      bool discard_passthrough[QCOW2_DISCARD_MAX];
>      uint64_t cache_clean_interval;
> @@ -1088,6 +1102,13 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
>          }
>      }
>  
> +    r->keep_dirty = qemu_opt_get_bool(opts, QCOW2_OPT_KEEP_DIRTY, false);
> +    if (r->keep_dirty && !r->use_lazy_refcounts) {
> +        error_setg(errp, "keep-dirty requires lazy refcounts");
> +        ret = -EINVAL;
> +        goto fail;

Vladimir, according to documentation dirty bit and lazy refcounts are independent:
                    
                    incompatible_features:
                    Bit 0:      Dirty bit.  If this bit is set then refcounts
                                may be inconsistent, make sure to scan L1/L2
                                tables to repair refcounts before accessing the
                                image.

                    compatible_features:
                    Bit 0:      Lazy refcounts bit.  If this bit is set then
                                lazy refcount updates can be used.  This means
                                marking the image file dirty and postponing
                                refcount metadata updates.

while this patch assumes existence of some dependence between them.
Is there a real reason to introduce such the connection?

[snip]

Kirill

