Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECCE504F58
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 13:23:15 +0200 (CEST)
Received: from localhost ([::1]:55972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngPTM-0004eQ-IS
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 07:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1ngPRR-0003mn-Bk; Mon, 18 Apr 2022 07:21:13 -0400
Received: from mail-db5eur01on0715.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::715]:29383
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1ngPRM-0008G8-Nt; Mon, 18 Apr 2022 07:21:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBHvFWE8R1LkDDop7XK6eTmZWeNSzCsUpqELzTc14zO/VLmFjU/mt2N6NAuQ4gYxcwNHdr24TGnfZGX1utZLjTFsnSH/U3+u4PUk9zWzRtHDN2M70zNKfv6OIOIohBpgBxDrekxXy6LrjQogxx57XSCQvVu+8uFtEUIAnDRWJZL8vU3yRem2GfzrGoEiK2ApvNtGEDXwEWWP32GVrPHASCPcXK1wPNx5+8awmzms/5Eon0dwAwtOWkBn+od/x8vAykKny0Wxlp7G+XMZ+v5uYcNY1ZZKiIikoJGqP5npV7crV69X8Iin4pRDxVuCl3YIDcaLL/l6a1Stw9CNIRuLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxN4yuno2Oqt3rlaVSvZMOLfUCkC3sMVi1+arR9Qx54=;
 b=X0eEcY1J+dQYCzeCN5cw5x2TeLix39u3/aJAPSub+dGkYGSvHnCzs+krrMaNWkvAw+KB3vKZ5cZwTdFshw3gsr8J0OguY7WJdfqB/IBxHbwJhD8RLLy+att/E6sLKxTKDhit7c8mtZ3cG+rVXjBtQ6+cKZP3TLtMYqh4fKDFjEf4AiiEE4bW3RcLTJKPswzF2DUQ79x7N7gRPaz6SnnUnlZMkdEGpUtpKXzgUvD/OoB9UlMeJZBpD2KhsErX5Q+FHhi5QXvK57oezhVVq4GBaVDJQGRFyigyxpiIlCYY2QtBj0Nxv3eq9F4jPyAcB5VIb0r+kciENtmVYCo6inBdPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxN4yuno2Oqt3rlaVSvZMOLfUCkC3sMVi1+arR9Qx54=;
 b=pkzKW6S2YPzBMdo5QdpkQf6rU8YhCb/7AaoT/PAcmo3SEbWgCoRf6dLkO+RGdF4xay3h8JZnRveSWI+ZedHxFkeAl1bo2C6ZLGdFQqVJ2ncpU5qSeeK4w53fjCtqkTqT+tvNT2cyLesdJd1MEcpCEgslVgysNKgqIPOUs9QA0iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM0PR08MB5139.eurprd08.prod.outlook.com (2603:10a6:208:15d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 11:21:01 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8d23:cb3d:8eb4:e3b5]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8d23:cb3d:8eb4:e3b5%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 11:21:01 +0000
Message-ID: <3c04f006-0c59-6ffd-9b26-539235c8f07b@virtuozzo.com>
Date: Mon, 18 Apr 2022 14:20:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] docs: parallels image format supports consistency
 checks
Content-Language: en-US
To: Natalia Kuzmina <natalia.kuzmina@openvz.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Cc: stefanha@redhat.com, v.sementsov-og@mail.ru, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
 <20220418110430.319911-4-natalia.kuzmina@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220418110430.319911-4-natalia.kuzmina@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0059.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::36) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d9ddae0-d66f-4153-db73-08da212d84cb
