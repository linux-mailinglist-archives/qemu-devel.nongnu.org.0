Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6AA687EC7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:37:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZl3-0003d3-PR; Thu, 02 Feb 2023 08:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pNZl0-0003cd-L6; Thu, 02 Feb 2023 08:36:07 -0500
Received: from mail-vi1eur02on20716.outbound.protection.outlook.com
 ([2a01:111:f400:fe16::716]
 helo=EUR02-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pNZkw-000518-0S; Thu, 02 Feb 2023 08:36:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gN1E5zlPpV46kUUOLv7F6VfZlUDiwv56gjFzTGyi/QIxr2hol9pAN3jcetSruzSCGZSemHU0xD38VN4mtK5wZgjlChTZP+kHNNC1s6755AYz3k7ZD2x357K1Ako6lOL3/BXP15bwfZjmMEWOrfWfsO9kqXN+65SeynDaRRMGWZYH8WDIxeBnwfBpCHMKyrTAJED1s+a0T/ATio7YZWEGKs1ujrsUkvzsnr4/Jm7Znw8TZz6aEZYNMcQV6upGsNxOdHM645x+Sxttd2xSAfxwV1GMTJw5HonVZJnYd/7hTL/vYunlNKBWhZ/qEAK9z+ratWsv/zjnfBJ7U8U51q1C4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sgbsWPbZwOYHUZuKwAex/MG88rz9VsugNABeaBJ1JI=;
 b=Y2tV9xEa/0NC7DK1S116PDAo+kKEPP9seM5D2Whjpik0LFdiGySS7AXRkmEqIOp2lek7Ca2RGRttQ3BlZsfJmqY/VxJAKTMYiYjCabI2oFAk9nRVhD8MkvYFcLGwqCmtJGRoCjrt6raoKX1vhIkGyfwTxugXvZger+5i5adEYzrB7YKf3ehdn5cunUKXIptAzPZy8WNhbjP/nCFZMoFrdcetlouYGGrHKkjO4XCm4zd6t9y4k+uOVJZjbR9e/TOLz6uSkNDmv5mR1oGsqdOTwWhwHjXi32PLBmfBLd7UfTk+j9cNVoWUc5tXRuYEAh98XrHfYyNgW74wIAZoy9dkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sgbsWPbZwOYHUZuKwAex/MG88rz9VsugNABeaBJ1JI=;
 b=Dn8LaC5kJaFCw2y8nLc3HPVEJnO4sYNaFgfr7b9+OcbhzTE/H/LvVfhchBH2lhMzmLiyXXkPawEwYmpAykxx1KFd9NhvKode7VS8qfKgiOtwTXdmG89Y7eU8/DV/NYO6McyBYjZwD+13HmJ+Lrzyyn096g7wxB2TFgFUXvO0U3i9slBJBdO4W+8q4VBisdtcStz/Zmvi7XTKRmyuei5035gYzO1wCz5T9cxLdXNUcuMpEPJkEVOeSCzrRJtQ/jSBSDmT3/HN8pUQRyDDFFDBzoo0k93j5vARNly6a5ICO/1UXIL+ZKLb71McnRX0loTxXy36KUi3oBuL9d1DYD/NNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PAWPR08MB9856.eurprd08.prod.outlook.com (2603:10a6:102:2ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 13:35:55 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 13:35:55 +0000
Message-ID: <67fdadb1-672f-776a-2ce6-631cba19171c@virtuozzo.com>
Date: Thu, 2 Feb 2023 14:35:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, t.lamprecht@proxmox.com, jsnow@redhat.com,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
 <Y9uf1wlXQd4EIwxO@redhat.com>
 <40969191-9a16-0550-e999-bc44584d81fb@proxmox.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <40969191-9a16-0550-e999-bc44584d81fb@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0501CA0014.eurprd05.prod.outlook.com
 (2603:10a6:800:92::24) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|PAWPR08MB9856:EE_
X-MS-Office365-Filtering-Correlation-Id: ecdbdab4-d23e-4e40-71e3-08db052268c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJvYGHlf4ZYEte0e7xhEPqXgDViEC7wKIvT7adO81aa70W+jgzFusYRe/Iq9jOsE7L9DY4WB3oR68s4EQQonBqN2YjQVtl9Tyu7gsNR9FV8QAOAIvdj46sdzlIqD03ymDnL1plZPcyeri4d3J/IxKmP3++olBb3IAEm0fh6yQLdwOIqDWmv3ZND+y6wlBmWbQauRsN3QetriXivh/nTZ6QR2iyuNLe/ZO2UxVCXe9mj0frR9Wqj8yOKF2jYVM+SFXTg0lVf+prx3UTf8IEp4/hJJDbKJIwjHEOkHGWDodox134+Nt7pcZNcRcYcQBbwlSVt3n8QeLHpz8eOQGsisAD6KOKFPlmAqrk+IRUxXQne0ZTHckqJ2SiiTF+TycHxjSPCNj3tsksnVJJS6u8sCT4JPe4v40R8j9IrlBxs+2tN7VOfea9WwtRHcGhUmpnPKIKkFgaUCszrX5xFoVgW+Hxbif1qTGZtWl7NA39xVfprbPvY44f5Mgi3dB2jqyE4JhUPoXX7USRoSx3ExhGmZU4Vxa17cucA/mAqW6XxAXctz4apWYH9iPXn90QVUilx3oprIMQzppfJs6Y40yoEg43UCbHisja1CLzRx2tFbMwNbmI3AuAWhXCeOT4ChYhdlD8xQLfB0NBil+u5lb96+XLiai36ljn+e2OdB3XN4EILy2FkObAHw/TstzL4x2YiGwavBjqhAPEdpJ8jmCys1nZkRTBkFU3KLXLCWHwhzda4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(39850400004)(136003)(376002)(366004)(451199018)(36756003)(6506007)(66556008)(66476007)(66946007)(38100700002)(4326008)(83380400001)(8676002)(110136005)(54906003)(316002)(53546011)(478600001)(107886003)(26005)(186003)(6512007)(7416002)(6486002)(5660300002)(86362001)(41300700001)(31696002)(2616005)(8936002)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDV3RG9Ta1pkTERBcWVUbDZ4K2ZHYURBejY0TnBsdUhkc0UrK2V4ckcvYzJ0?=
 =?utf-8?B?REN4YWQwQ3J0bkdjQWJMVlZrWHVBajYvRFNsa21ieTRyMWpGUG1iZ2p2RHpC?=
 =?utf-8?B?L3VQbjVTUGd0RVhPWllMeWJOOTYzbGxRM1ZSMzA0UjQvS2RUOWdzK0Rpd1ZM?=
 =?utf-8?B?Qjl0NURveXc3RzM4cVVNTnlkdHBoem1SaE92YzZuV1ErWllJeGJqbGFPd0ph?=
 =?utf-8?B?Z3dJU2tNT0JHNEJmYWFsVnFveEsvRzcwUEhnREphTVptelUwK2krRmU0dzJ4?=
 =?utf-8?B?TWJyc0xWb3daVTE1SmNLdzZicDRhZUpXa3h1bGVCbzBRbDRsVlVOK25FWlhS?=
 =?utf-8?B?d3BCY2dtWHJmOWdDMFFQbmtyRWUra3BBLzd5SythbTNxcXVWbkZMN3l5M3Uy?=
 =?utf-8?B?WTVuc1Q4R2FldkxWT1drYVRhMy8zd2kvS0psY2M0bGRvWERIRGRPd1VYU09Z?=
 =?utf-8?B?ekRVSVNiR09UNExCNmQ4bTU1TURHZS9EbzFZNU9ScysxNjdpZ09sQ2NJZkN2?=
 =?utf-8?B?Nk4wVGc4d250QUlnSFB6Qi9mSHZIMERwT3dyTXpGOTN4TjJLMHQreGVKYmYx?=
 =?utf-8?B?amZLTmMzN2FOOGF5QXRraDQyYVpIcXk1amtKaXhoV0NMWWFoY24waGFVRkQ1?=
 =?utf-8?B?ZllReURvRmdkbVo2dTRsT1Fmc2EyZzFyM1MyMkQ5V1htSGd0dmMzSnFuaHlB?=
 =?utf-8?B?QWU1MHFTRm9IdUV6YUdZWXZEK2l6MlJTeGl3dGFwN0s2TlpqMU1BZnpVWDNK?=
 =?utf-8?B?ZEh2U2pOblkvNDdtSE9weTB3OFdjK09iOEtyeGgxaTUxK2Y4WHRkWEhhU2di?=
 =?utf-8?B?eTZHM3lwRU9Qc1l5akNBbk5WanI0aUphMFl6MHpDZzZneXRpMVVvcXRVTHQy?=
 =?utf-8?B?dUVhbThFVG5iVWJNVmtIUE5IOUFDNk5La29sZlpzb2F3NHJBaHBUV1lNdUk4?=
 =?utf-8?B?NVB3UVdBMVNrYm16bGtuYktyTUJsZlhuOUtEdEh5Q2ViQUx4RWZRRFU4VzBK?=
 =?utf-8?B?cS9YQjQ5d3VGQ3FsVVArTzdqWHpFNU52RWgyQzhoVTNMc2hvT3luaURhMmhE?=
 =?utf-8?B?OGVzK00vL1JoSDcrR1FtOU9mL2F1VUxKZVl4UmdJK25SVktIUVZ6TUdzUFow?=
 =?utf-8?B?aVhmSnVxdCtoU1hHN2YrQzkzc1cwUTRQWnZIMHdiSEZTbGpnQmkyNUhjNitU?=
 =?utf-8?B?ZWpzUUltS2hRbDgyMDh2cnRRM2M3a0dIZzFXbm1VT1puNGpCaDM5SXBMSE5V?=
 =?utf-8?B?SmFXVS9JOTI0RVhXdThDblhjWnRxdWF1L1o0aXpWeG0vYk1vbm5hKzYwcVYx?=
 =?utf-8?B?UlZ4MG4vZ2RJV0tBSHRpWnVjTlpSNkpvanV3ZHVTUmlFZ0hCcWg1ZkhuSHR3?=
 =?utf-8?B?bVZuanRFcVo3alpHM0pPYTdhc1ZSTGlHSGdkSmhOMzhVdTdPNXNXRDFNM3Ew?=
 =?utf-8?B?QU5yYTNFQktkU0F1YU9sc0dwb0YrZUZLeGJFV1lXZExrRzlMM0EveG96QTBm?=
 =?utf-8?B?ZFQwdnZWT2ZDN05lSXZKaUpLd1d3Zkl4MVRwcTdiSTNMdlVjUWdhZ0FOVGEv?=
 =?utf-8?B?VERPRmVWWlZFY2Y2Tm1pbHVHQ3RNT0tQZTdVQmYzVzJwVnZMZFBLR0ZrNlk5?=
 =?utf-8?B?M3hHQVdGQ3k3QXBsL29TRExoYVdBVkhXamowQ2hmY1VtT0tkOW9BNVM1N1dL?=
 =?utf-8?B?ak9XWU1aRWZsM2ZUSE9lS2NTQmNwa1ZQWjlqcitlQ21nZHRkUlR3SGp3VHI5?=
 =?utf-8?B?M3ZnRXFtMmVDVXBNbmYrbUJueExObDNvZlVvZXlYb0M4ekZYQmpodVIySGNU?=
 =?utf-8?B?RmgyUGpzRHpBQ2FMT21JTVVZNC8vVnZEV3Bqc2laSjJCRWNCOXhWanRESjI2?=
 =?utf-8?B?dlhBTWplSnhMSXM5Q3BYdjIwNG9vVk1xR1FTOFVlbDlwSGl5dE1yNzNITkpC?=
 =?utf-8?B?N0lsOGpLV21YQzNua2dkcDNQU0NwOERuWktpZmFLRDM3MzE5Q3M5NGZRZnpi?=
 =?utf-8?B?aXM3SUc4ZkNEQkJCMVVUa3NHOXpETTh3d3ZQSm5taXk4QzhCeVl3ZGFwNStX?=
 =?utf-8?B?OWppMDRIZ0t3SDY5aGJ0RE1BczN3VkVHelFDVk84RDJid1VYUWczZVJkbjdX?=
 =?utf-8?Q?UgfKLNouayUckhItTc6qCHMQG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdbdab4-d23e-4e40-71e3-08db052268c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 13:35:54.9416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQJtZ54SYjjtbVIU6Vy/9gfhEjv0K/rpvyPAU/zhOOoY7OgLq0hsfSFb/Ry4g5t9ezSpiwtExYPjLZDVrsaeVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9856
Received-SPF: pass client-ip=2a01:111:f400:fe16::716;
 envelope-from=den@virtuozzo.com;
 helo=EUR02-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/2/23 14:27, Fiona Ebner wrote:
> Am 02.02.23 um 12:34 schrieb Kevin Wolf:
>> Am 02.02.2023 um 11:19 hat Fiona Ebner geschrieben:
>>> Am 31.01.23 um 19:18 schrieb Denis V. Lunev:
>>>> Frankly speaking I would say that this switch could be considered
>>>> NOT QEMU job and we should just send a notification (event) for the
>>>> completion of the each iteration and management software should
>>>> take a decision to switch from async mode to the sync one.
>> My first thought was very similar. We should provide a building block
>> that just switches between the two modes and then the management tool
>> can decide what the right policy is.
>>
>> Adding a new event when the first iteration is done (I'm not sure if
>> there is much value in having it for later iterations) makes sense to
>> me if someone wants to use it. If we add it, let's not forget that
>> events can be lost and clients must be able to query the same
>> information, so we'd have to add it to query-jobs, too - which in turn
>> requires adding a job type specific struct to JobInfo first.
>>
> Well, Denis said 2 iterations might be better. But I'm fine with
> initially adding an event just for the first iteration, further ones can
> still be added later. Returning the number of completed iterations as
> part of the mirror-specific job info would anticipate that.
>

May be it would be better to have an event on each iteration + make 
available
iteration count over block status query.

Den

