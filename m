Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE86300188
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:29:25 +0100 (CET)
Received: from localhost ([::1]:53106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ud2-00021e-U9
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2uah-0000fb-Ve; Fri, 22 Jan 2021 06:27:00 -0500
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:52483 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2uab-0008TX-Is; Fri, 22 Jan 2021 06:26:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GS2Hlw4Vv6sz+gCzk+/pwSYjf1MmwG1r+srzRAmRlTLLRfQ0pAUqa5Uybd+WAjLPCUCCcvB+rVOEyttL8cKqJG+CJLN1KXQ1GIGK+8egdFHTM/3oCA2fjg+vG3qQ7D8mieLeNQrkzaq7i5EWWMiJa+6PzsCaH5iWJxEi2sBekZ4Z+hVc+ho5Q1guUy0Y0wuo8opTwPk1awT5JGEaStM3BntZxvkGOTjzeDeoH4hOQNrwDIR2W9pU+f1hUw9Mn1sQM6icN1vAq+vQTYL5xDUmQvvfX+dLOfUHJqfPC7rTtPgonFft8M2idJ2BEByMKz5gIYt+6gZ2o52j1SFd29Ikaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgrfsOR2f+ShZBancNqAS7U+3dJasqRymyxHBeZklj4=;
 b=FPa3pZP+Uju/P+bnDRdLTagtBEPBbjEN2m1rlSpzLH9qoyT3ya+t1w1E87GNUuaHf3fMdc5oHqdpqHsmm/vkl/a44Jcz/vU2C8We9HCBUSParN6PQoO8Z+Uq/wjVwfbUUZVeieVZBEJKXCJdoD0NgNIXX4gg+FJu3kOVKlPvPi7dQ1HcfHTfbRboiA1uuAT5pnQiqqMhcgmG+bbwtK4Q04GYSzvTe0R7S6iJ2Ma3YoV4FSSkia+7+l0OSdjrypretDDdIR9vW94NDhRxy3quUCYykO0YWdMxKxNN6OTQg/nBw0hTnCDc6Ap16jQIlNpvZQy44/O574EKl+NejAjqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgrfsOR2f+ShZBancNqAS7U+3dJasqRymyxHBeZklj4=;
 b=KnTm6w7VIoqPjxgtMbXoVrYT7L4MnbVip8A9vG4QUnCDv9eliPeCsqRkRITCLfKtUqpD/rQWWwdYbBUZB5iKtqS/NEbunAaBgB/HOwXYYUk7ZMdPH9X7hSqlxP70qmNc6ovEtugX3mW7NZjbYrn4oldxsHRgo2uJBqcIclJy2GY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 11:26:45 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 11:26:45 +0000
Subject: Re: [PATCH v2 06/36] block: BdrvChildClass: add
 .get_parent_aio_context handler
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-7-vsementsov@virtuozzo.com>
 <20210118151336.GG11555@merkur.fritz.box>
 <9b7e051b-3a8b-f7cd-dc55-ee24add46677@virtuozzo.com>
 <20210119163805.GI5012@merkur.fritz.box>
 <fb41291e-45c3-31d6-3f56-5ef5c42feaf3@virtuozzo.com>
 <20210122111833.GA15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e06172f1-11af-6d7b-8230-0fdbe3ea8a31@virtuozzo.com>
Date: Fri, 22 Jan 2021 14:26:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122111833.GA15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR02CA0163.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::30) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR02CA0163.eurprd02.prod.outlook.com (2603:10a6:20b:28d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Fri, 22 Jan 2021 11:26:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4110384b-1df4-4515-b576-08d8bec899d3
X-MS-TrafficTypeDiagnostic: VI1PR08MB5503:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB55035275AC695356C19F78A1C1A00@VI1PR08MB5503.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FHEnVkPi9o2IPFu7055I/pUetSIJSpe4+FNnWQLjxTuny+RwpewBfb3fR217xYetzYxm1yvbsE9xq3u4rY2jRIH5eHBigu7Bpsk8QEc6az/peBJDQ5vQ5swMEZA8HzWvZQ3N4W4diGiD0eps51MKidrxprjFIsyITL3WnNYOSOpamjxGoBheatiQWb8+qOWSizu8eNIUCdqt6KFnZeLCoUApdhsX/K/+f3xVeEh8dRuzaQACHSPQVMGMYrQEpSd2Btm8iQCFgtaeJRtQ3gc99t2Va2p0d1ibUM+bUz8YXk2GIFdRlwBTARKhEXx99QCtQYT+8HWslC6v6Kz6lGPA+XpUbLBNsRAPwbpXR44xpgo7hLq2Ti7Yv+9yl1jQ8N5xU31Kms5b5NW3TOGWwLnbDxMMqpq97jzZ1YbdPQZx7JeN4CMqWncbtXXm+wC20d9ORVtGxecubDZn5kSHjiNrIKqBVAyTHpLiq0oCFSKtQGzJoA3YFbE/kesMCQSLrS9+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(136003)(366004)(396003)(8936002)(6486002)(6916009)(2616005)(36756003)(31696002)(8676002)(956004)(31686004)(186003)(16576012)(83380400001)(316002)(478600001)(16526019)(86362001)(52116002)(5660300002)(107886003)(66476007)(26005)(2906002)(66946007)(4326008)(66556008)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M05XaFJIb2NwWWE3cW51K2Z3SzVzR0Jobi9XMm5admQ3V1VhVDk5cDZaNWRm?=
 =?utf-8?B?MDBxMVRya0poaWlEUFhwejFpY3FlNWo3S2FST0VOcmx4MVBMK0Q2eWliRkdB?=
 =?utf-8?B?UTJDdDBnWUttQmZZbzVaa3VZTUxHbHIzUzNHOHp4R2IyYnJVdW9rMEF5LzFo?=
 =?utf-8?B?Ym5BeFAySE52azJqVXF1c3dEVEpsN1UxUy9FdGpBTlprQWcxMVVaK1RDK016?=
 =?utf-8?B?REVRc1l1bWttdGZJckZLWHg2K0hiOUh3K0FWcVFVZm4ycUhJNTJHT293UGpP?=
 =?utf-8?B?TjExcWpuazdEQ214QWtUOEd2Um96WHIxOEVlVmZQZ0hPOFp1SDRsd0VIb21V?=
 =?utf-8?B?V0FqTWF2SXBCZVFQcUFBU0VtY3MrZEVJTVZuZW9IUVgwanYrUWdObDJtdmpT?=
 =?utf-8?B?VU8yN0gwQVlEVVlUMDA1TVdnYlpLOW4vZnhKbHR4YS9kQTg2UFRBK0ZYd0lS?=
 =?utf-8?B?TmlwYlhhSGZsRVd1ai9CMEl4UlNhcVB2cGI5YkQrcTh3Rm1mR1ltdUJHNVJF?=
 =?utf-8?B?dElBajROa0RmN1dtbDkrL3RjNE44Yk9UZmtNZzRVR1labE1sVUtJVmkzczZN?=
 =?utf-8?B?YkU5YmdRUXZsQXE3OStxdW1lQllCbnRtcDRnbHVNTUNBeTV3eWFad3BzWk5D?=
 =?utf-8?B?Qi9mNTUrcktSOGoxSFF6VVVtVmZHSlJFUXJ3ZDlUc2xKbzFrTnBPYWc5MlEx?=
 =?utf-8?B?ZTgyR1B6dERSTi9KeEJZVlAxdGM0S1ZtczZNbmJISXdWY3VUd243STV0Wm5z?=
 =?utf-8?B?SFpzYVFva1VEbUgzaExWUlRCaURib3pKbGdDekZ4d2YrczZsWDdZUHZFci9K?=
 =?utf-8?B?VGxadFpyZDh4UjFMNy8zL0VYUFBHbDlTT0JVK3VvR0xkTW9ZcWNqUE1lWmpR?=
 =?utf-8?B?azEvNk5sMU1rVE1wb3hVU1QvM1I3emtTWDlJeDUzdXJ6RDRWcFNKYTBUcXlt?=
 =?utf-8?B?YVdLNzYyUGg2Mklycnpmd2xFNUxKc0VkTWgrWkpkWHAycVdRbnJTUlEyLzdu?=
 =?utf-8?B?Q2N1V0IwOFFxQ25jaXE2WEJBU3haSUZTbm01ano4VUs4Zk5uK2p2WGZOdkZp?=
 =?utf-8?B?eU84SDcvUmJhL2xKbFVBTjB2N1RWYmhITHZ2Tm5jbTkyVUxIeXkwcmFCdXRh?=
 =?utf-8?B?K0ZFcGJvNFdxRjJjVzlUSVdQRkxoN05FYWhaekt6OVk4azRBU05GUlRhekpt?=
 =?utf-8?B?OFZGaDlULzAwRlpmcXlJK3JBVUxDK3IvSU5yT3lmTmE4d1pSc3Zpc3Bld2RM?=
 =?utf-8?B?UGMrb2xuYlRkQUFTYlhDVCs3NTYxS2tmeTlGRjcxaUtjUEZ2YVlOSWxQSDRM?=
 =?utf-8?B?dmFxQVZqTUU0eGMxTGtiL2w2RTFOVk5WWWQ1aU95Uk5sYmJmRnZ5bEZMaklq?=
 =?utf-8?B?dUVhK2pBQU1HMUtwMmxTR204Q0RDVGVsc1crUWVxRXFEQzU0ZHJ4M29RWUto?=
 =?utf-8?B?bmhWMUROUnZ0ODBNSDFOTUVyU2dOTUw3MEh2WGNRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4110384b-1df4-4515-b576-08d8bec899d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 11:26:45.7804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbxZfMh+mrl4NsZ9i0NEXpZ9yXARoura4Fg7mWbIuLDp/1CGsrGZH/nIdC/EfIE9S9uMCQ0ComRp2dHh8+6wljKkB1LCCBdEfFQWr6jEM+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5503
Received-SPF: pass client-ip=40.107.7.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 14:18, Kevin Wolf wrote:
> Am 22.01.2021 um 12:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 19.01.2021 19:38, Kevin Wolf wrote:
>>> Am 18.01.2021 um 18:36 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 18.01.2021 18:13, Kevin Wolf wrote:
>>>>> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>> Add new handler to get aio context and implement it in all child
>>>>>> classes. Add corresponding public interface to be used soon.
>>>>>>
>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>>
>>>>> Hm, are you going to introduce cases where parent and child context
>>>>> don't match, or why is this a useful function?
>>>>>
>>>>> Even if so, I feel it shouldn't be any of the child's business what
>>>>> AioContext the parent uses.
>>>>>
>>>>> Well, maybe the rest of the series will answer this.
>>>>
>>>> It's for the following patch, to not pass parent (as opaque) with it's
>>>> class, and with its ctx in separate. Just to simplify the interface of
>>>> the function, we are going to work with a lot.
>>>
>>> In a way, the result is nicer because we already assume that ctx is the
>>> parent context when we move things to different AioContexts. So it's
>>> more consistent to just directly take it from the parent.
>>>
>>> At the same time, it also complicates things a bit because now we need a
>>> defined state in the middle of an operation that adds, removes or
>>> replaces a child.
>>>
>>> I guess I still to make more progress in the review of this series until
>>> I see how you're using the interface.
>>>
>>>> Hm. I'll take this opportunity to say, that the terminology that calls
>>>> graph edge "BdrvChild" always leads to the mess between parents and
>>>> children.. "child_class" is a class of parent.. list of parents is
>>>> list of children... It all would be a lot simpler to understand if
>>>> BdrvChild was BdrvEdge or something like this.
>>>
>>> Yeah, that would probably be clearer now that we actually use it to
>>> work with both ends of the edge. And BdrvNode instead of
>>> BlockDriverState, I guess.
>>
>> Do you think, we can just rename them? Or it would be too painful for developers,
>> who get used to current names? I can make patches
> 
> I think getting used to new names wouldn't be too bad. I would be more
> afraid of the merge conflicts.
> 
> Not sure, but it might in the category that we would do it differently
> if we were starting over, but maybe not worth changing now.
> 

Hmm yes, such rename will add a year of uncomfortable patch backporting..


-- 
Best regards,
Vladimir

