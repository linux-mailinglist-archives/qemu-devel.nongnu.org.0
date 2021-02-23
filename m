Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71094322D6E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:24:56 +0100 (CET)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZYV-0002x2-GF
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lEZWx-00017w-H2; Tue, 23 Feb 2021 10:23:19 -0500
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:48979 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lEZWr-0000x3-GX; Tue, 23 Feb 2021 10:23:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lhpqvi0fvWKPp4FEVGebmVEFtJFjvQa1tCk0z03c1Iewm12ffzHgbFo81WIMBiIQIM68BcH1U+3IVwrCWpwPPYeqg2MGgvAal93Xgb7sHG/XkjdYvbGDwlaqTPeEjzuuIVD1fKC6hNIRtO0UDXpYGn6aYfBx8iNSoBIjGR0QefZZqMF9mpX1gpPaa/DsJBX7O74b8+2fmFMpb8riepokQ6EZOjp48cN4kbAJfz3tvGSaSu/E9yJU5zToEv6p8nfkHyLSLGv0Kq0fXPRJym10ZBvr1Ln7JgIoHMlehFpVuyh3YV4R5GTCiups19Kub/I00TS7zrbCRtk2Wf3EAGg8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgCkxpneTsAsixV2M9ywu3AposhmMXrZ0yAsg4CKBLs=;
 b=mfQRZ3w8Z5B6J8gHcUKGOw80EaIUyPQZ5EBzQ8VOSHekGz0RKXw56Mr0iLCL6UyYRSMHp5UJpx44lYQDHSQkS4MHn/CNBEhapW5T6uLqzfIJqtKsAJf7TwMUeRErIGg/YKS6c9vbRTPhJFg244h+qs3FzX6uItPRIwlVKluhdRdXLaC29piIczdkAI7KhirVtTrTPW/KdTTQSaTj1BY33YklgtPdSgGPUePX6yDl1tJVgTfUYIUXlXd7MioN2MNM+8sFWgT05V3oiFrgpGxP3Sh+4YguMM321pp214xxc9l+K/XG/MzYYVnvAopTnxsDPoL1Gw+A/pvWa1Jy60hnNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgCkxpneTsAsixV2M9ywu3AposhmMXrZ0yAsg4CKBLs=;
 b=KmA+z5EtNxddbcQoWzfRnxunJJaQ3udHHvgmnu7OZvIaYEG/kppdQVcFh5Kx0WAztxxs4nH6DYiuVlXSRvYIRm1hM25lgrHvrTZPDhmVSaq8B1fQa9cAXMJKcqO0T9u3WbZDymLEbq4FbTeOntw2D62Hvxx1fKpE+0+eEZ2I1SE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Tue, 23 Feb
 2021 15:23:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Tue, 23 Feb 2021
 15:23:10 +0000
Subject: Re: What prevents discarding a cluster during rewrite?
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Eric Blake <eblake@redhat.com>
References: <198596cd-4867-3da5-cd8f-68c1c570a52b@virtuozzo.com>
 <21d6f4e3-1512-50b3-d2a0-7969a49f18bb@virtuozzo.com>
 <20210223103534.GD5083@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e7480b84-bda0-c280-603e-38ba176c44c9@virtuozzo.com>
