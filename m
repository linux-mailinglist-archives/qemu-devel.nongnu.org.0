Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535253A2B2D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:12:27 +0200 (CEST)
Received: from localhost ([::1]:33648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJXu-0007aR-D1
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJW1-0004mV-KD; Thu, 10 Jun 2021 08:10:31 -0400
Received: from mail-db8eur05on2111.outbound.protection.outlook.com
 ([40.107.20.111]:58848 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJVz-0006xh-Lw; Thu, 10 Jun 2021 08:10:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfkZLtaIZn7+a5Mn2dn6OkzruagHfGHE2YWHbwELdIFT7u8EVOEh+PqplApDISzy+DcmizxHUbe5eZrAaxauQrDbjakZsV5VU336u/KlJF4lDX3tsTTiDgVZXGp1N104BzNRMTA91MmxlwzXVceMmXcUmcDtYppZhpyLozS2+dsz/8P4LeqFDVM0FjgmYiX/1SxR5BGwXqq09yyJu8WQvf+uCXcHHENIeWYG8YGNgTeKLAf6Ou/KcKpd++nJzsVU56XfHkup6qWZHt/bXzaOqvtOMluzhbA/HtQ/8fRJhlnDvY3RbQ4bLXsLE9IZ4Y7kpRwiki2zXoL+JpfMqQsJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emqCh2WdmKVspDl12iDWzaMZGlZJbcvkUTLUhsUFx/o=;
 b=CJoW3CRdkFzI4aXXZEvS/bLkn5fwn6ck2Hu3Ls3QyVPC0Qx++9+SpGI1PM0z8wkz2VgS8i+Vn7ThEdGUPjDA1pun76PxMZs5B2osVyuiDGtsoIPyCNbvyCn/07umY8I2HxkdRrCdCZawNqMAn/PZvfvlZF/IFLtOvUWb/mVI9zImHs/h+9ga/vpU4RhMlpMhVy7T3NJP5lDZWQVWzJxr+dzJdsALLuUiYeuOPLoWa+FFSLaKxZpefC5s3q48IeO8/LAs6T9I8bprqFVm4XkZH0KVgP2jtxYmz+Ck5bSfNAWEv+ga+a8Q21rivEKgC2dyDNqkCZj+uvu5Ms74WURmsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emqCh2WdmKVspDl12iDWzaMZGlZJbcvkUTLUhsUFx/o=;
 b=jKZQYrGKFvLUMT4bcOB+Kon/pDNWsK51+0vQt69T0aMi6OrRDNJUxzWJ4uJ8+vOyWsOHwCLneXwK/EukV1iS1CLiFUO01dC5wnrO9YpJ7jawEO7YMIwwUvE8KTTtPcTqlXRoZW6RZyeicDCwrG5Dbttqr0YbiVSmzQ2J0j/8L8g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4599.eurprd08.prod.outlook.com (2603:10a6:20b:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 12:10:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:10:24 +0000
Subject: Re: [PATCH v4 0/6] Allow changing bs->file on reopen
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <b2420fae-1ce5-ee5b-792a-ede183280ec7@virtuozzo.com>
 <YMDkCxp3PD9TmMwp@redhat.com>
 <66ad2cc8-00bb-a84c-f187-9886851f8468@virtuozzo.com>
Message-ID: <146e9b38-10d6-474d-1088-43233484ad61@virtuozzo.com>
Date: Thu, 10 Jun 2021 15:10:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <66ad2cc8-00bb-a84c-f187-9886851f8468@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR02CA0197.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR02CA0197.eurprd02.prod.outlook.com (2603:10a6:20b:28e::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Thu, 10 Jun 2021 12:10:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d493c92a-d9c5-4423-8da6-08d92c08ba39
X-MS-TrafficTypeDiagnostic: AM6PR08MB4599:
X-Microsoft-Antispam-PRVS: <AM6PR08MB459902D815780C20DBD72E92C1359@AM6PR08MB4599.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aoTekSekpwt0qtTCFUKbYXgTssU7lEhK0+3Ce/MWGpnDlre3JWEG6RLO5imaq4wsSwtF5JAqlm/PJG2j4Zp5wIod2Gr8Sc26ExwLRWcfuS//a+ragy9AWAFc0O9zn0o25Dp3JMOF7Xpq8Qu4eucLFtnmetR2BU9zgJ26qxnf3waLqajQqnsSRLr7nZlx944VbDZCzpIz7POUPiE8rGVm4J3m20X35kF3Mc3bKyyJLbYA0S9sn4pgDPqtXIkfXrUk5pZnb7Ytm/7cIhgyxfKkA8TsiIoAb3vQLk461WqmwXS/erTN81oK+ju59u0FknrPJGPDfsMu5IkyqwTHm5/KpzYAohSZC2rqh1pX1zEmLOBlM2OUOfYFKxD0Ui+sm+ks5dWcFHyZ/06yZhSTzVNnMxOIauomkxeUt/qfCrXsGQkXl8KE8PiCNGuPUKILWqlCujuS/nyTfudSXbYCF/rdve6d/vrXPBfIjEb/OaUVyPV0W+gunrq+RhoWl4vyiTkB5CCqq9Jvh9wd/Whv43tdODc2Q1L4Yi5SXSFTtS+WDvygJwUmluuqA9hKz2GA00eXLZtteQEKzkKfhlttjUoYbgrSGCoZM3mviXxMDa9pS87crHSJNu+Lte+uR3QCe+Nz+GhKUT1TjkOKcJ56pKc+vTFnDTMyuXsQrzZqaF519AycAdNQtZWW4A1Aka1mwXICR/wrvHH0doXAj9ocIoFeBQDStbid7k4mN92t9X4FO6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39840400004)(136003)(36756003)(83380400001)(8936002)(66556008)(478600001)(66946007)(52116002)(31686004)(66476007)(86362001)(8676002)(956004)(2906002)(31696002)(6916009)(2616005)(54906003)(4326008)(5660300002)(26005)(16526019)(38100700002)(6486002)(38350700002)(316002)(186003)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bkRRWHFVME1Yazk5dnlxZnd4bVoxenR1SVMyYWhYbUZDRmlDdGhwcEJRRGEw?=
 =?utf-8?B?aFVEQ0JhUXdtajVZcmpSdmFiMlM4b0IzbzlaUGpYR0RhKzd2M3RsbkJQa3BZ?=
 =?utf-8?B?OE8rc0FTcGNtSHdQR2ljYmNxUmI0eUhhWW50MVAyRi8wV3FOMkxBU29aelV6?=
 =?utf-8?B?T3BwZzdxaENIKzNtS0d6SkFvV2pMa0tBc1dDc1ZpMERJR1hqVnJxejFaM3pS?=
 =?utf-8?B?UW4wTC9iVkhaMlJ0Y0VRbGN2OTh2MEI4UzY3bnA0VFIya0prNVJ3RzBhU1JL?=
 =?utf-8?B?K0dudGYwN1pJbjcyTk5vaUFyUWl0SG1hQjdrbThqempDem5ZRkxwS1pnenZG?=
 =?utf-8?B?WVRtR2VPT1JtNkcxY1JZdUdzalZvQmM1cDZUSWlRTDVXSVVYR1drZ2FNM2Fv?=
 =?utf-8?B?VUlnN2lzUDlEOFpTV3lYT0hKOC9nc0l6dGtodmNHbVU5Yk1yWjFXN2djdlFu?=
 =?utf-8?B?Qkh0dnl0MWtqZm81Tm1XR0FwSXBua0hnRnJKQVhFbGlMZmRWMnNEU0NWYnhQ?=
 =?utf-8?B?a2pWT3Y4NFZVSktaS2c4d2xFbVZES09odno2NGphYU9PVklock9PWWNkYzJn?=
 =?utf-8?B?RENIaVR5MjhodTJ2cUlCSk9uNjF0VjRXN1dCN1FWQ3VXblVueTJ3bEk0RFZL?=
 =?utf-8?B?QXhjZTFHYk9lZHJjMEtyeG5Yb0daMUF0d0tUZjRneVF5V2RKZUZuTTUzU2Zn?=
 =?utf-8?B?TmhLblVtYklaSkJSR0xJR3VGSUtHWDRiR2J5TlpmZkp2SDFTdjNJVHpnNkE3?=
 =?utf-8?B?RlBvSVNyR04yMkhJN2dsdUc2R05DT0NWa21XbWJDanFvcTZmRjJ3eEVEeCt1?=
 =?utf-8?B?dGhKQWdZL0dYR01nOVFXM0xjSjVWblZ0c3JKbEluZDBnUS9QVGdoeFdQTk0w?=
 =?utf-8?B?cEVSUFNYS0IwczJqTHl0c1lsTFptQkQ0VUlUS2VENlJLTGdsdDRlWGs4NFdm?=
 =?utf-8?B?a3dKZmpPYW1odWhWTUFyZFZNbnVTZFdOa1R3RWZXRjhVWitLOWxXOUdsV3ZX?=
 =?utf-8?B?WWZtNG9OU1NvbmM1blF5Q09UdkdWNzE1NExCcWs5S3RhaTRhUmM1RHlVTCth?=
 =?utf-8?B?aHpickZEdTdTTkk3SXM4a2t0aWlqaktjc2huMUhQQ1FFNzR1bmxQUW5KYjdx?=
 =?utf-8?B?WFV1bVYrZUd0K3Q3ZG1ERlhLSjFSOTdtZ3JjbVRzNytjNVYxTlc0K3Z5azlz?=
 =?utf-8?B?K0NhZUlPeFZRU0p1K2ZnWHFuTWREYTByQ3FMdENQckx2QWJPdFlYY0FqbDIw?=
 =?utf-8?B?dXhMVHFrVVg5UDFyQW11WVkySnpQZ1lrNDcwRkVNZ0FKcEVhTG1Ia0c2VG5H?=
 =?utf-8?B?SkM1MVBta1YvZllaOWQ0Nk9xQXp5YUF0eW5kMHp3QUVPajhKb05pMUd6dURl?=
 =?utf-8?B?QmJ4UVZBai9QLzRscmg1ekFTTjBtQ1c5V1dVd2I4VVNTWDhIQm9CUjhXdzE2?=
 =?utf-8?B?Zk9VWm83R1ptZVk3cXlZOXcrc2ROekVxc3RvVngyRVVxeG0zV2ZPTFMxZUh3?=
 =?utf-8?B?Nk5OSVpoTU5kQVdJL3gwZkY4RGRPVmN5THpzOG1LSUZJZjhqZ29RMHRTak1t?=
 =?utf-8?B?UzJ4cDV0eDdsUERta2VJemxOeHZDQVdWaEFJSFA1QmlrSWhYSmdMVlBmWWJH?=
 =?utf-8?B?NEpmMmtDRzZ0YU8vYm8xRW9ZR2JYaUtINVBIVjdEcWUralI0K2tWZVk0aG4w?=
 =?utf-8?B?amFNN3NHMVk4SXp0bXR1OUhGUHU0KzFsM3ZNdld3VG1qdzFQWHJ5aVJzNjZO?=
 =?utf-8?Q?cXEPiKdc0Aeo9iVNfK9rGFUUM5uH6vcA75JQdK7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d493c92a-d9c5-4423-8da6-08d92c08ba39
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:10:24.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YGZGGepnoAo4lfuEdXQK1nP5qpZG/3uzfgL1MAp03J4BsO3TJ/re5vLLOH5zo2pdITCezj1xo6fOwxCorzPU0/eIbH29FA/DllDj54ATbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4599
Received-SPF: pass client-ip=40.107.20.111;
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

09.06.2021 19:40, Vladimir Sementsov-Ogievskiy wrote:
> 09.06.2021 18:53, Kevin Wolf wrote:
>> Am 14.05.2021 um 17:53 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> Hi Alberto!
>>>
>>> What are your plans for v5? I'm now finishing a new series which makes
>>> backup-top filter public, and I want to base it on your series
>>> (otherwise I can't add a test).
>>
>> Berto, where are we with this? I see that Vladimir picked up one or two
>> patches for his series, but I think we still need a v5 at least for the
>> rest?
>>
>> If you can't find the time, should someone else pick up all patches?
>>
>> Kevin
> 
> My "[PATCH v5 0/9] Allow changing bs->file on reopen" supersedes the "subject" part of the series. I think we now should start from taking it. Hmm, and I should check, does it conflict with recently merged block-permission-folloup and with beginning of "[PATCH v4 00/35] block: publish backup-top filter" which is already almost reviewed by Max and should land soon I hope (ohh, seems I should issue v5 for python conflictes).
> 
> So, I propose the following plan:
> 
> 1. I'll rebase and send "block: publish backup-top filter" series today-tomorrow. It's big, and mostly reviewed, let's not lose r-bs by rebases.
> 
> 2. I'll rebase and send if needed (if it conflicts with master and/or [1]) "[PATCH v5 0/9] Allow changing bs->file on reopen"
> 
> 3. Then we'll decide what to do with the rest. Finally, I can take it if I have some time (the head is spinning from the number of tasks ;)
> 
> I also think that we can drop x- prefix even without supporting of multiple reopen, and implement it later as an option. QAPI interface is powerful enough for such enhancements.
> 

[1] and [2] done, patches sent. Finally, "[PATCH v6 0/9] Allow changing bs->file on reopen" depends only on two first simple patches of "[PATCH v5 00/35] block: publish backup-top filter", so the series may go in parallel.

-- 
Best regards,
Vladimir

