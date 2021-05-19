Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655BE388D3B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:50:31 +0200 (CEST)
Received: from localhost ([::1]:47304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKic-000695-GS
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljKhh-0005BG-Um; Wed, 19 May 2021 07:49:33 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:53472 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljKhe-0005Or-TO; Wed, 19 May 2021 07:49:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqJr/CAxtVzTq/AG3l8n55I2Y946N65VWXm1TGwhGhQilvnSpvC2MTy3kg/teqbg2ghaIwqQb6Sn/mVmHmgOn6JO7IH8uTi7/sTD/tc9Gwg3Ir0MkhZ3s5drSgTgLkXcO5hO3WTaEBnskz4U5FzQjtT0VKXZWswLhtYEcDO07XScghb2dAbInTGMxavQs9xLjtHpLAXrgSDFhOZJKz2CLq7EvfFXw2YmcGdZ+TrPIu9jMBcrgvCnYkNJxqdmRoHNYK61hqzvv7xpAKilLtRzG8NgYd/oDHxS7JYP8uLvh2y/Y5kHi/kC4ih6umxahWmTUQL6rdmm5x1dVomT99l7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW4f7vezi88mcSQIafQvJY8LsjPcARpsf6TuVkO35GM=;
 b=Eevp+0fPMD3XI6TRUtiZjQnQRvQQALk5Rzj5S5MeznfnJVigw9CRda+joos0G4DqQNNdpJs9m2Jk7XFvHKrhzMMplJvP7+NucpJFv5Z0T+htsH6w/wGzcvurYPCic95in8azpUxSsR1HNvy3f051Tu0OAFFnXRAWV4innyr5aOo1yRcb4XrgmUz5hrQyzqcz5X75v0PmYG+saSvRLsCIHl+FODTU71iNm7uHV/QjKB/Frwxqz1iZoLC/eH1Tf9Lq07UqN21TeghVwzItANiiKUh+/LLou1lTzUg3HXaY+HMazKOnF1kpfxD2kZk4vBrFl0plz9Rln2n+g6358ALjmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW4f7vezi88mcSQIafQvJY8LsjPcARpsf6TuVkO35GM=;
 b=mURmH1Nv1Y8NIkd8OQzgQEiayyi+BQvJv3i9PXuiBkHeQqJPXw8LQrcLTysEfAXa3SVdZ9JH4Ql40TcsB/KnHalnwrwyzkmeoufi2GtRULhjDJkKIut5fv6vrMEAiR+eYdGrzObht5WBw3kTdHVkR9gOc5du6QLNllStpiMjrZA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3862.eurprd08.prod.outlook.com (2603:10a6:20b:8c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 11:49:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 11:49:26 +0000
Subject: Re: RFC: Qemu backup interface plans
To: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 yur@virtuozzo.com, Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
 <eba2f2c5-a867-91bc-64ab-08dcd67a295d@redhat.com>
 <e3853894-ec71-bdd4-adea-b61fceee4ba5@virtuozzo.com>
 <YKT0Z8aCZiCpcysd@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b519b530-f268-59af-145e-6370004bdbdd@virtuozzo.com>
Date: Wed, 19 May 2021 14:49:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YKT0Z8aCZiCpcysd@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.218]
X-ClientProxiedBy: AM0PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.218) by
 AM0PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:208:3e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Wed, 19 May 2021 11:49:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 926538b4-33ee-4f80-2947-08d91abc2716
