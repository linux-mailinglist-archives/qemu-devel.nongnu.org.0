Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B59414B11
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:51:51 +0200 (CEST)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2f6-0006kZ-Eg
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mT2cd-0005nK-7r; Wed, 22 Sep 2021 09:49:15 -0400
Received: from mail-eopbgr30095.outbound.protection.outlook.com
 ([40.107.3.95]:29508 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mT2ca-0004pp-MT; Wed, 22 Sep 2021 09:49:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2SUWoedqf/+D2wReBl9vPSD6S2JRgil/+w0tdEhgK1U9uZCg2IIcqnCpZxwEmR0NqQySjF3uU7RfxQIg6/CjIHTe8p6fz1ZrKQAoHLvct8gKV0h88zzSmBKeOvLi5AN352m5vF3lZbTDrBIj7t+girDbh/8XH77v8rzRjB2ASOdpIFW3Rml/L6eniHJHAgofT77Is7ZHG6yO6Rf0J9LkEvsHwweDlTsNlD2CTWLc57Q7bdWJ4SZ1MS+defr25KCDVGJ4Rs3v+j0bxKHxUObSPEpNaH8GgdwRuIITkxfwS+Wkktw9eMNxfNPncN1QWNtTfqC8tz9nzyLnLbl0EmX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=/JqHmoPLz80npVxX5BdaxOVr/LG90bD0gRsRJ76GkO4=;
 b=GQkxKImn2mNUwHWrQrDnrtq0ZnROPYyJSI3l6c6/kQucOrfzs3raWkKKM19GC2+FFxhil19OuCm0hDQtN0OQL9Ldjv4LZ4dnSDNqoLJGhXu4HuA5vXp8yJ21rhiJ7eoo3zGmLYa6GR9hlmAD0TVZfmDAjcHC/ki5wmSv64ojL4490J/hel+DVBx0XarjRw5zDAAckk7NmdfVlEEYUkeovGUEa6Pg6JOkCt1g17hZWraP5lbuTWtyhPUBuaH4NjDLA6Xqg9afGkzsmrqsvvA9Oso7YLUs7LJzxdi/ouiWJ4hQVxRUlJqgnKD/77sg5gBEMClAdz3tl5eUgyTaea3tVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JqHmoPLz80npVxX5BdaxOVr/LG90bD0gRsRJ76GkO4=;
 b=rqvSVH5PKEvBtOXOs1m9fXdf/GfrKTMAEf0+u+rPGdPJqScgz0IwPLaqTD7H6Fs+Ej88SElWaGPVxdrOC1sy0FDOCXjSOW7jBt2gt255NI3VRLi6iMfqXOP+Vei9l9407CsNuMxS9XAspqxpdDZpNIfitFbVzMI/hrWNuAcdw5M=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 13:49:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 13:49:07 +0000
Subject: Re: [PATCH v6 0/5] block/nbd: drop connection_co
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, rkagan@virtuozzo.com
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
 <1dba982d-06aa-de41-a1a4-d12c5ce6e336@virtuozzo.com>
 <20210922131242.ghootz5i554mppfn@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d2a8bffc-9adf-01ed-c01c-30501f0316ac@virtuozzo.com>
Date: Wed, 22 Sep 2021 16:49:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210922131242.ghootz5i554mppfn@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR2P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 13:49:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ffb1b86-9f84-4cf4-e5cc-08d97dcfbf54
X-MS-TrafficTypeDiagnostic: AS8PR08MB6568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65686A5672FA921204FF7B46C1A29@AS8PR08MB6568.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: glFkCMHRnAujNpQ2BFHM6vrhokvwI02MWhkxqxeKJ6nJIrzA9RBKp4NaOIXpVNBK1+z0Fzd4tPBAMga35FzU/8+n5lJMbTTarpx6v2BeB2H/2dQn+Nf/GL8fQKQ3VxwAHz3naQQaNn6CNp4um/h/4gBjLezVrIDsTuMMXew7Oig0vP45CnopVvpfpD1uT9i4MUHSlheG2l5rxfP2XFBlqmI5GUrmN1PiHuSVk+aOqU/V4qrSw348UsZtmJjcvSa46nl5M+USuTaSV8wxaSGq0Z8Gct6xVLxVFZw5IVcvshYiOEVwD8EZv+jHcAHQwjMFLjqs6dJVynT228xrGp4Kh10V7RV3DPqr7w2MXImGzyWiJSpthMiT2s1U5s7MOfMQd2G5m3ywdn4AksEDImT7YOe6zBTfHYgMMK2RjNu9o1PGpHUlzJLLyaCvPI+94D67fnlmw2hBgT0MQu44iVNiySrS+ujSoPrfQY7nBNenklhI1B+QzDehiH15RJM9NSjjyZLFl2hzppgwFmaKloAbe8u7bpDNUtZ9WLM4Q/qGzjf9zODz7jxfls/9p/wkTLApwMHb5sxBmp9YNOu/YgtQBszRDYRbfROORHYek32Hq72HDKBLscUxoqQsyk6bCSYQbT9VLEFENLbllY+7IEh9nk30cy2FDFe/rO2HeRIr+HfTsWprJeJAQwoF6QoyAhLSjf5efDVL5a7czVKs8anwzoLeyjTNh6PgyQE1I7iNKE0fipJADV2te0ymuxxX+V/zOsWDoFLYl7TzhyzxxcYYog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(186003)(66476007)(5660300002)(86362001)(6916009)(956004)(8936002)(2906002)(8676002)(66946007)(6486002)(38350700002)(16576012)(31696002)(66556008)(31686004)(38100700002)(316002)(4744005)(83380400001)(508600001)(107886003)(26005)(52116002)(2616005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cktSOE4zU2lveG1YeENOeGM2RmhmOHB5OVVMc0kwTkJIazNtL051aXJYeGph?=
 =?utf-8?B?ME5ZZXFNbVFpV0NlN1d6b1BKdkVQMlBCam5DMlJpOFhVbTZhYkg1L0lRL1FB?=
 =?utf-8?B?bHcxSlpwTlpHZFpFejRFaHZxbC93a0FCU2dYS083ek04bU9DbVlhOGVXdHpF?=
 =?utf-8?B?Mk9ybWZueEpUb0o1TEQwRktpMEJtS24xelI5RFh3Zk96N1lKWXA2aU4yaWNM?=
 =?utf-8?B?UDFrYVlBWERSVExvTUtjcWdObnZQZ1ZWYjF5UWJvQnNEckkvcktDWmp2OVZM?=
 =?utf-8?B?ZXl3WS9IdnUxV0hkNTdsQUoyQmlqemVQVkpGNHZlVUdQK1VsdHV0Zm4yTEto?=
 =?utf-8?B?TENadGx1ZFNuN3hMaUZpSFRoMmp2cThJRGZneE90cG93eXdmS1BwMkZaT0Fl?=
 =?utf-8?B?RkVidmZUNlREaHJNK0YzOEJhTWNZeXM0cTB1ZjBycFNrQ0RyejhSV0JVMWlm?=
 =?utf-8?B?M0pTRFZFUmQrQ1A5aWhCV3lmS3M3Z3MwOEJwUEFYS08zNVF0R21OQlV1Mjcw?=
 =?utf-8?B?ZE9aN1lSZzMrSWNaYnBrTXpuYXZVK3lnNmIyMVdXbEZTSjJqekRqVk5UK0RX?=
 =?utf-8?B?QnlVTDQ5NTIraGJTUE9qelNsWHpBZG9jbjJ1a1JLTEp3TlA1ZDdmdVBhSG1U?=
 =?utf-8?B?emU4VlFLOEw0UzFnVC9NeWpVUDA3eVVhdWk1NVJMOFMvdTUwVUNCY0ZFTlFD?=
 =?utf-8?B?UVlkS3NmVzBYTEtJaXNGS0Q5V0FseE1rWjBBR1RaU05oNkNlbFBWMEg5VUYr?=
 =?utf-8?B?bW9zemlwTXlrVjl1RmJqUVZlK25NZk5JNkhUUitKS2RtQ1VNbFJRUVUrL3I5?=
 =?utf-8?B?ZDlUd2ZTN1dFSTRUME1ybXRzMmhzZkJ0SGRQMWp2U2cxWWUyTkg3QnNwbFBX?=
 =?utf-8?B?SUFOK3gyNG5CRkk3bkVxMUt3R3dqczk2OEJKbXd1S3dlU2JNOFZvcUhoZHd1?=
 =?utf-8?B?eVZRUEdac3ZPcU1DY1hTQWMxNG1oTzJ2TkJPVUFlN0hEdklBSlA3OGRrYXF0?=
 =?utf-8?B?R05HY1Z4VG53WVg0ZXRZdWNneTRvNTVGWGhGUDhFRzhPNE5NSUtEMHA5ak5r?=
 =?utf-8?B?dzh2anlmY0doWGpzNFVqODRDMmRHeTY5TGpLT2tSMnZYUVNxL3hCTHRJb3c5?=
 =?utf-8?B?U1VtTUNVcVc2aEFoUHV6QmVTTGJDams5YUhiWm1zRXdEZnJQUUFZN01WcU9B?=
 =?utf-8?B?WnV0Z09BZ1YwU1NzS1dPdW5SQlpQSlozYTdnOHJQa0FDeFNCWFdtTzFIUVVm?=
 =?utf-8?B?ZEp3MU9nd3lGSXZvZUFQdGRTTDdPaWlpNXdMZjhYRktBNHcxV2NzUnEydzhs?=
 =?utf-8?B?TTd4ZUJSUktYTUZ5dCtwbkZqdkdBUzAvRDAyalBlRVRJd3ZhcDk0R1l0SW5j?=
 =?utf-8?B?RHFwNEZEeVRKYVVRMUVIS0tzWVpRTzJMTytoMlpKaW9Zd3ltbzlnR1hyc05n?=
 =?utf-8?B?dkh4ZGxlNkNRZEd1b1NVOENpVTliVlBIaGh6ZWl1OVZXSTA4UkNrRVh4YlVQ?=
 =?utf-8?B?UlF3ZnFZcnFmcmpLcU02UEplZTNJZStHQmg3TzJyZDRmU2VoUWwwdjJnWWF4?=
 =?utf-8?B?UFNYc1pDODd2QVNTY0NLWXdyZTRmSVhmZXJTb0Vaa0pBRzBCOG52TEIrWXhl?=
 =?utf-8?B?V2hWanlLUHF2SmZYT2dKZmRRV2hyak9FdkpyYmVKbTZ5S1dWd2FINElRcmRs?=
 =?utf-8?B?NTBhZlEyWE9Na09xcWwvQW1IVVRtTkJQR2xWSmVzQ0pibG1nMzNvMnZ0ZUww?=
 =?utf-8?Q?y1ozBXlsXMoXhO71EJ78/yTvBIiJo/7fgdxOGPK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffb1b86-9f84-4cf4-e5cc-08d97dcfbf54
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:49:07.2933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKzRQHkV6jYn6Y8LpzKxkqYRxr9ISq1/GVY9RPpNEcFpZXNx1g9zYZlxsngc2sdLvlc8UONjGZrb7dtK/s8xmdkRM2cwXbWGJOFaKjr4NRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Received-SPF: pass client-ip=40.107.3.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

22.09.2021 16:12, Eric Blake wrote:
> On Wed, Sep 22, 2021 at 10:48:58AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> ping)
>>
>> Only one patch is not reviewed. But the biggest one :(
> 
> Yeah, and it's on my list for this week.  I'm overdue for a pull
> request, so I want to get this series in if at all possible, which
> means I'll get on that (large) review soon.  Meanwhile, the ping is
> appreciated!
> 

Thanks!

-- 
Best regards,
Vladimir

