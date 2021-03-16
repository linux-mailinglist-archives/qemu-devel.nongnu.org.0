Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC5033DD2D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:12:54 +0100 (CET)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMF7d-0003vN-JW
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMEZH-0001kr-2y; Tue, 16 Mar 2021 14:37:23 -0400
Received: from mail-eopbgr40125.outbound.protection.outlook.com
 ([40.107.4.125]:58043 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMEZD-0007hQ-1m; Tue, 16 Mar 2021 14:37:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7AXU4XFp25CVGQYirKCtm3Q+AgMC0kW8KaASYqqGzYtuAsOWPTa5ol4tvXDGgAO3+P9nN0+Rp9UL+0s9Gu5bAEF5ubNQSAUkBzptEOwlS3SPbTlgL0SrsFhlPcineN6biUCLAxMj7azxL3413Jg4DaoGWOcJqWUrTg+4HVWqM31vN1gCJAUnbvZEWiX6rBskxyyz8YvVx6riRHz8ZeZnapjWs3WB9Qo8Eg7+b97hubV+FUakRjG217YV0VfANrNbXgFNQTCnRSSzkb6c18Sb3iZ0ST79wRSsm/GyHQzrSqIqsJ1Yp/Z/jOhhoZP+t+562fGVXl04k8pnbMnLXmP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WGXK4PsQIzJmZm/I/fWy1szSAWboRSP20S/AFgxFi0=;
 b=oLji1x+tddPs04SqWZq1+08s2+ouBLiedKAZGRfZgc+sUWXiy852S40gB8pI5zU36Ij2XINe+7mDtT4BKEs+RpqfETXZauapJqBfNJeKnkom5tt491idAvR82p7ugf0DHp0J/lrB6VlfOpKc6uqUDqafEvLfS0ZyzVEBJEuPzyVT7IoVfwU7NuJLytQEakVYJC7VwtbF3G1u6hAfiXPV4WC8KMKUAsWMuhz10vBBg2m1Z/L6FUJuhVqlfyNeJrhow65j4fK/uLrzOMid4XJTOb1y/pLrpgzCKX3FLFLFqwW6W/yWkdxh7qxNRJOymmMN7pOxHZJIRw9wkMzrbOVUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WGXK4PsQIzJmZm/I/fWy1szSAWboRSP20S/AFgxFi0=;
 b=Gv2hYJ1fLeobnSmfFRVH6NatIdeW2VS7be61Yse+0AqHWZ1AZxEVYRCg7HSHPuV5lJqNQB03K7t7rlY3Fo532VtTuJ/j2kyftyfr6oWZlC4dFzIVLf4hocyRK8YF+V8SuLqrosu24wRfOPSXSQMUTH4c6B0RLmDTTevfIO9fiqw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3624.eurprd08.prod.outlook.com (2603:10a6:20b:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 18:37:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 18:37:15 +0000
Subject: Re: [PATCH 7/7] block/nbd: stop manipulating in_flight counter
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-8-rvkagan@yandex-team.ru>
 <de4fd61f-ccd3-125b-b636-aa06efe5823a@virtuozzo.com>
 <YFDX7aZngRCZF9Ew@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <37c7fd4a-fa68-22b0-6d4c-4a161116515a@virtuozzo.com>
Date: Tue, 16 Mar 2021 21:37:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YFDX7aZngRCZF9Ew@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR03CA0020.eurprd03.prod.outlook.com
 (2603:10a6:208:14::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:208:14::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Tue, 16 Mar 2021 18:37:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d10155-79f2-4607-086d-08d8e8aa854e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3624:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3624BC2C4F0246B1224138B8C16B9@AM6PR08MB3624.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAW3cGDX4Z3K8DaqMW0EdI/fedsI9orl3OKdOQRyFrOvgdPztTG+kCKtSDN+PBW00oE3PbQva3VF9meSFHcn0C/9HD0auUV3VccZZaGgcYObJtwY+sJlEfQsmW84PCyC1/5pVEy/AHr8Tdsl4X/2gMGGv2S9W1qcpz91dWbHnMNU+mRhi0u5xzuEFSIRll+NJdDM/FIMtVGlws/Swx/cSKaLLgP83+xJPxRnIvnKrkEue4xezCReEbEPTPhaKxz2Tbtzw3DnIjgmlPfW+a4PcTu8vM7tU2dKOR/85TdPP7Ly9j6ooBUMgdc4EMls9eKQlczTXp+IOlgJnmC9fRDQeupovYlCgGXSprVglBCkattlMrG9TLVXaCpayB24Hy9V128Ki1su4f0v4rTzoflrW0Bx7uu/p1b1GCwDNQrL206BUeZDReZfG4P17aQAkZW1S9jOD4k2e2jLd+gowd36KmWAcBI48W9pBVmyrguTwBSpLy02mZvVfnQ865OGhx7zWMkgC0aGoHP0AGjAVGXeVaqBQnnm/JGdfsoznKhj4QZWKwI84OdoHv1YtWJYB1Fn11TOx5HFqYBmfWREF4TxVZVTgwK5wsV5JADuZ4R0H8DlUBXTrI10OYYxWEtv7JpmoqeYmS6IU0fEtsSrqtKKQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(136003)(366004)(396003)(346002)(2616005)(31686004)(16576012)(5660300002)(316002)(956004)(52116002)(478600001)(8936002)(8676002)(16526019)(2906002)(110136005)(186003)(26005)(31696002)(66476007)(66946007)(36756003)(66556008)(83380400001)(86362001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Zk1lTHVlR3ZnRmF5VFZGaXlvSU1TSW1OcEpHU3hudHdSQUxHNlQxZXlEUTlZ?=
 =?utf-8?B?SEpCRDBiYm9yUUg4NWxJUFhWaC9aUWtpK1QzMWhjQ2RmWkxvK0VFMGtlZkFT?=
 =?utf-8?B?c2NOM0Ywb2JBL1FVbFppblFnb1JQYTgyWW1TVkJVNlFnY3M1NS81OWhQV0ps?=
 =?utf-8?B?QWEzdGpjYWRGcDAzV09oUmFFd2x4M2NTR0Q0a3ZSeE1qMHJSSWxLblRBNmll?=
 =?utf-8?B?UVhIZGdMRlM4T3FPaVZwanROY0RMcUFOV256T0NFcDRCek5vSWdkT3N5ajRa?=
 =?utf-8?B?VDVNM2JUdlA0ejFJT3BmcVl1NW5yck1xMFVuWEc4a1NaY1dCWTVrSVE0WHIv?=
 =?utf-8?B?bUg4U2VNS092SnBpUnMxY3o1Z1RLZEE1ZGdSRElOOEhnNWdHbktWL1E1VEFH?=
 =?utf-8?B?c3IybkpnM2ZzalVuZlkrTkxwa1JMQk83T2ZiOWlKeXFHaWFuamgzK1dYOXp4?=
 =?utf-8?B?TFNQYWhwODZIMHNWV2MvbXd3N2dNcEdvUTNBZDM0NE5XZTZEYU5UTDRYK3ZV?=
 =?utf-8?B?aEVyRUNJZWRZbGZydnIzWWJ2a2RpYTBPcUYwZkowbThlV3o4Q1pqckxuNkpL?=
 =?utf-8?B?a3puRVpGYTcrWEI0YjhOcFFodWl0TXFkUVJXVEMrYVZqYmg1UWVlMVN1T2FV?=
 =?utf-8?B?bXpKZDV2dmVBeERva3FMejVCcHplWWtPdldsQ2h2UEFVNytDTUNGVDBQRkFm?=
 =?utf-8?B?U1NvR0JoYTlKUmNQM1pUZDk2d1hCZllSQUQzUUFhV055SHNDaGU4Vm5sUkpI?=
 =?utf-8?B?bkk4YzVUYUFFN202TG43eG5ESnBiT3g2SzduZ2ZOME9teldpT2pSUTZ5ZU9T?=
 =?utf-8?B?bDhDdUlHcHVzWGl1T2ZpOG42U2dMdUxENnJnV09sME5tQUlzQVVRalMwcGNh?=
 =?utf-8?B?Yi9zOTNyd0ppcEZBNVg2RngzMjVWbjNlbnYxV1F4Qk5NNGsvWStFR0xHNU1t?=
 =?utf-8?B?Yk1hS084bDNBRU5FQ2hpVXRLcEhnNVRQVzRCSmpJbk1tQk1iQjZXdTZGM21k?=
 =?utf-8?B?Ky9OandjTVhWRmY1QkF1T3NVazF3aUtpOGMrWmpvVDA0WHFNTmpLVzBiN3V3?=
 =?utf-8?B?Nm9mRUsrVU9Nc20yUG81UExzOXRIdVNnK2hMTDh2R3R0Tkg3enpUTlZOTXhi?=
 =?utf-8?B?MENhTXQ0REtwSlRnbTF5ZEwzZXlTc3N0STEyTGc0eWtRZDFjNHZRRFAvclly?=
 =?utf-8?B?T2tabnBkQ0pCMTVyZGNXd29EUTErOVVwOENDMDMwWjhkUlJ5VlVBcGtPQ3Zu?=
 =?utf-8?B?dkl2M1IxVmo4emdyemNKVW9LSTcrVENYRTlHRjVCRDU1WGliaCs5SmN4NStM?=
 =?utf-8?B?R0QzRlJYQXpwZU00SDhiYWdPZlVvUHYwT2M3OGRCYmJHRWwrLzRFdTZYazhX?=
 =?utf-8?B?TDdISmI3aEdqVkZIWEJEamVSVEMyUWYwalNWNnd0S3F4RmRLRjQrYmlsV3NF?=
 =?utf-8?B?bVQrc0ZMRTVISG5vWEFIZEFhN0hUT0pxazdNWnlUSzRuV0NjZEhpdGtuQjZD?=
 =?utf-8?B?MzA3QzVEVWxXQm9iYm1FcTlQRkNHNHBaL1Y1Snd3QmMwajJnL01nald2YmJV?=
 =?utf-8?B?NEQ4QVFuWU9WVlZRNThxd28vK2JPWEVVUjZDK2VwYVY5NmtUeXZCRW9GOEd5?=
 =?utf-8?B?cHFNNHc4c3FYYnBRbWRnTnB5QlFEWW5CWGV5bmRDZTFXazRxalMrajZGakx1?=
 =?utf-8?B?VElnQTNLZEVzYXdMcW1Fam52M0x3Um9KbVJubWN0ZnYrb2tTUU9yc1JaVHc1?=
 =?utf-8?Q?Kz4wU3iOsJHZJedYSbMr0twNiX7aQ90srU9R3yH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d10155-79f2-4607-086d-08d8e8aa854e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 18:37:15.2449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAMml3Mdt3UA3eT8stY+G1lvojUg2oWOxAURQ6gBUznHOfH/CHTcu6a91P+bCvmhSdjLueILoT/jrAJJOdZtZD01mTjWKBP/LIPv92SU/3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3624
Received-SPF: pass client-ip=40.107.4.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

16.03.2021 19:08, Roman Kagan wrote:
> On Mon, Mar 15, 2021 at 11:15:44PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 15.03.2021 09:06, Roman Kagan wrote:
>>> As the reconnect logic no longer interferes with drained sections, it
>>> appears unnecessary to explicitly manipulate the in_flight counter.
>>>
>>> Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
>>
>> And here you actually allow qemu_aio_coroutine_enter() call in
>> nbd_client_attach_aio_context_bh() to enter connection_co in any yield
>> point which is possible during drained section. The analysis should be
>> done to be sure that all these yield points are safe for reentering by
>> external qemu_aio_coroutine_enter(). (By external I mean not by the
>> actual enter() we are waiting for at the yield() point. For example
>> qemu_channel_yield() supports reentering.. And therefore (as I
>> understand after fast looking through) nbd_read() should support
>> reentering too..
> 
> I'll do a more thorough analysis of how safe it is.
> 
> FWIW this hasn't triggered any test failures yet, but that assert in
> patch 3 didn't ever go off either so I'm not sure I can trust the tests
> on this.
> 

Hmm. First, we should consider qemu_coroutine_yield() in nbd_co_establish_connection().

Most of nbd_co_establish_connection_cancel() purpose is to avoid reentering this yield()..

And I don't know, how to make it safely reenterable: keep in mind bh that may be already scheduled by connect_thread_func(). And if bh is already scheduled, can we cancel it? I'm not sure.

We have qemu_bh_delete(). But is it possible, that BH is near to be executed and already cannot be removed by qemu_bh_delete()? I don't know.

And if we can't safely drop the bh at any moment, we should wait in nbd_client_detach_aio_context until the scheduled bh enters the connection_co.. Or something like this


-- 
Best regards,
Vladimir

