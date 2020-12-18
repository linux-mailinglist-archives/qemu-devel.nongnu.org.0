Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAFA2DDEA8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:36:35 +0100 (CET)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9NS-0008Ep-EA
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kq8ti-0001h5-NH; Fri, 18 Dec 2020 01:05:55 -0500
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:41903 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kq8tc-0003kd-Hs; Fri, 18 Dec 2020 01:05:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWV9xCyDL4Lexm/6EzoAE0jifjQYYCb+PDWyCFOiJ5c/qEVLoIWQSh1CiIgkCQ1WB8xg5LoZ4yi3dROtZjOXaZ938Osu2at+oz1z5nrh6Z8ooAXIhIUBP4l0+4GyHaedjfw47R+1Ej3H0zlhxinQkSAJ8WGhh4eZuYWAdGIW/tO/eM5EQ/EKAIuc34RiYPBAN+8cFT0ijq4daDx000UNpMebVL9EICduDmQuHOZKEhQrzbQrpuL+XJ82o/PVgqnbxNgM5KOT3C7FGfRT9mJuCaajoknPPn2r5+rZXgaN6GIe0lpdkUSMTR/bxfUU2/4kKItBncsnbEGW5ZP3Vxv/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=is5y8cBpKLuWy9Sh9Vr2ebPwHoNFsks5kf8UHh+Bjsg=;
 b=afhyADj0exIIBlDMmEY2Q6RgwoJ5B8tlIK1fQ44x0voYRZDN0rLS+rqLdxW7nP1rCV4Jc3TimH9xRyAXyIF68fJXB2WIUBfOSEadM5Cy2txDjf5Hi8fzfo9n3LUVtIHKzAtDzmjGmAV+Uf/IpVxkagH1SdSHvMvmXfywUDcL8dD2azlFI7AVb9KMCmK8l/oNBLo+ymSWPmzIjh3uoRCezeOO0yy9whjl6zHzPJ8J69B1hDxt1m18L7uwcFGh1RNQG+8YBIlqPWROWOCyVpVO+7qMsCd8QEx9h+giZEDRyehdGfodR9HFvvuelx6x4CBoZn8i7uPyzzhPhl5NZywT4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=is5y8cBpKLuWy9Sh9Vr2ebPwHoNFsks5kf8UHh+Bjsg=;
 b=P6IvWBz692cOybjebVHQ5PnpArTZWxopRdo6w2h9B3MpgE1mGrESHcF+qLZea9RDxBtBXJPQgm5dJob10D096RNCjbzhdziGDgO+0BupB7QWc8Ij98bYkYGvxTddSjy5hERzerD2U+dpYTG8pniGmV37VRbX+3vYA3fG53P9K3I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 18 Dec
 2020 06:05:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.026; Fri, 18 Dec 2020
 06:05:40 +0000
Subject: Re: [PATCH v6 2/3] block: add bdrv_co_delete_file_noerr
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201217170904.946013-1-mlevitsk@redhat.com>
 <20201217170904.946013-3-mlevitsk@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <933f0085-e1e0-3408-b6b9-727e67311c88@virtuozzo.com>
