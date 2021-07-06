Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9441D3BC8AE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:52:37 +0200 (CEST)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hkq-0002CJ-ED
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0hVw-0003dF-Bw; Tue, 06 Jul 2021 05:37:12 -0400
Received: from mail-eopbgr00116.outbound.protection.outlook.com
 ([40.107.0.116]:57732 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0hVs-0002ZQ-0q; Tue, 06 Jul 2021 05:37:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORDrXPktwjZTO9pa8NZnCqDlh6PuhWslv/XixzMnQ6sNwhKWa95c3msyMMIYMhD61uoBD6+TX96UjSqPzilKvZNkQKBnCqPDfpT/gOCaQZAKnsY3H4u8cIfF6JCiA7Zdukmgm7bZ6chYDLMHM7AKNZjpxn653jC4Eb8SId1e4/EYUixiT8U5VYUuFexdOS6CT7BqB1bbL1YTaNPUiHpbfNT/OSytkAdmoDBt4YGnwHryQbdi03ZIQoZkxqPzvz+BqxBibuZQGw2oyQYbingLRqVXe0b9RTrfv5tkgrYQY5fGf2yAL4L2BwTvZwu/Ym6i0qZW5xFF4ReHuowoo48K2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCfgkRM5ZuQHLhvCzvLW4K4fXhq9nn3LOUGHW4LxQ+4=;
 b=Itv7X/8c57XaRsMg/Chno/yIB/3H/nrIN612LkBDDAWy/+w8X0Wg75lBIT/2SoopWGEmNZFRpZ5blMeNhV/i4uNTdeNJn3JrkiRBleD2c1e7nqIzqJWHwzvzri7C0Qd5Ib16i6w4S2coTupXdAs+4WBV54aBoQZBm3IePo5L3207q6e/7ZC7fPm49jbIThikE2qJFBykjgFyEHtZh9yjgeH42kviCXghfmwXHBpiQP+esrj1jMOz4gycOIb/OiIKC8vGnIPg/m54xTJ1tGXOUaOO3IMUOJTB3KPpkQVxo85sINRKD9Qyhao40esCRNTs/u4LYuKlciNDlnw6fcB4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCfgkRM5ZuQHLhvCzvLW4K4fXhq9nn3LOUGHW4LxQ+4=;
 b=arGrxxYfOxMPxw9uUOtjL66xKwYxQa09usA0vtGOw8zM3TYgCP2DLCsVL4SB9HB7QphOAWlqWimqsZxcYxtNFB0XJ5c/Kt3rkf7Usb6pTfYdF0Y8S5PbGDWBSvQDozgtQH5cit0mWnzRgXpLL2NOpdnl9VlJa0Jq2mguTBKQHS0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 09:37:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 09:37:03 +0000
Subject: Re: [PATCH 06/10] iotests/297: Add 'directory' argument to run_linters
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-7-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <82ed7dc0-a82c-7e4b-d277-e6fc42034568@virtuozzo.com>
Date: Tue, 6 Jul 2021 12:37:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-7-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 6 Jul 2021 09:37:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f28024a-1b9f-4eb4-6cbe-08d940619cd6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6293:
X-Microsoft-Antispam-PRVS: <AS8PR08MB62935DC67D82A72977F25F90C11B9@AS8PR08MB6293.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E/ZTU4zqQpGHBsGjKNzWgNXOvr0kH6shZcpsuZGok8+T3syBs9jGnG34iPi8bcGI6QCydyxuMpsbEJnPmFJzvfLe9uFgjspmS6OodQOJzW4W6IPT+am5VxA+oQiwEZ2b0+o71eFd6NpA55Q/n6BdpTMHzhE8z533dKx+n17XtByqrIMHmReNAYCWUEIp0r0ssQe6RiGK+vP4BZpV926U+S0WyL7iHbkEguEOsJ3J0Eyb6JZjPIe3f8gasXoK8blgOfjXIIUbrxOphYbBb6jNSfZ5nkTGTLeA7Dp/j917mfaKFddMCcK/LXKBZ6PAJppB00SldbFPj5bk1bX7VN+H6MT23v3M2tG5ehynQ4pBYcPQ+unnoQFbo4HU4ymJMBC2oXA514xomwKmA+pRL4HZdKdz4/d7C3TNH1d0N5xiRfUSz9MjHIWpas3VL8eL2f5HE8cJvVca9IxIVKqboogjENzJN9/U2l9e9GflWqhFtY3xEOsEcYSiEfA3Uvi+HP/oLHz9eh3J3lDUqSaROPLVdgENB1G3D4qX5e0LEgvU/dzJEV0teItuxAX/0cZaySAAfdxFF3uea4ZmgjXJLKmRB03lJMRH7Lfxb83gU1930N0WnZCNo5BPltlaZkvBZcTrC8YMEP0vn8zELnjLB4TutQHPUnOZpwmOMigf4/Lseb8PTPq2DCUdw3WXsJLJPLW/TGDq5K1jkefxXRHygPnLf5X0nl3m1EaYbgcwGisHwei+yFX3JCEF5IL8tH3AvSAUl63SBIX7BhDnjWH7Q3PL1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(366004)(376002)(136003)(346002)(52116002)(16576012)(66946007)(5660300002)(4326008)(38100700002)(2906002)(31686004)(31696002)(186003)(36756003)(8936002)(16526019)(66556008)(66476007)(558084003)(2616005)(6486002)(478600001)(26005)(86362001)(38350700002)(956004)(54906003)(316002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlBuVlZvRTZEd0QwQXowc1lzblZGTDAvYUFqTHFtVUM3OHAzT0FEaEdMZXN5?=
 =?utf-8?B?ZmxEZjA0NEU4M1FaK01EWTN6cVhvUFpRVnVIL2VUZ2VGMmtsd2l2Q2NxSVVa?=
 =?utf-8?B?QkxUQTBYc2MvWnRWQkNhdVhjb2xiTjZBRUIwMVVBLy9VUG9KU0pCdVRza2xm?=
 =?utf-8?B?bFRpOUlZNk05dnJ4MGhMNXAwcXJCQmx1TWVzcjBlMVIrczJSdjBDVjk3ZU9S?=
 =?utf-8?B?OXVrY25PejBZRmpySmZXYTdVMUFwdmtGNUFtRE5WN3VrQjNYRkx2YXc3Y01T?=
 =?utf-8?B?MkxmVmVNMEdlQU5hRDg2MWJUTUorSnBqd2lYWHFNK0JiZGNNZXlSOVJXV0RK?=
 =?utf-8?B?eFRKQ0haT3N0VWREVFRNbXFoc2xDeitaYWpEMTJGSThtZXBwc3pYSTZFYTFG?=
 =?utf-8?B?R2I0Wng2bUs2VzNiaHBia2JCVWFkN29FTmFzKzU3bno4alZ4eXI4TVdQRDFT?=
 =?utf-8?B?ZSs1dGhpSUc1T0hhVld2RnNJTkZPb3JLeUxqMGQ1SlJ6OGdIQmtsVGsyaFRl?=
 =?utf-8?B?NStJNzd2SDJxd3pWSFBkeC9KaXRONm9PeEpPcnlHeWtNVFFxdWdUdjJRQnJ4?=
 =?utf-8?B?akVUckQ3ZHZvNXh5ck4rcktjekM1Z3JITGUySERMWUVCYW9Ick9PRkRrQ1Nk?=
 =?utf-8?B?SFV4dXVTNERmUzlRbWpLY0hFOExudDR3U2duV3F2ZXpHajRvTDdTVVBUdENk?=
 =?utf-8?B?Z0kvRmxiZ3lQbGx1TVM2Mi8rTEd4WmdRWUExNEZCYWZnNjhPcjJJV1pMZEV2?=
 =?utf-8?B?Y2FRZDNTdnBidzVsb0ZnK1hkbnllWFcyOEd2RkF3ODJFT2V6a0F0RXo5eWx2?=
 =?utf-8?B?NnFVZHU2YUtyWWlERlRnS2xpdTMvMmtJNUkyeGR3Z0M1T2hJRjVZTjZVS2Jl?=
 =?utf-8?B?enJ3aUpsMHhxVjcxRERJaGw5RDdBYjAxakhTNzNtUlhEWENhUWhsQkhmaE5y?=
 =?utf-8?B?MHQzSWYvcGNyR1RKWGdVYnlsMXpjK0VQajBuQUQxdVpmaWtrUUEweTNLbW82?=
 =?utf-8?B?N0loVmlSUldxeFU1MmQzWXA1Q0hUNTkycGlUU0NTY0xLZnk5NTg3Y2VmT0xn?=
 =?utf-8?B?RDJiZ0NPblM2WE4wdzBsSGttZ2VpMzl5dm05UkdlT0RNWXN0K0hHRlVqTERp?=
 =?utf-8?B?cXFYT2haME5BdlgrSllsczl5TDRHa1hWaFBjM1hXdk1RT1I3Mm1jbEpYZlc2?=
 =?utf-8?B?WmhMejN2YitFUERpSzRyRlVMSGJhbWN3MlNESmp4Z0lKK2JlNlowS1lwN21i?=
 =?utf-8?B?MTdwV2tLRHFFWWNneExUblNVb1dnM1FzRGlVa0VUdWRkQmlleWdqc3FZTThU?=
 =?utf-8?B?c1d2MW1YTFoyNTJ6VkRRTE51cDhVUWo1TXRlK2J1aTdzQnFpNDZTWmVqemNJ?=
 =?utf-8?B?M3pyMnFwQkpyRkN2QWVLQmZqWW1rK0lxL00wYWJuOHhkZndsZ25MWmlTZ1Bv?=
 =?utf-8?B?ZVRKQk9tbVhubXVTWG53VjMxTFNaUXVPZlE0OHUyVXJZVStKQ0xrcStaQjVt?=
 =?utf-8?B?VW1zbXZ5SmpyYlFzcW1HbkIyRWtmUm80UE5UMy9qUzVmN3hCL0hYSWZDMkdC?=
 =?utf-8?B?Sys4RDhIcHdZVUQ2TTNpR0J4QnE0MjQ5WHBQN01OZjVobmtCcEJ2ejZua2Yx?=
 =?utf-8?B?dmhNOXZTUGQrb0F3b3JreGIzUDQ3WXA4OENxcFNjMVJFdUdtVGhTZDRrMDc3?=
 =?utf-8?B?TDkyZW8yaFFScGkzWVlaRkd4S0oxUTZvUGxEQXZqUis2cFhvdWZFMUZvQjhN?=
 =?utf-8?Q?68ncxsaD0/9xQ6J4bq2LxgvyhfOALnJx36T5Ow9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f28024a-1b9f-4eb4-6cbe-08d940619cd6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 09:37:03.7915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Me3AYdo4nX2ayd0yPhuji+zM8wvPC3kujTWTCz+b+mE1iTQFuuyeukwR4IYKd7McBwiWCaxD7wlPFSRem4rt6mzvZxHrmF8EvPkCetiT+10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Received-SPF: pass client-ip=40.107.0.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

25.06.2021 21:20, John Snow wrote:
> Allow run_linters to work well if it's executed from a different
> directory.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

