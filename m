Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6D4C5268
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 01:08:30 +0100 (CET)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkdR-000552-4N
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 19:08:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkZ6-0003Mw-9H; Fri, 25 Feb 2022 19:04:00 -0500
Received: from [2a01:111:f400:7e1a::727] (port=64353
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkZ3-0005mB-4D; Fri, 25 Feb 2022 19:03:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhqTwRlptHQ5r77TQWgnAahpEV9qfCm2tJIbbtSBDUrzjTOxkT5uTIi6+3Nc++lULxGtC0j5H5fGfEpq6WArvRY9Mxqx6qvdPiLXBSAoyhRV818BTUb1GL/DCygXg0nua5l2/b0X7oKxzU1ylyedGTow7QCCzlOdCVcMtMXSTDorm0I0+/Wa17t6EYYDCbHgbfwyDehIuEmcfxjjsMclIZwf9n/Lym/mwy0VmpYxUqGoHJg3mQKFc3v5GEJ2S9K3LkX7rkWocB7iX52yKK6mvOQ+MSZ9brh40W+iLa5M3C/1djnbxji4meCOLPfy9xkbj80omYa4hiCUudj6K40lJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKhe7ADRf9U2ky2xxxl2OhlchaeRy5W0SVD5VM5Ufm4=;
 b=c0VjZTBR/S6t/Kbh0FYIfIq67A3VivTq6PkSbxgmYNWiso/bWmeh3iiC9iduZP8ekvNo6LFfiMFukbNzJ62NMEHy4QvAw9SjiAhGSJr80px12+l5WIRQ0T74LI8SdFmroEaYTTkOFQQA+cgvEngHT/JO/uZTIV52rDVkgisrLAAmvC6cXL1j5HFNwLDh2uB4X2becLVEogyxC0nZLZWGrqeMFXllZY2KP2snVVI4Cf08Br+mT2S+U094RpYYMEEJN0B/oWPAis6AryU26U0DNYGw6J81AD3DT4h7RSnf3ISuA10ionYFvS8kmx+d48vWzWXqHyTSJwkC9OvuN5B+eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKhe7ADRf9U2ky2xxxl2OhlchaeRy5W0SVD5VM5Ufm4=;
 b=pk8TH2kaVge7jTEIHn01fq9Ynh3zwK/AFnQYUpIkvRqKlSAGSVDcABiWF1s9LFIPx6hQosbouYVemAqaH++7rAmFItsrqh/sJQYzB4JVHVghmktWANKHAXGdWXMeAlChl3ok1uBPFiLhPzWLcBMpN/WkmJ5oRKerh+j3ImLXg5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AS8PR08MB6470.eurprd08.prod.outlook.com (2603:10a6:20b:33a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Sat, 26 Feb
 2022 00:03:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Sat, 26 Feb 2022
 00:03:44 +0000
Message-ID: <4b77237c-d78d-1e38-7f25-c277b98d5e75@virtuozzo.com>
Date: Sat, 26 Feb 2022 03:03:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 00/11] blockdev-replace
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 nshirokovskiy@virtuozzo.com, yur@virtuozzo.com, dim@virtuozzo.com,
 igor@virtuozzo.com, pkrempa@redhat.com, libvir-list@redhat.com,
 stefanha@redhat.com
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:206:14::20) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d18553b-1df2-49ad-0937-08d9f8bb743d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6470:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB6470E634055420C8A52E1542C13F9@AS8PR08MB6470.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TwdtxqFwYuCmeaPgG9sWrUwYCSYDVykAVo1d07xIfal9AAKtdtG160871fZ1QfS1ksE2HIwVIxjGrUo0JLUkp5s6sTdr0EbbYToOLR3aVH75JSHI4g0qxc+GN9bcHjhoykh+NKonuAPd66/FJMKUWaXZ3Qcjf1SGswrUu9njxxEes0GwBwQx1rbX5Fv6zGcC2hnfBhJq7P0zJaVe91ahUBOoykn/q3TsZh1ziJGez0AJf5L3QZMbY4G/C67sua7RLDEJrBSsK6TKkm27sZ2T77cYDh2FqKpBC5jcwjOVqxaLrk6YXXMOtdc6Y5Cf7EJIFSegwRcwzEjOhLQtQIiFVTXThqLNsf0IgKybZxjSHNxxUdOq0RjnCldyJfjQp7KaKjj2AQMAyzqJ7GHN1ZY3DNQzCCm+lESz0SQTkjtuXs7S4XijmHCSthGn9+ZSogWflAdeRCbBwsUUzStMypUR3Y7Ml5dDOqgciCGCb85lnUp1OBGul8nQepD/9roWYILGv9C75nN+TXtys6pw/AuCMIe4ugort5GxbMVJpxnZ/tHZvGtwy52wG6dwPwiLjkrIuH52Z/4EQt8uaOMXb9yZmFi9DUkKsOu049cIyVvO8ysxgG0pYG4IYbahZMvD0moUDZwip1feTDAQOWXaT8CeSWuBpbgfGkCiBzws+b8vwX/RP5ooW/2VnWjPMgflm3sUyNwCh0pB+aL2xYYjLD9Tpsh+Aj0bSuDzWl0Lkk0nlnFuceTK4lT5cBQspepvB+lcdJNBSD2rxeAkFCAbNk7NGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(4744005)(8936002)(38350700002)(83380400001)(52116002)(6486002)(6512007)(5660300002)(31686004)(508600001)(36756003)(6506007)(2906002)(7416002)(186003)(26005)(4326008)(2616005)(66556008)(66946007)(66476007)(8676002)(6916009)(86362001)(316002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkpNbkNzZjZtbmsxQnYxK3BBcldkZHkwL3hPUmtxVnpmWXlOc1laaVVFdFlJ?=
 =?utf-8?B?Njk2WG9CTHE2NlJVUStoWE4vQWRNVmhSZkZOR2w2NlJSZWtCNkJvTlA4dGND?=
 =?utf-8?B?RVVDUXNXWTNENUR0NEd4RmJsc203MXdCK0hEMWR6TEMzSjd6UEFVWWs2MW9t?=
 =?utf-8?B?cHp3b2hmQTJqa3p2UVcxWlJiM3laSUd6TERna0lpSmxyY1NYQVBERjQ5a05I?=
 =?utf-8?B?dVJPL3VCTUJKSXd4Rng5MFBFTWVTc2NtNjhhbXRaU1YrZ2dDMzV3Y2l5akZ3?=
 =?utf-8?B?clc1eHpibUNBcUZsV25NTk5KRE1BV3VIN2lPak9US0JOeFJkMStTL2JxOEtk?=
 =?utf-8?B?RkdSSUpUMVpVVU9lb1BvUkMwZ0dIMjJWRzM5RG91Q1M0bFVoY2lweFAwMTZm?=
 =?utf-8?B?UFRQcVV5VHhSUi95ejdiNGRoK1p0K3IrYnkxRXZ2N3RJTWVmUzl2bXl5MDNY?=
 =?utf-8?B?bUZFekFsdFdCM05xbFllc04zUEE5SVdOeUxEd3NucHc1Z09NYmZXMnNuN0tL?=
 =?utf-8?B?YlhYdzFMSG5QVVNiWEFzQ3FTVHhvQUtvY1BmZzZzRjNrNG5waDFiL1hKUFBs?=
 =?utf-8?B?K1I1dyswdVVOTnQzSzcxS1hMa0J4RzVnTTlnTVVrcTY4Zmx5TzRGM1VHQ2VJ?=
 =?utf-8?B?OE4wMmIybGdWbHptRVd6WW1jOFJQY2NPakhvOXJQWmFmWkE0NmREVnhUSjZP?=
 =?utf-8?B?UWl5SmNpRWJSUlNkNnRaa1UxclBOU1JXYkUrTm1CYXdTMkdlMm5DcWtWYnpu?=
 =?utf-8?B?TkJVZzc0QUdMZjRVb0pQRXptRjhsTHVzMnprLzZuNXNsclE1aHNxWldYcUV2?=
 =?utf-8?B?WTExM0NHVFV1Rks4SEwwcU5pYVgycGIybkNBWm1peTF3NFd4M3JEbUZtSFVX?=
 =?utf-8?B?aUo4SUJlTm9abTZib3o1cWxPT1pzTS93a3NpOUJSR1AxSkdyNXQ2eGkxV2JV?=
 =?utf-8?B?TitZYzdjZzRYWVJna0RyZ0ZnaGdadDJDZmF6SEphYW5Dc1JZcXNSSlJoelVh?=
 =?utf-8?B?VTAySkJPeEdYL29KejN1ajFqTWFvYk1oTVpJZnRwWWNiUVIya2pSYVFMU29a?=
 =?utf-8?B?VEt4Q1o2Y20rYXpFMk9BcTR0N1FNS05GQzVJc2dMd01hNUdrQ3U2R3BXNHlS?=
 =?utf-8?B?dlltNkdvWE1PbVlNZGtnWXp2VUxQVit4YnlWdlNaZUZEenZZdEg3dzdDYzJC?=
 =?utf-8?B?K2ttRXdrTHB5T2VTODNWLzR1dWNMSFZyTlc1K0ljZzVYUXpKcjlYZjZzM1NJ?=
 =?utf-8?B?cnJvRVhvTTQwSWI5ZGxkVFMzeE5iM2ZoaU9LREtTZ08vRlo3Zlg1R2R6SDlX?=
 =?utf-8?B?SFp6cjJYbElCWEdRcWhRT280RTVyY2grdXZzVXFSNW1RWnlLRUphVlNtWEhQ?=
 =?utf-8?B?a081U0xpL0dlRU5zNTRXd1l5VnRRR24xbm5rbkdCajFmNlJrMm1XSGpMcVFD?=
 =?utf-8?B?YlcrUFUvczhJdmlIQUtlTy96V2RaVjNJWnlheGpvWFU5bFdaeEVNQjUwWkZt?=
 =?utf-8?B?L2I1VkFJdTdRZDFiMWVhRXpnbW5IS014OEQreWFCSFlnTnduVEVmNktsdlNt?=
 =?utf-8?B?ZDZUQVgzcHpTZTcvWDdCUC9vbVNub20wYlRVRDdMTkxvdnBUUWNwYVVZMFh0?=
 =?utf-8?B?VXBZUld2a1p5RXlMWXZoUjF3dVpMaFY0T2ptTTExZU1xL0sveXNXQytZQVdy?=
 =?utf-8?B?c1VTVkRpSXM0V2YrY2ZINkZ4OGhEMFpTSjNUMzlSSGR2SjRvSFlIK0pmSHJX?=
 =?utf-8?B?dUowVmxuckNVeWpPeXJrWTBIM0lpRGpzUTN6TkJjVk5CRUZtbDI2WDVJbERP?=
 =?utf-8?B?Zk9nUFp1UkwxamNHWU9hU0hmS1lNMkxHOExGek1YTEdCcGRQMm1HajQvcUFa?=
 =?utf-8?B?bmx1OXpkOFp5NDg1N2VrN1VRbXd6OUd4R3N2SlZ1MUt3RVNOSmhnNVM5c29B?=
 =?utf-8?B?QVh5Vms3RkkrY3NIM1Vpd2x6QjFjaHZydGlDTnpHMUdrRVJscXkxSDgreE1E?=
 =?utf-8?B?bDVsaEtUZ3VnaTMwcWF3dTlJZC95aUhWTk1MdmhtT29wNG9XeDdHMkdiS0ZD?=
 =?utf-8?B?citlRFZSeVo1RWxIcUZzOXZVWUNMVHcrTHVtcVkveHZTaDVYVGhwL0dEeHht?=
 =?utf-8?B?L05KZTBuZ2tmdnZ3T1psM2VYdjRoamp3ckpuLzVUMGQ2TVp0MUVreXJ0M1JD?=
 =?utf-8?B?WktsSlQ2M2o4allRMGZDNWEvdmhyZlJnL2xmUjdVS2NpWHg2MHArSWNGa3ZO?=
 =?utf-8?B?NkNtb3V0SmVlMkJINm02N3d0YURnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d18553b-1df2-49ad-0937-08d9f8bb743d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 00:03:44.3615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pb1RjKCPeeakCZseeNyqJOLa2Sy2qmtHytuO3xEGsxsIyhmmVTYdoz0Kx9e7tqtUhJNktwofsNk+4pZq2pHbIZ6CfIg3+K3uAO+FV6QMLFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6470
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1a::727
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1a::727;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

26.02.2022 02:42, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Finally, that's a proposal for new interface for filter insertion, which
> provides generic way for inserting between different block graph nodes,
> like BDS nodes, block exports and block devices.
> 
> v3: - add transaction support
>      - add test, that shows transactional filter insertion in different
>        cases
>      - drop RFC mark. I think it's now close to be a good solution. And
>        anyway, no comments on "RFC v2" version:)  Still, I want to keep
>        x- prefix for now, just because there were too many different
>        ideas on this topic.

Oh, forget to mention, that it's based on recent "[PATCH 0/2] blockdev-add transaction":
Based-on: <20220224171328.1628047-1-vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

