Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF05538CD86
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 20:35:13 +0200 (CEST)
Received: from localhost ([::1]:54536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9zM-0004Rq-Gw
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 14:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9xO-00033S-6q; Fri, 21 May 2021 14:33:10 -0400
Received: from mail-eopbgr60120.outbound.protection.outlook.com
 ([40.107.6.120]:6406 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9xK-0003oB-CF; Fri, 21 May 2021 14:33:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg29tWFUGHqwRMAxQ3uNAJparhHi37A6oWsXQGvxtphKZgIn9F/twcIqhmtpjYejMkrLXopoD+ahx39FN7hZHILTh+6wFxLms8h0bBUc/wUNpdSAt4Uy5ZqDRoZT4c+JQGEkdCMm/O+fdO3m/vThs+15jTboW4ZbUSWFyYBup243K7reiwncHD2vDFdJMd+fvkdNFi4aCw/ziNqES7o7qgBDOxDVebAL9F+zQ3RQKFQ8B0jucDDReTtY16utHLma9htdsB3HkjNzUMzDU0ba6aEZ5vULALA+yBD6A3cjDGpAbZWQmt+FrFtxnifyZZDkG3CBGBp7y8HUdPCXqA/6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRo0aAmA0MCE+wtMnenComgJqeYEZ7cp1tmrwKwfD5k=;
 b=S8427bHT8Qk258ZTBmW5y0WkfDG7HGBYEQpQhVD3BdY5/94dHZ0dV+YSB4KSMWpX0fDUSbCpdYClkBJr7V3FS8jYMNronOz8qX3SdWiWOOskaFikz6lt7ZwvZKpJEsmacQjdmVPwRJwPfCQmRd4EB0EC0ExM/3+Abf0FabstsgcV5J+eyS9xYnaKfNlFMxebQPJC30Ty/SiRpg3irJnSu1MeVxlhHF12Tdlxp8a5DEzsvHy5CsPLAR6gTskWHlMoUc95jylCEa7j79ab4+VzxMvv8a5UP3PJy1ypIpkGk94iwRw2Sz+Zuj/WMRCg0ZBMo2HfLG/dlqU2YZWxn5vd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRo0aAmA0MCE+wtMnenComgJqeYEZ7cp1tmrwKwfD5k=;
 b=Dy/ZvpCdA/tPqB2bnJUTbc3MSV2Arpwq7lY12xDxHSxLb4zSaEHUdin+JyUR6nEBwWUnZPvUJpxJRIpbV3um+IN6bXwWQMaGKY36sXiHbnYf6t21osUY5Co/J8Yc7sG+s5eH85Rifa/PGmKtgafGWfgns0Hs5UVc0nb9ApzmWZM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Fri, 21 May
 2021 18:33:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 18:33:01 +0000
Subject: Re: Qemu block filter insertion/removal API
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>, yur@virtuozzo.com,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, armbru@redhat.com
References: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
 <YKT6D1jg4gYi8nZE@merkur.fritz.box>
 <a6435411-d4dd-29a0-02b7-d99e9b42597b@virtuozzo.com>
 <YKUMeq/EY+TyXZGk@merkur.fritz.box>
 <bf9b37fb-fa02-20f3-6642-4d2d578927f5@virtuozzo.com>
Message-ID: <afcb0aa4-a7e7-aea9-bf56-bd01b4d22857@virtuozzo.com>
Date: Fri, 21 May 2021 21:32:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <bf9b37fb-fa02-20f3-6642-4d2d578927f5@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Fri, 21 May 2021 18:33:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 669190bc-c57d-4c10-7ad6-08d91c86dd65
X-MS-TrafficTypeDiagnostic: AS8PR08MB6568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6568B9945214073C74179D31C1299@AS8PR08MB6568.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aFwtgHp3rZWj9wLHsqUkYSaI5ZTPw3OdAZthdWSHMJxPi+rFgVbIEvkd74bG2pdwOYjzcXLTj8hET7YqknrLQa5pMFttV5vjU1P8o3hh5QZIra8NXzzCb/TUqeR7RDbaP2/D9D9cQ5bd8b+z07K7iWydAUFxJA3QiE6OB0P/GUJCfUgWqwNo8YUzHI/mTo207TOfpueFZxWfefQEkKmFTYbOM3eq+Tho79DGMAJz07zDOPJuk3EAQmWI8gliIKC2aIqEH54z98pAL5WJCgffjWmrjlITSWbeW42ubMm8Auh0cEApxvE/Jsw2UteO/f3dkZaOiURgESyxGmEtxZWOGbn1B2XCHPU6TbkASZynldQh4zWHlV7uSIHINe2I8k/3NORYbheG7Ksk4D7JkzYBPub5guHfadkk2FqtXNxnTbpCYoKemNOKkIGoliBnkqkeVWUKHUi9+o9dkL7c1OTzTEcFydMDkLEA4c1J1b5p+CyXRCYGomDroKMADTnorEDNbNselSHT+j3Ry4fykzVWlwOy8Sh1sKo+9nEMrv4FL2hHR02KQ2ke3+fXq1LoXGsSVQHrHBtlEf5i+RBqfSV9TsEDemEtZIfhuOizlp7NJocK84i/27J7tVzCnLnqD/BHbo5yluzLPCKC6AF0XnSaHwynvLtX434y78g1S5irLhrqKcO57irbfAwLDEZGhRPQJ4Vr66vX74ELIgOvcNbCKPADVdBxzSiD9IRuaUYNWvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39840400004)(396003)(376002)(36756003)(86362001)(8676002)(8936002)(66946007)(31696002)(26005)(38100700002)(31686004)(6486002)(16526019)(2906002)(186003)(38350700002)(66556008)(4326008)(66476007)(5660300002)(16576012)(54906003)(478600001)(316002)(2616005)(83380400001)(6916009)(956004)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dURkTjM1L2dxa0JMcWZNWkJJK1grVUx1SDFnTEJXcXduZUltZFYvczI0S0FE?=
 =?utf-8?B?aUgwOXFJWkswUWxDZ0ltdWtyaGZDYlU0UDBscDQxaEd5NEdOWnQxMEZBOFow?=
 =?utf-8?B?alhOVEJrM3oranVlNVVXMW1nWlRsSGdYRGtCeHgzZ3EyL1MxTXQ1UFB1UHhY?=
 =?utf-8?B?MHQ5TERSNUZ1Y0JHUmo4cXpjOUJQNnQ3VjVOYjV0TElUWVlCSXJPSWtnR0lt?=
 =?utf-8?B?aWJIV3o0dURMa2VtYkIxTlhGdW1NWk5tSVdNODRnQm0zNnE4aUIva2lLSzZs?=
 =?utf-8?B?ZW1RNjlEdE10VWtnNXlKTnV6cVZmcE16RnNmVWtWanRzbTFsRVNXOFE0YjB2?=
 =?utf-8?B?Y3lyU1JZSTNTT2IrK3h6d1BCbjZTbGE3UHJFT1drL1hkZlBlYTRGK05jWjJL?=
 =?utf-8?B?TTlWTXBZeTZwUmZnbzRDTG1MclppVER6anA5TlEyVm1iM1hIa1c0dm1sbVNH?=
 =?utf-8?B?LytyYmpIVzRadlYvQ21KR3ZlS3FGZC9JNUNSVVhPMGRNOWt2ay93SDEzVXpy?=
 =?utf-8?B?MXE3Mk5iWC9EU2JkU1NYSEx1Z2UwSGZScUZnQXNpZXFnTWxERHczUUJTZlBo?=
 =?utf-8?B?bWVxb3E5RDY2SXVMU1hrNnlvcTh6R0IxQTdPdTlBd1RnK1hqa3IyKzFNbTQw?=
 =?utf-8?B?dkNoWVU0N3A0aStwTy9DUXZXdEgzRlAxY0ZGc1hmYkhzT0liL1BFbUJ4N2du?=
 =?utf-8?B?dGdwd3hENExhenV0bWxZUVZ0akNYem9wR3dVbXpkcllyQzBmck00UFQwdTFO?=
 =?utf-8?B?V25tRnhtSzYzNEFwZzB1MXJudFV3elo5MGZ2anUyd29XOVJZdzVNemoxaTY1?=
 =?utf-8?B?b212enk3T3dRWlpYamZUWWo3QWNOR3d4UXp4MHFPTHZvMUlOUEx0YVVUK0xY?=
 =?utf-8?B?S3paQy96M3YxSkVueHpTOHRLUmt3elppOGlmSUVjR1BlMzFjWGRBSzhTSzZ4?=
 =?utf-8?B?d1VJWlNOTlJFalB3YnJxYW54QXQ1SGxrWk9RSWlkdzgycDNUNGhBcFczeFpv?=
 =?utf-8?B?dkVpYXNWdjFsVGY3RFd5a05ZOTRTbjViSnVBQkVHMlFFY2N5cHZkcjNWZ3RH?=
 =?utf-8?B?UlkxY2hiL0N2VUtkT1JvNExPNG92M0tmcmZDdERCQWd5WkNkRXZNMDFubVdp?=
 =?utf-8?B?SzJOVHVhVk9JbFlsNmlPYzlwZGxWRmU3NXdzaVpKbkp5dFFXaTRmU05Zd1pX?=
 =?utf-8?B?K0QxZHJJWU84eHZ3VDNHdGdBUmc5NTEyUU9aQ1V6bnErN0ZLeFZyY3N1RG1V?=
 =?utf-8?B?TkloRWFVdzVRMXRvaVIvdDRFKytRWEZIbndIYUZxOEhydko0RWxoL0k3bEJS?=
 =?utf-8?B?SFhTVXlTdGlmQ1JCa0x6NktsdnNYMnQyQ2ZOMmlMbnhRRVhwRi80VUxBeGM3?=
 =?utf-8?B?SVVIa2VXYkNraCtCRWR1cS92L0R0SlVySk14VklLZFpTK040eXBwODU2RlhZ?=
 =?utf-8?B?dTdLK2wwekZOcEVKRWZXSVo1Ty9mblVlbkFZMjU3LyttbWxGOHFHVVNEai9V?=
 =?utf-8?B?Qmh6UEFXSVdvUll6TWI5bUhWR2tLVWF1YjVqeEdycG1Ed2REc3JCK000dzlj?=
 =?utf-8?B?QlZRS2x4WGpqOHp4QzRETkVkcms0eUw2S2s3MkZqclU3NzdOclU0U09ZTkIw?=
 =?utf-8?B?YUphT3NmdGxmZkREOHdBN295NytiRU5zUlJoZHl2cC9HQjR0bXNHU0tTdm1u?=
 =?utf-8?B?aW5DLzRSdUVvTFV4dkR1NVFxRTlTUXhBS3RnSWJKZVBoKzV3d3FLUWdwbk5U?=
 =?utf-8?Q?gSfICY/8j6Bj6bkO2IPMU0hsCRLFVYIrtTaeWrA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669190bc-c57d-4c10-7ad6-08d91c86dd65
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 18:33:01.6511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfIs/QC+vq1ovjIlFpHB0naocyROiXXQFiInc8r4w9Vi1ypma3+PcUWTJH1Xb3t93Km68zufitPKvAPgxRcQ7TnaH437UI5tBbCPoA8jmJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Received-SPF: pass client-ip=40.107.6.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

19.05.2021 17:14, Vladimir Sementsov-Ogievskiy wrote:
> 19.05.2021 16:02, Kevin Wolf wrote:
>> Am 19.05.2021 um 14:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> 19.05.2021 14:44, Kevin Wolf wrote:
>>>> Am 17.05.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>> Hi all!
>>>>>
>>>>> I'd like to be sure that we know where we are going to.
>>>>>
>>>>> In blockdev-era where qemu user is aware about block nodes, all nodes have good names and controlled by user we can efficiently use block filters.
>>>>>
>>>>> We already have some useful filters: copy-on-read, throttling, compress. In my parallel series I make backup-top filter public and useful without backup block jobs. But now filters could be inserted only together with opening their child. We can specify filters in qemu cmdline, or filter can take place in the block node chain created by blockdev-add.
>>>>>
>>>>> Still, it would be good to insert/remove filters on demand.
>>>>>
>>>>> Currently we are going to use x-blockdev-reopen for this. Still it can't be used to insert a filter above root node (as x-blockdev-reopen can change only block node options and their children). In my series "[PATCH 00/21] block: publish backup-top filter" I propose (as Kevin suggested) to modify qom-set, so that it can set drive option of running device. That's not difficult, but it means that we have different scenario of inserting/removing filters:
>>>>>
>>>>> 1. filter above root node X:
>>>>>
>>>>> inserting:
>>>>>
>>>>>     - do blockdev-add to add a filter (and specify X as its child)
>>>>>     - do qom-set to set new filter as a rood node instead of X
>>>>>
>>>>> removing
>>>>>
>>>>>     - do qom-set to make X a root node again
>>>>>     - do blockdev-del to drop a filter
>>>>>
>>>>> 2. filter between two block nodes P and X. (For example, X is a backing child of P)
>>>>>
>>>>> inserting
>>>>>
>>>>>     - do blockdev-add to add a filter (and specify X as its child)
>>>>>     - do blockdev-reopen to set P.backing = filter
>>>>>
>>>>> remvoing
>>>>>
>>>>>     - do blockdev-reopen to set P.backing = X
>>>>>     - do blockdev-del to drop a filter
>>>>>
>>>>>
>>>>> And, probably we'll want transaction support for all these things.
>>>>>
>>>>>
>>>>> Is it OK? Or do we need some kind of additional blockdev-replace command, that can replace one node by another, so in both cases we will do
>>>>>
>>>>> inserting:
>>>>>     - blockdev-add filter
>>>>>     - blockdev-replace (make all parents of X to point to the new filter instead (except for the filter itself of course)
>>>>>
>>>>> removing
>>>>>     - blockdev-replace (make all parante of filter to be parents of X instead)
>>>>>     - blockdev-del filter
>>>>>
>>>>> It's simple to implement, and it seems for me that it is simpler to use. Any thoughts?
>>>>
>>>> One reason I remember why we didn't decide to go this way in the many
>>>> "dynamic graph reconfiguration" discussions we had, is that it's not
>>>> generic enough to cover all cases. But I'm not sure if we ever
>>>> considered root nodes as a separate case. I acknowledge that having two
>>>> different interfaces is inconvenient, and integrating qom-set in a
>>>> transaction is rather unlikely to happen.
>>>>
>>>> The reason why it's not generic is that it restricts you to doing the
>>>> same thing for all parents. Imagine this:
>>>>
>>>>                       +- virtio-blk
>>>>                       |
>>>>       file <- qcow2 <-+
>>>>                       |
>>>>                       +- NBD export
>>>>
>>>> Now you want to throttle the NBD export so that it doesn't interfere
>>>> with your VM too much. With your simple blockdev-replace this isn't
>>>> possible. You would have to add the filter to both users or to none.
>>>>
>>>> In theory, blockdev-replace could take a list of the edges that should
>>>> be changed to the new node. The problem is that edges don't have names,
>>>> and even the parents don't necessarily have one (and if they do, they
>>>> are in separate namespaces, so a BlockBackend, a job and an export could
>>>> all have the same name), so finding a good way to refer to them in QMP
>>>> doesn't sound trivial.
>>>>
>>>
>>> Hm. I like the idea. And it seems feasible to me:
>>>
>>> Both export and block jobs works through BlockBackend.
>>>
>>> So, for block-jobs, we can add optional parameters like
>>> source-blk-name, and target-blk-name. If parameters specified, blk's
>>> will be named, and user will be able to do blockdev-replace.
>>
>> I'm not sure if giving them a name is a good idea. Wouldn't it make the
>> BlockBackend accessible for the user who could then make a device use
>> it?
>>
>>> For export it's a bit trickier: it would be strange to add separate
>>> argument for export blk, as export already has id. So, I'd do the
>>> following:
>>>
>>> 1. make blk named (with same name as the export itself) iff name does
>>>     not conflict with other blks
>>> 2. deprecate duplicating existing blk names by export name.
>>
>> Yes, if we decide that giving them a name is a good idea, it's possible,
>> but still a change that requires deprecation, as you say.
>>
>> The third one is devices (which is what I actually meant when I said
>> BlockBackend), which also have anonymous BlockBackends in the -blockdev
>> world. The same approach could work, but it would essentially mean
>> unifying the QOM and the block namespace, which sounds more likely to
>> produce conflicts than exports.
>>
>>> Then, blockdev-replace take a parents list, where parent is either
>>> node-name or blk name.
>>
>> Note that you need both a node-name and a child name to unambiguously
>> identify an edge.
>>
>> I guess you could do something like the following, it's just a bit
>> verbose:
>>
>> { 'enum': 'BlockEdgeParentType',
>>    'data': ['node', 'device', 'export', 'job'] }

Interesting that it intersects with @XDbgBlockGraphNodeType.. I'm looking at it, and see that BDS node is called "block-driver" not "block-node". That's because the idea was that we have block-graph, where all parents are included, therefore they are "nodes" as well.

>>
>> { 'struct': 'BlockEdgeNode',
>>    'data': { 'node-name': 'str', 'child-name': 'str' } }
>> { 'struct': 'BlockEdgeDevice', 'data': { 'qdev': 'str' } }
>> { 'struct': 'BlockEdgeExport', 'data': { 'id': 'str' } }
>> { 'struct': 'BlockEdgeJob',
>>    'data': { 'id': 'str',
>>              'role': '...some enum...?' } }
>>
>> { 'union': 'BlockEdge',
>>    'base': { 'parent-type': 'BlockEdgeParentType' },
>>    'discriminator': 'parent-type',
>>    'data': {
>>        'block-node': 'BlockEdgeNode',
>>        'device': 'BlockEdgeDevice',
>>        'export': 'BlockEdgeExport',
>>        'job': 'BlockEdgeJob'
>>    } }
>>
>> Maybe BlockEdgeJob (where the correct definition isn't obvious) is
>> actually unnecessary if we can make sure that jobs always go through
>> their filter instead of owning a BlockBackend. That's what they really
>> should be doing anyway.
>>
> 
> I still think that block jobs may operate without filter in some cases.. But the schema looks good, I'll try.
> 


Now I'm not sure is that a good idea. This forces user to handle different types of parents. So, user have to make an abstraction of block-parent, and handle all the types. Adding more types in future will lead to modifying this user logic..

What about the following compromise:

{ 'struct': 'GenericNode',
   'data': {
      'id': 'str',   # id maybe node-name or qdev-id or export-name or job-id
      '*type': 'BlockEdgeParentType'   # optional, may be omitted if @id is not ambigous
} }

{ 'struct': 'BlockEdge',
   'data': {
      'parent': 'GenericNode',
      '*name': 'str'  # optional, may be omitted if @parent has only one child (good for exports and block-devices)
} }


Then, if user of the interface cares to give different names to all generic nodes (jobs, block-nodes, devices and exports), he may use rather simple interface.

Then we can deprecate any duplication between qdev ids, node-names, job ids and export names.


-- 
Best regards,
Vladimir

