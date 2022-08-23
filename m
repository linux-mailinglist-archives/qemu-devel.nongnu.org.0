Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1139859D6C0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:53:50 +0200 (CEST)
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQbU-0006H5-TL
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQZD-0002Na-HH; Tue, 23 Aug 2022 05:51:27 -0400
Received: from mail-am7eur03on2093.outbound.protection.outlook.com
 ([40.107.105.93]:58593 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQZB-00010c-BR; Tue, 23 Aug 2022 05:51:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDT/ne+vqUVi+QYqJ78fex9PPDMoirtFOqN7PojXbOvX5j8CSLc799oLFZvdXey06SEYjOLCGeTaVX524oWjb6qD1U6mEyu+g/9fVRuBrLU4AlsTljVl3RsZD7UB6UxL4nxTyhHwpBwEMPz7zstBoOhMpbcRaL5szDs72MqwGm2wNOVm3guAr7RhSU9WyS/mrEm7lBMvBjPtmuTsyIAYw3sHM2E2iYXMNVF2tkRMWD/hJy0PNS8llT7T3Fi3lO16eO0TDq03GcJp/bYZEiDzwjPI8H0+yDdcENLVAmrexzg6fms5GsnbOSG9cWI9rb47btOxHn1+i37y5gSSdZp9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRmQdDvTlVI4O0FUS9avcEmgPY12L3LJYCZL3hULmUw=;
 b=Lq8zgCtfrSTm050QBHeeKcoVl5muJEQxuLCCNjHKCRPhEVaqkh+OWJm94xYHAA29qvoG1nILaSfMo1+tilUfek8DTWg+wT+0dr0d+XbKV5a00M51Oq8EEiCKbpmQYhsfnTJXbr6CsjtpQ8oGWicG5Y3yVwLrfF1hGQrFhDtQ6ucKuVbksseVoZVDJDKEHNRHqqEoFeWrkgu0cQmD8nSI4hwe3y35jY9u492ZG5GG0trk6nkzsc6yaXbJ6bSRAggUhq2wOZRd8i44KbcKpABVXe/AGy4amN07YVrRo2wcf1zFE/38rBJXOM+Emiz/EsC/Sz1wTE6Oj7hCYFJLNZZb9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRmQdDvTlVI4O0FUS9avcEmgPY12L3LJYCZL3hULmUw=;
 b=M6nTg1dofXyh5nNBQ+hfTNiA5FR7UgJQB4UBPgjc7mTjj7jgD34hwFvuZEj31nnKQRENsa3GoTnycXb9Do6GeYWHae7JFpD+8PJRJ76eYuTAw499J+yRsxYS0rLcdts4XwOYBjgfpzRljlAVgXc5FesLYEkC3E5HpoCfntFI0oLVXMdcipqheU1hFC4Cq2nqVJ1sd8H3QAOSZI+H1mR0KQlPE1qjBev1oBkETwe1ldYq0fb4tQln9pih1cGerltiqPzc/CIecR35/K3hpSXn5lhKvvyBt5DSbRnLKBL8dgErqcPfG1meYgxYHNGpGRH9FC7jEk6mN0/XFefJ2xs9Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM0PR08MB3844.eurprd08.prod.outlook.com (2603:10a6:208:101::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 09:51:21 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 09:51:20 +0000
Message-ID: <b429c5a9-5a1c-5c1b-888c-48030c49e8e3@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:51:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P193CA0013.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::23) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 293af982-4daf-4c0a-9a12-08da84ed0833
X-MS-TrafficTypeDiagnostic: AM0PR08MB3844:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OxFlpvb98gn9ZkSnJCtcNAV+Ry0WmIwCVIAtSEJ/CzTy9G+mW870Ov2sm8OswUprTVvCrCFtfdF0FD8nlkUss9fMj2CV31A/CsWM2Yt2tYBH1aiFmskdZxvaNzuNrtPVhEYZZsmqjzWIGQpXmdM6Y+6bssGnxOCNvThZysn5cSsJJ2dasp3YDKy8peeCgUtviMt4ZUOlbAi4z3fl8rXoBDZHvU9RegXcljPqfk49MditzgMhs56YsW1CBMfNd9T9O2ZaqlqEv0cOyfHh4QrSvn7TwVo4RpyXO7Bi6rsd36cOHQJlCIPrkUXUrhoKgOIxczAAVg7mrETNw4sTCOsWEt2hKexZl4iezNioeWnm3X/UkvUroUxJ2e6XE6eaEiyPZjDrbluHmJDESjyapPkkF7Hxf3jW/N3UASYdWVYelSzPQtBCP376FrGgo40s5ORNaF/y93aNGc5avTplBoVtJDqHTPzrIjexICEl9BU0OqZfpZeWINk8CWYjCr2i/v/zRvoD1YN7BmLg1mzZG948hQ6xiS7t2yWate1otkdUxFAdz6Tk38Mjc+Xv9GiBjbo+ZdFZKfJr+l5xIWo/EbkbfiL84lHuT5menmj88jeg8UKct+Y3jJCCv9mv43diyIsueBuMpnwT+tiQjPSoFPXvHO+/f58sgcvp8SKUCINdZBKMNFSQwuOqXOwy08T5qz20lH1SECVOdkbW+bOM8fMhKxAmNvttO/Bd9qYHKvVegopbI07NzBe723iW6qF8ls6DGaNE6ypbaWVG3V+NZSu2Qix0xd8kZkzbvN69NLu3j5U4eoOs9yHK6/WUJzgp0CIHXovhGyqQ6nupslCeK+8qhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39850400004)(396003)(366004)(346002)(6512007)(53546011)(26005)(6506007)(52116002)(41300700001)(316002)(6486002)(478600001)(86362001)(31696002)(38350700002)(5660300002)(186003)(38100700002)(83380400001)(36756003)(8936002)(66946007)(66556008)(66476007)(2906002)(8676002)(4326008)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emlRZWVHekN6ZGVmaitSRmFrazQ1cGxWUjdyME9NSHlQcmh1cVZtRXVQaUhI?=
 =?utf-8?B?Rk9vN29xNDdSTFQ1MVI4cG1saUdZajJidnZHV3diNHdYT20vbGxkNUNhdjVk?=
 =?utf-8?B?OGVPTWJRbFFmaVI0cmN4b3hDaWRXL0N0TEw1Y2xZdVdTWHRtdTVjYUFFWkUv?=
 =?utf-8?B?aHRybkg3eUk1azQ0bWc3U05wRnkwR0o0WjFZS3ljVnVYcU5ZZ2x2MG0zUXBy?=
 =?utf-8?B?ZXNoNHkrS3lNL1NwUTJpaVM3RktJODMwZ21LN0pHTEVmUXdXMmVydEEySlpB?=
 =?utf-8?B?V3dmaEJlYWI0SEV4WGpkWlcxMVBCNzZxdjJFUHBFbTRuTUFDK3d6NDVNYytl?=
 =?utf-8?B?eXJYOVFnQ2pKYTIvWnRDa29JakoveGxxOUNheU9TOUN4cDMwc2Jod0luZkxl?=
 =?utf-8?B?eEpHSkVKYWNCV3hHN21TYVNBUDdCYWpCTXF2dy9YQ204OFZiWXR3Z2ZBWWM5?=
 =?utf-8?B?SXdhWVFFOHA4UmhFWGpjL01UME9uMWxQQ29VRFJHWXhucWVMQUZWSndkZEJP?=
 =?utf-8?B?YlF2dXFnT2FKejJIZFBNYWFNbzQ4NklIdEdOeG9NVW03bk9sb2IxNXhaVzU3?=
 =?utf-8?B?VDhBUnlyT1owWEV5RmplWE1BQTdSdTRadFZDS01iSUgrWk0wRU12SFdrNExV?=
 =?utf-8?B?cDh2TnNUaGRXdEFsTU1IM3NucFZMcHdrc1JPTlVyNHk3VXpWTXcrV21Ud1pa?=
 =?utf-8?B?bDA3cUJISTF5V1Fmck1jbWZjQVJwVmU5RVR5dm5kcEZiL05SUDNabWJDamcz?=
 =?utf-8?B?YnhzbTdZRXVSWmd3a3Bia1BYdVRpZVpDWkFFRkFrd29UMngvYzVEbXBGbTdU?=
 =?utf-8?B?N1I1b3Jrblk1Z3JQbWc5Vld5N2lYcnRNUVF1aHdBZWswNGw2Wk9GcTBqRDMx?=
 =?utf-8?B?RkVlWi9GWGtVVm5EUjhZNXNvaEFsT1pCZ3ZtT1Z3RjVlMER5QTFtNlJyVnN5?=
 =?utf-8?B?dmlvd2pDWU5rZGhFQWI4TU5QV0N5NXZSRkZVKzRyQ0RTVkJWcWpFWDg2RTc0?=
 =?utf-8?B?aFRNK0txa1A5bE9XZzZHdG5Nd0g4cWxLTkgzWWlVZ21uSUltY1NiTGJQeERM?=
 =?utf-8?B?cnRNK2VrKzdMZFdkMTJ5Q3JKZlVZb3JJVTdxQTdxME1tSlg1RERLY0NNRy94?=
 =?utf-8?B?dnFwRU5XN2RGdWZUWGdIWkdPMW84Mkd5UnJZdFZISzFpVVhQSUpnWHZBUlRC?=
 =?utf-8?B?NjB3bEdKWW8wM0RTOWRXK2JpUk5vMktybmtrZmxwNmZxeEZaQkpReEVIcCt2?=
 =?utf-8?B?UlBDdFpDcnc2YmQrOWF4UVphc1Q3T1lnampSQ0NOblZadm1zc1hkcFE3eDlt?=
 =?utf-8?B?REZrdDk3akZpU1QyOW5EZDduZ3VlSzFkSlExM3J0NzRZc0d6bGo2ZTRRSUpD?=
 =?utf-8?B?TGxhdlNuVWgxTDgvQVgzY3NMeTYxdGlQazFFdkdTa0t2R0FKV0Q2NWxiTWV6?=
 =?utf-8?B?bjRtZGNaQTZHMTE5YmdiYm5uTUNMa0gyZDgyN3hqamQ5UFpuYVRFMG1CN2x2?=
 =?utf-8?B?Tm94VDJzamRDU29zSEJhdkVsdmM4K0J6YVRMYkZ2Z0dtd1o0bFZXckplMzJY?=
 =?utf-8?B?UlE2d2RmWklaZitrMllqTVZmUVhBSDJLd3A3MmZBbGxGaVFJQzNtS0JiN2hj?=
 =?utf-8?B?amhqVm1oK3hPM2JYT3puUmRjSUJvVENXVXZtS1JLVHRmZnNzZnRvY0JrMk00?=
 =?utf-8?B?U0prbU1PRFJycFNadzJzbXZ5NGRWR3R0MXdubnVsUTV6K09JeWJOczlyWXV4?=
 =?utf-8?B?RWlyU21uK2F5MXdrRFJoNjBDak1lMHZNdGtmNXdrcElFc3Z5NFhsY2dYc1Bl?=
 =?utf-8?B?aXYydnRKeTVidnVzQlJIZjgzOGg1VmZvdGYrRUN5VFZMeDZpRTlDWVdsQ0dE?=
 =?utf-8?B?K2dGZThoUWFyR2FWNnNvaEZoaHNFREI4QmoxdzBKc21NcnZCZ09IRzZXdEdR?=
 =?utf-8?B?Qml3SXZBM2RxZ1V3K0tCUElWWk9DejNlY2lsRFlVUkZaclFiOVhBaFd2ZG16?=
 =?utf-8?B?V05UK0N3ekRJb0dQRTU4aHMxNThqYzhPcmU1ZDJBbmd2M0VKaGpWZjdJSG5l?=
 =?utf-8?B?dlJXQkRISEE3cXBaNHkxL1JQSXhOdFZDRVlpbFlUWUVLRWdQV2drQ01jb0FR?=
 =?utf-8?Q?cUjNXCRnvia4q7/YxSIvvPKfu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293af982-4daf-4c0a-9a12-08da84ed0833
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:51:20.7623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fnHiIMw1mcyNtgIFiTxR/ntWoGQYjWibOA7TqcgnXeaSupW64ihUHcD7SdUivyEGeHiRhNpnfetYazoWJZN7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3844
Received-SPF: pass client-ip=40.107.105.93; envelope-from=den@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 22.08.2022 11:05, Alexander Ivanov wrote:
> data_end field in BDRVParallelsState is set to the biggest offset present
> in BAT. If this offset is outside of the image, any further write will create
> the cluster at this offset and/or the image will be truncated to this
> offset on close. This is definitely not correct.
> Raise an error in parallels_open() if data_end points outside the image and
> it is not a check (let the check to repaire the image).
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index a229c06f25..c245ca35cd 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>       BDRVParallelsState *s = bs->opaque;
>       ParallelsHeader ph;
>       int ret, size, i;
> +    int64_t file_size;
>       QemuOpts *opts = NULL;
>       Error *local_err = NULL;
>       char *buf;
> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           }
>       }
>   
> +    file_size = bdrv_getlength(bs->file->bs);
> +    if (file_size < 0) {
> +        ret = file_size;
> +        goto fail;
> +    }
> +
> +    file_size >>= BDRV_SECTOR_BITS;
> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
> +        error_setg(errp, "parallels: Offset in BAT is out of image");
> +        ret = -EINVAL;
> +        goto fail;
> +    }
> +
>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>           /* Image was not closed correctly. The check is mandatory */
>           s->header_unclean = true;
Reviewed-by: Denis V. Lunev <den@openvz.org>

