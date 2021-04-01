Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7943516A8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 18:16:37 +0200 (CEST)
Received: from localhost ([::1]:51534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzzo-00005y-GN
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 12:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRzy4-0007z3-QY; Thu, 01 Apr 2021 12:14:50 -0400
Received: from mail-vi1eur05on2122.outbound.protection.outlook.com
 ([40.107.21.122]:34145 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRzy1-0002xJ-Fn; Thu, 01 Apr 2021 12:14:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoTT123uKd29sSNOXw2DFxO/2xBn2BZFvOdivzbhSyILGL3BWwGeE3H66cRfHawA9Udv1j/VJ7MotBunRC3Cs8hFGFwEemj9WM17sHGaWS5wTUs5pJjEKBO/E1lXf5f+jCHP5KIqY1SIVHmy3NK9tcGpIZpZhEsRtW/xSxEl541l0L8d/9jRW7sklMj9oQg1o1Eg73mfEgC7e5Uwn/3tshJ2KPSbgECdWGixD/z8Pf6WsV8brIVUYpguJ9fJa/GcLjyvWD/2+LyMNAZVhBDXd6L4olf4N05njsroaUKWwcyxldja60W6IRvlxmQriLZ3W/Mv4XJ+9jnzBgG1rDTEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QryjGtkeXn/i9FFKZd4S4cQZN8NPPTeHzazbWAogpGk=;
 b=GhnC3v1aSqpSLLNqb0ZEKOU6rXCDCNxv10jm2WtDpxMy5TigSlVRa18Hr3hk5UIXy6bs0/zFWInicGZxd3mkccwDb5dOpWD9p2X9g23HXUM60F3fqs2MI2OYU6CuPSIxgOJsdZRyW5JF3+3RbdKk81+EAA0UxceftZhMDypJiwd27oeDrOYdO987jawikFXXo0okjKr7u/JFg5gxBu5mryLS5t2KsuaPfdR6fx7jW+EQ1aOQTr2TtVzX/qn915O4KP2fK7VcgHwjkrNI4g/IfZPeeFh6e1FkeHbQJNqRn3zn2+OFdljd8+AKkaynBThKNWgVXCGBUlSRWnRNZdfHXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QryjGtkeXn/i9FFKZd4S4cQZN8NPPTeHzazbWAogpGk=;
 b=j1b08LWh3N0PQcr6/lV/41udjn1BgGgsj6C+PQecmeNL6VA77nusEy1xbY7TD9TBCB+Un8n15kW08U6FQ8cO5AZVktGAvgP29hNfRu3iMN0drAMglNj3Uuz4bXa9OfLiqpwoHHrDRO20pC3a2pF+1D9fAPjzuQANhpWO8nUifmk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 1 Apr
 2021 16:14:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 16:14:40 +0000
Subject: Re: [PATCH] iotests/qsd-jobs: Filter events in the first test
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210401132839.139939-1-mreitz@redhat.com>
 <c0f53da1-bae5-d853-1cd3-355fd296d23f@virtuozzo.com>
 <816e08d6-25ae-c84c-6d42-91f3a3a48fcd@virtuozzo.com>
 <ec33e0a9-49cd-04e2-7afc-0cbdfc82d798@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <328800c8-9d84-5e85-ab59-ea7832a16075@virtuozzo.com>
Date: Thu, 1 Apr 2021 19:14:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <ec33e0a9-49cd-04e2-7afc-0cbdfc82d798@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.200]
X-ClientProxiedBy: AM0PR08CA0012.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.200) by
 AM0PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:208:d2::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Thu, 1 Apr 2021 16:14:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ce546cc-efc3-47ca-eba6-08d8f52940f5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6008:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6008ABFC0CFC3037C870B0B3C17B9@AS8PR08MB6008.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJoRrjZRXcXPCT8Twbzg5A+1ocmDaam67ilc0VeB4HdyxD6MCzCTQjQTvuRHiQ0tZKSsAuwCPljwNNqziN1gZsFquuqs4UTlpFhPgcrRA1W+bv+QLVGuOvN3riGxxb8e7nCcY3nY7Pql1tKVtzgJf9sZ+5XhyaHq8IZh67hhLx643xTBxK8NcAbXo7rrOVam6zJIo9Q4SCTYZJlao1ETn/NFSwLfzXyWFZOqcBBaeZFSE/t2ujIVjqqxo+gJVckeBK8V7mpYjsWy6AaLirtt94u10ttdWif1kQool1u3d8yUfvMDoq5XzaPc17gBQEq773xe/YyW9Xszsvz1X9phDIK7M+D2efatjI8PsHLHGsqlSdQRk6oaQqBI/A/kwlvd/iaCGX55C8u5RksZuK9j4m0yS8nDeotdKETXFdtInWMkhlgBJqmOsVNFlUp0qYwyrTNzrCk14U97LRmE/7+a3kXMO3ht23kH792h8sU6+zzI2Lkoliuh/sung1BAbF7//5Lteg2uOMomllnjiZwiskPmJ/rV9H/k26Ia1tZCPA8Lt5W9Mn8WNX8ks6VpwgjzBahV/DWQXiv5hAOd5VXGIYr81LareeetiA0hvBh1+G6W6icRmto3QYo76dkbW4tG5e8OhsGW+KqPikQ3ciowj5qUHwWGQ8BSxbAKS8WhNWQbnUzrhePtAVF9ZRB2ELBUwfUUabqDP7Qer+e9qBFPEQqLPI71sMe2BwxoW7r517CbqhHIJz3EGW08U7iNpvN+tujbvBffNikQG6tXVtgZN/rfho4JKWUcNpPLyyBCFYq4IamSWjT6awIn3SinZ+Fv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(4326008)(16576012)(54906003)(186003)(31686004)(53546011)(26005)(52116002)(498600001)(66556008)(66476007)(16526019)(956004)(6486002)(8676002)(66946007)(966005)(5660300002)(36756003)(2616005)(31696002)(86362001)(38100700001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L1NIbklKemVQM3c0NGNMUUFzc1R6NTJpM1Y0bDU4YzRYVHVoY2FlUTliQ3ds?=
 =?utf-8?B?bENid0VsUGN3blQyaFNpTnJjQ0xnS0V1MXYyejQwZTJtRzFYaFFpTllSRFdh?=
 =?utf-8?B?Q2NnbXRZZzIreFpXVTdoT0dNQjRMS29TZjVrUHZvYlpWdmQrR0NGYVJKU0Rt?=
 =?utf-8?B?VFlmTGl2QWlncU5uSlFRbng5OVhpQTQ0bW9hdlZ1OGNZZFlGU3VVaHVKb3l6?=
 =?utf-8?B?dHFjVnNXRDNNeUV0T1hEQzRaZlJNd3JQbkhEdE9jcG1IbzdtK2t4V1NEWXNB?=
 =?utf-8?B?dE16WmorSnJMeEpqNk14RTVqVmU5MW5VZ2x2QW9CV2FNOSsxWlFBdEJDOE9n?=
 =?utf-8?B?Q3JMTkV4QXpuN2xIV2N5N2YzazkzcjZtUGp3RHFrK05mb0hiWlNSZ01ienlu?=
 =?utf-8?B?Z2xNV1lUdVZINmhrN3ZyLzczNFpBbU9oNUs2N29vQzhnKzBsUXBwOFVJN2ph?=
 =?utf-8?B?K2J4MzRXQjJZWlIvZUVTQURYQTFTS21EU3dweVVwOG5sUHJxMTdDYWJKZ2I3?=
 =?utf-8?B?MkMxMWErVFpsOHdhb2RnekRUYTA1T3hLY0h2bUpDaC9GOXBwK0lCa0VqdlRV?=
 =?utf-8?B?Sk9WbElzUWU0dWdsN1N0RjduN0o0akpuVGFzZUZqZnl1MmVGWHdzQStZaHoz?=
 =?utf-8?B?SjJkNzdCNHJUZXNIZitqV1dZQ2tGVHFmaHlFc0N0NlNvUlRTdVhHaFZUOGJL?=
 =?utf-8?B?cWlOeXU5ZGhhV3B4djNkK1hCa3ZYOGxqZ1hwdDZCdmE3RUF2ZS8rOUlBMlJT?=
 =?utf-8?B?RjhOT0tvZG4rbU9tVFhxQVRxdWdYR1grdlJUVG90b21QMWlNeVp6UnNiSUJW?=
 =?utf-8?B?ZUFoQmJQSmZOd214T1BuTG51UDdGa1VBUmhSSTRiT0cvd2IvV0xMUjBKaTlv?=
 =?utf-8?B?NkVYb3JTc0xwNWY5VE5ib2F0aFVGZk5LNnByM0hBT2hBVmVYUE9pQU4vWWJ1?=
 =?utf-8?B?VlBZdHBTblc2L2ZBdEErK0NGczRYci9NRUh4ZHVNK1o5dU1zbGkrRVg0T2Fw?=
 =?utf-8?B?WUdTejd1MXUrZHZVOHFhNnRjaHNsYm9ZV1ZHZld1aUs1Q3NqUERYTU1lU3pz?=
 =?utf-8?B?aVZNNUtjbkR6REZlZW5uQVppQnVDUVFEeE1WbmppbGQ0ZDR4VzFldituL2Zi?=
 =?utf-8?B?UE1ObzVNZGhBbHlPS2NiZ2wrZUxOaFZBQW0rTXhRaEhSZ3UwdHhzRndDU3ky?=
 =?utf-8?B?d1pOOS9KSHFRREdXSHJGZHhKa3ArZzA2bk1xcDR5V0ZOWUVzSmlNdGE3MHlT?=
 =?utf-8?B?VzUwOTZDMUd5OTJ3a3hQcWVJRDdUenc1a1ljMDUwc2NpdE5ibWxBQ2NZMXAx?=
 =?utf-8?B?U3ExVUtZNHR4bmhKZEFNd05uYzVWS3RQa3R0S090cnJpU1lLejA4U2dzYjhU?=
 =?utf-8?B?M2ExN3czV2FJclNPMktEUVlRL0p6ZHpvdGNUT0VDd3NFVjlraWtvaEQwWGpT?=
 =?utf-8?B?Q3d6ODBDWG5tLzF4QWdqS3dlbEtLa2x4SThnNE5TTkJwTjBnbE9lS3BYZUs3?=
 =?utf-8?B?TzBjdjRKTkEwUFBhQ2psZ1U3ajh6NmdNUThBcTdUbFdDWHhSWmRNOENMVjU5?=
 =?utf-8?B?ZU03Wlp2U2RNYW5OUWN0Y250T2UxbEswZHYwcC9vNHNRU0ZheXNZUHdjNzJ1?=
 =?utf-8?B?RmxDZVVscWFCNkR4SDJITnp1SWRBcnhQblZzdU54cjJ1SnM2aWxvZEloZFNw?=
 =?utf-8?B?M1czSHJnbUxaMUc0QkFDdGxXN054Z1pacXF6NmVodzdDbk5jSmNXK1NpUjlv?=
 =?utf-8?Q?2TkLEXu3d5EDxWBm6HHvGPA4vJRo00iBbx7wgU/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce546cc-efc3-47ca-eba6-08d8f52940f5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 16:14:40.6382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S06E/tuZ/3GmgZE6e0KiyIK+BlT1OxlVi/HkhajxDHFw+WueY76OxkhiDfrXwFoYKxMuYAxBaCMGeMIpRnFaJ7lhgJwiGy3Z4UK7nc43zYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Received-SPF: pass client-ip=40.107.21.122;
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

01.04.2021 18:30, Max Reitz wrote:
> On 01.04.21 16:37, Vladimir Sementsov-Ogievskiy wrote:
>> 01.04.2021 17:37, Vladimir Sementsov-Ogievskiy wrote:
>>> 01.04.2021 16:28, Max Reitz wrote:
>>>> The job may or may not be ready before the 'quit' is issued.  Whether it
>>>> is is irrelevant; for the purpose of the test, it only needs to still be
>>>> there.  Filter the job status change and READY events from the output so
>>>> it becomes reliable.
>>>>
>>>> Reported-by: Peter Maydell<peter.maydell@linaro.org>
>>>> Suggested-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>>>> Signed-off-by: Max Reitz<mreitz@redhat.com>
>>>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>>>
>>
>> Hmm, in your mail (and in copypasted by r-b) there is no space between name and "<"..
> 
> Are you sure?  I can see the spaces in my original mail, and on
> https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg00182.html
> 
> But OTOH I don’t see a space between your name and the < in your R-b...
> 
> Max
> 

Ah yes. It's someone (possibly my thunderbird) eats spaces. I see them in you original mail, but not in quote in my first answer

-- 
Best regards,
Vladimir

