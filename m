Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD8476E78
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:04:01 +0100 (CET)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxncF-0006Og-Sg
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:03:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxnaA-0004O9-4v; Thu, 16 Dec 2021 05:01:50 -0500
Received: from mail-eopbgr60119.outbound.protection.outlook.com
 ([40.107.6.119]:43590 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxna6-0004r7-Pb; Thu, 16 Dec 2021 05:01:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVq9ttHrKIMutFQwvGOmcNLTQXMn4kLGwXXaeyT8q1Roy+hS1g3x0zrybtB6v8XzTCL9mazV6xkvpPRzO+tW1aEoAf0azsJS9vg4Uku2aHPYRlCxA+50UGdO+MsXPPvM+kzhp6Pxgnh96uQstKDfD88TCuL0cX55WdyCadL9FY5neBQL70hLikunS2WQ1fiVihdtZb7FWSMcDMTl8cKst5BFprirFhAULI+38Qlhy+yJqUgDDR4vDbYM+iuhjZnh0kGl327V0/ZUsXAcUXc8ChFJLsLkm93u+F32Fpjq9iSG12JKR1x1LG0qfsBdEk5eAW98tPk7I73c2AxkLN2Ppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy6pgyV0kGN39Oawv2Q6eZ0kq/u5c0miEKSPMI/zqD4=;
 b=KTN8/8PNcfQqxqdTPoM2WGW8lc5wnEa8UbK/NcdMCtjNP7Dwnf0vJ77jKYfDfO/jU2nKF31Cpv8YgPTQFVkG9OzYq0LWh/yTCNf7D91yBe6Q1y48LnFN2m+XwjT40H/H9vf5xulXf3hbTJUpKNUT3eVzjf/2VmmeEahZTGN5JNjY5a4bLeEIGpEs/Wz5uIT1Cvl+ZuTUREn2npYYRG5oBUL6diaJbWcdv6kd3ZitnAsrXZBhf87mtclVmCWl8yZXeUUia/LhPEytdSwlcCHmzY1MzMaEgWnxi831WlEtj51O0M0/SiaizUT/xIh8y0ZAdE7/DP3Ifug2SP4NIX1elQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy6pgyV0kGN39Oawv2Q6eZ0kq/u5c0miEKSPMI/zqD4=;
 b=S6G2n6m1AxcYrtJjOS0IWd4/ALCSGaf9Gas8AJKYeonkgqN0CXKydkSEbtqyEjaR8yJcF/02mDzEsPnwwRotmcKDCP2J1+5WITg3BgWfawOn9/Pida/hlKdgvc3hvq0tkMyqKbEwJ42rGtRwhBLX2k8Te+NJvrmymQZf+F4sbv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4964.eurprd08.prod.outlook.com (2603:10a6:208:157::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 10:01:41 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:01:41 +0000
Message-ID: <1a066a95-0ec6-1919-6350-12831f90d6af@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:01:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 04/25] python/aqmp: add SocketAddrT to package root
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
 <20211215193939.3768033-5-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-5-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:01:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17ece16f-e9a6-4497-9cad-08d9c07b0eb9
X-MS-TrafficTypeDiagnostic: AM0PR08MB4964:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4964393A5B78E54F4CB912A5C1779@AM0PR08MB4964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dA4i/T8aSFC0xIvELaXu/kfUOkqxoLcYkmHiAPDbgFzocnvWVrBcoHgoCxVeNpq8OGtbTcydZBIqPYDK3UPzyFFE2+fHBMQ6EVXrIS2TAG20FTZHMI44xmqszhY3Cf61DhOLUCyvFaXIxcJgkTmMu25jArP2F9H7WvsAC8Pj5yyUurf+n159Rj3crM7IKdiuuuTV9wLi7bmfzDuYR2ty/iYZINrsq2wlkoPzpT3Gobvtd+/lpq2niElSCxm8Uc2VfN64UdOeOCFCueF4I1WLHLHX5S7gBzyc3117lqaWxjxM74ZecncTnFgvnHWRAjfVCe2KmTPzTp4NqbFIJ79oT4NltGogmH6HbdUDGGXTu4uwyanCBd1lUwPK1P/1hBxak35U1ywldBiBjyGSyIhEKedeV6y+FNmSQgZ88WyZT0jy3x/9JdICJ5o3mBqchWqCgqPnSkHe2owYD02Ieb8GK4tqV5cKq/rvDdD59hoaWAFZZyeRlKg3pWyJhtj48qEi7Cjo0GQYegHfkAGJTAEO772jNmolDFKq2bS3MImQoF16c0TfwO6i6/HA+64B0ZKqpclUwXAP8NQXVnIIbeM5BzuXjKSFdn9p1ZSIj8bALZMsEmUepLGbwH+dnGAPdswGOYSMYnlboIDjlrW6bPl8TU69kItiZhA95AwC4RFh4yCEl1/8IZg4PwCLrdczbP/m4PNU1TqWEyV4uRVXCs5Turh0TCbT45zZVD+rf9aWMS2BV23v7T88ULHe02AwevVAr5abrFkS4CRZ1w83sUtlLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(7416002)(52116002)(6486002)(2906002)(66946007)(4326008)(316002)(8676002)(8936002)(54906003)(31686004)(86362001)(508600001)(2616005)(5660300002)(66556008)(66476007)(186003)(38100700002)(31696002)(558084003)(38350700002)(26005)(36756003)(6666004)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzY1YmMzcmk1aG5EeEVEc1BHUklYNVZ0M3p3WmtuTHJGM1lyZzl6ZHZCYjdt?=
 =?utf-8?B?Y1YxRit2V3l6YktKK0QzeGtBRktzdG9aV0ZydEZHUnBVc2ZBWXN1TVQ1MWpm?=
 =?utf-8?B?NytnQ29GMWp3QlNpRjB6aGVUemNuU2lCMG4ybDNrT2lvRE9NZ2Y5UW9xRnQ3?=
 =?utf-8?B?L2M1VDVHMXl3c0xOcEM1SE52UE50SFhwUFY5N2ZSak9IaHF0Q1FvL1p1NXhh?=
 =?utf-8?B?UzdrMWVmQThaT29vRWZibHdwVUVaSmRBajdPMVpRYnFqMzhmekdncElXR1JW?=
 =?utf-8?B?eGhVUnE3d2E1Yld1NkRHa29Na1ZkWWdpczd3SDZXMTdPdGR0MllidzZzNGlC?=
 =?utf-8?B?YUhIaXB5aldraXp1MkhodWExdml3TVRsY1hGdGJwWUVTTzk2V2ZhSHhMTDlx?=
 =?utf-8?B?ZkxkK2JSQUsvYy8zNEtNR0lQaXA4SWswZW9EOWxuZHF5V2pMUHRYRm1PRjZV?=
 =?utf-8?B?WHJwamVUZ2NuanZVVzRCaXJWa1FadlErZ3orNEhITUdIaEVOaFVqcTZuQlNu?=
 =?utf-8?B?YTRYUkMxR0hKOFdHRjZTQUlSQ3BtZmZtVlRiK0dOOTFsV3hvcnlZbkhvZEM4?=
 =?utf-8?B?ZGUzUEJuK3U4ODUvZ1psWTFsUTBuaXBnYkIyZzNRMmVKRkR3NnFBYWtOMkVl?=
 =?utf-8?B?dVIrQVBVcStDL21JbzdBcVdmUVZSQ3ovVWtzcU4wMUVVUmpCdVErNENTNmx6?=
 =?utf-8?B?Q0lXWWFJZ3FWMnE4T3NVd1ZZTkxNbFJCWTU5Z1l5aHByckp1V1lUVWorMm95?=
 =?utf-8?B?d0pUR3N4RzhvMG1zQW5MWmQwTW91Z1l6VkdiS0xkTUFkd1BzYVhucUJxR1pO?=
 =?utf-8?B?Z0hvN3VoQWc3SmNxSnlyVWUyT3hma2Z0N01FS3BpblF4SjVaeVZNVEpEbmwv?=
 =?utf-8?B?SC94RmkxL2N3YWJPMFRiTUVGYUMwalp4c2xrR0tJZkdBeW0va3oyU1pTUE8r?=
 =?utf-8?B?ajZ1T0dHRXFCRVJ6UHR6VHhWZkNoMDYweGhScTNnVENvYnZEVGtKbGlrTjc0?=
 =?utf-8?B?NVJHZWJFNEFnTE9TTDRRcVNOci9QNnFORUdYclQxUGtWRVl5M0xITXp1WDJt?=
 =?utf-8?B?ZU9XUkFOdkFnRDVEeG1wR2FDYmM3ZjVIVjBRUDFIYkFMcWtYSXZoMmpHQ1Ew?=
 =?utf-8?B?LzlmWXlpV01TT2hSZnBlMUREZDVNNElsMndnY2l4MS80bzZZQnhtS29Xc2da?=
 =?utf-8?B?NnVFMlp0a1hSWjNFaE82clYxano4ZGhWZmJESllKbE9QNnRLeDFHNmRpUllt?=
 =?utf-8?B?bWpFeEVHTFptV2s4S1dlNi9OQVdNZW12c3V5TXhxaWdESVBTaGhBRXpWTjZN?=
 =?utf-8?B?VndsWVgyME1KTWNVZndIYklEWUhDM0J2NFUvVGJjNkF5WGZvN2phdE1ZTksw?=
 =?utf-8?B?ZW5NRUowbmxXZHhDL1ArVW05N290dytYaVhpR05BZkRSSHcyd0kzNVhDSHdt?=
 =?utf-8?B?UjhMTTVaZTBCZDFCM0JlODgxdElISmx4N1JHY2VkRzd3MTN1RytBc2NoOFhI?=
 =?utf-8?B?Slg4WStlSndaYlR4dDVVcmIvZEFVNk1YNk1xbHkwSWU5ayt5RCt1WWFXdDlJ?=
 =?utf-8?B?cnhEb0dWOFZ4UGNMem1mTjlVWFFuYnA3eERhZkd0RzZpb09DVDhqb0llMkFk?=
 =?utf-8?B?MS9sMEZkL2djUE0wYmNsY3dCVmVQV1ZKdEI1cE1sT1VYdVgvT2tTcmI0elBO?=
 =?utf-8?B?SEJRNk9sQ2tOakJ6M002bFJVNzJBemxFaUNCcGpCaXpyQ3hCejd4dXVJSkE4?=
 =?utf-8?B?QkpURk9ZYldHMGhGY1gxYlNld1UzVWJQTlM1WXVqKzdyQ0ZSWGI2dFFLd2hw?=
 =?utf-8?B?ZjN0cHlZRmFWN3ZLR0drU3o5ZkFFRHA4N2xqUENKOXNuNWlsYnBKR1BqMWRF?=
 =?utf-8?B?ZWpaTExoT0lCeEdqTjZqWGZhL1BiUWRMSVVtOUtBU0pMOVRTVW5RMFFXRndH?=
 =?utf-8?B?K04wWjh5V2l0U1ZTL0RURHMydkt0N0NOcG1XeXpoOVFGb2luYVNWNlVncXM2?=
 =?utf-8?B?dWRzOHlMenM1R2NZNTRZbmRQc0t0QmxzZnZud2dGS0FsRTVCZVN0V2pYZ0pU?=
 =?utf-8?B?eEZCdlVEN2ROcDBoSW0vL1l6YUJpSjdPMlhBRklNRDhmblNseEFxbGJxcjFi?=
 =?utf-8?B?VU9BS3FtdmFOKy91NUFwNGVZSnVNRXVWVG5lZ3NFVlh5VXNHbVpGWFpNUGhU?=
 =?utf-8?B?ek1SVWFVREl3Wkh5NmJKQjFJT2RlRkpBditDZ2dncW5pOVB4Y1JSRHNaRFJC?=
 =?utf-8?B?TnNpWWpkbFZHOHNOa2E4dGRhemtRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ece16f-e9a6-4497-9cad-08d9c07b0eb9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:01:41.4124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nS3iw8Un2iyJ5sXBWdfJyo5ui1Wgd0fjyib11BN3S4TMH5tOGKmAev5w266DuGwHND+/6rb9l5SQ+glTykcQD6B0PNJb8S4+wRHfEdFRa0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4964
Received-SPF: pass client-ip=40.107.6.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
> It's a commonly needed definition, it can be re-exported by the root.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

