Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ABC454ECD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 21:53:41 +0100 (CET)
Received: from localhost ([::1]:43010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnRw4-0004kf-9c
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 15:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnRvG-00043l-I8; Wed, 17 Nov 2021 15:52:50 -0500
Received: from mail-eopbgr130111.outbound.protection.outlook.com
 ([40.107.13.111]:20318 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnRvD-0000qa-Ek; Wed, 17 Nov 2021 15:52:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUNDxvAepbdH9gdnRKDkZUyGf5ztISleNUs8hzhwIZQHktZXtCiuJw6GL2aPaj/6YGDpe0niME7/Ad6VoVw6twwRIU7O/kRoNGpUw4s9NEyxwgne2vmYE9tA/nUZGS39YQ6gL/lGFbufv6Qtp58xniQHJwkX5DyKrXeOAaE/2jauR+22IUjffa9HcZ0DjG1MuAMIuT6+70Y1uQ1sO2uNIsP8ihaB+93qrZ6myZIURERmCrB2IvVmsv3Gio2SWuYPe4rBmy7RCzXbg1lOvQd5BjHL/4aTF1LNObE+KBaBUvcm/pzPkm356ZAmNlfKviCKzyqu8Xi42z/zWIb9IrnR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0wQPKfzQ5H4Rn2+XV4elgaz1Vr6+OM5A4OT+cCZtuU=;
 b=W+jGEkdjWT1SfBRxXxzi8aT3xboDxQTVPn+dnS1160xg+G6ZCobq22SxQa4VEmCKO9wWXjebBT6v6b0eM21EOPQyZVdzF5OZWvjRuYVKiWV9Q6JVTjTPR9YaKdE95l8odLHK/2N25CXummHfKy2zNSWtiAYWeiteK0e0B2VZ2RyoTlJ8wBSLIivdwYGQUI8iYeg/mSAz3t3m3CsjKJOWmfXk/3bOiCJWRw5uASbereJyaTN7vgjFRK4O08TOYZTErh7vGqgqbOhnVZsBK0Z99HlLR4eFlAN/G+80ODzCRhPIa3EFe0M4eIE1oTONgvzLSxibTCcrBBgkRAmx1YFXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0wQPKfzQ5H4Rn2+XV4elgaz1Vr6+OM5A4OT+cCZtuU=;
 b=lSOhkxPVamQqoPP9AgSlgUsxpgPiAd6WGZ425Rb8+SJyx7EuvTTZ78tZQq5Ao+X8qAryVtoqAQEjSCxClTH+kZ6EGkFbXr72vgwgendaunVr3BU9IvecYem8EYEaC6Wh8iVMzBYVGBldeGT8ICgUB5/7CLVmRxLYOl+3GDN93KU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3811.eurprd08.prod.outlook.com (2603:10a6:208:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 20:52:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Wed, 17 Nov 2021
 20:52:43 +0000
Message-ID: <77afefe4-12bd-fc84-4053-be1409e33227@virtuozzo.com>
Date: Wed, 17 Nov 2021 23:52:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH for-6.2? 2/2] nbd/server: Simplify zero and trim
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, rjones@redhat.com
References: <20211117170230.1128262-1-eblake@redhat.com>
 <20211117170230.1128262-3-eblake@redhat.com>
 <d0c72875-4b2e-a1b4-646f-8380b0f3f6f2@virtuozzo.com>
 <20211117204927.r7mlgcstlatgzskr@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211117204927.r7mlgcstlatgzskr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0063.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::40) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.233) by
 AM6P195CA0063.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 20:52:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3aa6456-f53c-412d-0933-08d9aa0c33aa
