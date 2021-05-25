Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F131338FA7A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 08:07:10 +0200 (CEST)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llQDd-0004xQ-Kw
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 02:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llQBo-00043K-P5; Tue, 25 May 2021 02:05:17 -0400
Received: from mail-eopbgr00127.outbound.protection.outlook.com
 ([40.107.0.127]:64261 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llQBi-00060c-KV; Tue, 25 May 2021 02:05:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obxVH6Lz8V9VTy61+kDAm3dYK51Q7n+pGI/vcdcxt2GqXB2pIxO7+TgS6nsKE/q/q8deQG7gqkEycp206FKH0WcGZHjE344jXG5rBXzUEqLJ4n5ddV8k7yUe23a7pYM3IjisRnzaLfcHdZo2XWENxQ4JeJUmNo1YfxazYE6OwJqtovy3ddl+yDAeIz7oZ98EzhH114XNpMvsrDVXQsmcTfqP7a45xdKGLYC4Al1ZGOfMxTlgqQ1H9eriFNSecou/ygcYfQPStPv2ox0YkBafAazMwccmm2tPx+UNdjUA8VY7wcJQn8SEAr5ITM4O4keO3wuFuNrOZRDIu+sidFuhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQiNWZhUbSIZx2UvJ48BTn252M3L95SWcOQ0HKDoQbw=;
 b=ZFdByShh8uIu8p8xxYYxpUfxPchizNXghdrbjrU0k4hSTF33G+EhT/55NbyXuJ1Xe4rCvRCU/bvVKBCEj/L2gZE5uGUZzk65cOBDsyWMgeXsohOVVGbHK1Nl4rbz8qMIFnAFUOpAFZ+AGRbcomyeYbRi6B8m6R3RD4iaGRTNCYpJ6ioKfNJOPr8XQ445QliAiRirRSGz2zMc6Cq9uJ0TLjVICStvFM+D/fYWJFFeOKpMmRPecPtzYI/sHHNhYVclHsqrCxN7IHhxBOFlfC/mQXb9bQ928HmBlPQb66EV9R9iCDn8DF8kGkKvScsAc5jP5jGgHqIJ9x+s0i0Vlx0cRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQiNWZhUbSIZx2UvJ48BTn252M3L95SWcOQ0HKDoQbw=;
 b=oHlaLYxw825zzQ8N5I5d4i5yMR3Z8j5Q2Pt+MW8otbrC5hY1yInU6ZiSRRPpAwqrxJ0TPXIgTAIqsF0svkZjhAKrJVd9BLkPBY83cvqQo87za3C3oOIXnI02Gi4migXJftM/VnBmMeWQxlgjDEj0stlRxL9DscaoXmSn3imOmMA=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Tue, 25 May
 2021 06:05:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 06:05:05 +0000
Subject: Re: [PATCH 0/2] vvfat: fix two crashes.
To: Programmingkid <programmingkidx@gmail.com>
Cc: Qemu-block <qemu-block@nongnu.org>,
 QEMU devel list <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, berto@igalia.com
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
 <E8FEBD24-139F-4918-92D9-5183EECCA8FB@gmail.com>
 <482b0f59-addc-2bdf-21b7-53d07265b651@virtuozzo.com>
 <B4968AF6-F208-48F5-B431-0E84CAE8491C@gmail.com>
 <db8e3de8-3b03-2293-fb20-215593cadb8e@virtuozzo.com>
 <A4B5A5FB-8B80-4C5B-84CF-D24D4015F914@gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8d87d16b-1cc6-c177-7b9b-7e396a44f747@virtuozzo.com>
Date: Tue, 25 May 2021 09:05:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <A4B5A5FB-8B80-4C5B-84CF-D24D4015F914@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.24 via Frontend Transport; Tue, 25 May 2021 06:05:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eede1ca-91ef-46da-ad7d-08d91f430ac3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6502E55792BD6FCE4A46AFF3C1259@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xOAnkuwltxGZnnZCzEtlCERYldDyJXgJQlfS3pYr5z1dTd6nFhkEQqH/L4XM4RSSA+vaMIvya1Yr11mNe3I6Bzl/jxxqG1FXee/8OEsNulX9TW/D9g+jzjP6AIEZQXjxSr1baZf7qtRgyd2yOw7SKFiCxG/coAyNi/pChZdOWcczZASLUJmKwAgMuCdsrOTofOEdUzvK4h2tfxZcIjm2kSQV1Ceq2ohKhgTE5TimTIP/bNhKwbiFl02RSDzbX6DZvwlm/opLYcvhQkFhkKndQOLKbgPgugV2CwT0rfJio1IHWK0QTv9RoTI4UUuc3ZSf0NZtsea2UNpeepomytg6Rf/+VPqGshQGKwqNbwnoSLXTv025b/RWLN3tSvx5mtzvQpcPVKcr1dd+oB+2Z2205avU+MlTRSui7OBvoLXO7U1VmhYDmo4dgyX6JsAQDwxSf4EzQMhZNoM8SihSTWmit/xaZdqVKu5R04DpGNq4gKmDb6VAFW2pfEV2acx2zMwaGI+ceZEr0QvewSqwnC2E1I00fy/Gz1SxmzXp8qQ54sthrGPXSjQH2G8CrQK2Fx6CeyhQ3OfljPE0XXhpJgFYJOlwze2LEanOd/5GMLjeEXo4Oc2gms6BV0JGiLTZW4uLWe/oW58xFaU6S11uAKQoc1L7/zBtEPQMhKTmuhL7mPp2Dg8UdrhqjK4eWgriqp1VUJ8WROpcb+0riVOtukH0eK1r+LaDHxv7CwwhbHRsuWgTN46EwHjkj9J2hWWGSMbWWLMUYIxh702KEYPNj9C9CZmtnQsjRTjrUmdHanJts1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(26005)(52116002)(2906002)(34490700003)(83380400001)(31686004)(53546011)(2616005)(956004)(6486002)(6916009)(4326008)(66476007)(16526019)(86362001)(38100700002)(66556008)(8676002)(36756003)(508600001)(31696002)(8936002)(54906003)(5660300002)(66946007)(966005)(16576012)(186003)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NjZlS044Q0ZYc2p1bmxOdmNOYWZLV3Z6VkRxMk01VU90R3hPZEkvSzdNTTU2?=
 =?utf-8?B?S0MvSXVQZHRtbVVUVlhaU0xBcC9rb29veVl5NU45UnhPOUwvcnBLK2VqYzR3?=
 =?utf-8?B?a0swVEFKVEV5b01SOGx2WnZYelFqQnJJYUNxUXZqd2JyWWVxa2tPaC8wNGJQ?=
 =?utf-8?B?N1ZvUVJWOS9IcU5nR3pOYkhWczNrR3RQakhuSUtxdkx3djdoYnNQN3FmVWtR?=
 =?utf-8?B?cW5mcjF5VFNsRGtHdUh5NThlL1YwVStkN1psWjNoa3Z0QmZSMnV5QjgycUVX?=
 =?utf-8?B?OUxnOEF1bVdNc01LeExVL3hRZ2FUQUFEamxwNUdUbXFlK1M1SkhhWDl5REMx?=
 =?utf-8?B?SGtDSDFTTFFBZzMzejMyRHBoNWpHaStTMjE5MDU3MFJUL2RJQ0VidWNVTGh1?=
 =?utf-8?B?VnhIYXFSVFdXaUllNVZaOExRcUNxSnhLemtkYTA3RDdqaHJGWC90M0dWRVht?=
 =?utf-8?B?cWZmRFFrYWlMNVZ5TTd1eDZNSHFINFBXOGJLMnJCYkJhbWJFa0VUN0JXbzZi?=
 =?utf-8?B?dU5zVmxkcGhlblFsWjkwUVR3dk9tVHYvbGczR1F3SlJJY1lVaW5LaXZkM0ZV?=
 =?utf-8?B?UjFiTlJYdTNYUnRNQVVsd0FxNlVLZ3MrUERWbkdoL2c4aEhLSk5DOWxTNW15?=
 =?utf-8?B?L29nOTZRNUJZVTA2YmIzY2ExVmVYYTU4eVFUdzBQN3M0SUN3NGtMVW1HM2hT?=
 =?utf-8?B?YlVQMW9CSHlya01URytZeVlNTUVhQjBEOU5QOG5lMzBBazRsU0diV1ZaRVRE?=
 =?utf-8?B?ZjZRb3JOYzd3dHAydVNMbWhLdElHUUpCOEZXRmpPKzNOTHJrSFNtN0dIS3dW?=
 =?utf-8?B?VUx2Y1lmc1FoTzJrUDBUVTd0MXJvWFRZeWhRMVVuRU1pd2NTand3TlRDUlpI?=
 =?utf-8?B?YjRTSjQ2Szd2Y01EaTE5c2FNL0FWYTVZbVlPM2hsRFFmMXg2S3pKNzJHc1Bz?=
 =?utf-8?B?dm5NNThLY1hVWUxTdytmcGxyOXFVNkFCT0tQdWYrMHRGUUtYMkUrZmxKbXVG?=
 =?utf-8?B?WDh4clRLYTd1c3h3dGpMTENaUUtKelFHNGpabk9WZUdTR29oYTZGTnI2S3hG?=
 =?utf-8?B?MVNNanhueFpwSjZvalpWbFFsQnE5TThpamtrUllzdEFWczhIeVlGS0xrM0dt?=
 =?utf-8?B?NlJwV1dTRm13WkpJUHNUU0owMnVvL3NET0hseWwzQnVEcDhPMGFUQUpzdncz?=
 =?utf-8?B?NWQyWWlRMitOYW01Y1NKZUZ1Z1dnVkdEZWp6N1lGRjdWcGxxb0FCVXZ5L05W?=
 =?utf-8?B?cjVENGV4ckNhclhKTy9GdklkSklxS1BhSXJiMDRPanVtQUx1OGxWRVVMKzJW?=
 =?utf-8?B?VTRwbE5CYmc0ZFlVN2hVK05pejFMVkhsenJaZjJJZndoQlc5NEQ3MnFuenp5?=
 =?utf-8?B?QVZzc2w3MnM0VDJZQSs2ZllFc25zeDVqTFIyNjJZYnRBckt3VzN3T1FBWVRk?=
 =?utf-8?B?MHlGNXdYb2FFVXFESzN6N2lNTEo0SWRkU1hPT0pjemFvM3dpYWQ4ZXJ4UGF2?=
 =?utf-8?B?a2lRcU9MYk56N05iTFZtUjd6UllxNWR5cXN0Q3VIVkFnSHJYUW1rV0dORGU5?=
 =?utf-8?B?d0pML05yVXFIdDdhV2dGM0tGMTg3SVk4YUpHWVRVQ3ZRcEhBRTBya2Q1NUFi?=
 =?utf-8?B?c1FwOGFmR2VRYTdkcFZiV2pqWWoxKzBFUmpLOXFnakYwOFdPcC9PVHd4VjdH?=
 =?utf-8?B?bVVmcWpBNzdlN2NyVVpLSE1wUVMvS2JsYVhNSU91M1ZmcWUxd1FBZjdWbnFV?=
 =?utf-8?Q?jtF7KCW8vrdXsG/xUUYYQDSiV/aZD6V9GTzIaZD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eede1ca-91ef-46da-ad7d-08d91f430ac3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 06:05:05.4447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Y7Yf27aVxrhxN8KAUvF0tWGxY0w6uVkENfW7cJ9bb8yf7B49/91LvLxN/BkFGEOGVmN7RaJ1xyppRzEa3xUqAdChBKHlINigQVfbO91khs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.0.127;
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

24.05.2021 20:33, Programmingkid wrote:
> 
> 
>> On May 24, 2021, at 12:56 PM, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>
>> 24.05.2021 19:06, Programmingkid wrote:
>>>> On May 24, 2021, at 11:55 AM, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>>>
>>>> 24.05.2021 18:41, Programmingkid wrote:
>>>>>> On May 24, 2021, at 6:12 AM, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>>>>>
>>>>>> Hi!
>>>>>>
>>>>>> As reported by Programmingkid, command
>>>>>>
>>>>>> qemu-system-ppc -usb -device usb-storage,drive=fat16 -drive file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none
>>>>>>
>>>>>> crashes.
>>>>>>
>>>>>> I tested it with qemu-system-x86_64 and it reproduces for me. I even
>>>>>> kept "<path of a host folder>" as is :).
>>>>>>
>>>>>> So, here are two fixes.
>>>>>>
>>>>>> Vladimir Sementsov-Ogievskiy (2):
>>>>>>   block/vvfat: child_vvfat_qcow: add .get_parent_aio_context, fix crash
>>>>>>   block/vvfat: fix vvfat_child_perm crash
>>>>>>
>>>>>> include/block/block.h | 1 +
>>>>>> block.c               | 4 ++--
>>>>>> block/vvfat.c         | 8 +++-----
>>>>>> 3 files changed, 6 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> -- 
>>>>>> 2.29.2
>>>>> I applied both of your patches to the most recent git commit today and they worked. I was able to share files from the host on the guest.
>>>>> Thank you.
>>>>> Reviewed-by: John Arbuckle <programmingkidx@gmail.com>
>>>>
>>>> Thanks for testing! Didn't you mean "Tested-by: "? Or if you both reviewed and tested, having both marks makes sense.
>>> Yes, you are right. It should be: Tested-by: John Arbuckle <programmingkidx@gmail.com>
>>>>
>>>> Hmm, also, I think "Reported-by" in first patch should be fixed to your real name too for consistency.
>>> That should be fine but it isn't important.
>>> On a related topic would you know if it is possible to use fat32 instead of fat16 for host folder sharing? I did try replacing the text fat16 with fat32 but it didn't appear to work.
>>
>> No, I don't know..
>>
>> Moreover, my quick look at the code of vvfat, this fixed bug (which is obviously not covered by tests), and also status of block/vvfat in MAINTAINERS file "Odd Fixes", all this leads to advice "don't use it if possible". May be Kevin can add something about it, he is maintainer..
>>
>> Could you use for example NFS or Samba, or sshfs to share folders? Or you need exactly to make a host folder available in guest vm as usb drive?
> 
> I do actually need it for some of my VM's. It makes sharing of folder between the host and guest so easy.
> 

Probably virtio-fs is modern way for such thing:

https://virtio-fs.gitlab.io/

-- 
Best regards,
Vladimir

