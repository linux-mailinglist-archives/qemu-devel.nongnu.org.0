Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF52F5F4E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 11:54:43 +0100 (CET)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00H4-0004Up-VQ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 05:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l00G0-0003h5-6R; Thu, 14 Jan 2021 05:53:36 -0500
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:45031 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l00Fv-0007hx-L9; Thu, 14 Jan 2021 05:53:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5iiALd3zAaH6dRT4Om+EPnxRWL6NaxJNWryjZ3AjG5sX4QBmD4b+K7zQ18oPsnqmfi8VD10NBy813isRFV2/7jYr+2hIqJdHdaRzR9hL4MnFng3NztVhwtYvOdkrF8dKfdS9EgHhpdKMfQhifXqUsykQ6PNDFc0ANQD5vd1Vb+E0M0WlK9BXaf+Gj+NR82Lkk8tQz/H3PTkKgXyTTWvRp4T0J4v7EhNAi6g+irJyNcOgSLeb73pX8cNRhdqCDNu+2UVQVBK7ZsKJ9rE/rOzgzWvkfyC8WSC7V9xg0M9Z+r4qQ5kcuUWBTYQ2H90ARKpT2dSdTsdZO4rZGIIjzM3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz24I+v8zu8tGvedoFSddDYiFUfEivcKvPTOcFOWkaM=;
 b=VPKjX8eFDsRZ957HR4lf/+kq5Y4jxoz6AlN60BlLD/g0Dxs9ySzTCkAd5sM76dI0zqxaw9GTy4ydJcYQqRrIfbiDvYiYzxOf7ccfHpRUdGD+CSwntWBkUgjNuKIXvt6+NU3bUVAyE+rsh4EZyeZ5tYToGMdPO7/Io9PUPDPbgfjBi+vx55UeLtp9w7uFaHsEL/F1HHQRVd32kQ2YxoEmeYMcaSJDipSWcpvSlehZ0obZKgCxPGyu4StCZ9fp9xSPQPxbB6l1kh4FvvxB/AQAEbbwfHxoOKAYiHH5JA2NNbG0RCzVhsSUA7Mo1BvRzcnrUq/MrPgly//oO7AvfMQKCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz24I+v8zu8tGvedoFSddDYiFUfEivcKvPTOcFOWkaM=;
 b=S72uuQaEZR14tfojnL3geCX3QekovVOQzDjhcA8ZS6jNpM5fSEbBB/W9geyFLHJjq0D1JKXwh5fxLBxUTecG0YXRVE/ZWFuXHUWSLMF11PoH9qLkdj1vMAUgZXaQ9ZeBJOETb8AtErQ3bLp27lEi4cWuQXYl/32gYqqqKM5qd/Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1971.eurprd08.prod.outlook.com (2603:10a6:203:45::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 10:53:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 10:53:17 +0000
Subject: Re: [PATCH v2 1/8] iotests/297: Allow checking all Python test files
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-2-mreitz@redhat.com>
 <285b6f74-da97-4b4b-70a8-ec09a8c467bb@virtuozzo.com>
 <2bb555bc-dfa5-076a-a3c3-b4bb5d1330f0@virtuozzo.com>
 <0cf74b1c-c342-7e9d-ad80-cc2743a9763e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <eb42bf8f-e026-1fc1-7afb-5148eaa4007d@virtuozzo.com>
Date: Thu, 14 Jan 2021 13:53:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <0cf74b1c-c342-7e9d-ad80-cc2743a9763e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0P190CA0027.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::37) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0P190CA0027.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 10:53:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b806a960-5734-41b8-0ac2-08d8b87a99dd
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1971:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB197127057182A80451DE45C1C1A80@AM5PR0801MB1971.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fn7CJ9RMm/pfbYjFPyZqqyM0x5BG0XKNGz/Zlj60vLZ4sAgDUbjS0ZtrSlPkPhUzMTIFj8lJTmBc5qRnJtU96X+jBJeNEsphXcFyrN6gKiizyYWI2LZEywGmL8ZfXkb45sdkRtll42dBSyZ269KUvviIxNAYfCz1pn6bG2pEj04z8rq/nSZK8DWM95D5oQTfsxw9lNZaZ/PQnk4xYqtPI6J/6aO0K1ozyislMooiMYCdz5l7gMnKHK4TccaUWhwgjEUUkvS6Z5HSjr3SnoTRKiLEXZBKNCiA0KjEeD1RRrCQw+LpGtEUU5BTf1k19x7FEsqTbLi97oaKubz7b9fLbmyBwSXRNmTTlG57Z8Nvgrug5FBbKhW9Y34FNOF1tbJu0PJblFboEjENU//RiDXI4bptbP4PtcbOlBl2nPLJbRZThY93/OohpXRctmXLTPvAyyPlQG5Zd/AeYoqfcR5lHccZKmqFuVhZT/PsOOOoQzM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39840400004)(16526019)(52116002)(36756003)(31686004)(31696002)(5660300002)(86362001)(6486002)(186003)(2906002)(53546011)(478600001)(26005)(8676002)(66556008)(4326008)(54906003)(316002)(8936002)(2616005)(66946007)(66476007)(956004)(83380400001)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cG9SOUt0b1Jnak4wV2k4NHJVL3lUVDZIUXlwQytLV3M2SEJ3ajRmMWhuL0ow?=
 =?utf-8?B?cjZYWjhjNDlES0xkTzRYZVc5VmE4emk1c1lMYnRlZDRtdTFjZlJjNDlTT0dC?=
 =?utf-8?B?eXoveUlkeVdXQ2VOUFNIKzFMSlNmREZHa2N1VUFPSktDakhiNVBIbkhZKzZM?=
 =?utf-8?B?RDREckJLZDgvMUx1bXdOaU5vRWN5VGNCODNWbDY3cHNuUHhZdlorRFBMVGZF?=
 =?utf-8?B?RVMyQTNHa3MwVWF4alpYVFFWTlJzOUlqYWpYYUtabmdNRjI5Mjd2ZjBEQ2dK?=
 =?utf-8?B?aTBWUk9rQVdVeDh3ZWJXci82dEY4cEw2UWpEbHcxNmRicXpiNnFBMkU4L0VR?=
 =?utf-8?B?VzhxaFB0T2VPdkFPWklkS1Jwbkc0UEQyUFRFZXRLaHV2emhGQU5IdXBoZWE5?=
 =?utf-8?B?VVExNXBocjEvUGs0YmVyZDFvZlozbzBrckZ3RUxrS2NVVnl1V21raHJva0NY?=
 =?utf-8?B?Z1JKVUVXdFR5andTRldxTWZGYUtUMElEOUFUODZ5VXlPZ09NbFZkd0Nscmd5?=
 =?utf-8?B?cGw4YnlYUXV0ZEtkb3c4R0JPYVZFS2hhTGRIK2tBWC9YcUYxOERrU09mM24x?=
 =?utf-8?B?b2xwS25WK1RjTGl3UWkwUU1IWTM3eWdOMlZtYU1rWXNlY3hUcTRkSTJPWUJ1?=
 =?utf-8?B?Z0RnZ3RzMURuTGxHWnNWODUwczlBSlhZYW9MUHk3ZHI3ZnpYSk9ybGkzb1pQ?=
 =?utf-8?B?S2xSQjNEelVVRCsrYks2a1hoQW84VFF0bUxUVjFhUTVIMENDckZnUVowdUhN?=
 =?utf-8?B?VUpQcllENENBbWpSa1QrNm93citCQitNNVIyMlNNbyt1N0hObXNtWGR1YjNJ?=
 =?utf-8?B?dnUxd3U0L2hMelFoRXI4UnR4dDNyRk52UGpZdytTS21YcGM4MG00M3BTUzh1?=
 =?utf-8?B?WUdyUThvOWVpTkRTTEFaMUZMZCtYYUpua2tRSzRuZ2l0OGtNSFNkZ0diekVD?=
 =?utf-8?B?QS9iWHAxTWRSVnRubkljZ2hRNkxwRzdxbFNUSzNvR3EwWUJJSE1yUDREdUlM?=
 =?utf-8?B?RktHS0VKM0NHS2MreXdHNy8wTFN2dUVERndVbDJFTUZhUlRuTkZsZ2VRTFo5?=
 =?utf-8?B?NklRMWZGRlhHMHdDa2tuRVVYY2cvVitSS1A2d1ZPZ3drTS9qNDZLMzMvS2xn?=
 =?utf-8?B?QUZNaUw4UkJHM2xMeGxHUGMvQXRJSWxkL0U2M2JDUXdjZUdvUFFPTjYwRVQ1?=
 =?utf-8?B?Kzh6WGdJN0tPTG5pZUY2TExuVlpFa3ZsVWFxUUxReUxlczFJQ0RDYUpVSSs2?=
 =?utf-8?B?V04zdFE1NXJiUExEWlZNNTIyeW1PRUlkdzV0dVBsQ05KdlNXeFBvSmJIblpw?=
 =?utf-8?Q?TKnXYNGnGZmXipoa5funJmks/fx1hwRyOT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 10:53:17.9094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: b806a960-5734-41b8-0ac2-08d8b87a99dd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PcEDBGRfSdHI+pH/GgT8r+7U1OyYnH0gUc7LHDOL9hGtYMDqGESBIzdZfQZWVx9jQ3gB+1iaDFfUfsmLI0qJWBrbqUQXkiP5G1pWVh82Ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1971
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 12:31, Max Reitz wrote:
> On 13.01.21 21:28, Vladimir Sementsov-Ogievskiy wrote:
>> 13.01.2021 22:27, Vladimir Sementsov-Ogievskiy wrote:
>>> 13.01.2021 20:57, Max Reitz wrote:
>>>> I.e., all Python files in the qemu-iotests/ directory.
>>>>
>>>> Most files of course do not pass, so there is an extensive skip list for
>>>> now.  (The only files that do pass are 209, 254, 283, and iotests.py.)
>>>>
>>>> (Alternatively, we could have the opposite, i.e. an explicit list of
>>>> files that we do want to check, but I think it is better to check files
>>>> by default.)
>>>>
>>>> I decided to include the list of files checked in the reference output,
>>>> so we do not accidentally lose coverage of anything.  That means adding
>>>> new Python tests will require a change to 297.out, but that should not
>>>> be a problem.
>>>
>>> I have a parallel series, "Rework iotests/check", one of its aims is drop
>>> group file, to avoid these endless conflicts in group file when you want
>>> to send series or when you are porting patches to/from downstream.
>>>
>>> And you are trying to add one another "group" file :) I don't like the idea.
>>>
>>> Why should we loose accidentally the coverage? Logic is extremely simple:
>>> all files except for the list.
>>>
>>
>> Also.. What about checking python in python :) ? I exercised myself,
>> rewriting it into python. Take it if you like:
> 
> Why not, actually.
> 
>> (suddenly, pylint warns about "TODO"s, so I just drop a TODO line.. Probably
>>   we'll have to suppress this warning in 297)
> 
> I’d suppress this warning altogether, no?  I would like to keep TODO lines in other tests, too, without 297 failing.
> 

I'm for. Otherwise it means we just can't use "TODO" things)


-- 
Best regards,
Vladimir

