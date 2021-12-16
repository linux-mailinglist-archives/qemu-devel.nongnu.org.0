Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361D476EB3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:18:30 +0100 (CET)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnqH-0007yQ-FL
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:18:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxnn1-00032Q-8j; Thu, 16 Dec 2021 05:15:07 -0500
Received: from mail-eopbgr40114.outbound.protection.outlook.com
 ([40.107.4.114]:16110 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxnmx-0000qz-F8; Thu, 16 Dec 2021 05:15:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXFI7+RCdqurTm57jOVkaop+IkEQbDIzBqesrfFc9oM+JCoo+x9yLLWSD3J+8+I9DKBNCFc0o3aoiubvVlbzke17uQyEpb0XAqb6WNuUEzK5RLRbTNH3ybwBfzO7tfwzo/SSk+oxpsLOPLNA4HFSqxsxjVT4MLPB5Z+I53/DL+rmuOIevJFp7uiUaAotBAtRfraHSs8SnM4mycC5JcRR2b4BbB9C8NU3qbYt3feiWDEZBHiXVz2iNAnDF64OQUjVMvsHKB2+ORovsT0geYFgATrA4t457Nbo8bMbAuM86BINSFdgHupxBaJKIfJb++XAobE6hsJ3+v7lanajtEW9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vCHBSKAksNTkCnyBkR54gie1lgdhlcyt2XQN1pZBiU=;
 b=Fdt/q403NQvpvPSNmqNTP9HWpM5EEIoItZI0bh0YZfswBzJo+Tnft1Q0CPHYUmbZiG1lLaP21KsQy1DC5124E1BrBpplgJ243eolLz2UpJg+pxcWWG5CDbMUhQ7KBMD+CwA3AGxW9HQpgYnHnxrxKSETYCov/IeblEQyMp8Nv2djFfwN9gM4ZKsY89gQ5BnCmRGUqzb7wyjKw6mxB1u0FdGQF70W2tKQNoPhMxcO1OiOjK4hw0+HAhc5JadMUP+xPZPYeERJGId/il2Zm59RYSmkOfT13+qqcSVvJSiZnyd6UK5g6x8axbx36ibQbt7Cxp0/lh23Qei+0vowgp17Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vCHBSKAksNTkCnyBkR54gie1lgdhlcyt2XQN1pZBiU=;
 b=N/JtYNPMTxy4j/Y5395HOl505NVk1ZkSv4R6DO4e3JOnyPSD3fZiLh8bGyuJfUTWEouBPkLmCKFjORT/00XtunI9QJqVzAgS44e68QmwKTnuaIa5bNbxS71BN1PVySLH5on3dxH60ezPDIgh/XEL/s2uONVh1WNouob2pYJYVTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5572.eurprd08.prod.outlook.com (2603:10a6:20b:1db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Thu, 16 Dec
 2021 10:00:36 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:00:36 +0000
Message-ID: <15c98419-372f-685e-96f7-588083a14470@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:00:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 03/25] python/aqmp: copy type definitions from qmp
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-4-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:00:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a084e63e-87d2-4112-2904-08d9c07ae7e0
X-MS-TrafficTypeDiagnostic: AM8PR08MB5572:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5572B90350053F18928FEB49C1779@AM8PR08MB5572.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bWwq3S5gksAuwZYyiBR0ivclGOd4lJ1RnulNNLJSc4DvqOEbCliEaa5MD/lZNJGulfoQH2GnO9g/DjhNRmi2gHA4ukCT8t9wm+NWzwyGTrhfF25iddCnvEoRzEAUrh2eKvumqS7U6EqDMvZDJuDvOzDQ7NoJ3UADVEkbuQLS2doo7SqWkOPqhZp+l1lnGVF4sFEHK8YpZGtNQog9EQ4FvjFY5NzrOGo64pDC5QVsotBPY1da8Q/ZgLdxd79dsP6y7oWspq7TspVGamAyZkLDMB8LpJzmR4gdmy9kXXV8IDGml7xIUR9mhz9ZcplqGcvDDlY+fPWoV+mRwe3vqe/jdV6dkOPRRrKmA8d3JWC7hsx4G9x7GpdPeN/hMBDr+AqMZ2dgJPxm0zdUQgW0Ok96s8vKpCMY0+EyYB60n27Kf2DTZw1aWtfsPN+IsmOPWnRR+MqX10Hxhr4VGcd0A1qlzZmnXUNvFUAPehB9jeoYK3UMD5xYuznZISuCPTVhDKZiIM8W1KeTc4iOts1lNG/3D7kYBcWxNknANJAyk/O9oa/dHHhx+7E9+Ku/66TjDomSVXpuo/L/dJq6xdw7ux1dKf9AdjnF69xMpdDXWuesBQTjysv6sii8ftSJkBacnbkd91k84qq1sOLp92SdORe2KPwCfSdVu63XLM36oExTXVT1yikf6lNuBIf7DQyVof+9i32Fj72sIEakyWAXUlezessyEk6z1SpiIgIq3uGYPdRDeoto/A/x38B0rpG9KsFAxP/37gx01TtCuI1LYoUKLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(52116002)(2906002)(316002)(86362001)(31686004)(54906003)(26005)(38100700002)(38350700002)(7416002)(8676002)(31696002)(6486002)(16576012)(4744005)(36756003)(2616005)(508600001)(5660300002)(956004)(66946007)(66476007)(8936002)(66556008)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTNRMFRrY2Yvb0NTczVGUWZlL1B6WmZVOVlYbHR1UVZhVlNGemcyNm16dUh5?=
 =?utf-8?B?MjJ5OU9JMEZ2OUlZdXA2Z1VMZFRLM2RoUVdkTzd3R2lKbUZFNWJRQ1ZZMUhy?=
 =?utf-8?B?c0hBQnJuaVozR2o0Z2dwcHB0b0VDTXJYK3YxNFA1dFJmaUdUK3hQWU5ncGZm?=
 =?utf-8?B?Nit5WDJ4Umo0c3g2MFBCdSt1cWkyaTY5NU04UXBGd2IzejR3cUZsWnNtMmZ3?=
 =?utf-8?B?WHFubDhybG01cUpFVHVaQzd6ZzlWZlRFQjFmUkozWnQ2a0hhaVBEV2ZBbUVQ?=
 =?utf-8?B?aFJCWDFNSXUyOGVTZWRZRGllNW4zMkxvODd1WVRmUTF4MURqdjdiNWR1UFNX?=
 =?utf-8?B?SCtweUx0bDJKdnR0MVFtcUtoamNnY0I5NzhvVHJCQVZQdjVoZkZ1REg5NHBN?=
 =?utf-8?B?TnliMUhWaDEwRURqRnM2Vk45d0tTRG92NmpHOFVtS2JnOWRQZUVWQU9ST2Zw?=
 =?utf-8?B?SENUcnN4ZXJYZXdKazgzQzVyY0FlMmFPR1k3TkViN3ZtYTMvaVd5TE1EZ2ti?=
 =?utf-8?B?c3dKaG9sMXI3ME8zZXlYa0pYOTl3SmNzUmRnMnNwbGh2RUpYMVpJUXpxaHcy?=
 =?utf-8?B?bkFNRXAvWDg4dFFSUWtORmY3VjhUOHdURGRINEZZb0pyV1NNU2hXNzF6NGxE?=
 =?utf-8?B?WkVPS2pJaWt3RWZvNmxab1J5a1E2UldodTJqN3o1WXJORTdmU1RzQm1xQW1s?=
 =?utf-8?B?bE1zQS9ZSUpiYzRNV0hnbzNIUlM4RzJCVXo3eExCcDBOdVJUd3NlZ2ZUOVUw?=
 =?utf-8?B?Q1N6Mlg1L3FNNStobFF2cjV5SFFKYkhhaUpPdTFIUGJybDFnQ1NUYWl0bW9C?=
 =?utf-8?B?OXBmM0ZYM1VGRG1VNG1ZTDR0YmF5WFVSTDZDdlVPTVlRWEJmSjZPM2xRSGtK?=
 =?utf-8?B?c29ZMDdMc0RpamEwcUlJaFRvNDVYcW1sdkxqWmVXdU00QTBoRTNUWlNzanE4?=
 =?utf-8?B?L05ldlJwd3Zwbml1T3BmRURQRVVrU3Fvd3VreHVUc3BvODZVaXdSSVZHTjQ0?=
 =?utf-8?B?dFpJL1k5b0RhWlNTdmNwM2dnTXcrSk83NHVkQjMrdWI5bi9CMTRQektTS1pQ?=
 =?utf-8?B?bE95UUlieUU3TitNUkRxd1g5eGtIVk1YUFRRYlhDc0ZlRkJlRDM1eFJkL1hG?=
 =?utf-8?B?ZE9rc2lxeCtnMytXa09aYXQyWjhLS3A1bGhwZmJITEZaeEd1VGYvVTN2QUpv?=
 =?utf-8?B?QkszaXJySVpvSTNLb0RKWXQrdEpCNlV4NnZENU03R0FMZFZTNkhBWFpMUDhx?=
 =?utf-8?B?b0Z2OXA0S1VoN2FMRlFqQkNRRFg1R1VzeUdRTmRreFFHQ2FPYzc3ajV4cVJs?=
 =?utf-8?B?R3hJQ092RWdZbGs1TE1ucS9mWDROeHdrWW9WMnBqeUNHNmFiOWZ6ZzdCRXda?=
 =?utf-8?B?MnJGbmJhcDlJNSs1Uk1qaUducGpia0s4SDZ2WjRXREN0YjNEWDg3VnZJN1hy?=
 =?utf-8?B?M2lZbTBwNTA2bWtIT3hJWHFFdnhMRTVOemR4VE9URXVRT0diTEgrRDRyWWFK?=
 =?utf-8?B?cmhYR1RWRVlVT1dQVXNuNGFxaU02NVBvL1FGa3p5QVpnVXdUT3JRb3l3T0RM?=
 =?utf-8?B?ajhmMXJnZzRXZ3BxalRpWFJFdkNiZksrSFZBcEhkNjU1RnBsbmp1eEZ6NHpy?=
 =?utf-8?B?cTY0dkxSQjQzVVFzTGxqVHVxaldsUzVtbTF5eEhVbVRaemp6M2RGZFNRTjZV?=
 =?utf-8?B?c1ZGUDhwOTNwSHpWNC9BWjJFSHFTekVWMmJBdDdIYmNNVXlYWHl2ajR2bTBj?=
 =?utf-8?B?SUp4QjhjQ0VIMkN2ZWVFSkFkNngwS3Q0azBydHM2TmtPbHk1My9yRjdXOGhs?=
 =?utf-8?B?MkRFMG1Lb3ZyamJwTU4zaVlNb2xHMldGWWUxWjFldzBUR0lLTnNHeDJPbi9m?=
 =?utf-8?B?VU9ITnBSRTNGc1Q5R3FTcGQxb0hXQVlKNEMrYVZOaEtLL0ZPMmYwTGJ4TDY3?=
 =?utf-8?B?enJWam5BU0wwT2xZU3BtMVQ3MGRNNzQzczdnUVYrZFgzTHh5UkVrcGpRZG1v?=
 =?utf-8?B?WFJoQ3RLeTF3a25qLzBERjBleXRoTk03eFpQc2cxUWVOMERaMnRXUFVLb0pS?=
 =?utf-8?B?VVFyUStQWXJlcGhYVVBYSW0yWGMvaW1kR0lQZVhmNWxLZUYvVHZBdHpOOElB?=
 =?utf-8?B?WEtKVHEwODJtM1ZPcCtKOXFPVVlkTWZubmswV0Z4ZnZpeFAvaFBGSVJlSzdr?=
 =?utf-8?B?NUVVZ2h4S29qOEtnMVdYRG5FUkFqVWt1dVhEaWcxZXZNVzdwZXY4Q0lVaDZD?=
 =?utf-8?B?MWhkQU5mNXpRZlh5b0ovMGd0MnRBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a084e63e-87d2-4112-2904-08d9c07ae7e0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:00:36.0895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhheVRIvqACaOgjc2VPaetzmgKxfr0WavGGB1DSGDU6lfJz8ftI66i4ClOmi4SBzDZm2acSwLzTqzuuHfjSPbUOX/+ZyIQB3SMs6tcPEkQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5572
Received-SPF: pass client-ip=40.107.4.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

15.12.2021 22:39, John Snow wrote:
> Copy the remaining type definitions from QMP into the qemu.aqmp.legacy
> module. Now, most users don't need to import anything else but
> qemu.aqmp.legacy.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

