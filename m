Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8141599C94
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 15:01:44 +0200 (CEST)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP1d6-0003uf-VI
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 09:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oP1aL-0001Tf-Hu; Fri, 19 Aug 2022 08:58:49 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:3617 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oP1aF-0005L4-Fh; Fri, 19 Aug 2022 08:58:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SO0hyZKvuQtfmyz7Cf7Fi5GeudI16rPR9q9Xiid86sVxCHe0zVczHm9n1iYSOs+39Sp4pRpLpqfS62cNKrsZj8nA7zEjz2IzUyDCi0Clb3ezhI21HLv+nE87ykDDCmFrqLyTCIOQGUrC9yXdOSaysMMGw+zSEIGAYJY/o2fH5oGJAyngeAAiecdacZR51dCMSWQXoAbDG1V1SmEX0LjZVPg2J/IMmtA0ABdCnHuVcXf1NdPQSt0Ff++GCZJXmwzpRgPvJZXqpupXHTvWuLyHP9T8u69r3GZMRMJMQbQPYpfpPwmsvPGPowiw8bDPgP6AFJPs5HCtAP/KM3xo8plhMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjPcsaA1rF8/A49P5GJz7iCDkQvwuzRlkXJa/ZhVceY=;
 b=hmoTSh1hIh1hZKx15Pu5Mjlun1xnVypVxCfnBjYBrXNl70pBoJNW+C6drW/oRP2fxwatiSp/fQgKF5n/JA79s+91d8u7sBHxuQDr1PeO5IOmd5eXum+BCmzlY2W3kj23CJl1XiRMbCbxPz1Tj7Y/EBUWhWiQGE1tqvlIzzs1mfUosZdfKe6uQHPWU8+MBRMVWG0WHWfgoOxpsJ95+MgWjP2P0k0+5TktH5cW1HwIGzQXE6sGEyUjl0a/PMYDcqVsxNmKQqYi46myTGlQ3pV954tD9/lXJtGJgUcwJRTUI94VSdnXMZ0abOWERdYaQCIH5irwwZiq9ec3arf9dw2GTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjPcsaA1rF8/A49P5GJz7iCDkQvwuzRlkXJa/ZhVceY=;
 b=bjg1sW2l/NMO0L4qIQ5ui3xKqnWI41Nz9AeEYyJjpEbtWGNWKNa6MFqpHS1+rz1XcLukz4L0kFNpoIOil8D9Z9b4kn/wZkpIgISF2dT8MF/kZg2/LyWoYWLwG29u0xOzBeKHBg+HR73/K0/sOfp0yJA7r1qrds8DlCUqw1f2ZrQMGifZocUYy1ijtkC/OrSLDFxoxddbmpM4EMxszXM141ndn6fEw3q+OoNQZAtHReEPkm5i8ifx13xFWOL6ZiInI2AEZAj3hvQNJXIBubmfiKyfQS85NZ1jHgZbqju8HStr8nLosBMIPkXuJGcl2cKIpdxELBce3MutBvst3evrYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 by HE1PR08MB2779.eurprd08.prod.outlook.com (2603:10a6:7:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 12:58:36 +0000
Received: from AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::f8b4:ced7:1f39:17b7]) by AS8PR08MB6946.eurprd08.prod.outlook.com
 ([fe80::f8b4:ced7:1f39:17b7%5]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 12:58:36 +0000
Message-ID: <6450bf3e-bc9b-8801-494e-c019a20d9a25@virtuozzo.com>
Date: Fri, 19 Aug 2022 14:58:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/9] parallels: Fix data_end field value in
 parallels_co_check()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
 <20220818151456.2118470-3-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220818151456.2118470-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P18901CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::24) To AS8PR08MB6946.eurprd08.prod.outlook.com
 (2603:10a6:20b:345::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60206097-8741-4e30-af72-08da81e287b1
X-MS-TrafficTypeDiagnostic: HE1PR08MB2779:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FrFecamJYzIc6cRK9R1fw23PV0CFz50CJjlVVHSdI+SA3WGXDgIKj3ud70Xbp88FEQUbA8I8wyr++5O/HZcXcox+sGdfJPhU+rsCaRqfjcEV1FACHDnuAZqx5VkJi9+OCLQqQo8Wj0yK2dH61fZY5gvsEW04Zv9HR317sZztQm82qyNP3DQueBs9MfEMmIjC19Oy3LBvZuRTwjfz6wT5Wy94Ktg6a761kEV3ZUnsrK9fwc64uVZofVLakLhwt5igOhvfXTltZRaaTIx7OcyrTkcDh6cbt8JQKiRJt0BLJ3tuSpCyECvZO429ak0DQcH+dcLjlxjxo5EdQHdMhDFfc471OlwITf2ZYzV3IUI07lSebVzE2Xb/yuwJP9Av867HGo4bKK6+MaHLXGpn1gzRD+TrMe/8pO11R1aj0JIAlaJr5nQsugM/5aG8uYFZZp4+4vh7134KxrfOWIR8t2LnUWFDgbJTy3+l+mbLlmQ3y+IMtQ7QpFyzdg0qhTtQ9Iv7wpJSOACtcQp0+nznSVl49rVw3z4p1lnLFnz3VGXSJUk/TWvWDO9kkuvs+p5P38VDw88zvEyQ0UCrYEaVu2W7mffb0imR3ZG+jVOttT02+WR3q8c7leJo5B20ffofhu7PjDyFoFt/dHG6yooz0Yvi/ouDQSsG1t/u4oO6T6PCe3z8DEFXgqGoWgE5z4JS8uZNcgi9dMIDsOBsEJ/4viSwjd0M3F9VWkjXd8JhgxKcHmMB/STj00cVS0QDv1rlijhxoonHyqfSHOZgezKH9Jy1DmzBh1j2SrJjteUQeJGEvHiS4EWS63mjIf4aqDmGWXRHdkOFCGcC8KM2pmawY5YxUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6946.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(366004)(376002)(346002)(39850400004)(2906002)(66946007)(66556008)(66476007)(316002)(478600001)(6486002)(38350700002)(38100700002)(86362001)(31696002)(31686004)(36756003)(186003)(26005)(6506007)(52116002)(6512007)(41300700001)(53546011)(4326008)(5660300002)(8676002)(83380400001)(2616005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTFGV3ZKeEFEVDY4bkJNclJCNHFtN0I3c3hlOUpRTFhTSWpwNUdrRVZaS2ZV?=
 =?utf-8?B?TVFKTUV2aHJCSUFzZHk2NUpnMjBNREIweXhUWlhzZ3NxNTgwYWtmcGJvZmwy?=
 =?utf-8?B?Qkg3Q3JDVm00NHBxYkpKcTQxSWd4WVFQVWVqaDMvNU9ZOUJJckZSUkdvWlgy?=
 =?utf-8?B?MFZueXdoMFVWZ3cyc3pSNmlvekxKQnMwZG5CcEZJa0JZa1VpKzRseEVyeU1i?=
 =?utf-8?B?c1VlcnplQW5lQkpHM1JMS3pBbUtsYWtVL2U5QUtxbE8zOVZXekNZWnNjbUZr?=
 =?utf-8?B?Q0FlN3VBd1pISTJkWUZlSS85dDVtZ0tqOXZuVHJ0SFN1SnhBeFJmbGFWSlIw?=
 =?utf-8?B?Y2UxY3hkOHlrYlJqN1AxYUpmaEtSdjFjUGNXOElXVXdhQ0lpNjFZWWg2V3Mv?=
 =?utf-8?B?ZStRS1RxekRpb2E0SjNLU3BPZGFLWGcyYzBYN1M3UEJaeGdtYVVTR2hiUFI5?=
 =?utf-8?B?T3JVVmtaVVQyaEpZM2s2bkZjcm9RaTk0ODJib2ttQk9tVXRIbUN0TW9jQTEx?=
 =?utf-8?B?eHNsVUpYYUxQelppc29VenlEQkd2ejdIelk2QTZETC80d3dLVFo3dVRBaUY2?=
 =?utf-8?B?L3p5ZlNtVGJnOTQ3eGF2MHdPTG90eUdydDdYNjd3WnpCbUFuZVdubC9Id1hj?=
 =?utf-8?B?bkNxTExkVlFTdDVTa3FtNmo0L1NwMGNZZytma1NkV2kwWUxSMFF0TTRVMFBk?=
 =?utf-8?B?N3dPeUpUOXdZcVJKOUQ2WjJmaWRzL3NreTdBZWFYL2JVck1tMXlUWG9sLzV6?=
 =?utf-8?B?ejh5dnVHeUpGT2x5bzRUL3B5UFdFWjQ4SlQ1eGVDMGpjaDVpckpqSGcxNmZw?=
 =?utf-8?B?TE1zRU1VVXI0NzRSY05GUkN1eHRvM3ZnVEdWZjVQVGlPVHcrYWMxRzRPTDVD?=
 =?utf-8?B?SnNkK1lDM3BUTjdXNjNyTmcvMWRYVEdYMk9pUHpvNGRRY3FPVVJOTlcrR2tl?=
 =?utf-8?B?OGVyaWNIWnRYZUsrWXpUa04weTVHRmdZVEE5SEMvb0pvOXZ0eC9SbTlsZVR0?=
 =?utf-8?B?cTZxb053SHR4ZE8ramI5SXRaSzFTUEFhT0FPcUxJc1ZpN1NXdU1rODhqQjJw?=
 =?utf-8?B?VG9uUzl4MlVVbldKTFNIY2haWjA0Tk04alZUb1VJaG5wNE9Dd1lKRldKMFhn?=
 =?utf-8?B?VkVxL3hPYjZBSXJCUnYrZTNZdk9rZ3drckdEYTFyclpqdStWQ3NwYmxXMkg3?=
 =?utf-8?B?VWVtWHMxYktHTU5KUDNXaXV5TmlaUytaOUxWOVY2WmlSK01aTGk4MjRPdElV?=
 =?utf-8?B?YWlUeHlnWXdtR0dsQnBrczMvRDJ6ZUpGRGpia3NuNnJBNXRSUmhES2pyand2?=
 =?utf-8?B?Ui83S2VNRGRXNGtaamc4L1pYL3lObXRFNmthZC9tMjNFSk11bUd2MTFZaWg4?=
 =?utf-8?B?YjV3WWs5czdmZStlRm0zU2JoNThiKzJKeWhqSmNPTEFUcVBERWpXZmJHdEpD?=
 =?utf-8?B?Q2N1NFJRVEoxS08xRmk1N2l3RFVIWlZvdHBPYXNjeDBvcUtTVHdPUWRtbmo4?=
 =?utf-8?B?U05IWmdnSjdwbVl2UU00WDQ0Tml0L3JmOWRmaW9xWnl6WGRVbmJUbnMxZzRx?=
 =?utf-8?B?L0dhMWF5M2lxMVVMVVBBSUd4QWdUbEFCZGFGWExpM3FoTmpwWFRrVml3ZjJO?=
 =?utf-8?B?TzVCcjA4V2pocVlIQlVkek5Zc3A3YW10Y05aZTM5dUJDeUc4TTErNStFU2Nh?=
 =?utf-8?B?Q1FYajNpWmZwWS9UUzNWZHRtVnd6SGZhZkZxU3Z5anR3QzBadlRPOHhsSlZK?=
 =?utf-8?B?NzVPa3V0b25VQ3dvRURjU1FoRm9XTlZKZnNHdVlKQ1MwN29GVjFndkJtaitQ?=
 =?utf-8?B?OG9rZUpoRHJCY0d2VVpvM1EzalJvMkY3VFI0dW5EVXpDdnpUU1BLaGtraWxv?=
 =?utf-8?B?T1o4Z05BUVVwYWt5cnVlTVpFekVOVHFUYWtrZlNaZzdEMXA1OFJJZ29ZVnFK?=
 =?utf-8?B?UU05ajhjS2krV0poTUZFbGZKTUhySnNXYVBDMFRQRFF0MTlESW1Eb2U2ZlN4?=
 =?utf-8?B?ZDFMUTdrQjlZZlJ6ZGtLaTZBbnFwVkQ4Y2E4dUp2UUZIVUtaWllZMmxDNDVI?=
 =?utf-8?B?Z210a3NKWkZiYTk2WjdKZnIwa1NMeWFQYmRVWEU0SlkrU3B0TkY3Qm1nUlBJ?=
 =?utf-8?Q?VNW2ZJVxjRSVHLyZxURJ+a03X?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60206097-8741-4e30-af72-08da81e287b1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6946.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:58:36.6445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: if3yVlYht/3XMOQ1i1L4bKDR394JuRa3+YbgtckTt/t2K/bFD8S6yUl6AVak3lpUcQGC2BBMaFjVGeGtNRZUjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2779
Received-SPF: pass client-ip=40.107.20.118; envelope-from=den@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 18.08.2022 17:14, Alexander Ivanov wrote:
> When an image is opened for check there is no error if an offset in the BAT
> points outside the image. In such a way we can repair the image.
> Out-of-image offsets are repaired in the check, but data_end field
> still points outside. Fix this field by file size.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index c245ca35cd..24c05b95e8 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -513,7 +513,15 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               res->leaks_fixed += count;
>           }
>       }
> -
> +    /*
> +     * If there were an out-of-image cluster it would be repaired,
> +     * but s->data_end still would point outside image.
> +     * Fix s->data_end by the file size.
> +     */
> +    size >>= BDRV_SECTOR_BITS;
> +    if (s->data_end > size) {
> +        s->data_end = size;
> +    }
>   out:
>       qemu_co_mutex_unlock(&s->lock);
>       return ret;
yes, but the comment is wrong. You could have adjustment to data_end
additionally once clusters outside of image are dropped - inside
leak check. Where data_end could be reduced. And this leads to
error further in the series.

Den

