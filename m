Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200242FF4FA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:45:59 +0100 (CET)
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fu2-0008RB-0l
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2frl-0006yz-S3; Thu, 21 Jan 2021 14:43:37 -0500
Received: from mail-eopbgr10128.outbound.protection.outlook.com
 ([40.107.1.128]:11350 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2frj-0004QO-HY; Thu, 21 Jan 2021 14:43:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSRMuIOYVXi+d2ru31KA5v9XobN0ctdFrROs770P/9RAvw1BHfx3QPHaEB0KJ7BlQzATYviJufVyQQ021mSJysskL3EOdJl0MZ8PyG4ijNiBSpcNeFvx7K0yrrWt7+peNgD8vDU/Ft5YReAkKzMFh/TQAXLMhtBiOGaSqj225PByhG4OuDaonP5J7mP+uDmtEyvrJk9DnwhSD5GXPpX+NOzAuQ4IBP8tmoIVNzBjEofXFX0GmjAd7ke2xbnzJ3xqOQmKnvPb3Q//WllQCNopG2IzLLUPaKWBFiRFW+CZHLyl4TqUr0vPPC1W8Ph8LtTxRGzDtKI3UN0hv4LWXU99sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gchYmkpnE1mLrINQONz8X4hlG+1xamz5b+NhQyHVSw=;
 b=i6nPMdomfW7OgIJszDDUnITa4mfQVpEVvpKxURgBzjpTgeCth/kNNzVnhYhsHG28MFhjYtz0B5ZdffPyYcPFEmjK2Qxjg4q9lOH+CXNh4fcuDHBVHJlJu7+f1OrItARE7vvlhKVppSk3RU+R/um4duwwfaaX5Z1gASV4i1z79vg+2f+4ugxSjDlc/f3PEUrRW+mK0O4Zvx4st5gri2aG0IWkOEmC07Cwskf+aZ1dXIIJ+UBw7VpObkjyYnygUUEMCa5q3F8gS8Z9kcTYqCwQpYXRLomIXfpSW5CtGc879Ci4VN8mJqZ4v23+0EnCy3WCpUN07ng9Pj7PtdKthBC3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gchYmkpnE1mLrINQONz8X4hlG+1xamz5b+NhQyHVSw=;
 b=NthH7q6DU44VMaBKUUNEACm4Sp2v9tJapvmmJDOJazuy4aLcfycFVzaUdhy05GmsCtsqZkZpr+MSaW2Bf6CDMzno4fizbuDTbqdqBJP8kYEtkvCb4VtozMS3RGbQX5o8Fchf8yJV+Ys3UX1yxFo662kOQZYuh9XYAdQAHuYwHtE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4021.eurprd08.prod.outlook.com (2603:10a6:20b:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 19:43:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 19:43:32 +0000
Subject: Re: [PATCH 11/11] iotests/264: add backup-cancel test-case
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-12-vsementsov@virtuozzo.com>
 <bf6934ea-adf1-d3b4-2f8a-e590f3412f7a@redhat.com>
 <8d5bb346-b29d-4329-5a4d-439b93fdab01@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0795277c-7fc8-b480-f18b-89ebca8cf0bf@virtuozzo.com>
Date: Thu, 21 Jan 2021 22:43:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <8d5bb346-b29d-4329-5a4d-439b93fdab01@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR02CA0201.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR02CA0201.eurprd02.prod.outlook.com (2603:10a6:20b:28f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 19:43:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dcc6515-1bb3-47c3-238a-08d8be44d545
X-MS-TrafficTypeDiagnostic: AM6PR08MB4021:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40218C698946993F9E9389F8C1A10@AM6PR08MB4021.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IQ/9xJyPyzgGwtEZfdIL6vUjS1I015vdHMuy4j1G/JYW0qT8iDXcAp7tl4KS+aVO/vNRK/CRuU4JQhqQA8ciZmvzyetOUzlkr7khTB/IEQ7UveRI1eOgySjuZ0+vbNclLqxH1soFt7tAO5/2XF07IPq1r8R1feLUPHYcw8WkEc/VHui2yZ6yDp2BSRN2YjxNX0wDcb8f7vl/64vTrDFf+GmCP7f+3e9ujgylCJLXb7z3ar47nr6TQbVS8EPcvmTpB2uNTTgVYNmUmR6Qxf8a2XAckTqzZF61u4XLQg3O+x80Tyxw+8hoQr7e1b74LxBKSB9r+Z1vVqlN6GArV+sYUsXyanoWjFfWZJ23PTrE4waPEvxa6bN0HwipmaSmNR/jKIwWh9yi7zg+ik7qWa5Zh5ZezLhPXUp0ytpP5C6zed9xW3GF5p8W2oA27KAr4mAOpPcUmZo/b8s39MaZFRnwjz2zUaAcxYSHvbqdI1qR9U8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39830400003)(376002)(396003)(366004)(66556008)(16526019)(52116002)(53546011)(4326008)(83380400001)(31696002)(36756003)(66476007)(186003)(66946007)(86362001)(2906002)(478600001)(6486002)(31686004)(2616005)(956004)(316002)(5660300002)(8676002)(8936002)(26005)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VVdpM3lEbDZmOGY1MGFMTTlaUjFaSmdKTHVPMjNKWGxxdm5nUWxlMlA5TUpZ?=
 =?utf-8?B?eS9TRGozb3V2OGo1ckt4amVIbkswc1ZiaXZVVllScWttd0JxMTVGNWZISlpm?=
 =?utf-8?B?Q21MaWJhUVNPR1FGbTRYRDVBSWFSRWN1eDNBa3ptQjc2ZDlDZy8vNEpyUXIr?=
 =?utf-8?B?bjVjdVlMcWdVNXllRmdYdGJYZHc0dW9IYVordHN1eVJIQ2Q2aHg1dk1mZFBV?=
 =?utf-8?B?VE1aRkQ4WllqWEFSNHcvdFo3YWlJbXBJS3I1SjNOc3JkQStPeFNVTmhGZ0Nh?=
 =?utf-8?B?dExLeUJSTVlOYXRqMzJiNlQ4Vko2dXJLVkIrbHV5NEE0KzZUOFZrSXZ5VHFo?=
 =?utf-8?B?NjZhWS9wV0ZVcmJWd3gvd0owU2NDSXlsb1B6VHppQ2dZN0lscDFKTVRHYTc5?=
 =?utf-8?B?ZWVpMEp3VUpaVjBwZnN2RzF0TS9DVzg5cEJxajRyYWVVTDJRdXpUNVE2cE82?=
 =?utf-8?B?QlRTd0pacld0TUpKTTVvUHk5R2h1VkNSN1BTZjJVeE41NzU4dmpCREdCYzcv?=
 =?utf-8?B?NWJxYUxmRUVYeStPRUI3RG0xTWROYktJT2swSnZ6MHBreThtcCt5OUl5NHo5?=
 =?utf-8?B?aG8vbDZRSnFONE1oNVI2b2ZLQzhUZms5UXZrUVBkUmxLUThuZnBUV3l2TjRR?=
 =?utf-8?B?VUNlRGZqMmlPSEpIbU8xNzBqaldVb1Bad2diUU5KRU80aDdweWFBLzIxVWJx?=
 =?utf-8?B?bnEzbS9VTkdTK3lMYjlobTQvREJFUmJsVVhxWTVTYmRiUlYzQUJaUHl1WTRN?=
 =?utf-8?B?U3A1VW9peUEyYkhlMy9XME1LMW8wd2VOdTdKa3ZPbE52WjUwYVpUazB6MUNW?=
 =?utf-8?B?cXNCNmlidGNydXdSdEpmSlY2a3FWMTZPc0FTRGRtNzc1dE96aThRK3VURTBk?=
 =?utf-8?B?empwV0x0NGxuTVZyNXJyWXZNc0Y3V2lnVTkyOVEwUE9GQVdEUVUyNUg3R3VG?=
 =?utf-8?B?aFFKV0I2MThYOW1jVFFsUmFrYitFR2FjczhQMzRPdyswNDJDdDEybjIra01E?=
 =?utf-8?B?MHo2RU1ocWtYZ3ZySU9TV0E3M0xhMEdpVGNjR3lDOWFpRHNGQVFPN0hxbWRS?=
 =?utf-8?B?YlJERU1ETFFOeFJxelR6eFAvdGdXeUtYQVFIZjVrU1VMYy9KU2MycnRXbkxT?=
 =?utf-8?B?NTU2cXNKVmN5blB1N1hUTm9XTWRDNnpITGY5aFN2YTNJYWVqd05oVGh2dlp5?=
 =?utf-8?B?WmdydVRFMnlPNVB0UmxSeW9HeDZuWlRKZzFnZGpJT3VIWG51ZFBPRUNuM2ZH?=
 =?utf-8?B?eTR2dU1POTBwVlA2SlVCUWIySjNmZjJoZUY1c01sQk9hZ1A4RWlOZ2FGNVlp?=
 =?utf-8?Q?rCTlLSkTc9xzA794tWBQZhkP77p41FccMJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcc6515-1bb3-47c3-238a-08d8be44d545
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 19:43:31.8997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /c0JFMMI/k+5JVYCTSDVEGjB5GgWqbn42x2op7dzoUCswiJzUgYN5Mgt6U/yqLiyc2EFmyTvbUTsh/puWufuDfQ4DkEFaqQDXQT6ZZ4PRwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4021
Received-SPF: pass client-ip=40.107.1.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 05:21, Eric Blake wrote:
> On 1/20/21 7:28 PM, Eric Blake wrote:
>> On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
>>> Check that cancel doesn't wait for 10s of nbd reconnect timeout.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   tests/qemu-iotests/264 | 21 ++++++++++++++-------
>>>   1 file changed, 14 insertions(+), 7 deletions(-)
>>>
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>
> 
> With this patch applied as-is, the test fails for me:
> 
> --- /home/eblake/qemu/tests/qemu-iotests/264.out	2021-01-20
> 20:18:54.741366521 -0600
> +++ /home/eblake/qemu/build/tests/qemu-iotests/264.out.bad	2021-01-20
> 20:20:37.242451172 -0600
> @@ -1,5 +1,5 @@
> -..
> +...
>   ----------------------------------------------------------------------
> -Ran 2 tests
> +Ran 3 tests
> 
> but with no obvious visibility into why.  Did you forget to check in
> changes to 264.out?
> 

Oops, definitely, I forget to add new test-case to .out file.


-- 
Best regards,
Vladimir