X-MS-TrafficTypeDiagnostic: AM6PR08MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3862C51D47673EC26BC6AACFC12B9@AM6PR08MB3862.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9taLL1yqEMfyqJz8wj5K8/zzU/CL48JtNR9HJyiQRL5kPj1nVUT9Zw985ZpOjoAPU46TsEBKDiMmLtBsC1plstiAV8ZFIuUIHBxJK6+/zkauXpV2Xx76ZHaezKRAVbN419fStl4UsLVmKpwTjJXOFW+PoRa5wFxSWM36weCngYPS81UVkDF5/vainjv2EOaSnEdkIVX3wz65926kEGbIU9iKoseV8/+YNUwXd+r2bHpFOx/mZKiTyIWJ6ktHyTrxFuu2MKgSYXPtYpf/HSSWoblSGufJ+5k6WWy3d4vHiwq3Ls5Ts/eZdZ+veaZiS8LzjAr7XQYn8bs8hWW99D9V4lr3s5CU6h13lIui3zd4aT1RAvMl3BQCw4ZDCI36uUjS/gga2NTy8eFfl2mp4ZV6QVdBIBPnyWKErAdhhdFjXi1Xlsx2OT4+M6pCZKBYUfHX2wIPvbwAZ6SNDtI57wTRbUAF7CQZG6RXMQ/a6PRXxPGCTAv9HQbCznFfnFV4ve9ydGhMqnUZr5VQmo9nxG/qfALBnKymE1r8wvYQmbQWuKFY4N4J8mUrR9FFb/wYerOxl+wrytOT71WU4WV2yilhU9lKf3PKS3FG+5rWjDUIY7lXfGecUyMkr2Y6KWJ6sX+2F9DzQx6aCN8qkU3pNgFTYavmIL+Kge1yBh+tIycLCLS7gIswMC88Krwu+MEbfEaODOmNdKsRBMaZFT4N3LKwOC995B4yibuQVtIpHjgP2/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(396003)(346002)(136003)(956004)(2616005)(316002)(2906002)(52116002)(478600001)(86362001)(54906003)(16576012)(8676002)(8936002)(31696002)(4326008)(6486002)(16526019)(186003)(66556008)(66946007)(66476007)(5660300002)(36756003)(38100700002)(83380400001)(38350700002)(26005)(6916009)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUdlWHVDRmcydTNVOENXQUJURy9SRWxlRVpzM0J6VVh2TU1aRVV4b0ZGL3Nj?=
 =?utf-8?B?N2t2d3lxS0pUdmw1NDdqSGV3NTdiNUpkUFhMRjdpZ1dFK0xpM3JDcDdYd3dC?=
 =?utf-8?B?Mkh3M2trNXFDcXJtT0tTUWtFVDltaFF1cCtEbGZrL01mRENJR2ttY0NVTkNo?=
 =?utf-8?B?NU1ZdlovQjk0N3R6YWhkZHdhUmxhb3hhNi9zamhDVkpkRGt6TUJYQWRNb1JV?=
 =?utf-8?B?cnJpQVA0eGxrMHVDOW1YbzhSOGJ1T20weGRFam5pQWkyaDJrOFZVdk9HUWVM?=
 =?utf-8?B?aExRODU2a215UFc0QitEeUF3bm1Ba2F0dVA1cTZ5TkMwWEZuNkRneU9mbHR5?=
 =?utf-8?B?NTVvT3U0dWhuakpxUGFGczdpZmFMTGtuOXp3NTJIVFpSd1ZIT1Nkd2JPSFg3?=
 =?utf-8?B?TzI0bVNoWWF6NDlWcTg1bFNLU0h1aXU1YmMvTG1WQnBzd3lLZmpuaTI2WDI3?=
 =?utf-8?B?aWFmbTNyMm9oVDlMSkcrSjUzcFpUZ1VPSlhmcG1VZm80QzdPU0J3QjduMnAr?=
 =?utf-8?B?Tjk2NEdhUW53Zm92WlJsNkdzOVIwL3lFZFNOaHlkVUpYcm5MWnRVNkhCWFNU?=
 =?utf-8?B?eWd0bWhrZmg2SkRIZUZkTTg0YkFESWRnRXVaZTBqNUZNN0RzVkM3dllkVm5J?=
 =?utf-8?B?S1VjcE5aVWNYNGlQYjEyTkJxNE9YVGI2WmowZm1WZ0dscHNvYks1WmlPb3pv?=
 =?utf-8?B?b29mU2Zsbm0yOVRjcnZxSk1zb0dObGtLdGMydnMvSWR2Z0dUZ2p4bDNrL2d2?=
 =?utf-8?B?elUzOTh0bktYZEZkb3J0aG1VZGFWQXhTU2xoYjBvZDhYWVkvd1Y0WVlFcEFY?=
 =?utf-8?B?L2s4WUNhUXBMcmNkdTdVYUQzaVBUR0VaQWJITmRxTU4yNHd0RHpyRCtsdC9u?=
 =?utf-8?B?eUg3VDlWbUZQckNBaUQ2TEExM25WS0N5cDBEWVQ2eVNXUEVWdmFpbGhzeVJo?=
 =?utf-8?B?L3g4TVJYN3N1ajhKVEFZdmoxVUZPZ0Z5WXNZK3dOYis1OUtjNHZXZGV4eFly?=
 =?utf-8?B?Q0tzcXdlZFk1ZWNxMGlDbUJtOXhtVzVaTjVHRUpCYTU4Z1RNOUZGMkZLVGxC?=
 =?utf-8?B?cVQ1TE02Y1dKRE0vcy9SYUVrUThjblp2VFA1MUV6NVJNVTcyWWZWZkJtQU1S?=
 =?utf-8?B?TndGRjVyUitVRFRXaEt6RExKcWV3RzkreWh6Z2FrME1HZGx1NnpCTVpLM2R6?=
 =?utf-8?B?QmJoUjdCV2lRQjhnMyttTW94SGRPdDdtRFQxU1FJSzlOQWJHMUk5bFhncFhv?=
 =?utf-8?B?aCt4STIwRDByLzIyQmxhblYyei9PT0ErZmN4V3dxYXZodDRKU2FpYk5yQ2ww?=
 =?utf-8?B?WXdkM3lzUEswUW5NbWhncmhFMi9VNE51MjhGbzArNk9PZ2pkQjdMT1YxSXpx?=
 =?utf-8?B?aDJ3RWJvUUZUVjdGZHRkbHU4MzhiU0tWdGZKUFlCc015b0tSV3lLWmErMTRM?=
 =?utf-8?B?Zmx1QkNBc0g3MFJFYVdQeDUyYkZja1ROVitPTTY1eVl2NmxSaC9tMkNRUkpF?=
 =?utf-8?B?ZlkrZU04SFJoZnVkdDhGK1hXN0dDcG9SYVNKRWNQRFNxZEVpZlpKMWRML3FD?=
 =?utf-8?B?V2tsNVdmUVFIUFhYbVZseElUTkFrVHNTMjd4SUFrNUpwMnpxNlUvRGp3Rzgy?=
 =?utf-8?B?UmZyaGtEMC90S2dGRUYycFNnYmtneGM4WTBndkFvSkY1N1JWNlNHYnBybmt5?=
 =?utf-8?B?Z1BFbWNRT0VubFMwU3p0V2RmYmVmN3ppbldtYVA3N3hqbWNROGJHcERPb1Jx?=
 =?utf-8?Q?MZMB0QlU/kno3QbCziojCcfFXv8WpAzztyxIRUU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 926538b4-33ee-4f80-2947-08d91abc2716
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 11:49:26.2867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WC0i15j+HgRYCnRG1ojeMlVkcg5L0NJuTHPbShu57bO+L3eogPTGCUMx1DcJVSbTGy8ZARC0+uOFyDL/IYCsMb8in5pBjMprz6ANKMs2Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3862
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