Date: Tue, 23 Feb 2021 18:23:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210223103534.GD5083@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.77.0]
X-ClientProxiedBy: AM3PR04CA0129.eurprd04.prod.outlook.com (2603:10a6:207::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.211] (178.176.77.0) by
 AM3PR04CA0129.eurprd04.prod.outlook.com (2603:10a6:207::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 15:23:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c228d0f3-4488-44f9-ea92-08d8d80eed84
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334DF14F530A832745D7747C1809@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OCkaLzpvoUya1p7Yhrbn3GeIMLA2eeE1hVOIuKWrrtl8T5Ey/anbu6tbZJTSblsm2OqmhT7pptYnzuHAkoChtEgWeD8WFKTNCBt2hKKTsFVXz+snmbL9Oxu78zT/VaxAeoHxHDDzMR0vGuiMb+QZB7wMBZCgUeZkoA1mqicQbCRpSVIh9E8zf5c9JgN1Jw3Xeh4UnlBJUsakNTRq2PlFhz4xxRN7ehI5KgtQMdkWSg0nqSy2/xytmHi6paFN4uyA/OvsB1YeBhWflsusAC8kvcxYXS5o67x+vM3vIQ6/73q59utFT4LoFkywfnPyo0R6MD1y9LGJXVe3DaHrZQ/qHPswjAjPGydPIGF2K/fpJWBA/we+IYsmVW96d8teKBnnyJgDBOCJDslY+fZmaCJL7X4af1UREl0up3KEjIdXD+9PHCRsmFdtgw/6N2nK9+nxZ3W8u9dG0wvpndSCm++DNjv1cOuxIcdl0cIPDV/K8rlTE4uKB8shyqiEtpCh9RJAro/P2DJibGlrKz929/K4ZTTI+jy4uF2ayo/UNoY+1kScc6wlUXwK0rl/obMMrWu9EN6Mtb4hMlUw4tdB2vv8hgWmGGAfzuyc359Okvie3TM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39830400003)(376002)(478600001)(2906002)(4326008)(66946007)(956004)(2616005)(26005)(186003)(16526019)(6486002)(66556008)(6916009)(36756003)(66476007)(53546011)(16576012)(52116002)(316002)(54906003)(31696002)(83380400001)(8936002)(31686004)(8676002)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eHJpNStlOUkzMDlNUHJkTUpnVmwxZSsvT1NERUFCS1d5ajdjZXZRblNwRkEx?=
 =?utf-8?B?YkJtVCtmdFk2WUhxTFRQcUVDaFd4RS9RQ29kMm51VEtkUUN3VUw1SFBwdnBJ?=
 =?utf-8?B?UGJVaUZYMkMwZHVVOE1QZG5RTTBjNWdVbFpjY2ExYnA3cU1oSnh3RU9kZzha?=
 =?utf-8?B?S3BXUWdra0c4eVFiMUkyYTJJdTI4c0JqK0Z2azN2SW5US1B2cnQ3cmx3YUIv?=
 =?utf-8?B?NS9Md25scFdUUXhVRTczcVUyTGhQdklKVWdEWCthRlhnUmpzNjJvZEJMMjlk?=
 =?utf-8?B?bTNVZEpSWlYxM1NZaTBwZU1iZGNWY0dHUmRMNVZYNWRPdmMzdHM5ZHJpN1J0?=
 =?utf-8?B?NHZIbmJjNEUvUWlBR0d1bS9KKzZtaUg3bDEyTEFwMEpUVzRIQ0FJRjZrRnMy?=
 =?utf-8?B?VjMyeUlOZi9IM3dOYUh3WEdXVFRkcSthMjZxelhGN1BrNlNING5BWVM2M2F0?=
 =?utf-8?B?NG96UkpaWXROMVFiZmFPQm1vcFk4TE1oN2U1bFNlMnZzTzJQSWpIWVFwN1Ay?=
 =?utf-8?B?bzBWRTQzU0dkKy9QTk9EWEpKNE9sRDZ1WHlnendXSUg3SkUwK1EvcTlSL3Bo?=
 =?utf-8?B?V08yTEdWWThjVTNTUVkxbmlubFZQOFNGOG9Wb0Z2RWIva040OXhyRC9UYklV?=
 =?utf-8?B?K3MxWnFaRENMczFENmhFMGhLeWlaWHg1enZQY1FvblBCQU9wUFEyakJqZ3lP?=
 =?utf-8?B?NENjMisyMUxTY2FOUkhDMUhIaUsvN0pUQ3Y1eUI0Z2VwYnBoQkxReWw4bDRs?=
 =?utf-8?B?OGxPbEE1QnJ6OXB5REVSd1h6d1ZLUnVVSHdpOWJJVVNPRUZpS1I1Zm1PeUZK?=
 =?utf-8?B?c2NQcnJKNjFoMVZiZkJ4ajU2YndMZkdRWjVVTW5HRFpMMDNNbDVNYUJFendG?=
 =?utf-8?B?LzRJMlJybmR3TENodWQ5eWtJRFB0NkNET251dmZBRXFzL3pBaWJocjVqZEpN?=
 =?utf-8?B?TDVuVS9nWmlKbWFFWVpaUWpDMVZQNG5wTzRMWW92UWJLVkwvQURPSTFmMWx6?=
 =?utf-8?B?eHlENDFIS1ZtdHdYcEd2c0hpaGk2UysrTGM2TEU2aHU0QVRnQ0hOVk85TGdq?=
 =?utf-8?B?cExXZHpuSGdpcm1raFdreWpqb2VPUzA1UmNlSGlzNllZUEtOSkY4SzV3b0tR?=
 =?utf-8?B?cTYvNFkxNzBsbURsV3M0KzBTQWpkejhqVVkyalQ0N1p5R2Q2eXBZWS9tQzJT?=
 =?utf-8?B?eHlyNlp5cWRmTFFHSFNMN1NPbnFVZ0xCYUtHOGR2OEFydnhXWlBUdHVPSW9l?=
 =?utf-8?B?N2FhR09pN292am5FdEt6b0xDdFZKZEJQOVBJTmJjVG9NVlYwNDZqdVl2K2JW?=
 =?utf-8?B?dVE0cUs3YzlWdDFoNjZoV1pkYXlsQllIQldPek11VU5BRnB3VWU1WFB0cTRO?=
 =?utf-8?B?TzF6bFltbjBXdVBqbWdDd09SOXZmdEdTYjdXdWZTRkRmUkNYREE4bmE1MGZw?=
 =?utf-8?B?NUd1TFdyWGJRL0tGVGZ2dVFsNkJEUk5VcjdsbnNKMDJ3bDMxS3hZOGpjZlNX?=
 =?utf-8?B?eVlubWhuSytKeTAvaDFuTjF1ei9VNDFnaktONWMxbnhRM0JXNVBTWFZCS1Vk?=
 =?utf-8?B?MGVTOE1ZcHdBY1FvUWpndmEvU2xidTUvVVVCL1VUTjRNMnlULzlGMUlnaHh4?=
 =?utf-8?B?V3A4TERQcEQyTFpnUy9HNWxlYzJWakhjbTVSSkJQeWZ3Um50T053TGs3dk1E?=
 =?utf-8?B?eUZoVGd2ajJsSkNxblovNnZaOXRZdTNoTlFzL0orei9sajBPc08wbzJ5NG9N?=
 =?utf-8?Q?ZsPem6Jdsha1NA0YBfJokhTFoHHJYVKdhhJOaio?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c228d0f3-4488-44f9-ea92-08d8d80eed84
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:23:10.0481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUHFCwN5HOnpsChRQv5QwINJ0TN3kjde6uI3B4b0/+Qvcdhauzlh8Nk/WVhrcUs/peN9z09zO3EhAgvKfb88Af6PGfAgdcHHMJwydtfDowk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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



