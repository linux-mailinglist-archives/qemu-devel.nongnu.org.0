Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395AB37518F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:32:07 +0200 (CEST)
Received: from localhost ([::1]:46492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaMY-0000BD-7q
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lea5d-0002EF-6Y; Thu, 06 May 2021 05:14:37 -0400
Received: from mail-vi1eur05on2119.outbound.protection.outlook.com
 ([40.107.21.119]:32225 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lea5a-0006xr-9d; Thu, 06 May 2021 05:14:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4n11Wtayt2dh2sNqkyiEpI4FmuRGZjLs0RW1naQQ7RdGODAG/HII9POJS5wNpS3UCEg1qaJwPblMdaGPslYPcsIsKBhJt/ZHeBFLuEvcBalyRXOFqfbZNyvzEpMnL2ws2GriA7g7e729+5xgAnl5LCNHoGaPO5bj/R7dR9tO0t6Rl324omPSH3STyLTVWrZBv4U7uLxepyKmj7oDNBRpVdrHKtV6cnxtA8XFeOW9UWEKrw227/dfzC55gjki2Fp35JZ2CbNhHVH6tTIk3W3LeHAHzY8C7nYKHSSH2NDarIV3Y4/XRyTcr9pALvXb27FENZj+Vee7zNQR87hJ9xoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeWVofkILGx5DYT7FE+0Mj3zNcv7JBtOU5BjKg0/nLY=;
 b=SuriaLm6NyjVLfqgF92oO7wPaLtBEDZtCjw5bk5b260wBeGZ53MubKzqi5TH5+yePaDKNmr6mHp3rbHDbGZbWJZLRiYXWs3KWz/bfO9AygZ/F/f9MYr4yGh59CShtMkZne66USArRcTxHOQq6x82aw/Nqv6GCSfvdgn3Xa+3O+bTMdxVPfQkvWEE+PUZVxiPFPeZWmxjKzMMKvlHOF+JStlLcHUt2iyHDavmJnKx9poviDve+V76R2KmfnfJPOM+g7GwZXn5E6kEtQ5e2xzhptb/rJmFImp/uFUD6WYezIYUagwE/THYxlNaJc39p7v9kaA/kkeKsrhBM8o1sfDzHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeWVofkILGx5DYT7FE+0Mj3zNcv7JBtOU5BjKg0/nLY=;
 b=c9bwy4YGMZVmQVphiT7Km2ktAXaNcqINvT8YvuhreWIkdBgIBJG0DkZQ6sg6zyshY0c2PrSm2EFAZ+ivEUjLZsjXy4VJjdxw1ToHEr2XeN9zgOFrhVzyyq3R8XDHbYL1Ovoz0VSbJO9RWdWuCl/VPSnzCOCRXtUTWSzflw6Uzfo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 09:14:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:14:30 +0000
Subject: Re: [PATCH v2 1/8] block: prepare write threshold code for thread
 safety
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-2-eesposit@redhat.com>
 <YJJcSqa+EG1U+wMV@stefanha-x1.localdomain>
 <39fe743f-ed26-d806-aa31-37146856790d@virtuozzo.com>
 <YJOxODfge4Men5Ez@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <40cd702e-7f78-f4c0-b12a-49ba36b7e6d0@virtuozzo.com>
Date: Thu, 6 May 2021 12:14:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJOxODfge4Men5Ez@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR3P189CA0069.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR3P189CA0069.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Thu, 6 May 2021 09:14:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1baa66dc-9358-44b4-1c20-08d9106f5abe
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6280E3CCB5FFF2839B7B54CDC1589@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GpI55M3D07+pUjxNrZMNainKNmH5cO1p95QuEA2SEzVjoh88cTNFAW130f+Ao3N4FCJh9RObCb3JSkw0lOtxkCPzYKAq+k9j7hmvrbBDtUTqa6gim1qc0y+OIO+byLjxOLhcHXK0ebDIvWArgkZtkCGgbj35zNO14SyJl2hFOy350FxBPDd1iWudk/jzcO0Son0oUCnvOiXtDC13z29lY2i3CP16DMzrJ+ph5mV0xJqJ5wN78HIUm7ob5T6BS4kk9bQeCUQf9jfd0yi+536PeiABCZR0f3LNpKxoxSOZh6FNJR3h5SsV/DAFIkRlaXyffDnf3tv75AVWdfLkbnu9uSJ/lC7gw/8eOvCz+IPUoQRptqm0VxvasE4egkCJlMiJoAnvX9VHyhFtfw1wMz8/EBTnD4a3DCyY+gLz1oFg+AmdPFbxA7yZ4ImC8OHok8M8TYyCe1KB2g5Hmc6noOncFQ0CPuFcBAvZ6iSlm1pZx9a7hDPMWX1MMCpKauPQWnoMfFA/wsKRj2yd5TAW1RcLcUyNN1EEsSS1ZQiYSi+0iJZOpBg/u8GSzT14jyMNti4WfWPbAEL7Rijkzayft3/3pusbT3TejlGH07xkrUgamLtn4vL9/Sq7/CnYWWxsCSIIRd3EusWDj+Pu70ljKT05w8KuUWZ10lV3iFNciLr7X0TrMXevtcTSglMdcTTfbypkMvVKrZY8VHxHIwPkE9iaZenGQAd/zupMn0ekRKIGgQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39840400004)(366004)(396003)(376002)(478600001)(4326008)(8676002)(6916009)(36756003)(83380400001)(38350700002)(38100700002)(86362001)(16576012)(186003)(26005)(4744005)(52116002)(16526019)(7416002)(31686004)(316002)(54906003)(31696002)(5660300002)(8936002)(2906002)(956004)(2616005)(6486002)(66946007)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?XlQ5YZR+fNvKLMHz26k0+tSR5QRdxprTPYN5GVDUricdmpiMDtYR1R+a?=
 =?Windows-1252?Q?ua5mgysTsBvxiobbzsjjcgv5xraRoB3/g2dMJFakR4voJwPAHkpvCgA4?=
 =?Windows-1252?Q?jR/VEfndQVVrJawO+xQeOAGYRwvTK5wXQLkSBTEES0n+YFkIh3qJUZUS?=
 =?Windows-1252?Q?mFl3LiMetov8OsNdrWvujQmKny2ScxCafQbSxETtXNm6vNaxGSuh0XM4?=
 =?Windows-1252?Q?l7E7woD7Fdg5c7FHCVMQdW6d/fqdBR3jQ73kpjlKHBQYZupdYXyGzDXi?=
 =?Windows-1252?Q?4bHc5/XTE0OX4gWdRgm8jTuhWSseFFY06ctxmvGLD/+LNV8fKO/vPoTd?=
 =?Windows-1252?Q?8xlafX5edVpD27GXq8NJdvrXjlz8znEmCstC4hBhkDx0QwEK5I9KAe0g?=
 =?Windows-1252?Q?eLK78EXkuJr2tL4bVHE+0Jv/ebGcfWKyHXjwREzVssavZw1SvCsGb21I?=
 =?Windows-1252?Q?ez0L/qPna1AR4xPZ+wAVqhErQn38m+3VticVgsyNZG7SnYIag1HJ2BUS?=
 =?Windows-1252?Q?OsGd1b0kXh96QxsjNv8I0/r+trH+sOk6NL4TV6AjIXpBXpJvmexCBjdg?=
 =?Windows-1252?Q?ZRvmlapZwK+evmyUwHg60h4lvccHqP9MZEtnonTapPr/G36D7KlSpNPE?=
 =?Windows-1252?Q?i7jIf+W4Qgnb2UtZqRdPyY4jIna1t5uJQK+fElWr5BFJcnrKf22wtxqW?=
 =?Windows-1252?Q?efndPumlzcscPUIgkq7MKuV1G7uYa7rdexhY8yYMgfy7PUuQnhd3uioq?=
 =?Windows-1252?Q?RhQNBX7CzRcs4CcXBRD7YZkcOlhlUui2J1lB1EQu03N/GMFBAWTecAUR?=
 =?Windows-1252?Q?M+qBf4D2B5W11Q8zApIIY0oPEeKUWnLjp0ko7KWdoj1xxSq7GsS0eGTE?=
 =?Windows-1252?Q?/QOPNutwDLrz2UARLi3zMnrckQrVBITkqCpxs/3vm76EfblDS3QkBK61?=
 =?Windows-1252?Q?UjCy+3hKPCyH2/BB5RMgsWvzPr3JM8mnumV1AdUZKaxxm0cDb6o/lHZg?=
 =?Windows-1252?Q?/Yswsl1kCM59ZjNEF2dYralKmwiw+BMj7leNA3na4W/IoX5Py3QBgSNr?=
 =?Windows-1252?Q?bJqJs0/zRIaC35CcG54JSLUMgQuQwv+rSfjIlCRvJyk+BLHB1lcKkjBP?=
 =?Windows-1252?Q?89QSC/oRxBga3vpiEWW6QTkjSWNX+/9hU2YYRn/NJEEHhknP39Mqitor?=
 =?Windows-1252?Q?ntePSOxAXBO5E/HHYmZkKmhDx/siqHdlBqP7WG0Q3aufEiSwgryzIr+w?=
 =?Windows-1252?Q?N/S0LxXoNqzF5e/MQIdQx3r5Ku3HQPEVojz9XT7GHNEU752JL/0Rxnxy?=
 =?Windows-1252?Q?JNGQFPCGb0ZhPN8jsZz9JZju1s9RtT+npZPt353AhcJGw97mrfKCpctJ?=
 =?Windows-1252?Q?a8cb+tiiGutXbM0gw5W3RpqEiTvrM1k9Ishwp/oPdyC31/2endNY94Ao?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1baa66dc-9358-44b4-1c20-08d9106f5abe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:14:30.0195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNMjm2uAZRL5gOYA5GxijeAten/LP6jsBskY1miPptTDyICp+ta9LgoXtWZJegHdQwNntDsSnx3s3/SXfyHOrUui1M3StXNQqgfjrKwGVEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.119;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

06.05.2021 12:04, Stefan Hajnoczi wrote:
> On Wed, May 05, 2021 at 12:54:09PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Hi Stefan!
>>
>> Note my "[PATCH v2 0/9] block: refactor write threshold", it's a kind of counter-proposal for first half of this series.
> 
> Thanks! Emanuele mentioned he will drop his patches.
> 
> I took a look at your series and that approach looks good to me.
> 

Note, I've sent "[PATCH v3 0/8] block: refactor write threshold" a moment ago.


-- 
Best regards,
Vladimir

