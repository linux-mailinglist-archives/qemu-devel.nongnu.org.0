Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C84361B4C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:29:25 +0200 (CEST)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJqu-0002xz-Bx
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJjV-0001iV-B7; Fri, 16 Apr 2021 04:21:45 -0400
Received: from mail-db8eur05on2105.outbound.protection.outlook.com
 ([40.107.20.105]:24544 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJjQ-0006Ie-Ob; Fri, 16 Apr 2021 04:21:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBn1W9R/HqavXGl4xSicawL5wTYwLGTZnuwW5ybIpo/pwIKKUV+izHjEWfeKoLdigacphRjm5gvx/1XdmHtM2bB0eywyDWt/a1qpoQw4sz88Qi+99ncn0KRmvkQb2tZYNxcnE0mnitq5ItvACVzwFwvfUuSUCI9BS+8bOUUs0VoIy8slB15FLPktDjjh53gGicot6VkiFVRRIHihiq+kBvnOnNjIOy3fMHdXcxQl2kX4cjOfTcQhLwm1InrPCnp5GBgRFphOGhMZQMQSS4ws52bBxe9QuI+0861HFQ245WEdnq6YUAOrH0FccAQww/1C9I4bDOTKFnRsw1neF3R0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nddi2YWgBOhjM8wzV5eoHubHnN4nmsB+zDLS+c8HD0U=;
 b=lF2V1j+oHpDRQ2xVAMhxmEhcooNnY9tJE70MmRdXCkBGjM/RkXYsuYIox04ScgR/WvM14wOZuQqJMVXPGs85g2d0OL84JfMiy1Vg5YEttBM4KPHO9ODlUb4265pNmnTKrd70wrTZEpcg8aFGbEKl7UAG1ghi/clz2TSIKWgFike15Dv2IwWKXZTqH8ZNUtJ96dtqczlJ5XCSZPwdLarMhpkoofNRLb6P2hrjxmMmxbryWdAqFpYSMxbaa9UDrIxC0wq0rllAZJU1X5Ri/uuXJVSML2vika7Gt+SBklX1pLbKDpD4NEVEjVbgR804q2NOibP3axapBThOazhm6pY4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nddi2YWgBOhjM8wzV5eoHubHnN4nmsB+zDLS+c8HD0U=;
 b=t6ljGoeK/BnS0zlQ+VT/0PlVTFhrk55BxBQf3dhywWBNkgdoZmm8+7E7ok0qEg4yohBWVmdMm9R0KHvDsmehTce+3fxVaJFOFY6LDteUmq1NVMcWen8hxQKkyT3WG1JI7QyD1tWhmiLWQzVk/NZIKyKTMqxWp/n7iqQ70q3AEOw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 08:21:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:21:38 +0000
Subject: Re: [PATCH v3 33/33] block/nbd: drop connection_co
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-34-vsementsov@virtuozzo.com>
 <cb5f5d0c-0ec2-c8d3-9077-5ed006989371@virtuozzo.com>
Message-ID: <60b083d2-62ae-425d-ece9-31dbd4ff9692@virtuozzo.com>
Date: Fri, 16 Apr 2021 11:21:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <cb5f5d0c-0ec2-c8d3-9077-5ed006989371@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: AM3PR07CA0102.eurprd07.prod.outlook.com
 (2603:10a6:207:7::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 AM3PR07CA0102.eurprd07.prod.outlook.com (2603:10a6:207:7::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.7 via Frontend Transport; Fri, 16 Apr 2021 08:21:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1903eca-c4fa-4441-23e5-08d900b0a81d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60699D58CA84FD9C1FA761F0C14C9@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rw+DPQ/5KaHbEyU1LvkUHd83IuXG3UZu9dtO17EWKTLzivJrR1dOCMHGQt334Zb+43lO+AWvXeWEaBCXf4vlt6x7zGTlhtJ/4TG4xcbeugTthx/HR4iUYsOjTMP+9bV4GhRea1QylsQhkgDLKCCbERFKRZTXD+AN1Hhr2iCROX2nSFz+oyVcz1fZgS01bSHrtcN6QQ38e/TjTwwJe1QGpTWGmwhLjbwwxIn8IjlvYiTYg/Tq7NdUmxMXUUZlECoSf13Pz6weGHMx78lzNUPxnAuwVgEm9v42eMTbgLP/eayN6LkDiqKrmOurHnHx8P3pD1WW1a7KqMxIfRhOYrvs+VV3vqSHLU8XP8nkGOeORomA7ndxztc4Vwfaw50K1swVR9tpfN2nfcEtfb3Fdga3RlbuzLuvN7i9qGdCyhEcmvSH/Cv2gJotAtn7hmrl2B8lCfbUxKYIjk7rj3ns8cAUN7tA1TugfAVHxeBvu25lmPDUC7aWJ4GKL+lmz2jMJiO0vxkzjsc5mowEqLP0R+0CjMaaQVfYpguPjFGOPbEqfcX1VggmGnU6K4jWRNtv+v4hsyzw7Nd0+2uH5Eo+JvBZKRnc18OmQGrC/RXy0HdDQWYFrBTlg63jcot2moLs33ohTeUzx9RMHBPvB7s0KvqS554/F2IlGyRGfDOSlXTQoFEgjxuiShoGdWAjxNUSq/oUjp8JqZIa5RsXChexr9I+1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39840400004)(376002)(31696002)(2906002)(36756003)(38350700002)(66556008)(5660300002)(38100700002)(16526019)(86362001)(26005)(186003)(66476007)(107886003)(66946007)(16576012)(4326008)(31686004)(52116002)(8936002)(316002)(2616005)(6486002)(478600001)(956004)(83380400001)(6916009)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wnovcy9JSEFSWjZKVW02RlRuTmRyUkFtcHM2VDB0ZGJkblRacGdORlBPbHJL?=
 =?utf-8?B?UkJPcldKOUxOeTN2REdWVVFIb2gxbTVHaXVpemxwQnlKcFdyRWdwaWN4aUlY?=
 =?utf-8?B?cXA3blIzLzk3ODlPYzlpYWRnWXJONyszREZWbUxYbDF3b3h1d2VXejhRMDZG?=
 =?utf-8?B?aXVMaW5pUXVMSU9LRXNyQW5ibjB6aGREU3g1WTY5RVZqeWNnNFVxbFJvOUVn?=
 =?utf-8?B?S2F3dnhZdVpUZDZRQ0RWZ05uS0pZNzVNOE5rdktPbmw1emhhTXpoaEQzTlB6?=
 =?utf-8?B?OHVRZ2R0V05IcEVRZThNeGNXUXIwT0UyTXp1VDJMcEhMM0FnejlnZjhyRklC?=
 =?utf-8?B?QVV5Z1ZxWUgzSHVUK0hjVVlocGlwS1g2S1hSZXpjenRFOTBaY1lPRTg0WXFL?=
 =?utf-8?B?bU5LQU42cXRFMFVRRW5XUHQvNzNVdDk3WkZlVzlhSXBrRHVObEJFNHFUS0ht?=
 =?utf-8?B?VjRLdmVpL1h3WjUwNVZ3emtMRDJuUFYvUkwyZWJEbFdTRG9ma3lFSXU3anJi?=
 =?utf-8?B?c1pnWE02SEJJOFpQQ2thbnpxaENGc0hncjNBNFE5WkUzZG9ieHZlK1FhR1VV?=
 =?utf-8?B?TisxMFFyZ1VEZVlEem83SlBKcEk3dlNLK3o3cUpqRFBobVlkaWlPMm5uT3dT?=
 =?utf-8?B?VnpNaXo2SndFN0J3elNEcTFFRzEvK0hyM29GWERuK2h0MUFlRUtuVDRXUEh2?=
 =?utf-8?B?Z1REa1liOHFLYjd3My84RDVlRkdoS2lvT01qaDdFWHBNcURvTjQvbXFxamZi?=
 =?utf-8?B?aEUxTWJxZW5zalJyemF6emxrU0JyWHBWdnVLYU1vUzY0Y2NSRTJLTHp2L2J5?=
 =?utf-8?B?ejN3OERoQ1BxWHVJRERFeVBwS2NuMTB1MnBDdjJvZDlCKzJ1MVAzSlVDSHNT?=
 =?utf-8?B?ampBeGUyMy8za3ZEWkdqNW5Kd3NkaFh3YTRpSU03U2pSb2dhUjFYRDF2YXln?=
 =?utf-8?B?bVY0cDgrN1kraVl1aDVwbmFyQk1kcHZsdVl0V3ZWNlI4OEhPWWROR3kyOHJC?=
 =?utf-8?B?Uzl6bk56alVNOG5Rb1QrOEJjUVpjVm9yTi9JdTBNU0lpUXJQcFAwY3pIbU8y?=
 =?utf-8?B?c2plRUp2bWY0OE5VS0x3VmtGbjdBUFJXd1E5UE9MT09TVXp2S3Btd0Y2TDFD?=
 =?utf-8?B?MHJwMk5PVE1jRHd6NmZIdytNaGtRcnh3Yzh4dldDUkhFM3EzVHBUcGFseDl2?=
 =?utf-8?B?NTdoM0JmUWlDNGNxazV3MmMreVA5S0FHSjZIV09acVE5TmllT0NGVDh6MVZj?=
 =?utf-8?B?eTJUQStWOEdRWlZieG9SYWRWOVpsQVFjeDIrc3V6SlNVRlpHYUNqdkVvMTJO?=
 =?utf-8?B?SDRPUmlIU0VLSkpnL3hxeXRYdE5aczFIbXk0dnY2L24rcXMvajZGclpRSmd6?=
 =?utf-8?B?b1VyOTR0K0hxL1dLUTVKZHFTUHlCa0NubTkwaEUySHlqZ0x6Rkh4WFd5d0s5?=
 =?utf-8?B?K3VrSkQyaXRXYmZBRVhMRTNCQ25pUktRMGdwbVB2NDMvNFhkRFI0TXpTazY1?=
 =?utf-8?B?bUJ0Z1R4L29Wd0dBMW5jV21jTnFIT3FHb2Z1RDVRVk1zMEZLWXYrbGt2U0xH?=
 =?utf-8?B?SFV2cDNIZ1UwTStod3BYWUN5NkY2cnNYaHlPSjhnaXVnNkszWDgyR2tlVnNE?=
 =?utf-8?B?cE5nbjl4TEYxUUhTNUphZ0RHN255RVhSOHlOS25LcHBuSStpVHdSRWJ2NjBU?=
 =?utf-8?B?WENmaUdESThOMVB1TFZZam1PYUU2VStXYjljRExVMnZvWndaZU10WkRkSFh1?=
 =?utf-8?Q?bc3N6U7vYnp9833xHteMOnlQg6flkIQyT3WFBU6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1903eca-c4fa-4441-23e5-08d900b0a81d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:21:38.5387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGFwsYLiFO+Zhv2+W6wj3nsrohYmvQhn4+lvpEMOsId0m1x5qSCrJudBKE4JalNnbZmfd+F/MzQmWtctYtrQF+/k+EJ2XIxVbmvh8Pk7LKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.20.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

16.04.2021 11:14, Vladimir Sementsov-Ogievskiy wrote:
> 16.04.2021 11:09, Vladimir Sementsov-Ogievskiy wrote:
>> OK, that's a big rewrite of the logic.
>>
>> Pre-patch we have an always running coroutine - connection_co. It does
>> reply receiving and reconnecting. And it leads to a lot of difficult
>> and unobvious code around drained sections and context switch. We also
>> abuse bs->in_flight counter which is increased for connection_co and
>> temporary decreased in points where we want to allow drained section to
>> begin. One of these place is in another file: in nbd_read_eof() in
>> nbd/client.c.
>>
>> We also cancel reconnect and requests waiting for reconnect on drained
>> begin which is not correct.
>>
>> Let's finally drop this always running coroutine and go another way:
>>
>> 1. reconnect_attempt() goes to nbd_co_send_request and called under
>>     send_mutex
>>
>> 2. We do receive headers in request coroutine. But we also should
>>     dispatch replies for another pending requests. So,
>>     nbd_connection_entry() is turned into nbd_receive_replies(), which
>>     does reply dispatching until it receive another request headers, and
>>     returns when it receive the requested header.
>>
>> 3. All old staff around drained sections and context switch is dropped.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> 
> Please consider this last patch as RFC for now:
> 
> 1. It is complicated, and doesn't have good documentation. Please look through and ask everything that is not obvious, I'll explain. Don't waste your time trying to understand what is not clean.
> 
> 2. I also failed to image, how to split the patch into smaller simple patches.. Ideas are welcome.
> 
> 3. It actually reverts what was done in
> 
> commit 8c517de24a8a1dcbeb54e7e12b5b0fda42a90ace
> Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Date:   Thu Sep 3 22:02:58 2020 +0300
> 
>     block/nbd: fix drain dead-lock because of nbd reconnect-delay
> 
> and I didn't check yet, does this dead-lock still here or not. Even if it still here I believe that nbd driver is a wrong place to workaround this bug, but I should check it first at least.
> 

4. As Roman said, there is a problem in new architecture: when guest is idle, we will not detect disconnect immediately but only on the next request from the guest. That may be considered as a degradation.
Still, let's implement a kind of keep-alive on top of this series, some ideas:

   - add an idle-timeout, and do simple NBD request by timeout, which will result in some expected error reply from the server.
   - or add an idle coroutine, which will do endless "read" when there no requests. It will be a kind of old connection_co, but it will have only one function and will be extremely simple. And we may just cancel it on drained-begin and restart on drained-end.

-- 
Best regards,
Vladimir