X-MS-TrafficTypeDiagnostic: AM0PR08MB5139:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB51398EADE2F34C9D197A2C13B6F39@AM0PR08MB5139.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7YixKfbU3ivAeKbWJLlOD4uNB2sE1ZuF2mpEMphllDvOwb1qdeAsHqrTQR4w2q04VclPs5qoczN45PsDRGZmZpVdxBA48ZbF4sqS+5zFinIpjsn7d/GIwcp/LUY3CRJ8ie1xu2N0AkcfxxaNyYjovthQJErh9XJty2SAm0ALPQisj6qWmUBzwN6u1KFtdruwz9x2a4oVwJK0jbons49M8OT6pZQUvr/seje6rEnM7+D300OukYXLMAIdKedFwcfXou6CMxTaFAhkdNmJULQm1u4YLRUHBB1t1560f5I7kyg8t/wX8AXFMcdkTu8NTGREDIcN27bw7zBHvhkbop2r2LPaBTzdnyWLqtuO/R8qUHluo4xhhhhSMtaRscMkfa1yisGHwzR6GSKHzx77fBxgxmPlcfr3njzoW/Yyv8xONQAxNB4wWn6q6fV/QiNRaNutoTlVimEYv3+dyNBr2YBruhFZj/rOzcH83owqpsqAEEGAn5j1idGSOLF8k+45QJ8V3KUks2ZB9tA3Y4Vhy3NX1NRRgyl+DH9aeyWCBSHEMFY1y0iAhINjfphpzmnrRmlgPBc1/ICUhVZ8GOhNl5BtR2EmhulJ6x4dVXGmNZJXUK2LRMpWhEchfG3HgUVJ3W8OdoUyHhvCjE+wW39Oh8+LPaesM75ZaUuiRQR7MMx9+I5lKRanYsJjGaOH6FqQwL6jwlEBRDPOe3OtBlwPyjXQQMD2BMllvbXFBCKtqEYpGaj8yhPMlvrZEPe//ECQ7/b9NbfGclHFGdf0Fthvcjykfeo3YNP2incKieLIJTiFwl8ns1NHa0cWD0EH2lTo9vkPOxV+eG9haJFkiJFhfm1POVatXiv0Hw/666jhxt1WpGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(6486002)(53546011)(2906002)(4744005)(8936002)(2616005)(83380400001)(38100700002)(38350700002)(31686004)(26005)(186003)(36756003)(86362001)(508600001)(5660300002)(6512007)(31696002)(6506007)(4326008)(8676002)(66476007)(66946007)(66556008)(316002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TENhWWxhSmFEQnNRSlI5U2Zia3lFRFN0VUVpV1Z3d05XaUFTRUNkRi9pN293?=
 =?utf-8?B?T3ZOZVdPTVFIQkg2Wmd5L0RFb2cwd3UxTmlFSFIyR2ROTllVY295WEhQOTFC?=
 =?utf-8?B?TCtWM2U2UnN0eDZ4aDIwWC9uS0s5NkxFTUYrMmZQWWFxL1JzeDYzMURrOUtZ?=
 =?utf-8?B?QTRZeC9XdW1IMnU5azhENGd3eURMRlJwQktpVk9rczlEOGJ4eElCLyt3VlMw?=
 =?utf-8?B?MzY4djVlYXNsRnRVdE9nMFBSYlFxKys1WCs5VTk4R0lzQ29ibm5qcnJOVUhj?=
 =?utf-8?B?MS80YWtnUHZhd0t3RXB2YzZFRXI4MDhwNTFCR1l0bWFqbUpsMWNYbmR3ZExq?=
 =?utf-8?B?UTA3ZzI2ZHNFUm5RZExqSGxXWUcwbGlTMURXbTVCWWZXZ0poVXlnRHE4TjhL?=
 =?utf-8?B?TkhFVktZdVpNL1o2QlozeEJXeEZ6R0VsV0dXblp1SkNSbVNoSzU1cVQ1SUVt?=
 =?utf-8?B?bXg5ZmROaFlHYTRPc0F4RjRpaTYyQU1PcnpscTJreWZuNXZrVVFTdWFJWXR4?=
 =?utf-8?B?RkpWS1lVTFRqN2ZhTmZBQU05SWJsQkxnWjNxSWRjMjJhbzljdTFlMksyblQr?=
 =?utf-8?B?Zk4rZ2hlbThaK0xDQ3JhRmd6RzhHQkZUeFlnYkk3TFBRNGFGYjBncmpBMlor?=
 =?utf-8?B?ZEZ6QTFiTDVMUS9YZm9jSXVUYzM1TTZZTHN2eXhHV0FQVlV5cmVtdDM2Y0Mr?=
 =?utf-8?B?TVpjRktlRkRocHZOTDRnVE1DUFFlNFFqL2ptRVdWa3hyWHFQY3FEWkxWRlF6?=
 =?utf-8?B?TytYRVFVUkZrRWlZRnlyU3pMN3d2V01GM0l6bFM0ZG9FNWdxclNlRkE0WHVK?=
 =?utf-8?B?V0dIaVFYenl2UGdSS1IrOEVSamFkMjlDVEo1cFNmQTRLaVlkTjY3MVJpYTl4?=
 =?utf-8?B?SGJyaDI3RXJ5VWx0TkRscFVKbVJlNzYwRENzaTFteDJLRCtiM21Zb1EwWUJM?=
 =?utf-8?B?R3pGbHd3RWFEekVxQ0w2bkVESFdNbjFlV1I1RkNBbkdrdWlsNlJUSytXcnhL?=
 =?utf-8?B?WS9pZ2piZXJuZ3RpZ0pOUml5cjhVeWg4M09ycEdLb015SVYxbXhqREZFS0Zn?=
 =?utf-8?B?OXdhckFOSUxnSzZ4R25JM0RFcGV3R2twZ3Q0cFUxNnRmSkRlcXZyaUFIV04w?=
 =?utf-8?B?dnh5bzM5aC90YXJZYWJzV20rNmxNNEVxc2hRRHlpbm9UTldXYXQvemFYeFFq?=
 =?utf-8?B?M2xmY1A1cXpORER2OGNwNzIyQU1YSkMvQXM3Y01PSXExcDRRcVQ3TnBZMEpQ?=
 =?utf-8?B?QkVwek1DYmdWNnV5amVWSEU5NjNxM290MGdoYWxkMy9kempPR3FaN1pZaUZE?=
 =?utf-8?B?eTlQR0d3OWQ3Rm9PR0JwUE9KQ3h3K3orVDQ1NnR1bXhCQSsyV3RDTmpzeFNi?=
 =?utf-8?B?YkNycU01ZVMyK01iM1hKVWplVlB1NURMSURFYXlOMWhnWUxVT1pib3g3TnpQ?=
 =?utf-8?B?a2F4Mmord0pIaUlVcEZiZHkwUHpWZ05saEpJQnFmazd3anRVdHFaQ3pqOWNy?=
 =?utf-8?B?QWRmMHg3ZTFhTUpyS1R1SEhIWGtzNUQxK1VHMUxxalliRmJHRHdUMnZVVWFO?=
 =?utf-8?B?UzFQck5UQjU5Nk56SzFRSUc1blRBZ0RuOGIxQ0g1Tmt3bDdNWG1DT3NvMkFO?=
 =?utf-8?B?K0Q4VWR4S2t0amZNOGRhYWZrY0szbkZqaFNzOVN6eGNaM0JFOUxKd1FNL1NV?=
 =?utf-8?B?d2VubGJRUGpJZFpMNCtMNWQ2VHlNRkZ5cXRPWDBISml5NFVsNjk3cHJxbGtm?=
 =?utf-8?B?TEJoTW54Y2MvUGduSlE0dWxCNEdRRE5LMHZIalM1SWViT2tGekE4aERCR3M0?=
 =?utf-8?B?ajNEckJZU05qRW82b1FlaEFsa1JUWmRYcTFKTFlRNFdaSnF0b29sekp1YUVO?=
 =?utf-8?B?N0k5SFVHNnpvOWF2ZjdNR0h5dlZXaWpOSFZQRTh5OGJaMkNjVzlFM0prTDdr?=
 =?utf-8?B?UndtN29RbThzSXluSUNESHlpa1FOajQ2aE5OM2c5Nmx2S3RwM2xENnM4UXVy?=
 =?utf-8?B?UDNxejZ5Wm4ydmJWVERyMy83YlR2ZjF4NU9DYUk3OExCMGNuU3NScFFLYk1L?=
 =?utf-8?B?TDF1SUV4ZjlUT3ZxYzZxcXdKamhSSytGeTU0RXNyV1pNSWtzNWQ0dURzWkRY?=
 =?utf-8?B?R1ptUlRqZGNHbmpsYnd1UGxHVU9RUmFzaHhsSGFLd2k4dCt4VXZib0hUZ3Bx?=
 =?utf-8?B?ZUgvTS8zeUR3QjVXSmYxQ0tPMGNLeE55dE44Um81SVROQzFrMjhxZkkxM1Zx?=
 =?utf-8?B?UExWbUM3L2VRTVBZYWJFUzM0NGwvQ0pYeVM0MDFKSlNHWEJXMndicWlFNENY?=
 =?utf-8?B?OFdqZS9lZy9wM2Zhcm4wYVczOFFMTG1RVGVTYU1ibi8xYy83eFF1dz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9ddae0-d66f-4153-db73-08da212d84cb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 11:21:01.2481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmlC10QyrhUUBEZB8bHIw+VC5Ac7sY0Mq6zrAIzggrIvLMpChmTgMykUgPtuiB6xsFCEqprEsnvAF4KG2mRXHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5139
Received-SPF: pass client-ip=2a01:111:f400:fe02::715;
 envelope-from=den@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 18.04.2022 14:04, Natalia Kuzmina wrote:
> Add parallels to list of formats that support consistency
> checks by qemu-img check.
>
> Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
> ---
>   docs/tools/qemu-img.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index 8885ea11cf..14e98df34f 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -332,7 +332,7 @@ Command description:
>     ``-r all`` fixes all kinds of errors, with a higher risk of choosing the
>     wrong fix or hiding corruption that has already occurred.
>   
> -  Only the formats ``qcow2``, ``qed`` and ``vdi`` support
> +  Only the formats ``qcow2``, ``qed``, ``vdi`` and ``parallels`` support
>     consistency checks.
>   
>     In case the image does not have any inconsistencies, check exits with ``0``.
This one has already been landed mainstream

https://marc.info/?l=qemu-devel&m=164994729129548&w=4

Den