Date: Fri, 18 Dec 2020 09:05:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201217170904.946013-3-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:208:55::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR04CA0125.eurprd04.prod.outlook.com (2603:10a6:208:55::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 18 Dec 2020 06:05:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdee05e9-e481-468d-f529-08d8a31af272
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494A3A76B55A41CC6289179C1C30@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qa3fsLUbQAy55hdUwMVjdNF5I96D9S23y1+TOTjVXyD1GaM1o+VjhYaP3Yi8d4lBYlpTUub4/WU6Wxf5Aw1Utb87+i0W9zGsH0DE9R6t4rRPH9/tvUrVbqMdtLNfoTNob+C5/YL7R5ExWk2skLqoVyyXQak+ZGTv+cnAgroI7nZwtYCRevHiqKG3GjNIboNbRmEiHqRoL8tc441Eyh9N8iE/3Uhn2BWIemyd+5xxzve5AFIXDeffx8Zgp+oOxMyaVBNSZiOR2R0bhRcHGf2yJnZHUd9DYDLnGFYcLqf6AQGej9dB7RTMDt1y43w5jI81J0befHuITBo0z3Y+Be8IE3Y6SsBeb32MLBT7kAkmnZs8iftecVwSfJ89YnTqgwl4/P0oJ8uTwhh/+uFJL1iVFOFM0nIXx/9kFr/qcjVFMKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(366004)(346002)(396003)(376002)(136003)(54906003)(36756003)(16576012)(31686004)(956004)(52116002)(186003)(4326008)(66476007)(316002)(66946007)(31696002)(6486002)(86362001)(8936002)(2906002)(478600001)(16526019)(66556008)(2616005)(4744005)(83380400001)(5660300002)(8676002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUR3U21zTFNNS2hDMjdBSHhYY0JEV0NlYVE5VjRVWTM1NURYdXJVWm1oL2gr?=
 =?utf-8?B?WG41YXdJNE8wd1ZSSXVrZU9VUGYraVdIbUtwb2dod293bVRQdk1XVTUxcEhw?=
 =?utf-8?B?aFljMEVuWnZ6allQQWc5TXVlc0NsZ1hXYUlwWEtyNEV3TjVJSmJEdEcrUndv?=
 =?utf-8?B?WjBqQ1FnTTVVNzVxaXFsYjYvdmRnZ0N1WU5aNWh6K29mZC9IUjBKVnBDTkp6?=
 =?utf-8?B?VXhsVjYwdHdSZk1sZTlNalNMR2M5cFlvSlFWblExck9YZy9QYU5qWXBUeDVk?=
 =?utf-8?B?NEhuRDlzWjUwTXh6N0lzdCtUUklIcjNndzdLYWdTbjMzNlVxSTBxR1lUdzdS?=
 =?utf-8?B?bkpGNEJXbFduRWVxanlDU0hPVFJXMCtob1MwazlTeUpCRFRac3FrT1g2YVJK?=
 =?utf-8?B?RWQwNzF6cUk1RUFHbnRZaG4xRmpmbitGNk4vZXE2OUlpZGlGZExxVE41SERQ?=
 =?utf-8?B?UWtqMTN0cEdleFM0WFY4L0JkTjFIMUdpTXFzY1dTTkhWNUlQTXBnNExEY0R0?=
 =?utf-8?B?WElLOUQxa0VUWDlkVzFNb3BkY1BTRUNVQ05rSHVuV2RFYWlYa3BtMitVWURu?=
 =?utf-8?B?VGRaRjN2T05TR2lkL0FrcjRDQmdDS2RnNkl5Y1ROOUdSTjEvb29GMkcwVzRk?=
 =?utf-8?B?bUZjN3FJWWFjWG5Kd1MzTE5ZaWRHMkpxQTJTeWFrVGdxL01BRFJiLzIrRGN4?=
 =?utf-8?B?SGZsays5UDNPVS9WSWZnY05BZWZkT2NMQUI4bDVMVDFRbzZ2Mk9pNU1QeDhB?=
 =?utf-8?B?ck9YczV3d1lteXlPWHZYckF5QmRzaGdRTHQzdkx2emVJa256RGJsZzcyY2NO?=
 =?utf-8?B?cjRXQXNldTMvalVPek5kbFd5MDhFM1NrcmpQU2xXZDZpekYyZ3E4b3BFRURV?=
 =?utf-8?B?YWVGYTdJUXdOZ3dsRXoyUWZIL3NhMk1kL1lJbmdwWlZrZXVyUkZLU3JrQ1BS?=
 =?utf-8?B?M2RVWWZLY2NsdDZpRUFpYlhNYU5wQ0tRSjJhUk1iVExCVnhleDdpM05pU0sw?=
 =?utf-8?B?V0lCaEZrbHJsU3U0RUVUR041b1d1em5wTFBaaEI5VHB4L2FyOGtWNDZwYkgz?=
 =?utf-8?B?THlxWjlWRlVldGNyTGwzUklhS2ZIZHN6bjd2L1ZZMFMyYUw5RlZtWndpTW1p?=
 =?utf-8?B?RlhLMkxaOHNIQjJrSzlWVjhMdVd1MEZZSENlUGk0VG9FRjRDZXU5cUdOWTVL?=
 =?utf-8?B?TGJOVmxCaHppbVR2Rlk5NWM1ejRQNk85SE90aDRSTGVkeG5Gd25yelZtcG9t?=
 =?utf-8?B?akRmOTZ2M0lQRG56aW1GSUFrRmVWS0NxQ0Nzam0xY2h5WXU3S2RiMEM5L1Bh?=
 =?utf-8?Q?drIke21zpNsW27oHWndwhswqgmTWjYqDTS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 06:05:40.3787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: cdee05e9-e481-468d-f529-08d8a31af272
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Scfd8fxbXgQwDQO3S0r4CAhKzVXPYV5gA8Q035mVI5ulgPUMQ7v2XZH2Caz2RWtdxKTlV6OJ1wtcthXTfdD/kTyTq7Jt3M2BAqKTPKOOtAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.95;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

17.12.2020 20:09, Maxim Levitsky wrote:
> This function wraps bdrv_co_delete_file for the common case of removing a file,
> which was just created by format driver, on an error condition.
> 
> It hides the -ENOTSUPP error, and reports all other errors otherwise.
> 
> Use it in luks driver
> 
> Signed-off-by: Maxim Levitsky<mlevitsk@redhat.com>
> Reviewed-by: Alberto Garcia<berto@igalia.com>

I still doubt that not reporting ENOTSUPP has a real benefit.. Still, it's preexisting.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

