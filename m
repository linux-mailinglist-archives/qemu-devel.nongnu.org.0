Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060052F5A3E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 06:19:38 +0100 (CET)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzv2m-0006xG-Ke
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 00:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzv1P-0006Vc-5r
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 00:18:11 -0500
Received: from mail-eopbgr40102.outbound.protection.outlook.com
 ([40.107.4.102]:51462 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzv1M-0002CD-9X
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 00:18:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgJyPVMsYz9TSWYhdVRl/IciobI/jLaYZ6uMBT82rk3nXzYqENo4IwzOO3A63EgLjSseBbQfjXSf+axPoNPhJjFEkc9l8cXBdoddw2tz/hyRLyiColPeWR6aUSLXujEFg7IGcU77sm8DM3mI43H1LxBDVvUwxSBPO3KjauDEmXrYB2BCbBrPJnMu5xmeD9D6Pdk8w6gptmA2572qU7gk4qha28NSVe85YnHCdeju1oITmz84U407FSnnSZHXbI9Hyd+aXHAJ961gIhDLZxbr2wM0V7ziI6hhLPjjdyNL3vpwaA1d5tyOKV7rfyi/YD8AYSRVl/W5GGuCePh9QRClvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wh9u+vxP1M4kt9lT1JH8/iKSnexrnR9C+uq1ZfGJK/U=;
 b=PqfQX6O7FEDurOmq7DueV8jDdtFBBKGyerXge3QtW5y1RwaX8ZrfF3ByB6Ooo9tJD7VVwHFWPRtkW5GhbqWHXcvEhvasNsugbsSMUg5ZuZEapNj4Dr9614NRQLdeQ/ssPQkJ0mQ/Dflo6G8dqvKzBl/nM22SGDAo0VxN5oJZQnj78ncE19d2M1dCOzJgJA8dnLDqEAtsbpuEG0NvZonvW2sZ+B+4s5kh7rKOGCFs//CBsgZ9RGCOGYooj1JpOz8PIhbbRJJ2FrtAL1ZZmU4A4gFoJGgYCqajYhKM4//RaEO7j3unNi/rjLo5ySLGfpFTEJBPp8PUDnUtUO+rBP8qgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wh9u+vxP1M4kt9lT1JH8/iKSnexrnR9C+uq1ZfGJK/U=;
 b=dfhRkxGN5Md2UpVcTuEbVzWoZhux2wt18oC9GWlGdh2GPAHZbICU657liqSlbZVUHU99ah72CERiXWQ6UGaf1gSggI845XkY0Am9jaEtUybtAuHRLYiLPu1t04S7ND5cRVy3syxOskEQLrl+JeMgVlMV3HiMfMJsntvBS9u6l+s=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 05:18:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 05:18:04 +0000
Subject: Re: [PATCH v4 2/5] qapi: A couple more QAPI_LIST_PREPEND() stragglers
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210113221013.390592-1-eblake@redhat.com>
 <20210113221013.390592-3-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <97c81d71-3bd4-3faf-7bcb-2a7a69103c04@virtuozzo.com>
Date: Thu, 14 Jan 2021 08:18:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210113221013.390592-3-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM3PR07CA0065.eurprd07.prod.outlook.com
 (2603:10a6:207:4::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM3PR07CA0065.eurprd07.prod.outlook.com (2603:10a6:207:4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 05:18:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c63af47-638a-466f-faa9-08d8b84bc538
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3221AF583772B334BB390E5EC1A80@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBap04taH5cxPQ22iA3Aa4U7iKRlBtIOdyOrwaVWNU2+Y5CQZkCwJIOjQiAr+y4ahYqrQLFTFVNB4qErGKWhTqO8Ll8TrVffEdB/3RffuTGsceY43qNLjatd3C2CGIWkIOXgNiZ3/VlRLAXepY3+arJ9ir375FwCWYpLPEJQdn7XC146vIM2pxwWV8txEb6urDilklDzwvkMBI874qP2eYOG9Fo8Yp/qjkoe4drH0wED1ZrsDMQns14xyc+HN5BiaEDG8dLQRdJ9ny1xTOUeGQu6iy/Z0wRb2+MMvGrxzypiXMeoXDSc/BHL4as5cl1WGvExYHwxboLJZvdmetwBCZ/RLi9pRQ4/xlsbUHC99AvWscAOx41MjKWdLrBFEHVoxceUZwuVAnweajkUq76mbdXOpz6pldeONmuS5YUGAO27CxK1k5Fgix02xJQ92ZsVVqquFdnO+gja8MdsDFEVzjbvwRoWIDh9c3maxFfyIz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(136003)(366004)(346002)(8676002)(31696002)(36756003)(956004)(4744005)(8936002)(6486002)(66556008)(2616005)(26005)(478600001)(86362001)(31686004)(16526019)(54906003)(5660300002)(4326008)(316002)(16576012)(186003)(66946007)(52116002)(66476007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ky9mY0RwT2ptWGNyVHRmUkhXdnMxNmFkN2pTbnA5c0ZxMHNUSzZoM1FsRW9x?=
 =?utf-8?B?TVYzZVpDYkFFTk81RTkxVi9COEd3SVk0UFM3ZnJhTHBHU1N2NG1RZDBKY3JL?=
 =?utf-8?B?U2tKSHhGTjIrQnR1azJMejRmdFlUMEVJSXlTLzliOHNBZEFEZ2hmYk4wSVEr?=
 =?utf-8?B?UWU1SngxZ1pQdkZ6cHhIMStZdGxUd2lhWUI2TlNOSjhCbVB1NXBuSytiQkdD?=
 =?utf-8?B?UXF0OVpiUEN0RVNObjA1QVk1TlB0TmR6QVptVXo2Tmd5N0Q0azd1Um56bnhw?=
 =?utf-8?B?ajlzMDRoMGFHMGpMdUU3STBOaXN3UlMvL3ova0c0c09jRGVNRVgrNkhSUmh3?=
 =?utf-8?B?YkRQQzdtVVlYVjBvbExPQWFFK0Z3YzJWMmMrWUV6ZExxRXZSdGlNcHVJUUNv?=
 =?utf-8?B?eWpUbTB4NFJVKzI4Mk11L3loeUdDeW5KRDFYemVtNjZXeFhiY0IrbFlNdHZp?=
 =?utf-8?B?OGRaV3IrZ2I2Q3FYWU1HY2VIZEx3ZEtGTnFnNTZYL0tKQytDbzR6NnBFNEdr?=
 =?utf-8?B?bmc0Zks4UHdZUkc3YmVNUWlZWEVzUnBCN3ViOGVtMXlaNjJLUmxUeng4OXVL?=
 =?utf-8?B?eWFaQldJNmZjUmhsVnRqTjFCZGYyTFlnNmYvNXdSa0UvOTRVSlJ3ZzUrQjFF?=
 =?utf-8?B?UnlnVUdBU1JqbWtmZWYyLy9oaklha1hGd3pFTGNzRFdFSWo0WWdsRU5wampT?=
 =?utf-8?B?M1BzeVNxTmFGRFZxWXRKdjJZdWN6Z1AzR1NQQ2ZpK3ZJTk1mNWYwTDJQcHp5?=
 =?utf-8?B?ZXEvOGYxSkdOR1UxV3N4WndPZWRwK3hBdEcxZWxQUjg3N0JlL05NMjhjVGlV?=
 =?utf-8?B?NWFQTzVGT0JlK1EzTWwvZzRPdWNUNkpiVTNVOUVOeDd6bjNaMmZsN1N5REhB?=
 =?utf-8?B?NWw5TWhzaG14eWI4V3Y3WG9EcnlBei9Sdm5HSmVZS2EzUGpHTitwMkpHektp?=
 =?utf-8?B?QUdabXpjUjJrSEFaY0pSNHpYdFhNenVydzl3eTNJNXA2a0kwUVN2MmtrQTR3?=
 =?utf-8?B?NTJ4N0pQYXVUNEVMSENENERlVStpUmFvMGxyaUlXMnlnQXlzK05PWUFxcmZV?=
 =?utf-8?B?TmN1dWw4TzAwU2RQUW10OTQxNXVsajJiYjFoNFNLYzFHVDcyVVFwNFRzTDU4?=
 =?utf-8?B?bFErZnpKeC94ZGV4M2E4aktXUm0rck9GTURHRm9qNXFlZ0Y1T3lLVDJJZXNF?=
 =?utf-8?B?bHY0dVBhK29USGVLU0tGVkE3T2Y0QXlBSE5ZbkY2cHJwb3kzZVVDTVExQUI5?=
 =?utf-8?B?ZFZTVVUxMEUySWpDbVRCNkc3ckcxZ3RhYmU2VStIRkppKytEY09nQlVsMHhm?=
 =?utf-8?Q?64qrEYAKOLfTkHP20mM8zJ0vLmqPA7IM1L?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 05:18:04.2992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c63af47-638a-466f-faa9-08d8b84bc538
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+ODxuWoNsWPPqd6pHeJp2CFGUx0rVndapLFHkkZZK5bDZ5QP6wXLGoTKbtIPMWWDGXki4YPveyOHR0MIPgomjVgYRgzUslhlPpjn4zBlAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.4.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Cc: armbru@redhat.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 01:10, Eric Blake wrote:
> Commit 54aa3de72e switched multiple sites to use QAPI_LIST_PREPEND
> instead of open-coding, but missed a couple of spots.
> 
> Signed-off-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

