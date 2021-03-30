Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E1234EE97
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:58:28 +0200 (CEST)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHhD-0000By-5z
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRHeh-0007Pr-6x; Tue, 30 Mar 2021 12:55:52 -0400
Received: from mail-eopbgr60128.outbound.protection.outlook.com
 ([40.107.6.128]:38465 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRHed-000207-Nd; Tue, 30 Mar 2021 12:55:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go5mDbwZUW+eg1Ph+lH/bJgDpPULOLlPLR2fNYewb6h+hl9hCsJh5pVNeFfrZuITYIjYO5zscoSpcz1osnmVtxD/Dm1uwyWJc3OLVcA6fDM7whrX57tW0vXBkn/BZoSRS9EQh4xEXJdy6CtSYa3Xhta96DghN61krZ1hyEcQhMVZC44SJnKpHo498ffNY6ktoNxfabnmDwQeNU5PBG2+QWwO2P7j4pqvXRQlfvyj37zHexaDG9Uvo1w1L68KAHMHaufBcVeheQmYuFcpAmrhCpjN2wiIIuwUfwdHYksfDjnwjYQSjpDAL61FqT1a5NFIK/vQcLey88peUED8Fci8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHfrSCXyfy0FKABcYUoEfQhuVMbcq2kDDHWbscal5zQ=;
 b=DKQqOLF3EPoJGD6qSHx9dZbba4UWpqyA9tYCO+VNNn6q1JQuE4B6QrRKys5025l1nQIeUrvFgcBvWA+o0JJ21fFcWfx1BDljOkLBrM5ESxt8/cpDijjpcwi75ZcH+01s1TtWewhRF1D36WeyMD2Tulml5dGHTBIDm0Dw71LuWDmwfLY+hK8DIZBlZ/MvR+5O3X+CDdwMdOSljgogdTMBFiZgcx2BUJkNExZ1iMmLHQgCPCZ/TwRzQLOZQYdx4USPErfb0nH4s49BU3lSOZhHx/bQ4TvXLYGmhVU6qleXmvUn/SZrkKzd7aWnm5jojooTLDKnqi1Bu8Z/wE/IwA2UMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHfrSCXyfy0FKABcYUoEfQhuVMbcq2kDDHWbscal5zQ=;
 b=AtLo6/XK2jYyrLyBc3RXMMYLwXBSDSv1X9V4ifguA01tyKaRHOHdk0q+04zPWkX7J/Whi8oQKxG+6XRQTqKYLHGBoAUbKB/zXbrw9maoEHtdSEEkpJbRp1M0JQiDeDXt/aiBceccMqjonbEs0TW9FtLXiXNS00ytssFAXsBjygM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6807.eurprd08.prod.outlook.com (2603:10a6:20b:395::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 16:55:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 16:55:43 +0000
Subject: Re: [PATCH 3/4] migrate-bitmaps-test: Fix pylint warnings
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-4-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <642d7923-f1e1-7584-f772-6b03c74e2904@virtuozzo.com>
Date: Tue, 30 Mar 2021 19:55:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210329132632.68901-4-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM0PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:208:1::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM0PR04CA0069.eurprd04.prod.outlook.com (2603:10a6:208:1::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 16:55:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d1a2c6b-863f-4b59-b096-08d8f39ca812
X-MS-TrafficTypeDiagnostic: AS8PR08MB6807:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6807D004E000A3E4A76A4392C17D9@AS8PR08MB6807.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XUgYaEqPHE5pWWGsVYFjENmYvPHBhJOObBZpPoD5o6IKNpTpqJXnShNJEnlI/FxP47W7t6iq3bZrEy1Ned3gdbdxISGHFq2QLJN2994HZNsHQu75stG7K3fWcooxW9f1wNrlpE3l1w9Ykdg/j71N4jaWno9vCLtEudXYxJpsDuA4CIgt+lfmXNurpDQDVrBCuo63Q/YTPGEc5hzDFy2N7ccoYsbTbqIuQzb6G2j+Bc2JSjDOHCQhIpnwr6ZuGQp5qsUivBx80TZuiqQVmCaPVL2oryqPhzXelrZiUup/fTMNEDGXVoh6mkwgtrY9Cdw9aUwlomsveLmCf3NLr8b3J2ny5FLo8u5YpUJDP2y0kZjR4DnKj3YPXkEkbLRnNRPJkObIXC8Km/hjuxdSjYELeGZoK8t0skb3R2+SxzVFP6oXl99BESZ2DW+aQyNBHBvq3upDyMSmbtT1DvjEbCydTUTlYCsOXtCFD7unjqIb5CRQpwaBd5kJfFBKMQ9AaXxTvkmI7IKSivczZLcc5LS6Vwd4dxrr2JCn/Sh9H5W3uXLPygUIGLYUxduPgutx74ZWurR1ELPZ8GG1xvgt5SNi/5cabDeNR45Q8V0TJdypuWuamHFMiewNyqmZXZimY44bq0zesE/t1QPdocDl16z4P6dUwvTkBsw6rF5JaYJhJTjKyBz0oG1BXQUD8Ncn/6FCsqkpVJjM4jsTpDRkNhThZykswnh1z8763zrxZ9Ekm9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(366004)(396003)(136003)(38100700001)(2906002)(16576012)(66556008)(5660300002)(4744005)(16526019)(31686004)(186003)(66946007)(8676002)(4326008)(86362001)(26005)(2616005)(956004)(8936002)(36756003)(316002)(478600001)(31696002)(66476007)(6486002)(52116002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L1RJcFhiSXAyTW1uaWxMVTJ0V1ZzUElDT1FYakUvZUVZMHBGTGJkNlRxNnlI?=
 =?utf-8?B?bW5td242aEUrZnRkd2QzK21uem9mMWc1ZTNoSHNYYnd3b090NUtkNktXMWFX?=
 =?utf-8?B?Tzk2cVF3cDlBMUxqSFduTXV0MC9JSlc3VjdqUDRrbk93N1ljTEdYZ2gyR1RZ?=
 =?utf-8?B?MnFtZm9Ud0NUajIrc1BFMXZPYVJKaWhtOVlzOXFTL2thbWhsb2c0bHVPRVdE?=
 =?utf-8?B?S2h5Ni9lSnpUeFF0QUxGT2tNWmpvRW1PVFpwd3hrNHZhOVh6NWRBUndCUGhV?=
 =?utf-8?B?UVQrMGxqRzFjd2M4THVudXJFWU5ScmVBRzRjb1VlOUNaWVJ6Ry9aRWFlODhH?=
 =?utf-8?B?cUQ5VmVidVVhQWNFTjNxdzVQeTJza3V2bEM3K20wSm1DdWFSQ29PSXZaUFNG?=
 =?utf-8?B?ZFpaYytGUVFLSmYwNExLSG92YWtGdXgzMDV2ZDdjMWFCbFAvUDVuZDRDZVg5?=
 =?utf-8?B?d21tRjQxTUh2V3F6bDl0cVY3eDY2NDliWVN4K05YYk5FVjcwaFFCQVFETzR4?=
 =?utf-8?B?d3RiNnVJWGJsZDV1M3NYQzVrVDd5dUtnNjVMZFc5SXljUzNUbHpWcFFHRFdt?=
 =?utf-8?B?VkJnT28xZzFXbC9DRXdJa0hxdDZtSERGQlZLREtxNUZjZ2xPTGpuK3hrUURi?=
 =?utf-8?B?MkJlSUcvUEpoTGhkU3RkR1hIemlPWGVDNUZlV1BtcVcyOTVGdkRKR1NlL3Z3?=
 =?utf-8?B?V1hTZ1BPTFpBdTdJeUFXZjk3MFUxOWxzeUk0NmVlNGZiWWNZSUozVmhXZFli?=
 =?utf-8?B?bW5oaEo5c0pnb25WMkNJcDdZNEZwRHZJQUJySVJXNk00b3dHT3EwNGI5bTVr?=
 =?utf-8?B?WElaa0s5cmIxc243bXM3TnFiOUxYZTZHUTJ2WjlRUXgvZFJqUVF2RlN1ZW9a?=
 =?utf-8?B?WFdabGJYSkJ5clg3cE5abW0vNnp2Z2FEWWlNb2pGMUMvaUsxek0reE5ZdW56?=
 =?utf-8?B?bkM1MFZLZmpZSDR0MitOdDhGdno0SFM2Um92d2tsSEpsQUFOYjR1V1N2emVn?=
 =?utf-8?B?cnA4ejJHaTFVbHV4OHd5Q1p6dnJvZitNNjRVRldjYXVISVdDZUoycXNUalpN?=
 =?utf-8?B?MlRacEZEamtpUC9iNStFcHEzR3BvVjgwa0I5TWhvVDNqMVV3ZW1QVWFFVVRp?=
 =?utf-8?B?RTF1azRVU0hheXFFRVIxWTNmVkY0elB6NFFSb0ZXbGNaQ3VyU0U5UEt3Wis1?=
 =?utf-8?B?S0s0VG1PRXdaZ1FneWhBd25QRlFBMUk1eGxpSDlma3JXYzIvYWkwWHpXQUpi?=
 =?utf-8?B?bm5DSHRYSWlLN3dFakRESjFIWWl4b0dpN0VLNTlKU3I3WkhXVFdqQlN2Y3hD?=
 =?utf-8?B?a2tvWlBUNHNIdmRZbmIzY05FWVJBYTE5cmpsTTdKVGpYdkNVUnVnKzBVWUpN?=
 =?utf-8?B?di9HRkw5SHhzd0p1Zm0wWW45N2ZXTUg3aW16YUthZnlTR1NNMXNSYUNIQzQr?=
 =?utf-8?B?L1dIYXcvRzA1U0JxK0JFTVNQb1FzanN6S0hqZ3dQRDRaQ01JRGFjMWlqQ294?=
 =?utf-8?B?QVAvUjVXZXdkUmROTGRNcVhKZjdWSlFCc0xmMFNJMDR1d1FaZmhXRVlDRFpo?=
 =?utf-8?B?elpBU1FlNUlsRFZBa050c2pLZVlKR1lkcXdQd1F2SlFkT255NVVaV2F5SjRn?=
 =?utf-8?B?bllTTmNrOERpR095YmttZUl6VEswemlqU2ZGQ2FuQmMzY05KUUY2SEIwc0No?=
 =?utf-8?B?TG9FcVUrUThycUlzR3ZRUzJEb2MrUmVDQWVIaHREZHZBSlpyUngvVHZTcVhh?=
 =?utf-8?Q?m//10wyfz3C6zc7qlucJtYRc9/sZaDKZfwmERvX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1a2c6b-863f-4b59-b096-08d8f39ca812
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 16:55:43.4245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miwDMEkullQmKETnBU+DrsAdyEhzXNKXnicoiFV547AWM3wfrgET68EuZW5LX+9BW5cIhuC3j1gecXBZtrl866jb2zCE5dokwruGPBs8mMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6807
Received-SPF: pass client-ip=40.107.6.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.03.2021 16:26, Max Reitz wrote:
> There are a couple of things pylint takes issue with:
> - The "time" import is unused
> - The import order (iotests should come last)
> - get_bitmap_hash() doesn't use @self and so should be a function
> - Semicolons at the end of some lines

Wow that's funny :) My old good code :)

> - Parentheses after "if"
> - Some lines are too long (80 characters instead of 79)
> - inject_test_case()'s @name parameter shadows a top-level @name
>    variable
> - "lambda self: mc(self)" is equivalent to just "mc"
> - Always put two empty lines after a function
> - f'exec: cat > /dev/null' does not need to be an f-string
> 
> Fix them.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Thanks a lot!

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

