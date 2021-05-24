Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209438F26F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:43:02 +0200 (CEST)
Received: from localhost ([::1]:59606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEbV-0004Pn-8l
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llDtA-0003PN-9y; Mon, 24 May 2021 12:57:12 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:6849 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llDt4-0001Pn-05; Mon, 24 May 2021 12:57:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4fMu/NqOUtptl10tNlEV2D9AiHmeGnsvrTBruGNm6M1MfmbDstjAuacpAd09prxwEjdbr8FGL/jSGNydfwxiA1RGrd4H2m5SxKOeJQs1w3V4I30KecNwRaF4NRFiDqxAf0hUfnQtMyVBrmoJQcbvOEGgfQYUw6n5p8J8/E3Xhw3hGeSuyBGeJ3jckTobF8dBTZV2Zrv6XXGj8q7OAmp90J+CMX/CBOTgow58jJzq36TaPbkwc7jsLHcetXdXnz75R7U3fG8GoahK7A9zfCo869tD1OiVyecGcO9B7iRxSsvBwZbV7tmV7tsV/YgXIRvPLkF3opIToBWlYgvgeGa8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cP1oyLCDaXP6N+voSjrBgbq/XCGipAtWAT00aCSr1Qw=;
 b=WPLPQwZL9LM8oj4atzGF3ccLp5vTFbAE5IZDvNxgYvKiJOTqaCCMIwt/doAnaNRgKiI60wWg+YFxsonAk3nPoQjzoKesLdzuGW9r6OevWIkdtwEC4iRZW1EsIkecYB2jXufwQGzwMOihU2c8A/riDxn8d5Z+GopKMEWGAFA1Ad50dIHJSe5ll7rbdwXEJ+QvK71yUvGnq5Ce+XVXegt8BCfx6IiAZaOEnKbxruqqWBj/iTqyqhW0IEj+gMAnUk8R6Zj+ac73TMXjucuH4T3uGJKyKkFkqPU9MW2+am0CV8UddQsBxWwvfoCrW1dVGDzoeqEsp9oNp3VhCC4PJbZxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cP1oyLCDaXP6N+voSjrBgbq/XCGipAtWAT00aCSr1Qw=;
 b=eTUfXeUjlzBvcFW24rWok3Ry0JAaxePbemr5Oto84igrWySzrBbuZb8WRlS8MeJEekBkVOwGPe3Ckj4GDIqv3iEdwVuRDG+NrPtU0JG1MM78qiAV/EKNKHjFYOGgbE0/i2Yh5GxBdaoNTKKLz4qcAVqJDoCfwIaEZqKfEq5ce3Q=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 16:56:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 16:56:59 +0000
Subject: Re: [PATCH 0/2] vvfat: fix two crashes.
To: Programmingkid <programmingkidx@gmail.com>
Cc: Qemu-block <qemu-block@nongnu.org>,
 QEMU devel list <qemu-devel@nongnu.org>, mreitz@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, berto@igalia.com
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
 <E8FEBD24-139F-4918-92D9-5183EECCA8FB@gmail.com>
 <482b0f59-addc-2bdf-21b7-53d07265b651@virtuozzo.com>
 <B4968AF6-F208-48F5-B431-0E84CAE8491C@gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <db8e3de8-3b03-2293-fb20-215593cadb8e@virtuozzo.com>
Date: Mon, 24 May 2021 19:56:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <B4968AF6-F208-48F5-B431-0E84CAE8491C@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Mon, 24 May 2021 16:56:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dcd276d-2434-4094-6e5a-08d91ed4f1e5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61517DDE0B2D4DBC23B76ACAC1269@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CaR7UexSCYYb9recjplA/XA1BDG9506hYnXkfCzYgraivRGqS33VZ3T9F+uPUo8qEBiNUkZgBSUPg9s1/YBd1WIXYq5cglP0bU0XcPYLrkkzEXMc7bY2NHUB9vyMiPqn4rV/E+sRVl39CYwl9um5qsdeMteRu1rBeS72hmhNLO9vc90G+4Up/dHsqVsjYIqjWF2J1ob/AvvsdtinXjTG7XoFo4Mzce1/Dak5vQ9Lnyx3XhBbZzmvZAOimEwWTK4wV2ThxaSoZUONQS6jozGBbLtQBCjljPIljbgpqaUzYy5r03HeygG5lCZYpfJt4slIndiq665eiiUCkxdVf6tu2LffTMJCjRf+Uju5DE9SqEJcQwPFE9iyMk6CidEuV8K2CzRbteFLVM1B2k1BLExWLQIWsQrx00IvxepbGGhLP2l7V3ENbVUro5IRM/vXdgUoF2whAAgbYtVSXi9K418nvjC8DojUEDBMFNYQ94aVvqEzl1h3SB1RtnO1YJnBoRZg4tlv10a4U6Hue0x0Mbx8irF5t6OW76Iu+HtAWwgHJ3X4N9yUa7hyFTmONfISLOBgedcS+Rd5spsdoGh+DQsqbkc8nMpnvN1FcHka+SuMvplksV7LyCMt/Te3tddP6H8TYYZN1zte6yI+/7BTQ36YBe/7LfsLjcXyh/TqXHff47R+Ai1WD3OdIITTTN0CfyMoqkxaTsdoEzNU94dSY5Mu7I0T13lrJmr10JqehdEOaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39830400003)(376002)(366004)(6486002)(16526019)(83380400001)(36756003)(52116002)(8676002)(26005)(186003)(53546011)(6916009)(38100700002)(38350700002)(956004)(2616005)(66556008)(66946007)(54906003)(86362001)(5660300002)(478600001)(4326008)(31686004)(31696002)(8936002)(66476007)(2906002)(316002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjBoWk9FOFZzVkdNRGQ1ZnJIR3RPZDhKNWZsQkl2c0FNK2grcjR6ZHlBRnFn?=
 =?utf-8?B?T1JQQng2by9ST2dOQmhrWmtwY01EaWZFZGV5ZVFPRlVWaU02eEhJTkFDSlFW?=
 =?utf-8?B?WGRXZXgxRHhacDNZeVR1bEluM3dVR1QyL0ZBSzNJeUdHdll6bmhPTVlXUEhH?=
 =?utf-8?B?SVhVSHRrWmZFMjI1bWRyVDFyc0FTLzVjc3FvZjRNODZWaVorNTFpS0JzV2Mx?=
 =?utf-8?B?c0p6dTI0TDMxZnRBWHZXckhGVkYwTzJ1T0xWN0QySU85VzlsWFJNRjltWFpn?=
 =?utf-8?B?cDNYTngzZmJuVTlCUXhhblBSV2dFWVlXeEQvYjlWRWs0aU1FSlpoTi9NbHRn?=
 =?utf-8?B?Sk9rTEFlbmI5UGd5S0tuZyt3bi9zdFNBSit4QklXaitlUlpxTlRQWWVMUURs?=
 =?utf-8?B?azJmbUdsTmxBemFEVnZnbUVKbnBGeDAzSWZmT1JlMmRCYWdFMlhTNnRLQ0M3?=
 =?utf-8?B?TDN5UXlJQXZ0K2dIL1BDejk1dmp4SytYN3d4OHN2dkRQOTRENlNpRTliVHVu?=
 =?utf-8?B?Z0xYbW5LeFNRRzZRYUJnQVJDYldvMStzZS9sTEhuUjVGZXlXODFMOTB4cG5V?=
 =?utf-8?B?c0wzajFMRVhpZndGZjFVYzRnWVp4TVI5Z24wUitCOEtaYmNTQnFUS3RwT1pj?=
 =?utf-8?B?cUg2UDhiMXEwM0xrVjUvNXZ0a3dkK0tJSXVScVNaNVd1ajFpS09rQUZwcUE0?=
 =?utf-8?B?b2o2WXh0NVBacHcwaTB6RUgzSTArSjdHYlppWlNuZnR3czVheUp1bUhWbWJT?=
 =?utf-8?B?MUtzMEN1YjlNazZrcVU2VTBpTm0zTWgyOGdJcHc0S2VuaERuanlvR0RoZldZ?=
 =?utf-8?B?ODZHcURaZVF2dzRwbDVsQWJkMEJFSjJqNXAzK2kxSllwRUFWT0JielBneEZY?=
 =?utf-8?B?VFJybmd0RjU5elVpQThZcDVMMk01dlBFMTgrUmh3RGFvL0ZrbWxWa204SXVj?=
 =?utf-8?B?L3UwbTVHMHVzcURhL05KekRtditJRndiaGpXVVhKeUxFcnJNTXk4bm9UNGxz?=
 =?utf-8?B?amRwSFhFc01ReGdPZTBCS295Q1JVcVpzZUN4S0ZiZ0ROeDRJcVU5b0w2d0tL?=
 =?utf-8?B?UEt5dnFNSjJPdEVHblhIR3FQUGlhN0tKRHBFZ0k2d2NHM3ltTXY5ZW5YQmRj?=
 =?utf-8?B?SVQzRGV5Ry8zY2JwQ0ZSNFVFMElhUHJ4WnJCdmw1OVlaQ1FKRzFzczVSdzRE?=
 =?utf-8?B?aGNQWXB5QW1yWWJmM2hpdTczemtLTUVObENyWEVSaGh3Y3VkK0NOeDg2Wm0w?=
 =?utf-8?B?Ym85dmZlRGVoZzlJM2dFb1F4SlJWbUxOb2w5elVoUWs3bFR4bFZWR0VkWWxk?=
 =?utf-8?B?YS83Z3ltMnlmNHlTSFBvSlZBcXJNelVNdk5BbDRCSERkL2YvOXE0Q3ZOek5Y?=
 =?utf-8?B?N2tLZzJLL3QrQzl3UnNOejJjRHVjbHViQjRqLytiUStwU1lyL1N6enUrRjRY?=
 =?utf-8?B?dkpOR0pqODQvU2ZQUUVFRlN5QmVMQkJkb3F4SHlGSjR2ZnFsZHd5TXBVWlEy?=
 =?utf-8?B?YVRDT1RFV3NLY2pJSVRabkVpL3Njd2ZoQ0dwaUhQNE9PTHN4Wmp1VHdUelRW?=
 =?utf-8?B?cTNpbHFoSkdvMkN3TmFuUkkvQ2xXckNDQTgxK1ZsZkZsTjJPSm9vYmRqZTdG?=
 =?utf-8?B?L0N6MUY1RzZVMHNhOVpJemQyN0VUK2xnTXdtWFdsZWtmYm5NZ2tvYUNuaWxP?=
 =?utf-8?B?RWpFbTJ3dEN2VkhCS1VyNVR1dGRabG5iazdnUGFxNHJQdDhHaUdNaGNSZUtY?=
 =?utf-8?Q?lQt6fYmPwUPfciVsFoqDtgg36YNx7E0BD+1mq73?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcd276d-2434-4094-6e5a-08d91ed4f1e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 16:56:59.0846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A77Qx28tPYXnyrpwKCX25YhVB75stYdEtqPzUqhDSZioxZhRM2r6OG+40nBQeljNh9oOb/cY8zXU3DBSGqLffyt5ysdroX+G74KdpcB0A5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.20.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

24.05.2021 19:06, Programmingkid wrote:
> 
> 
>> On May 24, 2021, at 11:55 AM, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>
>> 24.05.2021 18:41, Programmingkid wrote:
>>>> On May 24, 2021, at 6:12 AM, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>>>
>>>> Hi!
>>>>
>>>> As reported by Programmingkid, command
>>>>
>>>> qemu-system-ppc -usb -device usb-storage,drive=fat16 -drive file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none
>>>>
>>>> crashes.
>>>>
>>>> I tested it with qemu-system-x86_64 and it reproduces for me. I even
>>>> kept "<path of a host folder>" as is :).
>>>>
>>>> So, here are two fixes.
>>>>
>>>> Vladimir Sementsov-Ogievskiy (2):
>>>>   block/vvfat: child_vvfat_qcow: add .get_parent_aio_context, fix crash
>>>>   block/vvfat: fix vvfat_child_perm crash
>>>>
>>>> include/block/block.h | 1 +
>>>> block.c               | 4 ++--
>>>> block/vvfat.c         | 8 +++-----
>>>> 3 files changed, 6 insertions(+), 7 deletions(-)
>>>>
>>>> -- 
>>>> 2.29.2
>>> I applied both of your patches to the most recent git commit today and they worked. I was able to share files from the host on the guest.
>>> Thank you.
>>> Reviewed-by: John Arbuckle <programmingkidx@gmail.com>
>>
>> Thanks for testing! Didn't you mean "Tested-by: "? Or if you both reviewed and tested, having both marks makes sense.
> 
> Yes, you are right. It should be: Tested-by: John Arbuckle <programmingkidx@gmail.com>
> 
>>
>> Hmm, also, I think "Reported-by" in first patch should be fixed to your real name too for consistency.
> 
> That should be fine but it isn't important.
> 
> On a related topic would you know if it is possible to use fat32 instead of fat16 for host folder sharing? I did try replacing the text fat16 with fat32 but it didn't appear to work.
> 

No, I don't know..

Moreover, my quick look at the code of vvfat, this fixed bug (which is obviously not covered by tests), and also status of block/vvfat in MAINTAINERS file "Odd Fixes", all this leads to advice "don't use it if possible". May be Kevin can add something about it, he is maintainer..

Could you use for example NFS or Samba, or sshfs to share folders? Or you need exactly to make a host folder available in guest vm as usb drive?

-- 
Best regards,
Vladimir