19.05.2021 14:20, Kevin Wolf wrote:
> Am 19.05.2021 um 08:11 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 2. Test, that we can start backup job with source = (target of
>>>> backup-top filter), so that we have "push backup with fleecing".
>>>> Make an option for backup to start without a filter, when we don't
>>>> need copy-before-write operations, to not create extra superfluous
>>>> filter.
>>>
>>> OK, so the backup job is not really a backup job, but just anything
>>> that copies data.
>>
>> Not quite. For backup without a filter we should protect source from
>> changing, by unsharing WRITE permission on it.
>>
>> I'll try to avoid adding an option. The logic should work like in
>> commit job: if there are current writers on source we create filter.
>> If there no writers, we just unshare writes and go without a filter.
>> And for this copy-before-write filter should be able to do
>> WRITE_UNCHANGED in case of fleecing.
> 
> If we ever get to the point where we would make a block-copy job visible
> to the user, I wouldn't copy the restrictions from the current jobs, but
> keep it really generic to cover all cases.
> 
> There is no way for the QMP command starting the job to know what the
> user is planning to do with the image in the future. Even if it's
> currently read-only, the user may want to add a writer later.
> 
> I think this means that we want to always add a filter node, and then
> possibly dynamically switch between modes if being read-only provides a
> significant advantage for the job.
> 
> Kevin
> 

Still, in push-backup-with-fleecing scheme we really don't need the second filter, so why to insert extra thing to block graph?

I see your point still, that user may want to add writer later. Still, I'd be surprised if such use-cases exist now.

What about the following:

add some source-mode tri-state parameter for backup:

auto: insert filter iff there are existing writers [default]
filtered: insert filter unconditionally
immutable: don't insert filter. will fail if there are existing writers, and creating writers during block-job would be impossible

-- 
Best regards,
Vladimir