X-MS-TrafficTypeDiagnostic: AM0PR08MB3811:
X-Microsoft-Antispam-PRVS: <AM0PR08MB38117A47921A6383270BD21CC19A9@AM0PR08MB3811.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GvXi7K5LVroMYzJwWAm8o6IIbjMFFxeup3hJ3cCQRz+L8HHS6H69bMwRqLfFsgSmN5gFxEdMTU4vAb6b1Bv4tGadpxNkoyMdQUaf1fVVB8QpIoTclK26q76flwfMc+Xjvb59nez7/5fu7EGRh/rxcTJrvFO4H+jVsIh0mCkOntcP+WZ2cacgWuXyDdWpwPtmtbFlSt6oN7R8AD1OPIXuDvafrF7RbyeCdJ5BKtdw8drlGlig8EI37Ly5U0Ny88zzSwRUThnBbFxP8QVhEbqIeHBeUXQ3iM10tnjCADa3AYjxCu9EdSoXAFVfytkRqIYkgnKaTRl6u33SZcwr7uR/ZpV/8kMIYhL0Td+zjei8ERRxNazwdcl5DmuoXP2m34VyETbg7VwYDVVUkEjc1xybzF6XGsJTa4KfA8JW5lF3eYv4cE2bsHZVYu/L7A4Wbgj0eYKptypvMEoggTjK+8rcdELM9KmPR/o01QvqRodu+eHsSQPuFxygSGlAGr33bICLts85m/EZWUQL5MbWhgcLeSGv4jHUXuh5oLBoAn3HstEMW2OE9zy6dRHOlra2GEjBenT5pqkKtmwNKXs8ghAyB03li4yf3wjlC81s91zrA/v/kiXNr0OzTziARIzLLQYxLbOfVzA7AweWkrL1NfyOLoW99pqss/q4N5oeSIIW7F1qyht1Y4/Bm+oiyz2/Pdxxe5w7MzvKviM9v8X49zhsD284oHkPWJ85i75OXGP1DPoGbAR40tdRmExS2eIUKgzTa8e4ZclkIgJ4/BplqRKHUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(6916009)(66946007)(2906002)(5660300002)(8936002)(52116002)(8676002)(66556008)(16576012)(2616005)(4744005)(66476007)(508600001)(4326008)(6486002)(38100700002)(86362001)(956004)(186003)(316002)(83380400001)(31686004)(36756003)(38350700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTFtQ2VZKzU3aHRnWUQ5OGFPWENicHh2SVdvZG9HN2pINTZaSmZicXhVWlps?=
 =?utf-8?B?U0xMTUZBbHpacEthVkQxRklLS0VKcVdOTmRad2lYeXAxNmJld2NWVlpuSlh6?=
 =?utf-8?B?WTQrZjFBVWhocXpqOXZIN0hlOGRUYVZzRVUxamxxODJrU1JQSTBFN3h6MFd6?=
 =?utf-8?B?NmlqUFRPVFJrMUIwMGtjTlNVM1dFaEcyK25ibUF2RjcxL0JCbnBTV2tQRkYz?=
 =?utf-8?B?Z3hUbjM5ZU50cVdSVThpNXNWckZ1K3ZSNHVzWHIxcE9CZzhzOXZmV1FvWVhu?=
 =?utf-8?B?WXZwb1JOTFFvYlFxWFpBTFUwSjhEVVpRRGdQNkJQZUpnd01CVkRQSytGa0tS?=
 =?utf-8?B?WjB3aDlDVmtZNFBmVTFHNitydXN0bHAxUHVZOUpXWWJBL0JTUUlHYi9yVERn?=
 =?utf-8?B?K3dyTFVXRUNicTBmbWIzWk1meDVIMzlyN2VjbUtCY3V1OC9qQk5RMmtKcVFI?=
 =?utf-8?B?NjJscTJkZHNiTWhkaVpsclpzaTBGWUwreUcxK040VmwwK3NDclAvK2I5cGdD?=
 =?utf-8?B?dUUzUU1rL29tNk5pUVJKbWgwclRUVnk0c0VPOHJCQzI0SGdGOVUxSmpEYXBU?=
 =?utf-8?B?T0lWVjBhc3E3aGNGZXpScjhwOTQ2RXJuajRYUnFBTUdNR00ydFYxSWlnN0hH?=
 =?utf-8?B?amswR2NaRm85eFJMV3h5cEkzRmtNRlkxMWxlTk9hM0hhMkRhT3BMYThrK2Zh?=
 =?utf-8?B?bkxhMWUxQWQwTnM3aGlaMGg5TGxYeEh2Y1M4Wkdib1dWa2xNTW1OczZ1Vjhj?=
 =?utf-8?B?ajR5QzAzczQ2Zm9UZUpYd3REVmx1V1J6S3NseGxUeVNSOHhkTTVBelR2SmdF?=
 =?utf-8?B?SHl6VDJETStXQ0VVRFUwREhhdlNYZDh3S0lEdlUzVXQwak1BMFEwNURkZE54?=
 =?utf-8?B?eGcyeXN2M0NCUWtqaTkrOC9MWTBZWWhzbnJFRHNsVDBWNjRwZFBGU2NiZE5v?=
 =?utf-8?B?N2hlY3ZSVUdBUVE1V0QvSkptd0JlUmE5RG5ORmxLNUxKSWdOQXVQZnVUbnhN?=
 =?utf-8?B?d0VLSmpqTXdGd1A4c3hjT29KeXBsYktJc0tWUzFJRDE2VmRQb2grWWdYYjFM?=
 =?utf-8?B?WDkvNUNQTXR0L0ZvcU5BOVlPSnF4dGVsTmFpTUVBS1EzNnZZQ3BLdnpnK3lp?=
 =?utf-8?B?V2xkLzVJUUlyRXJqUjVlRHRpbWVxNFhGYTcybDIwSjlyejRYb2Z3dkNrYTNZ?=
 =?utf-8?B?a2tTOVJqNS9hRFUycTI5SXNvRk55aHFFNWFSOU9DOFN1dGtxdUlVTUx4SGlH?=
 =?utf-8?B?TVQ5VWxIZVh4TzRwVlpseW1CT25qdVM3UHBaWnBJc1lUeEdBSitsbEhybGNo?=
 =?utf-8?B?b0JDaTVtaXZpODZ6eEVCSmNCVkc5aWIyS2JuaTdVV2l5dVAzdWlsZ3Z5WGFs?=
 =?utf-8?B?VkluVVlQS0ZlQkU3eFRvRmJGZmRTRFhuOFdNUTZmaEpaKytKbUdwWjdYNVV2?=
 =?utf-8?B?UEQ0YjBwMkllVlFTeFk1YVg2NmxoZm0rWEorWUoxWkFwbXJOWWdlOXQrR2d4?=
 =?utf-8?B?RFI1c0xQWk9OSXRZWlNvZkNVWFhCTWpTamxBcEx4bWwyZzRlRm1HVFJDMDRB?=
 =?utf-8?B?T3RjbWh0bDMzL0pPOFJXNEVSM3ZTZGExb1JCcFlwUGpsc0hObm40VGFDK0hV?=
 =?utf-8?B?NS92NVFrZFR0SW4wb1M2aEFnYjVDdVhUNXJCV1k2UUVQOFh4eDJJNzA2N2hk?=
 =?utf-8?B?dFUzZGI3UlcvaStlelRIVVRQUnlBS1lHbDF2WWpUY2cvOERMOW5Za0Y0NEZx?=
 =?utf-8?B?N3Uxbm8wSVgyYVROVTZ6VXE0bWlkYWhlcW5ibURhQkdsTGE2WTFkb2JxdnZI?=
 =?utf-8?B?ZVZBbWRpdUNHMnFvdlVlcEtMMklZT2FvdzNPSHZDZFR4NWE3OURpLzRjcm1P?=
 =?utf-8?B?bCs0aW13S0JmS2dBSkR5V25YanY0eEhpOU9RV3daZEtucEtCaXprZlNqUitD?=
 =?utf-8?B?ZWFKbjVSQkJ3RGlIalBmS3IwMlZrVnpWdnd3N3JDcGFMQmNncFZ4VldTa1hQ?=
 =?utf-8?B?MFVFTUFqQmdyd0RzTGI0ZEpCZCtKNCszdFAvQ2V2dVNNWGJWZ2h0Q2RpVzJV?=
 =?utf-8?B?U09oL3RGeWpHaFBoWTJ4bTVQOFlHZzZYL3ZZODRXZFl3aWNhN0JmeWRWRlV6?=
 =?utf-8?B?aE5SYmJ4TVdUN2dtaFBsSTZaRWM3UGc5bG55T2NDcmplMGtYVy9XZTAyaGI1?=
 =?utf-8?B?NFNQcXhCWE5yU0w0T2RIRWdiajFOUHJSUDNzRGU5cWxVTGloWjcza0NjRXFY?=
 =?utf-8?Q?FaZOAN7iBm77hIR4h6hprjAN4+bpQhRHo7h/kr2g2I=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3aa6456-f53c-412d-0933-08d9aa0c33aa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 20:52:43.5514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZs/8d+oxWDSEsNdX44D1ibxylpUWFaaG6+pzCSDAEiLMQky2ndMT0QWVZwO9eZzyw7HLKq363fjX86zWGq9tzvGX7iZ9wDMlwh2Jxn5M8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3811
Received-SPF: pass client-ip=40.107.13.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

17.11.2021 23:49, Eric Blake wrote:
> On Wed, Nov 17, 2021 at 09:04:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 17.11.2021 20:02, Eric Blake wrote:
>>> Now that the block layer supports 64-bit operations, we no longer have
>>> to self-fragment requests larger than 2G, reverting the workaround
>>> added in 890cbccb08 (nbd: Fix large trim/zero requests).
>>>
>>> Signed-off-by: Eric Blake<eblake@redhat.com>
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Any preferences on whether this should be in 6.2, or deferred to 7.0?
> 

In my opinion it's good for 6.2, if we are not very strict on "only real bug fixes in hard freeze".

The commit is obviously safe: if it break something, it means that feature we already included into 6.2 is broken anyway :)

-- 
Best regards,
Vladimir

