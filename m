Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0AC512EE8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 10:47:31 +0200 (CEST)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njzoA-0007S4-8A
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 04:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1njziT-0005c9-8g
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:41:37 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:21118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1njziQ-0005Cb-G1
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:41:36 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RMpK5S023844;
 Thu, 28 Apr 2022 01:41:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=XC6gl9nruMbRvNgoaRe3t4AyoL2KIbL4VmzUGHScSrs=;
 b=LbN+D/1IzI5Gn639MhT8aAf0BhldHmzXye6wBos2N1Lz65X8brXp01kBG1M7qt5NKF84
 HWdbZgF90yfQu57WQKH/zvFvOLdOlEkTYdxprFuUJK6Od4XQ4nb5q5hKTF72bAkbQ8+g
 EaPgBfzVHW7//nqcWl7EGlmSGkplk9Z0fq/0hTmfXpyc5WlU37q4qbS5zGWayBr3McJ0
 daexmr5a3ZzEnufUaqFaJV1mrBhC5IlbYViGQtvyRkzU52L+DlBxJ4BYncYMk+qvlhy6
 0bVbqTqhJNOwiNxKxSCvN98ZPHAQ7sFRkgwW67j/gdfxtUmDPPaCCLWNwdVYWAT/ATbb OQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3fprv93gf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 01:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfK0kpM65y6zxqsPxNbdYYl6jHYKm8h6KAmuN5NDi1uMz32BYvaMcEszgxauj4/v1lGNjC7NNrMT59n/jE4Wapk3Se2J8slwR5YDO3ezQfKe7h5TLuXeHScoYI1WRqevUITdZTg0ZZdQgfwEryB0Qqn+f3sD/sEBG+CeOSyLtaNawVTtFIVTdblwWK6HeWIBrHTcytp3F4zN0FKtTCq2zcyULuCJ8mwlWSEUnKLhvwNcC6ZoydsvDU0e/gHTY4qvJhyHTlVxrF7I0j50jzvQiHM7hz1jzESqe6A3hZVqHOXIp9VVCiDD+Gqvbaqijvi7gu1KonI8h7i0xrVHU6eNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC6gl9nruMbRvNgoaRe3t4AyoL2KIbL4VmzUGHScSrs=;
 b=DlL/clcU41E8sSb0vYtOdP5Qs1T459uUBw8rwiLaVCcqAGRTU1HFwflL0nkXBpz3IZu5P1aIHmcfY8+5NEMf5K+PAYdOWao7CrCLA9Nov8HgXI8tIu3x9hxyfoK5CqpuDeT/467CtPcZJrICU6Rau4NT4+tLGjDvOC0hs8/McXPOXT4O4YGDt6OwYV9IaEmnLmVwXMEf+3U35dMoNje+jdMWa16mbkreO9L+UsqOv3BChBBhUWkWtlDFqoYgA5Zep4eyeDWEtq55sm9K7ZEcquGMzIX16cFYXtTb4AdXKk23AMQqPB6JGiGTbme1K48Yhgk5cwubr+LMFf3HfpF3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BY5PR02MB6803.namprd02.prod.outlook.com (2603:10b6:a03:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 28 Apr
 2022 08:41:28 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::852a:4c2d:6243:8c37]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::852a:4c2d:6243:8c37%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 08:41:28 +0000
Message-ID: <0f69ce75-24b9-4c3a-257c-9bb8c4ae00ef@nutanix.com>
Date: Thu, 28 Apr 2022 14:11:17 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PULL 2/9] Replacing CONFIG_VNC_PNG with CONFIG_PNG
To: Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220426110358.1570723-1-kraxel@redhat.com>
 <20220426110358.1570723-3-kraxel@redhat.com>
 <f3d9e691-2b81-3143-96ef-53c120e6fcd0@linaro.org>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <f3d9e691-2b81-3143-96ef-53c120e6fcd0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR0101CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::29) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4782621-c901-4667-6b2f-08da28f2e2f8
