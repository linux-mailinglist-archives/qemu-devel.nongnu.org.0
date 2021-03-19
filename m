Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A1F3426A3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:06:08 +0100 (CET)
Received: from localhost ([::1]:33626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLNn-0000zx-7A
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNLMe-0000Pi-S0; Fri, 19 Mar 2021 16:04:56 -0400
Received: from mail-eopbgr80120.outbound.protection.outlook.com
 ([40.107.8.120]:33665 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNLMb-0006lg-Pb; Fri, 19 Mar 2021 16:04:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IH56mwxfi6bGPlnne2UJRPz2QwBZbOUAE8spgDelaHPyOcpcQcGqqxUEgoVz++HqTwpUeod0P6ngwHD3/4nCD6ogJVpk0nP0ylxWdToCPjTKjLgy/G4VjmS1ymr+wuOrlWDWw4RwxBRUgBGtT5AdfcgKppLZH+7CKKTLtYlP+r/M/H3vuMOAajC742JtP2SlQvbrR7+3Qh/uA3xl3Z13AaJ4b2EsFpXcvAQqUJqxyyRuADlVb/3O0aGgdiMqhMw9NSwOdZOY7jiLo+C8Gw4Ww/b0/9ckH2m/0qTzNlEhM/BfVncAuNPTcIdF7074gSyXXzl+XDRTmr2Z0wlMbnsvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNS4jEkXo4wRG8p8lSNGsyOETIzOKqS7KYZx7ItpOPs=;
 b=gv8/jjatLtrQCd8CFqqXEZyqbYQM3C70WIjyReVQJcg2hPcxJaguh4Eh74H9HEa6hDnIamSmQrK68R6aUvklHUVZXUCXR/4mkt7o37ic4bWpCMb3rR/OyRrL9Adls1J8OvM/Jo0qITX9uoyjXTnLGB7IFJY2CJ6Zu8Dq96czhaYXamBbj33Br/6muR5ZN+tFgNKtFGeCkDqTS/EHeQLHASiWsYdqOwvhRPPyOiixWp4Rfe3KNI0QP70eswaSRum/5jEnkAR9XR0P6HT8aUsaILDqUrRp+dj9nHitfXBPt6M49Z/Wll36dM/p9I0yoTNj5YFyRoqL6BBHM57kW/1zSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNS4jEkXo4wRG8p8lSNGsyOETIzOKqS7KYZx7ItpOPs=;
 b=Iy45qubSPc2lzodu6g0dH9b9EuuRIukPGyOASTG0nvabTqfz5jOTmEsBIPXlgUQPZ0xf8O4y9AAml0t4tQDYxq8af7uxBDElOles1QgkRJtEXjqLMIadULG2lVF9+AL6UEb2IY4oaHBjpyXR3X1i2kt/asAFUZTv26akap3sH04=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 20:04:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 20:04:48 +0000
Subject: Re: [PATCH v4 0/5] block: add block-dirty-bitmap-populate job
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, armbru@redhat.com, mreitz@redhat.com,
 pkrempa@redhat.com, qemu-block@nongnu.org
References: <20200902181831.2570048-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <33a7fb03-def4-2cbb-7bec-6ae7f42103e0@virtuozzo.com>
Date: Fri, 19 Mar 2021 23:04:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20200902181831.2570048-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR10CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR10CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 20:04:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eb45ea2-950e-46b0-89f0-08d8eb123f38
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-Microsoft-Antispam-PRVS: <AM6PR08MB48493778B9B49A9803C5D983C1689@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2RnbC5xccoVsAxOVyNppNlevNl/xqMH5dYcfctt/cfomj3lhLTWqgNuoGV1zlzxQ+wmNewlyHMkLjeZXVcPTc9nu1dHe5Ki9j+582cWO0Z+7THwRBJg3jZBt57uVCSLWC9u6oA8LJHcW9yfXx2Z5FRK4+h5sjGsZ/iiB3/vYq2TVcng5ubUi7qHbATESQTuKjqBTtfOdaW2ZgygI5nIoSTD+E5/4fnPXe4BQAiYcF9OM9umZBPSWyc0ooaHCEvlNu85sP/QVE0stk1uIxc3Rn7O92dHpQi6IprZBfqPNvMBHevZyt469Jr6izPxKJFkhoe64U7k6RvzXI/FDVJ2mxbPQj9gyxJr4YDa4Fw5+GEQ0wE3dfRG+Tp3MxJ9HGgk1SwqiFrIIPtd2Ln3EQISXXjLynC0B9EJtwq/sufevnCXA8rbwNRd0hcopmIcA6UENva9f/eAib58u132vD/MGjQhl0UyhJJrnv+jbD2WLCwU3Oj1D1waoiLHS2T9xXpfhhpu3mr7upBnlUBrV4Um8CJmaDJinjwtoAdxxacl8X9AuB9pTun0ejzCZidIz9nwiIjQqA0q0hrWn0CxwCivdTjhrTs7zW0K/zrusuDKwJdcdD66MbicF51aB2qzLNO/vTuuCwz7JSmlepYooOwfi9ueHzCcA1EwSAeSSg/aD4CwOsuVJSBNYA17TqXdK02eNAJRiABJOAm3ixpss9f93wBg52vY9KTq+ZNoVCxTprKVhm82x2YqilGcYmlGP7cVY2YE9otFV8HVHi4jXiFtmS/kYVfIRhaGXkHCjjgYPGt3RRA2l1ZGRRvNEOuxk5slE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39830400003)(136003)(31686004)(478600001)(8936002)(316002)(6486002)(16526019)(186003)(38100700001)(83380400001)(36756003)(26005)(6666004)(52116002)(66946007)(16576012)(86362001)(956004)(2616005)(66556008)(5660300002)(66476007)(8676002)(4326008)(2906002)(31696002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aUEwejFUM3FCUUFBYlhOR0ZpSmhRbnJwbTl3VmhNNEZYRXc2Qjd1SUNvRFJR?=
 =?utf-8?B?SXJub1ArT1E4TUxEMnExalI2UGJSL0tLblkxKy9GcUVwTFFkQWkvMDZmMmhR?=
 =?utf-8?B?amx0K3VHaEpsTytBcEVheEVZNWpHdmhvakxuZzd1LzFZREkyRUJ1bVhZWXR3?=
 =?utf-8?B?bWdCZE1FcFo3VzhzRldYYk9zVnZLUk1uZVZ5cmFSaVVwQXlJZk51ZjRLZTc5?=
 =?utf-8?B?TU1HcUxYS3YxQjJEaXEwemc5aDVWdVp1QlBPMVhqd1ZsblU0aWRlZXZDSmFx?=
 =?utf-8?B?anVVY21oSU1jakFGbXV2dEN1SmZTSEtYaGg0U0RpenlIcEI1T2dtMThCa1Ir?=
 =?utf-8?B?VWhpc3pDT29ldXJrYUJ1Q3RBTmRiL3VDNEJhMklZMnl1N0Z4Sm8rbmNRODFP?=
 =?utf-8?B?QlVLcWJIcllyR3ZrV3FKY2VTblFlNSs5bGVCSms2RUtOSXd6bVRKeFNnVmlJ?=
 =?utf-8?B?dEZzVUhwVDdzM3FVRjVJR0Y5bFc4NzZzUElBNWk1YnJ2b1l0L2tqcmFRYW9Y?=
 =?utf-8?B?aStQa2VIc0d2RkFRbHVSYVZLWFl1dEV5ZDM4ck9JbndPUDloWmU2cnNobzIv?=
 =?utf-8?B?elNxK2NhRWJRaFpjTnJDbnVSU1RVOG9tbk0rVVJ5R1czcUh5QWNuQzFWdTds?=
 =?utf-8?B?QUtiWEMwanlrSFp3MXp5Znk2Y3pmZithZTZ2MWtTSzB2YXl0TzdHMHNCQTVl?=
 =?utf-8?B?NTYxUzJZcVpFWDZJRTk1Mmk0K3lPcnBMcjg1UFNoNGRoQTd4TGlOYmlkRkRo?=
 =?utf-8?B?UXVGMVFUa1FRZ0grUjFkeERvRGE5NC8rcEI1NmxlaXhpRUh0OTFobjU4eloz?=
 =?utf-8?B?dytTaHl4Y3lDMTBmcUJzb1MxWStMR09DVzlIeDJtdGZ5b29nd3JWN2lxY2ZG?=
 =?utf-8?B?TUJyK1NKbnZYSEkzenhlSHYyVmVZc2lxTmRPMExoRTY5TGdjTk1vOEVXTko2?=
 =?utf-8?B?b0xyT2pyN1FYaEZHelFXenI5R0hhRVQ1STVjNUJ5UTZEQnZzaFc3aDBlSmU1?=
 =?utf-8?B?WGxkUnpIcCtoM2ZpTUp2Z1p0S080T2l3L2IzcVJkRXB4cmxCYTM0KytHMnVB?=
 =?utf-8?B?OTlUNHBuMGFkOU4vb3g2Y3VwTEhBTEUrNWVhbzRJNUVlRWdaeElHRy91MStl?=
 =?utf-8?B?Z3F0ampNcDFlU0VENGdwQzNHL2FOc0ZYeEFLMUV5bjNFbml0bFZ4Z1oxYTlC?=
 =?utf-8?B?U0FRV3NuUk1yZFJhNEM3WVE2S1ExdUthRGR0NEJ4U3hsNHBoTHh4ZHhSK3cz?=
 =?utf-8?B?MExZeitiOHFKMXM3U1lxdUxqZVdRZEk1R0d5ZFdySWQ3TDJScEoyRFFpMkVY?=
 =?utf-8?B?ak5PVmVWZTFWUUFXNk5aUmdqcjg3VEUvR2dRRGo3dUhTNnlLZHBLV2pKS0pU?=
 =?utf-8?B?bzNOcU1DVEdLaEZrT2F5ZXVpVXEyQmJrYTlWUVNodzJYai9qdDJ6QXUvVWZx?=
 =?utf-8?B?R0Q4cTVMQ1Z1NmxlaHk2cVpzRG5UTkNmdlIrMHFSZ2NYUHMrZ050L2VXbE5n?=
 =?utf-8?B?T1ZVNllUVHNOOVNPQW5QcXJxcTAwczJCT2Q2Q1Zxb2hoMHR6L1FBb0c5dHZV?=
 =?utf-8?B?cmlUWFdBWmZManVGa0cvRXZ2S3pMYlpyWTNhNEw1clU0UDEzakxYUzFCWDFM?=
 =?utf-8?B?Z0h1cGE5ODJDZ3A0TUhRQWVlWEIwKzFMWU1adFRmNVRDUy9QaVBscSsxMFlw?=
 =?utf-8?B?aVVlRHRjT2ZQczVaNmE5T1pIekNpL1RERlpheEFLZjlpWXJqMWNzTW1zYmds?=
 =?utf-8?Q?cq8TTXQbbt5zVfj8vb6JHRjGoSopgTfgQClvt3d?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb45ea2-950e-46b0-89f0-08d8eb123f38
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 20:04:47.9177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6idE2gdhlTsJn8FQ6W/9xNdCGm1oFTsbGZmRczufJfSG1iEl7iVM21O+qU01qiYHx/sXoR2LGnB9/SyR/6Uh2448JGv7xeTU3BJZqZSjUvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.8.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

Hi!

Any plans on v5? Now I have a request for this feature.. If no plans, I can take care of it and make a v5

02.09.2020 21:18, Eric Blake wrote:
> This is NOT the final version of this patch series, but I'm posting it
> to revive conversation on the topic while fixing it to compile on top
> of meson changes.
> 
> v3 was:https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg06258.html
> 
> 001/5:[0025] [FC] 'block: add bitmap-populate job'
> 002/5:[----] [--] 'blockdev: combine DriveBackupState and BlockdevBackupState'
> 003/5:[0004] [FC] 'qmp: expose block-dirty-bitmap-populate'
> 004/5:[----] [--] 'iotests: move bitmap helpers into their own file'
> 005/5:[----] [-C] 'iotests: add 298 for block-dirty-bitmap-populate'
> 
> I'm still trying to find the right QAPI contract (affects patch 1 and
> 3 for the qapi, and 5 for invoking the command in iotests), but right
> now, I'm leaning towards:
> 
> { "execute": "block-dirty-bitmap-populate", "arguments": {
>      "job-id": "job0", "node": "target_node", "name": "target_bitmap",
>      "sources": [ { "pattern": "allocation", "node": "from_node" } ] } }
> 
> which allows expansion into multiple sources, so that we can combine a
> populate action with a bitmap merge rather than having to do those as
> separate commands, like:
> 
> { "execute": "block-dirty-bitmap-populate", "arguments": {
>      "job-id": "job0", "node": "target_node", "name": "target_bitmap",
>      "sources": [ { "pattern": "allocation", "node": "from_node" },
>                   { "pattern": "bitmap", "node": "from_node",
> 		     "bitmap": "from_bitmap" } ] } }


-- 
Best regards,
Vladimir

