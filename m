Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55195A46F0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:15:37 +0200 (CEST)
Received: from localhost ([::1]:52870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbno-000498-0f
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oSbiS-000700-T0; Mon, 29 Aug 2022 06:10:00 -0400
Received: from mail-eopbgr70093.outbound.protection.outlook.com
 ([40.107.7.93]:44196 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oSbiQ-0005Iv-QF; Mon, 29 Aug 2022 06:10:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ID0VE3FW1PjELec5ZlUS5vpdzu/7+8rH0GTBD34DzRqf3eMSrAzsRyzhUAXdRbyF5hPAVmCx98ormf7UxRi+5lS+8zBiTlj9WqIin+dJHA2nrVlZpp049UvThRS0LctQ7FQEQI0urpK46woc6KKDRWGlR7Nwd1tUvErYlpLKk2nkkEkJETwBTtCEeT43SSFDjMmjyezo2E6G7t6RHnf54i+weltaT6XJMti99Q7I1hWVjanIXTBnzwEdI4/DNzL8j6erkYiVgraFERy4cdNM/6Gsajj2QoT0DHPJmCpOByhurmpAGzwJ5yzbEnIS52DSn8N/mQoPi97QshEF3CWeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnwrKXoz1BXMAfS04hpXoeYZDK9Ytk3dPb1sESUAxiw=;
 b=hzwVnaP8HpcuEYtmAjgwSXHHwuAq8eZGjLU4B/MX9ri6fhWwAfALrPiCcQw3GEKu8ZUnLkpVMuF4jUtkAY29gJK1i04SIG/I/XEVjv1/5TkFhcchGtWixz4UWr1l4a/maJ5vjBTh7oyZssj7P6JM1tD0ege94LaU1Dsr6CWCEGdXtWHo4GNTKtJVsRvIsF8OHEtGwbEOVhW09waFiFT6WSosWff7FCDd2h2WnNcPieGD6W1K/SBglMHAEjCSXEnrLDtuG6sYrBBMBTkerad8TTREGK2xVF/nQpTAEJQeH0Ijfg+CtPB1ZLKqCu4+kgI0CxPawvzzAlHWDYnZ4Cjyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnwrKXoz1BXMAfS04hpXoeYZDK9Ytk3dPb1sESUAxiw=;
 b=C6is/e0DWLbcdDkK4gIaED4kpjdTgF1oxuMnLfd/o0A9ETt8+E1zAcKBKbZtdl/XySjn1PqwzQR8X33SPZt3UTQLpgA6v5izqbGMFNw1fkNw/0yjVkV4e5rknGWN3No7OiV+MSN3i4AP9BoaI7lXqg6D/pQ+VhDJ8lRVUcTesvjYOP6PnwZZQDjYBc371W2jbjZJ0Im5c32s3Dh2kn4rKJy+Il/bjpSKofVYGn3oyoPTK3MnFbziqoGhThdnbEyAMVx1so/3m5/00Jv3PutkDvUJrLDmwg+npKK/WOc1GnDvP6feNtd7hYVk5GIdzdYSyOkVO1cb/rZne7nH0JZjyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS1PR08MB7514.eurprd08.prod.outlook.com (2603:10a6:20b:481::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 10:09:52 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:09:52 +0000
Message-ID: <d63b6365-9e55-3ff6-e3d6-ecc1706a9e47@virtuozzo.com>
Date: Mon, 29 Aug 2022 12:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for 7.2] minor fixups in block code
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220817083736.40981-1-den@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220817083736.40981-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0802CA0017.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::27) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c111f8b-5765-42b7-b4d6-08da89a69d6e
X-MS-TrafficTypeDiagnostic: AS1PR08MB7514:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yvGL/eDUDGFmsnT7zoiWdBDeldunKtS99hfD7OgABEGoHWm560poa+3JmKXLGImJa0zh4Y9DMf4lYvGfJkK7yVCh0IXLL2o4JgUcbnCTah4UnAfHJMd8ePRCQIQW76ao2kn0kkX357lZ55uFpkD+L9fks76R7rROj7rbmmd7fR6XhuZiTBwbwerMcbeDsb4q1wWMAVjvjICeNQ4fTSValNKy4W0SoG5hBas5FnZ5R5sArRy3PhB1GPoRsmcigK9HJ6Gu/stpA4FmOHSwdIgzhBI57ZPDVmqPg1NASYw5oyyRmV0TcUkeKiVNOrwYhQ1Ukc4lnvZ5EG/YToI1BTLT0WZd9NHjVcBc+kQfYDPsICN2U6imOsyBpc7pnK/rGEjvVxK3ABuDXEn6MEd4nEKJT+GLNR9MV7kScHmTIFuFbuQYEZNJvM464qntYe/cLMxM3/YxQFh/fyc+lEB09WfJP536ue/oMJBlXPvx+dsvVN0uNQY3UneVYFLRW6zKXxhqa1hPc2/YVho4r2j6ChGWTefQ/equSnwTEJE4IufAUUcbvVkq7cM1+91wkYsA/mHvxrO2N9Wsr0DWq3dJsUl/ZPMD5/UZf93ZYPVyhIV2vysbwQW+udAFlrSc/OBJXREhdPC9b+ZBhfkSG7PhZgwg9z0wK3nkoyi03YcSH5CSvfKqGGHEdEsvkw3Jb60zcHlgOmh5tFluL9OPhTPzCc+phmJugxCqQ7PxNGVcKpxPcw83Cb8q9snKu+KaQg5SWadnBP+hzdCE7DHjOQITShys+yeymIDXwHF4paW+q4WfusZjoISlH2fu4zBB9Rdg7Jn/vkx3pylZdj/PQD+zIrx3nxDTy9QSYBeJgpPEn8tQ7dquWVQ23i6OuQl0zXmbe8pJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39850400004)(396003)(376002)(136003)(346002)(66476007)(54906003)(66946007)(8936002)(8676002)(66556008)(5660300002)(4326008)(2616005)(4744005)(7416002)(316002)(31686004)(36756003)(2906002)(31696002)(478600001)(41300700001)(6506007)(6486002)(26005)(86362001)(53546011)(6512007)(52116002)(38350700002)(186003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmFNRlVjYnZIQ3hwZjhYODJpbUVCM2tudEJEVUtZbkhyNUZNRHFSTGdvazJp?=
 =?utf-8?B?TVpQTGpRRUJ1WkVDTkFEMjloM1h6ai9sMTFkckppVkhOTmJmTE5wWko5REdX?=
 =?utf-8?B?Zm5TWGNNY3dnQ0RpU3FaMGdzd2tSK3RlV25hVW54UGtDWm9Ga2NKNGMyejVG?=
 =?utf-8?B?cUFDMEpBajVjTjNyVWNXazdKTzdiQnBBT0dsRjhqNjJ5OWs1RWxyNUJ5WTJN?=
 =?utf-8?B?UUZkdDAyeW0yZngyQkU5SjNydjFaTmQ4K0RkOUIxSkFIdjEvRm03NDErU2ZS?=
 =?utf-8?B?Ym03VjZJc3psblEvZUVISHc0NzEycUh4TWVEUU93L3FuTHVUdWY5SVAzMGpG?=
 =?utf-8?B?T3pVTFlUQjJvMjYyemRqSVhMelZxRUt0aWhSMk0xUVhzUzZNb2FybzBFZTdF?=
 =?utf-8?B?MmtPb1hOMEl6L2ppNnFPd2lMb1VrakpLMWlmU3Z1cG04MDBHRnlaanNnNXFk?=
 =?utf-8?B?emlRZytmY2lKaktwdExUb2FaSFphd2FML1J4d09admNQQkY3SDFnKzR0QWlv?=
 =?utf-8?B?NTh5OUhCWEkrYTJkWDBtajdsYlh5aFg5RTYwd2xDMGNmZUVyenoxUWRUM2lO?=
 =?utf-8?B?QTA5WE9yQ1pTdVROcVI4ZEFwOERyc2R4cCtCbVRwY09PTDI3WDUvbmcwdDY3?=
 =?utf-8?B?eCsyS2xBMnBBYUNtS1FiK3M5dEhaUjZxeVRRZHk5MysrazRaeE16SGFRS2Jm?=
 =?utf-8?B?dFdDekhCYkI2Nis4M0I1aTJTd3Z3Zml5RXN1eEt5MDZPU3VPZitJM1JORjBD?=
 =?utf-8?B?eHlsWXBnS0EyVWM1TjZPZjdySkFJa1JrZCs4dXVjYmNrVWZva2RFd0FxT1VY?=
 =?utf-8?B?RnFTTGEvNmVSWTZTb2tnL01qWUdQaDgzdmpGeEdRTUNDZjdHeXkrT0p0V2hm?=
 =?utf-8?B?MWRTMnNEaUcrT2ltdHpLL0dSYUVhc3U5RzkyZ0VqMkNyUHVHTjNGeW94VWsy?=
 =?utf-8?B?dnQ0dzBSUSsvN0hEZ0daRmRHMW1ONVExem5IeG90TFdBbFVQQzVpWFVtekdO?=
 =?utf-8?B?MHBKTFZ6a3FtT1JRMlRERFVzTzBTeFJmaUZqWENVbzN6N1dUSWJyMWkwL0k2?=
 =?utf-8?B?cEIvUTVTNW90QmJueHpxZ2J1VUlBWlhRQ0lDVjVuN0pxakJpaGJzOW9tV2lF?=
 =?utf-8?B?cWNwWktPNmpXZGpYblJLT1BaWlVHdnlmSHRsbE9wTnRBZ3BsMHRCZENyQjAw?=
 =?utf-8?B?d1hHOHVyR3hBcGFGaldidGFHcTdmZlQ2TmY5WFhCdzgvNnM5VWxmUGJ0bmYw?=
 =?utf-8?B?M3RHOUV4NS93cTUxWnVKUWdpdWtSYjY5a09uSWE1VzAzdHA3VFZsY0dEOU9I?=
 =?utf-8?B?bklxRHlsdXFHOG1VeFRhSlpSWjRMS0pTTGRHcHNVR2VlbkRGaTV6NWNKSnFC?=
 =?utf-8?B?cWcySlpEbit0Z29TSVJ1L1BSOGlNWmRWaW1CVEVwRGhBcEJUK2d0dEppejRM?=
 =?utf-8?B?Q1JqZHk5SEVMTDhHbGNXeWdId05rYlZlaHVSYjF5MDJyMFBRZ2xGTVV6aGk4?=
 =?utf-8?B?L2dhVTZJdzk5RUIwYjU1dnkyWWFoSmZjUDEyNFFZUzVlUW5MbnNRd2hNak5M?=
 =?utf-8?B?TUFnN0k1WTh3akF1alg3djBLS09sYkt3WGdHSUhLcnBkMk5LVkxoU3lXcGhk?=
 =?utf-8?B?dEMyWXZnTjdmYmJDYVZXakpqS2pyWnh0aXZsUHA2Wk5VWjdSMFN1dmZLcnBV?=
 =?utf-8?B?ajZEWGM2L1ZFU09JOXBubldHclRBLzAvWU9ONzlFTmFlZmtWcjVFTmo5YTBP?=
 =?utf-8?B?cTQxQmcxKzA5UXVxME91TFQwQ2drWlc1R0R3UnJNUnV2aHV1SlVUZExiWjA0?=
 =?utf-8?B?dTJUN3VCYlRoQXVtVHNlS1hlQ1VlZlJEYTE4RFp1cjcvU29NNGNrRUx3emZL?=
 =?utf-8?B?MWF0QnU3cFlDUUhXZUtMRVJWNHU2UExMQnh5Mm4yU25kZFdxOWx1VFB6OGJG?=
 =?utf-8?B?ajkxTXVkeklHWW1Qd3JiUlNQUGEvZDhWOFlYOUdSSExUQjMxZXgzTWdONWJO?=
 =?utf-8?B?ZHpSc2Q5dXZaWHp0akdmSHh0UVk4VjkxVi9VL2k0MFd0ZXhFMUxWSEp1emts?=
 =?utf-8?B?RTJVb0RzL1p0Wmg1WHBSMGtoemZucXBqMDZlbVZqa0ZESzlxSFFSTXljTllT?=
 =?utf-8?Q?c4y6jjw+I5VNr9G1VXrPwS3IH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c111f8b-5765-42b7-b4d6-08da89a69d6e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:09:52.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8iJXxkMUu6/3+NgePyBFu4P4oLn8QNTr2lI5mBS/FIL4CQeHdCmMpzMcJVnoXXnl2OW3aGbG9YeUf8D+qeMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7514
Received-SPF: pass client-ip=40.107.7.93; envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17.08.2022 10:37, Denis V. Lunev wrote:
> These 2 patches are just minor improvements to make code a bit better.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> CC: Peter Lieven <pl@kamp.de>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>
ping