X-MS-TrafficTypeDiagnostic: BY5PR02MB6803:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6803FB78846824C4FFCCB43299FD9@BY5PR02MB6803.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k8KEHtjsyW/HxExWfxXox/8peyrfn+ZEWEQ0XuZArpjqQYak3ENktShroaa+Zy/mJQg/e9TJS+oP6HhIMjjIUagyzPIY3hMDYtsByP+EUwhtnB2q5e/EJAj8NvJNe5yMZVOI+gmHazkeD5jZLXSleMTyNeAH5cqBTsZnDCKHvPBKBnS/dgbnUws3GWHHixoxn9luSIrsp1CCT2RzB/jWutxgYm8yg56pGhHK/TLTjw51YJHaV+vtJ4iV/NxVybV4yWNlgKvO1xmxoBrdKCBvlVdRGHljNGwpFIbHbuzfU1IVl7AhLFaNAFY5OXHUG0RJlqyXZ3Pq01X852vKFixmWxP944CQxoAFwzWuSWPYvQwO9CKavKjSXHn6im1aj4chUVZfnP5SfePd00HbAaYu7wzz2Thzb9DSkTmN+6MdSJa2c8cy0QbWG24fzHKZt8TSyUgZd+9xVxNHPXdnfTzxOWV8oDvaPzfHrnw6Dm1o1zBWYHrvtUownh0xPuYj9W11qcPdU3yL3ITag9pW345utZ+1cClrvnQIBLIV8q+ScIkWWfwJpeM6WSl6PxnM+6NlrdBrSceZ3jZrsLjrXjzQjo3r1P5xgrmddKnPhVoictXjlbkwKeopLhNOXxpVBpIsizj9VjZkLPROgfj+6OQx+TGw4NhoZLHUVrmBkWmKWnbU87yjXbQ/vQudd5nflzvrhr33jsXcK2/Hkmdh3WPcb5pHyBFJKZB+t4+s2C5lvJZYPYNon5K1U+wKZOxB8zFB18JgyGtOr5ykitk756mEgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(6512007)(53546011)(6506007)(26005)(83380400001)(186003)(31696002)(86362001)(38100700002)(38350700002)(316002)(2906002)(110136005)(44832011)(4744005)(8676002)(31686004)(66476007)(5660300002)(66946007)(66556008)(8936002)(508600001)(6666004)(6486002)(36756003)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWRTN0tTZ0IwOXQvVVJVV001SEw5SnY0MFUxczNwL2cyL3gyMnRjaWNEbHVX?=
 =?utf-8?B?NjI3SUE3WEZnMm1xaUhPZ0t0MW5XZktvdWtTZkZxTURraGRuQW1pa2xRc2Vo?=
 =?utf-8?B?aGNxSThndTJtK1J5WVRNNHlldWd2enU1bUhZMHVIMHZYbDF5clIzWDlISmFo?=
 =?utf-8?B?a1g1NWZkUTZBc1pjY0F5ZCs2L2lRam5nakx5VlZoREJRbWZiODRZWlRvakNL?=
 =?utf-8?B?TmttMFI1M1Mwb1o1UDVRT2h0dzN4K3R0ZWZYWG9VaWFhbC9FaWlwUWN4cWVM?=
 =?utf-8?B?bklSKzB2UWMxd0dlaVBYS21YR01ReWVMcjJOK3Q2bHB0VkphcTNOSDV6SDls?=
 =?utf-8?B?Z0QxcGZkeXNoMWI0NWJZTCtTQnVkK205ZUZueDM3YUZJUzVWU2hGWnVJQXdZ?=
 =?utf-8?B?UjRodU01bEtNWEdoNnUzTWZjQzB3UEhjSmdUdlRxcm50VWhkS2k2cEJkSlpR?=
 =?utf-8?B?UjMrWUV3ZFVMcU9zSnFwV2ZJZi9mQzNVRC9ib1Rsb1Rueit1Wm9uRGwzUm5I?=
 =?utf-8?B?Qjk4S1NZNWpldFVOeXRHL0xqeFdUbFZZMFgxVDVjQ2ZaV0JuS0ZzcG9zdTNW?=
 =?utf-8?B?djZaaVhIMGN4RDRrMmVFenVUZnVCblpMTFZVTi9teEw1TUhUSUczb05wTkNG?=
 =?utf-8?B?cmtKaVdNVkNVZkM1M2RnTElyZHZFaXFhMlh6RVQva3VEZnlESkcraGxCNzVG?=
 =?utf-8?B?ZFQyNitUaVc5czBWZzBXWHNkNk45dkg2SVJoV0k2c2hpS3V0aUFWK1krY1JP?=
 =?utf-8?B?MmpwRG5NNXhWS29tYS9rcFVDVW83U1AwK2lrSVVZTXI5ZUVDWVgyOVF3RmNZ?=
 =?utf-8?B?ZElsTWpyZXIyVDlzTUhmMnJNNW8vcXJpQy9FUk5zaHpYMDZXT1VRVXVkY2Rv?=
 =?utf-8?B?QW42QmFXYng3YU1lSlRSQ0dZSG1kQzRsUEtoUVVYRE9KVWpZWVpUZVF0Z0xw?=
 =?utf-8?B?ZkJWWHFQak5JcFR0QTI3M3A1NitHeUd2d0lTMjJSYk1mdUM3bjdlaldSVFVZ?=
 =?utf-8?B?b3NKK29ybFRsZ0Vud0lnRG00ZStqSEhTTU5nNkp3djNrbXhRSy9Ha1dmNEs0?=
 =?utf-8?B?V1RFdGxxT214TXZ0ckJXVDVTbk1hZFNwRElHYThVQS90THVTaUYxVzYwVEpi?=
 =?utf-8?B?UG5wYmwwQ0VjVGg3WGNCNHE4eGlEUFNONTZRdlFMcVpTRHVTMGl5eFB0TjVx?=
 =?utf-8?B?VS9kMHNicWpCSmhlRUJqYTNEbm1GOTVMMjU2N24xOWIvbTF4VnAydVhHdnBu?=
 =?utf-8?B?M1NwZXpkdjdtdWp0QnJTUjJEU2RnWmJxaFVaRU8vVHRIQWJtTkZTQ0xqaTF5?=
 =?utf-8?B?NTVQNFZWK1FIajVudDVjT3QxQmcwdXZVdjFEeEltOExNRk1PcGtINUNxeVlo?=
 =?utf-8?B?d3B1Qy9vTmpWcXZoN0JGMlF6RndLd29BNlF2b1huWkRWK0sxOG8rdWtKYXJJ?=
 =?utf-8?B?UUxEL2svOS9jVFdlcGVHWkJkMUxzZU5BZ0dzcThoaW9kaDRPczZSRytWVEV5?=
 =?utf-8?B?MkNIbzJzckQyRVZWQXN5NHBQekorQnk1VVJKWldyVGRXdGNRMXdSK2xOSDZk?=
 =?utf-8?B?YUdRd0hxVTRNZG12bm5BT3pNVEFacXdwTEQvYTZidUxPcC82T0gzbGd0QWtV?=
 =?utf-8?B?a0lQUXgydmNVSXBneS81UXJwZWxpUExONWlSdER4ZXc1T1FBekgyUWFjZ2VM?=
 =?utf-8?B?Y1BIV0lLSCtLdGFHUkJMNHVlQVhHOE9uMGsyd0plVWpISTlRMlY1UXE0SHN0?=
 =?utf-8?B?Y01uT0hVdDkyVEhXeWZNdFNYOXMwSWRwZVp4MFNPV0J3MWQ2SlRmRjhLbjky?=
 =?utf-8?B?TEk4bGFNNVlkREpKOGcrQlhkNzBGSkZ2V1dSSXVMS2JCMjVrdy9Oc2dTRys5?=
 =?utf-8?B?NW5rZjhjRTN1NFNCVEQ1THlsdWorWHVFMldldVhCanI4ZWhOQk9QVk1ocThu?=
 =?utf-8?B?bTJsQVk2dHhQLzhaUDB2Y1J4akg2SXVuVTJGMUpSZkdIeU1LWE5WVGRpeUQr?=
 =?utf-8?B?RmcxYXZQQ0R3RmRlWXF3aEFyQ1pSSVBuaGNuS3lnaG9Lbkp0TFRJK2NsMkhI?=
 =?utf-8?B?c2NkaUZiNDlYVEpaUUc2b1RXR0dmUGFpYUdDc282WVFadlFhcWFtMmU0ZHVZ?=
 =?utf-8?B?RHNZa25FZGhhN1RqMjlBamUzVXB6VXJ5N2V2VjA4MG8xaTNUREp1Zkd2RHF0?=
 =?utf-8?B?Ui9VWERuek9KUDZ2dWRkQSt2aHhLRVh2UWVBV2dDUzVRa3VzQzFNVmFrVHcr?=
 =?utf-8?B?dzhzbWFPOEw4UHdwcjJLbk1vcG0vS3lYYVg0TkhGQitMSnFkcUZYUDlHK3Iv?=
 =?utf-8?B?NWV2WWFtcUFib09HQlZZTDVmdGw5UEowZGpqdWtpRVR6U3BIVVdGaVdGQ0tW?=
 =?utf-8?Q?u4/qk8YwcnM9NsGA=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4782621-c901-4667-6b2f-08da28f2e2f8
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 08:41:28.5067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crtIJOFhiAHfFyRZ4KVQTzhD6B0M3J6zt04Oyqu0UryyjJmMcgGenBtu7XASiir5VYFJxKpQ9NuC2IndbG3BHIFdJPymAGPcTEm1egaxJu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6803
X-Proofpoint-GUID: YS3xMmYmXvU0_Gwi_-rZG5zMHmuD5yUn
X-Proofpoint-ORIG-GUID: YS3xMmYmXvU0_Gwi_-rZG5zMHmuD5yUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi,

Apologies for missing the references. Should I send an updated patch for 
the same?

Regards,

Kshitij Suri

On 26/04/22 11:05 pm, Richard Henderson wrote:
> y detected if VNC is enabled currently. This patch adds a
> generalised png option in the meson build which is aimed to replace 
> use of
> CONFIG_VNC_PNG with CONFIG_PNG.
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220408071336.99839-2-kshitij.suri@nutanix.com>
>
> [ kraxel: add meson-buildoptions.sh updates ]
> [ kraxel: fix centos8 testcase ]
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   meson_options.txt                              |  4 ++--
>   ui/vnc.h                                       |  2 +-
>   ui/vnc-enc-tight.c                             | 18 +++++++++---------
>   ui/vnc.c                                       |  4 ++--
>   meson.build                                    | 12 +++++++-----
>   .../ci/org.centos/stream/8/x86_64/configure    |  2 +-
>   scripts/meson-buildoptions.sh                  |  6 +++---
>   7 files changed, 25 insertions(+), 23 deletions(-)