On 23.02.2021 13:35, Kevin Wolf wrote:
> Am 22.02.2021 um 22:42 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 23.02.2021 00:30, Vladimir Sementsov-Ogievskiy wrote:
>>> Thinking of how to prevent dereferencing to zero (and discard) of
>>> host cluster during flush of compressed cache (which I'm working on
>>> now), I have a question.. What prevents it for normal writes?
>>
>> I have no idea about why didn't it fail for years.. May be, I'm
>> missing something?
> 
> Ouch. I suppose the reason why we never ran into it is that afaik Linux
> drains the queue before sending discard requests.
> 
> Of course, we still need to protect against this in QEMU. We can't just
> unref a cluster that is still in use.
> 
>> I have idea of fixing: increase the refcount of host cluster before
>> write to data_file (it's important to increase refacount in same
>> s->lock critical section where we get host_offset) and dereference it
>> after write.. It should help. Any thoughts?
> 
> It would cause metadata updates for rewrites. I don't know whether the
> intermediate value would ever be written to disk, but at least we'd
> rewrite the same refcounts as before. I don't think we want that.
> 

Hmm, if that can provoke extra refcount cache flush that's bad..

May be we need something like of additional "dynamic" refcounts, so
that total_refcount = normal_refcount + dynamic_refcount.. And for
in-flight clusters dynamic_refcount is > 0. We can store dynamic
refcounts in GHashTable(cluster -> refcount).



> Discard requests might be rare enough that not considering the cluster
> at all could work. We could then take a reader CoRwlock during most
> operations, and a writer lock for discard.
> 
> Actually, maybe s->lock should be this CoRwlock, and instead of dropping
> it temporarily like we do now we would just upgrade and downgrade it as
> needed. Maybe this would allow finer grained locking in other places,
> too.

In this case many operations will be blocked during data writing, like 
allocation of another cluster.. That doesn't seem good. Separate 
CoRwLock looks more feasible.

--
Best regards,
Vladimir

