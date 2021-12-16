Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E45476E8E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:09:56 +0100 (CET)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnhz-00054A-EW
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:09:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxneK-0001UM-DH; Thu, 16 Dec 2021 05:06:08 -0500
Received: from [2a01:111:f400:fe08::723] (port=38246
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxneI-0006P5-F1; Thu, 16 Dec 2021 05:06:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFX0y1rJRo9xP2rvuCdme/oBPTzJY1opwihwzgEHp9NcuwmdMyAvAwjl/TgCfmZu9uX0nblqbtJ7djQU4RwrkHuE2/n93F8z2J6rUqAzqGFv7uDE1tEC9DXNaXKZNk1IVRfdzpHvlrMn4VA/ttvXBVvG8Jgi7UQgtBrNpca75StOekPNPJAgR4Xlr22fQTXULwpMRiiyvN2mGbFZV4wQfcec8q8qFbFxCt8FMI7y0wStS9cb+IwvpJjOZWwU1tmGL5b2OCll+UuXoFeukrJRNn7QGv8pwoh7fs9LUEnoDJLKVTj7uV8eNwmzll/67vUuB9W6HBBGnBvhQOehp84cXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWoipwOG/zszP6imOfhvBcFed6O9P5dtlhHB114IR8w=;
 b=XkzoAgSL/8B6clNtie8DiyhR8dx/jtrioakbrxOJ1W9cxs1v21kxhYIunG/vYaOAgQxlAQaSNOci3++ZhrrP6mA0slYxq7TO7aqYQawZpOc3/qdsiDoMyE94khaWlhE/8t7JD6VcAfj36VOicEZMZj2mz0QvqJJ3/RPIxoidBR3wyH4rZ0sKeE1vSbFTC9JBGg/Z4ZBJBbaY08uzF9zeb4VKC0me3yjpTdFxvnEIGmolEzPFCqxhJHp7Bk4XDSbJAT/JEQDQ3KV/PW2dNTaaxzNWY5ApVZGbUVXr9SUPkt7C2xVvUllxoZqHZSeIZc2dEtuTDjnk/oEFWuPtC0kDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWoipwOG/zszP6imOfhvBcFed6O9P5dtlhHB114IR8w=;
 b=DQyHXL3HH5j9yeAEN/1qZuULfmERtUqizT+TUX546JoxfIlhNGtyY2PoLyr6PUiN4M1+WQ2L2xM9b6bsPnEeUHhHfYrtMAws40olhMdXhccPu49mjD4UF573s9Lh3OtbPaJ1MESgUGOCWnyMYxg5IpUPC8lnaU3DVyV0Bop4zvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3284.eurprd08.prod.outlook.com (2603:10a6:208:5d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 09:51:30 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 09:51:30 +0000
Message-ID: <d02c037f-6d6d-7ea8-4647-87dd9f5f014b@virtuozzo.com>
Date: Thu, 16 Dec 2021 12:51:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 02/25] python/aqmp: handle asyncio.TimeoutError on
 execute()
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-3-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0063.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::40) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM6P194CA0063.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 09:51:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75957c86-0af3-4f00-acb5-08d9c079a2b1
X-MS-TrafficTypeDiagnostic: AM0PR08MB3284:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB328499688625BBD88682D35EC1779@AM0PR08MB3284.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZImjyNJ7dcmHkKvxi+Vklu0oWbRopTzoMEPGNuc2RWfBV5pN+NExUZMOC2puLGRlEF8P/nWyWXDQHmXaiAD+LzMIvhSO4T+XjTq5d8j06mmdLaS6W4bY2o5txrE8Kx7Uc9Yq861+R5RK3u/OAhyGTqIQiVdrA709RvQGuQGtn2gM6iZoZk0dO38d+gO4wIoubwRW6SU4MruQfqryCPFeSdgILv3NuwC/ddeVZGOPTKtMt5+uwtLWDZ7hs/U/OPZGICerw6H8gVMLV7QNpTupXZtuiv13SSyt1v4lXeTS8S5OVFi9Pj8TAGIN6im+j/i1JBJDaoMDiGHtWryAh0NOIOTfxTy6jRLdi0Nk7HNVAX70W4r0+i6Z2R9aVv5Qlggfpkkq5fA2cqpQR1N97A4XUL9b/OMqWbhYGYZM/BCHOALPrNUkyVLsdiJFSAqdmFpVwWFjEaGAd09GHKKvJ1J7Ufzxv0l+ml4GGxIoPVDQxJx5gsR6A3zIdfJvonAGCneXcRyxrU/ZT/0S+w5sC7oSQo2EYxekzm3iL3vYMMfxNuG2wBNRgMJCrQDl+OBcaX/2OKuoShzpI8TDCHjlMhoqOn27m95aKpmWnXtg1k7RMWCHsz+eKS+oe+MYYL+OieFz5JfKjQWTE6d6HnZba0qnSKL9caqbgToW4+khzxKwfUYmOnHFCUlJnrbBSLwN6mswetAIyKnHchWniWeFfdwtC0pW9URq5om1Mam2PLjDTDY+sQcRQKm1N1EriCchXx5GuWSVB7b0H/oc/rCoSrlczQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(956004)(38100700002)(38350700002)(8936002)(8676002)(66946007)(66476007)(66556008)(7416002)(6486002)(316002)(16576012)(5660300002)(2616005)(2906002)(52116002)(26005)(31696002)(31686004)(83380400001)(54906003)(86362001)(4326008)(508600001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGhSQjhNK3VubEV2cFY4V1l5b2tibUlMQ1hvVTlSSS9qSVJ6ODJVYTI3ZkVk?=
 =?utf-8?B?bExyY2ZuSk5KVElNWi80VjQyTXhYMlh2SVg1MGo5RE1MVFF2MDlDbUZlQ1ov?=
 =?utf-8?B?c2xlS0VFUm1ScUFkRXJjNXg4VmdKZ1NuZ21aN1U1cW5Hb1VUWFM5dUpSYUNX?=
 =?utf-8?B?UEgwbDZEL0xYc00wSDZES2JVNHY5YVFhREREbDB5Q0ZxRjdLaEx1dk9yZlFt?=
 =?utf-8?B?WlljdG9RQzB0TzNCb0FOWWpvMVp0REQ2YnZVbG5Wd3NKUDdiVE5EQVFSNnV0?=
 =?utf-8?B?MnRPWGRzNnN0WWk2OFJaTjhGcEE2azNNL3FNUE9MZFMySWk3Y2dwTWZHVm0r?=
 =?utf-8?B?Z0MrYnFHUXFCZUZBT3RHZ1BuK0VFdWVKb2w3a0hPRi85d2pXcUx6b1c1WktZ?=
 =?utf-8?B?VG12ellZcUdxTEY2WnBaK1Q0azBMdElTbDh2clBqcUZMMzJJNUlPM1N2NEE2?=
 =?utf-8?B?Vm95bjdxeHJOT3hwd085RDFNbTh0bGcvQWF3RUNiaWRuazRLdGV4aCt1VG1w?=
 =?utf-8?B?bHpJSTdJOUxVSDNvVGhHQnJ2a3V6QVpTeVN4M2N2NlRoM3VYTWhHdEFXaDN3?=
 =?utf-8?B?U0ZBWDhDSExLajhoVU1lSmtkOG0vMTh0WFN0WU9IckNuVXNINGFzWHBMNHI1?=
 =?utf-8?B?NG5LaFFUZ3dzaG5oRzBTbzlhT2pKL1AybHRwOTZFcEdCb09IaEtrT0p2R3cw?=
 =?utf-8?B?TmRQMzVlajdqVVFBdjBDc0FrR1lweVRBMW1sZjcydWVHY3JDYUVSV3VTdWg2?=
 =?utf-8?B?OVJ2bVAyVXF1MU5IblhwK3ZlKzc1R3FxcW44UlcrR3NscmRQakdKZWN3QXl4?=
 =?utf-8?B?UnVVWkVKNmp0KzNmb0doaG10andYaE52aUNuT1pyUy95bWJ3d2dJVkdVVmYr?=
 =?utf-8?B?d2hSNmZNMUs1REtIM0d1NnNWTTZEbFBEYWFCZVRWYlFBOWt5NW9wNW9zRVVP?=
 =?utf-8?B?Rmg5eHRtTE5NZWVxWTE0Tit2WGNDaytvTHV1NnUydzRoN2N3RFFqYkc0bDMz?=
 =?utf-8?B?MWwzdnFiYUNkUEhVN1ZzemlFeFJ0anYxSzE4cWFEUkNzVzB2QjkzR1c4SC9M?=
 =?utf-8?B?U2hMZmRuZm9hV1B1NHlacDNpakZpZ2QxRG1wbEgyN1o2MjhiV25rTWFoWDRs?=
 =?utf-8?B?cCthbUlKVm03ck1vVGpzb2Vxbzg4UmV6cTVCc0hsNktFcnZWL09jcmwySzVs?=
 =?utf-8?B?YmZxbzNERXZVUnp2NTkxZm1qaWduRnByem5YRnhTbmU4OUE3OUthVWt1QnNO?=
 =?utf-8?B?anhLcXNoelJaZlRSdDc5OUpxREZEeldYNjJvSm03N1hoUjI4cnJhd3JmOFJ5?=
 =?utf-8?B?bDBmSW1lN3dVdElBZlJQb0tmZ1hMTys4ekRNdWFUKzR0dDR2SUJrZFRKRGEr?=
 =?utf-8?B?c0cxTjZqVEN0dk5Na2dzTGluNG9JQkFza2d0VzU3bmZWaFpaTXlDeFdza1dB?=
 =?utf-8?B?YW5PQkNRaFFNQnBBNFRteEJrczlKSUVhejNCOEQ5NlZRbC9ONFlxbXZPeXFu?=
 =?utf-8?B?bG9QbmVmdFl3MEpMSVJDb25oV1h4UkdVSnJEVFVoV1VoT1pkMjMxQlBYMnBa?=
 =?utf-8?B?SHZnU0xhcnlrTUhtSUdvU3NyWDJROGJvejY2OWYwSFFmd2c2S1RDd2dDZ1pR?=
 =?utf-8?B?VFdrL2NXZnhhSC9hUkt0SmlzYWdTc1hZeUhmTjI3VkxCNHZ3c0RzSXllWitL?=
 =?utf-8?B?VWYwNkFPZmdGa0hNa1F5RGdiVUdjbUxhWmgrM3ZkNEpYSTJualJVZ1RCeldI?=
 =?utf-8?B?WldrRlhhZWVOeG9JSW5hS1ZiM2d4Y1ZSZndRVDFRSWErV0RDT01TbGUrbi9G?=
 =?utf-8?B?b3h3YUhtb3JEV3YrTjQ3YU5kZlQ1OHo5U3RjeFdBZHQvaHBjY2JlbkVtQVVK?=
 =?utf-8?B?MXROaE1RUWVWR1FMTE9lMzNrWFZ3NjNoYWNUOWtSZVljSE9PYVd2aUc1VWEy?=
 =?utf-8?B?MG1iV1BRd3lhdUFXSXJVbHQvdmRJNlE1T29PeVZVL3dHamowNGQ3bmtudUdU?=
 =?utf-8?B?cjAxanI4R01rNHNMOE5RTGNVb3owbnlhblF5ZGlNTlRxVFpBV044QXR1QXIy?=
 =?utf-8?B?ay8xalFVajJyUHN4SkhXT3ZST0w2dzJ2dGo5UzFxVXpmSUxlSUpRclk5Q1Fr?=
 =?utf-8?B?SWNqOXVQc0ZxZEladUFKeloxdURTcG5NVEhRUUMyWjVLdDdDRGNvTG1iVjdw?=
 =?utf-8?B?UFZ1RWZSa3BVZkgxclE5NCtoZVg5dXgvUVRsazBWY2gvYXJjSFlYZkFqRGdq?=
 =?utf-8?B?eWhTeVNhT3Yxc3p2aGdxaTkwS2FBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75957c86-0af3-4f00-acb5-08d9c079a2b1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 09:51:30.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5Mm76zvXTvT6Z55ekcQWU7bb0gz5/tz/5WsmmhOk9txFUa6XGCQbKdLeXgo4ps4WXsNjl1db5uI2nFazg8KlopPMVxhZSqtQBucOGvXPlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3284
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::723
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::723;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

15.12.2021 22:39, John Snow wrote:
> This exception can be injected into any await statement. If we are
> canceled via timeout, we want to clear the pending execution record on
> our way out.

Hmm, but there are more await statements in the file, shouldn't we care about them too ?

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/qmp_client.py | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
> index 8105e29fa8..6a985ffe30 100644
> --- a/python/qemu/aqmp/qmp_client.py
> +++ b/python/qemu/aqmp/qmp_client.py
> @@ -435,7 +435,11 @@ async def _issue(self, msg: Message) -> Union[None, str]:
>               msg_id = msg['id']
>   
>           self._pending[msg_id] = asyncio.Queue(maxsize=1)
> -        await self._outgoing.put(msg)
> +        try:
> +            await self._outgoing.put(msg)
> +        except:

Doesn't pylint and others complain about plain "except". Do we really need to catch any exception here? As far as I know that's not a good practice.

> +            del self._pending[msg_id]
> +            raise
>   
>           return msg_id
>   
> @@ -452,9 +456,9 @@ async def _reply(self, msg_id: Union[str, None]) -> Message:
>               was lost, or some other problem.
>           """
>           queue = self._pending[msg_id]
> -        result = await queue.get()
>   
>           try:
> +            result = await queue.get()
>               if isinstance(result, ExecInterruptedError):
>                   raise result
>               return result
> 

This one looks good, just include it into existing try-finally

Hmm. _issue() and _reply() are used only in one place, as a pair. It looks like both "awaits" should be better under one try-finally block.

For example, move "self._pending[msg_id] = asyncio.Queue(maxsize=1)" to _execute, and just do try-finally in _execute() around _issue and _reply. Or may be just merge the whole logic in _execute, it doesn't seem too much. What do you think?


-- 
Best regards,
Vladimir

