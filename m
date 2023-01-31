Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3A6831A4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:38:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMshj-0000SH-6P; Tue, 31 Jan 2023 10:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMshe-0000M7-D8; Tue, 31 Jan 2023 10:37:46 -0500
Received: from mail-db3eur04on2137.outbound.protection.outlook.com
 ([40.107.6.137] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMsha-0003GH-4x; Tue, 31 Jan 2023 10:37:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpM2d/pkbjijsFM2qtBiZu00zfCqwl9XjmyuyFoEBhI2+DighA6jabWBTkF9QaOgxuN0iqje85jLS9Ci+88RR3bh72nkTPpkyI7a1kq7jFH+BdyB6INmuRlVc1KGBlG/zVSkUJL4nAtHvaC4MechltqimsqKczivCbbcSh0SWjMqfmXunWinCiReR0kTez3gDjIS3B28+R/W2vJ6uUMx1G3JbCTM7Cg6jSNyumGvxXWjUApwjyqvlrJS9v/9kJy+GQp8Dh3JYlnUK3WW7bmKkj1YHlRvqoUSxosKyghMJecfePAmlR07HjEd9c4Yv45UxSAC4JguGnzJRs5NfofpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q/FkRangG3pXakhcbqR3ppaKMlcr2C73D/2augvNJY=;
 b=K77nBCyjDFkg5VOBUMTVykFNdsTznYtC17f+P613vrsPnfZn6FDJ0crV8K3QGB5C3fkocnSjT/UFo5WOecBtK8BtvkJcCdmFjAyditqyhDGVjSSia8ZL1h9whJQ2pwvoxVYOkpEGARraiiPGoTUvmgFD7GWrFwJ0U7pGyJyRgmdKwvYdkDcyzNK18tvNexpC2f6do4dQqp9YjMG3KqLrYsijcF02ofebbrzNaSMTFAgu9EwOPlZesAHoJmsZrHCE22PX7HUh4+YLlMZJAYu0NnDhbasQ8EmlHLBYxeKa9oj4RI7cWAROuv3fv8+1YvO7JrJHYONT4Fy4AxnWgJzilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2q/FkRangG3pXakhcbqR3ppaKMlcr2C73D/2augvNJY=;
 b=nzrLU3xnGtc3BKfMef429fjudqLRy4TyHGEeBHbwsRHVt7OkFgRFcRVl2Ci9t8OWgTlzfwTK0BGajRgym/1tiClmmoVdpNq8ZQL8hhq8q6NSNuabePWiRCyzHDEaZw+at+BSlvca7dWcQG7RE+MqtfBWFiMqt6mXHGULdwG9oJTjnQIOM1oY2u1V2CLXOnubPyuNscFc/n7/2B152UoYieBqNxKIMQQLD3WiB+cAHwXJvH1jIwfLU0+McNkkuTEUhoGreIcz911aDdBWr0WRJy0pz7Pe/vq4IEMn/XwYz6+cnNcTQmA6i1paGysZ+fwhf5RHsjL0DuPGiLvZ9NlDGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS2PR08MB10251.eurprd08.prod.outlook.com (2603:10a6:20b:647::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 15:37:36 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 15:37:36 +0000
Message-ID: <c3e82fca-eec8-e771-01a8-bdad7e7a83bc@virtuozzo.com>
Date: Tue, 31 Jan 2023 16:37:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 12/12] parallels: Incorrect condition in out-of-image
 check
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
 <20230131102736.2127945-13-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230131102736.2127945-13-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0093.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::22) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AS2PR08MB10251:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e00a28-656a-4874-a88e-08db03a11439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjHllRdaXojrtlAi7pVIWD7w0H89gZndSKd8g+joJrvaLosGPURv33HZEX/+2zfWF224XTO0tmVXiWC6KOtH0j1xfvDNW6EiqG/2JwORJKXNtAfcWu7HeSkIBkULGkWyyBKuDy9qEFknL+ICxnjUYENIXSSjRSij6p50WmuTxbhyvF3BCc1bHvQTKNqLhpnVTEFEkoD24KWAPWSuArLr+Nk1JK2fVLIiWxVwy/dSTTEZPBIBmNwIHyGwN4nZBobPY8GjMr3JafWLubwnnbSg44exmkmg6ZjBXda/001Dnt3WWWqdCqMtBg+gKOOuU4Ti1o4c4lRe3op+dyD8PBHwKH+ts7DuPIB4qCPQg92sE9/kMJvGGF6gKzgTk9igY6p6MNxxmoVKZCF1N9eniOcZ7nqnXx72zYHsEYIxqH/hj+JxC/aEKFVA8jMDIIaJ2tAek7Lh466dKdOfjBtC4vmOpEiReuDq0MG8+W00i/Le/SXB+gTOuU/IycHcw5UzrH6i4P7A3pmhimihzwB56wuTWJiOFrogIXtVRViAdT6x8hPfP3JhFMC4MlJafIzbom4cIRq7lRVWCmyUJD2YgDxTqrjoEoY/9YqHF8Y50TuLyum1vxP9nvcjPNIQmPijfTDDUQW0YU6BbXRJzlGmFPzZYPRpoBRf5ciC4ZErNS4HdNIwv3QQzCAsYaKpxM4taqEi3CWcgfuRxafBmtNQvt7Bi7VZxLX4zTeNem88++Le+rI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(346002)(376002)(39850400004)(396003)(451199018)(2906002)(4744005)(5660300002)(36756003)(2616005)(6512007)(186003)(38100700002)(26005)(83380400001)(6506007)(66946007)(31696002)(4326008)(86362001)(8676002)(66476007)(316002)(8936002)(41300700001)(66556008)(6486002)(478600001)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qzg0Mlp3SFVBaUhCVWlaOC9HNlNIWG9pY2F2OGpyUVNhQ0Z4bkpwOEZvZms0?=
 =?utf-8?B?cTArdEhWRW93WklINVFFcXEralZEWlZObFpiUGFZd2t2UjB2YzRFTUtCYjRP?=
 =?utf-8?B?NFRvR3lHVVlpUzcxUEJzVU8yV1hoSENJM0dHUTkrYXRyUythSVptL2M0b3Ni?=
 =?utf-8?B?WGhvUGZNUmszRENlVW5rMXhuVnE4S3dQd0NXVEltSG54M0tMVkcrWDdhV2Nm?=
 =?utf-8?B?YmNzci9xMGs1U2JvSmp4bHZPeXNjUE1QYk9DUXQ2Y044VUNvWG5OOW40MzdI?=
 =?utf-8?B?RHpmaDBZK0RHdzcxL3BhSU5KTzluTE1aaDBScFNKUUhYbWNoOW1ISDR1ei9U?=
 =?utf-8?B?RnZIRDNLZnlEMGF6aVBLcWFvNUN1TzJseitZblhuWVlhdTZqZjV6Snp4WlNV?=
 =?utf-8?B?NldiY0lwaFZmdlZqVy9pQzJCZnBVZjJXeElOQkEyQ2hxMFFPRVlaMzRBR1Mw?=
 =?utf-8?B?NHJScjJXK25HV1BpYkttTVpIZitpdHBqNjkrU1ZJMjVJd0xpMGMxV0UyQ3U1?=
 =?utf-8?B?TS9jRURMenZhR2VlUVY2eTR1ZnFETHdRajgvcU1CZXVBcEhmMUhid2JPazR5?=
 =?utf-8?B?ajlsOFYwMThMTVk3cGFzWitaN3NhRTh0MFhyaGNEWWE0OUwrM1VhT2NVeUJs?=
 =?utf-8?B?aHlHRERYdVc0QmcrQ3d5M3FlUThiZERwa1lnengrYU1HL1JOZnJlVFprTmVL?=
 =?utf-8?B?TXlEZEo4MU5sSEFvVWhrek9YNVFINkIzT094NnNob1ZxV3N6ZUdOOUt3TzlN?=
 =?utf-8?B?U3pDR0lENVo5c3p6ZE43czM0NW54OHUwM0FRVFVIaDVCVE9uREV1ZFVCT1VD?=
 =?utf-8?B?K3Q2OVJ6UXF1MEhqcXN3NEZaQ0dOQ3I3L2ZacDVZRkRnUW1mS0RsKzBTN1Er?=
 =?utf-8?B?alZTa3g3N285M0dEOVR4cDFSaUcyUTBDNHFMdGRERkduck13dS9xb25EVWRo?=
 =?utf-8?B?dGhEQ0dRV2gxRnN4SjBYSGptMFFCc0tXOC9mdUx5MFM0N0FPU3pPZ0dONXNK?=
 =?utf-8?B?OVFRRVVZa1Uva0VDcms2NXdiaE1UbG1hQWtIaHhNS2FvUWdsZHliWi9aRllI?=
 =?utf-8?B?bE5PbUZhREg5ZGZhM0tXUWttbzhPWGl1OFo3WE1iWU5SNWZ0VU1sc2Z4bG5I?=
 =?utf-8?B?N1hZWGRNRFk0YklrYnFVVkdpa2ljNlM1WDF5bVRkQ0lZOExuTVptT0h0YStH?=
 =?utf-8?B?UXFzK2tHMW9xdFFBMFd3UU5McVhiL1V1RmxjbXZPNmVpWVl0VzcyYzZVR1d2?=
 =?utf-8?B?Zm1UVmxCWm83c3NRNVdOS1U2YkJGdnh5VjdIOUpqQ0hhVnNjOXFRemV3WTZB?=
 =?utf-8?B?MWcwM1VjR0d2Q01qaWVCTVZZcWo4QlZ1Q1RWYnRXaDNNM0wzcTI4UnN6NWg1?=
 =?utf-8?B?a2xqYXZ1ZFFmUk1LcVdoWG90MzBLVnJqL1prU3V4Z2N3VW1HK29jZ0lLQWt1?=
 =?utf-8?B?VlJNS3FxcGxHUDlVYWRiNGJ2R3R1MlovY2JMeVh3ZklHVVprR1VlZ0xyRVlE?=
 =?utf-8?B?UndRTVBHSzFNQWZ5ZUppL25PRDNKQ0RFVUVURHhUa0tCMVBpVVJPOVNxR3NS?=
 =?utf-8?B?SU9nRmxTbGpWWllURnFaeFpuUEgrbFZ2cHAzS2psSWlkd0MwUFBibkVHcnRi?=
 =?utf-8?B?OVlnbEF4eFRaVnRWbzBtOW5xRjNHOWpxWVNKYUtzNmN2K2lyZ1RTd0NZdUNx?=
 =?utf-8?B?TnNLNjlHSCtvYUY5S05LMDBlLzBQTEJlWDh2dTh4aTlsQzZBOFRGWVFyOE1i?=
 =?utf-8?B?MjFFYlJRcW5INkdCaEg2Q25WZEsvY21tbE1XNzJaL3hvaTRiK1Q5cWlYamJY?=
 =?utf-8?B?dFdhN1N2Sk9vcE9POGQ1dUJEQkVnVHl0RHYvOFBtbHZ6REtrTVdudjZrOGla?=
 =?utf-8?B?UXZ5Rkw3Y2M0VUlhWVU5SWVFMjIzblVIcjJyUXVTRXhJaGlyLzJXNVQyY3hz?=
 =?utf-8?B?OFl0R0ovUjlSaGIraFQ1VjdzMnVnK3FkSzNmVHA1Z1VsZFRaSmlVb3lYYXJW?=
 =?utf-8?B?MVpRT0JxWjZiOEh3anJaeVJ5VE04RW96VHZPbE0yWFhZUlVrenFjZG8xYStx?=
 =?utf-8?B?dkh3SU1uU3JYZlFOYWRxSFhQdElKc2pVVk9NWCswVlR4TWYyRG43S0RRMUFp?=
 =?utf-8?Q?QTT1ZSkVz5m4ECRdePgCqXpPW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e00a28-656a-4874-a88e-08db03a11439
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:37:36.8247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCsUPdU6CF7jR6xUXKKgOmEL73Y/k8fq+OXm7YKtWxvitIdtyrlNwQ/1z9sMNuGBiIoe4cB+TFotXhL46PCIng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10251
Received-SPF: pass client-ip=40.107.6.137; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/31/23 11:27, Alexander Ivanov wrote:
> All the offsets in the BAT must be lower than the file size.
> Fix the check condition for correct check.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index e4faa14add..e469fe3f78 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -455,7 +455,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
>       high_off = 0;
>       for (i = 0; i < s->bat_size; i++) {
>           off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> -        if (off > size) {
> +        if (off + s->cluster_size > size) {
>               fprintf(stderr, "%s cluster %u is outside image\n",
>                       fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>               res->corruptions++;
Reviewed-by: Denis V. Lunev <den@openvz.org>

